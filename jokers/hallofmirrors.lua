SMODS.Joker{ --Hall of Mirrors
    key = "hallofmirrors",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hall of Mirrors',
        ['text'] = {
            [1] = 'Create a {C:attention}random{} card with',
            [2] = '{C:spades}hall effect {}when blind {C:attention}selected{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    cost = 8,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_cokelatr_halleffect
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "+1 Card!"
                }
        end
    end
}