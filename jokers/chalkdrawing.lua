SMODS.Joker{ --Chalk Drawing
    key = "chalkdrawing",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Chalk Drawing',
        ['text'] = {
            [1] = '{C:clubs}P{}{C:tarot}a{}{C:uncommon}s{}{C:green}t{}{C:enhanced}e{}{C:hearts}l{} Cards {C:attention}held in hand{}',
            [2] = 'have a {C:green}#1# in 5{} chance to make',
            [3] = 'a random {C:dark_edition}negative{} {C:attention}consumable{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_cokelatr_chalkdrawing') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if SMODS.get_enhancements(context.other_card)["m_cokelatr_pastel"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_54652aac', 1, card.ability.extra.odds, 'j_cokelatr_chalkdrawing') then
                      SMODS.calculate_effect({func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local random_sets = {'Tarot', 'Planet', 'Spectral'}
                        local random_set = random_sets[math.random(1, #random_sets)]
                        SMODS.add_card{set=random_set, edition = 'e_negative', key_append='joker_forge_' .. random_set:lower()}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end}, card)
                  end
            end
        end
    end
}