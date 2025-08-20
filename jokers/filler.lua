SMODS.Joker{ --Filler common worth nothing and actually sucks and doesnt become a really good joker later
    key = "filler",
    config = {
        extra = {
            odds = 20,
            mult = 0.1,
            odds2 = 50
        }
    },
    loc_txt = {
        ['name'] = 'Filler common worth nothing and actually sucks and doesnt become a really good joker later',
        ['text'] = {
            [1] = '{C:green}1 in 20{} chance for {C:red}+0.1{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b9c95119', 1, card.ability.extra.odds, 'j_cokelatr_filler') then
                      SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
                  end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1692f640', 1, card.ability.extra.odds, 'j_cokelatr_filler') then
                      SMODS.calculate_effect({func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_cokelatr_exponentia' })
                    if joker_card then
                        
                        
                    end
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