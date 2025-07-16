SMODS.Joker{ --Filler common worth nothing and actually sucks and doesnt become a really good joker later
    name = "Filler common worth nothing and actually sucks and doesnt become a really good joker later",
    key = "filler",
    config = {
        extra = {
            odds = 20,
            mult = 0.1,
            odds2 = 50,
            j_cokelatr_exponentia = 0
        }
    },
    loc_txt = {
        ['name'] = 'Filler common worth nothing and actually sucks and doesnt become a really good joker later',
        ['text'] = {
            [1] = '{C:green}1 in 20{} chance for {C:red}+0.1{} Mult'
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if pseudorandom('group_0_d00bd180') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                    end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if true then
                if pseudorandom('group_0_ed425fec') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_cokelatr_exponentia')
                            joker_card:add_to_deck()
                            G.jokers:emplace(joker_card)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "LOL!", colour = G.C.BLUE})
            end
            return true
        end}, card)
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
            end
        end
    end
}