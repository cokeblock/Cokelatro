SMODS.Rarity {
    key = "ascend",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.02,
    badge_colour = HEX('1a00fb'),
    loc_txt = {
        name = "Trancendant"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "incredulous",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.03,
    badge_colour = HEX('ff7906'),
    loc_txt = {
        name = "Incredulous"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "almanetic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.01,
    badge_colour = HEX('08ae8e'),
    loc_txt = {
        name = "Almanetic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "pointless",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.75,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "pointless..."
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "uncommoner",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.15,
    badge_colour = HEX('00ff57'),
    loc_txt = {
        name = "Uncommon-er"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}