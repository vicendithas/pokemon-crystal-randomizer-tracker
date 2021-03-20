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
	if self.code == "easy_full" then
		Tracker:FindObjectForCode("full_item").Active = true
		Tracker:FindObjectForCode("cut_tree").Active = false
		Tracker:FindObjectForCode("vanilla_clair").Active = false
		Tracker:FindObjectForCode("elite_four_req").Active = false
		Tracker:FindObjectForCode("backward_kanto").Active = false
		Tracker:FindObjectForCode("random_pokegear").Active = false
		Tracker:FindObjectForCode("random_pokedex").Active = false
		Tracker:FindObjectForCode("random_radio").Active = false
		Tracker:FindObjectForCode("tin_tower").Active = false
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
	if self.code == "standard_full" then
		Tracker:FindObjectForCode("full_item").Active = true
		Tracker:FindObjectForCode("cut_tree").Active = false
		Tracker:FindObjectForCode("vanilla_clair").Active = false
		Tracker:FindObjectForCode("elite_four_req").Active = false
		Tracker:FindObjectForCode("backward_kanto").Active = true
		Tracker:FindObjectForCode("random_pokegear").Active = false
		Tracker:FindObjectForCode("random_pokedex").Active = false
		Tracker:FindObjectForCode("random_radio").Active = false
		Tracker:FindObjectForCode("tin_tower").Active = false
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
	if self.code == "tricky_full" then
		Tracker:FindObjectForCode("full_item").Active = true
		Tracker:FindObjectForCode("cut_tree").Active = false
		Tracker:FindObjectForCode("vanilla_clair").Active = true
		Tracker:FindObjectForCode("elite_four_req").Active = false
		Tracker:FindObjectForCode("backward_kanto").Active = true
		Tracker:FindObjectForCode("random_pokegear").Active = true
		Tracker:FindObjectForCode("random_pokedex").Active = true
		Tracker:FindObjectForCode("random_radio").Active = true
		Tracker:FindObjectForCode("tin_tower").Active = true
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
	if self.code == "chaos_full" then
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
	
	if self.code == "vintage_full" then
		Tracker:FindObjectForCode("full_item").Active = true
		Tracker:FindObjectForCode("cut_tree").Active = true
		Tracker:FindObjectForCode("vanilla_clair").Active = true
		Tracker:FindObjectForCode("elite_four_req").Active = false
		Tracker:FindObjectForCode("backward_kanto").Active = true
		Tracker:FindObjectForCode("random_pokegear").Active = false
		Tracker:FindObjectForCode("random_pokedex").Active = false
		Tracker:FindObjectForCode("random_radio").Active = false
		Tracker:FindObjectForCode("tin_tower").Active = false
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
	if self.code == "classic_key" then
		Tracker:FindObjectForCode("full_item").Active = false
		Tracker:FindObjectForCode("cut_tree").Active = false
		Tracker:FindObjectForCode("vanilla_clair").Active = false
		Tracker:FindObjectForCode("elite_four_req").Active = true
		Tracker:FindObjectForCode("backward_kanto").Active = false
		Tracker:FindObjectForCode("random_pokegear").Active = false
		Tracker:FindObjectForCode("random_pokedex").Active = false
		Tracker:FindObjectForCode("random_radio").Active = false
		Tracker:FindObjectForCode("tin_tower").Active = false
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
	if self.code == "neo_key" then
		Tracker:FindObjectForCode("full_item").Active = false
		Tracker:FindObjectForCode("cut_tree").Active = false
		Tracker:FindObjectForCode("vanilla_clair").Active = false
		Tracker:FindObjectForCode("elite_four_req").Active = false
		Tracker:FindObjectForCode("backward_kanto").Active = true
		Tracker:FindObjectForCode("random_pokegear").Active = true
		Tracker:FindObjectForCode("random_pokedex").Active = true
		Tracker:FindObjectForCode("random_radio").Active = true
		Tracker:FindObjectForCode("tin_tower").Active = true
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
	if self.code == "nightmare_full" then
		Tracker:FindObjectForCode("full_item").Active = true
		Tracker:FindObjectForCode("cut_tree").Active = true
		Tracker:FindObjectForCode("vanilla_clair").Active = true
		Tracker:FindObjectForCode("elite_four_req").Active = true
		Tracker:FindObjectForCode("backward_kanto").Active = true
		Tracker:FindObjectForCode("random_pokegear").Active = true
		Tracker:FindObjectForCode("random_pokedex").Active = true
		Tracker:FindObjectForCode("random_radio").Active = true
		Tracker:FindObjectForCode("tin_tower").Active = true
		Tracker:FindObjectForCode("hidden_items").Active = false
	end
	
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