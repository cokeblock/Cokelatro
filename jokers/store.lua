SMODS.Joker{ --Coupon
    name = "Coupon",
    key = "store",
    config = {
        extra = {
            percentprice = -25,
            voucher = 0
        }
    },
    loc_txt = {
        ['name'] = 'Coupon',
        ['text'] = {
            [1] = 'Create a {C:attention}Voucher{} tag',
            [2] = 'at end of shop'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint then
                return {
                    func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_voucher")
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                    return true
                end,
                    message = "+1 VOUCHER!"
                }
        end
    end
}