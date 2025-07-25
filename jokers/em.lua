SMODS.Joker{ --Fast Rapper
    name = "Fast Rapper",
    key = "em",
    config = {
        extra = {
            murderedby = 1
        }
    },
    loc_txt = {
        ['name'] = 'Fast Rapper',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.75{} Mult when',
            [2] = 'a card is {C:attention}destroyed{}',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 1,
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
        return {vars = {card.ability.extra.murderedby}}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.murderedby = (card.ability.extra.murderedby) + 0.75
                    return true
                end,
                    message = "MURDERED!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.murderedby
                }
        end
    end
}