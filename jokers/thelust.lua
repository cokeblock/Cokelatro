SMODS.Joker{ --The Lust
    key = "thelust",
    config = {
        extra = {
            HURT = 1.5,
            rotation = 45,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Lust',
        ['text'] = {
            [1] = '{C:hearts}Heart{} cards give {X:red,C:white}X#1#{} Mult when {C:attention}scored{}.',
            [2] = 'multiplies {X:red,C:white}Xmult{} by {X:attention,C:white}X1.5{} per {C:attention}scored {}{C:hearts}Heart{} card.',
            [3] = '{C:inactive,E:1,s:0.7}my body is a machine that turns balatro into 1000 hours{}'
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    cost = 500,
    rarity = "cokelatr_transcendant",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.HURT}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                card.ability.extra.HURT = (card.ability.extra.HURT) * 1.5
                local target_card = context.other_card
                return {
                    func = function()
                      card:juice_up(card.ability.extra.HURT, card.ability.extra.rotation)
                      return true
                    end,
                    extra = {
                        Xmult = card.ability.extra.HURT
                        }
                }
            end
        end
    end
}