NightmareFullPreset = CustomItem:extend()

function NightmareFullPreset:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "brightness|1")
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function NightmareFullPreset:setActive(active)
    self:setProperty("active", active)
end

function NightmareFullPreset:getActive()
    return self:getProperty("active")
end

function NightmareFullPreset:updateIcon()
    if self:getActive() then
        self.ItemInstance.Icon = self.activeImage
    else
        self.ItemInstance.Icon = self.disabledImage
    end
end

function NightmareFullPreset:onLeftClick()
	Tracker:FindObjectForCode("full_item").Active = true
	Tracker:FindObjectForCode("cut_tree").Active = true
	Tracker:FindObjectForCode("vanilla_clair").Active = true
	Tracker:FindObjectForCode("elite_four_req").Active = true
	Tracker:FindObjectForCode("backward_kanto").Active = true
	Tracker:FindObjectForCode("random_pokegear").Active = true
	Tracker:FindObjectForCode("random_pokedex").Active = true
	Tracker:FindObjectForCode("random_radio").Active = true
    Tracker:FindObjectForCode("tin_tower").Active = true
end

function NightmareFullPreset:onRightClick()
	
end

function NightmareFullPreset:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function NightmareFullPreset:providesCode(code)
    if code == self.code and self.getActive() then
        return 1
    end
    return 0
end

function NightmareFullPreset:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function NightmareFullPreset:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function NightmareFullPreset:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function NightmareFullPreset:propertyChanged(key, value)
    self:updateIcon()
end