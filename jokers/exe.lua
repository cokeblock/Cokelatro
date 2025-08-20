SMODS.Joker{ --EXE
    key = "exe",
    config = {
        extra = {
            devoured = 1,
            Money = -10,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'EXE',
        ['text'] = {
            [1] = 'when blind is selected. {C:attention}Deletes{} a random {C:attention}',
            [2] = 'joker{} and gains {X:chips,C:edition}^0.5{}{} Chips',
            [3] = '{C:inactive}(currently {}{C:edition}{X:chips,C:edition}^#1#{}{C:inactive} Chips){}',
            [4] = '{C:inactive,s:0.7}Nowhere to hide{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    cost = 250,
    rarity = "cokelatr_transcendant",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 2
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.devoured}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_chips = card.ability.extra.devoured
                }
        end
        if context.selling_self  and not context.blueprint then
                return {
                    func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_cokelatr_exe' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "NO ESCAPE!", colour = G.C.BLUE})
            end
            return true
        end
                }
        end
        if context.setting_blind  and not context.blueprint then
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