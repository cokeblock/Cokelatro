SMODS.Joker{ --Cokeblock4043
    key = "me",
    config = {
        extra = {
            blocmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cokeblock4043',
        ['text'] = {
            [1] = 'Gains {C:dark_edition}^0.443{}{} Mult if played hand',
            [2] = '{C:attention}contains{} a scoring {E:1}4, Ace, or 3{}',
            [3] = '{C:inactive}(currently{} {C:dark_edition}^#1#{}{} {C:inactive}Mult){}',
            [4] = '{C:inactive,s:0.8}is that a reference?{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 1000,
    rarity = "cokelatr_transcendant",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 0,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.blocmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 4 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() then
                card.ability.extra.blocmult = (card.ability.extra.blocmult) + 0.443
                return {
                    message = "NOPE!",
                    extra = {
                        e_mult = card.ability.extra.blocmult,
                        colour = G.C.DARK_EDITION
                        }
                }
            elseif (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 3 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() then
                card.ability.extra.blocmult = (card.ability.extra.blocmult) + 0.443
                return {
                    message = "HUH?!",
                    extra = {
                        e_mult = card.ability.extra.blocmult,
                        colour = G.C.DARK_EDITION
                        }
                }
            elseif (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 14 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() then
                card.ability.extra.blocmult = (card.ability.extra.blocmult) + 0.443
                return {
                    message = "MULTED",
                    extra = {
                        e_mult = card.ability.extra.blocmult,
                        colour = G.C.DARK_EDITION
                        }
                }
            else
                return {
                    e_mult = card.ability.extra.blocmult
                }
            end
        end
    end
}