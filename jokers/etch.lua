SMODS.Joker{ --Etched Joker
    name = "Etched Joker",
    key = "etch",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Etched Joker',
        ['text'] = {
            [1] = 'If first {C:planet}poker hand{} of round is a',
            [2] = '{C:attention}5 card hand{}, duplicate {E:1}every{} {C:dark_edition}scored card{}',
            [3] = 'and {E:1}draw it to hand{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 20,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 0
    },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (#context.scoring_hand == 5 and G.GAME.current_round.hands_played == 0) then
                local cards_to_copy = {}
                for i, c in ipairs(context.full_hand) do
                    table.insert(cards_to_copy, c)
                end
                
                for i, source_card in ipairs(cards_to_copy) do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local copied_card = copy_card(source_card, nil, nil, G.playing_card)
                    copied_card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copied_card)
                    G.hand:emplace(copied_card)
                    copied_card.states.visible = nil
                    
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            copied_card:start_materialize()
                            return true
                        end
                    }))
                end
                return {
                    message = "ETCHED!"
                }
            end
        end
    end
}