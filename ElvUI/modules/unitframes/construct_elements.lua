local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

function UF:SpawnMenu()
	local unit = E:StringTitle(self.unit)
	if self.unit:find("targettarget") then return; end
	if _G[unit.."FrameDropDown"] then
		ToggleDropDownMenu(1, nil, _G[unit.."FrameDropDown"], "cursor")
	elseif (self.unit:match("party")) then
		ToggleDropDownMenu(1, nil, _G["PartyMemberFrame"..self.id.."DropDown"], "cursor")
	else
		FriendsDropDown.unit = self.unit
		FriendsDropDown.id = self.id
		FriendsDropDown.initialize = RaidFrameDropDown_Initialize
		ToggleDropDownMenu(1, nil, FriendsDropDown, "cursor")
	end
end

function UF:Construct_ThreatGlow(frame, glow)
	local threat
	if glow then
		frame:CreateShadow('Default')
		threat = frame.shadow
		frame.shadow = nil
	else
		threat = CreateFrame('Frame')
	end
	threat.Override = self.UpdateThreat
	threat:SetFrameStrata('BACKGROUND')
	return threat
end

function UF:Construct_TargetGlow(frame)
	frame:CreateShadow('Default')
	local x = frame.shadow
	frame.shadow = nil
	x:SetFrameStrata('BACKGROUND')
	x:Hide();
	
	return x
end

local UpdaterOnUpdateH = function(Updater)
	local b = Updater:GetParent()
	local tex = b:GetStatusBarTexture()
	tex:ClearAllPoints()
	tex:SetPoint("BOTTOMRIGHT")
	tex:SetPoint("TOPLEFT", b, "TOPRIGHT", ((b:GetValue()/select(2,b:GetMinMaxValues())-1)*b:GetWidth()) or 0, 0)
end
local UpdaterOnUpdateV = function(Updater)
	local b = Updater:GetParent()
	local tex = b:GetStatusBarTexture()
	tex:ClearAllPoints()
	tex:SetPoint("TOPRIGHT")
	tex:SetPoint("BOTTOMLEFT", b, "TOPLEFT", 0, ((b:GetValue()/select(2,b:GetMinMaxValues())-1)*b:GetHeight()) or 0)
end
local OnChanged = function(bar)
	bar.Updater:Show()
end
function E:TranseBar(f, orientation)
	if orientation == nil then orientation = "HORIZONTAL" end
	
	local bar = CreateFrame("StatusBar", nil, f, nil) --separate frame for OnUpdates
	bar.Updater = CreateFrame("Frame", nil, bar)
	if orientation == "HORIZONTAL" then
		bar.Updater:SetScript("OnUpdate", UpdaterOnUpdateH)
	else
		bar.Updater:SetScript("OnUpdate", UpdaterOnUpdateV)
	end
	bar:SetScript("OnSizeChanged", OnChanged)
	bar:SetScript("OnValueChanged", OnChanged)
	bar:SetScript("OnMinMaxChanged", OnChanged)
	return bar;
end

function UF:Construct_HealthBar(frame, bg, text, textPos, orientation)
	local health
	if E.db.unitframe.transparent then
		health = E:TranseBar(frame, orientation)
	else
		health = CreateFrame('StatusBar', nil, frame)
	end
	
	UF['statusbars'][health] = true
	
	health:SetFrameStrata("LOW")
	--health.frequentUpdates = true
	health.PostUpdate = self.PostUpdateHealth
	
	if bg then
		if E.db.unitframe.transparent then
			local hbg = CreateFrame("Frame", nil, health)
			hbg:SetFrameLevel(health:GetFrameLevel()-2)
			hbg:SetAllPoints(health)
			hbg:SetAlpha(0)
			local b = hbg:CreateTexture(nil, "BACKGROUND")
			b:SetTexture(E["media"].normTex)
			b:SetAllPoints(health)
			health.bg = b
			health.hbg = hbg
		else
			health.bg = health:CreateTexture(nil, 'BORDER')
			health.bg:SetAllPoints()
			health.bg:SetTexture(E["media"].blankTex)
		end
		health.bg.multiplier = 0.25
	end
	
	if text then
		health.value = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')
		UF:Configure_FontString(health.value)
		health.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		health.value:Point(textPos, health, textPos, x, 0)		
	end
	
	health.colorTapping = true	
	health.colorDisconnected = true
	health:CreateBackdrop('Default')	

	return health
end

function UF:Construct_PowerBar(frame, bg, text, textPos, lowtext)
	local power = CreateFrame('StatusBar', nil, frame)
	UF['statusbars'][power] = true
	
	--power.frequentUpdates = true
	power:SetFrameStrata("LOW")
	power.PostUpdate = self.PostUpdatePower

	if bg then
		power.bg = power:CreateTexture(nil, 'BORDER')
		power.bg:SetAllPoints()
		power.bg:SetTexture(E["media"].blankTex)
		power.bg.multiplier = 0.2
	end
	
	if text then
		power.value = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')	
		UF:Configure_FontString(power.value)
		power.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		power.value:Point(textPos, frame.Health, textPos, x, 0)
	end
	
	if lowtext then
		power.LowManaText = power:CreateFontString(nil, 'OVERLAY')
		UF:Configure_FontString(power.LowManaText)
		power.LowManaText:SetParent(frame)
		power.LowManaText:Point("BOTTOM", frame.Health, "BOTTOM", 0, 7)
		power.LowManaText:SetTextColor(0.69, 0.31, 0.31)
	end
	
	power.colorDisconnected = false
	power.colorTapping = false
	power:CreateBackdrop('Default')

	return power
end	

function UF:Construct_Portrait(frame, type)
	local portrait
	
	if type == 'texture' then
		local backdrop = CreateFrame('Frame',nil,frame)
		portrait = frame:CreateTexture(nil, 'OVERLAY')
		portrait:SetTexCoord(0.15,0.85,0.15,0.85)
		backdrop:SetOutside(portrait)
		backdrop:SetFrameLevel(frame:GetFrameLevel())
		backdrop:SetTemplate('Default')
		portrait.backdrop = backdrop	
	else
		portrait = CreateFrame("PlayerModel", nil, frame)
		portrait:SetFrameStrata('LOW')
		portrait:CreateBackdrop('Default')
	end
	
	portrait.PostUpdate = self.PortraitUpdate

	portrait.overlay = CreateFrame("Frame", nil, frame)
	portrait.overlay:SetFrameLevel(frame:GetFrameLevel() - 5)
	
	return portrait
end

function UF:Construct_AuraIcon(button)
	button.text = button.cd:CreateFontString(nil, 'OVERLAY')
	button.text:Point('CENTER', 1, 1)
	button.text:SetJustifyH('CENTER')
	
	button:SetTemplate('Default')

	button.cd.noOCC = true
	button.cd.noCooldownCount = true
	button.cd:SetReverse()
	button.cd:SetInside()
	
	button.icon:SetInside()
	button.icon:SetTexCoord(unpack(E.TexCoords))
	button.icon:SetDrawLayer('ARTWORK')
	
	button.count:ClearAllPoints()
	button.count:Point('BOTTOMRIGHT', 1, 1)
	button.count:SetJustifyH('RIGHT')

	button.overlay:SetTexture(nil)
	button.stealable:SetTexture(nil)

	button:RegisterForClicks('RightButtonUp')
	button:SetScript('OnClick', function(self)
		if not IsShiftKeyDown() then return; end
		local auraName = self.name
		
		if auraName then
			E:Print(string.format(L['The spell "%s" has been added to the Blacklist unitframe aura filter.'], auraName))
			E.global['unitframe']['aurafilters']['Blacklist']['spells'][auraName] = {
				['enable'] = true,
				['priority'] = 0,			
			}
			
			UF:Update_AllFrames()
		end
	end)	
end

function UF:Construct_Buffs(frame)
	local buffs = CreateFrame('Frame', nil, frame)
	buffs.spacing = E.Spacing
	buffs.PostCreateIcon = self.Construct_AuraIcon
	buffs.PostUpdateIcon = self.PostUpdateAura
	buffs.CustomFilter = self.AuraFilter
	buffs.type = 'buffs'
	
	return buffs
end

function UF:Construct_Debuffs(frame)
	local debuffs = CreateFrame('Frame', nil, frame)
	debuffs.spacing = E.Spacing
	debuffs.PostCreateIcon = self.Construct_AuraIcon
	debuffs.PostUpdateIcon = self.PostUpdateAura
	debuffs.CustomFilter = self.AuraFilter
	debuffs.type = 'debuffs'
	
	return debuffs
end

function UF:Construct_Castbar(self, direction, moverName)
	local castbar = CreateFrame("StatusBar", nil, self)
	UF['statusbars'][castbar] = true
	castbar.CustomDelayText = UF.CustomCastDelayText
	castbar.CustomTimeText = UF.CustomTimeText
	castbar.PostCastStart = UF.PostCastStart
	castbar.PostChannelStart = UF.PostCastStart
	castbar.PostCastStop = UF.PostCastStop
	castbar.PostChannelStop = UF.PostCastStop
	castbar.PostChannelUpdate = UF.PostChannelUpdate
	castbar.PostCastInterruptible = UF.PostCastInterruptible
	castbar.PostCastNotInterruptible = UF.PostCastNotInterruptible
	castbar:SetClampedToScreen(true)
	castbar:CreateBackdrop('Default')
	
	castbar.Time = castbar:CreateFontString(nil, 'OVERLAY')	
	UF:Configure_FontString(castbar.Time)
	castbar.Time:Point("RIGHT", castbar, "RIGHT", -4, 0)
	castbar.Time:SetTextColor(0.84, 0.75, 0.65)
	castbar.Time:SetJustifyH("RIGHT")
	
	castbar.Text = castbar:CreateFontString(nil, 'OVERLAY')	
	UF:Configure_FontString(castbar.Text)
	castbar.Text:SetPoint("LEFT", castbar, "LEFT", 4, 0)
	castbar.Text:SetTextColor(0.84, 0.75, 0.65)
	
	castbar.Spark = castbar:CreateTexture(nil, 'OVERLAY')
	castbar.Spark:SetBlendMode('ADD')
	castbar.Spark:SetVertexColor(1, 1, 1)

	--Set to castbar.SafeZone
	castbar.LatencyTexture = castbar:CreateTexture(nil, "OVERLAY")
	castbar.LatencyTexture:SetTexture(E['media'].blankTex)
	castbar.LatencyTexture:SetVertexColor(0.69, 0.31, 0.31, 0.75)	

	local button = CreateFrame("Frame", nil, castbar)
	local holder = CreateFrame('Frame', nil, castbar)
	button:SetTemplate("Default")
	
	if direction == "LEFT" then
		holder:Point("TOPRIGHT", self, "BOTTOMRIGHT", 0, -(E.Border * 3))
		castbar:Point('BOTTOMRIGHT', holder, 'BOTTOMRIGHT', -E.Border, E.Border)
		button:Point("RIGHT", castbar, "LEFT", E.PixelMode and 0 or -3, 0)
	else
		holder:Point("TOPLEFT", self, "BOTTOMLEFT", 0, -(E.Border * 3))
		castbar:Point('BOTTOMLEFT', holder, 'BOTTOMLEFT', E.Border, E.Border)
		button:Point("LEFT", castbar, "RIGHT", E.PixelMode and 0 or 3, 0)
	end
	
	castbar.Holder = holder
	
	if moverName then
		E:CreateMover(castbar.Holder, self:GetName()..'CastbarMover', moverName, nil, -6, nil, 'ALL,SOLO')
	end

	local icon = button:CreateTexture(nil, "ARTWORK")
	icon:SetInside()
	icon:SetTexCoord(unpack(E.TexCoords))
	icon.bg = button
	
	--Set to castbar.Icon
	castbar.ButtonIcon = icon

	return castbar
end

function UF:Construct_PaladinResourceBar(frame)
	local bars = CreateFrame("Frame", nil, frame)
	bars:CreateBackdrop('Default')

	for i = 1, UF['classMaxResourceBar'][E.myclass] do					
		bars[i] = CreateFrame("StatusBar", nil, bars)
		bars[i]:SetStatusBarTexture(E['media'].blankTex) --Dummy really, this needs to be set so we can change the color
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
		UF['statusbars'][bars[i]] = true

		bars[i]:CreateBackdrop('Default')
		bars[i].backdrop:SetParent(bars)
	end
	
	bars.Override = UF.UpdateHoly
	
	return bars
end

function UF:Construct_MonkResourceBar(frame)
	local bars = CreateFrame("Frame", nil, frame)
	bars:CreateBackdrop('Default')

	for i = 1, UF['classMaxResourceBar'][E.myclass] do					
		bars[i] = CreateFrame("StatusBar", nil, bars)
		bars[i]:SetStatusBarTexture(E['media'].blankTex) --Dummy really, this needs to be set so we can change the color
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
		UF['statusbars'][bars[i]] = true

		bars[i]:CreateBackdrop('Default')
		bars[i].backdrop:SetParent(bars)
	end
	
	bars.PostUpdate = UF.UpdateHarmony
	
	return bars
end

function UF:Construct_MageResourceBar(frame)
	local bars = CreateFrame("Frame", nil, frame)
	bars:CreateBackdrop('Default')

	for i = 1, UF['classMaxResourceBar'][E.myclass] do					
		bars[i] = CreateFrame("StatusBar", nil, bars)
		bars[i]:SetStatusBarTexture(E['media'].blankTex) --Dummy really, this needs to be set so we can change the color
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
		
		bars[i].bg = bars[i]:CreateTexture(nil, 'ARTWORK')
		
		UF['statusbars'][bars[i]] = true

		bars[i]:CreateBackdrop('Default')
		bars[i].backdrop:SetParent(bars)
	end
	
	bars.PostUpdate = UF.UpdateArcaneCharges
	
	return bars
end

function UF:Construct_WarlockResourceBar(frame)
	local bars = CreateFrame("Frame", nil, frame)
	bars:CreateBackdrop('Default')

	for i = 1, UF['classMaxResourceBar'][E.myclass] do					
		bars[i] = CreateFrame("StatusBar", nil, bars)
		bars[i]:SetStatusBarTexture(E['media'].blankTex) --Dummy really, this needs to be set so we can change the color
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
		bars[i].bg = bars[i]:CreateTexture(nil, 'ARTWORK')
		UF['statusbars'][bars[i]] = true

		bars[i]:CreateBackdrop('Default')		
		bars[i].backdrop:SetParent(bars)
	end

	bars[1].Text = bars[1]:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(bars[1].Text)
	bars[1].Text:SetPoint("CENTER")	
	
	bars.PostUpdate = UF.UpdateShardBar
	
	return bars
end

function UF:Construct_PriestResourceBar(frame)
	local bars = CreateFrame("Frame", nil, frame)
	bars:CreateBackdrop('Default')

	for i = 1, UF['classMaxResourceBar'][E.myclass] do					
		bars[i] = CreateFrame("StatusBar", nil, bars)
		bars[i]:SetStatusBarTexture(E['media'].blankTex) --Dummy really, this needs to be set so we can change the color
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
		UF['statusbars'][bars[i]] = true

		bars[i]:CreateBackdrop('Default')		
		bars[i].backdrop:SetParent(bars)
	end
	
	bars.PostUpdate = UF.UpdateShadowOrbs
	
	return bars
end

function UF:Construct_DeathKnightResourceBar(frame)
	local runes = CreateFrame("Frame", nil, frame)
	runes:CreateBackdrop('Default')

	for i = 1, UF['classMaxResourceBar'][E.myclass] do
		runes[i] = CreateFrame("StatusBar", nil, runes)
		UF['statusbars'][runes[i]] = true
		runes[i]:SetStatusBarTexture(E['media'].blankTex)
		runes[i]:GetStatusBarTexture():SetHorizTile(false)
		
		runes[i]:CreateBackdrop('Default')
		runes[i].backdrop:SetParent(runes)
		
		runes[i].bg = runes[i]:CreateTexture(nil, 'BORDER')
		runes[i].bg:SetAllPoints()
		runes[i].bg:SetTexture(E['media'].blankTex)
		runes[i].bg.multiplier = 0.2
	end
	
	return runes
end

function UF:Construct_DruidResourceBar(frame)
	local eclipseBar = CreateFrame('Frame', nil, frame)
	eclipseBar:CreateBackdrop('Default')
	eclipseBar.PostUpdatePower = UF.EclipseDirection
	eclipseBar.PostUpdateVisibility = UF.DruidResourceBarVisibilityUpdate
	
	local lunarBar = CreateFrame('StatusBar', nil, eclipseBar)
	lunarBar:SetPoint('LEFT', eclipseBar)
	lunarBar:SetStatusBarTexture(E['media'].blankTex)
	UF['statusbars'][lunarBar] = true
	eclipseBar.LunarBar = lunarBar

	local solarBar = CreateFrame('StatusBar', nil, eclipseBar)
	solarBar:SetPoint('LEFT', lunarBar:GetStatusBarTexture(), 'RIGHT')
	solarBar:SetStatusBarTexture(E['media'].blankTex)
	UF['statusbars'][solarBar] = true
	eclipseBar.SolarBar = solarBar
	
	eclipseBar.Text = lunarBar:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(eclipseBar.Text)
	eclipseBar.Text:SetPoint("CENTER", eclipseBar, "CENTER")
	
	return eclipseBar
end

function UF:Construct_DruidAltManaBar(frame)
	local dpower = CreateFrame('Frame', nil, frame)
	dpower:SetFrameStrata("LOW")
	dpower:SetAllPoints(frame.EclipseBar.backdrop)
	dpower:SetTemplate("Default")
	dpower:SetFrameLevel(dpower:GetFrameLevel() + 1)
	dpower.colorPower = true
	dpower.PostUpdateVisibility = UF.DruidResourceBarVisibilityUpdate
	dpower.PostUpdatePower = UF.DruidPostUpdateAltPower
	
	dpower.ManaBar = CreateFrame('StatusBar', nil, dpower)
	UF['statusbars'][dpower.ManaBar] = true
	dpower.ManaBar:SetStatusBarTexture(E["media"].blankTex)
	dpower.ManaBar:SetInside(dpower)
	
	dpower.bg = dpower:CreateTexture(nil, "BORDER")
	dpower.bg:SetAllPoints(dpower.ManaBar)
	dpower.bg:SetTexture(E["media"].blankTex)
	dpower.bg.multiplier = 0.3

	dpower.Text = dpower.ManaBar:CreateFontString(nil, 'OVERLAY')
	dpower.Text:SetPoint("CENTER")
	UF:Configure_FontString(dpower.Text)
	
	return dpower
end

function UF:Construct_RestingIndicator(frame)
	local resting = frame:CreateTexture(nil, "OVERLAY")
	resting:Size(22)
	resting:Point("CENTER", frame.Health, "TOPLEFT", -3, 6)
	
	return resting
end

function UF:Construct_CombatIndicator(frame)
	local combat = frame:CreateTexture(nil, "OVERLAY")
	combat:Size(19)
	combat:Point("CENTER", frame.Health, "CENTER", 0,6)
	combat:SetVertexColor(0.69, 0.31, 0.31)
	
	return combat
end

function UF:Construct_PvPIndicator(frame)
	local pvp = frame:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(pvp)

	return pvp
end

function UF:Construct_AltPowerBar(frame)
	local altpower = CreateFrame("StatusBar", nil, frame)
	altpower:SetStatusBarTexture(E['media'].blankTex)
	UF['statusbars'][altpower] = true
	altpower:GetStatusBarTexture():SetHorizTile(false)

	altpower:SetFrameStrata("MEDIUM")
	altpower.PostUpdate = UF.AltPowerBarPostUpdate
	altpower:CreateBackdrop("Default", true)

	altpower.text = altpower:CreateFontString(nil, 'OVERLAY')
	altpower.text:SetPoint("CENTER")
	altpower.text:SetJustifyH("CENTER")		
	UF:Configure_FontString(altpower.text)
	
	return altpower
end

function UF:Construct_NameText(frame)
	local parent = frame.RaisedElementParent or frame
	local name = parent:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(name)
	name:SetPoint('CENTER', frame.Health)
	
	return name
end

function UF:Construct_Combobar(frame)
	local CPoints = CreateFrame("Frame", nil, frame)
	CPoints:CreateBackdrop('Default')
	CPoints.Override = UF.UpdateComboDisplay

	for i = 1, MAX_COMBO_POINTS do
		CPoints[i] = CreateFrame("StatusBar", nil, CPoints)
		UF['statusbars'][CPoints[i]] = true
		CPoints[i]:SetStatusBarTexture(E['media'].blankTex)
		CPoints[i]:GetStatusBarTexture():SetHorizTile(false)
		
		CPoints[i]:CreateBackdrop('Default')
		CPoints[i].backdrop:SetParent(CPoints)
		CPoints[i].backdrop:CreateShadow('Default')
		CPoints[i].backdrop.shadow:Point("TOPLEFT", -4, 4)
	end
	
	CPoints[1]:SetStatusBarColor(0.69, 0.31, 0.31)		
	CPoints[2]:SetStatusBarColor(0.69, 0.31, 0.31)
	CPoints[3]:SetStatusBarColor(0.65, 0.63, 0.35)
	CPoints[4]:SetStatusBarColor(0.65, 0.63, 0.35)
	CPoints[5]:SetStatusBarColor(0.33, 0.59, 0.33)	
	
	for i = 1, MAX_COMBO_POINTS do
		CPoints[i].backdrop.shadow:SetBackdropBorderColor(CPoints[i]:GetStatusBarColor())
	end
	
	return CPoints
end

function UF:Construct_AuraWatch(frame)
	local auras = CreateFrame("Frame", nil, frame)
	auras:SetFrameLevel(frame:GetFrameLevel() + 25)
	auras:SetInside(frame.Health)
	auras.presentAlpha = 1
	auras.missingAlpha = 0
	auras.strictMatching = true;
	auras.icons = {}
		
	return auras
end

function UF:Construct_RaidDebuffs(frame)
	local rdebuff = CreateFrame('Frame', nil, frame.RaisedElementParent)
	rdebuff:Point('BOTTOM', frame, 'BOTTOM', 0, 2)
	rdebuff:SetTemplate("Default")

	if E.PixelMode then
		rdebuff.border = rdebuff:CreateTexture(nil, "BACKGROUND");
		rdebuff.border:Point("TOPLEFT", -E.mult, E.mult);
		rdebuff.border:Point("BOTTOMRIGHT", E.mult, -E.mult);
		rdebuff.border:SetTexture(E["media"].blankTex);
		rdebuff.border:SetVertexColor(0, 0, 0);
	end	
	
	rdebuff.icon = rdebuff:CreateTexture(nil, 'OVERLAY')
	rdebuff.icon:SetTexCoord(unpack(E.TexCoords))
	rdebuff.icon:SetInside()
	
	rdebuff.count = rdebuff:CreateFontString(nil, 'OVERLAY')
	rdebuff.count:FontTemplate(nil, 10, 'OUTLINE')
	rdebuff.count:SetPoint('BOTTOMRIGHT', 0, 2)
	rdebuff.count:SetTextColor(1, .9, 0)
	
	rdebuff.time = rdebuff:CreateFontString(nil, 'OVERLAY')
	rdebuff.time:FontTemplate(nil, 10, 'OUTLINE')
	rdebuff.time:SetPoint('CENTER')
	rdebuff.time:SetTextColor(1, .9, 0)
	
	return rdebuff
end

function UF:Construct_DebuffHighlight(frame)
	local dbh = frame:CreateTexture(nil, "OVERLAY")
	dbh:SetInside(frame.Health.backdrop)
	dbh:SetTexture(LSM:Fetch("statusbar", "Line"))
	dbh:SetVertexColor(0, 0, 0, 0)
	dbh:SetBlendMode("ADD")
	frame.DebuffHighlightFilter = true
	frame.DebuffHighlightAlpha = 1
	
	if frame.Health then
		dbh:SetParent(frame.Health)
	end
			
	return dbh
end

function UF:Construct_ResurectionIcon(frame)
	local tex = frame.RaisedElementParent:CreateTexture(nil, "OVERLAY")
	tex:Point('CENTER', frame.Health.value, 'CENTER')
	tex:Size(30, 25)
	tex:SetDrawLayer('OVERLAY', 7)
	
	return tex
end

function UF:Construct_RaidIcon(frame)
	local tex = (frame.RaisedElementParent or frame):CreateTexture(nil, "OVERLAY")
	tex:SetTexture("Interface\\AddOns\\ElvUI\\media\\textures\\raidicons.blp") 
	tex:Size(18)
	tex:Point("CENTER", frame.Health, "TOP", 0, 2)
	tex.SetTexture = E.noop
	
	return tex
end

function UF:Construct_ReadyCheckIcon(frame)
	local tex = frame.RaisedElementParent:CreateTexture(nil, "OVERLAY", nil, 7)
	tex:Size(12)
	tex:Point("BOTTOM", frame.Health, "BOTTOM", 0, 2)
	
	return tex
end

function UF:Construct_RoleIcon(frame)
	local f = CreateFrame('Frame', nil, frame)
	
	local tex = f:CreateTexture(nil, "ARTWORK")
	tex:Size(17)
	tex:Point("BOTTOM", frame.Health, "BOTTOM", 0, 2)
	tex.Override = UF.UpdateRoleIcon
	frame:RegisterEvent("UNIT_CONNECTION", UF.UpdateRoleIcon)
	
	return tex
end

function UF:Construct_Trinket(frame)
	local trinket = CreateFrame("Frame", nil, frame)
	trinket.bg = CreateFrame("Frame", nil, trinket)
	trinket.bg:SetTemplate("Default")
	trinket.bg:SetFrameLevel(trinket:GetFrameLevel() - 1)
	trinket:SetInside(trinket.bg)
	
	return trinket
end

function UF:Construct_PVPSpecIcon(frame)
	local specIcon = CreateFrame("Frame", nil, frame)
	specIcon.bg = CreateFrame("Frame", nil, specIcon)
	specIcon.bg:SetTemplate("Default")
	specIcon.bg:SetFrameLevel(specIcon:GetFrameLevel() - 1)
	specIcon:SetInside(specIcon.bg)
	
	return specIcon
end

function UF:Construct_HealComm(frame)
	local mhpb = CreateFrame('StatusBar', nil, frame)
	mhpb:SetStatusBarTexture(E["media"].blankTex)
	mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)
	mhpb:SetFrameLevel(frame.Health:GetFrameLevel() - 2)
	mhpb:Hide()
	
	local ohpb = CreateFrame('StatusBar', nil, frame)
	ohpb:SetStatusBarTexture(E["media"].blankTex)
	ohpb:SetStatusBarColor(0, 1, 0, 0.25)
	mhpb:SetFrameLevel(mhpb:GetFrameLevel())	
	ohpb:Hide()
	
	if frame.Health then
		ohpb:SetParent(frame.Health)
		mhpb:SetParent(frame.Health)
	end
	
	return {
		myBar = mhpb,
		otherBar = ohpb,
		maxOverflow = 1,
		PostUpdate = function(self)
			if self.myBar:GetValue() == 0 then self.myBar:SetAlpha(0) else self.myBar:SetAlpha(1) end
			if self.otherBar:GetValue() == 0 then self.otherBar:SetAlpha(0) else self.otherBar:SetAlpha(1) end
		end
	}
end

function UF:Construct_RaidRoleFrames(frame)
	local anchor = CreateFrame('Frame', nil, frame)
	frame.Leader = anchor:CreateTexture(nil, 'OVERLAY')
	frame.MasterLooter = anchor:CreateTexture(nil, 'OVERLAY')
	
	anchor:Size(24, 12)
	frame.Leader:Size(12)
	frame.MasterLooter:Size(11)
	
	frame.Leader.PostUpdate = UF.RaidRoleUpdate
	frame.MasterLooter.PostUpdate = UF.RaidRoleUpdate
	
	return anchor
end

function UF:Construct_AuraBars()
	local bar = self.statusBar
	
	self:SetTemplate('Default')

	bar:SetInside(self)
	UF['statusbars'][bar] = true
	UF:Update_StatusBar(bar)
		
	UF:Configure_FontString(bar.spelltime)
	UF:Configure_FontString(bar.spellname)
	UF:Update_FontString(bar.spelltime)
	UF:Update_FontString(bar.spellname)
	
	bar.spellname:ClearAllPoints()
	bar.spellname:SetPoint('LEFT', bar, 'LEFT', 2, 0)
	bar.spellname:SetPoint('RIGHT', bar.spelltime, 'LEFT', -4, 0)
		
	bar.iconHolder:SetTemplate('Default')
	bar.icon:SetInside(bar.iconHolder)
	bar.icon:SetDrawLayer('OVERLAY')
	
	bar.iconHolder:RegisterForClicks('RightButtonUp')
	bar.iconHolder:SetScript('OnClick', function(self)
		if not IsShiftKeyDown() then return; end
		local auraName = self:GetParent().aura.name
		
		if auraName then
			E:Print(string.format(L['The spell "%s" has been added to the Blacklist unitframe aura filter.'], auraName))
			E.global['unitframe']['aurafilters']['Blacklist']['spells'][auraName] = {
				['enable'] = true,
				['priority'] = 0,			
			}
			UF:Update_AllFrames()
		end
	end)
end

function UF:Construct_AuraBarHeader(frame)
	local auraBar = CreateFrame('Frame', nil, frame)
	auraBar.PostCreateBar = UF.Construct_AuraBars
	auraBar.gap = (E.PixelMode and -1 or 1)
	auraBar.spacing = (E.PixelMode and -1 or 1)
	auraBar.spark = true
	auraBar.sort = true
	auraBar.filter = UF.AuraBarFilter
	auraBar.PostUpdate = UF.ColorizeAuraBars

	local holder = CreateFrame('Frame', nil, auraBar)
	holder:Point("BOTTOM", frame, "TOP", 0, 0)
	holder:SetSize(360, 20)
	auraBar:SetPoint("BOTTOM", holder, "TOP", 0, 0)
	auraBar.Holder = holder
	
	return auraBar
end

local function CreateSwingStatusBar(parent)
	local sbar = CreateFrame("Statusbar", nil, parent)
	sbar:SetPoint("TOPLEFT")
	sbar:SetPoint("BOTTOMRIGHT")
	sbar:SetStatusBarTexture(E["media"].normTex)
	sbar:SetStatusBarColor(unpack(E["media"].bordercolor))
	sbar:SetFrameLevel(20)
	sbar:SetFrameStrata("LOW")
	sbar:Hide()
		
	sbar.backdrop = CreateFrame("Frame", nil, sbar)
	sbar.backdrop:SetFrameLevel(sbar:GetFrameLevel() - 1)
	sbar.backdrop:Point("TOPLEFT", parent, "TOPLEFT", -2, 2)
	sbar.backdrop:Point("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 2, -2)
	sbar.backdrop:SetTemplate("Default")
	return sbar
end

function UF:ConstructSwingBar(frame)
	local swing = CreateFrame("Frame", nil, frame)
	swing.Twohand = CreateSwingStatusBar(swing)
	swing.Mainhand = CreateSwingStatusBar(swing)
	swing.Offhand = CreateSwingStatusBar(swing)
	swing.hideOoc = true
	return swing
end

function UF:Construct_TankShield(frame)
	local bs = CreateFrame("Button", nil, frame, "SecureActionButtonTemplate")
	bs:RegisterForClicks('AnyUp')
	bs:SetTemplate("Default")
	bs:StyleButton()
	bs:SetFrameStrata('LOW')
	bs:SetFrameLevel(frame:GetFrameLevel() + 2)
	bs:SetAlpha(0)
	
	bs.Icon = bs:CreateTexture(nil, 'ARTWORK')
	bs.Icon:Point("TOPLEFT", 2, -2)
	bs.Icon:Point("BOTTOMRIGHT", -2, 2)
	bs.Icon:SetTexCoord(.08, .92, .08, .92)

	bs.time = bs:CreateFontString(nil, 'OVERLAY')
	bs.time:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.unitframe.units.player.height * 0.6, 'OUTLINE')
	bs.time:SetPoint("CENTER")
	bs.time:SetTextColor(1,1,0)

	bs.text = bs:CreateFontString(nil, 'OVERLAY')
	bs.text:FontTemplate(LSM:Fetch("font", E.db.unitframe.font), E.db.unitframe.fontSize + 2, 'OUTLINE')
	bs.text:Point("BOTTOMRIGHT", bs, "BOTTOMRIGHT", 0, 0)
	
	bs.sb = CreateFrame("StatusBar", nil, bs)
	bs.sb:SetOrientation("VERTICAL")
	bs.sb:SetStatusBarTexture(E["media"].normTex)
	bs.sb:SetStatusBarColor(0.8, 0.1, 0.1)
	bs.sb:CreateBackdrop('Default')	
	bs.sb:SetAlpha(0)
	
	return bs
end

function UF:Construct_Tapped(frame)
	local tapped = frame:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(tapped)

	return tapped
end