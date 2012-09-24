local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

----------------------------------------------------------------------------------------
--	Skin addons icons on minimap
----------------------------------------------------------------------------------------
local buttons = {
	"MiniMapBattlefieldFrame",
	"MiniMapLFGFrame",
	"MiniMapTrackingButton",
	"MiniMapMailFrame",
	"HelpOpenTicketButton"
}

local function SkinButton(f)
	if f:GetObjectType() ~= "Button" then return end

	for i, buttons in pairs(buttons) do
		if f:GetName() ~= nil then
			if f:GetName():match(buttons) then return end
		end
	end

	f:SetPushedTexture(nil)
	f:SetHighlightTexture(nil)
	f:SetDisabledTexture(nil)
	f:Size(24, 24)

	for i = 1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			local tex = region:GetTexture()

			if tex and (tex:find("Border") or tex:find("Background")) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:Point("TOPLEFT", f, "TOPLEFT", 2, -2)
				region:Point("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				if f:GetName() == "PS_MinimapButton" then
					region.SetPoint = E.noop
				end
			end
		end
	end
	f:SetTemplate("Default")
end

local function LoadSkin()
	if E.private.skins.minimapbuttons.enable ~= true then return end
	for i = 1, Minimap:GetNumChildren() do
		local f = select(i, Minimap:GetChildren())
		if f:GetName() then
			if not string.find(f:GetName(), "GatherMate") and not string.find(f:GetName(), "ElvConfigToggle") then
				SkinButton(f)
			end
		else
			SkinButton(f)
		end
	end
end

S:RegisterSkin('MBB', LoadSkin)