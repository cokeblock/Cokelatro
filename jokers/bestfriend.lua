SMODS.Joker{ --Best Friend
    key = "bestfriend",
    config = {
        extra = {
            bestest = 1,
            scale = 0.2,
            rotation = 180,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'Best Friend',
        ['text'] = {
            [1] = '{C:red,E:1}Destroys{} all {C:attention}scored {}cards.',
            [2] = 'Gains {X:red,C:white}X0.2{} Mult per {C:red,E:1}destroyed{} card',
            [3] = '{C:inactive}(currently{} {X:red,C:white}X1 {}{C:inactive} Mult){}',
            [4] = '{C:inactive,E:1,s:0.8}You\'ll stay with me forever, right?{}'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 10,
    rarity = "cokelatr_uncommoner",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
                context.other_card.should_destroy = true
                card.ability.extra.bestest = (card.ability.extra.bestest) + 0.2
                local target_card = context.other_card
                return {
                    func = function()
                      target_card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.bestest
                }
        end
    end
}