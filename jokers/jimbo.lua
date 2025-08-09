SMODS.Joker{ --the legend
    key = "jimbo",
    config = {
        extra = {
            mult = 4,
            Xmult = 4,
            emult = 4
        }
    },
    loc_txt = {
        ['name'] = 'the legend',
        ['text'] = {
            [1] = '{E:1}{C:dark_edition}THE ONE AND ONLY JOKER{}',
            [2] = '{C:red}+4{} Mult',
            [3] = '{X:red,C:white}X4{} Mult',
            [4] = '{C:dark_edition}^4{} Mult'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    cost = 5,
    rarity = "cokelatr_mythical",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 7
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        Xmult = card.ability.extra.Xmult,
                        extra = {
                            e_mult = card.ability.extra.emult,
                            colour = G.C.DARK_EDITION
                        }
                        }
                }
        end
    end
}