SMODS.Joker{ --Jokehub
    key = "reference",
    config = {
        extra = {
            mult = 69
        }
    },
    loc_txt = {
        ['name'] = 'Jokehub',
        ['text'] = {
            [1] = '{C:red}+69{} Mult if played {C:attention}hand{} has',
            [2] = '3 {C:diamonds}Diamonds{} and 2 spades'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 3
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Spades") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) then
                return {
                    mult = card.ability.extra.mult,
                    message = "FUNNY NUMBER!"
                }
            end
        end
    end
}