SMODS.Atlas{
    key = "atomic_jokers_atlas",
    path = "joker_sheet.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = "atomic_jokers_atlas2",
    path = "joker_sheet2.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "tetravalent",
    loc_txt = {
        name = "Tetravalent Bond",
        text = {
            "Gives {X:mult,C:white}X#2#{} Mult for each {C:attention}#1#{} in your full deck",
            "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
            "{C:inactive}(Rank changes every round){}"
        },
        config = {
            extra = {
                mult = 0.25
            }
        },
        rarity = 3,
        pos = {
            x = 1,
            y = 2
        },
        atlas = "atomic_jokers_atlas",
        cost = 8,
        unlocked = true,
        discovered = false,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        calculate = function(self, card, context)

        end
    }
}

SMODS.Joker{
    key = "tetravalent2",
    loc_txt = {
        name = "Tetravalent Bond",
        text = {
            "Gives {X:mult, C:white}X#2#{} Mult for each {C:attention}#1#{} in your full deck",
            "{C:inactive}(Currently {X:mult, C:white}X#3#{C:inactive} Mult)",
            "{C:inactive}(Rank changes every round){}"
        },
        config = {
            extra = {
                mult = 0.25
            }
        },
        rarity = 3,
        pos = {
            x = 1,
            y = 2
        },
        atlas = "atomic_jokers_atlas2",
        cost = 8,
        unlocked = true,
        discovered = false,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        calculate = function(self, card, context)

        end
    }
}