Tracker:AddItems("items/common.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddLocations("locations/virtual.json")

ScriptHost:LoadScript("scripts/class.lua")
ScriptHost:LoadScript("scripts/custom_item.lua")
ScriptHost:LoadScript("scripts/easy_full.lua")
ScriptHost:LoadScript("scripts/standard_full.lua")
ScriptHost:LoadScript("scripts/tricky_full.lua")
ScriptHost:LoadScript("scripts/old_standard_full.lua")
ScriptHost:LoadScript("scripts/vintage_full.lua")
ScriptHost:LoadScript("scripts/classic_key.lua")
ScriptHost:LoadScript("scripts/neo_key.lua")
ScriptHost:LoadScript("scripts/nightmare_full.lua")

local easyFullPreset = EasyFullPreset("Easy Full", "easy_full", "images/presets/easy_full.png")
local standardFullPreset = StandardFullPreset("Standard Full", "standard_full", "images/presets/standard_full.png")
local trickyFullPreset = TrickyFullPreset("Tricky Full", "tricky_full", "images/presets/tricky_full.png")
local oldStandardFullPreset = OldStandardFullPreset("Old Standard Full", "old_standard_full", "images/presets/old_standard_full.png")
local vintageFullPreset = VintageFullPreset("Vintage Full", "vintage_full", "images/presets/vintage_full.png")
local classicKeyPreset = ClassicKeyPreset("Classic Key", "classic_key", "images/presets/classic_key.png")
local neoKeyPreset = NeoKeyPreset("Neo Key", "neo_key", "images/presets/neo_key.png")
local nightmareFullPreset = NightmareFullPreset("Nightmare Full", "nightmare_full", "images/presets/nightmare_full.png")

Tracker:AddLayouts("layouts/items.json")
Tracker:AddLocations("locations/johto.json")
Tracker:AddLocations("locations/kanto.json")

Tracker:AddLayouts("layouts/tracker.json")