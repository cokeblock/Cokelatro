SMODS.Consumable {
    key = 'primordialrevalation',
    set = 'primes',
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'Primordial Revalation',
        text = {
        [1] = 'Create a random',
        [2] = '{X:planet,C:white,E:2,s:1.3}ALMANETIC {}{C:attention}Joker {}',
        [3] = '',
        [4] = '{s:4}BROKEN'
    }
    },
    cost = 100,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
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
    end,
    can_use = function(self, card)
        return true
    end
}