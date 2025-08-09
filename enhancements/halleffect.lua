SMODS.Enhancement {
    key = 'halleffect',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_chips = 1.5
        }
    },
    loc_txt = {
        name = 'Hall Effect',
        text = {
        [1] = 'Has no {C:attention}suit{}',
        [2] = '{X:blue,C:white}X1.5{} Chips'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.extra.x_chips }
        end
    end
}