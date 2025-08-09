SMODS.Joker{ --Demented Joker
    key = "flushhouse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Demented Joker',
        ['text'] = {
            [1] = '{C:red}+24{} Mult if played hand',
            [2] = 'contains {C:attention}Flush house{}'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Flush House"]) then
            end
        end
    end
}