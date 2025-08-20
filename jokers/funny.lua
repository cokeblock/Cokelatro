SMODS.Joker{ --Hysterical Joker
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
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Five of a Kind"]) then
            end
        end
    end
}