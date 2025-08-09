SMODS.Joker{ --Missing Texture
    key = "simming",
    config = {
        extra = {
            JKR = 1,
            mult = 40,
            mult2 = 10,
            mult3 = 20,
            mult4 = 30
        }
    },
    loc_txt = {
        ['name'] = 'Missing Texture',
        ['text'] = {
            [1] = '{C:red}+10{} Mult per empty {C:attention}joker{} slot'
        }
    },
    pos = {
        x = 2,
        y = 5
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
        if context.cardarea == G.jokers and context.joker_main  then
            if #G.jokers.cards == 1 then
                return {
                    mult = card.ability.extra.mult
                }
            elseif #G.jokers.cards == 4 then
                return {
                    mult = card.ability.extra.mult2
                }
            elseif #G.jokers.cards == 3 then
                return {
                    mult = card.ability.extra.mult3
                }
            elseif #G.jokers.cards == 2 then
                return {
                    mult = card.ability.extra.mult4
                }
            end
        end
    end
}