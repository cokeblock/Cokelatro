SMODS.Joker{ --Reaching Hand
    key = "reachinghand",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Reaching Hand',
        ['text'] = {
            [1] = '{C:attention}+2{} {C:clubs}hand{} selection limit'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    cost = 10,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-2)
    end
}