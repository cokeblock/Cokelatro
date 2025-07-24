SMODS.Consumable {
    key = 'mitosis',
    set = 'ether',
    pos = { x = 5, y = 0 },
    config = { extra = {
        consumable_count = 2
    } },
    loc_txt = {
        name = 'Mitosis',
        text = {
        [1] = '{C:attention}Creates{} up to {C:attention}2{}',
        [2] = 'random{} {C:purple,E:1}ethereal manifests {}'
    }
    },
    cost = 6,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(card.ability.extra.consumable_count, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ set = 'ether' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}