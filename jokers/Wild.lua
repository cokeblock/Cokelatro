SMODS.Joker{ --Wild Joker
    name = "Wild Joker",
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
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}