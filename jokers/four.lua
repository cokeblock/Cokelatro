SMODS.Joker{ --Insane Joker
    name = "Insane Joker",
    key = "four",
    config = {
        extra = {
            mult = 16
        }
    },
    loc_txt = {
        ['name'] = 'Insane Joker',
        ['text'] = {
            [1] = '{C:red}+16{} Mult if played hand',
            [2] = 'contains {C:attention}four of a kind{}'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 4,
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
            if next(context.poker_hands["Four of a Kind"]) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}