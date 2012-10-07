local E, L, DF = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
if E.db["euiscript"].mapmove ~= true then return end

--Create move button for map
local movebutton = CreateFrame ("Frame", nil, WorldMapFrameCloseButton)
movebutton:SetFrameStrata("TOOLTIP")
movebutton:SetHeight(E:Scale(32))
movebutton:SetWidth(E:Scale(32))
movebutton:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", E:Scale(-15), E:Scale(-5))
movebutton:SetBackdrop( { 
	bgFile = "Interface\\AddOns\\ElvUI\\media\\textures\\cross",
})
movebutton:EnableMouse(true)

movebutton:SetScript("OnMouseDown", function()
--	SetCVar("advancedWorldMap",1)
	WorldMapScreenAnchor:ClearAllPoints()
	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:StartMoving();
end)

movebutton:SetScript("OnMouseUp", function()
--	SetCVar("advancedWorldMap",1)
	WorldMapFrame:StopMovingOrSizing()
	WorldMapScreenAnchor:StartMoving()
	WorldMapScreenAnchor:SetPoint("TOPLEFT", WorldMapFrame)
	WorldMapScreenAnchor:StopMovingOrSizing()
end)