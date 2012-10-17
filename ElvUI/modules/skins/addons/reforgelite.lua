local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local S = E:GetModule('Skins')

local function SkinReforgeLite()

	local R = ReforgeLite;
	if not R then return; end

	R:HookScript("OnShow", function()
		if R.skins then return; end
		R:SetTemplate("Transparent")
		R.title:SetText(GetAddOnMetadata("ReforgeLite", 'Title').. GetAddOnMetadata("ReforgeLite", "Version"));
		R.itemTable:SetTemplate("Transparent")
		R.settings:SetTemplate("Transparent")
		R.methodStats:SetTemplate("Transparent")

		R.task.weights:SetTemplate("Transparent")
		R.task.caps[1]:SetTemplate("Transparent")
		R.task.caps[2]:SetTemplate("Transparent")
		R.task.prio:SetTemplate("Transparent")
		
		R.title:SetText(GetAddOnMetadata("ReforgeLite", 'Title').. GetAddOnMetadata("ReforgeLite", "Version"));

		S:HandleCloseButton(R.close)

		S:HandleScrollBar(R.scrollBar)
		S:HandleButton(R.computeButton)
		S:HandleButton(R.debugButton)
		S:HandleButton(R.methodShow)
		S:HandleButton(R.methodReset)
		S:HandleButton(R.saveMethodPresetButton)
		S:HandleButton(R.deleteMethodPresetButton)
		S:HandleButton(R.savePresetButton)
		S:HandleButton(R.deletePresetButton)
		S:HandleButton(R.pawnButton)
		S:HandleButton(R.task.prio.add)	
		
		R:ShowMethodWindow()
		R.methodWindow:Hide()

		R.methodWindow:SetTemplate("Transparent")
		R.methodWindow.itemTable:SetTemplate("Transparent")
		R.methodWindow.reforge:SetTemplate("Transparent")
		S:HandleCloseButton(R.methodWindow.close)

		R.skins = true
	end)
	
end

S:RegisterSkin('ReforgeLite', SkinReforgeLite)