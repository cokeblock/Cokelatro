SMODS.Joker{ --Cyclotron Radiation
    key = "cyclotronradiation",
    config = {
        extra = {
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cyclotron Radiation',
        ['text'] = {
            [1] = 'Scored {C:planet}solar{} cards {C:planet}level up{} a {C:attention}random{} hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 5,
    rarity = "cokelatr_incredulous",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_cokelatr_solar"] == true then
                available_hands = {}
        for hand, value in pairs(G.GAME.hands) do
          if value.visible and value.level >= to_big(1) then
            table.insert(available_hands, hand)
          end
        end
        target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}