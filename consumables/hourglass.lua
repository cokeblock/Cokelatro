SMODS.Consumable {
    key = 'hourglass',
    set = 'ether',
    pos = { x = 8, y = 0 },
    config = { extra = {
        hands_value = 1,
        discards_value = 2,
        copy_cards_amount = 3
    } },
    loc_txt = {
        name = 'Hourglass',
        text = {
        [1] = '{C:attention}lose{} 1 {C:blue}hand {}and 2 {C:red}discards{}',
        [2] = 'create {C:attention}3{} copies of {C:attention}every {}selected {C:attention}card{}'
    }
    },
    cost = 6,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand", colour = G.C.RED})
                    G.GAME.current_round.hands_left = math.max(0, G.GAME.current_round.hands_left - 1)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Discard", colour = G.C.RED})
                    G.GAME.current_round.discards_left = math.max(0, G.GAME.current_round.discards_left - 2)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _first_materialize = nil
                    local new_cards = {}
                    
                    for _, selected_card in pairs(G.hand.highlighted) do
                        for i = 1, card.ability.extra.copy_cards_amount do
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local copied_card = copy_card(selected_card, nil, nil, G.playing_card)
                            copied_card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, copied_card)
                            G.hand:emplace(copied_card)
                            copied_card:start_materialize(nil, _first_materialize)
                            _first_materialize = true
                            new_cards[#new_cards + 1] = copied_card
                        end
                    end
                    
                    SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}