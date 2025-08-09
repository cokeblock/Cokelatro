SMODS.Joker{ --Jokerbrot
    key = "mandela",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Jokerbrot',
        ['text'] = {
            [1] = 'Copies {C:attention}ability{} of {C:attention}second joker{}'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    calculate = function(self, card, context)
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        return SMODS.blueprint_effect(card, target_joker, context)
    end
}