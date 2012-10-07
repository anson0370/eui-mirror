local E, L, DF = unpack(ElvUI); --Engine
local S = E:NewModule('EuiScript', 'AceEvent-3.0', 'AceHook-3.0');
E.build = GetAddOnMetadata("EuiScript", "Version")
E.Euiscript = S
CreateFrame("Frame", "U1Frame", UIParent);

-- buy max number value with alt
function S:ByMaxNumber(self, ...)
	if ( IsAltKeyDown() ) then
		local itemLink = GetMerchantItemLink(self:GetID())
		if not itemLink then return end
		local maxStack = select(8, GetItemInfo(itemLink))
		if ( maxStack and maxStack > 1 ) then
			BuyMerchantItem(self:GetID(), GetMerchantItemMaxStack(self:GetID()))
		end
	end
end

--自动卖垃圾
function S:SellItem()
	if not E.db.euiscript.autosell then return end
	local c = 0
	for b=0,4 do
		for s=1,GetContainerNumSlots(b) do
			local l = GetContainerItemLink(b, s)
			if l then
				local p = select(11, GetItemInfo(l))*select(2, GetContainerItemInfo(b, s))
				if select(3, GetItemInfo(l))==0 and p>0 then
					UseContainerItem(b, s)
					PickupMerchantItem()
					c = c+p
				end
			end
		end
	end
	if c>0 then
		local g, s, c = math.floor(c/10000) or 0, math.floor((c%10000)/100) or 0, c%100
		E:Print(" |cffffffff"..g..L.goldabbrev.." |cffffffff"..s..L.silverabbrev.." |cffffffff"..c..L.copperabbrev..".")			
	end
end

--载具按钮
function S:CreateVehicleExit()
	local vehicle = CreateFrame("Button", nil, E.UIParent, "SecureHandlerClickTemplate")
	vehicle:Width(26)
	vehicle:Height(26)
	vehicle:Point("BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2, 2)
	vehicle:SetNormalTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetPushedTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetHighlightTexture("Interface\\AddOns\\ElvUI\\media\\textures\\vehicleexit")
	vehicle:SetTemplate("Default")
	vehicle:RegisterForClicks("AnyUp")
	vehicle:SetScript("OnClick", function() VehicleExit() end)
	RegisterStateDriver(vehicle, "visibility", "[vehicleui][target=vehicle,noexists] hide;show")
end

--修改频道粘滞
function S:ModifyChatSticky()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	
	if ChatFrame1EditBox:IsShown() then ChatFrame1EditBox:Hide() end
	---------------- > Sticky Channels
	ChatTypeInfo['SAY'].sticky = 1
	ChatTypeInfo['YELL'].sticky = 0
	ChatTypeInfo['EMOTE'].sticky = 0
	ChatTypeInfo['PARTY'].sticky = 1
	ChatTypeInfo['GUILD'].sticky = 1
	ChatTypeInfo['OFFICER'].sticky = 1
	ChatTypeInfo['RAID'].sticky = 1
	ChatTypeInfo['RAID_WARNING'].sticky = 0
	ChatTypeInfo['BATTLEGROUND'].sticky = 1
	ChatTypeInfo['WHISPER'].sticky = 0
	ChatTypeInfo['CHANNEL'].sticky = 1
end

function S:AutoCollect()
	local eventcount = 0
	local EUIInGame = CreateFrame("Frame")
	EUIInGame:RegisterAllEvents()
	EUIInGame:SetScript("OnEvent", function(self, event)
		eventcount = eventcount + 1
		if InCombatLockdown() then return end

		if eventcount > 6000 or event == "PLAYER_ENTERING_WORLD" then
			collectgarbage("collect")
			eventcount = 0
		end
	end)
end

--移动战斗积分位置
function S:MoveWorldState()
   _G["WorldStateAlwaysUpFrame"]:ClearAllPoints()
   _G["WorldStateAlwaysUpFrame"].ClearAllPoints = E.noop
   _G["WorldStateAlwaysUpFrame"]:SetPoint("TOP", UIParent, "TOP", -30, -40)
   _G["WorldStateAlwaysUpFrame"].SetPoint = E.noop
end

-- Auto invite by whisper
function S:AutoInvite(...)
	local self, event, arg1, arg2 = ...
	if ((not UnitExists("party1") or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and (arg1:lower() == E.db.euiscript.ainvkeyword:lower())) and E.db.euiscript.autoinvenable == true then
		InviteUnit(arg2)
	end
end

--Camera Distance
function S:ModifyCamera()
	SetCVar("cameraDistanceMax", E.db.euiscript.cameradistance)
	SetCVar("cameraDistanceMaxFactor", E.db.euiscript.camerafactor)
end

function S:AddEuiMenuButton()
	local Button = CreateFrame("Button", "EUIGameMenuButton", GameMenuFrame, "GameMenuButtonTemplate")
	E.Skins:HandleButton(Button)
	Button:SetSize(GameMenuButtonMacros:GetWidth(), GameMenuButtonMacros:GetHeight())
	GameMenuFrame:SetHeight(GameMenuFrame:GetHeight()+GameMenuButtonMacros:GetHeight());
	GameMenuButtonOptions:SetPoint("TOP", Button, "BOTTOM", 0, -1)	
	Button:SetText(E.ValColor..'EUI|r')
	Button:SetPoint("TOP", GameMenuButtonHelp, "BOTTOM", 0, -1)
	Button:SetScript("OnClick", function()
		HideUIPanel(GameMenuFrame)
		E:ToggleConfig()
	end)
end

--Fix oUF_Swing
function S:FixoUF_Swing(...)
	if not E.db.unitframe.units.player.swing then return end
	oUF_Swing_Melee(...)
	oUF_Swing_ParryHaste(...)
end

--Support MySlot
function S:SupportMySlot()
	E.Options.args.actionbar.args.myslot = {
		order = 100,
		name = L["MySlot Support"],
		type = "group",
		guiInline = true,
		disabled = function() return not IsAddOnLoaded('MySlot') end,
		args = {
			SaveButton = {
				order = 1,
				type = "execute",
				name = L['SaveButton'],
				desc = L['Only Save current talnet actionbar button, DoubleTalnet use double profile file to save.'],
				func = function()
					MySlot:Export();
					E.db.euiscript.myslot = MYSLOT_ReportFrame_EditBox:GetText()
					if E.db.euiscript.myslot ~= '' then print("|cFF99CC33EUI:|r |cFFFF9900".. L["Button is Saved!"].."|r") end
				end,
			},
			LoadButton = {
				order = 2,
				type = "execute",
				name = L['LoadButton'],
				func = function() 
					MYSLOT_ReportFrame_EditBox:SetText(E.db.euiscript.myslot or '')
					MySlot:Import();
				end,
			},
		},
	}
end	

--Convert Unitframe Position DB.
function S:ConvertUFDb()
	local pos = {
		["ElvUF_Pet"] = "ElvUF_PetMover",
		["ElvUF_PetTarget"] = "ElvUF_PetTargetMover",
		["ElvUF_Focus"] = "ElvUF_FocusMover",
		["ElvUF_FocusTarget"] = "ElvUF_FocusTargetMover",
		["ElvUF_Attention"] = "ElvUF_AttentionMover",
		["ElvUF_Arena1"] = "ArenaHeaderMover",
		["ElvUF_Tank"] = "ElvUF_TankMover",
		["ElvUF_Boss1"] = "BossHeaderMover",
		["ElvUF_Player"] = "ElvUF_PlayerMover",
		["ElvUF_Raid625"] = "ElvUF_Raid25Mover",
		["ElvUF_Party"] = "ElvUF_PartyMover",
		["ElvUF_TargetTarget"] = "ElvUF_TargetTargetMover",
		["ElvUF_Assist"] = "ElvUF_AssistMover",
		["ElvUF_Target"] = "ElvUF_TargetMover",
	}

	for k, v in pairs(pos) do
		if E.db.unitframe.units.positions and E.db.unitframe.units.positions[k] then
			if E.db.movers == nil then E.db.movers = {} end
			if E.db.unitframe.units.positions[k] then
				local p1, p2, p3, p4, p5 = string.split('\031',E.db.unitframe.units.positions[k])
				if p5 then
					E.db.movers[v] = string.format('%s\031%s\031%s\031%d\031%d', p1, p2, p3, p4, p5)
				else
					E.db.movers[v] = string.format('%s\031%s\031%s\031%d\031%d', p1, p2, p1, p3, p4)
				end
				E.db.unitframe.units.positions[k] = nil
				self.convert = true
			end
		end
	end	
	
	if E.db.unitframe.units.raid625 and type(E.db.unitframe.units.raid625) then
		E:CopyTable(E.db.unitframe.units.raid25, E.db.unitframe.units.raid625)
		E.db.unitframe.units.raid625 = nil
		self.convert = true
	end
	
	if self.convert then E:StaticPopup_Show("CONFIG_RL") end
end

function S:Initialize()
	self:CreateVehicleExit()
	self:AutoCollect()
	self:AddEuiMenuButton()
	self:ConvertUFDb()
	self:SupportMySlot()
	
	SetCVar("taintLog", 0); --禁止一些污染报告
	--Module
	self:LoadBloodShield()
	
	self:SecureHook('MerchantItemButton_OnModifiedClick', 'ByMaxNumber')
	self:SecureHook('WorldStateAlwaysUpFrame_Update', 'MoveWorldState')
	self:RegisterEvent("MERCHANT_SHOW", 'SellItem')
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ModifyChatSticky")
	self:RegisterEvent("CHAT_MSG_WHISPER", "AutoInvite")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ModifyCamera")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "FixoUF_Swing")
end

E:RegisterModule(S:GetName())