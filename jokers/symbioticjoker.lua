SMODS.Joker{ --Symbiotic Joker
    name = "Symbiotic Joker",
    key = "symbioticjoker",
    config = {
        extra = {
            Absorbed = 1
        }
    },
    loc_txt = {
        ['name'] = 'Symbiotic Joker',
        ['text'] = {
            [1] = 'When a {C:attention}card{} is sold, gain {X:red,C:white}X0.2{} Mult',
            [2] = 'Per {C:money}Dollar{} of sell value',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X#1# {} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 9,
        y = 7
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Absorbed}}
    end,

    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.Absorbed = (card.ability.extra.Absorbed) + 0.2
                    return true
                end
                }
        end
    end
}