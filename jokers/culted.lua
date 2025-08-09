SMODS.Joker{ --The one who jokes
    key = "culted",
    config = {
        extra = {
            spad = 0,
            hurt = 0,
            cub = 0,
            die = 0,
            Xmultvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'The one who jokes',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X2{} Mult when a',
            [2] = '{C:clubs}club{}, spade, {C:diamonds}diamond{}, and {C:hearts}heart{}',
            [3] = 'card are {}{C:attention}destroyed{}',
            [4] = '{C:inactive}(currently{} {X:red,C:white}X#5#{} {C:inactive}Mult){}',
            [5] = '{C:inactive}cards must be destroyed {C:attention}individually{}{}'
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    cost = 9,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 7
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.spad, card.ability.extra.hurt, card.ability.extra.cub, card.ability.extra.die, card.ability.extra.Xmultvar}}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if ((function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card:is_suit("Spades") then
            return true
        end
    end
    return false
end)() and (card.ability.extra.spad or 0) == 0) then
                return {
                    func = function()
                    card.ability.extra.spad = 1
                    return true
                end,
                    message = "MARTYRED!"
                }
            elseif ((function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card:is_suit("Hearts") then
            return true
        end
    end
    return false
end)() and (card.ability.extra.hurt or 0) == 0) then
                return {
                    func = function()
                    card.ability.extra.hurt = 1
                    return true
                end,
                    message = "MARTYRED!"
                }
            elseif ((function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card:is_suit("Diamonds") then
            return true
        end
    end
    return false
end)() and (card.ability.extra.die or 0) == 0) then
                return {
                    func = function()
                    card.ability.extra.die = 1
                    return true
                end,
                    message = "MARTYRED!"
                }
            elseif ((function()
    for k, removed_card in ipairs(context.removed) do
        if removed_card:is_suit("Clubs") then
            return true
        end
    end
    return false
end)() and (card.ability.extra.cub or 0) == 0) then
                return {
                    func = function()
                    card.ability.extra.cub = 1
                    return true
                end,
                    message = "MARTYRED!"
                }
            elseif (function()
    for k, removed_card in ipairs(context.removed) do
        if SMODS.get_enhancements(removed_card)["m_wild"] == true then
            return true
        end
    end
    return false
end)() then
                return {
                    func = function()
                    card.ability.extra.Xmultvar = (card.ability.extra.Xmultvar) + 2
                    return true
                end,
                    message = "HERETICS DEFEATED!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if ((card.ability.extra.spad or 0) == 1 and (card.ability.extra.hurt or 0) == 1 and (card.ability.extra.cub or 0) == 1 and (card.ability.extra.die or 0) == 1) then
                card.ability.extra.Xmultvar = (card.ability.extra.Xmultvar) + 2
                card.ability.extra.spad = 0
                card.ability.extra.hurt = 0
                card.ability.extra.cub = 0
                card.ability.extra.die = 0
                return {
                    message = "HERETICS DEFEATED!",
                    extra = {
                        Xmult = card.ability.extra.Xmultvar,
                        extra = {
                            message = "RESET!",
                            colour = G.C.BLUE,
                        extra = {
                            message = "RESET!",
                            colour = G.C.BLUE,
                        extra = {
                            message = "RESET!",
                            colour = G.C.BLUE,
                        extra = {
                            message = "RESET!",
                            colour = G.C.BLUE
                        }
                        }
                        }
                        }
                        }
                }
            else
                return {
                    Xmult = card.ability.extra.Xmultvar
                }
            end
        end
    end
}