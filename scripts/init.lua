Tracker:AddItems("items/common.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddLocations("locations/virtual.json")

ScriptHost:LoadScript("scripts/class.lua")
ScriptHost:LoadScript("scripts/custom_item.lua")
ScriptHost:LoadScript("scripts/preset.lua")

local fullEasy					=	Preset("Easy Full",						"full_easy",					"images/presets/full_easy.png")
local fullStandard				=	Preset("Standard Full",					"full_standard",				"images/presets/full_standard.png")
local fullVintage				=	Preset("Vintage Full",					"full_vintage",					"images/presets/full_vintage.png")

local fullTrickyExtreme			=	Preset("Tricky / Extreme Full",			"full_tricky_extreme",			"images/presets/full_tricky_extreme.png")
local fullChaos					=	Preset("Chaos Full",					"full_chaos",					"images/presets/full_chaos.png")
local fullCrazy					=	Preset("Crazy Full",					"full_crazy",					"images/presets/full_crazy.png")

local fullCrazyChaos			=	Preset("Crazy Chaos Full",				"full_crazy_chaos",				"images/presets/full_crazy_chaos.png")
local fullNightmare				=	Preset("Nightmare Full",				"full_nightmare",				"images/presets/full_nightmare.png")
local fullChaosNightmare		=	Preset("Chaos Nightmare Full",			"full_chaos_nightmare",			"images/presets/full_chaos_nightmare.png")

local keyEasyClassic			=	Preset("Easy / Classic Key",			"key_easy_classic",				"images/presets/key_easy_classic.png")
local keyTrickyExtreme			=	Preset("Tricky / Extreme Key",			"key_tricky_extreme",			"images/presets/key_tricky_extreme.png")

Tracker:AddLayouts("layouts/items.json")

ScriptHost:LoadScript("scripts/loadlocations.lua")

Tracker:AddLayouts("layouts/tracker.json")