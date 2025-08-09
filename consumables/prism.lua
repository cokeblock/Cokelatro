SMODS.Consumable {
    key = 'prism',
    set = 'primes',
    pos = { x = 1, y = 1 },
    config = { extra = {
        odds = 12,
        consumable_count = 1
    } },
    loc_txt = {
        name = 'Prism',
        text = {
        [1] = '{C:green}1 in 12 chance{} to create a {C:enhanced,E:1,s:1.3}prime ethereal{}'
    }
    },
    cost = 12,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            if SMODS.pseudorandom_probability(card, 'group_0_ea5673a1', 1, card.ability.extra.odds, 'c_cokelatr') then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ set = 'primes' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
            end
    end,
    can_use = function(self, card)
        return true
    end
}