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

E.Options.args.unitframe.args.player.args.combobar = {
	order = 900,
	type = 'group',
	name = L['Combobar'],
	get = function(info) return E.db.unitframe.units['player']['combobar'][ info[#info] ] end,
	set = function(info, value) E.db.unitframe.units['player']['combobar'][ info[#info] ] = value; UF:CreateAndUpdateUF('player') end,
	args = {
		enable = {
			type = 'toggle',
			order = 1,
			name = L['Enable'],
			set = function(info, value)
				E.db.unitframe.units['player']['combobar'].enable = value;
				if value then
					E.db.unitframe.units['target']['combobar'].enable = false;
					UF:CreateAndUpdateUF('target');
				end
				UF:CreateAndUpdateUF('player');
			end,
		},
		height = {
			type = 'range',
			order = 2,
			name = L['Height'],
			min = 5, max = 15, step = 1,
		},	
		fill = {
			type = 'select',
			order = 3,
			name = L['Fill'],
			values = {
				['fill'] = L['Filled'],
				['spaced'] = L['Spaced'],
			},
		},				
	},
}
E.Options.args.unitframe.args.target.args.combobar.args.enable = {
	type = 'toggle',
	order = 1,
	name = L['Enable'],
	set = function(info, value)
		E.db.unitframe.units['target']['combobar'].enable = value;
		if value then
			E.db.unitframe.units['player']['combobar'].enable = false;
			UF:CreateAndUpdateUF('player');
		end
		UF:CreateAndUpdateUF('target');
	end,
}

E.Options.args.unitframe.args['raid10'] = nil
E.Options.args.unitframe.args['raid40'] = nil

--Attention Frames
E.Options.args.unitframe.args.attention = {
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
}