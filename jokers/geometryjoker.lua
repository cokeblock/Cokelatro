SMODS.Joker{ --Geometry joker
    key = "geometryjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Geometry joker',
        ['text'] = {
            [1] = 'Gains{X:edition,C:dark_edition,E:1,s:1.2}^^0.4{}Mult if',
            [2] = 'played hand is {C:attention}exactly{} four cards',
            [3] = 'if played hand is {C:attention}not{}, {C:red,E:1}destroy self{}',
            [4] = '{C:hearts,e:1,s:0.8}GEOMETRY DASH{} {C:inactive,s:0.7}- MDK{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    cost = 500,
    rarity = "cokelatr_unobtainable",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
}