SMODS.Consumable{
    object_type = "Consumable",
    set = "atomic",
    name = "atomic-neutronium",
    key = "neutronium",
    atlas = "atomic_atlas",
    pos = {
        x = 5,
        y = 3
    },
    soul_pos = {
        x = 6,
        y = 3
    },
    hidden = true,
    soul_set = "Spectral",
    soul_rate = 0.003,
    loc_txt = {
        name = "Neutronium",
        text = {
            "This card isn't implemented yet",
            "so have {C:money}$20{} instead"
        }
    },
    cost = 4,
    discovered = true,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('timpani')
                ease_dollars(20, true)
                return true
            end
        }))
    end
}