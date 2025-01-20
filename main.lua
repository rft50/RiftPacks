SMODS.Atlas{
    key = "atomic_atlas",
    path = "atomic_sheet.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = "atomic_pack_atlas",
    path = "atomic_packs.png",
    px = 71,
    py = 95
}

local codeFiles = {
    "atomic/consumable.lua",
    "atomic/booster.lua",
    "atomic/neutronium.lua",
    "atomic/joker.lua"
}

for i = 1, #codeFiles do
    local file, exception = SMODS.load_file(codeFiles[i])
    if exception then
        error(exception)
    end
    file()
end