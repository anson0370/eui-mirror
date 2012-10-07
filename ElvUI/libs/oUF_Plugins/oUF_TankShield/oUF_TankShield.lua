--[[
	Project.: oUF_TankShield
	File....: oUF_TankShield.lua
	Version.: 50001.1
	Rev Date: 10/03/2012
	Authors.: Eui.cc
]]

local _, ns = ...
local oUF = oUF or ns.oUF

local _, class = UnitClass("player")
local BS_Name
local BS_Value = false

if class == "DRUID" then
	BS_Name = GetSpellInfo(62606)
elseif class == "DEATHKNIGHT" then
	BS_Name = GetSpellInfo(77535)
	BS_Value = true
elseif class == "PRIEST" then
	BS_Name = GetSpellInfo(17)
elseif class == "PALADIN" then
	BS_Name = GetSpellInfo(132403)
elseif class == 'WARRIOR' then
	BS_Name = GetSpellInfo(132404)
elseif class == 'MONK' then
	BS_Name = GetSpellInfo(115307)
	BS_Value = GetSpellInfo(124275)
end

local UnitAura = UnitAura
local InCombatLockdown = InCombatLockdown

local function ShortValue(v)
	if v >= 1e6 then
		return ("%.0fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
	elseif v >= 1e3 or v <= -1e3 then
		return ("%.0fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return v
	end
end

local function OnUpdate(self, elapsed)
	local time = GetTime();

	if (time > self.expires) then
		self:Hide()
		self.sb:Hide()
		self.text:SetText('')
		self.time:SetText('')
		self.expires = nil
		self:SetScript("OnUpdate", nil)
	else
		local remaining = self.expires - time
		self.time:SetText(tostring(math.floor(remaining)))
	end
end

local function valueChanged(self, event, unit)
	if unit ~= "player" or not BS_Name then return end
	local bar = self.TankShield
	
	if bar.PreUpdate then
		return bar:PreUpdate(name)
	end	
	
	if UnitBuff('player', BS_Name) then
		local _, _, icon, _, _, _, expires, _, _, _, _, _, _, value = UnitBuff('player', BS_Name)
		if value and class == 'DEATHKNIGHT' then
			if not bar.sb.max then bar.sb.max = UnitHealthMax("player") end
			if value > bar.sb.max then value = bar.sb.max end
			bar.sb:SetMinMaxValues(0, bar.sb.max)
			bar.sb:SetValue(value)
			bar.text:SetText(ShortValue(value))
			bar.sb:Show()
		end
		if class == 'MONK' then
			local _, _, icon, _, _, etime, eexpires, _, _, _, _, _, _, evalue = UnitDebuff('player', BS_Value)
			if etime then
				bar.text:SetText(evalue)
				bar.sb:SetMinMaxValues(0, etime)
				bar.sb:SetValue(math.floor(eexpires - GetTime()))
				bar.sb:Show()
			else
				bar.text:SetText('')
				bar.sb:SetMinMaxValues(0, 0)
				bar.sb:SetValue(0)
				bar.sb:Hide()
			end
		end
		if icon then
			bar:Show()
			bar.Icon:SetTexture(icon)
			bar.expires = expires
			if (expires > 0) then
				OnUpdate(bar, 0)
				bar:SetScript("OnUpdate", OnUpdate)
			end
		end
	else
		bar:Hide()
		bar.sb:Hide()
		bar.text:SetText('')
		bar.time:SetText('')
		bar.expires = nil
		bar:SetScript("OnUpdate", nil)
	end
	
	if bar.PostUpdate then
		return bar:PostUpdate(name)
	end
end

local function maxChanged(self, event, unit)
	if unit ~= "player" or not BS_Name then return end
	local bar = self.TankShield
	
	local health = UnitHealthMax("player")
	
	if not health then return end
	
	if class == 'MONK' then
		bar.sb.max = 10
		bar.sb:SetMinMaxValues(0, bar.sb.max)
	else
		bar.sb.max = health
		bar.sb:SetMinMaxValues(0, bar.sb.max)
	end
	
	valueChanged(self, event, unit)
end

local function Enable(self, unit)
	local f = self.TankShield
	
	if f and unit == "player" and BS_Name then
		self:RegisterEvent("UNIT_AURA", valueChanged)
		
		if BS_Value then
			self:RegisterEvent("UNIT_MAXHEALTH", maxChanged)
			self:RegisterEvent("UNIT_LEVEL", maxChanged)
		end
		
		f:Hide()
		f.sb:Hide()
		
		return true
	end
end

local function Disable(self)
	local f = self.TankShield
	
	if f and BS_Name then
		self:UnregisterEvent("UNIT_AURA", valueChanged)
		if BS_Value then
			self:UnregisterEvent("UNIT_MAXHEALTH", maxChanged)
			self:UnregisterEvent("UNIT_LEVEL", maxChanged)
		end
	end
end

oUF:AddElement("TankShield", nil, Enable, Disable)