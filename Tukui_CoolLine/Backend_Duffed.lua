local _, Backend = ...

if Backend.UI ~= "Tukui" then return end

local T, C, L = unpack(Tukui)
if not T.Duffed then return end

Backend["Defaults"]["Parent"] = "TukuiBar1"

local oldSkin = Backend.Skin
Backend.Skin = function(self)
    oldSkin(self)
    self:OnUpdate()
    if TukuiBar2Button then
        TukuiBar2Button:HookScript("OnClick", function(self, arg) if arg == "LeftButton" then Backend:OnUpdate() end end)
    end
	if C["actionbar"].petbarhorizontal then
		TukuiPetBar:HookScript("OnEvent", function(self, event, arg)
			if event ~= "PLAYER_LOGIN" then
				Backend:OnUpdate()
			end
		end)
	end
end

Backend.OnUpdate = function(self)
	if not self.Config.Docking then
		if self.CL.overlayBtn then self.CL.overlayBtn:Hide() end
		self.CL:ClearAllPoints()
	else
		self:ToggleConfigBG()
		local yOffset = 0
		local xOffset = 0
		local parent = self:GetParent()
		self.CLDB.w = (T.buttonsize * 12) + (T.buttonspacing * 13) - 4
		if not T.lowversion and TukuiDataPerChar["hidebar2"] and self.Config.Expand then
			self.CLDB.w = self.CLDB.w * 2
		end
		if not TukuiDataPerChar["hidebar2"] then
			yOffset = (T.buttonsize * 1) + (T.buttonspacing * 2)+4
			xOffset = TukuiBar2:GetRight() - parent:GetRight()
		end
		if not self.Config.Expand then
			xOffset = TukuiBar2:GetRight() - parent:GetRight()
		end
		
		if C["actionbar"].petbarhorizontal and TukuiPetBar:IsShown() then
			self.CLDB.w = (T.petbuttonsize * 10) + (T.petbuttonspacing * 11) - 4
			yOffset = yOffset + T.petbuttonsize + (T.petbuttonspacing * 2)+4
			xOffset = TukuiPetBar:GetRight() - parent:GetRight()
		end
		self.CL:updatelook()
		self.CL:Point("BOTTOMRIGHT", parent, "TOPRIGHT", xOffset-2, yOffset+4)
	end
	T.cbPosition()
end

local oldCBPosition = T.cbPosition
T.cbPosition = function()
	if not Backend.Config.Docking then
		oldCBPosition()
	else
		if C["unitframes"].enable ~= true or C["castbar"].enable ~= true then return end

		T.cbSize()
		TukuiPlayerCastBar:ClearAllPoints()
		if T.lowversion or not Backend.Config.Expand or not TukuiDataPerChar["hidebar2"]
			or (TukuiPetBar:IsShown() and C["actionbar"].petbarhorizontal) then
			TukuiPlayerCastBar:Point("BOTTOMRIGHT", Backend.CL, "TOPRIGHT", 0, 10)
		else
			TukuiPlayerCastBar:Point("BOTTOMRIGHT", Backend.CL, "TOPRIGHT",
				TukuiBar2:GetRight() - Backend:GetParent():GetRight()-2, 10)
		end
	end
end
