local E = unpack(ElvUI); --Engine
local S = E:GetModule('EuiScript')
local LSM = LibStub("LibSharedMedia-3.0");
local BS_Name

if E.myclass == "DRUID" then
	BS_Name = GetSpellInfo(62606)
elseif E.myclass == "DEATHKNIGHT" then
	BS_Name = GetSpellInfo(77535)
elseif E.myclass == "PRIEST" then
	BS_Name = GetSpellInfo(17)
elseif E.myclass == "PALADIN" then
	BS_Name = GetSpellInfo(132403)
elseif E.myclass == 'WARRIOR' then
	BS_Name = GetSpellInfo(132404)
elseif E.myclass == 'MONK' then
	BS_Name = GetSpellInfo(115307)
end

local function CreateBS()
	local bs = CreateFrame("Frame", 'EuiBloodShield', UIParent)
	bs:Size(E.db.unitframe.units.player.height * .6)
	bs:SetTemplate("Default")
	bs:Hide()

	bs.Icon = bs:CreateTexture(nil, 'ARTWORK')
	bs.Icon:Point("TOPLEFT", 2, -2)
	bs.Icon:Point("BOTTOMRIGHT", -2, 2)
	bs.Icon:SetTexCoord(.08, .92, .08, .92)

	bs.text = bs:CreateFontString(nil, 'OVERLAY')
	bs.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.unitframe.fontSize + 2, E.db.unitframe.fontoutline)

	bs.time = bs:CreateFontString(nil, 'OVERLAY')
	bs.time:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.unitframe.fontSize + 2, 'OUTLINE')
	bs.time:SetPoint("CENTER")
	
	return bs
end

local function OnUpdate(self, elapsed)
	local time = GetTime();

	if (time > self.expires) then
		self:Hide()
		self.text:SetText('')
		self.time:SetText('')
		self.expires = nil
		self:SetScript("OnUpdate", nil)
	else
		local remaining = self.expires - time
		self.time:SetText(tostring(math.floor(remaining)))
	end
end

function S:UNIT_AURA()
	if UnitBuff('player', BS_Name) then
		local _, _, icon, _, _, _, expires, _, _, _, _, _, _, value = UnitBuff('player', BS_Name)
		if value and E.myclass == 'DEATHKNIGHT' then
			self.BS.text:SetText(E:ShortValue(value))
		end
		if icon then
			self.BS:Show()
			self.BS.Icon:SetTexture(icon)
			self.BS.expires = expires
			if (expires > 0) then
				OnUpdate(self.BS, 0)
				self.BS:SetScript("OnUpdate", OnUpdate)
			end
		end
	else
		self.BS:Hide()
		self.BS.text:SetText('')
		self.BS.time:SetText('')
		self.BS.expires = nil
		self.BS:SetScript("OnUpdate", nil)
	end
end

local function closeFunc()
	E.db.euiscript.bloodshield = false
	S:ToggleBloodShield()
end

local function openFunc()
	E.db.euiscript.bloodshield = true
	S:ToggleBloodShield()
end
	
function S:ToggleBloodShield()
	if E.db.euiscript.bloodshield then
		if not EuiBloodShield then S.BS = CreateBS() end
		S:RegisterEvent("UNIT_AURA")
	else
		S:UnregisterEvent("UNIT_AURA")
		S.BS:SetScript("OnUpdate", nil)
		S.BS:Hide()
	end
end		

function S:LoadBloodShield()
	if not E.db.euiscript.bloodshield or E.db.unitframe.units.player.tankshield then return end

	if not BS_Name then return end
	if ElvUF_Player == nil then return end
		
	local bs = CreateBS()
	S.BS = bs	

	bs:Point("CENTER", ElvUF_Player, "CENTER", -20, 0)
	bs:SetFrameLevel(ElvUF_Player:GetFrameLevel()+1)
	bs.text:Point("LEFT", bs, "RIGHT", 2, 0)
	
	E:CreateMover(bs, 'EuiBloodShieldMover', BS_Name, nil, nil, nil, "ALL,EUI,SOLO", closeFunc, openFunc)
	
	self:RegisterEvent("UNIT_AURA")
end
