SMODS.Joker{ --Hiding Graphs
    key = "hide",
    config = {
        extra = {
            JOKE = 0,
            repetitions = 2,
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Hiding Graphs',
        ['text'] = {
            [1] = '{C:attention}First{} played {C:attention}face card{} gives {X:red,C:white}X2{} Mult when scored',
            [2] = 'retrigger first {C:attention}card{} played {C:attention}2 {}additional times'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    cost = 20,
    rarity = "cokelatr_incredulous",
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

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and context.other_card:is_face()) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and context.other_card:is_face()) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}