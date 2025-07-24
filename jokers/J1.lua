SMODS.Joker{ --Journal 1
    name = "Journal 1",
    key = "J1",
    config = {
        extra = {
            mult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Journal 1',
        ['text'] = {
            [1] = '{C:red}+6{} Mult',
            [2] = '{E:1}{C:gold}the process has begun{}.{}'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        message = "HAHAHA",
                        colour = G.C.YELLOW
                        }
                }
        end
    end
}