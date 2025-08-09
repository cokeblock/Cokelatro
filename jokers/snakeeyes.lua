SMODS.Joker{ --Snake Eyes
    key = "snakeeyes",
    config = {
        extra = {
            Snek = 0,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Snake Eyes',
        ['text'] = {
            [1] = '{C:green}Probabilities{} {C:attention}scale{} by {C:green}0.5 chance{}',
            [2] = 'at the {C:attention}end{} of every{C:attention} round{}',
            [3] = '{C:inactive}(current {}{C:green}chance {}{C:inactive}Bonus: {}{C:green}#1#{}{C:inactive}){}'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    cost = 20,
    rarity = "cokelatr_incredulous",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Snek}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.Snek = (card.ability.extra.Snek) + 0.5
                    return true
                end,
                    message = "Chances increased!"
                }
        end
          if context.mod_probability and not context.blueprint then
          local numerator, denominator = context.numerator, context.denominator
                  numerator = numerator + card.ability.extra.Snek
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}