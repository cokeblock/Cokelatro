SMODS.Joker{ --Fancy spade
    key = "spadestyle",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fancy spade',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all scored',
            [2] = 'cards with {C:attention}Spade{} suit'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "AGAIN!"
                }
            end
        end
    end
}