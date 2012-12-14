local E, L, V, P, G = unpack(select(2, ...)); --Engine
--[[
	Spell Reminder Arguments
	
	General:
		enable - turn the reminder off and on.
		strictFilter - allow the use of spells that are not actually in your spellbook (Spell Procs)
		disableSound - Don't play the warning sound.
		
	Type of Check:
		spellGroup - List of spells in a group, if you have anyone of these spells the icon will hide.
		weaponCheck - Run a weapon enchant check instead of a spell check
		CDSpell - Run checks to see if a spell is on cooldown or not.
		
	Spells only Requirements:
		negateGroup - List of spells in a group, if you have anyone of these spells the icon will immediately hide and stop running the spell check (these should be other peoples spells)
		reverseCheck - only works if you provide a role or a tree, instead of hiding the frame when you have the buff, it shows the frame when you have the buff, doesn't work with weapons
		talentTreeException - if reverseCheck is set you can set a talent tree to follow the reverse check if not set then all trees follow the reverse check, doesn't work with weapons
	
	Cooldown only Requirements:
		OnCooldown - Set to "SHOW or "HIDE".
	
	Requirements: (These work for both spell and weapon checks)
		role - you must be a certain role for it to display (Tank, Melee, Caster)
		tree - you must be active in a specific talent tree for it to display (1, 2, 3) note: tree order can be viewed from left to right when you open your talent pane
		minLevel - the minimum level you must be (most of the time we don't need to use this because it will register the spell learned event if you don't know the spell, but in the case of weapon enchants this is useful)
		personal - aura must come from the player
		
	Additional Checks: (Note we always run a check when gaining/losing an aura)
		instance - check when entering a party/raid instance
		pvp - check when entering a bg/arena
		combat - check when entering combat

	For every group created a new frame is created, it's a lot easier this way.
]]

G['reminder']['filters'] = {
	PRIEST = {
		["Shields"] = { --inner fire/will group
			["spellGroup"] = {
				[588] = true, -- inner fire
				[73413] = true, -- inner will			
			},
			["instance"] = true,
			["pvp"] = true,
			['enable'] = true,
			['strictFilter'] = true,
		},

	},
	HUNTER = {
		["Aspects"] = { --aspects group
			["spellGroup"] = {
				[109260] = true, --Aspect of the Iron Hawk
				[13165] = true, -- hawk
				[5118] = true, -- cheetah
				[13159] = true, -- wild
			--	[82661] = true, -- fox	
			},
			["combat"] = true,
			["instance"] = true,
			["personal"] = true,
			['enable'] = true,
			['strictFilter'] = true,
		},	
	},
	MAGE = {
		["Armors"] = { --armors group
			["spellGroup"] = {
				[7302] = true, -- frost armor
				[6117] = true, -- mage armor
				[30482] = true, -- molten armor		
			},
			["instance"] = true,
			["pvp"] = true,
			['enable'] = true,
			['strictFilter'] = true,
		},		
	},
	PALADIN = {
		["Righteous Fury"] = {	-- Righteous Fury group
			["spellGroup"] = {
				[25780] = true,	-- Righteous Fury
			},
			["role"] = "Tank",
			["instance"] = true,
			["reversecheck"] = true,
			["negate_reversecheck"] = 1,	-- Holy paladins use RF sometimes
			["enable"] = true,
			["strictFilter"] = true,
		},
		["Blessing of Kings"] = {	-- Blessing of Kings group
			["spellGroup"] = {
				[20217] = true,	-- Blessing of Kings
			},
			["negateGroup"] = {
				[1126] = true,	-- Mark of the Wild
				[117666] = true,	-- Legacy of the Emperor
				[90363] = true,	-- Embrace of the Shale Spider
				[19740] = true,	-- Blessing of Might
			},
			["combat"] = true,
			["instance"] = true,
			["pvp"] = true,
			["enable"] = true,
			["strictFilter"] = true,
		},
		["Blessing of Might"] = {	-- Blessing of Might group
			["spellGroup"] = {
				[19740] = true,	-- Blessing of Might
			},
			["negateGroup"] = {
				[116956] = true,	-- Grace of Air
				[93435] = true,	-- Roar of Courage
				[127830] = true,	-- Spirit Beast Blessing
				[20217] = true,	-- Blessing of Kings
			},
			["combat"] = true,
			["instance"] = true,
			["pvp"] = true,
			["enable"] = true,
			["strictFilter"] = true,
		},
	},
	SHAMAN = {
		["Shields"] = { --shields group
			["spellGroup"] = {
				[52127] = true, -- water shield
				[324] = true, -- lightning shield	
				[974] = true,	-- Earth Shield
			},
			["instance"] = true,
			["pvp"] = true,
			['enable'] = true;
		},
		["Weapon Enchants"] = { --check weapons for enchants
			["weaponCheck"] = true,
			["instance"] = true,
			["pvp"] = true,
			["minLevel"] = 10,
			['enable'] = true,
			['disableSound'] = true,
		},		
	},
	WARRIOR = {
		["Commanding Shout"] = { -- commanding Shout group
			["spellGroup"] = {
				[469] = true, 
			},
			["negateGroup"] = {
				[6307] = true, -- Blood Pact
				[90364] = true, -- Qiraji Fortitude
				[72590] = true, -- Drums of fortitude
				[21562] = true, -- Fortitude	
				[6673] = true,	-- Battle Shout
			},
			["role"] = "Tank",
			["instance"] = true,
			["pvp"] = true,
			['enable'] = true,
			['strictFilter'] = true,		
		},
		["Battle Shout"] = { -- battle Shout group
			["spellGroup"] = {
				[6673] = true, 
			},
			["negateGroup"] = {
				[19506] = true, -- Trueshot Aura
				[57330] = true, -- horn of Winter
				[469] = true,	-- Commanding Shout
			},
			["instance"] = true,
			["pvp"] = true,	
			["role"] = "Melee",
			['enable'] = true,
			['strictFilter'] = true,
		},	
	},
	DEATHKNIGHT = {
		["Horn of Winter"] = { -- horn of Winter group
			["spellGroup"] = {
				[57330] = true, 
			},
			["negateGroup"] = {
				[19506] = true, -- Trueshot Aura
				[6673] = true, -- battle Shout		
			},
			["instance"] = true,
			["pvp"] = true,	
			['enable'] = true,
			['strictFilter'] = true,
		},
		["Blood Presence"] = { -- blood presence group
			["spellGroup"] = {
				[48263] = true, 
			},
			["role"] = "Tank",
			["instance"] = true,	
			["reverseCheck"] = true,
			["talentTreeException"] = 1, --Don't run reverse check for blood.
			['enable'] = true,
			['strictFilter'] = true,
		},	
	},
	ROGUE = { 
		["Posion Buff"] = { -- commanding Shout group
			["strictFilter"] = true,
			["combat"] = true,
			["enable"] = true,
			["pvp"] = true,
			["instance"] = true,
			["negateGroup"] = {
			},
			["spellGroup"] = {
				[8679] = true,
				[2823] = true,
				[3408] = true,
				[5761] = true,
				[108211] = true,	-- Leeching Poison
				[108215] = true,	-- Paralytic Poison				
			},
			["personal"] = true,
			["size"] = 50,
			["minLevel"] = 10,
		},	
	},
	WARLOCK = {
		["Dark Intent"] = {	-- Dark Intent group
			["spellGroup"] = {
				[109773] = true,	-- Dark Intent
			},
			["negateGroup"] = {
				[1459] = true,	-- Arcane Brilliance
				[61316] = true,	-- Dalaran Brilliance
				[77747] = true,	-- Burning Wrath
			},
			["combat"] = true,
			["instance"] = true,
			["pvp"] = true,
			["enable"] = true,
			["strictFilter"] = true,
		},	
	},	
	DRUID = {
		["mark of the Wild"] = {	-- Mark of the Wild group
			["spellGroup"] = {
				[1126] = true,	-- Mark of the Wild
			},
			["negateGroup"] = {
				[20217] = true,	-- Blessing of Kings
				[117666] = true,	-- Legacy of the Emperor
				[90363] = true,	-- Embrace of the Shale Spider
			},
			["combat"] = true,
			["instance"] = true,
			["pvp"] = true,
			["enable"] = true,
			["strictFilter"] = true,
		},	
	},
	MONK = {
		["Legacy of the Emperor"] = {	-- Legacy of the Emperor group
			["spellGroup"] = {
				[117666] = true,	-- Legacy of the Emperor
			},
			["negateGroup"] = {
				[1126] = true,	-- Mark of the Wild
				[20217] = true,	-- Blessing of Kings
				[90363] = true,	-- Embrace of the Shale Spider
			},
			["combat"] = true,
			["instance"] = true,
			["pvp"] = true,
			["enable"] = true,
			["strictFilter"] = true,
		},
		["Legacy of the White Tiger"] = {	-- Legacy of the White Tiger group
			["spellGroup"] = {
				[116781] = true,	-- Legacy of the White Tiger
			},
			["negateGroup"] = {
				[1459] = true,	-- Arcane Brilliance
				[61316] = true,	-- Dalaran Brilliance
				[24932] = true,	-- Leader of the Pack
				[90309] = true,	-- Terrifying Roar
				[24604] = true,	-- Furious Howl
			},
			["combat"] = true,
			["instance"] = true,
			["pvp"] = true,
			["enable"] = true,
			["strictFilter"] = true,
		},	
	},
}