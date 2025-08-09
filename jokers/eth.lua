SMODS.Joker{ --Ethereal joker
    key = "eth",
    config = {
        extra = {
            ethereal = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ethereal joker',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X1{} Mult when',
            [2] = 'an {C:purple,E:1}Ethereal{} card is used',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ethereal}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and (context.consumeable.ability.set == 'ether' or context.consumeable.ability.set == 'ether') then
                return {
                    func = function()
                    card.ability.extra.ethereal = (card.ability.extra.ethereal) + 1
                    return true
                end,
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.ethereal
                }
        end
    end
}