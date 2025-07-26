SMODS.Joker{ --Stats
    name = "Stats",
    key = "stat",
    config = {
        extra = {
            Xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stats',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}X0.2{} Mult',
            [2] = 'per {C:attention}booster pack{} opened',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 3,
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
        return {vars = {card.ability.extra.Xmultvar}}
    end,

    calculate = function(self, card, context)
        if context.open_booster and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.Xmultvar = (card.ability.extra.Xmultvar) + 0.2
                    return true
                end,
                    message = "STATS BOOSTED!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmultvar
                }
        end
    end
}