SMODS.Joker{ --The Greed
    key = "thegreed",
    config = {
        extra = {
            deee = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Greed',
        ['text'] = {
            [1] = '{C:diamonds}Diamond{} cards give {C:money}+#1#{} Dollars when {C:attention}scored{}',
            [2] = '{X:red,C:white}Multiplies{} amount by {X:attention,C:white}X1.05{} per scored {C:diamonds}Diamond{} card'
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    cost = 20,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 7
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.deee}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Diamonds") then
                local deee_value = card.ability.extra.deee
                card.ability.extra.deee = (card.ability.extra.deee) * 1.05
                return {
                    dollars = deee_value,
                    extra = {
                        message = "GREEDY!",
                        colour = G.C.MULT
                        }
                }
            end
        end
    end
}