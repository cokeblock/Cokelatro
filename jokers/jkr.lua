SMODS.Joker{ --JKR//1011101
    name = "JKR//1011101",
    key = "jkr",
    config = {
        extra = {
            odds = 4,
            odds2 = 6,
            odds3 = 8,
            odds4 = 30,
            xchips = 2,
            echips = 0.5,
            emult = 2,
            Xmult = 1011,
            dollars = 0,
            odds2 = 4,
            odds22 = 8,
            hands = 2,
            hands2 = 1,
            discards = 5,
            discards2 = 5,
            hand_size = 12,
            hand_size2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'JKR//1011101',
        ['text'] = {
            [1] = '{C:green}1100010011{}110010{C:green}10111{}',
            [2] = '{C:inactive}{{C:green}{C:inactive}(cu{}{}%^&ren{C:green} t*l{}{C:inactive}y{}{}'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 8,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_23d2697b', 1, card.ability.extra.odds, 'group_0_23d2697b') then
                      SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "110101111err", colour = G.C.DARK_EDITION})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_2a194631', 1, card.ability.extra.odds, 'group_1_2a194631') then
                      SMODS.calculate_effect({e_chips = card.ability.extra.echips}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "mult", colour = G.C.DARK_EDITION})
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_0c497f05', 1, card.ability.extra.odds2, 'group_2_0c497f05') then
                      SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "[]system10111", colour = G.C.DARK_EDITION})
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_62165083', 1, card.ability.extra.odds3, 'group_3_62165083') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "10111-101011-1011", colour = G.C.WHITE})
                  end
                if SMODS.pseudorandom_probability(card, 'group_4_0906cd88', 1, card.ability.extra.odds4, 'group_4_0906cd88') then
                      SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "N--110er11d", colour = G.C.MONEY})
                  end
            end
        end
        if context.setting_blind and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a4c6fee1', 1, card.ability.extra.odds, 'group_0_a4c6fee1') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CDE:HNDS1", colour = G.C.GREEN})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_6c0dd9d2', 1, card.ability.extra.odds, 'group_1_6c0dd9d2') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CDE:HNDS-1", colour = G.C.BLUE})
                G.GAME.current_round.hands_left = card.ability.extra.hands2
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_1ad9d47d', 1, card.ability.extra.odds, 'group_2_1ad9d47d') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CDE:DSCRD1", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_3_68a0e6d6', 1, card.ability.extra.odds, 'group_3_68a0e6d6') then
                      SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CDE:DSCRD-1", colour = G.C.RED})
                G.GAME.current_round.discards_left = math.max(0, G.GAME.current_round.discards_left - card.ability.extra.discards2)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_4_315485dc', 1, card.ability.extra.odds2, 'group_4_315485dc') then
                      SMODS.calculate_effect({func = function()
                local current_hand_size = G.hand.config.card_limit
                local target_hand_size = card.ability.extra.hand_size
                local difference = target_hand_size - current_hand_size
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "HNDS:SZ1", colour = G.C.BLUE})
                G.hand:change_size(difference)
                return true
            end}, card)
                  end
                if SMODS.pseudorandom_probability(card, 'group_5_2c0af43e', 1, card.ability.extra.odds2, 'group_5_2c0af43e') then
                      SMODS.calculate_effect({func = function()
                local current_hand_size = G.hand.config.card_limit
                local target_hand_size = card.ability.extra.hand_size2
                local difference = target_hand_size - current_hand_size
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "HNDS:SZ-1", colour = G.C.BLUE})
                G.hand:change_size(difference)
                return true
            end}, card)
                  end
            end
        end
    end
}