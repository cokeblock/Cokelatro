SMODS.Joker{ --Hysterical Joker
    name = "Hysterical Joker",
    key = "funny",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hysterical Joker',
        ['text'] = {
            [1] = '{C:red}+40{} Mult if played hand',
            [2] = 'contains {C:attention}Flush Five{}'
        }
    },
    pos = {
        x = 5,
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