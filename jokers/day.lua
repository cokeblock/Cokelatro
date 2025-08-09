SMODS.Joker{ --SuperDrNoob
    key = "day",
    config = {
        extra = {
            Spacl = 1
        }
    },
    loc_txt = {
        ['name'] = 'SuperDrNoob',
        ['text'] = {
            [1] = 'Gains {C:dark_edition}^0.03{} Mult per {C:attention}scored{}',
            [2] = '{C:clubs}Club{} or spade',
            [3] = '{C:inactive}(currently{} {C:dark_edition}^#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    cost = 1000,
    rarity = "cokelatr_almanetic",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 6
    },

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Spacl}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                card.ability.extra.Spacl = (card.ability.extra.Spacl) + 0.03
                return {
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.Spacl
                }
        end
    end
}