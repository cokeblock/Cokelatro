SMODS.Joker{ --Ant Tenna
    key = "anttenna",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ant Tenna',
        ['text'] = {
            [1] = '{X:attention,C:white}Every{} played hand creates a',
            [2] = '{C:dark_edition,E:1}negative{} {C:attention}TV TIME!{} Joker',
            [3] = '{C:inactive,E:1}all boss blinds disabled{}',
            [4] = '{C:inactive,E:1,s:0.7}the sensation of your screen!{}',
            [5] = '{C:inactive,E:1,s:0.7}the show that makes you scream!{}',
            [6] = '{C:inactive,E:1,s:0.7}say it with him folks!{}'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 500,
    rarity = "cokelatr_transcendant",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 0
    },

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_cokelatr_tvtime' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                return {
                    message = "TVTIME!"
                }
        end
        if context.setting_blind  and not context.blueprint then
            if G.GAME.blind.boss then
                return {
                    func = function()
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
            end
                    return true
                end
                }
            end
        end
    end
}