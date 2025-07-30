SMODS.Booster {
    key = 'ethereal_pack',
    loc_txt = {
        name = "Ethereal pack",
        text = {
            "Choose 1 of up to 2 ethereal cards"
        },
        group_name = "ethereal"
    },
    config = { extra = 2, choose = 1 },
    cost = 6,
    weight = 2,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'Standard ethereal',
    group_key = "ethereal",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.9,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('cokelatr_ethereal_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "ether",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_ethereal_pack"
            }
        elseif selected_index == 2 then
            return {
            set = "primes",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_ethereal_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("59009e"))
        ease_background_colour({ new_colour = HEX('59009e'), special_colour = HEX("000000"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_ethereal_pack',
    loc_txt = {
        name = "Mega Ethereal Pack",
        text = {
            "Choose 2 of up to 4 ethereal cards"
        },
        group_name = "ethereal"
    },
    config = { extra = 4, choose = 2 },
    cost = 10,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'Standard ethereal',
    group_key = "ethereal",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.9,
            0.2
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('cokelatr_mega_ethereal_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "ether",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_mega_ethereal_pack"
            }
        elseif selected_index == 2 then
            return {
            set = "primes",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_mega_ethereal_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("1d014e"))
        ease_background_colour({ new_colour = HEX('1d014e'), special_colour = HEX("000000"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_ethereal_pack',
    loc_txt = {
        name = "Jumbo Ethereal Pack",
        text = {
            "Choose 1 of up to 3 ethereal cards"
        },
        group_name = "ethereal"
    },
    config = { extra = 3, choose = 1 },
    cost = 8,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'Standard ethereal',
    group_key = "ethereal",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.9,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('cokelatr_jumbo_ethereal_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "ether",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_jumbo_ethereal_pack"
            }
        elseif selected_index == 2 then
            return {
            set = "primes",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_jumbo_ethereal_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("36005c"))
        ease_background_colour({ new_colour = HEX('36005c'), special_colour = HEX("000000"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'upgraded_buffoon_pack',
    loc_txt = {
        name = "Upgraded Buffoon Pack",
        text = {
            "Choose 1 of up to 2 high tier Jokers"
        },
        group_name = "Buffoon"
    },
    config = { extra = 2, choose = 1 },
    cost = 8,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    kind = 'Buffon',
    group_key = "Buffoon",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1.8,
            1.3,
            0.2
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('cokelatr_upgraded_buffoon_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "Joker",
            rarity = 3,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_upgraded_buffoon_pack"
            }
        elseif selected_index == 2 then
            return {
            set = "Joker",
            rarity = "cokelatr_incredulous",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_upgraded_buffoon_pack"
            }
        elseif selected_index == 3 then
            return {
            set = "Joker",
            rarity = 4,
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "cokelatr_upgraded_buffoon_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("5e0000"))
        ease_background_colour({ new_colour = HEX('5e0000'), special_colour = HEX("ff0919"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
