SMODS.Joker{ --Stack overflow
    key = "stackoverflow",
    config = {
        extra = {
            w = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stack overflow',
        ['text'] = {
            [1] = 'Scored {C:green}B{}{s:0.5}r{}{C:hearts}ok{}{s:1.2}E{}{X:legendary,C:white}n{} cards Give an {C:attention}additonal{}',
            [2] = '{X:red,C:white}X1{} to {X:red,C:white}X2.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_cokelatr_broken"] == true then
                local w_value = card.ability.extra.w
                card.ability.extra.w = (card.ability.extra.w) + pseudorandom('w_3f4639ce', 1, 250)
                card.ability.extra.w = (card.ability.extra.w) / 100
                return {
                    Xmult = w_value
                }
            end
        end
    end
}