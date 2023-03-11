function canFightTeamRocket()
    local badges = Tracker:ProviderCountForCode("badge")
    return badges >= 7
end

function haveAllBadges()
	local badges = Tracker:ProviderCountForCode("badge")
	return badges >= 16
end

function haveEnoughBadges()
	local badges = Tracker:ProviderCountForCode("badge")
	local badges_req = Tracker:ProviderCountForCode("badges_req_red")
	return badges >= badges_req
end
	
function haveEightBadges()
	local badges = Tracker:ProviderCountForCode("badge")
	return badges >= 8
end

function notItem(code)
	return not Tracker:FindObjectForCode(code).Active
end