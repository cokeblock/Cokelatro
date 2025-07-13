SMODS.Joker{ --EXE
    name = "EXE",
    key = "exe",
    config = {
        extra = {
            devoured = 1,
            Money = -10,
            j_cokelatr_exe = 0,
            j_joker = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'EXE',
        ['text'] = {
            [1] = 'when blind is selected. {C:attention}Deletes{} a random {C:attention}',
            [2] = 'joker{} and gains {X:chips,C:edition}^0.5{}{} Chips',
            [3] = '{C:inactive}(currently {}{C:edition}{X:chips,C:edition}^#1#{}{C:inactive} Chips){}'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 40,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 1
    },

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.devoured}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    e_chips = card.ability.extra.devoured
                }
        end
        if context.selling_self and not context.blueprint then
                return {
                    func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_cokelatr_exe')
                            joker_card:add_to_deck()
                            G.jokers:emplace(joker_card)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "NO ESCAPE!", colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        dollars = card.ability.extra.Money
                        }
                }
        end
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CODE EATEN!", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.devoured = (card.ability.extra.devoured) + 0.5
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
        end
    end
}