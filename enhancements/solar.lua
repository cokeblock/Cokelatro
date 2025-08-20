SMODS.Enhancement {
    key = 'solar',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            Var1 = 0,
            var2 = 1,
            Discards = 1,
            levels = 5
        }
    },
    loc_txt = {
        name = 'Solar',
        text = {
        [1] = 'Levels up a {C:attention}Random{} {C:planet}poker hand{}',
        [2] = '{C:attention}5{} times when {C:red}discarded{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            local target_hand
                
                local available_hands = {}
                for hand, value in pairs(G.GAME.hands) do
                  if value.visible and value.level >= to_big(1) then
                    table.insert(available_hands, hand)
                  end
                end
                target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand_enhanced')) or "High Card"
            return { level_up = card.ability.extra.levels,
                level_up_hand = target_hand }
        end
    end
}