local _, Backend = ...

if Backend.UI ~= "ElvUI" then return end

local Sticky = LibStub("LibSimpleSticky-1.0");
local E = ElvUI[1]
local cl = Backend.CL

Backend["Defaults"]["Parent"] = nil
Backend["Defaults"]["Font"]   = E.db.general.font
Backend["Defaults"]["FontSize"] = E.db.general.fontsize
Backend["Defaults"]["ConfFColor"] = E.db.general.valuecolor
Backend["Defaults"]["Mult"] = E.mult

Backend["Scale"] = function(l)
    return E:Scale(l)
end

local ifConfig = false
Backend.IfConfig = function()
	return ifConfig
end

Backend.Skin = function(self)
	self.CLDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	self.CLDB.border  = "None"
	
	Backend:SetupHolder()
	Backend:SetupMover()
	Backend:SetupResizer()
	Backend:OnUpdate()
end

Backend.SetupHolder = function(self)
	local holder = CreateFrame('Frame', 'CoolLineHolder', E.UIParent)
	holder:Point("CENTER", E.UIParent)
	holder:SetHeight(self.CLDB.h + self.Scale(4))
	holder:SetWidth(self.CLDB.w + self.Scale(4))
	cl:ClearAllPoints()
	cl:Point("TOPLEFT", holder, "TOPLEFT", 2, -2)
	cl:Point("BOTTOMRIGHT", holder, "BOTTOMRIGHT", -2, 2)
	cl:CreateBackdrop('Default')
end

Backend.SetupMover = function(self)	
	E:CreateMover(CoolLineHolder, 'CoolLineMover', 'CoolLine (right click for options)', true, nil)
	CoolLineMover:SetClampedToScreen(true)
	CoolLineHolder:ClearAllPoints()
	CoolLineHolder:SetAllPoints(CoolLineMover)
	CoolLineMover:HookScript("OnMouseUp", function(self, arg) if arg == "RightButton" then Backend:ShowOptions() end end)
	CoolLineMover:SetScript("OnDragStart", function(self) 
		if InCombatLockdown() then E:Print(ERR_NOT_IN_COMBAT) return end
		if E.db['general'].stickyFrames then
			local offset = -1
			Sticky:StartMoving(self, E['snapBars'], offset, offset, offset, offset)
		else
			self:StartMoving() 
		end
	end)
end

Backend.SetupResizer = function(self)
	CoolLineMover:SetResizable(true)
	
	resizer = CreateFrame("Button", "CoolLineHolderResizer", CoolLineMover, "UIPanelButtonTemplate")
	resizer:SetWidth(8)
	resizer:SetHeight(8)
	resizer:SetPoint("BOTTOMRIGHT", -2, 2)
	resizer:SetFrameLevel(CoolLineMover:GetFrameLevel() + 1)
	resizer:SetScript("OnEnter", function(this)
		GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
		GameTooltip:SetText("CoolLine")  -- This sets the top line of text, in gold.
		GameTooltip:AddLine("Drag here to resize.", 1, 1, 1)
		GameTooltip:Show()
	end)
	
	resizer:SetScript("OnLeave", function(this)
		GameTooltip:Hide()
	end)
	
	resizer:SetScript("OnMouseDown", function(this, arg)
		if arg == "LeftButton" then 
			CoolLineMover:StartSizing("BOTTOMRIGHT")
			GameTooltip:Hide()
		end
	end)
	
	resizer:SetScript("OnMouseUp", function(this)
		CoolLineMover:StopMovingOrSizing()
		local name = "CoolLineMover"
		if not E.db.movers then E.db.movers = {} end
		E.db.movers[name] = {}
		local p, _, p2, p3, p4 = CoolLineMover:GetPoint()
		E.db.movers[name]["p"] = p
		E.db.movers[name]["p2"] = p2
		E.db.movers[name]["p3"] = p3
		E.db.movers[name]["p4"] = p4
		CoolLineMover:SetUserPlaced(false)
		Backend:OnUpdate()
	end)
	
	cl.resizer = CreateFrame("Frame")
end

Backend.OnUpdate = function(self)
	CoolLineHolder:SetSize(CoolLineMover:GetSize())
	
	self.CLDB.h = CoolLineHolder:GetHeight() - self.Scale(4)
	self.CLDB.w = CoolLineHolder:GetWidth() - self.Scale(4)
	cl:updatelook()
end

Backend.ShowOptions = Backend.UnmodifiedShowSettings
SlashCmdList.COOLLINE = Backend.UnmodifiedShowSettings