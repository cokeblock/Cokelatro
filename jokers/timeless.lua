SMODS.Joker{ --Timeless
    key = "timeless",
    config = {
        extra = {
            currentminutes = 0,
            currentseconds = 0,
            currentmonth = 0,
            currentyear = 0
        }
    },
    loc_txt = {
        ['name'] = 'Timeless',
        ['text'] = {
            [1] = '{X:red,C:white}X0.1{} Mult for every second',
            [2] = '{X:blue,C:white}X0.1{} Chips for every minute',
            [3] = '{C:dark_edition}^0.01{} Mult for every year',
            [4] = '{C:edition}^0.5{} Chips for every month'
        }
    },
    pos = {
        x = 3,
        y = 8
    },
    cost = 500,
    rarity = "cokelatr_transcendant",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = (os.date("*t", os.time()).min) * 0.1,
                    extra = {
                        Xmult = (os.date("*t", os.time()).sec) * 0.1,
                        extra = {
                            e_chips = (os.date("*t", os.time()).month) * 0.5,
                            colour = G.C.DARK_EDITION,
                        extra = {
                            e_mult = (os.date("*t", os.time()).year) * 0.01,
                            colour = G.C.DARK_EDITION
                        }
                        }
                        }
                }
        end
    end
}