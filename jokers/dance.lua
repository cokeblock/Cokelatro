SMODS.Joker{ --A dance of Chips and Mult
    key = "dance",
    config = {
        extra = {
            ice = 1,
            Mult = 1,
            scale = 1.5,
            rotation = 4,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'A dance of Chips and Mult',
        ['text'] = {
            [1] = 'gains {X:blue,C:white}X0.1{}{} Chips when a {C:attention}card{} is {C:attention}scored{}',
            [2] = 'Gains {C:red}{X:red,C:white}X0.5{} Mult {C:attention}every{} hand',
            [3] = '(currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips{} {C:inactive}and{} {X:red,C:white}X#2#{}{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ice, card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
                card.ability.extra.ice = (card.ability.extra.ice) + 0.1
                local target_card = context.other_card
                return {
                    message = "CHIPS!",
                    extra = {
                        func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                        colour = G.C.WHITE
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
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