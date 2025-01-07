local ranks = {
    "Ace",
    "2",
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    "10",
    "Jack",
    "Queen",
    "King"
}

local function atomic_flip(card, rank)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            card:flip()
            play_sound('tarot1', 1.15 - rank/100, 0.6)
            return true
        end
    }))
end

local function atomic_unflip(card, rank)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            card:flip()
            SMODS.change_base(card, nil, ranks[rank])
            play_sound('tarot2', 0.85 + rank/100, 0.6)
            card:juice_up(0.3, 0.3)
            return true
        end
    }))
end

local function atomic_single(rank)
    for i = 1, #G.hand.highlighted do
        atomic_flip(G.hand.highlighted[i], rank)
    end
    delay(0.2)
    for i = 1, #G.hand.highlighted do
        atomic_unflip(G.hand.highlighted[i], rank)
    end
end

local function atomic_pair(rankL, rankR)
    local left = G.hand.highlighted[1]
    local right = G.hand.highlighted[2]
    if (G.hand.highlighted[2].T.x < G.hand.highlighted[1].T.x) then
        left = G.hand.highlighted[2]
        right = G.hand.highlighted[1]
    end
    atomic_flip(left, rankL)
    atomic_flip(right, rankR)
    delay(0.2)
    atomic_unflip(left, rankL)
    atomic_unflip(right, rankR)
end

SMODS.ConsumableType{
    key = "atomic",
    primary_colour = HEX("665f2d"),
    secondary_colour = HEX("999999"),
    collection_rows = { 4, 5, 4 },
    shop_rate = 2,
    loc_txt = {
        collection = "Atomic Cards",
        name = "Atomic",
        label = "Atomic",
        undiscovered = {
            name = "Undiscovered Element",
            text = { "Use this element", "to discover its ability!" }
        }
    },
    default = "rift_atomic-hydrogen",
    can_stack = true,
    can_divide = true
}

local single_data = {
    {"hydrogen", "Hydrogen", {x=0, y=0}, 1},
    {"helium", "Helium", {x=1, y=0}, 2},
    {"lithium", "Lithium", {x=2, y=0}, 3},
    {"beryllium", "Beryllium", {x=3, y=0}, 4},
    {"boron", "Boron", {x=4, y=0}, 5},
    {"carbon", "Carbon", {x=5, y=0}, 6},
    {"nitrogen", "Nitrogen", {x=6, y=0}, 7},
    {"oxygen", "Oxygen", {x=0, y=1}, 8},
    {"flourine", "Flourine", {x=1, y=1}, 9},
    {"neon", "Neon", {x=2, y=1}, 10},
    {"sodium", "Sodium", {x=3, y=1}, 11},
    {"magnesium", "Magnesium", {x=4, y=1}, 12},
    {"aluminium", "Aluminium", {x=5, y=1}, 13}
}

for i = 1, #single_data do
    local data = single_data[i]
    SMODS.Consumable{
        object_type = "Consumable",
        set = "atomic",
        name = "atomic-"..data[1],
        key = data[1],
        atlas = "atomic_atlas",
        pos = data[3],
        loc_txt = {
            name = data[2],
            text = {
                "Set the rank of up to",
                "{C:attention}#1#{} selected cards to {C:attention}"..ranks[data[4]].."{}"
            }
        },
        cost = 3,
        discovered = true,
        order = i,
        config = {
            extra = {
                max_highlighted = 2
            }
        },
        can_use = function(self, card)
            return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted
        end,
        use = function(self, card, area)
            atomic_single(data[4])
        end,
        loc_vars = function(self, info_queue, center)
            return {vars = {center.ability.extra.max_highlighted}}
        end
    }
end

local pair_data = {
    {"cobalt", "Cobalt", {x=5, y=2}, 1, 2},
    {"nickel", "Nickel", {x=6, y=2}, 2, 4},
    {"copper", "Copper", {x=0, y=3}, 3, 6},
    {"zinc", "Zinc", {x=1, y=3}, 4, 8},
    {"iron", "Iron", {x=4, y=2}, 5, 10},
    {"titanium", "Titanium", {x=0, y=2}, 7, 11},
    {"vanadium", "Vanadium", {x=1, y=2}, 9, 12},
    {"chromium", "Chromium", {x=2, y=2}, 11, 13},
    {"manganese", "Manganese", {x=3, y=2}, 13, 1}
}

for i = 1, #pair_data do
    local data = pair_data[i]
    SMODS.Consumable{
        object_type = "Consumable",
        set = "atomic",
        name = "atomic-"..data[1],
        key = data[1],
        atlas = "atomic_atlas",
        pos = data[3],
        loc_txt = {
            name = data[2],
            text = {
                "Select {C:attention}2{} cards,",
                "the left becomes {C:attention}"..ranks[data[4]].."{},",
                "the right becomes {C:attention}"..ranks[data[5]].."{}"
            }
        },
        cost = 3,
        discovered = true,
        order = 13 + i,
        can_use = function(self, card)
            return #G.hand.highlighted == 2
        end,
        use = function(self, card, area)
            atomic_pair(data[4], data[5])
        end
    }
end

SMODS.Consumable{
    object_type = "Consumable",
    set = "atomic",
    name = "atomic-silicon",
    key = "silicon",
    atlas = "atomic_atlas",
    pos = {
        x = 6,
        y = 1
    },
    loc_txt = {
        name = "Silicon",
        text = {
            "Gives up to {C:attention}#1#{} selected",
            "cards {C:chips}+#2#{} extra chips"
        }
    },
    cost = 3,
    discovered = true,
    order = 23,
    config = {
        extra = {
            max_highlighted = 2,
            bonus = 10
        }
    },
    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted
    end,
    use = function(self, card, area)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot1', 1.1, 0.6)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local c = G.hand.highlighted[i]
                    c:flip()
                    play_sound('tarot2', 0.9, 0.6)
                    c:juice_up(0.3, 0.3)
                    c.ability.perma_bonus = c.ability.perma_bonus + card.ability.extra.bonus
                    return true
                end
            }))
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.max_highlighted, center.ability.extra.bonus}}
    end
}

SMODS.Consumable{
    object_type = "Consumable",
    set = "atomic",
    name = "atomic-uranium",
    key = "uranium",
    atlas = "atomic_atlas",
    pos = {
        x = 3,
        y = 3
    },
    loc_txt = {
        name = "Uranium",
        text = {
            "Set the rank of up to {C:attention}#1#{}",
            "selected cards to random ranks,",
            "gain {C:money}$#2#{} per card selected"
        }
    },
    cost = 3,
    discovered = true,
    order = 24,
    config = {
        extra = {
            max_highlighted = 2,
            money = 5
        }
    },
    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted
    end,
    use = function(self, card, area)
        local newRanks = {}
        for i = 1, #G.hand.highlighted do
            newRanks[i] = math.floor(pseudorandom(pseudoseed("atomic")) * 13) + 1
            atomic_flip(G.hand.highlighted[i], newRanks[i])
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('timpani')
                ease_dollars(5 * #G.hand.highlighted, true)
                return true
            end
        }))
        delay(0.4)
        for i = 1, #G.hand.highlighted do
            atomic_unflip(G.hand.highlighted[i], newRanks[i])
        end
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.max_highlighted, center.ability.extra.money}}
    end
}

SMODS.Consumable{
    object_type = "Consumable",
    set = "atomic",
    name = "atomic-francium",
    key = "francium",
    atlas = "atomic_atlas",
    pos = {
        x = 2,
        y = 3
    },
    loc_txt = {
        name = "Francium",
        text = {
            "Selected card gives {C:chips}x#1#{} of its",
            "chips to all other cards in hand, then",
            "loses them and becomes a random rank"
        }
    },
    cost = 3,
    discovered = true,
    order = 25,
    config = {
        extra = {
            mult = 0.5
        }
    },
    can_use = function(self, card)
        return #G.hand.highlighted == 1
    end,
    use = function(self, card, area)
        local newRank = math.floor(pseudorandom(pseudoseed("atomic")) * 13) + 1
        local selected = G.hand.highlighted[1]
        local bonus = (selected.base.nominal + selected.ability.bonus + selected.ability.perma_bonus) * card.ability.extra.mult
        atomic_flip(selected, newRank)
        for i = 1, #G.hand.cards do
            if G.hand.cards[i] ~= selected then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        local card = G.hand.cards[i]
                        card.ability.perma_bonus = card.ability.perma_bonus + bonus
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
        delay(0.4)
        atomic_unflip(selected, newRank)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0,
            func = function()
                selected.ability.perma_bonus = 0
                return true
            end
        }))
    end,
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end
}

SMODS.Consumable{
    object_type = "Consumable",
    set = "atomic",
    name = "atomic-elementx",
    key = "elementx",
    atlas = "atomic_atlas",
    pos = {
        x = 4,
        y = 3
    },
    loc_txt = {
        name = "Element X",
        text = {
            "Creates the element that best represents",
            "the current hand, or a random utility element",
            "if no such element exists"
        }
    },
    cost = 3,
    discovered = true,
    order = 26,
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area)
        local nums = {}

        for i = 1, #G.hand.cards do
            local rank = G.hand.cards[i]:get_id()
            if rank == 14 then
                table.insert(nums, 1)
            else
                table.insert(nums, rank)
            end
        end

        local numcountmap = {}
        local numcounts = {}
        for i = 1, #nums do
            num = nums[i]
            if numcountmap[num] then
                numcountmap[num].count = numcountmap[num].count + 1
            else
                numcountmap[num] = { num = num, count = 1 }
                table.insert(numcounts, numcountmap[num])
            end
        end
        table.sort(numcounts, function(a, b) return a.count > b.count end)

        local consumable
        if #numcounts == 1 or numcounts[1].count > numcounts[2].count then
            for i = 1, #single_data do
                if single_data[i][4] == numcounts[1].num then
                    consumable = single_data[i][1]
                end
            end
        elseif #numcounts == 2 or #numcounts >= 3 and numcounts[1].count == numcounts[2].count and numcounts[1].count > numcounts[3].count then
            local first = numcounts[1].num
            local second = numcounts[2].num
            for i = 1, #pair_data do
                local data = pair_data[i]
                if data[4] == first and data[5] == second
                or data[4] == second and data[5] == first then
                    consumable = data[1]
                end
            end
        end

        if not consumable then
            local options = {
                "silicon",
                "uranium",
                "francium",
            }
            --consumable = options[math.floor(pseudorandom(pseudoseed("atomic")) * #options) + 1]
            consumable = pseudorandom_element(options, pseudoseed("atomic"))
        end

        G.consumeables:emplace(SMODS.create_card{
            key = "c_rift_"..consumable
        })
    end
}