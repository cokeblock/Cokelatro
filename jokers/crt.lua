SMODS.Joker{ --CRT TV
    name = "CRT TV",
    key = "crt",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'CRT TV',
        ['text'] = {
            [1] = '{C:attention}Face{} cards give {X:red,C:white}X1.5{} Mult',
            [2] = '{C:attention}only{} if {E:1}photograph{} is {C:attention}owned{}'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (context.other_card:is_face() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_photograph" then
              return true
          end
      end
      return false
  end)()) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "80s!"
                }
            end
        end
    end
}