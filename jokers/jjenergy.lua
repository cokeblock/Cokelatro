SMODS.Joker{ --JJ energy
    key = "jjenergy",
    config = {
        extra = {
            Hands = 0,
            Xmultvar = 1,
            Pmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'JJ energy',
        ['text'] = {
            [1] = 'gains {X:red,C:white}X0.20{} Mult per hand played.',
            [2] = 'transitions to{C:dark_edition,E:1} ^mult{} after 100 hands',
            [3] = '{C:inactive}(curently {}{X:red,C:white}X#2#{}{C:inactive}/{}{C:dark_edition,E:1}^#3#{}{C:inactive} Mult){}',
            [4] = '{C:inactive}(currently{} {C:attention}#1#{}{C:inactive}/100 hands){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    cost = 40,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Hands, card.ability.extra.Xmultvar, card.ability.extra.Pmultvar}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.Hands or 0) <= 100 then
                card.ability.extra.Hands = (card.ability.extra.Hands) + 1
                card.ability.extra.Xmultvar = (card.ability.extra.Xmultvar) + 0.2
                return {
                    message = "+1 hand!",
                    extra = {
                        Xmult = card.ability.extra.Xmultvar
                        }
                }
            elseif (card.ability.extra.Hands or 0) >= 100 then
                card.ability.extra.Pmultvar = (card.ability.extra.Pmultvar) + 0.2
                return {
                    e_mult = card.ability.extra.Pmultvar
                }
            end
        end
    end
}