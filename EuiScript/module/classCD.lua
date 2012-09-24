local E, L, DF = unpack(ElvUI)
local CD = E:NewModule('CLASSCD', 'AceEvent-3.0')

----------------------------------------------------------------------------------------
--	职业被动技能,饰品,附魔内置CD
--  Modify by eui.cc at 2012.09.10
----------------------------------------------------------------------------------------
local show = {
	raid = true,
	party = true,
	pvp = true,
	arena = true,
	none = true,
}

local EVENT = {
	["SPELL_DAMAGE"] = true,
	["SPELL_PERIODIC_HEAL"] = true,
	["SPELL_HEAL"] = true,
	["SPELL_AURA_APPLIED"] = true,
	["SPELL_ENERGIZE"] = true,
	["SPELL_CAST_SUCCESS"] = true,
	["SPELL_CAST_START"] = true, -- for early frost
	["SPELL_SUMMON"] = true, -- for t12 2p
}

local filter = COMBATLOG_OBJECT_AFFILIATION_RAID + COMBATLOG_OBJECT_AFFILIATION_PARTY + COMBATLOG_OBJECT_AFFILIATION_MINE
local band = bit.band
local sformat = string.format
local floor = math.floor
local timer = 0
local bars = {}

local FormatTime = function(time)
	if E.db.euiscript.classcd_style == 'bar' then
		if time >= 60 then
			return sformat("%.2d:%.2d", floor(time / 60), time % 60)
		else
			return sformat("%.2d", time)
		end
	else
		return sformat("%.1d", time)
	end
end

local CreateFS = function(frame, fsize, fstyle)
	local fstring = frame:CreateFontString(nil, "OVERLAY")
	fstring:FontTemplate(nil, fsize, 'OUTLINE')
	return fstring
end

local UpdatePositions = function()
	for i = 1, #bars do
		bars[i]:ClearAllPoints()
		if i == 1 then
			bars[i]:Point("TOPLEFT", ClassCDAnchor, "TOPLEFT", 26, 0)
		else
			if E.db["euiscript"].classcd_direction == "up" then
				bars[i]:Point("BOTTOMLEFT", bars[i-1], "TOPLEFT", 0, 4)
			elseif E.db["euiscript"].classcd_direction == "down" then
				bars[i]:Point("TOPLEFT", bars[i-1], "BOTTOMLEFT", 0, -4)
			elseif E.db["euiscript"].classcd_direction == "left" then
				bars[i]:Point("RIGHT", bars[i-1], "LEFT", -4, 0)
			elseif E.db["euiscript"].classcd_direction == "right" then
				bars[i]:Point("LEFT", bars[i-1], "RIGHT", 4, 0)
			end
		end
		bars[i].id = i
	end
end

local StopTimer = function(bar)
	bar:SetScript("OnUpdate", nil)
	bar:Hide()
	tremove(bars, bar.id)
	UpdatePositions()
end

local BarUpdate = function(self, elapsed)
	local curTime = GetTime()
	if self.endTime < curTime then
		StopTimer(self)
		return
	end
	if E.db.euiscript.classcd_style == 'bar' then
		self:SetValue(100 - (curTime - self.startTime) / (self.endTime - self.startTime) * 100)
	end
	self.right:SetText(FormatTime(self.endTime - curTime))
end

local OnEnter = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:AddDoubleLine(self.spell, self.right:GetText())
	GameTooltip:SetClampedToScreen(true)
	GameTooltip:Show()
end

local OnLeave = function(self)
	GameTooltip:Hide()
end

local OnMouseDown = function(self, button)
	if button == "LeftButton" then
		if IsInRaid() then
			SendChatMessage(sformat("EUI_ClassCD".." %s: %s", self.left:GetText(), self.right:GetText()), "RAID")
		elseif IsInGroup() and not UnitInRaid("player") then
			SendChatMessage(sformat("EUI_ClassCD".." %s: %s", self.left:GetText(), self.right:GetText()), "PARTY")
		else
			SendChatMessage(sformat("EUI_ClassCD".." %s: %s", self.left:GetText(), self.right:GetText()), "SAY")
		end
	elseif button == "RightButton" then
		StopTimer(self)
	end
end

local CreateBar = function()
	local bar
	if E.db.euiscript.classcd_style == 'bar' then
		bar = E.db.general.transparent and E:TranseBar(UIParent) or CreateFrame("Statusbar", nil, UIParent)
		bar:SetFrameStrata("LOW")
		bar:Size(E.db["euiscript"].classcd_width - E.db["euiscript"].classcd_height - 6, E.db["euiscript"].classcd_height)
		bar:SetStatusBarTexture(E["media"].normTex)
		bar:SetMinMaxValues(0, 100)

		bar.backdrop = CreateFrame("Frame", nil, bar)
		bar.backdrop:Point("TOPLEFT", -2, 2)
		bar.backdrop:Point("BOTTOMRIGHT", 2, -2)
		bar.backdrop:SetTemplate("Default")
		bar.backdrop:SetFrameStrata("BACKGROUND")

		bar.bg = bar:CreateTexture(nil, "BACKGROUND")
		bar.bg:SetAllPoints(bar)
		bar.bg:SetTexture(E["media"].glossTex)

		bar.left = CreateFS(bar, E.db["euiscript"].classcd_height * 0.55)
		bar.left:Point("LEFT", 2, 0)
		bar.left:SetJustifyH("LEFT")
		bar.left:Size(E.db["euiscript"].classcd_width - E.db["euiscript"].classcd_height, E.db["euiscript"].classcd_height)

		bar.right = CreateFS(bar, E.db["euiscript"].classcd_height * 0.55)
		bar.right:Point("RIGHT", 1, 0)
		bar.right:SetJustifyH("RIGHT")

		bar.icon = CreateFrame("Button", nil, bar)
		bar.icon:Width(E.db["euiscript"].classcd_height)
		bar.icon:Height(E.db["euiscript"].classcd_height)
		bar.icon:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -6, 0)

		bar.icon.backdrop = CreateFrame("Frame", nil, bar.icon)
		bar.icon.backdrop:Point("TOPLEFT", -2, 2)
		bar.icon.backdrop:Point("BOTTOMRIGHT", 2, -2)
		bar.icon.backdrop:SetTemplate("Default")
		bar.icon.backdrop:SetFrameStrata("BACKGROUND")
		return bar
	else
		bar = CreateFrame("Frame", nil, UIParent);
		bar:SetFrameStrata("LOW")
		bar:Size(E.db["euiscript"].classcd_height, E.db["euiscript"].classcd_height)
		bar:SetTemplate("Default")
		
		bar.icon = bar:CreateTexture(nil, "ARTWORK")
		bar.icon:Point("TOPLEFT", 2, -2)
		bar.icon:Point("BOTTOMRIGHT", -2, 2)
		
		bar.left = CreateFS(bar, E.db["euiscript"].classcd_height * 0.6)
		
		bar.right = CreateFS(bar, E.db["euiscript"].classcd_height * 0.6)
		bar.right:Point("CENTER", 1, -1)
		bar.right:SetJustifyH("RIGHT")
		bar.right:SetTextColor(1, 0.9, 0.1)
		return bar
	end
	
	
end

local StartTimer = function(name, spellId, cd)
	for i = 1, #bars do
		if bars[i].spell == GetSpellInfo(spellId) then
			return
		end
	end
	local bar = CreateBar()
	local spell, rank, icon = GetSpellInfo(spellId)
	bar.endTime = GetTime() + cd
	bar.startTime = GetTime()
	bar.left:SetText(spell)
	bar.right:SetText(FormatTime(cd))
	if E.db.euiscript.classcd_style == 'bar' then
		bar.icon:SetNormalTexture(icon)
		bar.icon:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		local color = RAID_CLASS_COLORS[select(2, UnitClass(name))]
		if color then
			bar:SetStatusBarColor(color.r, color.g, color.b)
			bar.bg:SetVertexColor(color.r, color.g, color.b, 0.25)
		else
			bar:SetStatusBarColor(0.3, 0.7, 0.3)
			bar.bg:SetVertexColor(0.3, 0.7, 0.3, 0.25)
		end		
	else
		bar.icon:SetTexture(icon)
		bar.icon:SetTexCoord(.1, .9, .1, .9)
	end
	bar.spell = spell
	bar:Show()
	bar:SetScript("OnUpdate", BarUpdate)
	bar:EnableMouse(true)
	bar:SetScript("OnEnter", OnEnter)
	bar:SetScript("OnLeave", OnLeave)
	bar:SetScript("OnMouseDown", OnMouseDown)
	tinsert(bars, bar)
	UpdatePositions()
end

function CD:COMBAT_LOG_EVENT_UNFILTERED(...)
	local _, _, eventType, _, _, sourceName, sourceFlags = ...
	if band(sourceFlags, filter) == 0 or sourceName ~= E.myname then return end
	local spellId = select(13, ...)
	
	if E.global.extracd.data[spellId] and EVENT[eventType] then
		StartTimer(sourceName, spellId, E.global.extracd.data[spellId].cd)
	end
end

function CD:ZONE_CHANGED_NEW_AREA()
	if select(2, IsInInstance()) == "arena" then
		for k, v in pairs(bars) do
			StopTimer(v)
		end
	end
end

function CD:UpdateSetting()
	for i = 1, #bars do
		if bars[i] then
			bars[i]:SetScript("OnUpdate", nil)
			bars[i]:Hide()
		end
	end
	wipe(bars)
	
	if E.db.euiscript.classcd_style == 'bar' then
		ClassCDAnchor:Size(E.db["euiscript"].classcd_width, E.db["euiscript"].classcd_height)
	else
		ClassCDAnchor:Size(E.db["euiscript"].classcd_height, E.db["euiscript"].classcd_height)
	end	
end	

function CD:ToggleClassCD()
	if E.db["euiscript"].classcd then
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	else
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		self:UpdateSetting()
	end
end

local function closeFunc()
	E.db["euiscript"].classcd = false
	CD:ToggleClassCD()
end

local function openFunc()
	E.db.euiscript.classcd = true
	CD:ToggleClassCD()
end

function CD:Initialize()
	local ClassCDAnchor = CreateFrame("Frame", "ClassCDAnchor", UIParent)
	ClassCDAnchor:Point("CENTER", E.UIParent, "CENTER", -222, 6)
	if E.db.euiscript.classcd_style == 'bar' then
		ClassCDAnchor:Size(E.db["euiscript"].classcd_width, E.db["euiscript"].classcd_height)
	else
		ClassCDAnchor:Size(E.db["euiscript"].classcd_height, E.db["euiscript"].classcd_height)
	end
	E:CreateMover(ClassCDAnchor, "ClassCDAnchorMover", L["classcd"], nil, nil, nil, "ALL,EUI", closeFunc, openFunc)
	
	self:ToggleClassCD()
end	

E:RegisterModule(CD:GetName())