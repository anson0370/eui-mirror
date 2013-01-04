local E, L, V, P, G = unpack(select(2, ...)); --Engine
--Extracd 1.0.6b
G['extracd']['data'] = {
-- talent
	-- type = "talent" 
	-- talent = the location of the talent(from 1 to 18)
	-- monk
	[121283] = {
		desc = "",
		type = "talent",
		class = "MONK",
		talent = 7,
		cd = 20,
	}, -- Power Strike
	[122281] = {
		desc = "",
		type = "talent",
		class = "MONK",
		talent = 13,
		cd = 15,
	}, -- Healing Elixirs
	-- shaman
	[31616] = {
		desc = "",
		type = "talent",
		class = "SHAMAN",
		talent = 1,
		cd = 30,
		duration = 10,
	}, -- Nature's Guardian
	
	-- mage
	[87023] = {
		desc = "",
		type = "talent",
		class = "MAGE",
		talent = 11,
		cd = 120,
		duration = 6,
	}, -- Cauterize
	
	-- rogue
	[45182] = {
		desc = "",
		type = "talent",
		class = "ROGUE",
		talent = 7,
		cd = 90,
		duration = 3,
	}, -- Cheated Death
	
	-- priest
	[114214] = {
		desc = "",
		type = "talent",
		class = "PRIEST",
		talent = 12,
		cd = 90,
	}, -- Angelic Bulwark
	
	-- dk
	[116888] = {
		desc = "",
		type = "talent",
		class = "DEATHKNIGHT",
		talent = 6,
		cd = 180,
		duration = 3,
	}, -- Purgatory	
	
-- spec
	-- type = "spec" 
	-- spec = {the numbers of the spec(from 1 to 3(4 for druid))}
	-- druid
	[34299] = {
		desc = "",
		type = "spec",
		class = "DRUID",
		spec = {2, 3},
		cd = 6,
	}, -- Leader of the Pack
	
	-- hunter
	[56453] = {
		desc = "",
		type = "spec",
		class = "HUNTER",
		spec = {3},
		cd = 10,
	}, -- Lock and Load
	
	-- priest
	[47755] = {
		desc = "",
		type = "spec",
		class = "PRIEST",
		spec = {1},
		cd = 12,
	}, -- Rapture
	
	--dk
	[96171] = {
		desc = "",
		type = "spec",
		class = "DEATHKNIGHT",
		spec = {1},
		cd = 45,
		duration = 8,
	}, -- Will of the Necropolis	
	
	--warlock
	[104317] = {
		desc = "",
		type = "spec",
		class = "WARLOCK",
		spec = {2},
		cd = 20,
	}, --
	[34936] = {
		desc = "",
		type = "spec",
		class = "WARLOCK",
		spec = {3},
		cd = 8,
	}, --
	

	
-- item
	-- type = "item" 
	-- item = {the item id}
	
	-- MOP 5.0
	-- 509 496 483 Raid
	[126646] = {
		desc = "",
		type = "item",
		item = {87160,86323,86881},
		cd = 105,
		duration = 20,
	}, -- Stuff of Nightmares
	[126640] = {
		desc = "",
		type = "item",
		item = {87163,86327,86885},
		cd = 105,
		duration = 20,
	},
	[126649] = {
		desc = "",
		type = "item",
		item = {87167,86332,86890},
		cd = 105,
		duration = 20,
	},
	[126657] = {
		desc = "",
		type = "item",
		item = {87172,86336,86894},
		cd = 105,
		duration = 20,
	}, -- H
	[126659] = {
		desc = "",
		type = "item",
		item = {87175,86388,86907},
		cd = 105,
		duration = 20,
	}, -- H
	
	-- 502 489 476 Raid
	[126554] = {
		desc = "",
		type = "item",
		item = {87057,86132,86791},
		cd = 45,
		duration = 20,
	}, -- H
	[126533] = {
		desc = "",
		type = "item",
		item = {87063,86131,86790},
		cd = 45,
		duration = 20,
	}, -- H
	[126577] = {
		desc = "",
		type = "item",
		item = {87065,86133,86792},
		cd = 45,
		duration = 20,
	}, -- H
	[126582] = {
		desc = "",
		type = "item",
		item = {87072,86144,86802},
		cd = 45,
		duration = 20,
	}, -- H
	[126588] = {
		desc = "",
		type = "item",
		item = {87075,86147,86805},
		cd = 45,
		duration = 20,
	}, -- H
	
	-- pvp 483 458
	[126707] = {
		desc = "",
		type = "item",
		item = {84935,84349},
		cd = 50,
		duration = 20,
	}, -- AGI
	[126705] = {
		desc = "",
		type = "item",
		item = {84941,84489},
		cd = 50,
		duration = 20,
	}, -- SP
	[126700] = {
		desc = "",
		type = "item",
		item = {84937,84495},
		cd = 50,
		duration = 20,
	}, -- STR
	
	-- Darkmoon Card 476
	[128985] = {
		desc = "",
		type = "item",
		item = {79331},
		cd = 50,
		duration = 15,
	}, -- Relic of Yu'lon
	[128986] = {
		desc = "",
		type = "item",
		item = {79327},
		cd = 45,
		duration = 15,
	}, -- Relic of Xuen STR
	[128984] = {
		desc = "",
		type = "item",
		item = {79328},
		cd = 55,
		duration = 15,
	}, -- Relic of Xuen AGI
	[128987] = {
		desc = "",
		type = "item",
		item = {79330},
		cd = 45,
		duration = 20,
	}, -- Relic of Chi Ji
	
	-- 470 
	[127923] = {
		desc = "",
		type = "item",
		item = {87572},
		cd = 45,
		duration = 10,
	}, -- Mithril Wristwatch
	[127928] = {
		desc = "",
		type = "item",
		item = {87574},
		cd = 45,
		duration = 10,
	}, -- Coren's Cold Chromium Coaster		
	[127915] = {
		desc = "",
		type = "item",
		item = {87573},
		cd = 45,
		duration = 10,
	}, -- Thousand-Year Pickled Egg
	
	-- 463 Heroic
	[126489] = {
		desc = "",
		type = "item",
		item = {81267},
		cd = 85,
		duration = 25,
	}, -- Searing Words
	[126483] = {
		desc = "",
		type = "item",
		item = {81125},
		cd = 65,
		duration = 20,
	}, -- Windswept Pages		
	[126236] = {
		desc = "",
		type = "item",
		item = {81243},
		cd = 50,
		duration = 15,
	}, -- Iron Protector Talisman
	[126266] = {
		desc = "",
		type = "item",
		item = {81133},
		cd = 30,
		duration = 10,
	}, -- Empty Fruit Barrel
	[126476] = {
		desc = "",
		type = "item",
		item = {81192},
		cd = 105,
		duration = 30,
	}, -- Vision of the Predator
	[126513] = {
		desc = "",
		type = "item",
		item = {81138},
		cd = 105,
		duration = 30,
	}, -- Carbonic Carbuncle		
	[126483] = {
		desc = "",
		type = "item",
		item = {81125},
		cd = 65,
		duration = 20,
	}, -- Windswept Pages
	[126489] = {
		desc = "",
		type = "item",
		item = {81267},
		cd = 85,
		duration = 25,
	}, -- Searing Words
	
	-- 450 and others
	[60234] = {
		desc = "",
		type = "item",
		item = {75274},
		cd = 55,
		duration = 15,
	}, -- Zen Alchemist Stone(Intellect)
	[60233] = {
		desc = "",
		type = "item",
		item = {75274},
		cd = 55,
		duration = 15,
	}, -- Zen Alchemist Stone(Agility)
	[60229] = {
		desc = "",
		type = "item",
		item = {75274},
		cd = 55,
		duration = 15,
	}, -- Zen Alchemist Stone(Strength)
	
-- item set
	-- type = "itemset"
	-- items = {all items of this set(including all difficulties)}
	-- piece = the minimum pieces of the item set to get the bonus
	
	
	[102545] = {
		type = "itemset",
		class = "DRUID",
		items = {84377,84378,84379,84380,84381,84901,84832,84852,84871,84916},
		piece = 4,
		cd = 30,
	}, -- Feral PVP 4P
	
	[105919] = {
		type = "itemset",
		class = "HUNTER",
		items = {77028,77029,77030,77031,77032,78793,78832,78756,78769,78804,78698,78737,78661,78674,78709},
		piece = 4,
		cd = 105,
		duration = 15
	}, -- Hunter T13 4P Bonus
	[105582] = {
		type = "itemset",
		class = "DEATHKNIGHT",
		items = {77008,77009,77010,77011,77012,78792,78846,78758,78773,78881,78697,78751,78663,78678,78716},
		piece = 2,
		cd = 45
	}, -- Tank DK T13 2P Bonus 
	[99063] = {
		type = "itemset",
		class = "MAGE",
		items = {71286,71287,71288,71289,71290,71507,71508,71509,71510,71511},
		piece = 2,
		cd = 45,
		duration = 15
	}, -- Mage T12 2P Bonus
	[99221] = {
		type = "itemset",
		class = "WARLOCK",
		items = {71281,71282,71283,71284,71295,71594,71595,71596,71597,71598},
		piece = 2,
		cd = 45,
		duration = 15
	}, -- Warlock T12 2P Bonus
	[99035] = {
		type = "itemset",
		class = "DRUID",
		items = {71107,71108,71109,71110,71111,71496,71497,71498,71499,71500},
		piece = 2,
		cd = 45,
		duration = 15
	}, -- Balance Druid T12 2P Bonus
	[99202] = {
		type = "itemset",
		class = "SHAMAN",
		items = {71552,71553,71554,71555,71556,71291,71292,71293,71294,71295},
		piece = 2,
		cd = 90
	}, -- Elemental Shaman T12 2P Bonus 

-- enchant
	-- type = "enchant",
	-- slot = 16 main hand(two hand have the same enchant may cause mistakes), 15 cloak  
	-- enchant = {enchant Id}
	-- Cataclysm
	[74241] = {
		type = "enchant",
		enchant = {4097},
		slot = 16,
		cd = 45,
		duration = 12
	}, -- Power Torrent
	[99621] = {
		type = "enchant",
		enchant = {4267},
		slot = 16,
		cd = 40,
		duration = 10
	}, -- Flintlocke's Woodchucker
	[74221] = {
		type = "enchant",
		enchant = {4083},
		slot = 16,
		cd = 45,
		duration = 12
	}, -- Hurricane
	[74224] = {
		type = "enchant",
		enchant = {4084},
		slot = 16,
		cd = 20,
		duration = 15
	}, -- Heartsong
	[59626] = {
		type = "enchant",
		enchant = {3790},
		slot = 16,
		cd = 35,
		duration = 10
	}, -- Black Magic
	
	-- MOP
	[125488] = {
		desc = "",
		type = "enchant",
		enchant = {4893, 4116, 3728},
		slot = 15,
		cd = 60,
		duration = 15
	},	-- Darkglow Embroidery
	[125489] = {
		desc = "",
		type = "enchant",
		enchant = {4894, 3730, 4118},
		slot = 15,
		cd = 60,
		duration = 15
	}, -- Swordguard Embroidery
	[125487] = {
		desc = "",
		type = "enchant",
		enchant = {4892, 3722, 4115},
		slot = 15,
		cd = 55,
		duration = 15
	}, -- Lightweave Embroidery
}

G['interruptSpell'] = {
	-- 德鲁伊
	["DRUID"] = {
		[106839] = true, -- 迎头痛击，野性、守护专精（熊, 猎豹）
		[78675] = true, -- 日光术，平衡专精
		[770] = false, -- 精灵之火（插雕文）
		[106707] = false, -- 精灵虫群（插雕文）
	},
	-- 猎人
	["HUNTER"] = {
		[50318] = true, -- 宁静之尘，宠物蛾子
		[50479] = true, -- 虚空震击，宠物虚空鳐
		[26090] = true, -- 拳击，宠物猩猩
		[34490] = true, -- 沉默射击，天赋
	},
	-- 法师
	["MAGE"] = {
		[2139] = true, -- 法术反制
	},	
	-- 术士
	["WARLOCK"] = {
		[103135] = true, -- 法术封锁，地狱猎犬
		[119911] = true, -- 眼棱爆炸，眼魔
	},
	-- 萨满
	["SHAMAN"] = {
		[57994] = true, -- 风剪（含雕文）
	},
	-- 圣骑士
	["PALADIN"] = {
		[96231] = true, -- 责难（含雕文）
		[31935] = true, -- 复仇者之盾，防护专精（含雕文）
	},
	-- 牧师
	["PRIEST"] = {
		[15487] = true, -- 沉默，暗影专精
	},
	-- 战士
	["WARRIOR"] = {
		[102060] = true, -- 瓦解怒吼，天赋
		[6552] = true, -- 拳击
	},
	-- 盗贼
	["ROGUE"] = {
		[26679] = false, -- 致命投掷，天赋，须5个连击点数，这个可以不加，无CD，真用它打断的DZ肯定会留星的。
		[1766] = true, -- 脚踢
	},
	-- 死亡骑士
	["DEATHKNIGHT"] = {
		[47528] = true, -- 心灵冰冻
		[47476] = true, -- 绞袭
		[108194] = true, -- 窒息，天赋，代替绞袭
	},
	-- 武僧
	["MONK"] = {
		[116705] = true, -- 切喉手
	},
}