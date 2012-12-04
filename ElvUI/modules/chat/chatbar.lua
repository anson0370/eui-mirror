local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

local function CannelButton(parent, width, height, postion, order, text, color)
	local f = CreateFrame("Button", nil, parent);
	f:Width(width);
	f:Height(height);
	f:SetPoint("LEFT", parent ,"LEFT", (postion == 1) and 5 or (5 + (postion - 1) * 20), 0);
	f:RegisterForClicks("AnyUp");
	f:SetScript("OnClick", function() ChatFrame_OpenChat(order, SELECTED_DOCK_FRAME) end)

	f.text = f:CreateFontString(nil, 'OVERLAY')
	f.text:FontTemplate(nil, nil, "THICKOUTLINE")
	f.text:SetText(text)
	f.text:SetPoint("CENTER", 0, 0)	
	f.text:SetTextColor(unpack(color))
end

function CH:LoadChatbar()
	if E.db["euiscript"].chatbar ~= true then return end
	local chat = CreateFrame("Frame", nil, LeftChatPanel)
	chat:Point("TOP", LeftChatPanel, "TOP", 0, -1)
	chat:Width(E.db["chat"].leftpanelWidth)
	chat:Height(28)
	CH.chatbar = chat
	
	-- "说(/s)" --
	CannelButton(self.chatbar, 16, 16, 1, "/s ", "S", {1, 1, 1})
	-- "喊(/y)" --
	CannelButton(self.chatbar, 16, 16, 2, "/y ", "Y", {255/255, 64/255, 64/255})
	-- "队伍(/p)" --
	CannelButton(self.chatbar, 16, 16, 3, "/p ", "P", {170/255, 170/255, 255/255})
	-- "公会(/g)" --
	CannelButton(self.chatbar, 16, 16, 4, "/g ", "G", {64/255, 255/255, 64/255})
	-- "团队(/raid)" --
	CannelButton(self.chatbar, 16, 16, 5, "/raid ", "R", {255/255, 137/255, 0})
	-- "综合频道(/1)" --
	CannelButton(self.chatbar, 16, 16, 6, "/1 ", "1", {213/255, 180/255, 140/255})
	-- "交易频道(/2)" --
	CannelButton(self.chatbar, 16, 16, 7, "/2 ", "2", {213/255, 180/255, 140/255})
	-- "寻求组队频道(/4)" --
	CannelButton(self.chatbar, 16, 16, 8, "/4 ", "4", {213/255, 180/255, 140/255})
	CannelButton(self.chatbar, 16, 16, 9, "/5 ", "5", {213/255, 180/255, 140/255})
	CannelButton(self.chatbar, 16, 16, 10, "/6 ", "6", {213/255, 180/255, 140/255})
	-- "副本(/I)" -- 
	CannelButton(self.chatbar, 16, 16, 11, "/i ", "I", {255/255, 137/255, 0})

	--Bigfootcannel
	local big = CreateFrame("Button", "Bigfootcannel", self.chatbar)
	big:Point("RIGHT", self.chatbar, "RIGHT", -25, 0)
	big:Size(20)
	big:RegisterForClicks("AnyDown")
	big:SetNormalTexture("Interface\\Addons\\ElvUI\\media\\textures\\world")
	if E.db.chat.autojoin then
		big:GetNormalTexture():SetDesaturated(false)
	else
		big:GetNormalTexture():SetDesaturated(true)
	end
	big:SetScript("OnClick", function(self)
		if E.db.chat.autojoin ~= true then
			JoinTemporaryChannel(L["BigFootChannel"])
			ChatFrame_RemoveChannel(DEFAULT_CHAT_FRAME, L["BigFootChannel"])
			ChatFrame_AddChannel(DEFAULT_CHAT_FRAME, L["BigFootChannel"])	
			E.db.chat.autojoin = true
			self:GetNormalTexture():SetDesaturated(false)
		else
			SlashCmdList["LEAVE"](L["BigFootChannel"])
			E.db.chat.autojoin = false
			self:GetNormalTexture():SetDesaturated(true)
		end
	end)
	big:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, 'ANCHOR_TOP', 0, 6)
		GameTooltip:AddLine(L["Enable/Disable"].. ' '..L["Auto join BigFootChannel"])
		GameTooltip:Show()
	end)
	big:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	-- ROLL点
	local roll = CreateFrame("Button", "rollMacro", E.UIParent, "SecureActionButtonTemplate")
	roll:SetAttribute("*type*", "macro")
	roll:SetAttribute("macrotext", "/roll")
	roll:SetParent(self.chatbar)
	roll:Width(16);
	roll:Height(16);
	roll:SetPoint("RIGHT",self.chatbar,"RIGHT", -50,0);
	roll:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")
	roll:SetPushedTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Down")
	roll:SetHighlightTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Highlight")
	
	local Lock = CreateFrame("Button", nil, self.chatbar)
	Lock:Point("RIGHT",self.chatbar,"RIGHT", -5,0);
	Lock:Size(16, 16)
	Lock:RegisterForClicks('AnyDown')
	Lock.text = Lock:CreateFontString(nil, 'OVERLAY')
	Lock.text:FontTemplate(nil, nil, "THICKOUTLINE")
	Lock.text:SetText("L")
	Lock.text:SetPoint("CENTER")
	Lock.text:SetTextColor(.78, .67, .35)
	Lock:SetScript("OnClick", function(self)
		if ElvUIMoverPopupWindow and ElvUIMoverPopupWindow:IsShown() then
			E:ToggleConfigMode(false)
		else
			E:ToggleConfigMode()
		end
	end)
	Lock:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, 'ANCHOR_TOP', 0, 6)
		GameTooltip:AddLine(L["Unlock various elements of the UI to be repositioned."])
		GameTooltip:Show()
	end)
	Lock:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	if E.db["euiscript"].statreport then
		local statreport = CreateFrame("Button", nil, self.chatbar);
		statreport:Width(16);
		statreport:Height(16);
		statreport:SetPoint("RIGHT", roll, "LEFT", -4 , 0);
		statreport:RegisterForClicks("AnyUp");
		statreport:SetScript("OnClick", function() CH:SendReport() end)
			
		statreport.text = statreport:CreateFontString(nil, 'OVERLAY')
		statreport.text:FontTemplate(nil, nil, "THICKOUTLINE")
		statreport.text:SetText("S")
		statreport.text:SetPoint("CENTER", 0, 0)	
		statreport.text:SetTextColor(23/255, 132/255, 209/255)
			
		statreport:SetScript("OnEnter", function(self) 
			GameTooltip:SetOwner(self, 'ANCHOR_TOP', 0, 6)
			GameTooltip:AddLine(CH.L.INFO_DURABILITY_TIP)
			GameTooltip:Show() 
		end)
		statreport:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
	if E.db.chat.emotionIcons then
		local Emote = E.ChatEmote;
		local ChatEmote = CreateFrame("Button", nil, self.chatbar)
		ChatEmote:SetPoint("RIGHT", roll, "LEFT", E.db["euiscript"].statreport and -24 or -4, 0)
		ChatEmote:Size(16)
		ChatEmote:SetScript("OnClick", function() Emote.ToggleEmoteTable() end)
		
		ChatEmote.text = ChatEmote:CreateFontString(nil, 'OVERLAY')
		ChatEmote.text:FontTemplate(nil, nil, "THICKOUTLINE")
		ChatEmote.text:Point("CENTER", 0, 0)
		ChatEmote.text:SetText("E")
		ChatEmote.text:SetTextColor(23/255, 132/255, 209/255)
			ChatEmote:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, 'ANCHOR_TOP', 0, 6)
			GameTooltip:AddLine(Emote.tipstr)
			GameTooltip:Show()
		end)
		ChatEmote:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
end