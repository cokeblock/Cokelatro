SMODS.Joker{ --MACHINEID V1
    key = "v1",
    config = {
        extra = {
            coins = 1,
            Sus = 0
        }
    },
    loc_txt = {
        ['name'] = 'MACHINEID V1',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.5{} Mult if played hand',
            [2] = 'contains exactly four {C:attention}Gold{} cards',
            [3] = '{C:inactive}(currently{} {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
        }
    },
    pos = {
        x = 9,
        y = 4
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.coins}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (#context.scoring_hand == 4 and (function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_gold"] == true then
            count = count + 1
        end
    end
    return count == 4
end)()) then
                card.ability.extra.coins = (card.ability.extra.coins) + 0.5
            else
                return {
                    Xmult = card.ability.extra.coins
                }
            end
        end
    end
}