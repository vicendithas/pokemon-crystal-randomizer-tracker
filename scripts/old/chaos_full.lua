ChaosFullPreset = CustomItem:extend()

function ChaosFullPreset:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "brightness|1")
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function ChaosFullPreset:setActive(active)
    self:setProperty("active", active)
end

function ChaosFullPreset:getActive()
    return self:getProperty("active")
end

function ChaosFullPreset:updateIcon()
    if self:getActive() then
        self.ItemInstance.Icon = self.activeImage
    else
        self.ItemInstance.Icon = self.disabledImage
    end
end

function ChaosFullPreset:onLeftClick()
	Tracker:FindObjectForCode("full_item").Active = true
	Tracker:FindObjectForCode("cut_tree").Active = false
	Tracker:FindObjectForCode("vanilla_clair").Active = true
	Tracker:FindObjectForCode("elite_four_req").Active = false
	Tracker:FindObjectForCode("backward_kanto").Active = true
	Tracker:FindObjectForCode("random_pokegear").Active = true
	Tracker:FindObjectForCode("random_pokedex").Active = true
	Tracker:FindObjectForCode("random_radio").Active = true
    Tracker:FindObjectForCode("tin_tower").Active = true
	Tracker:FindObjectForCode("hidden_items").Active = true
end

function ChaosFullPreset:onRightClick()
	
end

function ChaosFullPreset:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function ChaosFullPreset:providesCode(code)
    if code == self.code and self.getActive() then
        return 1
    end
    return 0
end

function ChaosFullPreset:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function ChaosFullPreset:save()
    local saveData = {}
    saveData["active"] = self.getActive()
    return saveData
end

function ChaosFullPreset:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function ChaosFullPreset:propertyChanged(key, value)
    self:updateIcon()
end