local boosterRate = 1.2

local atomic_create_card = function()
    return {
        set = "atomic",
        soulable = true,
        skip_materialize = true
    }
end

local booster_txt = {
    "Choose {C:attention}#1#{} of up to",
    "{C:attention}#2# Atomic{} cards to",
    "be used immediately"
}

SMODS.Booster{
    key = "atomic_booster_small1",
    loc_txt = {
        name = "Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 0, y = 0 },
    config = {
        extra = 4,
        choose = 1
    },
    weight = boosterRate,
    cost = 2,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_small2",
    loc_txt = {
        name = "Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 1, y = 0 },
    config = {
        extra = 4,
        choose = 1
    },
    weight = boosterRate,
    cost = 2,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_small3",
    loc_txt = {
        name = "Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 2, y = 0 },
    config = {
        extra = 4,
        choose = 1
    },
    weight = boosterRate,
    cost = 2,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_small4",
    loc_txt = {
        name = "Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 3, y = 0 },
    config = {
        extra = 4,
        choose = 1
    },
    weight = boosterRate,
    cost = 2,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_medium1",
    loc_txt = {
        name = "Jumbo Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 0, y = 1 },
    config = {
        extra = 6,
        choose = 1
    },
    weight = boosterRate / 2,
    cost = 4,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_medium2",
    loc_txt = {
        name = "Jumbo Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 1, y = 1 },
    config = {
        extra = 60,
        choose = 1
    },
    weight = boosterRate / 2,
    cost = 4,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_large1",
    loc_txt = {
        name = "Mega Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 2, y = 1 },
    config = {
        extra = 6,
        choose = 2
    },
    weight = boosterRate / 8,
    cost = 6,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}

SMODS.Booster{
    key = "atomic_booster_large2",
    loc_txt = {
        name = "Mega Atomic Booster",
        text = booster_txt
    },
    atlas = "atomic_pack_atlas",
    pos = { x = 3, y = 1 },
    config = {
        extra = 6,
        choose = 2
    },
    weight = boosterRate / 8,
    cost = 6,
    group_key = "k_rift_atomic",
    draw_hand = true,
    kind = "atomic",
    create_card = atomic_create_card
}