SMODS.Joker{ --M
    key = "m",
    config = {
        extra = {
            Xmult = 8
        }
    },
    loc_txt = {
        ['name'] = 'M',
        ['text'] = {
            [1] = '{X:red,C:white}X8{} Mult if played',
            [2] = 'hand is a pair',
            [3] = '{C:inactive}Cryptid reference lol{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    cost = 8,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Pair" then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}