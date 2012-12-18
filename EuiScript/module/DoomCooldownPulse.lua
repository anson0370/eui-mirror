local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

if( E.db.euiscript.dcp ~= true ) then return end
local fadeInTime, fadeOutTime, maxAlpha, animScale, iconSize, holdTime, ignoredSpells
local cooldowns, animating, watching = { }, { }, { }
local GetTime = GetTime

local defaultsettings = { 
    fadeInTime = 0.3, 
    fadeOutTime = 0.7, 
    maxAlpha = 0.7, 
    animScale = 1.5, 
    iconSize = 75, 
    holdTime = 0,
    petOverlay = {1,1,1},
    ignoredSpells = "",
	showSpellName = nil,
    x = UIParent:GetWidth()/2, 
    y = UIParent:GetHeight()/2 
}

local DCP = CreateFrame("frame")
DCP:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
DCP:SetMovable(true)
DCP:RegisterForDrag("LeftButton")
DCP:SetScript("OnDragStart", function(self) self:StartMoving() end)
DCP:SetScript("OnDragStop", function(self) 
    self:StopMovingOrSizing() 
    E.db.euiscript.dcp_saved.x = self:GetLeft()+self:GetWidth()/2 
    E.db.euiscript.dcp_saved.y = self:GetBottom()+self:GetHeight()/2 
    self:ClearAllPoints() 
    self:SetPoint("CENTER",UIParent,"BOTTOMLEFT",E.db.euiscript.dcp_saved.x,E.db.euiscript.dcp_saved.y)
end)
DCP:SetTemplate("Default")

DCP.TextFrame = DCP:CreateFontString(nil, "ARTWORK")

DCP.TextFrame:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
DCP.TextFrame:SetShadowOffset(2,-2)
DCP.TextFrame:SetPoint("CENTER",DCP,"CENTER")
DCP.TextFrame:SetWidth(185)
DCP.TextFrame:SetJustifyH("CENTER")
DCP.TextFrame:SetTextColor(1,1,1)

local DCPT = DCP:CreateTexture(nil,"BACKGROUND")
--DCPT:SetAllPoints(DCP)
DCPT:SetTexCoord( .08, .92, .08, .92 )
DCPT:Point("TOPLEFT", 2, -2)
DCPT:Point("BOTTOMRIGHT", -2, 2)
-----------------------
-- Utility Functions --
-----------------------
local function tcount(tab)
    local n = 0
    for _ in pairs(tab) do
        n = n + 1
    end
    return n
end

local function GetPetActionIndexByName(name)
    for i=1, NUM_PET_ACTION_SLOTS, 1 do
        if (GetPetActionInfo(i) == name) then
            return i
        end
    end
    return nil
end

local function RefreshLocals()
    fadeInTime = E.db.euiscript.dcp_saved.fadeInTime
    fadeOutTime = E.db.euiscript.dcp_saved.fadeOutTime
    maxAlpha = E.db.euiscript.dcp_saved.maxAlpha
    animScale = E.db.euiscript.dcp_saved.animScale
    iconSize = E.db.euiscript.dcp_saved.iconSize
    holdTime = E.db.euiscript.dcp_saved.holdTime
	showSpellName = E.db.euiscript.dcp_saved.showSpellName

    ignoredSpells = { }
    for _,v in ipairs({strsplit(",",E.db.euiscript.dcp_saved.ignoredSpells)}) do
        ignoredSpells[strtrim(v)] = true
    end
end

--------------------------
-- Cooldown / Animation --
--------------------------
local elapsed = 0
local runtimer = 0
local function OnUpdate(_,update)
    elapsed = elapsed + update
    if (elapsed > 0.05) then
        for i,v in pairs(watching) do
            if (GetTime() >= v[1] + 0.5) then
                if ignoredSpells and ignoredSpells[i] then
                    watching[i] = nil
                else
                    local start, duration, enabled, texture, isPet, name
                    if (v[2] == "spell") then
						name = GetSpellInfo(v[3])
                        texture = GetSpellTexture(v[3])
                        start, duration, enabled = GetSpellCooldown(v[3])
                    elseif (v[2] == "item") then
						name = GetItemInfo(i)
                        texture = v[3]
                        start, duration, enabled = GetItemCooldown(i)
                    elseif (v[2] == "pet") then
                        texture = select(3,GetPetActionInfo(v[3]))
                        start, duration, enabled = GetPetActionCooldown(v[3])
                        isPet = true
                    end

                    if (enabled ~= 0) then
                        if (duration and duration > 2.0 and texture) then
                            cooldowns[i] = { start, duration, texture, isPet, name }

                        end
                    end

                    if (not (enabled == 0 and v[2] == "spell")) then
                        watching[i] = nil
                    end
                end
            end
        end

        for i,v in pairs(cooldowns) do
            local remaining = v[2]-(GetTime()-v[1])
            if (remaining <= 0) then
                tinsert(animating, {v[3],v[4],v[5]})
                cooldowns[i] = nil
            end
        end

        
        elapsed = 0
        if (#animating == 0 and tcount(watching) == 0 and tcount(cooldowns) == 0) then
            DCP:SetScript("OnUpdate", nil)
			DCP:SetAlpha(0) -- eui.cc
            return
        end
    end

    
    if (#animating > 0) then
        runtimer = runtimer + update
        if (runtimer > (fadeInTime + holdTime + fadeOutTime)) then
            tremove(animating,1)
            runtimer = 0
			DCP.TextFrame:SetText(nil)
            DCPT:SetTexture(nil)
            DCPT:SetVertexColor(1,1,1)
			DCP:SetAlpha(0) -- eui.cc

        else
            if (not DCPT:GetTexture()) then

				if (animating[1][3] ~= nil and showSpellName) then

					DCP.TextFrame:SetText(animating[1][3])
				end
                DCPT:SetTexture(animating[1][1])
                if animating[1][2] then
                    DCPT:SetVertexColor(unpack(E.db.euiscript.dcp_saved.petOverlay))
                end

            --  PlaySoundFile("Interface\\AddOns\\Doom_CooldownPulse\\lubdub.wav")
            end
            local alpha = maxAlpha
            if (runtimer < fadeInTime) then
                alpha = maxAlpha * (runtimer / fadeInTime)
            elseif (runtimer >= fadeInTime + holdTime) then
                alpha = maxAlpha - ( maxAlpha * ((runtimer - holdTime - fadeInTime) / fadeOutTime))
            end

            DCP:SetAlpha(alpha)

            local scale = iconSize+(iconSize*((animScale-1)*(runtimer/(fadeInTime+holdTime+fadeOutTime))))
            DCP:SetWidth(scale)
            DCP:SetHeight(scale)


        end
    end
end

--------------------
-- Event Handlers --
--------------------
function DCP:ADDON_LOADED(addon)
    RefreshLocals()
    self:SetPoint("CENTER",UIParent,"BOTTOMLEFT",E.db.euiscript.dcp_saved.x,E.db.euiscript.dcp_saved.y)
	self:UnregisterEvent("ADDON_LOADED")
end
DCP:RegisterEvent("ADDON_LOADED")

function DCP:UNIT_SPELLCAST_SUCCEEDED(unit,spell,rank)
    if (unit == "player") then
        watching[spell] = {GetTime(),"spell",spell.."("..rank..")"}
        if (not self:IsMouseEnabled()) then
            self:SetScript("OnUpdate", OnUpdate)
        end
    end
end
DCP:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

function DCP:COMBAT_LOG_EVENT_UNFILTERED(...)
    local _,event,_,_,_,sourceFlags,_,_,_,_,_,spellID = ...
    if (event == "SPELL_CAST_SUCCESS") then
        if (bit.band(sourceFlags,COMBATLOG_OBJECT_TYPE_PET) == COMBATLOG_OBJECT_TYPE_PET and bit.band(sourceFlags,COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE) then
            local name = GetSpellInfo(spellID)
            local index = GetPetActionIndexByName(name)
            if (index and not select(7,GetPetActionInfo(index))) then
                watching[name] = {GetTime(),"pet",index}
            elseif (not index and name) then
                watching[name] = {GetTime(),"spell",name}
            else
                return
            end
            if (not self:IsMouseEnabled()) then
                self:SetScript("OnUpdate", OnUpdate)
            end
        end
    end
end
DCP:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

function DCP:PLAYER_ENTERING_WORLD()
    local inInstance,instanceType = IsInInstance()
    if (inInstance and instanceType == "arena") then
        self:SetScript("OnUpdate", nil)
        wipe(cooldowns)
        wipe(watching)
    end
end
DCP:RegisterEvent("PLAYER_ENTERING_WORLD")

hooksecurefunc("UseAction", function(slot)
    local actionType,itemID = GetActionInfo(slot)
    if (actionType == "item") then
        local texture = GetActionTexture(slot)
        watching[itemID] = {GetTime(),"item",texture}
    end
end)

hooksecurefunc("UseInventoryItem", function(slot)
    local itemID = GetInventoryItemID("player", slot);
    if (itemID) then
        local texture = GetInventoryItemTexture("player", slot)
        watching[itemID] = {GetTime(),"item",texture}
    end
end)
hooksecurefunc("UseContainerItem", function(bag,slot)
    local itemID = GetContainerItemID(bag, slot)
    if (itemID) then
        local texture = select(10, GetItemInfo(itemID))
        watching[itemID] = {GetTime(),"item",texture}
    end
end)

------------------
-- Options Frame --
-------------------

SlashCmdList["DOOMCOOLDOWNPULSE"] = function() if (not DCP_OptionsFrame) then DCP:CreateOptionsFrame() end DCP_OptionsFrame:Show() end

SLASH_DOOMCOOLDOWNPULSE1 = "/dcp"
SLASH_DOOMCOOLDOWNPULSE2 = "/cooldownpulse"
SLASH_DOOMCOOLDOWNPULSE3 = "/doomcooldownpulse"

function DCP:CreateOptionsFrame()
    local sliders = {
        { text = L["Icon Size"], value = "iconSize", min = 30, max = 125, step = 5 },
        { text = L["Fade In Time"], value = "fadeInTime", min = 0, max = 2.5, step = 0.1 },
        { text = L["Fade Out Time"], value = "fadeOutTime", min = 0, max = 2.5, step = 0.1 },
        { text = L["Max Opacity"], value = "maxAlpha", min = 0, max = 1, step = 0.1 },
        { text = L["Max Opacity Hold Time"], value = "holdTime", min = 0, max = 2.5, step = 0.1 },
        { text = L["Animation Scaling"], value = "animScale", min = 0, max = 2, step = 0.1 },
    }
   
    local buttons = {
        { text = L["Close"], func = function(self) self:GetParent():Hide() end },
        { text = L["Test"], func = function(self) 

            DCP_OptionsFrameButton3:SetText(L["Unlock"]) 
            DCP:EnableMouse(false) 
            RefreshLocals() 
            tinsert(animating,{"Interface\\Icons\\Spell_Nature_Earthbind",nil,"Spell Name"}) 
            DCP:SetScript("OnUpdate", OnUpdate) 
            end },

        { text = L["Unlock"], func = function(self) 
            if (self:GetText() == L["Unlock"]) then
                RefreshLocals()
                DCP:SetWidth(iconSize) 
                DCP:SetHeight(iconSize) 
                self:SetText(L["Lock"]) 
                DCP:SetScript("OnUpdate", nil) 
                DCP:SetAlpha(1) 
                DCPT:SetTexture("Interface\\Icons\\Spell_Nature_Earthbind") 
                DCP:EnableMouse(true) 
            else 
                DCP:SetAlpha(0) 
                self:SetText(L["Unlock"]) 
                DCP:EnableMouse(false) 
            end end },


        { text = L["Defaults"], func = function(self) 
            for i,v in pairs(defaultsettings) do 
                E.db.euiscript.dcp_saved[i] = v 
            end 

            for i,v in pairs(sliders) do 
                getglobal("DCP_OptionsFrameSlider"..i):SetValue(E.db.euiscript.dcp_saved[v.value]) 
            end
            DCP_OptionsFramePetColorBox:GetNormalTexture():SetVertexColor(unpack(E.db.euiscript.dcp_saved.petOverlay))
            DCP_OptionsFrameIgnoreBox:SetText("")
            DCP:ClearAllPoints()
            DCP:SetPoint("CENTER",UIParent,"BOTTOMLEFT",E.db.euiscript.dcp_saved.x,E.db.euiscript.dcp_saved.y) 
            end },
    }

    local optionsframe = CreateFrame("frame","DCP_OptionsFrame")
    optionsframe:SetBackdrop({
      bgFile= E["media"].blank, 
      edgeFile= E["media"].blank, 
      tile=0, tileSize=0, edgeSize=E.mult, 
      insets={left=E.mult, right=E.mult, top=E.mult, bottom=E.mult}
    })
    optionsframe:SetWidth(220)
    optionsframe:SetHeight(500)
    optionsframe:SetPoint("CENTER",UIParent)
    optionsframe:EnableMouse(true)
    optionsframe:SetMovable(true)
    optionsframe:RegisterForDrag("LeftButton")
    optionsframe:SetScript("OnDragStart", function(self) self:StartMoving() end)
    optionsframe:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	optionsframe:SetTemplate("Transparent")
	optionsframe:SetScale(0.85)
    optionsframe:SetFrameStrata("FULLSCREEN_DIALOG")
    optionsframe:SetScript("OnHide", function() RefreshLocals() end)
    tinsert(UISpecialFrames, "DCP_OptionsFrame")

    local header = optionsframe:CreateTexture(nil,"ARTWORK")
    header:SetWidth(350)
    header:SetHeight(68)
    header:SetPoint("TOP",optionsframe,"TOP",0,12)

    local headertext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormal")
    headertext:SetPoint("TOP",header,"TOP",0,-16)
    headertext:SetText("EUI Doom_CooldownPulse")

    for i,v in pairs(sliders) do
        local slider = CreateFrame("slider", "DCP_OptionsFrameSlider"..i, optionsframe, "OptionsSliderTemplate")

		if (i == 1) then
            slider:SetPoint("TOP",optionsframe,"TOP",0,-40)
        else
            slider:SetPoint("TOP",getglobal("DCP_OptionsFrameSlider"..(i-1)),"BOTTOM",0,-35)
        end
        local valuetext = slider:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
        valuetext:SetPoint("TOP",slider,"BOTTOM",0,-1)
        valuetext:SetText(format("%.1f",E.db.euiscript.dcp_saved[v.value]))

        getglobal("DCP_OptionsFrameSlider"..i.."Text"):SetText(v.text)
        getglobal("DCP_OptionsFrameSlider"..i.."Low"):SetText(v.min)
        getglobal("DCP_OptionsFrameSlider"..i.."High"):SetText(v.max)
        slider:SetMinMaxValues(v.min,v.max)
        slider:SetValueStep(v.step)
        slider:SetValue(E.db.euiscript.dcp_saved[v.value])
        slider:SetScript("OnValueChanged",function() 
            local val=slider:GetValue() E.db.euiscript.dcp_saved[v.value]=val 
            valuetext:SetText(format("%.1f",val)) 
            if (DCP:IsMouseEnabled()) then 
                DCP:SetWidth(E.db.euiscript.dcp_saved.iconSize) 
                DCP:SetHeight(E.db.euiscript.dcp_saved.iconSize) 
            end end)
    end
	
	local spellnametext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    spellnametext:SetPoint("TOPLEFT","DCP_OptionsFrameSlider"..#sliders,"BOTTOMLEFT",-15,-25)
    spellnametext:SetText(L["Show spell name:"])
	
	local spellnamecbt = CreateFrame("CheckButton","DCP_OptionsFrameSpellNameCheckButton",optionsframe,"OptionsCheckButtonTemplate")
    spellnamecbt:SetPoint("LEFT",spellnametext,"RIGHT",6,0)
	spellnamecbt:SetChecked(E.db.euiscript.dcp_saved.showSpellName)
	spellnamecbt:SetScript("OnClick", function(self) 
		local newState = (self:GetChecked() == 1) or nil
		self:SetChecked(newState)
		E.db.euiscript.dcp_saved.showSpellName = newState
		RefreshLocals()
	end)
	
    local ignoretext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")

    ignoretext:SetPoint("TOPLEFT",spellnametext,"BOTTOMLEFT",0,-10)
    ignoretext:SetText(L["Cooldowns to ignore:"])
    
    local ignorebox = CreateFrame("EditBox","DCP_OptionsFrameIgnoreBox",optionsframe,"InputBoxTemplate")
    ignorebox:SetAutoFocus(false)
    ignorebox:SetPoint("TOPLEFT",ignoretext,"BOTTOMLEFT",0,-2)
    ignorebox:SetWidth(180)
    ignorebox:SetHeight(24)
    ignorebox:SetText(E.db.euiscript.dcp_saved.ignoredSpells)
    ignorebox:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:SetText(L["Note: Separate multiple spells with commas"]) end)
    ignorebox:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
    ignorebox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    ignorebox:SetScript("OnEditFocusLost",function(self)
        E.db.euiscript.dcp_saved.ignoredSpells = ignorebox:GetText()
        RefreshLocals()
    end)
	E:GetModule('Skins'):HandleButton(ignorebox)
    
    local pettext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    pettext:SetPoint("TOPLEFT",ignorebox,"BOTTOMLEFT",0,-5)
    pettext:SetText(L["Pet color overlay:"])
    
    local petcolorselect = CreateFrame('Button',"DCP_OptionsFramePetColorBox",optionsframe)
    petcolorselect:SetPoint("LEFT",pettext,"RIGHT",5,-2)
    petcolorselect:SetWidth(20)
    petcolorselect:SetHeight(20)
	petcolorselect:SetNormalTexture('Interface/ChatFrame/ChatFrameColorSwatch')
    petcolorselect:GetNormalTexture():SetVertexColor(unpack(E.db.euiscript.dcp_saved.petOverlay))
    petcolorselect:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:SetText("Note: Use white if you don't want any overlay for pet cooldowns") end)
    petcolorselect:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
    petcolorselect:SetScript('OnClick', function(self) 
        self.r,self.g,self.b = unpack(E.db.euiscript.dcp_saved.petOverlay) 
        OpenColorPicker(self) 
        ColorPickerFrame:SetPoint("TOPLEFT",optionsframe,"TOPRIGHT")
        end)
    petcolorselect.swatchFunc = function(self) E.db.euiscript.dcp_saved.petOverlay={ColorPickerFrame:GetColorRGB()} petcolorselect:GetNormalTexture():SetVertexColor(ColorPickerFrame:GetColorRGB()) end
    petcolorselect.cancelFunc = function(self) E.db.euiscript.dcp_saved.petOverlay={self.r,self.g,self.b} petcolorselect:GetNormalTexture():SetVertexColor(unpack(E.db.euiscript.dcp_saved.petOverlay)) end

	
	local petcolorselectbg = petcolorselect:CreateTexture(nil, 'BACKGROUND')
	petcolorselectbg:SetWidth(17)
    petcolorselectbg:SetHeight(17)
	petcolorselectbg:SetTexture(1,1,1)
	petcolorselectbg:SetPoint('CENTER')

    for i,v in pairs(buttons) do
        local button = CreateFrame("Button", "DCP_OptionsFrameButton"..i, optionsframe, "UIPanelButtonTemplate")
        button:SetHeight(24)
        button:SetWidth(75)
        button:SetPoint("BOTTOM", optionsframe, "BOTTOM", ((i%2==0 and -1) or 1)*45, ceil(i/2)*15 + (ceil(i/2)-1)*15)
        button:SetText(v.text)
        button:SetScript("OnClick", function(self) PlaySound("igMainMenuOption") v.func(self) end)
		E:GetModule('Skins'):HandleButton(button)
    end
end