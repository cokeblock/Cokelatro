SMODS.Joker{ --PokeBall
    name = "PokeBall",
    key = "poke",
    config = {
        extra = {
            odds = 10,
            j_joker = 0
        }
    },
    loc_txt = {
        ['name'] = 'PokeBall',
        ['text'] = {
            [1] = 'At end of round, {C:green}#1# in #2# chance{}',
            [2] = 'to {C:attention}duplicate{} a random {C:attention}Joker{} and make it {C:dark_edition,E:1}negative{}'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_poke') --Please-work
        return {vars = {card.ability.extra.j_joker, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_ef702bb4', 1, card.ability.extra.odds, 'j_cokelatr_poke') then
                      SMODS.calculate_effect({func = function()
                local available_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    table.insert(available_jokers, joker)
                end
                local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
                
                if target_joker then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                        copied_joker:set_edition("e_negative", true)
                            copied_joker:add_to_deck()
                            G.jokers:emplace(copied_joker)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "WHOS THAT JOKER?", colour = G.C.GREEN})
                end
                    return true
                end}, card)
                  end
            end
        end
    end
}