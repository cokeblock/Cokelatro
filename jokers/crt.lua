SMODS.Joker{ --CRT TV
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
            [2] = '{C:attention}only{} if {E:1}photograph{} is {C:attention}owned{} {T:j_photograph}'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 12,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
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