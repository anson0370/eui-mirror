local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local format = string.format
local join = string.join
local floor = math.floor
local wipe = table.wipe

local APM = { TIMEMANAGER_PM, TIMEMANAGER_AM }
local europeDisplayFormat = '';
local ukDisplayFormat = '';
local europeDisplayFormat_nocolor = join("", "%02d", ":|r%02d")
local ukDisplayFormat_nocolor = join("", "", "%d", ":|r%02d", " %s|r")
local timerLongFormat = "%d:%02d:%02d"
local timerShortFormat = "%d:%02d"
local lockoutInfoFormat = "%s%s |cffaaaaaa(%s, %s/%s)"
local lockoutInfoFormatNoEnc = "%s%s |cffaaaaaa(%s)"
local formatBattleGroundInfo = "%s: "
local lockoutColorExtended, lockoutColorNormal = { r=0.3,g=1,b=0.3 }, { r=.8,g=.8,b=.8 }
local lockoutFormatString = { "%dd %02dh %02dm", "%dd %dh %02dm", "%02dh %02dm", "%dh %02dm", "%dh %02dm", "%dm" }
local curHr, curMin, curAmPm
local enteredFrame = false;

local Update, lastPanel; -- UpValue
local localizedName, isActive, canQueue, startTime, canEnter
local name, reset, locked, instanceDifficulty, extended, isRaid, maxPlayers, difficulty, numEncounters, encounterProgress
local quests = {}
local updateQuestTable = false

local function ValueColorUpdate(hex, r, g, b)
	europeDisplayFormat = join("", "%02d", hex, ":|r%02d")
	ukDisplayFormat = join("", "", "%d", hex, ":|r%02d", hex, " %s|r")
	
	if lastPanel ~= nil then
		Update(lastPanel, 20000)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

local function ConvertTime(h, m)
	local AmPm
	if E.db.datatexts.time24 == true then
		return h, m, -1
	else
		if h >= 12 then
			if h > 12 then h = h - 12 end
			AmPm = 1
		else
			if h == 0 then h = 12 end
			AmPm = 2
		end
	end
	return h, m, AmPm
end

local function CalculateTimeValues(tooltip)
	if (tooltip and E.db.datatexts.localtime) or (not tooltip and not E.db.datatexts.localtime) then
		return ConvertTime(GetGameTime())
	else
		local	dateTable =	date("*t")
		return ConvertTime(dateTable["hour"], dateTable["min"])
	end
end

local function CalculateTimeLeft(time)
	local hour = floor(time / 3600)
	local min = floor(time / 60 - (hour*60))
	local sec = time - (hour * 3600) - (min * 60)
	
	return hour, min, sec
end

local function formatResetTime(sec)
	local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
	if not type(d) == 'number' or not type(h)== 'number' or not type(m) == 'number' or not type(s) == 'number' then
		return 'N/A'
	end
	
	if d > 0 and lockoutFormatString[h>10 and 1 or 2] then 
		return format(lockoutFormatString[h>10 and 1 or 2], d, h, m)
	end
	if h > 0 and lockoutFormatString[h>10 and 3 or 4] then
		return format(lockoutFormatString[h>10 and 3 or 4], h, m)
	end
	if m > 0 and lockoutFormatString[m>10 and 5 or 6] then 
		return format(lockoutFormatString[m>10 and 5 or 6], m) 
	end
end

local function OnEvent(self, event)
	if event == "QUEST_COMPLETE" then
		updateQuestTable = true
	elseif (event == "QUEST_LOG_UPDATE" and updateQuestTable) or event == "ELVUI_FORCE_RUN" then
		wipe(quests)
		quests = GetQuestsCompleted()
		updateQuestTable = false
	end
end

local function Click()
	GameTimeFrame:Click();
end

local function OnLeave(self)
	DT.tooltip:Hide();
	enteredFrame = false;
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	enteredFrame = true;
	
	DT.tooltip:AddLine(VOICE_CHAT_BATTLEGROUND);
	for i = 1, GetNumWorldPVPAreas() do
		_, localizedName, isActive, canQueue, startTime, canEnter = GetWorldPVPAreaInfo(i)
		if canEnter then
			if isActive then
				startTime = WINTERGRASP_IN_PROGRESS
			elseif startTime == nil then
				startTime = QUEUE_TIME_UNAVAILABLE
			else
				local h, m, s = CalculateTimeLeft(startTime)
				if h > 0 then 
					startTime = format(timerLongFormat, h, m, s) 
				else 
					startTime = format(timerShortFormat, m, s)
				end
			end
			DT.tooltip:AddDoubleLine(format(formatBattleGroundInfo, localizedName), startTime, 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)	
		end
	end	

	local oneraid, lockoutColor
	for i = 1, GetNumSavedInstances() do
		name, _, reset, instanceDifficulty, locked, extended, _, isRaid, maxPlayers, _, numEncounters, encounterProgress  = GetSavedInstanceInfo(i)
		if isRaid and (locked or extended) and name then
			local tr,tg,tb,diff
			if not oneraid then
				DT.tooltip:AddLine(" ")
				DT.tooltip:AddLine(L["Saved Raid(s)"])
				oneraid = true
			end
			if extended then lockoutColor = lockoutColorExtended else lockoutColor = lockoutColorNormal end

			if (numEncounters and numEncounters > 0) and (encounterProgress and encounterProgress > 0) then
				DT.tooltip:AddDoubleLine(format(lockoutInfoFormat, maxPlayers, (instanceDifficulty > 2 and "N" or "H"), name, encounterProgress, numEncounters), formatResetTime(reset), 1,1,1, lockoutColor.r,lockoutColor.g,lockoutColor.b)
			else
				DT.tooltip:AddDoubleLine(format(lockoutInfoFormatNoEnc, maxPlayers, (instanceDifficulty > 2 and "N" or "H"), name), formatResetTime(reset), 1,1,1, lockoutColor.r,lockoutColor.g,lockoutColor.b)
			end
		end
	end
	
	local timeText
	local Hr, Min, AmPm = CalculateTimeValues(true)

	DT.tooltip:AddLine(" ")
	if AmPm == -1 then
		DT.tooltip:AddDoubleLine(E.db.datatexts.localtime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME, 
			format(europeDisplayFormat_nocolor, Hr, Min), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	else
		DT.tooltip:AddDoubleLine(E.db.datatexts.localtime and TIMEMANAGER_TOOLTIP_REALMTIME or TIMEMANAGER_TOOLTIP_LOCALTIME,
			format(ukDisplayFormat_nocolor, Hr, Min, APM[AmPm]), 1, 1, 1, lockoutColorNormal.r, lockoutColorNormal.g, lockoutColorNormal.b)
	end	
	
	DT.tooltip:AddLine(" ")
	DT.tooltip:AddLine(L["World Boss(s)"])	
	local shaKilled, galleonKilled = quests[32099], quests[32098]
	if shaKilled then
		DT.tooltip:AddDoubleLine(L['Sha of Anger']..':', BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
	else
		DT.tooltip:AddDoubleLine(L['Sha of Anger']..':', BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
	end
	if galleonKilled then
		DT.tooltip:AddDoubleLine(L['Galleon']..':', BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
	else
		DT.tooltip:AddDoubleLine(L['Galleon']..':', BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
	end
	
	local avgItemLevel = GetAverageItemLevel()
	if avgItemLevel >= 460 then
		local dungeonId1 = 527
		local dungeonId2 = 528
		local bossName, texture, isKilled, isIneligible
		DT.tooltip:AddLine(" ")
		DT.tooltip:AddLine("LFR "..BOSSES)
		for i = 1, 3 do
			bossName, texture, isKilled, isIneligible = GetLFGDungeonEncounterInfo(dungeonId1, i)
			if isKilled then
				DT.tooltip:AddDoubleLine(bossName, BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
			elseif isIneligible then
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE_INELIGIBLE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			else
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			end
		end
		for i = 4, 6 do
			bossName, texture, isKilled, isIneligible = GetLFGDungeonEncounterInfo(dungeonId2, i)
			if isKilled then
				DT.tooltip:AddDoubleLine(bossName, BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
			elseif isIneligible then
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE_INELIGIBLE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			else
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			end
		end
	end
	if avgItemLevel >= 470 then
		local dungeonId1 = 529
		local dungeonId2 = 530
		local bossName, texture, isKilled, isIneligible
		DT.tooltip:AddLine(" ")
		for i = 1, 3 do
			bossName, texture, isKilled, isIneligible = GetLFGDungeonEncounterInfo(dungeonId1, i)
			if isKilled then
				DT.tooltip:AddDoubleLine(bossName, BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
			elseif isIneligible then
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE_INELIGIBLE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			else
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			end
		end
		for i = 4, 6 do
			bossName, texture, isKilled, isIneligible = GetLFGDungeonEncounterInfo(dungeonId2, i)
			if isKilled then
				DT.tooltip:AddDoubleLine(bossName, BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
			elseif isIneligible then
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE_INELIGIBLE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			else
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			end
		end
		
		dungeonId1 = 526
		DT.tooltip:AddLine(" ")
		for i = 1, 4 do
			bossName, texture, isKilled, isIneligible = GetLFGDungeonEncounterInfo(dungeonId1, i)
			if isKilled then
				DT.tooltip:AddDoubleLine(bossName, BOSS_DEAD, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
			elseif isIneligible then
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE_INELIGIBLE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			else
				DT.tooltip:AddDoubleLine(bossName, BOSS_ALIVE, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b, GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
			end
		end		
	end	

	DT.tooltip:Show()
end

local int = 3
function Update(self, t)
	int = int - t
	
	if enteredFrame then
		OnEnter(self)
	end
	
	--[[if GameTimeFrame.flashInvite then
		E:Flash(self, 0.53)
	else
		E:StopFlash(self)
	end]]
	
	if int > 0 then return end
	
	local Hr, Min, AmPm = CalculateTimeValues(false)

	-- no update quick exit
	if (Hr == curHr and Min == curMin and AmPm == curAmPm) and not (int < -15000) then
		int = 5
		return
	end
	
	curHr = Hr
	curMin = Min
	curAmPm = AmPm
		
	if AmPm == -1 then
		self.text:SetFormattedText(europeDisplayFormat, Hr, Min)
	else
		self.text:SetFormattedText(ukDisplayFormat, Hr, Min, APM[AmPm])
	end
	lastPanel = self
	int = 5
end

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext('Time', { "QUEST_COMPLETE", "QUEST_LOG_UPDATE" }, OnEvent, Update, Click, OnEnter, OnLeave)
