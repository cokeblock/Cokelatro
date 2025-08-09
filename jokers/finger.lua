SMODS.Joker{ --KID NAMED FINGER
    key = "finger",
    config = {
        extra = {
            Discards = 0,
            discardsusedthisround = 0,
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'KID NAMED FINGER',
        ['text'] = {
            [1] = 'If no {C:red}discards {}are used and played',
            [2] = '{C:blue}hand{} is a high card, {C:dark_edition}^1.5 Mult{}',
            [3] = 'on {C:attention}first hand{} of round'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "High Card" and G.GAME.current_round.hands_played == 0 and (card.ability.extra.Discards or 0) == G.GAME.current_round.discards_used) then
                return {
                    e_mult = card.ability.extra.emult,
                    message = "PAINTED WHITE!"
                }
            end
        end
    end
}