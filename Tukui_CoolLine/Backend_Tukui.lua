local _, Backend = ...

if Backend.UI ~= "Tukui" then return end
local T, C, L = unpack(Tukui)
local cl = Backend.CL

Backend["Defaults"]["Parent"] = "InvTukuiActionBarBackground"
Backend["Defaults"]["Font"] = C["media"].uffont
Backend["Defaults"]["FontSize"] = 12
Backend["Defaults"]["ConfFColor"] = {1, 1, 1}
Backend["Defaults"]["Mult"] = T.mult

Backend["Scale"] = function(l)
    return T.Scale(l)
end

local ifConfig = false
Backend.IfConfig = function()
	return ifConfig
end


local oldSkin = Backend.Skin
Backend.Skin = function(self)
    oldSkin(self)
    self:OnUpdate()
    if self.Config.Expand and self.Config.Docking
		and TukuiBar2Button and TukuiBar3Button then
        TukuiBar2Button:HookScript("OnClick", function() self:OnUpdate() end)
        TukuiBar3Button:HookScript("OnClick", function() self:OnUpdate() end)
    end
end

Backend.OnUpdate = function(self)
	if not self.Config.Docking then
		if cl.overlayBtn then cl.overlayBtn:Hide() end
		cl:ClearAllPoints()
	else
		self:ToggleConfigBG()
		local xOffset = 0
		local parent = self:GetParent()
		self.CLDB.w = (T.buttonsize * 12) + (T.buttonspacing * 13) - self.Scale(4)
		if not T.lowversion then
			if not TukuiDataPerChar["hidebar2"] and self.Config.Expand then
				self.CLDB.w = self.CLDB.w + TukuiBar2:GetWidth() + self.Scale(6)
			end
			if not TukuiDataPerChar["hidebar3"] and self.Config.Expand then
				self.CLDB.w = self.CLDB.w + TukuiBar3:GetWidth() + self.Scale(6)
			else
				xOffset = TukuiBar1:GetRight() - parent:GetRight()
			end
		end
		
		cl:updatelook()
		cl:SetPoint("BOTTOMRIGHT", parent, "TOPRIGHT", self.Scale(-2)+xOffset, self.Scale(4))
	end
end

local oldToggleMovers = SlashCmdList.MOVING
SlashCmdList.MOVING = function()
	ifConfig = not ifConfig
    oldToggleMovers()
	Backend:ToggleConfigBG()
end