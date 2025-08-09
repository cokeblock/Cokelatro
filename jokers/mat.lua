SMODS.Joker{ --Thats Just a Joker
    key = "mat",
    config = {
        extra = {
            JOKER = 1
        }
    },
    loc_txt = {
        ['name'] = 'Thats Just a Joker',
        ['text'] = {
            [1] = '{C:attention}Copies{} a random',
            [2] = 'jokers {C:attention}ability{} every hand',
            [3] = '',
            [4] = '{C:inactive,s:2}(BROKEN){}'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    cost = 8,
    rarity = "cokelatr_unobtainable",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end
}