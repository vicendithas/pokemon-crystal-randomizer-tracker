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
	-- order of settings: full_item, hidden_items, cut_tree, vanilla_clair, backward_kanto, elite_four_req, random_pokegear, random_radio, random_pokedex, tin_tower
	presetSettings = {false, false, false, false, false, false, false, false, false, false}
	if self.code == "easy_full" then
		presetSettings = {true, false, false, false, false, false, false, false, false, false}
	elseif self.code == "standard_full" then
		presetSettings = {true, false, false, false, true, false, false, false, false, false}
	elseif self.code == "tricky_full" then
		presetSettings = {true, false, false, true, true, false, true, true, true, true}
	elseif self.code == "chaos_full" then
		presetSettings = {true, true, false, true, true, false, true, true, true, true}
	elseif self.code == "vintage_full" then
		presetSettings = {true, false, true, true, true, false, false, false, false, false}
	elseif self.code == "classic_key" then
		presetSettings = {false, false, false, false, false, true, false, false, false, false}
	elseif self.code == "neo_key" then
		presetSettings = {false, false, false, false, true, false, true, true, true, true}
	elseif self.code == "nightmare_full" then
		presetSettings = {true, false, true, true, true, true, true, true, true, true}
	end
	
	Tracker:FindObjectForCode("full_item").Active = presetSettings[1]
	Tracker:FindObjectForCode("hidden_items").Active = presetSettings[2]
	Tracker:FindObjectForCode("cut_tree").Active = presetSettings[3]
	Tracker:FindObjectForCode("vanilla_clair").Active = presetSettings[4]
	Tracker:FindObjectForCode("backward_kanto").Active = presetSettings[5]
	Tracker:FindObjectForCode("elite_four_req").Active = presetSettings[6]
	Tracker:FindObjectForCode("random_pokegear").Active = presetSettings[7]
	Tracker:FindObjectForCode("random_radio").Active = presetSettings[8]
	Tracker:FindObjectForCode("random_pokedex").Active = presetSettings[9]
    Tracker:FindObjectForCode("tin_tower").Active = presetSettings[10]
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