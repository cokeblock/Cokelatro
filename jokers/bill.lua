SMODS.Joker{ --Bill cipher
    name = "Bill cipher",
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
            [1] = '{X:red,C:white}X3{}{C:dark_edition}^3{} Mult'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 50,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
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