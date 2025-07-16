SMODS.Joker{ --This joker is great!
    name = "This joker is great!",
    key = "Vsauce",
    config = {
        extra = {
            Oddities = 1
        }
    },
    loc_txt = {
        ['name'] = 'This joker is great!',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}X0.25{} mult',
            [2] = 'if played hand is only {C:common}odd rank{} cards',
            [3] = '{C:inactive,E:1}or is it?{}',
            [4] = '{C:inactive}(currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Oddities}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (function()
    local allMatchRank = true
    for i, c in ipairs(context.full_hand) do
        if not ((c:get_id() == 14 or c:get_id() == 3 or c:get_id() == 5 or c:get_id() == 7 or c:get_id() == 9)) then
            allMatchRank = false
            break
        end
    end
    
    return allMatchRank and #context.full_hand > 0
end)() then
                card.ability.extra.Oddities = (card.ability.extra.Oddities) + 0.25
                return {
                    Xmult = card.ability.extra.Oddities
                }
            else
                return {
                    Xmult = card.ability.extra.Oddities
                }
            end
        end
    end
}