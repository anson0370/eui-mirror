--[[
	Project.: oUF_ClickSet
	File....: oUF_ClickSet.lua
	Version.: 40300
	Rev Date: 2011/11/14
	Authors.: eui.cc
]] 

--[[
	Code Example:
	 .ClickSet = SpellList
	
	SpellList Example:
		SpellList = {
			['spec1'] = {
				["altztype1"]	= 1459,
				["ctrlztype1"]	= 54646,
				["type2"]		= 475,
				["shiftztype2"]	= 130,
				["type3"] = "#*/cast spellname", --macro must begin with '#*'
			},
			['spec2'] = {
				["altztype1"]	= 1459,
				["ctrlztype1"]	= 54646,
				["type2"]		= 475,
				["shiftztype2"]	= 130,
				["type3"] = "#*/cast spellname", --macro must begin with '#*'
			},
			['specswap'] = true,
		}
		-- string.gsub(key, 'z', '-')
	SpellList["type2"] = "NONE"  -- will not apple attribute
]]

local _, ns = ...
local oUF = ns.oUF or oUF
if not oUF then return end
 
local function Update(object, event, unit)
	if not object or InCombatLockdown() then return end

	local spec = 'spec1'
	if object.ClickSet.specswap == true and GetActiveSpecGroup() == 2 then
		spec = 'spec2'
	end
	
	unpack(ElvUI):CopyTable(object.ClickSet, unpack(ElvUI).db["clickset"])
	if object.ClickSet[spec] == nil then return end

	local key_tmp
	for key, value in pairs(object.ClickSet[spec]) do
		key_tmp = string.gsub(key,"z","-")
		if value == "NONE" then
			object:SetAttribute(key_tmp, nil)
		elseif value == "target" or value == "menu" or value == "focus" then
			object:SetAttribute(key_tmp, value)
		elseif value ~= "NONE" and key ~= "enable" and type(value) == "string" then
			if string.sub(value, 1, 2) ~= "#*" then
				object:SetAttribute(key_tmp, 'spell')
				object:SetAttribute(string.gsub(key_tmp,"type",'spell'), value)
			else
				object:SetAttribute(key_tmp, 'macro')
				object:SetAttribute('macrotext', string.sub(value, 3))
			end
		end
	end
	key_tmp = nil
end

local function Enable(object)
	if object.ClickSet == nil then return end
	if type(object.ClickSet) ~= 'table' then
		print('object.ClickSetList is nil or not is a table')
		return
	end
	
	-- make sure aura scanning is active for this object
	object:RegisterEvent("PLAYER_REGEN_ENABLED", Update)
	object:RegisterEvent("UNIT_SPELLCAST_START", Update)
	object:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED", Update)
	
	if not InCombatLockdown() then
		local spec = 'spec1'
		if object.ClickSet.specswap == true and GetActiveSpecGroup() == 2 then
			spec = 'spec2'
		end
		local key_tmp
		for key, value in pairs(object.ClickSet[spec]) do
			key_tmp = string.gsub(key,"z","-")
			if value == "NONE" then
				object:SetAttribute(key_tmp, nil)			
			elseif value == "target" or value == "menu" or value == "focus" then
				object:SetAttribute(key_tmp, value)
			elseif value ~= "NONE" and key ~= "enable" and type(value) == "string" then
				if string.sub(value, 1, 2) ~= "#*" then
					object:SetAttribute(key_tmp, 'spell')
					object:SetAttribute(string.gsub(key_tmp,"type",'spell'), value)
				else
					object:SetAttribute(key_tmp, 'macro')
					object:SetAttribute('macrotext', string.sub(value, 3))
				end
			end
		end
		key_tmp = nil
	end
	
	return true
end
 
local function Disable(object)
	if object.ClickSet then
		object:UnregisterEvent("PLAYER_REGEN_ENABLED", Update)
		object:UnregisterEvent("UNIT_SPELLCAST_START", Update)
		object:UnregisterEvent("PLAYER_SPECIALIZATION_CHANGED", Update)
	end
end
 
oUF:AddElement('ClickSet', Update, Enable, Disable)
 
for i, frame in ipairs(oUF.objects) do Enable(frame) end