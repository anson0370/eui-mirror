--author: Neavo, modify: eui.cc 
local E, _, DF = unpack(ElvUI)
local LSM = LibStub("LibSharedMedia-3.0")
local S = E:GetModule('Skins')
local Module = E:NewModule("AddonManager")
local AddonList, AddonButton, Page, MaxPage = {}, {}, 1, 1

local function UpdateAddonList()
	wipe(AddonList)
	UpdateAddOnMemoryUsage()
	for i = 1, GetNumAddOns() do
		local name, title, notes, enabled = GetAddOnInfo(i)
		local mem = GetAddOnMemoryUsage(i)
		local usage = GetAddOnCPUUsage(i)
		local version = GetAddOnMetadata(i, "version") and GetAddOnMetadata(i, "version") or "" 
		local dependencies = GetAddOnDependencies(i) and GetAddOnDependencies(i) or "None"
		tinsert(AddonList, {Name = name, Version = version, Title = title, Notes = notes, Enabled = enabled, Mem = mem, Usage = usage, Dependencies = dependencies})
	end
	MaxPage = floor(#AddonList/12)+1
end

local L = {}
if GetLocale() == "zhCN" then
	L.title = "插件管理"
	L.tip1 = "依赖于："
	L.tip2 = "内存占用："
	L.tip3 = "处理器占用："
elseif GetLocale() == "zhTW" then
	L.title = "插件管理"
	L.tip1 = "依賴於："
	L.tip2 = "記憶體佔用："
	L.tip3 = "處理器佔用："	
else
	L.title = "AddonManager"
	L.tip1 = "RequiredDeps: "
	L.tip2 = "Memory: "
	L.tip3 = "CPU: "
end

local function FormatMemory(Memory)
	local M = format("%.2f", Memory/1024)
	local K = floor(Memory-floor(Memory/1024))
	if Memory > 1024 then
		return M.."m "	
	elseif Memory > 0 and Memory < 1024 then
		return K.."k"
	else
		return "N/A"
	end	
end

local function UpdateAddonButton(MainFrame)
	local Start, End = (Page-1)*12+1, Page*12 < #AddonList and Page*12 or #AddonList
	MainFrame.UpdatePageText()
	for key, value in pairs(AddonButton) do
		value:ClearAllPoints()
		value:Hide()
	end
	wipe(AddonButton)
	for i = Start, End do
		local Button = CreateFrame("Button", nil, MainFrame)
		Button:SetSize(240, 16)
		Button:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
			GameTooltip:ClearLines()
			GameTooltip:AddDoubleLine(AddonList[i]["Title"], AddonList[i]["Version"], 112/255, 192/255, 245/255, 1, 1, 1)
			GameTooltip:AddLine(AddonList[i]["Notes"], 1, 1, 1)
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine(L.tip1, AddonList[i]["Dependencies"], 112/255, 192/255, 245/255, 1, 1, 1)
			GameTooltip:AddDoubleLine(L.tip2, FormatMemory(AddonList[i]["Mem"]), 112/255, 192/255, 245/255, 1, 1, 1)
			GameTooltip:AddDoubleLine(L.tip3, AddonList[i]["Usage"].."%", 112/255, 192/255, 245/255, 1, 1, 1)
			GameTooltip:Show()
		end)
		Button:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
		Button:SetScript("OnClick", function(self)
			if AddonList[i]["Enabled"] then
				DisableAddOn(AddonList[i]["Name"])
				AddonList[i]["Enabled"] = false
				self.Tex:SetVertexColor(0.1, 0.1, 0.1, 0.8)
			else
				EnableAddOn(AddonList[i]["Name"])
				AddonList[i]["Enabled"] = true
				self.Tex:SetVertexColor(0, 0.67, 1, 0.8)
			end
		end)
		if i == Start then
			Button:SetPoint("TOP", MainFrame, 0, -10)
		else
			Button:SetPoint("TOP", AddonButton[i-Start], "BOTTOM", 0, -10)
		end
		Button.Tex = Button:CreateTexture(nil, "OVERLAY")
		Button.Tex:SetTexture(E["media"].normTex)
		Button.Tex:SetSize(16, 16)
		Button.Tex:SetPoint("LEFT")
		if AddonList[i]["Enabled"] then
			Button.Tex:SetVertexColor(0, 0.67, 1, 0.8)
		else
			Button.Tex:SetVertexColor(0.1, 0.1, 0.1, 0.8)
		end
		Button.Text = Button:CreateFontString(nil, 'OVERLAY')
		Button.Text:FontTemplate(nil, nil, "THICKOUTLINE")
		Button.Text:SetText(AddonList[i]["Title"])
		Button.Text:SetPoint("LEFT", Button.Tex, "RIGHT", 10, 0)
		tinsert(AddonButton, Button)
	end
end

local function BuildGameMenuButton(Tittle)
	local Button = CreateFrame("Button", "GameMenuButtonAddOns", GameMenuFrame, "GameMenuButtonTemplate")
	S:HandleButton(Button)
	Button:SetSize(GameMenuButtonMacros:GetWidth(), GameMenuButtonMacros:GetHeight())
	GameMenuFrame:SetHeight(GameMenuFrame:GetHeight()+GameMenuButtonMacros:GetHeight());
	GameMenuButtonLogout:SetPoint("TOP", Button, "BOTTOM", 0, -1)	
	Button:SetText(L.title)
	Button:SetPoint("TOP", GameMenuButtonMacros, "BOTTOM", 0, -1)
	Button:SetScript("OnClick", function()
		HideUIPanel(GameMenuFrame)
		UpdateAddonList()
		Tittle:Show()
	end)	
end

local function BuildMainFrame()
	local Tittle = CreateFrame("Button", nil, UIParent)
	Tittle:SetSize(264, 18)
	Tittle:SetTemplate("Transparent")
	Tittle:SetPoint("CENTER", 0, 150)
	Tittle:SetMovable(true)
	Tittle:RegisterForDrag("LeftButton")
	Tittle:SetScript("OnDragStart", function(self) self:StartMoving() end)
	Tittle:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	Tittle.Text = Tittle:CreateFontString(nil, 'OVERLAY')
	Tittle.Text:FontTemplate(nil, 12, "THICKOUTLINE")
	Tittle.Text:SetText(L.title)
	Tittle.Text:SetTextColor(unpack(E["media"].rgbvaluecolor))
	Tittle.Text:SetPoint("CENTER", 1, -1)
	local Reload = CreateFrame("Button", nil, Tittle)
	Reload:SetSize(16, 18)
	Reload:SetTemplate("Transparent")
	Reload:SetPoint("RIGHT", Tittle, "LEFT", -4, 0)
	Reload:SetScript("OnClick",function(self) ReloadUI() end)
	Reload:SetScript("OnEnter", function(self) self.Text:SetTextColor(0/255, 170/255, 255/255) end)
	Reload:SetScript("OnLeave", function(self) self.Text:SetTextColor(255/255, 255/255, 255/255) end)
	Reload.Text = Reload:CreateFontString(nil, 'OVERLAY')
	Reload.Text:FontTemplate(nil, 12, "THICKOUTLINE")
	Reload.Text:SetText("R")
	Reload.Text:SetPoint("CENTER", 1, -1)

	local Close = CreateFrame("Button", nil, Tittle)
	Close:SetSize(16, 18)
	Close:SetTemplate("Transparent")
	Close:SetPoint("LEFT", Tittle, "RIGHT", 4, 0)
	Close:SetScript("OnClick",function(self) Tittle:Hide() end)
	Close:SetScript("OnEnter", function(self) self.Text:SetTextColor(0/255, 170/255, 255/255) end)
	Close:SetScript("OnLeave", function(self) self.Text:SetTextColor(255/255, 255/255, 255/255) end)
	Close.Text = Close:CreateFontString(nil, 'OVERLAY')
	Close.Text:FontTemplate(nil, 12, "THICKOUTLINE")
	Close.Text:SetText("X")
	Close.Text:SetPoint("CENTER", 2, -1)

	local MainFrame = CreateFrame("Frame", nil, Tittle)
	MainFrame:SetFrameStrata("HIGH")
	MainFrame:SetSize(300, 320)
	MainFrame:SetPoint("TOP", Tittle, "BOTTOM", 0, -5)
	MainFrame:CreateBackdrop("Transparent")
	local Bottom = CreateFrame("Button", nil, MainFrame)
	Bottom:SetSize(264, 18)
	Bottom:SetTemplate("Transparent")
	Bottom:SetPoint("TOP", MainFrame, "BOTTOM", 0, -5)
	Bottom.Text = Bottom:CreateFontString(nil, 'OVERLAY')
	Bottom.Text:FontTemplate(nil,12, "THICKOUTLINE")
	function MainFrame.UpdatePageText() Bottom.Text:SetText(Page.." / "..MaxPage) end
	Bottom.Text:SetText(Page.." / "..MaxPage)
	Bottom.Text:SetPoint("CENTER", 1, -1)
	local Pre = CreateFrame("Button", nil, Bottom)
	Pre:SetSize(16, 18)
	Pre:SetTemplate("Transparent")
	Pre:SetPoint("RIGHT", Bottom, "LEFT", -4, 0)
	Pre:SetScript("OnClick",function(self)
		Page = Page-1 > 0 and Page-1 or 1
		UpdateAddonButton(MainFrame)
	end)
	Pre:SetScript("OnEnter", function(self) self.Text:SetTextColor(0/255, 170/255, 255/255) end)
	Pre:SetScript("OnLeave", function(self) self.Text:SetTextColor(255/255, 255/255, 255/255) end)
	Pre.Text = Pre:CreateFontString(nil, 'OVERLAY')
	Pre.Text:FontTemplate(nil, 12, "THICKOUTLINE")
	Pre.Text:SetText("<")
	Pre.Text:SetPoint("CENTER", 1, -1)

	local Next = CreateFrame("Button", nil, Bottom)
	Next:SetSize(16, 18)
	Next:SetTemplate("Transparent")
	Next:SetPoint("LEFT", Bottom, "RIGHT", 4, 0)
	Next:SetScript("OnClick",function(self)
		Page = Page <= MaxPage and Page+1 or Page
		UpdateAddonButton(MainFrame)
	end)
	Next:SetScript("OnEnter", function(self) self.Text:SetTextColor(0/255, 170/255, 255/255) end)
	Next:SetScript("OnLeave", function(self) self.Text:SetTextColor(255/255, 255/255, 255/255) end)
	Next.Text = Next:CreateFontString(nil, 'OVERLAY')
	Next.Text:FontTemplate(nil, 12, "THICKOUTLINE")
	Next.Text:SetText(">")
	Next.Text:SetPoint("CENTER", 1, -1)

	
	Tittle:Hide()
	return MainFrame, Tittle
end

function Module:OnEnable()
	local MainFrame, Tittle = BuildMainFrame()
	UpdateAddonList()
	UpdateAddonButton(MainFrame)
	BuildGameMenuButton(Tittle)
end