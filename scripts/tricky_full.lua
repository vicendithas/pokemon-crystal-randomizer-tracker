TrickyFullPreset = CustomItem:extend()

function TrickyFullPreset:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "brightness|1")
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function TrickyFullPreset:setActive(active)
    self:setProperty("active", active)
end

function TrickyFullPreset:getActive()
    return self:getProperty("active")
end

function TrickyFullPreset:updateIcon()
    if self:getActive() then
        self.ItemInstance.Icon = self.activeImage
    else
        self.ItemInstance.Icon = self.disabledImage
    end
end

function TrickyFullPreset:onLeftClick()
	Tracker:FindObjectForCode("full_item").Active = true
	Tracker:FindObjectForCode("cut_tree").Active = false
	Tracker:FindObjectForCode("vanilla_clair").Active = true
	Tracker:FindObjectForCode("elite_four_req").Active = false
	Tracker:FindObjectForCode("backward_kanto").Active = true
	Tracker:FindObjectForCode("random_pokegear").Active = true
	Tracker:FindObjectForCode("random_pokedex").Active = true
	Tracker:FindObjectForCode("random_radio").Active = true
    Tracker:FindObjectForCode("tin_tower").Active = true
end

function TrickyFullPreset:onRightClick()
	
end

function TrickyFullPreset:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function TrickyFullPreset:providesCode(code)
    if code == self.code and self.getActive() then
        return 1
    end
    return 0
end

function TrickyFullPreset:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function TrickyFullPreset:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function TrickyFullPreset:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function TrickyFullPreset:propertyChanged(key, value)
    self:updateIcon()
end