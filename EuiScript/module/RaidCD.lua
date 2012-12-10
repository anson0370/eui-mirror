local E, L, DF = unpack(ElvUI)
local RD = E:NewModule('RAIDCD', 'AceEvent-3.0')

----------------------------------------------------------------------------------------
--	Raid cooldowns
--  Modify by eui.cc at 2012.8.20
----------------------------------------------------------------------------------------
local show = {
	raid = true,
	party = true,
	arena = true,
}

local utf8sub = function(string, i, dots)
	if not string then return end
	local bytes = string:len()
	if (bytes <= i) then
		return string
	else
		local len, pos = 0, 1
		while(pos <= bytes) do
			len = len + 1
			local c = string:byte(pos)
			if (c > 0 and c <= 127) then
				pos = pos + 1
			elseif (c >= 192 and c <= 223) then
				pos = pos + 2
			elseif (c >= 224 and c <= 239) then
				pos = pos + 3
			elseif (c >= 240 and c <= 247) then
				pos = pos + 4
			end
			if (len == i) then break end
		end

		if (len == i and pos <= bytes) then
			return string:sub(1, pos - 1)..(dots and '...' or '')
		else
			return string
		end
	end
end

local raid_spells = {
	[20484] = 600,	-- 复生
	[113269] = 600,	-- 复生 (共生技能)
	[126393] = 600, -- 永恒守护者 (魁麟?)
	[61999] = 600,	-- 复活盟友
	[20707] = 600,	-- 灵魂石复活
	[6346] = 180,	-- 防护恐惧结界
	[29166] = 180,	-- 激活
	[32182] = 300,	-- 英勇
	[2825] = 300,	-- 嗜血
	[80353] = 300,	-- 时间扭曲
	[90355] = 300,	-- 远古狂乱

	--团队免伤技能	
	[97462] = 180,  -- 集结呐喊
	[98008] = 180,  -- 灵魂链接图腾
	[62618] = 180,  -- 真言术: 障
	[51052] = 120,  -- 反魔法领域
	[70940] = 180,  -- 神圣守卫(FQ)
	[31821] = 120,  -- 光环掌握(NQ)
	[64843] = 180,  -- 神圣赞美诗 *
	[64901] = 360,	-- 希望圣歌
	[740]   = 180,  -- 宁静(ND) *
	[87023] = 60,   --FS
	[16190] = 180,  --SM 潮汐
	[105763] =180,  --NS 2T13
	[6940] = 120, --QS 牺牲之手
	[115213] = 180, --MONK 慈悲庇护
	[108280] = 180, --SM治疗之潮TT
}

local filter = COMBATLOG_OBJECT_AFFILIATION_RAID + COMBATLOG_OBJECT_AFFILIATION_PARTY + COMBATLOG_OBJECT_AFFILIATION_MINE
local band = bit.band
local sformat = string.format
local floor = math.floor
local timer = 0
local bars = {}

local FormatTime = function(time)
	if time >= 60 then
		return sformat("%.2d:%.2d", floor(time / 60), time % 60)
	else
		return sformat("%.2d", time)
	end
end

local CreateFS = function(frame, fsize, fstyle)
	local fstring = frame:CreateFontString(nil, "OVERLAY")
	fstring:FontTemplate(nil, E.db.general.fontSize, 'OUTLINE')
	return fstring
end

function RD:UpdatePositions()
	for i = 1, #bars do
		bars[i]:ClearAllPoints()
		if i == 1 then
			bars[i]:Point("TOPLEFT", RaidCDAnchor, "TOPLEFT", 26, 0)
		else
			if E.db["euiscript"].raidcd_direction == "up" then
				bars[i]:Point("BOTTOMLEFT", bars[i-1], "TOPLEFT", 0, 5)
			else
				bars[i]:Point("TOPLEFT", bars[i-1], "BOTTOMLEFT", 0, -5)
			end
		end
		bars[i].id = i
	end
end

function RD:StopTimer(bar)
	bar:SetScript("OnUpdate", nil)
	bar:Hide()
	tremove(bars, bar.id)
	self:UpdatePositions()
end

local BarUpdate = function(self, elapsed)
	local curTime = GetTime()
	if self.endTime < curTime then
		RD:StopTimer(self)
		return
	end
	self:SetValue(100 - (curTime - self.startTime) / (self.endTime - self.startTime) * 100)
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
		if ( GetNumGroupMembers() > 0 and IsInRaid() ) then
			SendChatMessage(sformat("EUI_RaidCD".." %s: %s", self.left:GetText(), self.right:GetText()), IsPartyLFG() and "INSTANCE_CHAT" or "RAID")
		elseif ( GetNumGroupMembers() > 0 and IsInGroup() ) then
			SendChatMessage(sformat("EUI_RaidCD".." %s: %s", self.left:GetText(), self.right:GetText()), IsPartyLFG() and "INSTANCE_CHAT" or "PARTY")
		else
			SendChatMessage(sformat("EUI_RaidCD".." %s: %s", self.left:GetText(), self.right:GetText()), "SAY")
		end
	elseif button == "RightButton" then
		RD:StopTimer(self)
	end
end

function RD:CreateBar()
	local bar = E.db.general.transparent and E:TranseBar(UIParent) or CreateFrame("Statusbar", nil, UIParent)
	bar:SetFrameStrata("LOW")
	bar:Size(E.db["euiscript"].raidcd_width - E.db["euiscript"].raidcd_height - 6, E.db["euiscript"].raidcd_height)
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

	bar.left = CreateFS(bar)
	bar.left:Point("LEFT", 2, 0)
	bar.left:SetJustifyH("LEFT")
	bar.left:Size(E.db["euiscript"].raidcd_width - E.db["euiscript"].raidcd_height, E.db["euiscript"].raidcd_height)

	bar.right = CreateFS(bar)
	bar.right:Point("RIGHT", 1, 0)
	bar.right:SetJustifyH("RIGHT")

	bar.icon = CreateFrame("Button", nil, bar)
	bar.icon:Size(E.db["euiscript"].raidcd_height)
	bar.icon:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -6, 0)

	bar.icon.backdrop = CreateFrame("Frame", nil, bar.icon)
	bar.icon.backdrop:Point("TOPLEFT", -2, 2)
	bar.icon.backdrop:Point("BOTTOMRIGHT", 2, -2)
	bar.icon.backdrop:SetTemplate("Default")
	bar.icon.backdrop:SetFrameStrata("BACKGROUND")

	return bar
end

function RD:StartTimer(name, spellId)
	for i = 1, #bars do
		if bars[i].spell == GetSpellInfo(spellId) and bars[i].name == name then
			return
		end
	end
	local bar = self:CreateBar()
	local spell, rank, icon = GetSpellInfo(spellId)
	bar.endTime = GetTime() + raid_spells[spellId]
	bar.startTime = GetTime()
	bar.left:SetText(utf8sub(name,6,true).." - "..spell)
	bar.right:SetText(FormatTime(raid_spells[spellId]))
	bar.icon:SetNormalTexture(icon)
	bar.icon:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
	bar.spell = spell
	bar.name = name
	bar:Show()
	local color = RAID_CLASS_COLORS[select(2, UnitClass(name))]
	if color then
		bar:SetStatusBarColor(color.r, color.g, color.b)
		bar.bg:SetVertexColor(color.r, color.g, color.b, 0.25)
	else
		bar:SetStatusBarColor(0.3, 0.7, 0.3)
		bar.bg:SetVertexColor(0.3, 0.7, 0.3, 0.25)
	end
	bar:SetScript("OnUpdate", BarUpdate)
	bar:EnableMouse(true)
	bar:SetScript("OnEnter", OnEnter)
	bar:SetScript("OnLeave", OnLeave)
	bar:SetScript("OnMouseDown", OnMouseDown)
	tinsert(bars, bar)
	self:UpdatePositions()
end

function RD:COMBAT_LOG_EVENT_UNFILTERED(...)
	local _, _, eventType, _, _, sourceName, sourceFlags = ...
	if band(sourceFlags, filter) == 0 then return end
	local spellId = select(13, ...)
	if raid_spells[spellId] and show[select(2, IsInInstance())] then
		if eventType == "SPELL_RESURRECT" and not spellId == 61999 then
			if spellId == 95750 then spellId = 6203 end
			self:StartTimer(sourceName, spellId)
		elseif eventType == "SPELL_AURA_APPLIED" then
			if spellId == 20707 and select(2, UnitClass(sourceName)) == 'WARLOCK' then
				self:StartTimer(sourceName, spellId)
			end
			if spellId == 87023 and select(2, UnitClass(sourceName)) == 'MAGE' then
				self:StartTimer(sourceName, spellId)
			end
			if spellId == 105763 and select(2, UnitClass(sourceName)) == 'SHAMAN' then
				self:StartTimer(sourceName, 16190)
			end				
		elseif eventType == "SPELL_CAST_SUCCESS" then
			self:StartTimer(sourceName, spellId)
		end
		if eventType == "SPELL_RESURRECT" and spellId == 20484 then self:StartTimer(sourceName, spellId) end
	end
end

function RD:ZONE_CHANGED_NEW_AREA()
	if select(2, IsInInstance()) == "arena" then
		for k, v in pairs(bars) do
			self:StopTimer(v)
		end
	end
end

function RD:ToggleRaidCD()
	if E.db.euiscript.raidcd then
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	else
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
	end
	self:UpdateSetting()
end

function RD:UpdateSetting()
	for i = 1, #bars do
		if bars[i] then
			bars[i]:SetScript("OnUpdate", nil)
			bars[i]:Hide()
		end
	end
	wipe(bars)
	
	RaidCDAnchor:SetSize(E.db["euiscript"].raidcd_width, E.db["euiscript"].raidcd_height)
end	

function RD:Initialize()
	local RaidCDAnchor = CreateFrame("Frame", "RaidCDAnchor", UIParent)
	RaidCDAnchor:Point("TOPLEFT", Minimap, "BOTTOMLEFT", 0, -28)
	RaidCDAnchor:SetSize(E.db["euiscript"].raidcd_width, E.db["euiscript"].raidcd_height)

	E:CreateMover(RaidCDAnchor, "RaidCDAnchorMover", L["raidcd"], nil, nil, nil, "ALL,EUI")
	
	self:ToggleRaidCD()
end	

E:RegisterModule(RD:GetName())