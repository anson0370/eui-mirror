local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local TT = E:GetModule('Tooltip')


E.Options.args.tooltip = {
	type = "group",
	name = '08.'..L["Tooltip"],
	childGroups = "select",
	get = function(info) return E.db.tooltip[ info[#info] ] end,
	set = function(info, value) E.db.tooltip[ info[#info] ] = value; end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["TOOLTIP_DESC"],
		},
		enable = {
			order = 2,
			type = "toggle",
			name = L["Enable"],
			get = function(info) return E.private.tooltip[ info[#info] ] end,
			set = function(info, value) E.private.tooltip[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end
		},
		general = {
			order = 3,
			type = "group",
			name = L["General"],
			guiInline = true,
			disabled = function() return not E.Tooltip; end,
			args = {
				anchor = {
					order = 1,
					type = 'select',
					name = L['Anchor Mode'],
					desc = L['Set the type of anchor mode the tooltip should use.'],
					values = {
						['SMART'] = L['Smart'],
						['CURSOR'] = L['Cursor'],
						['ANCHOR'] = L['Anchor'],
					},
				},
				ufhide = {
					order = 2,
					type = 'select',
					name = L['UF Hide'],
					desc = L["Don't display the tooltip when mousing over a unitframe."],
					values = {
						['ALL'] = L['Always Hide'],
						['NONE'] = L['Never Hide'],
						['SHIFT'] = SHIFT_KEY,
						['ALT'] = ALT_KEY,
						['CTRL'] = CTRL_KEY					
					},
				},
				whostarget = {
					order = 3,
					type = 'toggle',
					name = L["Who's targetting who?"],
					desc = L["When in a raid group display if anyone in your raid is targetting the current tooltip unit."],
				},
				combathide = {
					order = 4,
					type = 'toggle',
					name = L["Combat Hide"],
					desc = L["Hide tooltip while in combat."],
				},
				offsetX = {
					order = 5,
					type = 'range',
					name = L['X Offset'],
					min = -500, max = 500, step = 1,
					disabled = function() return not (E.db.tooltip.anchor == 'CURSOR') end,
				},
				offsetY = {
					order = 6,
					type = 'range',
					name = L['Y Offset'],
					min = -500, max = 500, step = 1,
					disabled = function() return not (E.db.tooltip.anchor == 'CURSOR') end,
				},	
				transparent = {
					order = 7,
					type = 'toggle',
					name = L["Transparent Theme"],
					disabled = function() return E.db.general.transparent == false end,
				},
			},
		},
		module = {
			order = 4,
			type = "group",
			name = L["euiscript"],
			guiInline = true,
			disabled = function() return not E.Tooltip; end,
			set = function(info, value) E.db.tooltip[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
			args = {	
				ilevel = {
					order = 1,
					type = "toggle",
					name = L["ilevel"],
				},
				talent = {
					order = 2,
					type = "toggle",
					name = L["talent"],
				},			
				range = {
					order = 3,
					type = "toggle",
					name = L["Range"],
				},
				guildranks = {
					order = 5,
					type = 'toggle',
					name = L['Guild Ranks'],
					desc = L['Display guild ranks if a unit is guilded.'],
				},
				titles = {
					order = 6,
					type = 'toggle',
					name = L['Player Titles'],
					desc = L['Display player titles.'],
				},
				spellid = {
					order = 8,
					type = 'toggle',
					name = L['Spell/Item IDs'],
					desc = L['Display the spell or item ID when mousing over a spell or item tooltip.'],				
				},
				count = {
					order = 9,
					type = 'toggle',
					name = L['Item Count'],
					desc = L['Display how many of a certain item you have in your possession.'],				
				},	
				health = {
					order = 10,
					type = 'toggle',
					name = L['Health Text'],
					desc = L['Display the health text on the tooltip.'],
					set = function(info, value) E.db.tooltip[ info[#info] ] = value; if value then GameTooltipStatusBar.text:Show(); else GameTooltipStatusBar.text:Hide() end  end, --lazyness
				},
				healthHeight = {
					order = 11,
					type = 'range',
					name = L['Health Height'],
					desc = L['Set the height of the tooltip healthbar.'],
					min = 1, max = 15, step = 1,
					set = function(info, value) E.db.tooltip[ info[#info] ] = value; GameTooltipStatusBar:Height(value); end,
				},				
			},
		},
	},
}