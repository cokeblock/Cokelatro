SMODS.Consumable {
    key = 'primordialrevalation',
    set = 'primes',
    pos = { x = 0, y = 1 },
    config = { extra = {
        odds = 3
    } },
    loc_txt = {
        name = 'Primordial Revalation',
        text = {
        [1] = '{C:green}1 in 3{} chance to create a random {X:planet,C:white,E:2,s:1.3}ALMANETIC {}{C:attention} Joker {}'
    }
    },
    cost = 100,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            if SMODS.pseudorandom_probability(card, 'group_0_2daaeebf', 1, card.ability.extra.odds, 'c_cokelatr') then
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      SMODS.add_card({ set = 'Joker', rarity = 'cokelatr_almanetic' })
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
            end
    end,
    can_use = function(self, card)
        return true
    end
}