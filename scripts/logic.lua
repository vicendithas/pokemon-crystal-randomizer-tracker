function canFightTeamRocket()
    local reqBadges = Tracker:ProviderCountForCode("team_rocket_badges")
    local badges = Tracker:ProviderCountForCode("badge")
    return badges >= reqBadges
end

function haveAllBadges()
	local badges = Tracker:ProviderCountForCode("badge")
	return badges >= 16
end
	
function haveEightBadges()
	local badges = Tracker:ProviderCountForCode("badge")
	return badges >= 8
end
