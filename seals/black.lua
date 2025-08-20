SMODS.Seal {
    key = 'black',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 6
        }
    },
    badge_colour = HEX('313131'),
   loc_txt = {
        name = 'Black',
        label = 'Black',
        text = {
        [1] = '{C:green}#1# in 6{} chance to create',
        [2] = 'an {C:purple,E:1}Ethereal{} card when {C:hearts}discarded{}',
        [3] = '{C:inactive}(must have room){}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'cokelatr_black')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if SMODS.pseudorandom_probability(card, 'group_0_858dd0c7', 1, card.ability.seal.extra.odds, 'm_cokelatr') then
                SMODS.calculate_effect({func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'ether', key_append = 'enhanced_card_ether'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+1 Consumable!", colour = G.C.PURPLE})
                    end
                    return true
                end}, card)
            end
        end
    end
}