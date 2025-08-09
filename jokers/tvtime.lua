SMODS.Joker{ --TV TIME!
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
        x = 6,
        y = 8
    },
    cost = 15,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
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
                    Xmult = card.ability.extra.Xmult2
                }
            end
        end
    end
}