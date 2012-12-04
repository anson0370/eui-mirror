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