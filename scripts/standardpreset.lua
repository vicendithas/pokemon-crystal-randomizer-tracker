StandardPresetItem = CustomItem:extend()

function StandardPresetItem:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "brightness|1")
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function StandardPresetItem:setActive(active)
    self:setProperty("active", active)
end

function StandardPresetItem:getActive()
    return self:getProperty("active")
end

function StandardPresetItem:updateIcon()
    if self:getActive() then
        self.ItemInstance.Icon = self.activeImage
    else
        self.ItemInstance.Icon = self.disabledImage
    end
end

function StandardPresetItem:onLeftClick()
	Tracker:FindObjectForCode("cut_tree").Active = true
	Tracker:FindObjectForCode("vanilla_clair").Active = false
	Tracker:FindObjectForCode("elite_four_req").Active = false
	Tracker:FindObjectForCode("backward_kanto").Active = true
	Tracker:FindObjectForCode("random_pokegear").Active = false
	Tracker:FindObjectForCode("random_pokedex").Active = false
	Tracker:FindObjectForCode("random_radio").Active = false
	Tracker:FindObjectForCode("random_map").Active = false
    Tracker:FindObjectForCode("tin_tower").Active = false
end

function StandardPresetItem:onRightClick()
	
end

function StandardPresetItem:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function StandardPresetItem:providesCode(code)
    if code == self.code and self.getActive() then
        return 1
    end
    return 0
end

function StandardPresetItem:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function StandardPresetItem:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function StandardPresetItem:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function StandardPresetItem:propertyChanged(key, value)
    self:updateIcon()
end