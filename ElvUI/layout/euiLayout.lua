local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local LO = E:GetModule('Layout');
local LSM = LibStub("LibSharedMedia-3.0")

local PANEL_HEIGHT = 22;
local MAX_BUTTON = 4;

local menuList = {
	{text = CHARACTER_BUTTON,
	func = function() ToggleCharacter("PaperDollFrame") end},
	{text = SPELLBOOK_ABILITIES_BUTTON,
	func = function() if not SpellBookFrame:IsShown() then ShowUIPanel(SpellBookFrame) else HideUIPanel(SpellBookFrame) end end},
	{text = MOUNTS_AND_PETS,
	func = function()
		TogglePetJournal();
	end},
	{text = TALENTS_BUTTON,
	func = function()
		if not PlayerTalentFrame then
			TalentFrame_LoadUI()
		end

		if not GlyphFrame then
			GlyphFrame_LoadUI()
		end
		
		if not PlayerTalentFrame:IsShown() then
			ShowUIPanel(PlayerTalentFrame)
		else
			HideUIPanel(PlayerTalentFrame)
		end
	end},
	{text = TIMEMANAGER_TITLE,
	func = function() ToggleFrame(TimeManagerFrame) end},		
	{text = ACHIEVEMENT_BUTTON,
	func = function() ToggleAchievementFrame() end},
	{text = QUESTLOG_BUTTON,
	func = function() ToggleFrame(QuestLogFrame) end},
	{text = SOCIAL_BUTTON,
	func = function() ToggleFriendsFrame(1) end},
	{text = L["calendar_string"],
	func = function() GameTimeFrame:Click() end},
	{text = PLAYER_V_PLAYER,
	func = function() ToggleFrame(PVPFrame) end},
	{text = ACHIEVEMENTS_GUILD_TAB,
	func = function()
		if IsInGuild() then
			if not GuildFrame then GuildFrame_LoadUI() end
			GuildFrame_Toggle()
		else
			if not LookingForGuildFrame then LookingForGuildFrame_LoadUI() end
			if not LookingForGuildFrame then return end
			LookingForGuildFrame_Toggle()
		end
	end},
	{text = LFG_TITLE,
	func = function() PVEFrame_ToggleFrame(); end},
	{text = ENCOUNTER_JOURNAL, 
	func = function() if not IsAddOnLoaded('Blizzard_EncounterJournal') then EncounterJournal_LoadUI(); end ToggleFrame(EncounterJournal) end},	
	{text = L["GameMenu"],
    func = function() ToggleFrame(GameMenuFrame) end},	
	{text = HELP_BUTTON,
	func = function() ToggleHelpFrame() end},
}

local function HideChildren(parent)
	for i = 1, parent:GetNumChildren() do
		local f = select(i, parent:GetChildren())
		if f:IsShown() then
			UIFrameFadeOut(f, 0.3)
			f.fadeInfo.finishedFunc = function() f:Hide(); f:SetAlpha(1); end
		end
	end
end

local function FadeShow(f)
	if f:IsShown() then
		UIFrameFadeOut(f, 0.3)
		f.fadeInfo.finishedFunc = function() f:Hide(); f:SetAlpha(1); end
	else
		UIFrameFadeIn(f, 0.3)
		f.fadeInfo.finishedFunc = function() f:Show(); f:SetAlpha(1); end
	end
end

--Change border when mouse is inside the button
local function ButtonEnter(self)
	self:SetBackdropBorderColor(unpack(E["media"].rgbvaluecolor))	
end

--Change border back to normal when mouse leaves button
local function ButtonLeave(self)
	self:SetBackdropBorderColor(unpack(E["media"].bordercolor))
end

local function CreateButton(name, func, parent)
	if not name then return end

	local f = CreateFrame("Button", nil, parent)
	f:SetHeight(PANEL_HEIGHT)
	f:SetWidth(74)
	f:SetToplevel(true)
	f:SetFrameStrata("DIALOG")	
	f:SetFrameLevel(6)
	f:SetTemplate("Transparent")
	f:StyleButton()
	f.text = f:CreateFontString(nil, "OVERLAY")
	f.text:FontTemplate(LSM:Fetch("font", E.db.datatexts.font), E.db.datatexts.fontSize - 2, E.db.datatexts.fontOutline)
	f.text:SetPoint("CENTER")
	f.text:SetText(name)
	f:SetScript("OnClick", function()
		if func then func(); end
		HideChildren(EuiInfoBar.Menu);
		HideChildren(EuiInfoBar.RaidTool);
		HideChildren(EuiInfoBar.Shortcuts);
	end)
	f:HookScript("OnEnter", ButtonEnter)
	f:HookScript("OnLeave", ButtonLeave)
	f:Hide()
	
	return f
end

local function CreateMenu(parent)
	for k, v in pairs(menuList) do
		if menuList[k].text then
			local f = CreateButton(menuList[k].text, menuList[k].func, parent)
			f:SetPoint("TOP", parent, "TOP", 0, -(k * (PANEL_HEIGHT + 2)))
		end
	end
end

local function CreateRaidTool(parent)
	for i = 1, 4 do
		local f = CreateButton("raidtool".. i, nil, parent)
		parent['raidtool'..i] = f
		f:SetPoint("TOP", parent, "TOP", 0, -(i * (PANEL_HEIGHT + 2)))
	end
end

--Shortcuts
--1.
local ShortcutsList = {
	{text = L["Setup Chat"], 
	func = function() E:Install(); ElvUIInstallFrame.SetPage(3); end},
	{text = L['Theme Setup'],
	func = function() E:Install(); ElvUIInstallFrame.SetPage(4); end},
	{text = L["UF Style"], 
	func = function() E:Install(); ElvUIInstallFrame.SetPage(7); end},
	{text = L["AB Style"], 
	func = function() E:Install(); ElvUIInstallFrame.SetPage(8); end},
	{text = L["Toggle Anchors"],
	func = function()
		if ElvUIMoverPopupWindow and ElvUIMoverPopupWindow:IsShown() then
			E:ToggleConfigMode(false)
		else
			E:ToggleConfigMode()
		end
	end},
	{text = L["Reset Anchors"],
	func = function() E:ResetUI() end},
}

local function CreateShortcuts(parent)
	for k, v in pairs(ShortcutsList) do
		if ShortcutsList[k].text then
			local f = CreateButton(ShortcutsList[k].text, ShortcutsList[k].func, parent)
			f:SetPoint("TOP", parent, "TOP", 0, -(k * (PANEL_HEIGHT + 2)))
		end
	end
end

local function GetLocTextColor()
	local pvpType = GetZonePVPInfo()
	if pvpType == "arena" then
		return 0.84, 0.03, 0.03
	elseif pvpType == "friendly" then
		return 0.05, 0.85, 0.03
	elseif pvpType == "contested" then
		return 0.9, 0.85, 0.05
	elseif pvpType == "hostile" then 
		return 0.84, 0.03, 0.03
	elseif pvpType == "sanctuary" then
		return 0.035, 0.58, 0.84
	elseif pvpType == "combat" then
		return 0.84, 0.03, 0.03
	else
		return 0.84, 0.03, 0.03
	end	
end

local function CreateLoc(parent)
	parent:SetScript("OnUpdate", function(self, elapsed)
		if(self.elapsed and self.elapsed > 0.2) then
			local x,y = GetPlayerMapPosition("player")
			
			x = math.floor(100 * x)
			y = math.floor(100 * y)
			if x ==0 and y==0 then
				self.text:SetText(E:RGBToHex(GetLocTextColor()).. '??, ??|r')
			else
				self.text:SetText(E:RGBToHex(GetLocTextColor()).. x.. ', '.. y.. '|r')
			end
			self.elapsed = 0
		else
			self.elapsed = (self.elapsed or 0) + elapsed
		end	
	end)
end

local function CreateInfoBarButton(id, name, parent)
	local f = CreateFrame("Button", nil, parent)
	f:SetHeight(PANEL_HEIGHT)
	f:SetWidth(74)
	f:SetFrameLevel(2)
	f:StyleButton()
	f:SetTemplate("Transparent", true)
	f:Point("LEFT", parent, "RIGHT", (id - 1) * 74 + id * 2, 0)
	f.text = f:CreateFontString(nil, "OVERLAY")
	f.text:FontTemplate(LSM:Fetch("font", E.db.datatexts.font), E.db.datatexts.fontSize, E.db.datatexts.fontOutline)
	f.text:SetPoint("CENTER")
	f.text:SetText(name)
	f:SetScript("OnClick", function(self)
		if InCombatLockdown() then return; end
		for i = 1, self:GetNumChildren() do
			local f = select(i, self:GetChildren())
			FadeShow(f)
		end
		for k, v in pairs({EuiInfoBar.Menu, EuiInfoBar.Shortcuts, EuiInfoBar.RaidTool}) do
			if self ~= v then HideChildren(v) end
		end				
	end)
	f:HookScript("OnEnter", ButtonEnter)
	f:HookScript("OnLeave", ButtonLeave)
	
	parent['button'..id] = f
	return f
end

local function anchorClick(self)
	if self then
		if self.text:GetText() == '>' then
			E.db.InfoBarStep = E.db.InfoBarStep + 1
		else
			E.db.InfoBarStep = E.db.InfoBarStep - 1
		end
	else
		self = EuiInfoBar.anchor
	end
	
	for i = 1, MAX_BUTTON do
		if i <= E.db.InfoBarStep then
			self['button'..i]:Show()
		else
			self['button'..i]:Hide()
		end
	end
	
	if E.db.InfoBarStep == 0 then
		self.text:SetText('>')
		self.text:SetTextColor(23/255, 132/255, 209/255)
	elseif E.db.InfoBarStep == MAX_BUTTON then
		self.text:SetText('<')
		self.text:SetTextColor(1, 1, 1)
	end
end

function LO:InfoBar()
	local f = CreateFrame("Frame", "EuiInfoBar", E.UIParent)
	f:SetHeight(PANEL_HEIGHT)
	f:SetWidth(MAX_BUTTON * 74)
	f:SetPoint("TOPLEFT", E.UIParent, "TOPLEFT", -E.mult, -E.mult)
	f:SetFrameStrata("BACKGROUND")
	f:SetFrameLevel(0)
	
	local anchor = CreateFrame("Button", nil, EuiInfoBar)
	anchor:SetHeight(PANEL_HEIGHT)
	anchor:SetWidth(14)
	anchor:SetFrameLevel(2)
	anchor:SetTemplate("Transparent")
	anchor:StyleButton()
	anchor:Point("LEFT", EuiInfoBar, "LEFT", 2, 0)
	anchor.text = anchor:CreateFontString(nil, "OVERLAY")
	anchor.text:FontTemplate(nil, 12, 'OUTLINE')
	anchor.text:SetTextColor(1, 1, 1)
	anchor.text:SetPoint("CENTER")
	anchor.text:SetText('<')
	
	if not E.db.InfoBarStep then
		E.db.InfoBarStep = MAX_BUTTON
	end
	
	E:CreateMover(f, 'EuiInfoBarMover', L['EuiInfoBar'], nil, nil, nil, 'ALL,GENERAL')
	
	local menu = CreateInfoBarButton(1, L["Menu"], anchor)
	CreateMenu(menu);
	
	local shortcuts = CreateInfoBarButton(2, L["Shortcuts"], anchor)
	CreateShortcuts(shortcuts);

	local raid = CreateInfoBarButton(3, L["RaidTool"], anchor)
	CreateRaidTool(raid);	
	
	local loc = CreateInfoBarButton(4, "?, ?", anchor)
	CreateLoc(loc)

	EuiInfoBar.Menu = menu
	EuiInfoBar.Shortcuts = shortcuts
	EuiInfoBar.RaidTool = raid
	EuiInfoBar.anchor = anchor
	
	anchor:SetScript("OnClick", anchorClick)
	anchorClick();	
end