SMODS.Joker{ --Crashers
    key = "crash",
    config = {
        extra = {
            CASTLE = 1
        }
    },
    loc_txt = {
        ['name'] = 'Crashers',
        ['text'] = {
            [1] = 'Gains {X:blue,C:white}X0.5{} Chips if played',
            [2] = 'hand {C:attention}contains{} all four{E:1} suits{}',
            [3] = '{C:inactive}(currently{} {C:inactive}{X:blue,C:white}X#1#{}{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.CASTLE}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Spades") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Hearts") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)()) then
                card.ability.extra.CASTLE = (card.ability.extra.CASTLE) + 0.5
                return {
                    message = "CASTLE!",
                    extra = {
                        x_chips = card.ability.extra.CASTLE,
                        colour = G.C.DARK_EDITION
                        }
                }
            else
                return {
                    x_chips = card.ability.extra.CASTLE
                }
            end
        end
    end
}