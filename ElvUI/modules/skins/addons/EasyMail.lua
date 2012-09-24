local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')local SkinEasyMail = CreateFrame("Frame")
	SkinEasyMail:RegisterEvent("MAIL_SHOW")
	SkinEasyMail:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("EasyMail") then return end
	if E.private.skins.easymail.enable ~= true then return end
	
	-- Skin Buttons
		S:HandleButton(EasyMail_CheckAllButton)
		S:HandleButton(EasyMail_GetAllButton)
		S:HandleButton(EasyMail_AttButton)
		S:HandleButton(EasyMail_ForwardButton)
		EasyMail_GetAllButton:SetWidth(EasyMail_CheckAllButton:GetWidth())
	-- Skin Checkboxes

		for i = 1, 7 do
			S:HandleCheckBox(_G["EasyMail_CheckButton"..i])
		end

	-- Move Positions
		EasyMail_ForwardButton:Point("RIGHT", OpenMailReplyButton, "LEFT", -2, 0)
		InboxTooMuchMail:Point("TOPLEFT", MailFrame, "TOPLEFT", 4, -10)
		OpenMailCancelButton:Point("BOTTOMRIGHT", OpenMailFrame, "BOTTOMRIGHT", -12, 80)
		InboxCloseButton:Point("TOPRIGHT", MailFrame, "TOPRIGHT", 4, 5)
		OpenMailCloseButton:Point("TOPRIGHT", OpenMailFrame, "TOPRIGHT", 4, 5)
		
	-- Move Expire Time	
		for i = 1, 7 do	
			local t = _G["MailItem"..i.."ExpireTime"]
				if t then
					t:ClearAllPoints()
					t:Point("TOPRIGHT", -10, -4)
					t:Point("TOPRIGHT", -10, -4)
				end				
		end
-- EasyMail From Cosmos - Added by Camealion - End
end)