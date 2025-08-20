SMODS.Enhancement {
    key = 'broken',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            NUMBERS = 1
        }
    },
    loc_txt = {
        name = 'Broken',
        text = {
        [1] = 'Gives between {X:red,C:white}X3{} to {X:red,C:white}X0.75{} Mult when scored'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.NUMBERS = pseudorandom('NUMBERS_56c14e74', 300, 75)
            card.ability.extra.NUMBERS = (card.ability.extra.NUMBERS) / 100
            SMODS.calculate_effect({x_mult = card.ability.extra.NUMBERS}, card)
        end
    end
}