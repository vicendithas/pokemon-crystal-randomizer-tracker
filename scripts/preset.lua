Preset = CustomItem:extend()

function Preset:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "brightness|1")
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function Preset:setActive(active)
    self:setProperty("active", active)
end

function Preset:getActive()
    return self:getProperty("active")
end

function Preset:updateIcon()
    if self:getActive() then
        self.ItemInstance.Icon = self.activeImage
    else
        self.ItemInstance.Icon = self.disabledImage
    end
end

function Preset:onLeftClick()
	--																		full			cut tree 		bw kanto		tin				berrys			phone			pointless
	--																				hidden			v clair			e4 req			day/happy		BCC				Pkmn locked		open silver
														presetSettings = {	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false}
	if	self.code == "full_easy"				then	presetSettings = {	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false}	end
	if	self.code == "full_standard"			then	presetSettings = {	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false}	end
	if	self.code == "full_vintage"				then	presetSettings = {	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false}	end

	if	self.code == "full_tricky_extreme"		then	presetSettings = {	true,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false,	false}	end
	if	self.code == "full_extreme_hidden"		then	presetSettings = {	true,	true,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false,	false}	end
	if	self.code == "full_crazy"				then	presetSettings = {	true,	false,	false,	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false}	end

	if	self.code == "full_crazy_hidden"		then	presetSettings = {	true,	true,	false,	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false}	end
	if	self.code == "full_maximum"				then	presetSettings = {	true,	true,	false,	true,	true,	false,	true,	true,	true,	true,	true,	true,	true,	true}	end
	if	self.code == "full_nightmare"			then	presetSettings = {	true,	false,	true,	true,	true,	false,	true,	true,	true,	true,	true,	true,	true,	true}	end
	
	if	self.code == "full_nightmare_hidden"	then	presetSettings = {	true,	true,	true,	true,	true,	false,	true,	true,	true,	true,	true,	true,	true,	true}	end
	if	self.code == "key_easy_classic"			then	presetSettings = {	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false}	end
	if	self.code == "key_tricky_extreme"		then	presetSettings = {	false,	false,	false,	false,	true,	false,	true,	false,	false,	false,	false,	false,	false,	false}	end
	
	Tracker:FindObjectForCode("full_item").Active = presetSettings[1]
	Tracker:FindObjectForCode("hidden_items").Active = presetSettings[2]
	Tracker:FindObjectForCode("cut_tree").Active = presetSettings[3]
	Tracker:FindObjectForCode("vanilla_clair").Active = presetSettings[4]
	Tracker:FindObjectForCode("backward_kanto").Active = presetSettings[5]
	Tracker:FindObjectForCode("elite_four_req").Active = presetSettings[6]
    Tracker:FindObjectForCode("tin_tower").Active = presetSettings[7]
	Tracker:FindObjectForCode("day_happiness").Active = presetSettings[8]
	Tracker:FindObjectForCode("berry_trees").Active = presetSettings[9]
	Tracker:FindObjectForCode("bug_catching").Active = presetSettings[10]
	Tracker:FindObjectForCode("phone_items").Active = presetSettings[11]
	Tracker:FindObjectForCode("pokemon_locked").Active = presetSettings[12]
	Tracker:FindObjectForCode("pointless_checks").Active = presetSettings[13]
	Tracker:FindObjectForCode("open_silver").Active = presetSettings[14]
end

function Preset:onRightClick()
	
end

function Preset:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function Preset:providesCode(code)
    if code == self.code and self.getActive() then
        return 1
    end
    return 0
end

function Preset:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function Preset:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function Preset:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function Preset:propertyChanged(key, value)
    self:updateIcon()
end