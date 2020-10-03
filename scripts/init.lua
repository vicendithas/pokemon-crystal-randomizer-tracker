Tracker:AddItems("items/common.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddLocations("locations/virtual.json")

ScriptHost:LoadScript("scripts/class.lua")
ScriptHost:LoadScript("scripts/custom_item.lua")
ScriptHost:LoadScript("scripts/standardpreset.lua")
ScriptHost:LoadScript("scripts/trickypreset.lua")

local standardPreset = StandardPresetItem("Standard Preset", "standard_preset", "images/other/standard.png")
local trickyPreset = TrickyPresetItem("Tricky Preset", "tricky_preset", "images/other/tricky.png")

if Tracker.ActiveVariantUID == "keyitem" then
	Tracker:AddLayouts("layouts/items_keyitem.json")
	Tracker:AddLocations("locations/johto_keyitem.json")
	Tracker:AddLocations("locations/kanto_keyitem.json")
end

if Tracker.ActiveVariantUID == "fullitem" then
	Tracker:AddLayouts("layouts/items_fullitem.json")
	Tracker:AddLocations("locations/johto_fullitem.json")
	Tracker:AddLocations("locations/kanto_fullitem.json")
end

Tracker:AddLayouts("layouts/tracker.json")