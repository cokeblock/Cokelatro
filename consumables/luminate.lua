SMODS.Consumable {
    key = 'luminate',
    set = 'broken',
    pos = { x = 7, y = 0 },
    loc_txt = {
        name = 'Luminate',
        text = {
        [1] = 'Select up to {C:attention}5{} cards',
        [2] = 'Increase {C:attention}rank{} by 1 per {C:attention}ante{}',
        [3] = 'Decrease {C:attention}rank{} by 1 per {C:spectral}hand{} you have'
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
    end,
    can_use = function(self, card)
        return true
    end
}