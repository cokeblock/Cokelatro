SMODS.Joker{ --Thats Just a Joker
    name = "Thats Just a Joker",
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
        x = 1,
        y = 3
    },
    cost = 8,
    rarity = "cokelatr_unobtainable",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('perishable', true)
    end,

    calculate = function(self, card, context)
        local target_joker = nil
        
        target_joker = G.jokers.cards[1]
        if target_joker == card then
            target_joker = nil
        end
        
        return SMODS.blueprint_effect(card, target_joker, context)
    end
}