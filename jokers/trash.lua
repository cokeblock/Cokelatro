SMODS.Joker{ --recycling bin
    key = "trash",
    config = {
        extra = {
            Xmult = 3
        }
    },
    loc_txt = {
        ['name'] = 'recycling bin',
        ['text'] = {
            [1] = 'Every scored {C:attention}7{} of spades',
            [2] = 'gives {X:red,C:white}X3{} Mult',
            [3] = '{C:inactive,E:2}hey, their good now!{}'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    cost = 15,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 7 and context.other_card:is_suit("Spades")) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "TRASH!"
                }
            end
        end
    end
}