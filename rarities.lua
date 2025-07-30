SMODS.Rarity {
    key = "transcendant",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.02,
    badge_colour = HEX('1a00fb'),
    loc_txt = {
        name = "Transcendant"
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
    default_weight = 0.011,
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
    default_weight = 0,
    badge_colour = HEX('08ae8e'),
    loc_txt = {
        name = "Almanetic"
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

SMODS.Rarity {
    key = "incomprehensible",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('6A7A8B'),
    loc_txt = {
        name = "Incomprehensible"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "unobtainable",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('000000'),
    loc_txt = {
        name = "Unobtainable"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}