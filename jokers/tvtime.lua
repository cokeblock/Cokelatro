SMODS.Joker{ --TV TIME!
    name = "TV TIME!",
    key = "tvtime",
    config = {
        extra = {
            Xmult = 2,
            emult = 1.1,
            Xmult2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'TV TIME!',
        ['text'] = {
            [1] = 'Played {C:attention}face{} cards give',
            [2] = '{X:red,C:white}X2{} Mult when {C:attention}scored,{}',
            [3] = 'if {X:legendary,C:white,E:1}Ant tenna{} is owned',
            [4] = 'they also give {C:dark_edition}^1.1{} Mult'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    cost = 30,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_anttenna" then
              return true
          end
      end
      return false
  end)() and context.other_card:is_face()) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        e_mult = card.ability.extra.emult,
                            message = "TVTIME!",
                        colour = G.C.DARK_EDITION
                        }
                }
            elseif context.other_card:is_face() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}