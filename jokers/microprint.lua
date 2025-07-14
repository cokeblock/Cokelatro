SMODS.Joker{ --Microprint
    name = "Microprint",
    key = "microprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Microprint',
        ['text'] = {
            [1] = 'Does nothing.',
            [2] = 'doesnt take up a joker slot.',
            [3] = 'he is a tiny fella.'
        }
    },
    pos = {
        x = 4,
        y = 6
    },
    cost = 1,
    rarity = "cokelatr_pointless",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}