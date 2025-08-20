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
            [1] = 'Gains {X:red,C:white}X0.1{} Mult per scored card',
            [2] = 'if played hand contains',
            [3] = 'exactly four {C:attention}Gold{} cards',
            [4] = '{C:inactive}(currently{} {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 5
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
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (card.ability.extra.Sus or 0) == 1 then
                card.ability.extra.coins = (card.ability.extra.coins) + 0.1
            end
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if ((function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_gold"] == true then
            count = count + 1
        end
    end
    return count == 4
end)() and #context.scoring_hand == 4) then
                return {
                    func = function()
                    card.ability.extra.Sus = 1
                    return true
                end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.coins
                }
        end
    end
}