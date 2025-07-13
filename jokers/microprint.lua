SMODS.Joker{ --Microprint
    name = "Microprint",
    key = "microprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Microprint',
        ['text'] = {
            [1] = '{C:green}1 in 6 chance{} to copy',
            [2] = '{C:attention}ability{} of joker to the {C:attention}right{}'
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end
}