SMODS.Joker{ --MACHINEID V1
    name = "MACHINEID V1",
    key = "v1",
    config = {
        extra = {
            coins = 1
        }
    },
    loc_txt = {
        ['name'] = 'MACHINEID V1',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.2{} Mult per scored card',
            [2] = 'if played hand contains exactly four {C:attention}Gold{} cards',
            [3] = '{C:inactive}(currently{} {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.coins}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (SMODS.get_enhancements(context.other_card)["m_gold"] == true and #context.scoring_hand == 4) then
                card.ability.extra.coins = (card.ability.extra.coins) + 0.2
                return {
                    message = "COIN!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.coins
                }
        end
    end
}