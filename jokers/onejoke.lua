SMODS.Joker{ --OneJoke
    name = "OneJoke",
    key = "onejoke",
    config = {
        extra = {
            hand_change = 1,
            Niko = 1
        }
    },
    loc_txt = {
        ['name'] = 'OneJoke',
        ['text'] = {
            [1] = 'Set {C:attention}hands {} per {C:attention}round{} to {X:attention,C:white}1{}',
            [2] = 'Gains {X:red,C:white}X0.5{} Mult every time',
            [3] = 'you {C:attention}beat{} a {C:attention}blind{} with this {C:red}debuff{}',
            [4] = '{C:inactive}(currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Niko}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.Niko = (card.ability.extra.Niko) + 0.5
                    return true
                end,
                    message = "UPGRADE!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Niko
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_hands = G.GAME.round_resets.hands
        G.GAME.round_resets.hands = card.ability.extra.hand_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_hands then
            G.GAME.round_resets.hands = card.ability.extra.original_hands
        end
    end
}