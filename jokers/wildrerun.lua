SMODS.Joker{ --Wild Re-Run
    name = "Wild Re-Run",
    key = "wildrerun",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Wild Re-Run',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all scored',
            [2] = 'cards with {C:attention,E:2}WILD{} suit 2 {C:attention}additional{} times'
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "WILD!"
                }
            end
        end
    end
}