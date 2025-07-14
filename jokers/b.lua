SMODS.Joker{ --B
    name = "B",
    key = "b",
    config = {
        extra = {
            odds = 6,
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'B',
        ['text'] = {
            [1] = 'Each {C:orange}King{} held in hand has a',
            [2] = '{C:green}#1# in #2#{} chance to give {X:red,C:white}X1.5{} Mult'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            if true then
                if pseudorandom('group_0_0d5045ff') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                    end
            end
        end
    end
}