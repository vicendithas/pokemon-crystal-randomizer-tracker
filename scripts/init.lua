Tracker:AddItems("items/common.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddLocations("locations/virtual.json")

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