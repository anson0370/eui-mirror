local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

E.Options.args.unitframe.name = '04.'.. L["UnitFrames"]
E.Options.args.unitframe.args.general.args.transparent = {
	order = 2,
	type = 'toggle',
	name = L["Transparent Theme"],
	disabled = function() return E.db.general.transparent == false end,
	set = function(info, value) E.db.unitframe.transparent = value; StaticPopup_Show("GLOBAL_RL") end,
}						
E.Options.args.unitframe.args.general.args.unitframeType = {
	order = 2,
	name = E.ValColor..L["Eui UF Style"].."|r",
	type = 'range',
	min = 1, max = 9, step = 1,
	set = function(info, value)
		E.db.unitframe.unitframeType = value
		E:SetupUFStyle(value)
	end,
}
E.Options.args.unitframe.args.general.args.fontGroup.args.number = {
	type = "select",
	order = 10,
	name = L["value type"],
	desc = L["set value type"],
	values = {
		["0"] = L["0"],
		["K"] = L["K"],
		["W"] = L["W"],
	},
}

E.Options.args.unitframe.args.player.args.swing = {
	order = 11,
	name = L['Swing'],
	desc = L['Swing Bar'],
	set = function(info, value) E.db.unitframe.units.player.swing = value; StaticPopup_Show("CONFIG_RL") end,
	type = 'toggle',
}

E.Options.args.unitframe.args.player.args.tankshield = {
	order = 1200,
	type = 'group',
	name = L['BloodShield'],
	desc = L["BloodShield desc"],
	get = function(info) return E.db.unitframe.units['player']['tankshield'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['player']['tankshield'][ info[#info] ] = value; UF:CreateAndUpdateUF('player') end,
	args = {
		enable = {
			type = 'toggle',
			order = 1,
			name = L['Enable'],
		},
		position = {
			type = 'select',
			order = 8,
			name = L['Position'],
			values = {
				['LEFT'] = 'LEFT',
				['RIGHT'] = 'RIGHT',	
			},
		},		
	},
}

E.Options.args.unitframe.args.player.args.classbar.args.text = {
	order = 5,
	type = 'toggle',
	name = L['Text'],
}
E.Options.args.unitframe.args.player.args.aurabar.args.lock = {
	order = 1,
	type = 'toggle',
	name = L['Lock'],
	set = function(info, value) E.db.unitframe.units['player']['aurabar'][ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL"); end,
}
E.Options.args.unitframe.args.player.args.aurabar.args.auraBarWidth = {
	order = 18,
	name = L['Width'],
	type = 'range',
	min = 50, max = 500, step = 1,
	set = function(info,value) E.db.unitframe.units['player']['aurabar'].auraBarWidth = value; UF:CreateAndUpdateUF('player'); E:StaticPopup_Show("CONFIG_RL"); end	
}
E.Options.args.unitframe.args.player.args.aurabar.args.matchFrame = {
	order = 19,
	name = L['Match Frame Width'],
	type = 'execute',
	func = function() E.db.unitframe.units['player']['aurabar'].auraBarWidth = E.db.unitframe.units['player'].width; UF:CreateAndUpdateUF('player'); E:StaticPopup_Show("CONFIG_RL"); end,
}
E.Options.args.unitframe.args.player.args.aurabar.args.auraBarHeight = {
	order = 20,
	name = L['Height'],
	type = 'range',
	min = 10, max = 50, step = 1,
	set = function(info,value) E.db.unitframe.units['player']['aurabar'].auraBarHeight = value; UF:CreateAndUpdateUF('player'); E:StaticPopup_Show("CONFIG_RL"); end
}

E.Options.args.unitframe.args.target.args.aurabar.args.lock = {
	order = 1,
	type = 'toggle',
	name = L['Lock'],
	set = function(info, value) E.db.unitframe.units['target']['aurabar'][ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL"); end,
}
E.Options.args.unitframe.args.target.args.aurabar.args.auraBarWidth = {
	order = 18,
	name = L['Width'],
	type = 'range',
	min = 50, max = 500, step = 1,	
	set = function(info,value) E.db.unitframe.units['target']['aurabar'].auraBarWidth = value; UF:CreateAndUpdateUF('target'); E:StaticPopup_Show("CONFIG_RL"); end	
}
E.Options.args.unitframe.args.target.args.aurabar.args.matchFrame = {
	order = 19,
	name = L['Match Frame Width'],
	type = 'execute',
	func = function() E.db.unitframe.units['target']['aurabar'].auraBarWidth = E.db.unitframe.units['target'].width; UF:CreateAndUpdateUF('target'); E:StaticPopup_Show("CONFIG_RL"); end,
}
E.Options.args.unitframe.args.target.args.aurabar.args.auraBarHeight = {
	order = 20,
	name = L['Height'],
	type = 'range',
	min = 10, max = 50, step = 1,
	set = function(info,value) E.db.unitframe.units['target']['aurabar'].auraBarHeight = value; UF:CreateAndUpdateUF('target'); E:StaticPopup_Show("CONFIG_RL"); end	
}

E.Options.args.unitframe.args.focus.args.aurabar.args.lock = {
	order = 1,
	type = 'toggle',
	name = L['Lock'],
	set = function(info, value) E.db.unitframe.units['focus']['aurabar'][ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL"); end,
}
E.Options.args.unitframe.args.focus.args.aurabar.args.auraBarWidth = {
	order = 18,
	name = L['Width'],
	type = 'range',
	min = 50, max = 500, step = 1,		
	set = function(info,value) E.db.unitframe.units['focus']['aurabar'].auraBarWidth = value; UF:CreateAndUpdateUF('focus'); E:StaticPopup_Show("CONFIG_RL"); end	
}
E.Options.args.unitframe.args.focus.args.aurabar.args.matchFrame = {
	order = 19,
	name = L['Match Frame Width'],
	type = 'execute',
	func = function() E.db.unitframe.units['focus']['aurabar'].auraBarWidth = E.db.unitframe.units['focus'].width; UF:CreateAndUpdateUF('focus'); E:StaticPopup_Show("CONFIG_RL"); end,
}
E.Options.args.unitframe.args.focus.args.aurabar.args.auraBarHeight = {
	order = 20,
	name = L['Height'],
	type = 'range',
	min = 10, max = 50, step = 1,
	set = function(info,value) E.db.unitframe.units['focus']['aurabar'].auraBarHeight = value; UF:CreateAndUpdateUF('focus'); E:StaticPopup_Show("CONFIG_RL"); end	
}

E.Options.args.unitframe.args.target.args.tapped = {
	order = 350,
	type = 'group',
	name = L['Tapped'],
	get = function(info) return E.db.unitframe.units['target']['tapped'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['target']['tapped'][ info[#info] ] = value; UF:CreateAndUpdateUF('target') end,
	args = {
		position = {
			type = 'select',
			order = 2,
			name = L['Position'],
			values = {
				TOPLEFT = L['TOPLEFT'],
				LEFT = L['LEFT'],
				BOTTOMLEFT = L['BOTTOMLEFT'],
				RIGHT = L['RIGHT'],
				TOPRIGHT = L['TOPRIGHT'],
				BOTTOMRIGHT = L['BOTTOMRIGHT'],
				CENTER = L['CENTER'],
				TOP = L['TOP'],
				BOTTOM = L['BOTTOM'],
			},
		},	
		text_format = {
			order = 100,
			name = L['Text Format'],
			type = 'input',
			width = 'full',
			desc = L['TEXT_FORMAT_DESC'],
		},					
	},
}

E.Options.args.unitframe.args.target.args.range = {
	order = 350,
	type = 'group',
	name = L["Range"],
	get = function(info) return E.db.unitframe.units['target']['range'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['target']['range'][ info[#info] ] = value; UF:CreateAndUpdateUF('target') end,
	args = {
		enable = {
			order = 1,
			type = 'toggle',
			name = L['Enable'],
		},
		position = {
			type = 'select',
			order = 2,
			name = L['Position'],
			values = {
				TOPLEFT = L['TOPLEFT'],
				LEFT = L['LEFT'],
				BOTTOMLEFT = L['BOTTOMLEFT'],
				RIGHT = L['RIGHT'],
				TOPRIGHT = L['TOPRIGHT'],
				BOTTOMRIGHT = L['BOTTOMRIGHT'],
				CENTER = L['CENTER'],
				TOP = L['TOP'],
				BOTTOM = L['BOTTOM'],
			},
		},		
		offsetX = {
			order = 3,
			type = 'range',
			name = L['X Offset'],
			min = -500, max = 500, step = 1,
		},
		offsetY = {
			order = 4,
			type = 'range',
			name = L['Y Offset'],
			min = -500, max = 500, step = 1,
		},	
	},
}

E.Options.args.unitframe.args.target.args.castbar.args.InterruptSound = {
	order = 100,
	type = 'toggle',
	name = L['Interrupting the voice prompts'],
}

E.Options.args.unitframe.args.focus.args.castbar.args.InterruptSound = {
	order = 100,
	type = 'toggle',
	name = L['Interrupting the voice prompts'],
}

E.Options.args.unitframe.args.focus.args.range = {
	order = 350,
	type = 'group',
	name = L["Range"],
	get = function(info) return E.db.unitframe.units['focus']['range'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['focus']['range'][ info[#info] ] = value; UF:CreateAndUpdateUF('focus') end,
	args = {
		enable = {
			order = 1,
			type = 'toggle',
			name = L['Enable'],
		},
		position = {
			type = 'select',
			order = 2,
			name = L['Position'],
			values = {
				TOPLEFT = L['TOPLEFT'],
				LEFT = L['LEFT'],
				BOTTOMLEFT = L['BOTTOMLEFT'],
				RIGHT = L['RIGHT'],
				TOPRIGHT = L['TOPRIGHT'],
				BOTTOMRIGHT = L['BOTTOMRIGHT'],
				CENTER = L['CENTER'],
				TOP = L['TOP'],
				BOTTOM = L['BOTTOM'],
			},
		},		
		offsetX = {
			order = 3,
			type = 'range',
			name = L['X Offset'],
			min = -500, max = 500, step = 1,
		},
		offsetY = {
			order = 4,
			type = 'range',
			name = L['Y Offset'],
			min = -500, max = 500, step = 1,
		},	
	},
}

E.Options.args.unitframe.args['raid10'] = nil
E.Options.args.unitframe.args['raid40'] = nil

--Attention Frames
--[[ E.Options.args.unitframe.args.attention = {
	name = L['Attention Frames'],
	type = 'group',
	order = 1300,
	childGroups = "select",
	get = function(info) return E.db.unitframe.units['attention'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['attention'][ info[#info] ] = value; UF:CreateAndUpdateHeaderGroup('attention') end,
	args = {
		enable = {
			type = 'toggle',
			order = 1,
			name = L['Enable'],
		},
		resetSettings = {
			type = 'execute',
			order = 2,
			name = L['Restore Defaults'],
			func = function(info, value) UF:ResetUnitSettings('attention'); end,
		},		
		general = {
			order = 5,
			type = 'group',
			name = L['General'],
			guiInline = true,
			args = {
				width = {
					order = 2,
					name = L['Width'],
					type = 'range',
					min = 50, max = 500, step = 1,
				},			
				height = {
					order = 3,
					name = L['Height'],
					type = 'range',
					min = 10, max = 250, step = 1,
				},					
			},
		},	
	},
} ]]