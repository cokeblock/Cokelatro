SMODS.Joker{ --A dance of Chips and Mult
    name = "A dance of Chips and Mult",
    key = "dance",
    config = {
        extra = {
            ice = 1,
            Mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'A dance of Chips and Mult',
        ['text'] = {
            [1] = 'gains {X:blue,C:white}X0.1{}{} Chips when a {C:attention}card{} is {C:attention}scored{}',
            [2] = 'Gains {C:red}{X:red,C:white}X0.5{} Mult {C:attention}every{} time this joker applies {X:blue,C:white}XChips{}/{X:red,C:white}XMult{}',
            [3] = '{C:inactive}(currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips{} {C:inactive}and{} {X:red,C:white}X#2#{}{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 5,
        y = 5
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ice, card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                card.ability.extra.ice = (card.ability.extra.ice) + 0.1
                return {
                    message = "CHIPS!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                card.ability.extra.Mult = (card.ability.extra.Mult) + 0.5
                return {
                    message = "MULT!",
                    extra = {
                        x_chips = card.ability.extra.ice,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = card.ability.extra.Mult
                        }
                        }
                }
        end
    end
}