SMODS.Joker{ --Serial Designation /J
    name = "Serial Designation /J",
    key = "jj",
    config = {
        extra = {
            Spect = 1,
            spectralcardsused = 1
        }
    },
    loc_txt = {
        ['name'] = 'Serial Designation /J',
        ['text'] = {
            [1] = '{X:red,C:white}X0.2{} Mult per {C:spectral}spectral{}',
            [2] = 'card used this run',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Spect}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.spectralcardsused + ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)) * 1.2
                }
        end
    end
}