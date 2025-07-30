SMODS.Joker{ --Fancy heart
    name = "Fancy heart",
    key = "heartstyle",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fancy heart',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all scored',
            [2] = 'cards with {C:hearts}Heart{} suit'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "AGAIN!"
                }
            end
        end
    end
}