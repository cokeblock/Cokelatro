SMODS.Joker{ --Spamton G [[JOKER]]
    key = "spamton",
    config = {
        extra = {
            MULT = 1,
            odds = 3,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Spamton G [[JOKER]]',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X1{} Mult when sold',
            [2] = '{C:uncommon}#3# in #4#{} chance to duplicate when sold',
            [3] = 'destroys if {C:attention}[[TV TIME!]]{} or {C:spades}[[ANT TENNA]]{} are owned',
            [4] = '{C:inactive} (currently {C:white,X:red} X#1# {} {C:inactive}mult){}',
            [5] = '{s:0.7,C:inactive}Dont you wanna be a {C:legendary,s:0.8}BIG{}{C:attention,s:0.8}SHOT{}{s:0.7,C:inactive}?{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    cost = 8,
    rarity = "cokelatr_unobtainable",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 7
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_spamton') 
        return {vars = {card.ability.extra.MULT, card.ability.extra.ignore, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.selling_self  and not context.blueprint then
            if true then
                return {
                    func = function()
                    card.ability.extra.MULT = (card.ability.extra.MULT) + 1
                    return true
                end,
                    message = "UPGRADE!"
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_3172d293', 1, card.ability.extra.odds, 'j_cokelatr_spamton') then
                      SMODS.calculate_effect({func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_cokelatr_spamton" then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                        G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                end
                    return true
                end}, card)
                  end
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_anttenna" then
              return true
          end
      end
      return false
  end)() then
                card.ability.extra.MULT = 1
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            else
                return {
                    Xmult = card.ability.extra.MULT
                }
            end
        end
        if context.buying_card  and not context.blueprint then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_tvtime" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!",
                    extra = {
                        func = function()
                    card.ability.extra.MULT = 1
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}