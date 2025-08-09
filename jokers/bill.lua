SMODS.Joker{ --Bill cipher
    key = "bill",
    config = {
        extra = {
            Xmult = 3,
            emult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Bill cipher',
        ['text'] = {
            [1] = '{X:red,C:white}X3{}{C:dark_edition}^3{} Mult',
            [2] = ''
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 50,
    rarity = "cokelatr_mythical",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 0
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        e_mult = card.ability.extra.emult,
                            message = "TRIANGLES!",
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}