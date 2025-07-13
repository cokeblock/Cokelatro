SMODS.Joker{ --Deranged Joker
    name = "Deranged Joker",
    key = "five",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Deranged Joker',
        ['text'] = {
            [1] = '{C:red}+32{} Mult if played',
            [2] = 'hand contains {C:attention}Five of a Kind{}'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Five of a Kind"]) then
            end
        end
    end
}