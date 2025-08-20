SMODS.Joker{ --Thats Just a Joker
    key = "mat",
    config = {
        extra = {
            JOKER = 1
        }
    },
    loc_txt = {
        ['name'] = 'Thats Just a Joker',
        ['text'] = {
            [1] = '{C:attention}Copies{} a random',
            [2] = 'jokers {C:attention}ability{} every blind',
            [3] = '',
            [4] = '{C:inactive,s:2}(BROKEN){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.JOKER = pseudorandom('JOKER_a5d61929', 1, 5)
                    return true
                end,
                    message = "randomized!"
                }
        end
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[JOKER]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}