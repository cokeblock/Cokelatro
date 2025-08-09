SMODS.Joker{ --Tuff Joker
    key = "tuffjoker",
    config = {
        extra = {
            chance = 0,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tuff Joker',
        ['text'] = {
            [1] = 'When{C:green} probabilities{} {C:hearts}fail{}',
            [2] = '{C:attention}all{} {C:green}probabilities{} increase by {C:attention}0.05{}',
            [3] = '{C:inactive}(current increase: {}{C:uncommon}#1#{}{C:inactive}){}'
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chance}}
    end,

    calculate = function(self, card, context)
        if context.pseudorandom_result  and not context.blueprint then
            if not context.result then
                return {
                    func = function()
                    card.ability.extra.chance = (card.ability.extra.chance) + 0.05
                    return true
                end,
                    message = "CHANCE!"
                }
            end
        end
          if context.mod_probability and not context.blueprint then
          local numerator, denominator = context.numerator, context.denominator
                  numerator = numerator + card.ability.extra.chance
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}