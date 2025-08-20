SMODS.Joker{ --Glitch
    key = "glitch",
    config = {
        extra = {
            isdied = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glitch',
        ['text'] = {
            [1] = 'Prevents {C:red,E:2}death{} {s:1.3}once{}',
            [2] = '{C:inactive,E:1}YOU WILL RESPAWN{}',
            [3] = '{C:inactive,E:1}YOU WILL RESPAWN{}',
            [4] = '{C:inactive,E:1}YOU WILL RESPAWN{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    cost = 0,
    rarity = "cokelatr_unobtainable",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 3
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if (card.ability.extra.isdied or 0) == 0 then
                return {
                    saved = true,
                    message = "RESPAWN!",
                    extra = {
                        func = function()
                    card.ability.extra.isdied = 1
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}