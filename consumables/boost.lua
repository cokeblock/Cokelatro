SMODS.Consumable {
    key = 'boost',
    set = 'ether',
    pos = { x = 0, y = 0 },
    config = { extra = {
        booster_slots_value = 2
    } },
    loc_txt = {
        name = 'Boost',
        text = {
        [1] = 'Adds {C:attention}+2{} booster packs to the current {C:attention}shop{}'
    }
    },
    cost = 6,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Booster Slots", colour = G.C.BLUE})
                    SMODS.change_booster_limit(2)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}