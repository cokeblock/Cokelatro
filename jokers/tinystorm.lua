SMODS.Joker{ --Tinystorm
    name = "Tinystorm",
    key = "tinystorm",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Tinystorm',
        ['text'] = {
            [1] = '{C:green}1 in 3 chance{} to copy',
            [2] = 'leftmost jokers {C:attention}ability{}',
            [3] = '{C:inactive}(he\'s a lil guy){}'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end
}