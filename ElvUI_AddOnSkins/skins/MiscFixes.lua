local E, L, V, P, G,_ = unpack(ElvUI)
local AS = E:GetModule('AddOnSkins')
local S = E:GetModule('Skins')

local name = "TomTomSkin"
local function SkinTomTom()
	if TomTomBlock then
		TomTomBlock:SetTemplate("Transparent")
	end
end
AS:RegisterSkin(name, SkinTomTom)

name = "AlwaysTrue"
function SkinMisc()
	if IsAddOnLoaded("Numeration") and AS:CheckOption("NumerationSkin") then
		AS:SkinFrame(NumerationFrame)
	end
	if IsAddOnLoaded("Critline") and AS:CheckOption("CritlineSkin") then
		AS:SkinBackdropFrame(Critline.display)
		Critline.display.backdrop:SetFrameStrata("BACKGROUND")
	end	
	if IsAddOnLoaded("InspectEquip") and AS:CheckOption("InspectEquipSkin") then
		AS:SkinFrame(InspectEquip_InfoWindow)
		S:HandleCloseButton(InspectEquip_InfoWindow_CloseButton)
	end
	if IsAddOnLoaded("stAddonManager") then
		GameMenuFrame:HookScript("OnShow", function() if GameMenuButtonAddons then S:HandleButton(GameMenuButtonAddons) end end)
	end
	if IsAddOnLoaded("VengeanceStatus") and (AS:CheckOption("VengeanceStatusSkin")) then
		AS:SkinStatusBar(VengeanceStatus_StatusBar)
	end
	
	LoadAddOn("acb_CastBar")
	if IsAddOnLoaded("acb_CastBar") then
		AzCastBarPluginPlayer:StripTextures() AzCastBarPluginPlayer:CreateBackdrop()
		AzCastBarPluginTarget:StripTextures() AzCastBarPluginTarget:CreateBackdrop()
		AzCastBarPluginFocus:StripTextures() AzCastBarPluginFocus:CreateBackdrop()
		AzCastBarPluginMirror:StripTextures() AzCastBarPluginMirror:CreateBackdrop()
		AzCastBarPluginPet:StripTextures() AzCastBarPluginPet:CreateBackdrop()
	end
	for i = 1, 10 do
		if _G["StaticPopup"..i] then
			_G["StaticPopup"..i]:SetTemplate("Transparent")
			if _G["StaticPopup"..i.."Button1"] then S:HandleButton(_G["StaticPopup"..i.."Button1"]) end
			if _G["StaticPopup"..i.."Button2"] then S:HandleButton(_G["StaticPopup"..i.."Button2"]) end
			if _G["StaticPopup"..i.."CloseButton"] then S:HandleCloseButton(_G["StaticPopup"..i.."CloseButton"]) end
		end
	end
end
AS:RegisterSkin(name, SkinMisc)
local function SkinButton(frame)
	local buttons = {
		"QueueStatusMinimapButton",
		"MiniMapTrackingButton",
		"MiniMapMailFrame",
		"HelpOpenTicketButton",
		"ElvConfigToggle",
		"DBMMinimapButton",
		"ZygorGuidesViewerMapIcon",
	}

	if(frame:GetObjectType() ~= "Button") then return end

	for i, buttons in pairs(buttons) do
		if(frame:GetName() ~= nil) then
			if(frame:GetName():match(buttons)) then return end
			for z = 1,999 do
				if _G["GatherMatePin"..z] then return end
			end
		end
	end

	frame:SetPushedTexture(nil)
	frame:SetHighlightTexture(nil)
	frame:SetDisabledTexture(nil)
	frame:Size(24)

	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if(region:GetObjectType() == "Texture") then
			local tex = region:GetTexture()

			if(tex and (tex:find("Border") or tex:find("Background") or tex:find("AlphaMask"))) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:Point("TOPLEFT", frame, "TOPLEFT", 2, -2)
				region:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
				region:SetDrawLayer( "ARTWORK" )
				if(frame:GetName() == "PS_MinimapButton") then
					region.SetPoint = E.dummy
				end
			end
		end
	end

	frame:SetTemplate("Default")
end

local UISkinMinimapButtons = CreateFrame("Frame")
UISkinMinimapButtons:RegisterEvent("PLAYER_ENTERING_WORLD")
UISkinMinimapButtons:SetScript("OnEvent", function(self, event)
	if not E.private.skins.addons.MinimapButton then return; end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	for i = 1, Minimap:GetNumChildren() do
		SkinButton(select(i, Minimap:GetChildren()))
	end

	self = nil
end )
