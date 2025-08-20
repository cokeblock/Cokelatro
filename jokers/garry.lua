SMODS.Joker{ --Jarrys joke
    key = "garry",
    config = {
        extra = {
            powermult = 1,
            yes = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jarrys joke',
        ['text'] = {
            [1] = 'gains {X:edition,C:dark_edition}^0.2{} Mult {C:attention}at end of shop{}.',
            [2] = 'destroys {X:attention,C:white}2{} jokers at end of shop.',
            [3] = '{C:inactive}(must have at least 1 additional joker){}',
            [4] = '{C:inactive}(currently {}{X:edition,C:dark_edition}^#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.powermult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.powermult
                }
        end
        if context.ending_shop  and not context.blueprint then
            if #G.jokers.cards > 1 then
                return {
                    func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "⠀", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    if target_joker.ability.eternal then
                        target_joker.ability.eternal = nil
                    end
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "⠀", colour = G.C.RED})
                end
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.powermult = (card.ability.extra.powermult) + 0.2
                    return true
                end,
                            message = "[Codebase-mult-jkr]",
                            colour = G.C.GREEN
                        }
                        }
                }
            end
        end
    end
}