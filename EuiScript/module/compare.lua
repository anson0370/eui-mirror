local E, L, DF = unpack(ElvUI); --Engine
if E.db["euiscript"].hovertip == true then
	CURRENTLY_EQUIPPED = LIGHTYELLOW_FONT_COLOR_CODE.."["..CURRENTLY_EQUIPPED.."]".. FONT_COLOR_CODE_CLOSE

	local orig1 = GameTooltip:GetScript("OnTooltipSetItem")
	GameTooltip:SetScript("OnTooltipSetItem", function(self, ...)
		local f = GetMouseFocus() and GetMouseFocus():GetName() or ""
		if not _G[f.."HotKey"] and not ShoppingTooltip1:IsVisible() and not self:IsEquippedItem() then GameTooltip_ShowCompareItem(self, 1) end
		if orig1 then return orig1(self, ...) end
	end)


	local orig2 = ItemRefTooltip:GetScript("OnTooltipSetItem")
	ItemRefTooltip:SetScript("OnTooltipSetItem", function(self, ...)
		GameTooltip_ShowCompareItem(self, 1)
		self.comparing = true
		if orig2 then return orig2(self, ...) end
	end)


	-- Don't let ItemRefTooltip fuck with the compare tips
	ItemRefTooltip:SetScript("OnEnter", nil)
	ItemRefTooltip:SetScript("OnLeave", nil)
	ItemRefTooltip:SetScript("OnDragStart", function(self)
		ItemRefShoppingTooltip1:Hide(); ItemRefShoppingTooltip2:Hide(); ItemRefShoppingTooltip3:Hide()
		self:StartMoving()
	end)
	ItemRefTooltip:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		ValidateFramePosition(self)
		GameTooltip_ShowCompareItem(self, 1)
	end)


	local orig1, orig2 = {}, {}
	local GameTooltip = GameTooltip

	local linktypes = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true}


	local function OnHyperlinkEnter(frame, link, ...)
		local linktype = link:match("^([^:]+)")
		if linktype and linktypes[linktype] then
			GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT")
			GameTooltip:SetHyperlink(link)
			GameTooltip:Show()
		end

		if orig1[frame] then return orig1[frame](frame, link, ...) end
	end

	local function OnHyperlinkLeave(frame, ...)
		GameTooltip:Hide()
		if orig2[frame] then return orig2[frame](frame, ...) end
	end


	local _G = getfenv(0)
	for i=1, NUM_CHAT_WINDOWS do
		local frame = _G["ChatFrame"..i]
		orig1[frame] = frame:GetScript("OnHyperlinkEnter")
		frame:SetScript("OnHyperlinkEnter", OnHyperlinkEnter)
	
		orig2[frame] = frame:GetScript("OnHyperlinkLeave")
		frame:SetScript("OnHyperlinkLeave", OnHyperlinkLeave)
	end
end