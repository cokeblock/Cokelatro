SMODS.Joker{ --the legend
    name = "the legend",
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
        x = 4,
        y = 0
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 0
    },

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
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