SMODS.Joker{ --Etch-A-Sketch
    key = "etchasketch",
    config = {
        extra = {
            Ereketch = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Etch-A-Sketch',
        ['text'] = {
            [1] = '{C:attention}Sell{} this card to',
            [2] = '{C:attention}create{} an {X:attention,C:white}etched joker{}',
            [3] = 'after {C:attention}4{} rounds',
            [4] = '{C:inactive}(currently{} {C:attention}#1#{}{C:inactive}/4 rounds){}',
            [5] = '{C:inactive,s:0.7,E:1}Subtle collab with nicolas journal mod{}'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Ereketch}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.Ereketch = (card.ability.extra.Ereketch) + 1
                    return true
                end,
                    message = "+1 round!"
                }
        end
        if context.selling_self  then
            if (card.ability.extra.Ereketch or 0) >= 4 then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_cokelatr_etch' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
            end
        end
    end
}