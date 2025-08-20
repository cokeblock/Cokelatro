SMODS.Joker{ --Balancing act
    key = "balance",
    config = {
        extra = {
            Balance = 1
        }
    },
    loc_txt = {
        ['name'] = 'Balancing act',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X1{} Mult at end of shop',
            [2] = 'Resets at {X:red,C:white}X10{} Mult',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Balance}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  and not context.blueprint then
            if (card.ability.extra.Balance or 0) < 10 then
                return {
                    func = function()
                    card.ability.extra.Balance = (card.ability.extra.Balance) + 1
                    return true
                end,
                    message = "X1 MULT!"
                }
            elseif (card.ability.extra.Balance or 0) >= 10 then
                return {
                    func = function()
                    card.ability.extra.Balance = 1
                    return true
                end,
                    message = "RESET!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Balance
                }
        end
    end
}