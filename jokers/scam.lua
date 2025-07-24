SMODS.Joker{ --Crypto Scam
    name = "Crypto Scam",
    key = "scam",
    config = {
        extra = {
            MoneyX = 2,
            dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Crypto Scam',
        ['text'] = {
            [1] = 'Gain {C:money}#1# Dollars{} at end of round.',
            [2] = 'if {C:money}money{} is {X:money,C:white}0{} Multiply payout by {X:red,C:white}X2{}',
            [3] = 'at {X:money,C:white}100{} {C:money}Dollars{}, Multiplys it by {X:red,C:white}X4{}{} instead',
            [4] = '{C:inactive,E:1}(when blind selected, if money is not 100 or 0',
            [5] = 'this joker destroys itself and sets money to 0){}'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.MoneyX}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.dollars == 0 then
                return {
                    func = function()
                    card.ability.extra.MoneyX = (card.ability.extra.MoneyX) * 2
                    return true
                end,
                    message = "PUMPED!"
                }
            elseif G.GAME.dollars == 100 then
                return {
                    func = function()
                    card.ability.extra.MoneyX = (card.ability.extra.MoneyX) * 4
                    return true
                end,
                    message = "PUMPED!"
                }
            end
        end
        if context.setting_blind and not context.blueprint then
            if (G.GAME.dollars ~= 0 and G.GAME.dollars ~= 100) then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "DUMPED!",
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}