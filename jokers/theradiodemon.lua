SMODS.Joker{ --The Radio Demon
    name = "The Radio Demon",
    key = "theradiodemon",
    config = {
        extra = {
            Alas = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Radio Demon',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult per scored',
            [2] = '{C:attention}card{} if there are {X:attention,C:white}0{}',
            [3] = '{E:1}technology themed{} {C:attention}jokers{} owned'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 6
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_anttenna" then
              return false
          end
      end
      return true
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_tvtime" then
              return false
          end
      end
      return true
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_exe" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_photograph" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_scam" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_crt" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_em" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_garry" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_jj" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_v1" then
              return true
          end
      end
      return false
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_cokelatr_jkr" then
              return true
          end
      end
      return false
  end)()) then
                card.ability.extra.Alas = 3
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
                return {
                    Xmult = card.ability.extra.Alas
                }
        end
    end
}