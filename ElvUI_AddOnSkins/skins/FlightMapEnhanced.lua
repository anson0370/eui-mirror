local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "FlightMapEnhancedSkin"
local function SkinFlightMapEnhanced()
	AS:SkinBackdropFrame(FlightMapEnhancedTaxiChoice, true)
	AS:SkinCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	AS:SkinScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript("OnShow", function()
		for i = 1, 34 do
			if _G["FlightMapEnhancedTaxiChoiceContainerButton"..i] then _G["FlightMapEnhancedTaxiChoiceContainerButton"..i]:StripTextures() end
		end
	end)
	hooksecurefunc("FlightMapEnhancedTaxiChoiceButton_OnEnter", function() GameTooltip:Show() end)
end
AS:RegisterSkin(name, SkinFlightMapEnhanced)