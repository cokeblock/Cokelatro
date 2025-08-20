SMODS.Joker{ --Tinystorm
    key = "tinystorm",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Tinystorm',
        ['text'] = {
            [1] = 'Does nothing.',
            [2] = 'doesnt take up a joker slot.',
            [3] = 'he is a tiny fella.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}