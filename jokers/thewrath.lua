SMODS.Joker{ --The Wrath
    key = "thewrath",
    config = {
        extra = {
            Spurgchips = 25,
            spurgXchips = 1,
            scale = 1.5,
            rotation = 20,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Wrath',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips per scored {C:spades}Spade{} card.',
            [2] = '{C:spades}Spade{} cards also give a {C:attention}Bonus{} of {X:blue,C:white}X#2#{} Chips.',
            [3] = '{C:blue}chips {}and {X:blue,C:white}Xchips{} increases by {X:attention,C:white}X1.1{} per {C:spades}Spade{} card scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 8
    },
    cost = 5,
    rarity = "cokelatr_mythical",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 9
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Spurgchips, card.ability.extra.spurgXchips}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                card.ability.extra.Spurgchips = (card.ability.extra.Spurgchips) * 1.1
                card.ability.extra.spurgXchips = (card.ability.extra.spurgXchips) * 1.1
                local target_card = context.other_card
                return {
                    func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                    extra = {
                        chips = card.ability.extra.Spurgchips,
                        colour = G.C.CHIPS,
                        extra = {
                            x_chips = card.ability.extra.spurgXchips,
                            colour = G.C.DARK_EDITION
                        }
                        }
                }
            end
        end
    end
}