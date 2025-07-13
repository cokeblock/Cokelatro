SMODS.Joker{ --Fancy club
    name = "Fancy club",
    key = "clubstyle",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fancy club',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all scored',
            [2] = 'cards with {C:clubs}Club{} suit'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:is_suit("Clubs") then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "AGAIN!"
                }
            end
        end
    end
}