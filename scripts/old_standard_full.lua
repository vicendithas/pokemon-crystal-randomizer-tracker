OldStandardFullPreset = CustomItem:extend()

function OldStandardFullPreset:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "brightness|1")
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function OldStandardFullPreset:setActive(active)
    self:setProperty("active", active)
end

function OldStandardFullPreset:getActive()
    return self:getProperty("active")
end

function OldStandardFullPreset:updateIcon()
    if self:getActive() then
        self.ItemInstance.Icon = self.activeImage
    else
        self.ItemInstance.Icon = self.disabledImage
    end
end

function OldStandardFullPreset:onLeftClick()
	Tracker:FindObjectForCode("full_item").Active = true
	Tracker:FindObjectForCode("cut_tree").Active = true
	Tracker:FindObjectForCode("vanilla_clair").Active = false
	Tracker:FindObjectForCode("elite_four_req").Active = false
	Tracker:FindObjectForCode("backward_kanto").Active = true
	Tracker:FindObjectForCode("random_pokegear").Active = false
	Tracker:FindObjectForCode("random_pokedex").Active = false
	Tracker:FindObjectForCode("random_radio").Active = false
    Tracker:FindObjectForCode("tin_tower").Active = false
end

function OldStandardFullPreset:onRightClick()
	
end

function OldStandardFullPreset:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function OldStandardFullPreset:providesCode(code)
    if code == self.code and self.getActive() then
        return 1
    end
    return 0
end

function OldStandardFullPreset:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function OldStandardFullPreset:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function OldStandardFullPreset:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function OldStandardFullPreset:propertyChanged(key, value)
    self:updateIcon()
end