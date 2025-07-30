SMODS.Joker{ --J.O.K.E.R
    name = "J.O.K.E.R",
    key = "wacko",
    config = {
        extra = {
            doohivket = 1,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'J.O.K.E.R',
        ['text'] = {
            [1] = 'Every time a {E:1}consumable{} is {C:attention}used{},',
            [2] = '{C:green}#2# in #3# chance{} a held',
            [3] = 'consumable {C:attention}duplicates{} and becomes {C:dark_edition}negative{}'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_wacko') --Please-work
        return {vars = {card.ability.extra.doohivket, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1bef04f5', 1, card.ability.extra.odds, 'j_cokelatr_wacko') then
                      SMODS.calculate_effect({func = function()
            local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                table.insert(target_cards, consumable)
            end
            if #target_cards > 0  then
                local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local copied_card = copy_card(card_to_copy)
                        copied_card:set_edition("e_negative", true)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                        
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "DUPED!", colour = G.C.GREEN})
            end
                    return true
                end}, card)
                  end
            end
        end
    end
}