-----------------------------------------------------------------------
-- Title: ChatFilter
-- Version: v5.02
-- Author: aliluya555
-- Config
local E, _, DF = unpack(ElvUI); --Engine
-----------------------------------------------------------------------
if E.global["chatfilter"].Enabled ~= true or IsAddOnLoaded("ChatFilter") then return end

--Convert db.
if E.db.chatfilter.WhiteList then
	E:CopyTable(E.global.chatfilter.WhiteList ,E.db.chatfilter.WhiteList)
	E.db.chatfilter.WhilteList = nil
end
if E.db.chatfilter.BlackList then
	E:CopyTable(E.global.chatfilter.BlackList ,E.db.chatfilter.BlackList)
	E.db.chatfilter.BlackList = nil
end

E.db.chatfilter.SafeWords = nil
E.db.chatfilter.DangerWords = nil

local Config = E.db["chatfilter"]
	
-----------------------------------------------------------------------
-- Locals
-----------------------------------------------------------------------
local L = {
	["Channel"] = "大脚世界频道",
	["Achievement"] = "%shave earned the achievement%s!",
	["LearnSpell"] = "You have learned: %s",
	["UnlearnSpell"] = "You have unlearned: %s",
}
if (GetLocale() == "zhCN") then
	L = {
		["Channel"] = "大脚世界频道",
		["Achievement"] = "%s获得了成就%s!",
		["LearnSpell"] = "你学会了技能: %s",
		["UnlearnSpell"] = "你遗忘了技能: %s",
	}
elseif (GetLocale() == "zhTW") then
	L = {
		["Channel"] = "大腳世界頻道",
		["Achievement"] = "%s獲得了成就%s!",
		["LearnSpell"] = "你學會了技能: %s",
		["UnlearnSpell"] = "你遺忘了技能: %s",
	}
end
-----------------------------------------------------------------------
-- ChatFilter
-----------------------------------------------------------------------
local ChatFilter, ChatFrames = CreateFrame("Frame")

local CacheTable, prevLineId = {}
local achievements, alreadySent, spellList = {}, {}, {}
local totalCreated, resetTimer, craftList, craftQuantity, craftItemID, prevCraft = {}, {}, {}
local spamCategories, specialFilters = {[95] = true, [155] = true, [168] = true, [14807] = true, [15165] = true}, {[456] = true, [1400] = true, [1402] = true, [2186] = true, [2187] = true, [2903] = true, [2904] = true, [3004] = true, [3005] = true, [3117] = true, [3259] = true, [3316] = true, [3808] = true, [3809] = true, [3810] = true, [3817] = true, [3818] = true, [3819] = true, [4078] = true, [4079] = true, [4080] = true, [4156] = true, [4576] = true, [7485] = true, [7486] = true, [7487] = true}

local function deformat(text)
	text = gsub(text, "%.", "%%.")
	text = gsub(text, "%%%d$s", "(.+)")
	text = gsub(text, "%%s", "(.+)")
	text = gsub(text, "%%d", "(%%d+)")
	text = "^" .. text .. "$"
	return text
end

local createmsg = deformat(LOOT_ITEM_CREATED_SELF)
local createmultimsg = deformat(LOOT_ITEM_CREATED_SELF_MULTIPLE)
local learnspellmsg = deformat(ERR_LEARN_SPELL_S)
local learnpassivemsg = deformat(ERR_LEARN_PASSIVE_S)
local learnabilitymsg = deformat(ERR_LEARN_ABILITY_S)
local unlearnspellmsg = deformat(ERR_SPELL_UNLEARNED_S)
local petlearnspellmsg = deformat(ERR_PET_LEARN_SPELL_S)
local petlearnabilitymsg = deformat(ERR_PET_LEARN_ABILITY_S)
local petunlearnspellmsg = deformat(ERR_PET_SPELL_UNLEARNED_S)
local auctionstartedmsg = deformat(ERR_AUCTION_STARTED)
local auctionremovedmsg = deformat(ERR_AUCTION_REMOVED)
local duelwinmsg = deformat(DUEL_WINNER_KNOCKOUT )
local duellosemsg = deformat(DUEL_WINNER_RETREAT  )



local function SendMessage(event, msg, r, g, b)
	local info = ChatTypeInfo[strsub(event, 10)]
	for i = 1, NUM_CHAT_WINDOWS do
		ChatFrames = _G["ChatFrame"..i]
		if (ChatFrames and ChatFrames:IsEventRegistered(event)) then
			ChatFrames:AddMessage(msg, info.r, info.g, info.b)
		end
	end
end

local function SendAchievement(event, achievementID, players)
	if (not players) then return end
	for k in pairs(alreadySent) do alreadySent[k] = nil end
	for i = getn(players), 1, -1 do
		if (alreadySent[players[i].name]) then
			tremove(players, i)
		else
			alreadySent[players[i].name] = true
		end
	end
	if (getn(players) > 1) then
		sort(players, function(a, b) return a.name < b.name end)
	end
	for i = 1, getn(players) do
		local class, color, r, g, b
		if (players[i].guid and tonumber(players[i].guid)) then
			class = select(2, GetPlayerInfoByGUID(players[i].guid))
			color = RAID_CLASS_COLORS[class]
		end
		if (not color) then
			local info = ChatTypeInfo[strsub(event, 10)]
			r, g, b = info.r, info.g, info.b
		else
			r, g, b = color.r, color.g, color.b
		end
		players[i] = format("|cff%02x%02x%02x|Hplayer:%s|h[%s]|h|r", r*255, g*255, b*255, players[i].name, players[i].name)
	end
	SendMessage(event, format(L["Achievement"], table.concat(players, ", "), GetAchievementLink(achievementID)))
end

local function achievementReady(id, achievement)
	if (achievement.area and achievement.guild) then
		local playerGuild = GetGuildInfo("player")
		for i = getn(achievement.area), 1, -1 do
			local player = achievement.area[i].name
			if (UnitExists(player) and playerGuild and playerGuild == GetGuildInfo(player)) then
				tinsert(achievement.guild, tremove(achievement.area, i))
			end
		end
	end
	if (achievement.area and getn(achievement.area) > 0) then
		SendAchievement("CHAT_MSG_ACHIEVEMENT", id, achievement.area)
	end
	if (achievement.guild and getn(achievement.guild) > 0) then
		SendAchievement("CHAT_MSG_GUILD_ACHIEVEMENT", id, achievement.guild)
	end
end

local function talentspecReady(attribute, spells)
	if (not spells) then return end
	for k in pairs(alreadySent) do alreadySent[k] = nil end
	for i = getn(spells), 1, -1 do
		if (alreadySent[spells[i]]) then
			tremove(spells, i)
		else
			alreadySent[spells[i]] = true
		end
	end
	if (getn(spells) > 1) then
		sort(spells, function(a, b) return a < b end)
	end
	for i = 1, getn(spells) do
		spells[i] = GetSpellLink(spells[i])
	end
	if (attribute == "Learn") then
		SendMessage("CHAT_MSG_SYSTEM", format(L["LearnSpell"], table.concat(spells, "")))
	end
	if (attribute == "Unlearn") then
		SendMessage("CHAT_MSG_SYSTEM", format(L["UnlearnSpell"], table.concat(spells, "")))
	end
end

local function ChatFrames_OnUpdate(self, elapsed)
	local found
	for id, resetAt in pairs(resetTimer) do
		if (resetAt <= GetTime()) then
			SendMessage("CHAT_MSG_LOOT", format(LOOT_ITEM_CREATED_SELF_MULTIPLE, (select(2, GetItemInfo(id))), totalCreated[id]))
			totalCreated[id] = nil
			resetTimer[id] = nil
		end
		found = true
	end
	for id, spell in pairs(spellList) do
		if (spell.timeout <= GetTime()) then
			talentspecReady(id, spell)
			spellList[id] = nil
		end
		found = true
	end
	for id, achievement in pairs(achievements) do
		if (achievement.timeout <= GetTime()) then
			achievementReady(id, achievement)
			achievements[id] = nil
		end
		found = true
	end
	if (not found) then
		self:SetScript("OnUpdate", nil)
	end
end

local function queueCraftMessage(craft, itemID, itemQuantity)
	if (prevCraft and prevCraft ~= craft) then return end
	prevCraft = craft
	local Delay
	if (select(3, GetNetStats()) > select(4, GetNetStats())) then 
		Delay = select(3, GetNetStats()) / 250 + 0.5
	else
		Delay = select(4, GetNetStats()) / 250 + 0.5
	end

	if (Delay > 3) then Delay = 3 end
	totalCreated[itemID] = (totalCreated[itemID] or 0) + (itemQuantity or 1)
	resetTimer[itemID] = GetTime() + craftList[itemID] + Delay
	ChatFilter:SetScript("OnUpdate", ChatFrames_OnUpdate)
end

local function queueTalentSpecSpam(attribute, spellID)
	spellList[attribute] = spellList[attribute] or {timeout = GetTime() + 0.5}
	tinsert(spellList[attribute], spellID)
	ChatFilter:SetScript("OnUpdate", ChatFrames_OnUpdate)
end

local function queueAchievementSpam(event, achievementID, playerdata)
	achievements[achievementID] = achievements[achievementID] or {timeout = GetTime() + 0.5}
	achievements[achievementID][event] = achievements[achievementID][event] or {}
	tinsert(achievements[achievementID][event], playerdata)
	ChatFilter:SetScript("OnUpdate", ChatFrames_OnUpdate)
end

if (Config.noprofanityFilter or Config.nojoinleaveChannel) then
	ChatFilter:RegisterEvent("ADDON_LOADED")
end

if (Config.MergeManufacturing) then
	hooksecurefunc("DoTradeSkill", function(index, quantity)
			local itemID = strmatch(GetTradeSkillItemLink(index), "item:(%d+)")
			if (itemID) then
				craftQuantity = quantity
				craftItemID = tonumber(itemID)
				prevCraft = nil
			end
	end)
	ChatFilter:RegisterEvent("TRADE_SKILL_UPDATE")
end

ChatFilter:SetScript("OnEvent", function(self, event, ...)
	local arg1, arg2 = ...
	if (event == "ADDON_LOADED") then
		if (Config.noprofanityFilter) then
			SetCVar("profanityFilter", 0)
		end
		if (Config.nojoinleaveChannel) then
			for i = 1, NUM_CHAT_WINDOWS do
				ChatFrames = _G["ChatFrame"..i]
				ChatFrame_RemoveMessageGroup(ChatFrames, "CHANNEL")
			end
		end
	elseif (event == "TRADE_SKILL_UPDATE") then
		if (GetTradeSkillLine() and not IsTradeSkillLinked()) then
			for i = 1, GetNumTradeSkills() do
				if (GetTradeSkillItemLink(i) and GetTradeSkillRecipeLink(i)) then
					local itemID = strmatch(GetTradeSkillItemLink(i), "item:(%d+)")
					local enchantID = strmatch(GetTradeSkillRecipeLink(i), "enchant:(%d+)")
					if (itemID and enchantID) then
						craftList[tonumber(itemID)] = select(7, GetSpellInfo(enchantID)) / 1000
					end
				end
			end
		end		
	end
end)

local function ChatFilter_Rubbish(self, event, msg, player, _, _, _, flag, _, _, _, _, lineId, guid)
	if (lineId ~= prevLineId) then
		if (event == "CHAT_MSG_CHANNEL") then
			if (Config.BlockInstance and select(2, IsInInstance()) ~= "none") or (Config.BlockCombat and InCombatLockdown()) or (Config.BlockBossCombat and UnitExists("boss1")) then
				local i, id, channel
				for i = 1, NUM_CHAT_WINDOWS do
					local channels = {GetChatWindowChannels(i)}
					for id, channel in ipairs(channels) do
						if channel == L["Channel"] then
							if (Config.BlockInstance and select(2, IsInInstance()) ~= "none") then return true end
							if (Config.BlockCombat and InCombatLockdown()) then return true end
							if (Config.BlockBossCombat and UnitExists("boss1")) then return true end
						end
					end
				end
			end
		else
			if (event == "CHAT_MSG_WHISPER") then
				if (flag == "GM") then return end
				for i = 1, select(2, BNGetNumFriends()) do
					local toon = BNGetNumFriendToons(i)
					for j = 1, toon do
						local _, rName, rGame = BNGetFriendToonInfo(i, j)
						if (not Config.ScanFriend and rName == player and rGame == "WoW") then return end
					end
				end
			end
			if (guid and tonumber(guid) and tonumber(guid:sub(-12, -9), 16) >0) then return end
		end
		if (not Config.ScanOurself and UnitIsUnit(player,"player")) then return end
		if (not Config.ScanFriend and not CanComplainChat(lineId)) then return end
		if (not Config.ScanTeam and (UnitInRaid(player) or UnitInParty(player))) then return end
		if (not Config.ScanGuild and UnitIsInMyGuild(player)) then return end
		for k , v in pairs(E.global.chatfilter.WhiteList) do
			if E.global.chatfilter.WhiteList[k] and strmatch(msg, k) then
				return
			end
		end
		for k, v in pairs(E.global.chatfilter.BlackList) do
			if E.global.chatfilter.BlackList[k] and strmatch(msg, k) then
				return true
			end
		end	
		if player and E.global.chatfilter.BlankName[player] then
			return true
		end
		if (Config.FilterRepeat or Config.FilterAdvertising) then
			msg = (msg):lower()
			local Symbols = {" ","`","~","@","#","^","*","/","，","。","、","？","！","：","；","’","‘","“","”","【","】","《","》","（","）","<",">"}
			for i = 1, getn(Symbols) do
				msg = gsub(msg, Symbols[i], "")
			end
		end		
		
		local Data = {Name = player, Msg = msg, Time = GetTime()}
		if (Config.FilterRepeat or Config.FilterMultiLine) then

			local lines = 1
			for i = getn(CacheTable), 1, -1 do
				value = CacheTable[i]
				if (GetTime() - value.Time  > Config.RepeatInterval) then
					tremove(CacheTable, i)
					break
				elseif (value.Name == player) then
					if (Config.FilterMultiLine) then
						if (GetTime() - value.Time < 0.400) then
							if (event == "CHAT_MSG_CHANNEL") then
								lines = lines +1
							else
								if (strmatch(msg, "%d?%..*%d+%.?%d?%(%d+%.?%d?%,?%d+%.?%d?%%%)") or strmatch(msg, "%d?%..*%d+%.?%d?.*%d+%.?%d?%%.*%(%d+%.?%d?%)")) then
									return
								else
									lines = lines +1
								end
							end
							if (lines >= Config.AllowLines) then
								return true
							end
						end
					end
					if (Config.FilterRepeat) then
						if  (value.Msg == msg) then
							return true
						end
						if (Config.RepeatAlike and Config.RepeatAlike < 100) then
							local count = 0
							if (strlen(msg) > strlen(value.Msg)) then
								bigs = msg
								smalls = value.Msg
							else
								bigs = value.Msg
								smalls = msg
							end
							for i = 1, strlen(smalls) do
								if (strfind(bigs, strsub(smalls, i, i + 1), 1, true)) then
									count = count + 1
								end
							end
							if (count / strlen(bigs) * 100 > Config.RepeatAlike) then
								return true
							end
						end
					end
				end
			end


		end
		if (Config.FilterAdvertising) then
			local matchs = 0
			for i = 1, getn(E.global.chatfilter.SafeWords) do
				if (strfind(msg, E.global.chatfilter.SafeWords[i])) then
					matchs = matchs - 1
				end
			end
			for i = 1, getn(E.global.chatfilter.DangerWords) do
				if (strfind(msg, E.global.chatfilter.DangerWords[i])) then
					for k in gmatch(msg, E.global.chatfilter.DangerWords[i]) do
						matchs = matchs + 1
					end
				end
			end
			if (Config.ScanFriend and not CanComplainChat(lineId)) then matchs = matchs - 2 end
			if (Config.ScanTeam and (UnitInRaid(player) or UnitInParty(player))) then matchs = matchs - 1 end
			if (Config.ScanGuild and UnitIsInMyGuild(player)) then matchs = matchs - 1 end
			if (Config.AllowMatchs > 1) then
				if (strlen(msg) > 120) then matchs = matchs + 1 end
				if (event == "CHAT_MSG_WHISPER" and UnitLevel(player) == 0) then matchs = matchs + 1 end
			end
			if (matchs > Config.AllowMatchs) then return true end
		end
		if (getn(CacheTable) > Config.RepeatMaxCache) then
			tremove(CacheTable, 1)
		end
		tinsert(CacheTable, Data)
		prevLineId = lineId
	end
end

local function ChatFilter_Achievement(self, event, msg, player, _, _, _, _, _, _, _, _, _, guid)
	if (Config.MergeAchievement) then
		local achievementID = strmatch(msg, "achievement:(%d+)")
		if (not achievementID) then return end
		achievementID = tonumber(achievementID)
		local playerdata = {name = player, guid = guid}
		local categoryID = GetAchievementCategory(achievementID)
		if (spamCategories[categoryID] or spamCategories[select(2, GetCategoryInfo(categoryID))] or specialFilters[achievementID]) then
			queueAchievementSpam((event == "CHAT_MSG_GUILD_ACHIEVEMENT" and "guild" or "area"), achievementID, playerdata)
			return true
		end
	end
end

local function ChatFilter_TalentSpec(self, event, msg)
	if (Config.MergeTalentSpec) then
		local learnID = strmatch(msg, learnspellmsg) or strmatch(msg, learnabilitymsg) or strmatch(msg, learnpassivemsg)
		local unlearnID = strmatch(msg, unlearnspellmsg)
		if (learnID) then
			learnID = tonumber(strmatch(learnID, "spell:(%d+)"))
			queueTalentSpecSpam("Learn", learnID)
			return true
		elseif (unlearnID) then
			unlearnID = tonumber(strmatch(unlearnID, "spell:(%d+)"))
			queueTalentSpecSpam("Unlearn", unlearnID)
			return true
		end
		if (Config.FilterPetTalentSpec and (strfind(msg, petlearnspellmsg) or strfind(msg, petlearnabilitymsg) or strfind(msg, petunlearnspellmsg))) then
			return true
		end
	end
	if (Config.FilterDuelMSG and (not strfind(msg, GetUnitName("player"))) and (strfind(msg, duelwinmsg) or strfind(msg, duellosemsg))) then return true end
	if (Config.FilterAuctionMSG and (strfind(msg, auctionstartedmsg) or strfind(msg, auctionremovedmsg))) then return true end
end

local function ChatFilter_Created(self, event, msg)
	if (Config.MergeManufacturing) then
		local craft = self
		local itemID, itemQuantity = strmatch(msg, createmultimsg)
		if (not itemID and not itemQuantity) then
			itemID = strmatch(msg, createmsg)
		end
		if (not itemID) then return end
		itemID = tonumber(strmatch(itemID, "item:(%d+)"))
		itemQuantity = tonumber(itemQuantity)
		if (itemID and craftList[itemID] and craftItemID == itemID and craftQuantity > 1) then 
			queueCraftMessage(craft, itemID, itemQuantity)
			return true
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", ChatFilter_Rubbish)
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", ChatFilter_Created)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", ChatFilter_TalentSpec)
ChatFrame_AddMessageEventFilter("CHAT_MSG_ACHIEVEMENT", ChatFilter_Achievement)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD_ACHIEVEMENT", ChatFilter_Achievement)