SMODS.Joker{ --Pale Joker
    key = "hollow",
    config = {
        extra = {
            vara = 0,
            ante_value = 2
        }
    },
    loc_txt = {
        ['name'] = 'Pale Joker',
        ['text'] = {
            [1] = 'On death, this joker {C:attention}destroys{} itself',
            [2] = '{C:attention}revives{} the {E:1}player{}, and goes back 2 {C:attention}ante{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    cost = 15,
    rarity = "cokelatr_incredulous",
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                    local mod = -card.ability.extra.ante_value
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
				return true
			end,
		}))
                    return true
                end,
                    message = "CHECKPOINT!",
                    extra = {
                        saved = true,
                            message = "RESPAWN!",
                        colour = G.C.RED,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Destroyed!",
                            colour = G.C.RED
                        }
                        }
                }
        end
    end
}