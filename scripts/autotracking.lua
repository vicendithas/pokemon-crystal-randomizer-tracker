print("")
print("Active Auto-Tracker Configuration")
print("---------------------------------------------------------------------")
print("Enable Item Tracking:        ", AUTOTRACKER_ENABLE_ITEM_TRACKING)
print("Enable Location Tracking:    ", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
print("Enable Debug Logging:        ", AUTOTRACKER_ENABLE_DEBUG_LOGGING)
print("---------------------------------------------------------------------")
print("")

function autotracker_started()
    -- Invoked when the auto-tracker is activated/connected
end

U8_READ_CACHE = 0
U8_READ_CACHE_ADDRESS = 0

U16_READ_CACHE = 0
U16_READ_CACHE_ADDRESS = 0

function ReadU8(segment, address)
    if U8_READ_CACHE_ADDRESS ~= address then
        U8_READ_CACHE = segment:ReadUInt8(address)
        U8_READ_CACHE_ADDRESS = address        
    end

    return U8_READ_CACHE
end

function ReadU16(segment, address)
    if U16_READ_CACHE_ADDRESS ~= address then
        U16_READ_CACHE = segment:ReadUInt16(address)
        U16_READ_CACHE_ADDRESS = address        
    end

    return U16_READ_CACHE
end

function validRead()
	local isWRAMBank1 =		( AutoTracker:ReadU8(0xFF70) & 0x07 ) == 1
	local isGameRunning =	( AutoTracker:ReadU8(0xCFBC) == 0 )
	local isOverworld =		( AutoTracker:ReadU8(0xC2CE) == 1 )
	--local isNotInMenu =		( AutoTracker:ReadU8(0xFFAA) == 0 )
	
	return ( isWRAMBank1 and isGameRunning and isOverworld ) --and isNotInMenu )
end

function searchItems(segment, num_items, item_id)
	local address = 0xD893
	for index = 0, num_items-1 , 1 do
		local curr_item = ReadU8(segment, address)
		local curr_qty = ReadU8(segment, address + 1)
		if (curr_item == item_id) and (curr_qty > 0) then
			return true
		end
		address = address + 2
	end
	
	return false
end

function searchKeyItems(segment, num_items, item_id)
	local address = 0xD8BD
	for index = 0, num_items-1 , 1 do
		local curr_item = ReadU8(segment, address)
		if (curr_item == item_id) then
			return true
		end
		address = address + 1
	end
	
	return false
end

function updateMostItems(segment)
	if not validRead() then
		return false
	end
	
	local johtobadges = ReadU8(segment, 0xD857)
	Tracker:FindObjectForCode("zephyr_badge").Active =	( johtobadges & 0x01 ) > 0
	Tracker:FindObjectForCode("hive_badge").Active =	( johtobadges & 0x02 ) > 0
	Tracker:FindObjectForCode("plain_badge").Active =	( johtobadges & 0x04 ) > 0
	Tracker:FindObjectForCode("fog_badge").Active =		( johtobadges & 0x08 ) > 0
	Tracker:FindObjectForCode("mineral_badge").Active =	( johtobadges & 0x10 ) > 0
	Tracker:FindObjectForCode("storm_badge").Active =	( johtobadges & 0x20 ) > 0
	Tracker:FindObjectForCode("glacier_badge").Active =	( johtobadges & 0x40 ) > 0
	Tracker:FindObjectForCode("rising_badge").Active =	( johtobadges & 0x80 ) > 0
	
	local kantobadges = ReadU8(segment, 0xD858)
	Tracker:FindObjectForCode("boulder_badge").Active =	( kantobadges & 0x01 ) > 0
	Tracker:FindObjectForCode("cascade_badge").Active =	( kantobadges & 0x02 ) > 0
	Tracker:FindObjectForCode("thunder_badge").Active =	( kantobadges & 0x04 ) > 0
	Tracker:FindObjectForCode("rainbow_badge").Active =	( kantobadges & 0x08 ) > 0
	Tracker:FindObjectForCode("soul_badge").Active =	( kantobadges & 0x10 ) > 0
	Tracker:FindObjectForCode("marsh_badge").Active =	( kantobadges & 0x20 ) > 0
	Tracker:FindObjectForCode("volcano_badge").Active =	( kantobadges & 0x40 ) > 0
	Tracker:FindObjectForCode("earth_badge").Active =	( kantobadges & 0x80 ) > 0
	
	Tracker:FindObjectForCode("tm08").Active =	( ReadU8(segment, 0xD860) > 0 ) or Tracker:FindObjectForCode("tm08").Active
	
	Tracker:FindObjectForCode("hm01").Active =	( ReadU8(segment, 0xD88B) > 0 )
	Tracker:FindObjectForCode("hm02").Active =	( ReadU8(segment, 0xD88C) > 0 )
	Tracker:FindObjectForCode("hm03").Active =	( ReadU8(segment, 0xD88D) > 0 )
	Tracker:FindObjectForCode("hm04").Active =	( ReadU8(segment, 0xD88E) > 0 )
	Tracker:FindObjectForCode("hm05").Active =	( ReadU8(segment, 0xD88F) > 0 )
	Tracker:FindObjectForCode("hm06").Active =	( ReadU8(segment, 0xD890) > 0 )
	Tracker:FindObjectForCode("hm07").Active =	( ReadU8(segment, 0xD891) > 0 )
	
	local num_items = math.min ( ReadU8(segment, 0xD892), 20)
	Tracker:FindObjectForCode("water_stone").Active = searchItems(segment, num_items, 0x18) or Tracker:FindObjectForCode("water_stone").Active
	
	local num_keyitems = math.min( ReadU8(segment, 0xD8BC), 25)
	Tracker:FindObjectForCode("squirt_bottle").Active =	searchKeyItems(segment, num_keyitems, 0xAF)
	Tracker:FindObjectForCode("secret_potion").Active =	searchKeyItems(segment, num_keyitems, 0x43) or Tracker:FindObjectForCode("secret_potion").Active
	Tracker:FindObjectForCode("card_key").Active =		searchKeyItems(segment, num_keyitems, 0x7F)
	Tracker:FindObjectForCode("ss_ticket").Active =		searchKeyItems(segment, num_keyitems, 0x44)
	Tracker:FindObjectForCode("pass").Active =			searchKeyItems(segment, num_keyitems, 0x86)
	Tracker:FindObjectForCode("machine_part").Active =	searchKeyItems(segment, num_keyitems, 0x80) or Tracker:FindObjectForCode("machine_part").Active
	Tracker:FindObjectForCode("clear_bell").Active =	searchKeyItems(segment, num_keyitems, 0x46)
	Tracker:FindObjectForCode("rainbow_wing").Active =	searchKeyItems(segment, num_keyitems, 0xB2)
	Tracker:FindObjectForCode("silver_wing").Active =	searchKeyItems(segment, num_keyitems, 0x47)
	Tracker:FindObjectForCode("basement_key").Active =	searchKeyItems(segment, num_keyitems, 0x85)
	Tracker:FindObjectForCode("lost_item").Active =		searchKeyItems(segment, num_keyitems, 0x82) or Tracker:FindObjectForCode("lost_item").Active
	Tracker:FindObjectForCode("red_scale").Active =		searchKeyItems(segment, num_keyitems, 0x42) or Tracker:FindObjectForCode("red_scale").Active
	Tracker:FindObjectForCode("mystery_egg").Active =	searchKeyItems(segment, num_keyitems, 0x45) or Tracker:FindObjectForCode("mystery_egg").Active
	Tracker:FindObjectForCode("bicycle").Active =		searchKeyItems(segment, num_keyitems, 0x07)
	Tracker:FindObjectForCode("blue_card").Active =		searchKeyItems(segment, num_keyitems, 0x74)
	Tracker:FindObjectForCode("coin_case").Active =		searchKeyItems(segment, num_keyitems, 0x36)
	Tracker:FindObjectForCode("item_finder").Active =	searchKeyItems(segment, num_keyitems, 0x37)
	Tracker:FindObjectForCode("old_rod").Active =		searchKeyItems(segment, num_keyitems, 0x3A)
	Tracker:FindObjectForCode("good_rod").Active =		searchKeyItems(segment, num_keyitems, 0x3B)
	Tracker:FindObjectForCode("super_rod").Active =		searchKeyItems(segment, num_keyitems, 0x3D)
end

function updatePokegear(segment)
	if not validRead() then
		return false
	end
	
	local pokegear = ReadU8(segment, 0xD957)
	Tracker:FindObjectForCode("pokegear").Active =			( pokegear & 0x80 ) > 0
	Tracker:FindObjectForCode("radio_card").Active =		( pokegear & 0x02 ) > 0
	Tracker:FindObjectForCode("expansion_card").Active =	( pokegear & 0x08 ) > 0
end

function updatePokedex(segment)
	if not validRead() then
		return false
	end
	
	Tracker:FindObjectForCode("pokedex").Active = ( ReadU8(segment, 0xD84C) & 1 ) > 0
end

ScriptHost:AddMemoryWatch("Crystal Items and Badges", 0xD857, 128, updateMostItems, 1000)
ScriptHost:AddMemoryWatch("Crystal Pokegear", 0xD957, 1, updatePokegear, 1000)
ScriptHost:AddMemoryWatch("Crystal Pokedex", 0xD84C, 1, updatePokedex, 1000)