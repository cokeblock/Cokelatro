SMODS.Joker{ --Fallen angel
    name = "Fallen angel",
    key = "fallenangel",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Fallen angel',
        ['text'] = {
            [1] = '{X:black,C:red,s:1.3} ^^^1.1 {} Mult, increases by {X:black,C:red} ^^^1.5 {} Mult',
            [2] = 'per {X:planet,C:white,E:2,s:1.2} Almanetic {} joker owned',
            [3] = '{s:1.5}Currently broken'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    cost = 0,
    rarity = "cokelatr_unobtainable",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end
}