Tracker:AddItems("items/common.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddLocations("locations/virtual.json")

ScriptHost:LoadScript("scripts/class.lua")
ScriptHost:LoadScript("scripts/custom_item.lua")
ScriptHost:LoadScript("scripts/preset.lua")
-- ScriptHost:LoadScript("scripts/easy_full.lua")
-- ScriptHost:LoadScript("scripts/standard_full.lua")
-- ScriptHost:LoadScript("scripts/tricky_full.lua")
-- ScriptHost:LoadScript("scripts/chaos_full.lua")
-- ScriptHost:LoadScript("scripts/vintage_full.lua")
-- ScriptHost:LoadScript("scripts/classic_key.lua")
-- ScriptHost:LoadScript("scripts/neo_key.lua")
-- ScriptHost:LoadScript("scripts/nightmare_full.lua")

local easyFullPreset = Preset("Easy Full", "easy_full", "images/presets/easy_full.png")
local standardFullPreset = Preset("Standard Full", "standard_full", "images/presets/standard_full.png")
local trickyFullPreset = Preset("Tricky Full", "tricky_full", "images/presets/tricky_full.png")
local chaosFullPreset = Preset("Chaos Full", "chaos_full", "images/presets/chaos_full.png")
local vintageFullPreset = Preset("Vintage Full", "vintage_full", "images/presets/vintage_full.png")
local classicKeyPreset = Preset("Classic Key", "classic_key", "images/presets/classic_key.png")
local neoKeyPreset = Preset("Neo Key", "neo_key", "images/presets/neo_key.png")
local nightmareFullPreset = Preset("Nightmare Full", "nightmare_full", "images/presets/nightmare_full.png")

Tracker:AddLayouts("layouts/items.json")

ScriptHost:LoadScript("scripts/loadlocations.lua")
-- Tracker:AddLocations("locations/johto.json")
-- Tracker:AddLocations("locations/kanto.json")

Tracker:AddLayouts("layouts/tracker.json")