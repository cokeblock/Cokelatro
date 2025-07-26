SMODS.Joker{ --Hiding Graphs
    name = "Hiding Graphs",
    key = "hide",
    config = {
        extra = {
            JOKE = 0,
            Xmult = 8
        }
    },
    loc_txt = {
        ['name'] = 'Hiding Graphs',
        ['text'] = {
            [1] = '{C:attention}First{} played {C:attention}face card{} gives {X:red,C:white}X8{} Mult when scored',
            [2] = 'retrigger first {C:attention}card{} played {C:attention}4 additional{} times',
            [3] = '',
            [4] = '{s:3}BROKEN{}'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (context.other_card:get_id() == 13 and (card.ability.extra.JOKE or 0) == 1) then
                card.ability.extra.JOKE = 0
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.hand_drawn and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.JOKE = 1
                    return true
                end
                }
        end
    end
}