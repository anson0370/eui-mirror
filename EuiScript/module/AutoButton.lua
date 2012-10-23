local E, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
local S = E:NewModule('AutoButton', 'AceEvent-3.0')

--Binding Variables
BINDING_HEADER_AutoSlotButton = "|cffC495DDEUI|r".. L["Auto InventoryItem Button"];
BINDING_HEADER_AutoQuestButton = "|cffC495DDEUI|r".. L["Auto QuestItem Button"];
for i = 1, 12 do
	setglobal("BINDING_NAME_CLICK AutoSlotButton"..i..":LeftButton", L["Auto InventoryItem Button"]..i)
	setglobal("BINDING_NAME_CLICK AutoQuestButton"..i..":LeftButton", L["Auto QuestItem Button"]..i)
end
----------------------------------------------------------------------------------------
--	AutoButton (by eui.cc at 2012/10/22)
----------------------------------------------------------------------------------------
local frameItem = {
	[79104] = true, --农具
	[80513] = true,
	[89880] = true,
	[79102] = true, --种子
	[80590] = true,
	[80591] = true,
	[80592] = true,
	[80593] = true,
	[80594] = true,
	[80595] = true,
	[89328] = true,
	[89326] = true,
	[89329] = true,
	[85267] = true,
	[85268] = true,
	[85269] = true,
	[85216] = true,
	[85217] = true,
	[89202] = true,
	[85215] = true,
	[89197] = true,
	[89233] = true,	
	['日歌农场'] = true,
	['日歌農荘'] = true,
	['Sunsong Ranch'] = true,
}

local function IsQuestItem(bagID, slotID)
	if frameItem[GetSubZoneText()] then return false; end
	
	local isQuestItem, questId, isActiveQuest = GetContainerItemQuestInfo(bagID, slotID);
	return (questId or isQuestItem)
end

local function IsUsableItem(itemId)
	local itemSpell = GetItemSpell(itemId)
	return itemSpell
end

local function IsFrameItem(itemId)
	if not frameItem[GetSubZoneText()] then return false; end

	if frameItem[itemId] then
		return true
	else
		return false
	end
end

local function AutoButtonHide(AutoButton)
	if not AutoButton then return end
	AutoButton:SetAlpha(0)
	if not InCombatLockdown() then
		AutoButton:EnableMouse(false)
	else
		AutoButton:RegisterEvent("PLAYER_REGEN_ENABLED")
		AutoButton:SetScript("OnEvent", function(self, event) 
			if event == "PLAYER_REGEN_ENABLED" then
				self:EnableMouse(false) 
				self:UnregisterEvent("PLAYER_REGEN_ENABLED") 
			end
		end)
	end
end

local function HideAllButton()
	local i
	for i = 1, 12 do
		AutoButtonHide(_G["AutoQuestButton"..i])
	end
	for i = 1, 12 do
		AutoButtonHide(_G["AutoSlotButton"..i])
	end
end

local function AutoButtonShow(AutoButton)
	if not AutoButton then return end
	AutoButton:SetAlpha(1)
	AutoButton:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMRIGHT', 0, -2)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(USE, self.spellName, 1, 1, 1)
		GameTooltip:Show()
	end)
	AutoButton:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	if not InCombatLockdown() then
		AutoButton:EnableMouse(true)
		if AutoButton.itemName then
			AutoButton:SetAttribute("item", AutoButton.itemName)
		end
	else
		AutoButton:RegisterEvent("PLAYER_REGEN_ENABLED")
		AutoButton:SetScript("OnEvent", function(self, event) 
			if event == "PLAYER_REGEN_ENABLED" then
				self:EnableMouse(true) 
				if self.itemName then
					self:SetAttribute("item", self.itemName)
				end
				self:UnregisterEvent("PLAYER_REGEN_ENABLED") 
			end
		end)
	end
end

local function CreateButton(name)
	if _G[name] then
		_G[name]:Size(E.db.euiscript.autobutton.size)
		return _G[name]
	end
	
	-- Create button
	local AutoButton = CreateFrame("Button", name, E.UIParent, "SecureActionButtonTemplate")
	AutoButton:Size(E.db.euiscript.autobutton.size)
	AutoButton:SetTemplate("Default")
	AutoButton:StyleButton()
	AutoButton:SetAttribute("type", "item")
	AutoButton:SetAlpha(0)
	AutoButton:EnableMouse(false)

	-- Texture for our button
	AutoButton.t = AutoButton:CreateTexture(nil, "OVERLAY", nil)
	AutoButton.t:Point("TOPLEFT", AutoButton, "TOPLEFT", 2, -2)
	AutoButton.t:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", -2, 2)
	AutoButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	-- Count text for our button
	AutoButton.c = AutoButton:CreateFontString(nil, "OVERLAY")
	AutoButton.c:FontTemplate(nil, E.db.actionbar.fontSize * 2, 'OUTLINE')
	AutoButton.c:SetTextColor(1, 1, 1, 1)
	AutoButton.c:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", 0.5, 0)
	AutoButton.c:SetJustifyH("CENTER")	

	-- Cooldown
	AutoButton.Cooldown = CreateFrame("Cooldown", nil, AutoButton)
	AutoButton.Cooldown:Point("TOPLEFT", AutoButton, "TOPLEFT", 2, -2)
	AutoButton.Cooldown:Point("BOTTOMRIGHT", AutoButton, "BOTTOMRIGHT", -2, 2)
	
	return AutoButton
end

function S:ScanItem()
	HideAllButton()
	
	-- Scan bags for Item matchs
	local num = 0
	if E.db.euiscript.autobutton.questNum > 0 then
		for b = 0, NUM_BAG_SLOTS do
			for s = 1, GetContainerNumSlots(b) do
				local itemID = GetContainerItemID(b, s)
				itemID = tonumber(itemID)
				if itemID and (IsQuestItem(b, s) or IsFrameItem(itemID)) and IsUsableItem(itemID) then
					num = num + 1
					if num > E.db.euiscript.autobutton.questNum then break; end
					
					local AutoButton = _G["AutoQuestButton"..num]
					local itemName = GetItemInfo(itemID)
					local count = GetItemCount(itemID)
					local itemIcon = GetItemIcon(itemID)
					
					if not AutoButton then break end
					-- Set our texture to the item found in bags
					AutoButton.t:SetTexture(itemIcon)
					AutoButton.itemName = itemName
					AutoButton.spellName = IsUsableItem(itemID)
					AutoButton:SetBackdropBorderColor(1.0, 0.3, 0.3)
					
					-- Get the count if there is one
					if count and count ~= 1 then
						AutoButton.c:SetText(count)
					else
						AutoButton.c:SetText("")
					end

					AutoButton:SetScript("OnUpdate", function(self, elapsed)
						local cd_start, cd_finish, cd_enable = GetContainerItemCooldown(b, s)
						CooldownFrame_SetTimer(AutoButton.Cooldown, cd_start, cd_finish, cd_enable)
						if IsItemInRange(itemID, 'target') == 0 then
							self.t:SetVertexColor(1, 0, 0)
						else
							self.t:SetVertexColor(1, 1, 1)
						end						
					end)					
					AutoButtonShow(AutoButton)
				end
			end
		end
	end

	-- Scan inventory for Equipment matches
	num = 0
	if E.db.euiscript.autobutton.slotNum > 0 then
		for w = 1, 18 do
			local EquipedItems = GetInventoryItemID("player", w)
			if EquipedItems and IsUsableItem(EquipedItems) then
				local itemName, _, rarity = GetItemInfo(EquipedItems)
				local itemIcon = GetInventoryItemTexture("player", w)
				num = num + 1
				if num > E.db.euiscript.autobutton.slotNum then break; end
				
				local AutoButton = _G["AutoSlotButton".. num]
				if not AutoButton then break; end

				if rarity and rarity > 1 then
					local r, g, b = GetItemQualityColor(rarity);
					AutoButton:SetBackdropBorderColor(r, g, b);
				end				
				-- Set our texture to the item found in bags
				AutoButton.t:SetTexture(itemIcon)
				AutoButton.c:SetText("")
				AutoButton.itemName = itemName
				AutoButton.spellName = IsUsableItem(EquipedItems)
				
				AutoButton:SetScript("OnUpdate", function(self, elapsed)
					local cd_start, cd_finish, cd_enable = GetInventoryItemCooldown("player", w)
					CooldownFrame_SetTimer(AutoButton.Cooldown, cd_start, cd_finish, cd_enable)
				end)				
				AutoButtonShow(AutoButton)
			end
		end
	end
end

function S:ToggleAutoButton()
	if E.db.euiscript.autobutton.enable then
		self:RegisterEvent("BAG_UPDATE", "ScanItem")
		self:RegisterEvent("UNIT_INVENTORY_CHANGED", "ScanItem")
		self:RegisterEvent("ZONE_CHANGED", "ScanItem")
		self:ScanItem();
	else
		HideAllButton()
		self:UnregisterEvent("BAG_UPDATE")
		self:UnregisterEvent("UNIT_INVENTORY_CHANGED")	
		self:UnregisterEvent("ZONE_CHANGED")
	end
end

function S:UpdateAutoButton()
	local db = E.db.euiscript.autobutton
	local i = 0
	
	for i = 1, db.questNum do
		local f = CreateButton("AutoQuestButton"..i)
		if i == 1 then
			f:Point("LEFT", AutoButtonAnchor, "LEFT", 0, 0)
		else
			f:Point("LEFT", _G["AutoQuestButton"..i-1], "RIGHT", 3, 0)
		end
	end
	
	for i = 1, db.slotNum do
		local f = CreateButton("AutoSlotButton"..i)
		if i == 1 then
			f:Point("LEFT", AutoButtonAnchor2, "LEFT", 0, 0)
		else
			f:Point("LEFT", _G["AutoSlotButton"..i-1], "RIGHT", 3, 0)
		end
	end
	self:ToggleAutoButton()
end

function S:Initialize()
	local db = E.db.euiscript.autobutton
	
	--Convert old ver.
	if E.db.euiscript.auto_quest_button == false then
		db.enable = false
		E.db.euiscript.auto_quest_button = nil
	end
	
	-- Create anchor
	local AutoButtonAnchor = CreateFrame("Frame", "AutoButtonAnchor", UIParent)
	AutoButtonAnchor:Point("BOTTOMLEFT", RightChatPanel or LeftChatPanel, "TOPLEFT", 0, 4)
	AutoButtonAnchor:Size(db.questNum > 0 and db.size * db.questNum or 260, db.questNum > 0 and db.size or 40)
	E:CreateMover(AutoButtonAnchor, "AutoButtonAnchorMover", L["Auto QuestItem Button"], nil, nil, nil, "ALL,EUI")

	-- Create anchor2
	local AutoButtonAnchor2 = CreateFrame("Frame", "AutoButtonAnchor2", UIParent)
	AutoButtonAnchor2:Point("BOTTOMLEFT", RightChatPanel or LeftChatPanel, "TOPLEFT", 0, 48)
	AutoButtonAnchor2:Size(db.slotNum > 0 and db.size * db.slotNum or 260, db.slotNum > 0 and db.size or 40)
	E:CreateMover(AutoButtonAnchor2, "AutoButtonAnchor2Mover", L["Auto InventoryItem Button"], nil, nil, nil, "ALL,EUI")
	
	self:UpdateAutoButton()
end

E:RegisterModule(S:GetName())