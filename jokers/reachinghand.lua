SMODS.Joker{ --Reaching Hand
    key = "reachinghand",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Reaching Hand',
        ['text'] = {
            [1] = '{C:attention}+2{} card{C:attention} selection{} limit'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    cost = 10,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-2)
    end
}