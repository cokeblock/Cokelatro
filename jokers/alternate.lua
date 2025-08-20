SMODS.Joker{ --Nothing is worth the joke.
    key = "alternate",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Nothing is worth the joke.',
        ['text'] = {
            [1] = '{X:red,C:white}Co{}PPies {C:clubs}Ab{}iility {E:1}O{X:legendary,C:white}f{}f{}101',
            [2] = '{C:attention}Leff{C:spectral}t{}-st {C:dark_edition}jo7{}keRR{}',
            [3] = '{C:inactive,E:1}(credit: Toxic){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}