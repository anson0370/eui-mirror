local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
if E.db.combattext.enable ~= true or IsAddOnLoaded('xCT') or IsAddOnLoaded('MikScrollingBattleText') then return end
local lower = string.lower
local floor = math.floor

if GetLocale() == 'zhCN' then
	L_COMBATTEXT_KILLING_BLOW = "最后一击"
	L_COMBATTEXT_ALREADY_UNLOCKED = "战斗信息已经解锁."
	L_COMBATTEXT_ALREADY_LOCKED = "战斗信息已经锁定."
	L_COMBATTEXT_TEST_DISABLED = "战斗信息测试模式已禁用."
	L_COMBATTEXT_TEST_ENABLED = "战斗信息测试模式已启用."
	L_COMBATTEXT_TEST_USE_UNLOCK = "输入 /xct unlock 来移动或调整战斗信息框架大小."
	L_COMBATTEXT_TEST_USE_LOCK = "输入 /xct lock 来锁定战斗信息框架."
	L_COMBATTEXT_TEST_USE_TEST = "输入 /xct test 来启用或禁用战斗信息测试模式."
	L_COMBATTEXT_TEST_USE_RESET = "输入 /xct reset 来复位所有的信息框架."
	L_COMBATTEXT_POPUP = "要保存战斗信息窗口的位置你需要重新载入插件."
	L_COMBATTEXT_UNSAVED = "战斗信息窗口位置尚未保存,不要忘记重新载入插件."
	L_COMBATTEXT_UNLOCKED = "战斗信息已解锁."
	L_Crit = "爆击"
elseif GetLocale() == 'zhTW' then
	L_COMBATTEXT_KILLING_BLOW = "最後一擊"
	L_COMBATTEXT_ALREADY_UNLOCKED = "戰鬥信息已經解鎖."
	L_COMBATTEXT_ALREADY_LOCKED = "戰鬥信息已經鎖定."
	L_COMBATTEXT_TEST_DISABLED = "戰鬥信息測試模式已禁用."
	L_COMBATTEXT_TEST_ENABLED = "戰鬥信息測試模式已啟用."
	L_COMBATTEXT_TEST_USE_UNLOCK = "輸入 /xct unlock 來移動或調整戰鬥信息框架大小."
	L_COMBATTEXT_TEST_USE_LOCK = "輸入 /xct lock 來鎖定戰鬥信息框架."
	L_COMBATTEXT_TEST_USE_TEST = "輸入 /xct test 來啟用或禁用戰鬥信息測試模式."
	L_COMBATTEXT_TEST_USE_RESET = "輸入 /xct reset 來複位所有的資訊框架."
	L_COMBATTEXT_POPUP = "要保存戰鬥信息窗口的位置你需要重新載入插件."
	L_COMBATTEXT_UNSAVED = "戰鬥信息窗口位置尚未保存,不要忘記重新載入插件."
	L_COMBATTEXT_UNLOCKED = "戰鬥信息已解鎖."
	L_Crit = "爆擊"
else
	L_COMBATTEXT_KILLING_BLOW = "Killing Blow"
	L_COMBATTEXT_ALREADY_UNLOCKED = "Combat text already unlocked."
	L_COMBATTEXT_ALREADY_LOCKED = "Combat text already locked."
	L_COMBATTEXT_TEST_DISABLED = "Combat text test mode disabled."
	L_COMBATTEXT_TEST_ENABLED = "Combat text test mode enabled."
	L_COMBATTEXT_TEST_USE_UNLOCK = "Type /xct unlock to move and resize combat text frames."
	L_COMBATTEXT_TEST_USE_LOCK = "Type /xct lock to lock combat text frames."
	L_COMBATTEXT_TEST_USE_TEST = "Type /xct test to toggle combat text testmode."
	L_COMBATTEXT_TEST_USE_RESET = "Type /xct reset to reset all combat text frames postion."
	L_COMBATTEXT_POPUP = "To save combat text window positions you need to reload your UI."
	L_COMBATTEXT_UNSAVED = "Combat text window positions unsaved, don't forget to reload UI."
	L_COMBATTEXT_UNLOCKED = "Combat text unlocked."
	L_Crit = "Crit"
end



----------------------------------------------------------------------------------------
--	Combat Text(xCT by Affli) modify by eui.cc at 20120718
----------------------------------------------------------------------------------------
-- Justify messages in frames
local ct = {
	["justify_1"] = "LEFT",			-- Incoming damage justify
	["justify_2"] = "RIGHT",		-- Incoming healing justify
	["justify_3"] = "CENTER",		-- Various messages justify
	["justify_4"] = "RIGHT",		-- Outgoing damage/healing justify
	["justify_5"] = "RIGHT",		-- Outgoing damage/healing justify
}

--CombatText filter
----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Flask of the Winds -> http://www.wowhead.com/spell=79471
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
-- Outgoing healing filter
if E.db.combattext.healing then
	ct.healfilter = {}
end

if E.db.combattext.merge_aoe_spam then
	ct.aoespam = {}
	ct.aoespam[120687] = true --Stormlash
end

-- Class config
if E.myclass == "DEATHKNIGHT" then
	if E.db.combattext.merge_aoe_spam then
		ct.aoespam[55095] = true		-- Frost Fever
		ct.aoespam[55078] = true		-- Blood Plague
		ct.aoespam[48721] = true		-- Blood Boil
		ct.aoespam[49184] = true		-- Howling Blast
		ct.aoespam[52212] = true		-- Death and Decay
		ct.aoespam[55050] = true		-- Heart Strike
		ct.aoespam[50401] = true		-- Razor Frost
		ct.aoespam[119980] = true	-- Conversion
		-- Merging mh/oh strikes(by Bozo)
		ct.aoespam[49020] = true		-- Obliterate MH
		ct.aoespam[66198] = 49020	-- Obliterate OH
		ct.aoespam[49998] = true		-- Death Strike MH
		ct.aoespam[66188] = 49998	-- Death Strike OH
		ct.aoespam[45462] = true		-- Plague Strike MH
		ct.aoespam[66216] = 45462	-- Plague Strike OH
		ct.aoespam[49143] = true		-- Frost Strike MH
		ct.aoespam[66196] = 49143	-- Frost Strike OH
	end
elseif E.myclass == "DRUID" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		ct.aoespam[774] = true		-- Rejuvenation
		ct.aoespam[48438] = true		-- Wild Growth
		ct.aoespam[8936] = true		-- Regrowth
		ct.aoespam[33763] = true		-- Lifebloom
		ct.aoespam[44203] = true		-- Tranquility
		ct.aoespam[81269] = true		-- Swiftmend
		ct.aoespam[102792] = true	-- Wild Mushroom: Bloom
		-- Damaging spells
		ct.aoespam[8921] = true		-- Moonfire
		ct.aoespam[93402] = true		-- Sunfire
		ct.aoespam[42231] = true		-- Hurricane
		ct.aoespam[106998] = true	-- Astral Storm
		ct.aoespam[50288] = true		-- Starfall
		ct.aoespam[78777] = true		-- Wild Mushroom: Detonate
		ct.aoespam[61391] = true		-- Typhoon
		ct.aoespam[1822] = true		-- Rake
		ct.aoespam[33876] = true		-- Mangle (Cat Form)
		ct.aoespam[33878] = true		-- Mangle (Bear Form)
		ct.aoespam[62078] = true		-- Swipe (Cat Form)
		ct.aoespam[779] = true		-- Swipe (Bear Form)
		ct.aoespam[33745] = true		-- Lacerate
		ct.aoespam[77758] = true		-- Thrash
		ct.aoespam[1079] = true		-- Rip
	end
elseif E.myclass == "HUNTER" then
	if E.db.combattext.merge_aoe_spam then
		ct.aoespam[2643] = true		-- Multi-Shot
		ct.aoespam[83077] = true		-- Improved Serpent Sting
		ct.aoespam[118253] = true	-- Serpent Sting
		ct.aoespam[13812] = true		-- Explosive Trap
		ct.aoespam[53301] = true		-- Explosive Shot
		ct.aoespam[63468] = true		-- Piercing Shots
		ct.aoespam[118459] = true	-- Beast Cleave
		ct.aoespam[120699] = true	-- Lynx Rush
		ct.aoespam[131900] = true	-- A Murder of Crows
		ct.aoespam[34655] = true		-- Deadly Poison (Trap)
		ct.aoespam[93433] = true		-- Burrow Attack (Worm)
		ct.aoespam[92380] = true		-- Froststorm Breath (Chimaera)
	end
elseif E.myclass == "MAGE" then
	if E.db.combattext.merge_aoe_spam then
		ct.aoespam[44457] = true		-- Living Bomb
		ct.aoespam[44461] = true		-- Living Bomb (AoE)
		ct.aoespam[2120] = true		-- Flamestrike
		ct.aoespam[12654] = true		-- Ignite
		ct.aoespam[11366] = true		-- Pyroblast
		ct.aoespam[31661] = true		-- Dragon's Breath
		ct.aoespam[42208] = true		-- Blizzard
		ct.aoespam[122] = true		-- Frost Nova
		ct.aoespam[1449] = true		-- Arcane Explosion
		ct.aoespam[83853] = true		-- Combustion
		ct.aoespam[11113] = true		-- Blast Wave
		ct.aoespam[120] = true		-- Cone of Cold
		ct.aoespam[114923] = true	-- Nether Tempest
		ct.aoespam[114954] = true	-- Nether Tempest (AoE)
		ct.aoespam[7268] = true		-- Arcane Missiles
		ct.aoespam[113092] = true	-- Frost Bomb
		ct.aoespam[44425] = true		-- Arcane Barrage
		ct.aoespam[84721] = true		-- Frozen Orb
	end
elseif E.myclass == "MONK" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		ct.aoespam[115175] = true	-- Soothing Mist
		ct.aoespam[125953] = 115175	-- Soothing Mist
		ct.aoespam[126890] = true	-- Eminence
		ct.aoespam[117640] = true	-- Spinning Crane Kick
		ct.aoespam[132463] = true	-- Chi Wave
		ct.aoespam[124101] = true	-- Zen Sphere: Detonate
		-- Damaging spells
		ct.aoespam[117952] = true	-- Crackling Jade Lightning
		ct.aoespam[117418] = true	-- Fists of Fury
		ct.aoespam[120274] = true	-- Tiger Strikes
		ct.aoespam[128531] = true	-- Blackout Kick
		ct.aoespam[123725] = true	-- Breath of Fire
		ct.aoespam[107270] = true	-- Spinning Crane Kick
		ct.aoespam[132467] = true	-- Chi Wave
		ct.aoespam[125033] = true	-- Zen Sphere: Detonate
		ct.aoespam[123586] = true	-- Flying Serpent Kick
	end
elseif E.myclass == "PALADIN" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		ct.aoespam[20167] = true		-- Seal of Insight
		ct.aoespam[53652] = true		-- Beacon of Light
		ct.aoespam[85222] = true		-- Light of Dawn
		ct.aoespam[82327] = true		-- Holy Radiance
		ct.aoespam[121129] = true	-- Daybreak
		ct.aoespam[114163] = true	-- Eternal Flame
		ct.aoespam[119952] = true	-- Arcing Light
		ct.aoespam[114852] = true	-- Holy Prism
		-- Damaging spells
		ct.aoespam[81297] = true		-- Consecration
		ct.aoespam[119072] = true	-- Holy Wrath
		ct.aoespam[53385] = true		-- Divine Storm
		ct.aoespam[31803] = true		-- Censure
		ct.aoespam[42463] = true		-- Seal of Truth
		ct.aoespam[101423] = true	-- Seal of Righteousness
		ct.aoespam[88263] = true		-- Hammer of the Righteous
		ct.aoespam[31935] = true		-- Avenger's Shield
		ct.aoespam[114916] = true	-- Execution Sentence
		ct.aoespam[96172] = true		-- Hand of Light (Mastery)
	end
	if E.db.combattext.healing then
		ct.healfilter[115547] = true	-- Glyph of Avenging Wrath
	end
elseif E.myclass == "PRIEST" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		ct.aoespam[47750] = true		-- Penance
		ct.aoespam[23455] = true		-- Holy Nova
		ct.aoespam[139] = true		-- Renew
		ct.aoespam[596] = true		-- Prayer of Healing
		ct.aoespam[64844] = true		-- Divine Hymn
		ct.aoespam[32546] = true		-- Binding Heal
		ct.aoespam[77489] = true		-- Echo of Light
		ct.aoespam[34861] = true		-- Circle of Healing
		ct.aoespam[33110] = true		-- Prayer of Mending
		ct.aoespam[63544] = true		-- Rapid Renewal
		ct.aoespam[81751] = true		-- Atonement
		ct.aoespam[94472] = 81751	-- Atonement (Crit)
		-- Damaging spells
		ct.aoespam[47666] = true		-- Penance
		ct.aoespam[132157] = true	-- Holy Nova
		ct.aoespam[589] = true		-- Shadow Word: Pain
		ct.aoespam[34914] = true		-- Vampiric Touch
		ct.aoespam[2944] = true		-- Devouring Plague
		ct.aoespam[15407] = true		-- Mind Flay
		ct.aoespam[49821] = true		-- Mind Sear
		ct.aoespam[87532] = true		-- Shadowy Apparition
		ct.aoespam[14914] = true		-- Holy Fire
	end
	if E.db.combattext.healing then
		ct.healfilter[127626] = true	-- Devouring Plague
		ct.healfilter[15290] = true	-- Vampiric Embrace
	end
elseif E.myclass == "ROGUE" then
	if E.db.combattext.merge_aoe_spam then
		ct.aoespam[51723] = true		-- Fan of Knives
		ct.aoespam[121411] = true	-- Crimson Tempest
		ct.aoespam[122233] = true	-- Crimson Tempest (DoT)
		ct.aoespam[2818] = true		-- Deadly Poison
		ct.aoespam[8680] = true		-- Wound Poison
		-- Merging mh/oh strikes
		ct.aoespam[5374] = true		-- Mutilate
		ct.aoespam[27576] = 5374		-- Mutilate Off-Hand
	end
	if E.db.combattext.healing then
		ct.healfilter[112974] = true	-- Leeching Poison
	end
elseif E.myclass == "SHAMAN" then
	if E.db.combattext.merge_aoe_spam then
		-- Healing spells
		ct.aoespam[73921] = true		-- Healing Rain
		ct.aoespam[52042] = true		-- Healing Stream Totem
		ct.aoespam[1064] = true		-- Chain Heal
		ct.aoespam[51945] = true		-- Earthliving
		ct.aoespam[61295] = true		-- Riptide
		ct.aoespam[98021] = true		-- Spirit Link
		ct.aoespam[114911] = true	-- Ancestral Guidance
		ct.aoespam[118800] = true	-- Conductivity
		ct.aoespam[114942] = true	-- Healing Tide
		-- Damaging spells
		ct.aoespam[421] = true		-- Chain Lightning
		ct.aoespam[45297] = true		-- Chain Lightning (Mastery proc)
		ct.aoespam[8349] = true		-- Fire Nova
		ct.aoespam[77478] = true		-- Earhquake
		ct.aoespam[51490] = true		-- Thunderstorm
		ct.aoespam[8187] = true		-- Magma Totem
		ct.aoespam[8050] = true		-- Flame Shock
		ct.aoespam[25504] = true		-- Windfury
		ct.aoespam[3606] = true		-- Searing Bolt
	end
elseif E.myclass == "WARLOCK" then
	if E.db.combattext.merge_aoe_spam then
		ct.aoespam[27243] = true		-- Seed of Corruption
		ct.aoespam[27285] = true		-- Seed of Corruption (AoE)
		ct.aoespam[87385] = true		-- Seed of Corruption (Soulburn)
		ct.aoespam[172] = true		-- Corruption
		ct.aoespam[87389] = true		-- Corruption (Soulburn: Seed of Corruption)
		ct.aoespam[30108] = true		-- Unstable Affliction
		ct.aoespam[348] = true		-- Immolate
		ct.aoespam[980] = true		-- Agony
		ct.aoespam[80240] = true		-- Havoc
		ct.aoespam[42223] = true		-- Rain of Fire
		ct.aoespam[689] = true		-- Drain Life
		ct.aoespam[89420] = true		-- Drain Life (Soulburn)
		ct.aoespam[5857] = true		-- Hellfire
		ct.aoespam[129476] = true	-- Immolation Aura
		ct.aoespam[103103] = true	-- Malefic Grasp
		ct.aoespam[86040] = true		-- Hand of Gul'dan
		ct.aoespam[124915] = true	-- Chaos Wave
		ct.aoespam[47960] = true		-- Shadowflame
		ct.aoespam[50590] = true		-- Immolation Aura
		ct.aoespam[30213] = true		-- Legion Strike (Felguard)
		ct.aoespam[89753] = true		-- Felstorm (Felguard)
		ct.aoespam[20153] = true		-- Immolation (Infrenal)
		ct.aoespam[103988] = true	-- Melee
		ct.aoespam[108371] = true	-- Harvest Life
		ct.aoespam[115707] = true	-- Harvest Life (Soulburn)
	end
	if E.db.combattext.healing then
		ct.healfilter[63106] = true	-- Siphon Life
		ct.healfilter[89653] = true	-- Drain Life
		ct.healfilter[125314] = true	-- Harvest Life
		ct.healfilter[108366] = true	-- Soul Leech
		ct.healfilter[108359] = true	-- Dark Regeneration
	end
elseif E.myclass == "WARRIOR" then
	if E.db.combattext.merge_aoe_spam then
		ct.aoespam[845] = true		-- Cleave
		ct.aoespam[46968] = true		-- Shockwave
		ct.aoespam[6343] = true		-- Thunder Clap
		ct.aoespam[1680] = true		-- Whirlwind
		ct.aoespam[115767] = true	-- Deep Wounds
		ct.aoespam[50622] = true		-- Bladestorm
		ct.aoespam[52174] = true		-- Heroic Leap
		ct.aoespam[118000] = true	-- Dragon Roar
		ct.aoespam[76858] = true		-- Opportunity Strike
	end
	if E.db.combattext.healing then
		ct.healfilter[117313] = true	-- Bloodthirst Heal
		ct.healfilter[55694] = true	-- Enraged Regeneration
	end
end

-- Do not edit below unless you know what you are doing
local numf
if E.db.combattext.damage or E.db.combattext.healing then
	numf = 5
else
	numf = 4
end

-- Detect vechile
local function SetUnit()
	if UnitHasVehicleUI("player") then
		ct.unit = "vehicle"
	else
		ct.unit = "player"
	end
	CombatTextSetActiveUnit(ct.unit)
end

-- Limit lines
local function LimitLines()
	for i = 1, #ct.frames do
		f = ct.frames[i]
		f:SetMaxLines(f:GetHeight() / E.db.combattext.combat_text_font_size)
	end
end

-- Scrollable frames
local function SetScroll()
	for i = 1, #ct.frames do
		ct.frames[i]:EnableMouseWheel(true)
		ct.frames[i]:SetScript("OnMouseWheel", function(self, delta)
			if delta > 0 then
				self:ScrollUp()
			elseif delta < 0 then
				self:ScrollDown()
			end
		end)
	end
end

-- Partial resists styler
local part = "-%s [%s %s]"
local r, g, b

-- Function, handles everything
local function OnEvent(self, event, subevent, ...)
	if event == "COMBAT_TEXT_UPDATE" then
		local arg2, arg3 = ...
		if SHOW_COMBAT_TEXT == "0" then
			return
		else
			if subevent == "DAMAGE" then
				xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
			elseif subevent == "DAMAGE_CRIT" then
				xCT1:AddMessage("|cffFF0000"..E.db.combattext.crit_prefix.."|r".."-"..arg2.."|cffFF0000"..E.db.combattext.crit_postfix.."|r", 1, 0.1, 0.1)
			elseif subevent == "SPELL_DAMAGE" then
				xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
			elseif subevent == "SPELL_DAMAGE_CRIT" then
				xCT1:AddMessage("|cffFF0000"..E.db.combattext.crit_prefix.."|r".."-"..arg2.."|cffFF0000"..E.db.combattext.crit_postfix.."|r", 1, 0.3, 0.5)
			elseif subevent == "HEAL" then
				if arg3 >= E.db.combattext.heal_treshold then
					if arg2 then
						if COMBAT_TEXT_SHOW_FRIENDLY_NAMES == "1" then
							xCT2:AddMessage(arg2.." +"..arg3, 0.1, 0.75, 0.1)
						else
							xCT2:AddMessage("+"..arg3, 0.1, 0.75, 0.1)
						end
					end
				end
			elseif subevent == "HEAL_CRIT" then
				if arg3 >= E.db.combattext.heal_treshold then
					if arg2 then
						if COMBAT_TEXT_SHOW_FRIENDLY_NAMES == "1" then
							xCT2:AddMessage(arg2.." +"..arg3, 0.1, 1, 0.1)
						else
							xCT2:AddMessage("+"..arg3, 0.1, 1, 0.1)
						end
					end
				end
			elseif subevent == "PERIODIC_HEAL" then
				if arg3 >= E.db.combattext.heal_treshold then
					xCT2:AddMessage("+"..arg3, 0.1, 0.5, 0.1)
				end
			elseif subevent == "SPELL_CAST" and COMBAT_TEXT_SHOW_REACTIVES == "1" then
				xCT3:AddMessage(arg2, 1, 0.82, 0)
			elseif subevent == "MISS" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(MISS, 0.5, 0.5, 0.5)
			elseif subevent == "DODGE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DODGE, 0.5, 0.5, 0.5)
			elseif subevent == "PARRY" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(PARRY, 0.5, 0.5, 0.5)
			elseif subevent == "EVADE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(EVADE, 0.5, 0.5, 0.5)
			elseif subevent == "IMMUNE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(IMMUNE, 0.5, 0.5, 0.5)
			elseif subevent == "DEFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DEFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "REFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(REFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_MISS" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(MISS, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_DODGE"and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DODGE, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_PARRY" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(PARRY, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_EVADE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(EVADE, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_IMMUNE" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(IMMUNE, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_DEFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(DEFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_REFLECT" and COMBAT_TEXT_SHOW_DODGE_PARRY_MISS == "1" then
				xCT1:AddMessage(REFLECT, 0.5, 0.5, 0.5)
			elseif subevent == "RESIST" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, RESIST, arg3), 0.75, 0.5, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(RESIST, 0.5, 0.5, 0.5)
				end
			elseif subevent == "BLOCK" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, BLOCK, arg3), 0.75, 0.5, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(BLOCK, 0.5, 0.5, 0.5)
				end
			elseif subevent == "ABSORB" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, ABSORB, arg3), 0.75, 0.5, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.1, 0.1)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(ABSORB, 0.5, 0.5, 0.5)
				end
			elseif subevent == "SPELL_RESIST" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, RESIST, arg3), 0.5, 0.3, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(RESIST, 0.5, 0.5, 0.5)
				end
			elseif subevent == "SPELL_BLOCK" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, BLOCK, arg3), 0.5, 0.3, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(BLOCK, 0.5, 0.5, 0.5)
				end
			elseif subevent == "SPELL_ABSORB" then
				if arg3 then
					if COMBAT_TEXT_SHOW_RESISTANCES == "1" then
						xCT1:AddMessage(part:format(arg2, ABSORB, arg3), 0.5, 0.3, 0.5)
					else
						xCT1:AddMessage("-"..arg2, 0.75, 0.3, 0.85)
					end
				elseif COMBAT_TEXT_SHOW_RESISTANCES == "1" then
					xCT1:AddMessage(ABSORB, 0.5, 0.5, 0.5)
				end
			elseif subevent == "ENERGIZE" and COMBAT_TEXT_SHOW_ENERGIZE == "1" then
				if tonumber(arg2) > 0 then
					if arg3 and arg3 == "MANA" or arg3 == "RAGE" or arg3 == "FOCUS" or arg3 == "ENERGY" or arg3 == "RUNIC_POWER" or arg3 == "SOUL_SHARDS" or arg3 == "HOLY_POWER" or arg3 == "LIGHT_FORCE" then
						xCT3:AddMessage("+"..arg2.." ".._G[arg3], PowerBarColor[arg3].r, PowerBarColor[arg3].g, PowerBarColor[arg3].b)
					elseif arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..arg2.." "..BALANCE_POSITIVE_ENERGY, PowerBarColor[arg3].positive.r, PowerBarColor[arg3].positive.g, PowerBarColor[arg3].positive.b)
					end
				else
					if arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..abs(arg2).." "..BALANCE_NEGATIVE_ENERGY, PowerBarColor[arg3].negative.r, PowerBarColor[arg3].negative.g, PowerBarColor[arg3].negative.b)
					end
				end
			elseif subevent == "PERIODIC_ENERGIZE" and COMBAT_TEXT_SHOW_PERIODIC_ENERGIZE == "1" then
				if tonumber(arg2) > 0 then
					if arg3 and arg3 == "MANA" or arg3 == "RAGE" or arg3 == "FOCUS" or arg3 == "ENERGY" or arg3 == "RUNIC_POWER" or arg3 == "SOUL_SHARDS" or arg3 == "HOLY_POWER" or arg3 == "LIGHT_FORCE" then
						xCT3:AddMessage("+"..arg2.." ".._G[arg3], PowerBarColor[arg3].r, PowerBarColor[arg3].g, PowerBarColor[arg3].b)
					elseif arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..arg2.." "..BALANCE_POSITIVE_ENERGY, PowerBarColor[arg3].positive.r, PowerBarColor[arg3].positive.g, PowerBarColor[arg3].positive.b)
					end
				else
					if arg3 and arg3 == "ECLIPSE" then
						xCT3:AddMessage("+"..abs(arg2).." "..BALANCE_NEGATIVE_ENERGY, PowerBarColor[arg3].negative.r, PowerBarColor[arg3].negative.g, PowerBarColor[arg3].negative.b)
					end
				end
			elseif subevent == "SPELL_AURA_START" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("+"..arg2, 1, 0.5, 0.5)
			elseif subevent == "SPELL_AURA_END" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("-"..arg2, 0.5, 0.5, 0.5)
			elseif subevent == "SPELL_AURA_START_HARMFUL" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("+"..arg2, 1, 0.1, 0.1)
			elseif subevent == "SPELL_AURA_END_HARMFUL" and COMBAT_TEXT_SHOW_AURAS == "1" then
				xCT3:AddMessage("-"..arg2, 0.1, 1, 0.1)
			elseif subevent == "HONOR_GAINED" and COMBAT_TEXT_SHOW_HONOR_GAINED == "1" then
				arg2 = tonumber(arg2)
				if arg2 and abs(arg2) > 1 then
					arg2 = floor(arg2)
					if arg2 > 0 then
						xCT3:AddMessage(HONOR.." +"..arg2, 0.1, 0.1, 1)
					end
				end
			elseif subevent == "FACTION" and COMBAT_TEXT_SHOW_REPUTATION == "1" then
				xCT3:AddMessage(arg2.." +"..arg3, 0.1, 0.1, 1)
			elseif subevent == "SPELL_ACTIVE" and COMBAT_TEXT_SHOW_REACTIVES == "1" then
				xCT3:AddMessage(arg2, 1, 0.82, 0)
			end
		end
	elseif event == "UNIT_HEALTH" and COMBAT_TEXT_SHOW_LOW_HEALTH_MANA == "1" then
		if subevent == ct.unit then
			if not COMBAT_TEXT_LOW_HEALTH_THRESHOLD then COMBAT_TEXT_LOW_HEALTH_THRESHOLD = 0 end
			if UnitHealth(ct.unit) / UnitHealthMax(ct.unit) <= COMBAT_TEXT_LOW_HEALTH_THRESHOLD then
				if not lowHealth then
					xCT3:AddMessage(HEALTH_LOW, 1, 0.1, 0.1)
					lowHealth = true
				end
			else
				lowHealth = nil
			end
		end
	elseif event == "UNIT_MANA" and COMBAT_TEXT_SHOW_LOW_HEALTH_MANA == "1" then
		if subevent == ct.unit then
			local _, powerToken = UnitPowerType(ct.unit)
			if not COMBAT_TEXT_LOW_MANA_THRESHOLD then COMBAT_TEXT_LOW_MANA_THRESHOLD = 0.2 end
			if powerToken == "MANA" and (UnitPower(ct.unit) / UnitPowerMax(ct.unit)) <= COMBAT_TEXT_LOW_MANA_THRESHOLD then
				if not lowMana then
					xCT3:AddMessage(MANA_LOW, 1, 0.1, 0.1)
					lowMana = true
				end
			else
				lowMana = nil
			end
		end
	elseif event == "PLAYER_REGEN_ENABLED" and COMBAT_TEXT_SHOW_COMBAT_STATE == "1" then
	--		xCT3:AddMessage("-"..LEAVING_COMBAT, 0.1, 1, 0.1)
	elseif event == "PLAYER_REGEN_DISABLED" and COMBAT_TEXT_SHOW_COMBAT_STATE == "1" then
	--		xCT3:AddMessage("+"..ENTERING_COMBAT, 1, 0.1, 0.1)
	elseif event == "UNIT_COMBO_POINTS" and COMBAT_TEXT_SHOW_COMBO_POINTS == "1" then
		if subevent == ct.unit then
			local cp = GetComboPoints(ct.unit, "target")
			if cp > 0 then
				r, g, b = 1, 0.82, 0
				if cp == MAX_COMBO_POINTS then
					r, g, b = 0, 0.82, 1
				end
				xCT3:AddMessage(format(COMBAT_TEXT_COMBO_POINTS, cp), r, g, b)
			end
		end
	elseif event == "RUNE_POWER_UPDATE" then
		local arg1, arg2 = subevent, ...
		if arg2 then
			local rune = GetRuneType(arg1)
			if not rune then return; end
			local msg = COMBAT_TEXT_RUNE[rune]
			if rune == 1 then
				r, g, b = 0.75, 0, 0
			elseif rune == 2 then
				r, g, b = 0.75, 1, 0
			elseif rune == 3 then
				r, g, b = 0, 1, 1
			end
			if rune and rune < 4 then
				xCT3:AddMessage("+"..msg, r, g, b)
			end
		end
	elseif event == "UNIT_ENTERED_VEHICLE" or event == "UNIT_EXITING_VEHICLE" then
		if arg1 == "player" then
			SetUnit()
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		SetUnit()
		if E.db.combattext.scrollable then
			SetScroll()
		else
			LimitLines()
		end
		if E.db.combattext.damage or E.db.combattext.healing then
			ct.pguid = UnitGUID("player")
		end
	end
end

-- Change damage font
if E.db.combattext.damage_style then
	local LSM = LibStub("LibSharedMedia-3.0");
	DAMAGE_TEXT_FONT = LSM:Fetch("font", E.private.general.dmgfont) or E["media"].combatFont
end

-- Frames
ct.locked = true
ct.frames = {}

for i = 1, numf do
	local f = CreateFrame("ScrollingMessageFrame", "xCT"..i, UIParent)
	f:SetFont(DAMAGE_TEXT_FONT, E.db.combattext.combat_text_font_size, "OUTLINE")
	f:SetShadowColor(0, 0, 0, DAMAGE_TEXT_FONT_shadow and 1 or 0)
	f:SetShadowOffset(1, -1)
	f:SetTimeVisible(E.db.combattext.time_visible)
	f:SetMaxLines(E.db.combattext.max_lines)
	f:SetSpacing(1)
	f:SetWidth(128)
	f:SetHeight(112)
	f:SetPoint("CENTER", 0, 0)
	f:SetMovable(true)
	f:SetResizable(true)
	f:SetMinResize(128, 128)
	f:SetMaxResize(768, 768)
	f:SetClampedToScreen(true)
	f:SetClampRectInsets(0, 0, E.db.combattext.combat_text_font_size, 0)
	f:SetInsertMode(E.db.combattext.direction or "bottom")
	if i == 1 then
		f:SetJustifyH(ct.justify_1)
		f:SetPoint("CENTER", -192, -32)
	elseif i == 2 then
		f:SetJustifyH(ct.justify_2)
		f:SetPoint("CENTER", 192, -32)
	elseif i == 3 then
		f:SetJustifyH(ct.justify_3)
		f:SetWidth(256)
		f:SetPoint("CENTER", 0, 205)
	elseif i == 4 then
		f:SetJustifyH(ct.justify_4)
		f:SetWidth(200)
		f:SetPoint("CENTER", 330, 205)
		local a, _, c = f:GetFont()
		if E.db.combattext.combat_text_font_size == "auto" then
			if E.db.combattext.icons then
				f:SetFont(a, E.db.combattext.icon_size / 2, c)
				f:SetHeight(150)
			end
		elseif type(E.db.combattext.combat_text_font_size) == "number" then
			f:SetFont(a, E.db.combattext.combat_text_font_size, c)
		end
	elseif i == 5 then
		f:SetJustifyH(ct.justify_5)
		f:SetWidth(186)
		f:SetPoint("CENTER", 530, 205)
		local a, _, c = f:GetFont()
		if E.db.combattext.combat_text_font_size == "auto" then
			if E.db.combattext.icons then
				f:SetFont(a, E.db.combattext.icon_size / 2 * 1.5, c)
				f:SetHeight(150)
			end
		elseif type(E.db.combattext.combat_text_font_size) == "number" then
			f:SetFont(a, E.db.combattext.combat_text_font_size*1.5, c)
		end		
	end
	ct.frames[i] = f
end


-- Register events
local xCT = CreateFrame("Frame")
xCT:RegisterEvent("COMBAT_TEXT_UPDATE")
xCT:RegisterEvent("UNIT_HEALTH")
xCT:RegisterEvent("UNIT_MANA")
xCT:RegisterEvent("PLAYER_REGEN_DISABLED")
xCT:RegisterEvent("PLAYER_REGEN_ENABLED")
xCT:RegisterEvent("UNIT_COMBO_POINTS")
if E.db.combattext.dk_runes and E.myclass == "DEATHKNIGHT" then
	xCT:RegisterEvent("RUNE_POWER_UPDATE")
end
xCT:RegisterEvent("UNIT_ENTERED_VEHICLE")
xCT:RegisterEvent("UNIT_EXITING_VEHICLE")
xCT:RegisterEvent("PLAYER_ENTERING_WORLD")
xCT:SetScript("OnEvent", OnEvent)

local fram = CreateFrame("Frame")
fram:RegisterEvent("PLAYER_ENTERING_WORLD")
fram:SetScript("OnEvent", function(self)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	-- Turn off Blizzard CT
	if CombatText then
		CombatText:UnregisterAllEvents()
		CombatText:SetScript("OnLoad", nil)
		CombatText:SetScript("OnEvent", nil)
		CombatText:SetScript("OnUpdate", nil)
	end
end)

-- Steal external messages sent by other addons using CombatText_AddMessage
Blizzard_CombatText_AddMessage = CombatText_AddMessage
function CombatText_AddMessage(message, scrollFunction, r, g, b, displayType, isStaggered)
	xCT3:AddMessage(message, r, g, b)
end

-- Color printer
local pr = function(msg)
	print(tostring(msg))
end

-- Configmode and testmode
local StartConfigmode = function()
	if not InCombatLockdown()then
		for i = 1, #ct.frames do
			f = ct.frames[i]
			f:SetTemplate("Transparent")
			f:SetBackdropBorderColor(1, 0, 0, 1)

			f.fs = f:CreateFontString(nil, "OVERLAY")
			f.fs:SetFont(DAMAGE_TEXT_FONT, E.db.combattext.combat_text_font_size, "OUTLINEMONOCHROME")
			f.fs:SetPoint("BOTTOM", f, "TOP", 0, 0)
			if i == 1 then
				f.fs:SetText(DAMAGE)
				f.fs:SetTextColor(1, 0.1, 0.1, 0.9)
			elseif i == 2 then
				f.fs:SetText(SHOW_COMBAT_HEALING)
				f.fs:SetTextColor(0.1, 1, 0.1, 0.9)
			elseif i == 3 then
				f.fs:SetText(COMBAT_TEXT_LABEL)
				f.fs:SetTextColor(0.1, 0.1, 1, 0.9)
			elseif i == 4 then
				f.fs:SetText(SCORE_DAMAGE_DONE.." / "..SCORE_HEALING_DONE)
				f.fs:SetTextColor(1, 1, 0, 0.9)
			elseif i == 5 then
				f.fs:SetText(SCORE_DAMAGE_DONE.." / "..SCORE_HEALING_DONE..L_Crit)
				f.fs:SetTextColor(1, 1, 0, 0.9)
			end

			f.t = f:CreateTexture("ARTWORK")
			f.t:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -1)
			f.t:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -19)
			f.t:SetHeight(20)
			f.t:SetTexture(0.5, 0.5, 0.5)
			f.t:SetAlpha(0.3)

			f.d = f:CreateTexture("ARTWORK")
			f.d:SetHeight(16)
			f.d:SetWidth(16)
			f.d:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
			f.d:SetTexture(0.5, 0.5, 0.5)
			f.d:SetAlpha(0.3)

			f.tr = f:CreateTitleRegion()
			f.tr:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
			f.tr:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, 0)
			f.tr:SetHeight(20)

			f:EnableMouse(true)
			f:RegisterForDrag("LeftButton")
			f:SetScript("OnDragStart", f.StartSizing)
			if not E.db.combattext.scrollable then
				f:SetScript("OnSizeChanged", function(self)
					self:SetMaxLines(self:GetHeight() / E.db.combattext.combat_text_font_size)
					self:Clear()
				end)
			end

			f:SetScript("OnDragStop", f.StopMovingOrSizing)
			ct.locked = false
		end
		pr("|cffffff00"..L_COMBATTEXT_UNLOCKED.."|r")
	else
		pr("|cffffff00"..ERR_NOT_IN_COMBAT.."|r")
	end
end

local function EndConfigmode()
	for i = 1, #ct.frames do
		f = ct.frames[i]
		f:SetBackdrop(nil)
		f.iborder:Hide()
		f.oborder:Hide()
		f.fs:Hide()
		f.fs = nil
		f.t:Hide()
		f.t = nil
		f.d:Hide()
		f.d = nil
		f.tr = nil
		f:EnableMouse(false)
		f:SetScript("OnDragStart", nil)
		f:SetScript("OnDragStop", nil)
	end
	ct.locked = true
	pr("|cffffff00"..L_COMBATTEXT_UNSAVED.."|r")
end

local function StartTestMode()
	-- Init random number generator
	local random = math.random
	random(time()); random(); random(time())

	local TimeSinceLastUpdate = 0
	local UpdateInterval
	if E.db.combattext.damage_color then
		ct.dmindex = {}
		ct.dmindex[1] = 1
		ct.dmindex[2] = 2
		ct.dmindex[3] = 4
		ct.dmindex[4] = 8
		ct.dmindex[5] = 16
		ct.dmindex[6] = 32
		ct.dmindex[7] = 64
	end

	for i = 1, #ct.frames do
		ct.frames[i]:SetScript("OnUpdate", function(self, elapsed)
			UpdateInterval = random(65, 1000) / 250
			TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
			if TimeSinceLastUpdate > UpdateInterval then
				if i == 1 then
					ct.frames[i]:AddMessage("-"..random(100000), 1, random(255) / 255, random(255) / 255)
				elseif i == 2 then
					ct.frames[i]:AddMessage("+"..random(50000), 0.1, random(128, 255) / 255, 0.1)
				elseif i == 3 then
					ct.frames[i]:AddMessage(COMBAT_TEXT_LABEL, random(255) / 255, random(255) / 255, random(255) / 255)
				elseif i == 4 then
					local msg
					local icon
					local color = {}
					msg = random(40000)
					if E.db.combattext.icons then
						_, _, icon = GetSpellInfo(msg)
					end
					if icon then
						msg = msg.." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						if E.db.combattext.damage_color then
							color = ct.dmgcolor[ct.dmindex[random(#ct.dmindex)]]
						else
							color = {1, 1, 0}
						end
					elseif E.db.combattext.damage_color and not E.db.combattext.icons then
						color = ct.dmgcolor[ct.dmindex[random(#ct.dmindex)]]
					elseif not E.db.combattext.damage_color then
						color = {1, 1, random(0, 1)}
					end
					ct.frames[i]:AddMessage(msg, unpack(color))
				elseif i == 5 then
					local msg
					local icon
					local color = {}
					msg = random(80000)
					if E.db.combattext.icons then
						_, _, icon = GetSpellInfo(msg)
					end
					if icon then
						msg = msg.." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						if E.db.combattext.damage_color then
							color = ct.dmgcolor[ct.dmindex[random(#ct.dmindex)]]
						else
							color = {1, 1, 0}
						end
					elseif E.db.combattext.damage_color and not E.db.combattext.icons then
						color = ct.dmgcolor[ct.dmindex[random(#ct.dmindex)]]
					elseif not E.db.combattext.damage_color then
						color = {1, 1, random(0, 1)}
					end
					ct.frames[i]:AddMessage(msg, unpack(color))
				end
				TimeSinceLastUpdate = 0
			end
		end)
		ct.testmode = true
	end
end

local function EndTestMode()
	for i = 1, #ct.frames do
		ct.frames[i]:SetScript("OnUpdate", nil)
		ct.frames[i]:Clear()
	end
	if E.db.combattext.damage_color then
		ct.dmindex = nil
	end
	ct.testmode = false
end

-- Popup dialog
StaticPopupDialogs.XCT_LOCK = {
	text = L_COMBATTEXT_POPUP,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function() if not InCombatLockdown() then ReloadUI() else EndConfigmode() end end,
	OnCancel = EndConfigmode,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = true,
	showAlert = true,
	preferredIndex = 5,
}

-- Slash commands
SlashCmdList.XCT = function(input)
	input = lower(input)
	if input == "unlock" then
		if ct.locked then
			StartConfigmode()
		else
			pr("|cffffff00"..L_COMBATTEXT_ALREADY_UNLOCKED.."|r")
		end
	elseif input == "lock" then
		if ct.locked then
			pr("|cffffff00"..L_COMBATTEXT_ALREADY_LOCKED.."|r")
		else
			StaticPopup_Show("XCT_LOCK")
		end	
	elseif input == "test" then
		if ct.testmode then
			EndTestMode()
			pr("|cffffff00"..L_COMBATTEXT_TEST_DISABLED.."|r")
		else
			StartTestMode()
			pr("|cffffff00"..L_COMBATTEXT_TEST_ENABLED.."|r")
		end
	elseif input == "reset" then
		for i = 1, #ct.frames do
			local f = ct.frames[i]
			f:ClearAllPoints()
			if i == 1 then
				f:SetPoint("CENTER", -192, -32)
			elseif i == 2 then
				f:SetPoint("CENTER", 192, -32)
			elseif i == 3 then
				f:SetPoint("CENTER", 0, 205)
			elseif i == 4 then
				f:SetPoint("CENTER", 330, 205)
			elseif i == 5 then
				f:SetPoint("CENTER", 530, 205)		
			end
		end
	else
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_UNLOCK.."|r")
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_LOCK.."|r")
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_TEST.."|r")
		pr("|cffffff00"..L_COMBATTEXT_TEST_USE_RESET.."|r")
	end
end
SLASH_XCT1 = "/xct"
SLASH_XCT2 = "/чсе"

-- Shadow priest helper
if E.db.combattext.stop_ve_spam and E.myclass == "PRIEST" then
	local sp = CreateFrame("Frame")
	sp:SetScript("OnEvent", function(...)
		if GetShapeshiftForm() == 1 then
			if E.db.combattext.blizz_head_numbers then
				SetCVar("CombatHealing", 0)
			end
		else
			if E.db.combattext.blizz_head_numbers then
				SetCVar("CombatHealing", 1)
			end
		end
	end)
	sp:RegisterEvent("PLAYER_ENTERING_WORLD")
	sp:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	sp:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
end

-- Spam merger
local SQ
if E.db.combattext.merge_aoe_spam then
	if E.db.combattext.damage or E.db.combattext.healing then
		if not E.db.combattext.merge_aoe_spam_time or E.db.combattext.merge_aoe_spam_time < 1 then
			E.db.combattext.merge_aoe_spam_time = 1
		end
		local pairs = pairs
		SQ = {}
		for k, v in pairs(ct.aoespam) do
			SQ[k] = {queue = 0, msg = "", color = {}, count = 0, utime = 0, locked = false}
		end
		ct.SpamQueue = function(spellId, add)
			local amount
			local spam = SQ[spellId]["queue"]
			if spam and type(spam) == "number" then
				amount = spam + add
			else
				amount = add
			end
			return amount
		end
		local tslu = 0
		local xCTspam = CreateFrame("Frame")
		xCTspam:SetScript("OnUpdate", function(self, elapsed)
			local count
			tslu = tslu + elapsed
			if tslu > 0.5 then
				tslu = 0
				local utime = time()
				for k, v in pairs(SQ) do
					if not SQ[k]["locked"] and SQ[k]["queue"] > 0 and SQ[k]["utime"] + E.db.combattext.merge_aoe_spam_time <= utime then
						if SQ[k]["count"] > 1 then
							count = " |cffFFFFFF x "..SQ[k]["count"].."|r"
						else
							count = ""
						end
						if SQ[k]["critical"] then
							xCT5:AddMessage("|cffFF0000"..E.db.combattext.crit_prefix.."|r"..SQ[k]["queue"]..count..SQ[k]["msg"].."|cffFF0000"..E.db.combattext.crit_postfix.."|r", unpack(SQ[k]["color"]))
						else
							xCT4:AddMessage(SQ[k]["queue"]..count..SQ[k]["msg"], unpack(SQ[k]["color"]))
						end
						SQ[k]["queue"] = 0
						SQ[k]["count"] = 0
					end
				end
			end
		end)
	end
end

-- Damage
if E.db.combattext.damage then
	local unpack, select, time = unpack, select, time
	local gflags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE,
 		COMBATLOG_OBJECT_REACTION_FRIENDLY,
 		COMBATLOG_OBJECT_CONTROL_PLAYER,
 		COMBATLOG_OBJECT_TYPE_GUARDIAN
 	)
	local xCTd = CreateFrame("Frame")
	if E.db.combattext.damage_color then
		ct.dmgcolor = {}
		ct.dmgcolor[1] = {1, 1, 0}		-- Physical
		ct.dmgcolor[2] = {1, 0.9, 0.5}	-- Holy
		ct.dmgcolor[4] = {1, 0.5, 0}	-- Fire
		ct.dmgcolor[8] = {0.3, 1, 0.3}	-- Nature
		ct.dmgcolor[16] = {0.5, 1, 1}	-- Frost
		ct.dmgcolor[32] = {0.5, 0.5, 1}	-- Shadow
		ct.dmgcolor[64] = {1, 0.5, 1}	-- Arcane
	end
	if E.db.combattext.icons then
		ct.blank = E["media"].blankTex
	end
	local misstypes = {ABSORB = ABSORB, BLOCK = BLOCK, DODGE = DODGE, EVADE = EVADE, IMMUNE = IMMUNE, MISS = MISS, PARRY = PARRY, REFLECT = REFLECT, RESIST = RESIST, DEFLECT = DEFLECT}
	local dmg = function(self, event, ...)
		local msg, icon
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, srcFlags2, destGUID, destName, destFlags, destFlags2 = select(1, ...)
		if (sourceGUID == ct.pguid and destGUID ~= ct.pguid) or (sourceGUID == UnitGUID("pet") and E.db.combattext.pet_damage) or (sourceFlags == gflags) then
			if eventType == "SWING_DAMAGE" then
				local amount, _, _, _, _, _, critical = select(12, ...)
				if amount >= E.db.combattext.treshold then
					msg = amount
					if critical then
						msg = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..msg.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
					end
					if E.db.combattext.icons then
						if (sourceGUID == UnitGUID("pet")) or (sourceFlags == gflags) then
							icon = PET_ATTACK_TEXTURE
						else
							icon = GetSpellTexture(6603)
						end
						msg = msg.." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					end
					if critical then xCT5:AddMessage(msg) else xCT4:AddMessage(msg) end
				end
			elseif eventType == "RANGE_DAMAGE" then
				local spellId, _, _, amount, _, _, _, _, _, critical = select(12, ...)
				if amount >= E.db.combattext.treshold then
					msg = amount
					if critical then
						msg = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..msg.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
					end
					if E.db.combattext.icons then
						icon = GetSpellTexture(spellId)
						msg = msg.." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					end
					if critical then xCT5:AddMessage(msg) else xCT4:AddMessage(msg) end
				end
			elseif eventType == "SPELL_DAMAGE" or (eventType == "SPELL_PERIODIC_DAMAGE" and E.db.combattext.dot_damage) then
				local spellId, _, spellSchool, amount, _, _, _, _, _, critical = select(12, ...)
				if amount >= E.db.combattext.treshold then
					local color = {}
					local rawamount = amount
					if critical then
						amount = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..amount.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
					end
					if E.db.combattext.icons then
						icon = GetSpellTexture(spellId)
					end
					if E.db.combattext.damage_color then
						if ct.dmgcolor[spellSchool] then
							color = ct.dmgcolor[spellSchool]
						else
							color = ct.dmgcolor[1]
						end
					else
						color = {1, 1, 0}
					end
					if icon then
						msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					elseif E.db.combattext.icons then
						msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
					else
						msg = ""
					end
					if E.db.combattext.merge_aoe_spam and ct.aoespam[spellId] then
						SQ[spellId]["locked"] = true
						SQ[spellId]["queue"] = ct.SpamQueue(spellId, rawamount)
						SQ[spellId]["msg"] = msg
						SQ[spellId]["color"] = color
						SQ[spellId]["count"] = SQ[spellId]["count"] + 1
						if SQ[spellId]["count"] == 1 then
							SQ[spellId]["utime"] = time()
						end
						SQ[spellId]["locked"] = false
						SQ[spellId]["critical"] = critical
						return
					end
					if critical then xCT5:AddMessage(amount..""..msg, unpack(color)) else xCT4:AddMessage(amount..""..msg, unpack(color)) end
				end
			elseif eventType == "SWING_MISSED" then
				local missType, _ = select(12, ...)
				if E.db.combattext.icons then
					if sourceGUID == UnitGUID("pet") or sourceFlags == gflags then
						icon = PET_ATTACK_TEXTURE
					else
						icon = GetSpellTexture(6603)
					end
					missType = misstypes[missType].." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					missType = misstypes[missType]
				end
				xCT4:AddMessage(missType)
			elseif eventType == "SPELL_MISSED" or eventType == "RANGE_MISSED" then
				local spellId, _, _, missType, _ = select(12, ...)
				if E.db.combattext.icons then
					icon = GetSpellTexture(spellId)
					missType = misstypes[missType].." \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					missType = misstypes[missType]
				end 
				xCT4:AddMessage(missType)
			elseif eventType == "SPELL_DISPEL" and E.db.combattext.dispel then
				local target, _, _, id, effect, _, etype = select(12, ...)
				local color
				if E.db.combattext.icons then
					icon = GetSpellTexture(id)
				end
				if icon then
					msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				elseif E.db.combattext.icons then
					msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					msg = ""
				end
				if etype == "BUFF" then
					color = {0, 1, 0.5}
				else
					color = {1, 0, 0.5}
				end
				xCT3:AddMessage(ACTION_SPELL_DISPEL..": "..effect..msg, unpack(color))
			elseif eventType == "SPELL_STOLEN" and E.db.combattext.dispel then
				local target, _, _, id, effect = select(12, ...)
				local color = {1, 0.5, 0}
				if E.db.combattext.icons then
					icon = GetSpellTexture(id)
				end
				if icon then
					msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				elseif E.db.combattext.icons then
					msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					msg = ""
				end
				xCT3:AddMessage(ACTION_SPELL_STOLEN..": "..effect..msg, unpack(color))
			elseif eventType == "SPELL_INTERRUPT" and E.db.combattext.interrupt then
				local target, _, _, id, effect = select(12, ...)
				local color = {1, 0.5, 0}
				if E.db.combattext.icons then
					icon = GetSpellTexture(id)
				end
				if icon then
					msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				elseif E.db.combattext.icons then
					msg = " \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
				else
					msg = ""
				end
				xCT3:AddMessage(ACTION_SPELL_INTERRUPT..": "..effect..msg, unpack(color))
			elseif eventType == "PARTY_KILL" and E.db.combattext.killingblow then
				local tname = select(9, ...)
				xCT3:AddMessage(ACTION_PARTY_KILL..": "..tname, 0.2, 1, 0.2)
			end
		end
	end

	xCTd:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	xCTd:SetScript("OnEvent", dmg)
end

-- Healing
if E.db.combattext.healing then
	local unpack, select, time = unpack, select, time
	local xCTh = CreateFrame("Frame")
	if E.db.combattext.icons then
		ct.blank = E["media"].blankTex
	end
	local heal = function(self, event, ...)
		local msg, icon
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceFlags2, destGUID, destName, destFlags, destFlags2 = select(1, ...)
		if sourceGUID == ct.pguid or sourceFlags == gflags then
			if eventType == "SPELL_HEAL" or (eventType == "SPELL_PERIODIC_HEAL" and E.db.combattext.show_hots) then
				if E.db.combattext.healing then
					local spellId, spellName, spellSchool, amount, overhealing, absorbed, critical = select(12, ...)
					if ct.healfilter[spellId] then
						return
					end
					if amount >= E.db.combattext.heal_treshold then
						local color = {}
						local rawamount = amount
						if E.db.combattext.show_overhealing and abs(overhealing) > 0 then
							amount = floor(amount-overhealing).." ["..floor(overhealing).."]"
						end
						if critical then
							amount = "|cffFF0000"..E.db.combattext.crit_prefix.."|r"..amount.."|cffFF0000"..E.db.combattext.crit_postfix.."|r"
							color = {0.1, 1, 0.1}
						else
							color = {0.1, 0.65, 0.1}
						end 
						if E.db.combattext.icons then
							icon = GetSpellTexture(spellId)
						else
							msg = ""
						end
						if icon then
							msg = " \124T"..icon..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						elseif(E.db.combattext.icons)then
							msg=" \124T"..ct.blank..":"..E.db.combattext.icon_size..":"..E.db.combattext.icon_size..":0:0:64:64:5:59:5:59\124t"
						end
						if E.db.combattext.merge_aoe_spam and ct.aoespam[spellId] then
							SQ[spellId]["locked"] = true
							SQ[spellId]["queue"] = ct.SpamQueue(spellId, rawamount)
							SQ[spellId]["msg"] = msg
							SQ[spellId]["color"] = color
							SQ[spellId]["count"] = SQ[spellId]["count"] + 1
							if SQ[spellId]["count"] == 1 then
								SQ[spellId]["utime"] = time()
							end
							SQ[spellId]["locked"] = false
							SQ[spellId]["critical"] = critical
							return
						end 
						if critical then xCT5:AddMessage(amount..""..msg, unpack(color)) else xCT4:AddMessage(amount..""..msg, unpack(color)) end
					end
				end
			end
		end
	end

	xCTh:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	xCTh:SetScript("OnEvent", heal)
end