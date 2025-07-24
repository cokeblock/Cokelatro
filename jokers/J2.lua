SMODS.Joker{ --Journal 2
    name = "Journal 2",
    key = "J2",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Journal 2',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult',
            [2] = '{C:gold}we\'ll, meet again!',
            [3] = '{C:gold}dont know where, dont know when!{}'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}