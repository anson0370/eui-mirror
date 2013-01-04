﻿local E = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
if E.db.euiscript.autobuy ~= true or (UnitLevel('player') ~= MAX_PLAYER_LEVEL) then return end
local find = string.find
local min = math.min
local max = math.max

----------------------------------------------------------------------------------------
--	Auto buy reagents by (ShestakUI)
----------------------------------------------------------------------------------------
local reagents = {
	MAGE = {
		[17031] = 20,	-- 传送符文
		[17032] = 20,	-- 传送门符文
	},
	ROGUE = {
		[6947] = 20,	-- 速效药膏
		[2892] = 20,	-- 致命药膏
		[3775] = 20,	-- 减速药膏
		[5237] = 20,	-- 麻痹药膏
		[10918] = 20,	-- 致伤药膏
	},
}
local ItemIDPattern = "item:(%d+)"

local function FormatGold(amount)
	local gold, silver, copper = floor(amount * 0.0001), floor(mod(amount * 0.01, 100)), floor(mod(amount, 100))

	return (gold > 0 and format("%s|cffffd700%s|r ", gold, GOLD_AMOUNT_SYMBOL) or "")
	.. (silver > 0 and format("%s|cffc7c7cf%s|r ", silver, SILVER_AMOUNT_SYMBOL) or "")
	.. ((copper > 0 or (gold == 0 and silver == 0)) and format("%s|cffeda55f%s|r", copper, COPPER_AMOUNT_SYMBOL) or "")
end

local function CheckReagents(CheckID, RequiredAmount)
	local total = 0
	local ItemLink, stack = nil, 0

	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
			ItemLink = GetContainerItemLink(bag, slot)
			if ItemLink and CheckID == tonumber(select(3, find(ItemLink, ItemIDPattern))) then
				stack = select(2, GetContainerItemInfo(bag, slot))
				total = total + stack
			end
		end
	end

	return max(0, (RequiredAmount - total))
end

local function BuyReagents(reagents)
	local ItemLink, ItemID, stock, price, stack, quantity, fullstack

	for i = 1, GetMerchantNumItems() do
		ItemLink = GetMerchantItemLink(i)

		if ItemLink then
			ItemID = tonumber(select(3, find(ItemLink, ItemIDPattern)))
		end

		if ItemID and reagents[ItemID] then
			price, stack, stock = select(3, GetMerchantItemInfo(i))
			quantity = CheckReagents(ItemID, reagents[ItemID])

			if quantity > 0 then
				if stock ~= -1 then
					quantity = min(quantity, stock)
				end

				subtotal = price * (quantity / stack)

				if subtotal > GetMoney() then
					print("|cffffff00"..ERR_NOT_ENOUGH_MONEY.."|r")
					return
				end

				fullstack = select(8, GetItemInfo(ItemID))

				while quantity > fullstack do
					BuyMerchantItem(i, fullstack)
					quantity = quantity - fullstack
				end

				if quantity > 0 then
					BuyMerchantItem(i, quantity)
					if ItemLink then
						print("|cff66C6FF"..ITEM_PURCHASED_COLON.." "..ItemLink.." - "..FormatGold(subtotal)..".")
					end
				end
			end
		end

		quantity = 0
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function(self, event)
	if event == "MERCHANT_SHOW" and not (IsAltKeyDown() or IsShiftKeyDown()) then
		if reagents[E.myclass] then
			BuyReagents(reagents[E.myclass])
		end
	end
end)