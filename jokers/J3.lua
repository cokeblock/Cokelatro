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
    cost = 15,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_J3') --Please-work
        return {vars = {card.ability.extra.emult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_01ec05fa', 1, card.ability.extra.odds, 'j_cokelatr_J3') then
                      SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "HAHAHA", colour = G.C.DARK_EDITION})
                  end
            end
        end
    end
}