SMODS.Joker{ --RAH
    key = "rah",
    config = {
        extra = {
            wwww = -100000
        }
    },
    loc_txt = {
        ['name'] = 'RAH',
        ['text'] = {
            [1] = '{C:red,E:1,s:2}Kills you.{}',
            [2] = '',
            [3] = '{C:inactive}NO SHITPOSTS IN MY MOD{}',
            [4] = '{s:0.6,C:inactive}my friend wouldnt shut up about adding this{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:set_edition("e_holo", true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.wwww,
                    message = "FUCK YOU!"
                }
        end
    end
}