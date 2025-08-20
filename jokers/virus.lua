SMODS.Joker{ --Virus
    key = "virus",
    config = {
        extra = {
            emult = 3,
            odds = 20,
            var1 = 0,
            eternal = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Virus',
        ['text'] = {
            [1] = '{C:dark_edition}^3 Mult{} {C:uncommon}#4# in #5# chance{}',
            [2] = 'to {C:hearts,E:1}infect{} a random {C:attention}Joker{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 9
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_virus') 
        return {vars = {card.ability.extra.eternal, card.ability.extra.ignore, card.ability.extra.var1, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    e_mult = card.ability.extra.emult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_44ffd140', 1, card.ability.extra.odds, 'j_cokelatr_virus') then
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", colour = G.C.RED})
                end
                        local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_cokelatr_malware' })
                          if joker_card then
                              
                              joker_card:add_sticker('eternal', true)
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "this not good", colour = G.C.BLUE})
                  end
                        return true
                    end
                }
            end
        end
    end
}