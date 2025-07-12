SMODS.Joker{ --Journal 3
    name = "Journal 3",
    key = "J3",
    config = {
        extra = {
            odds = 2,
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Journal 3',
        ['text'] = {
            [1] = '{C:green}#1# in #2# chance{} for {C:dark_edition}^1.5{} Mult',
            [2] = '{C:gold}good ol 6 fingers!{}'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                if pseudorandom('group_0_01ec05fa') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "HAHAHA", colour = G.C.DARK_EDITION})
                    end
        end
    end
}