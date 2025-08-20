SMODS.Enhancement {
    key = 'pastel',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        name = 'Pastel',
        text = {
        [1] = '{C:green}1 in 3{} chance to {C:attention}copy{}',
        [2] = 'a random consumable when {C:attention}scored{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_42c026e1', 1, card.ability.extra.odds, 'm_cokelatr') then
                local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                table.insert(target_cards, consumable)
            end
            if #target_cards > 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local copied_card = copy_card(card_to_copy)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
            end
            end
        end
    end
}