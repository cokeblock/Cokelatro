SMODS.Joker{ --Wild Joker
    key = "Wild",
    config = {
        extra = {
            Xmult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Wild Joker',
        ['text'] = {
            [1] = '{C:attention}Wild{} cards each give',
            [2] = '{X:red,C:white}X1.2{}{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 9
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}