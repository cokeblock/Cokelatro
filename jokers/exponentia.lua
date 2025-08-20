SMODS.Joker{ --Referencia
    key = "exponentia",
    config = {
        extra = {
            reference = 1
        }
    },
    loc_txt = {
        ['name'] = 'Referencia',
        ['text'] = {
            [1] = 'Gains {C:dark_edition}^0.03 mult{} when a card with an',
            [2] = '{C:edition}Edition {}or an {C:attention}Enhancement{} is scored',
            [3] = '{C:inactive}(currently {}{C:dark_edition}^#1#{} {C:inactive}mult){}',
            [4] = '{C:inactive,s:0.7,E:1}Better than exponentia!{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    cost = 300,
    rarity = "cokelatr_transcendant",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.reference}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)() or context.other_card.edition ~= nil) then
                card.ability.extra.reference = (card.ability.extra.reference) + 0.03
                return {
                    message = "UPGRADE!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.reference
                }
        end
    end
}