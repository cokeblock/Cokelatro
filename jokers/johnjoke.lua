SMODS.Joker{ --John Joke
    key = "johnjoke",
    config = {
        extra = {
            hasdied = 0,
            powermultvar = 1,
            odds = 20,
            emult = 1.5,
            no = 0,
            var1 = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'John Joke',
        ['text'] = {
            [1] = 'Prevents {C:red,E:2}death{} and sets you to {C:attention}ante{} 1, keep all {C:attention}jokers{}',
            [2] = '{C:green}#6# in #7#{} chance for a {C:attention}random{} joker to {C:red,E:1}glitch{}',
            [3] = 'all {C:red,E:1}glitched{} jokers give {C:dark_edition}^1.5{} Mult',
            [4] = '{C:inactive}(currently {}{C:dark_edition}^#2#{} {C:inactive}Mult){}',
            [5] = '{C:inactive}(only prevents death once){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    cost = 50,
    rarity = "cokelatr_mythical",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_johnjoke') 
        return {vars = {card.ability.extra.hasdied, card.ability.extra.powermultvar, card.ability.extra.ignore, card.ability.extra.no, card.ability.extra.var1, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
            if (card.ability.extra.hasdied or 0) == 0 then
                return {
                    saved = true,
                    message = "!!!!!!!!!!",
                    extra = {
                        func = function()
                    card.ability.extra.hasdied = 1
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3c2387d0', 1, card.ability.extra.odds, 'j_cokelatr_johnjoke') then
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                        local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_cokelatr_glitch' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "OVERTAKEN!", colour = G.C.BLUE})
                  end
            end
        end
        if context.other_joker  then
            if (function()
        return context.other_joker.config.center.key == "j_cokelatr_glitch"
    end)() then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
    end
}