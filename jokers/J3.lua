SMODS.Joker{ --Journal 3
    key = "J3",
    config = {
        extra = {
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Journal 3',
        ['text'] = {
            [1] = '{C:dark_edition}^1.5{} Mult',
            [2] = '{C:gold}good ol 6 fingers!{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    cost = 15,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.emult,
                    message = "HAHAHA"
                }
        end
    end
}