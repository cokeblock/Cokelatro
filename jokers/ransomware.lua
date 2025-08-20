SMODS.Joker{ --Ransomware
    key = "ransomware",
    config = {
        extra = {
            MoneyX = 2,
            dollars3 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ransomware',
        ['text'] = {
            [1] = 'Gain {C:money}#1# Dollars{} at end of round.',
            [2] = 'if {C:money}money{} is {X:money,C:white}0{} Multiply payout by {X:red,C:white}X2{}',
            [3] = 'at {X:money,C:white}100{} {C:money}Dollars{}, Multiplys it by {X:red,C:white}X4{}{} instead',
            [4] = '{C:inactive,E:1}(if money is not either, set money to 0 at end of shop)'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.MoneyX}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.GAME.dollars == to_big(0) then
                return {
                    func = function()
                    card.ability.extra.MoneyX = (card.ability.extra.MoneyX) * 2
                    return true
                end,
                    message = "PUMPED!",
                    extra = {
                        dollars = card.ability.extra.MoneyX,
                        colour = G.C.MONEY
                        }
                }
            elseif G.GAME.dollars == to_big(100) then
                return {
                    func = function()
                    card.ability.extra.MoneyX = (card.ability.extra.MoneyX) * 4
                    return true
                end,
                    message = "PUMPED!",
                    extra = {
                        dollars = card.ability.extra.MoneyX,
                        colour = G.C.MONEY
                        }
                }
            end
        end
        if context.ending_shop  and not context.blueprint then
            if (G.GAME.dollars ~= to_big(0) and G.GAME.dollars ~= to_big(100)) then
                return {
                    func = function()
                    local target_amount = card.ability.extra.dollars3
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "SCAMMED!", colour = G.C.MONEY})
                    return true
                end
                }
            end
        end
    end
}