local E, _, DF = unpack(ElvUI)

local GetNextChar = function(word,num)
	local c = word:byte(num)
	local shift
	if not c then return "",num end
		if (c > 0 and c <= 127) then
			shift = 1
		elseif (c >= 192 and c <= 223) then
			shift = 2
		elseif (c >= 224 and c <= 239) then
			shift = 3
		elseif (c >= 240 and c <= 247) then
			shift = 4
		end
	return word:sub(num,num+shift-1),(num+shift)
end

local updaterun = CreateFrame("Frame")

local flowingframe = CreateFrame("Frame",nil,UIParent)
	flowingframe:SetFrameStrata("HIGH")
	flowingframe:SetPoint("CENTER",E.UIParent,0,136)
	flowingframe:SetHeight(64)
	flowingframe:SetScript("OnUpdate", FadingFrame_OnUpdate)
	flowingframe:Hide()
	flowingframe.fadeInTime = 0
	flowingframe.holdTime = 1
	flowingframe.fadeOutTime = .3
	
local flowingtext = flowingframe:CreateFontString(nil,"OVERLAY")
	flowingtext:SetPoint("Left")
	flowingtext:FontTemplate(nil, 20, 'OUTLINE')
	flowingtext:SetShadowOffset(0,0)
	flowingtext:SetJustifyH("LEFT")
	
local rightchar = flowingframe:CreateFontString(nil,"OVERLAY")
	rightchar:SetPoint("LEFT",flowingtext,"RIGHT")
	rightchar:FontTemplate(nil, 50, 'OUTLINE')
	rightchar:SetShadowOffset(0,0)
	rightchar:SetJustifyH("LEFT")

local count,len,step,word,stringE,a

local speed = .03333

local nextstep = function()
	a,step = GetNextChar (word,step)
	flowingtext:SetText(stringE)
	stringE = stringE..a
	a = string.upper(a)
	rightchar:SetText(a)
end

local updatestring = function(self,t)
	count = count - t
		if count < 0 then
			if step > len then 
				self:Hide()
				flowingtext:SetText(stringE)
				FadingFrame_Show(flowingframe)
				rightchar:SetText("")
				word = ""
			else 
				nextstep()
				FadingFrame_Show(flowingframe)
				count = speed
			end
		end
end

updaterun:SetScript("OnUpdate",updatestring)
updaterun:Hide()

E.EuiAlertRun = function(f,r,g,b)
	flowingframe:Hide()
	updaterun:Hide()
	
		flowingtext:SetText(f)
		local l = flowingtext:GetWidth()
		
	local color1 = r or 1
	local color2 = g or 1
	local color3 = b or 1
	
	flowingtext:SetTextColor(color1*.95,color2*.95,color3*.95)
	rightchar:SetTextColor(color1,color2,color3)
	
	word = f
	len = f:len()
	step = 1
	count = speed
	stringE = ""
	a = ""
	
		flowingtext:SetText("")
		flowingframe:SetWidth(l)
		
	rightchar:SetText("")
	FadingFrame_Show(flowingframe)
	updaterun:Show()
end

local CombatNotification = CreateFrame ("Frame")
local L = {}
local _,localizedName = GetWorldPVPAreaInfo(2)
if(GetLocale()=="zhCN") then
	L.INFO_WOWTIME_TIP1 = localizedName.. "即将在1分钟内开始"
	L.INFO_WOWTIME_TIP2 = localizedName.. "即将在5分钟内开始"
	L.INFO_WOWTIME_TIP3 = localizedName.. "即将在15分钟内开始"
	L.need = " 有奖励包包了!!!"
	L.Tank = "<坦克>"
	L.Healer = "<治疗>"
	L.DPS = "<输出>"
elseif (GetLocale()=="zhTW") then
	L.INFO_WOWTIME_TIP1 = localizedName.. "即將在1分鐘內開始"
	L.INFO_WOWTIME_TIP2 = localizedName.. "即將在5分鐘內開始"
	L.INFO_WOWTIME_TIP3 = localizedName.. "即將在15分鐘內開始"
	L.need = " 有獎勵包包了!!!"
	L.Tank = "<坦克>"
	L.Healer = "<治療>"
	L.DPS = "<輸出>"		
elseif (GetLocale()=="enUS") then
	L.INFO_WOWTIME_TIP1 = localizedName.. "will start within 1 minute"
	L.INFO_WOWTIME_TIP2 = localizedName.. "will start within 5 minute"
	L.INFO_WOWTIME_TIP3 = localizedName.. "will start within 15 minute"
	L.need = " reward bags!"
	L.Tank = "<Tank>"
	L.Healer = "<Healer>"
	L.DPS = "<DPS>"
end

if E.db["euiscript"].combatnoti == true then
	CombatNotification:RegisterEvent("PLAYER_REGEN_ENABLED")
	CombatNotification:RegisterEvent("PLAYER_REGEN_DISABLED")
	CombatNotification:SetScript("OnEvent", function (self,event)
		if (UnitIsDead("player")) then return end
		if event == "PLAYER_REGEN_ENABLED" then
			E.EuiAlertRun(E.db["euiscript"].combatnoti_leaving,0.1,1,0.1)
		elseif event == "PLAYER_REGEN_DISABLED" then
			E.EuiAlertRun(E.db["euiscript"].combatnoti_entering,1,0.1,0.1)
		end	
	end)
end

if E.db["euiscript"].wgtimenoti == true then
	local int = 1

	local clocks_update = function(self,t)
		int = int - t
		if int > 0 then return end
			
		int = 1
		local _,_,_,canQueue,wgtime = GetWorldPVPAreaInfo(2)
	
		if canQueue == false then
			if wgtime == 60 then 
				E.EuiAlertRun (L.INFO_WOWTIME_TIP1)
				if IsInGuild() then SendChatMessage('EUI:'.. L.INFO_WOWTIME_TIP1, "GUILD", nil, nil) end
			elseif wgtime == 300 then 
				E.EuiAlertRun (L.INFO_WOWTIME_TIP2)
				if IsInGuild() then SendChatMessage('EUI:'.. L.INFO_WOWTIME_TIP2, "GUILD", nil, nil) end
			elseif wgtime == 900 then 
				E.EuiAlertRun (L.INFO_WOWTIME_TIP3)
				if IsInGuild() then SendChatMessage('EUI:'.. L.INFO_WOWTIME_TIP3, "GUILD", nil, nil) end
			end
		end
	end
	
	CombatNotification:SetScript("OnUpdate",clocks_update)
end

if E.db["euiscript"].lfgnoti == true then
	local ina = 1
	local str = ""
	local f = CreateFrame("Frame")
	f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	f:SetScript("OnEvent", function(self)
		self.noti = false
	end)
	f:SetScript("OnUpdate", function(self, t)
		ina = ina - t

		if ina > 0 then return end
		if select(2, IsInInstance()) ~= 'none' then return end
		
		local id, name = GetLFGRandomDungeonInfo(9)
		local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(id, 1)
		if eligible and (itemCount > 0) and self.noti == false then
			if forTank then str = str.. L.Tank end
			if forHealer then str = str.. L.Healer end
			if forDamage then str = str.. L.DPS end
			E.EuiAlertRun(name.. str.. L.need)
			if IsInGuild() then SendChatMessage('EUI:'.. name.. str.. L.need, "GUILD", nil, nil) end
			self.noti = true
			str = ""
		end
	end)
end