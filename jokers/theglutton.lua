SMODS.Joker{ --The Glutton
    name = "The Glutton",
    key = "theglutton",
    config = {
        extra = {
            THECLUB = 3
        }
    },
    loc_txt = {
        ['name'] = 'The Glutton',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult per scored  {C:clubs}Club{} card.',
            [2] = 'Multiplies {C:red}+Mult{} value by {X:attention,C:white}X1.1 {} every',
            [3] = '{C:attention}scored{} {C:clubs}Club{} card'
        }
    },
    pos = {
        x = 1,
        y = 7
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 7
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.THECLUB}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_suit("Clubs") then
                card.ability.extra.THECLUB = (card.ability.extra.THECLUB) * 1.1
                return {
                    message = "CLUBBED!",
                    extra = {
                        mult = card.ability.extra.THECLUB
                        }
                }
            end
        end
    end
}