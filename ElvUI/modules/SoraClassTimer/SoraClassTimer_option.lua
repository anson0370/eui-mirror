-- Engines
local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local Module = E:GetModule("SoraClassTimer")

-- BuildGUI
local BlackListTable, WhiteListTable = {}, {}

function Module:UpdateBlackListTable()
	wipe(BlackListTable)
	BlackListTable["BlackListNew"] = {
		type = "input", order = 1,
		name = L["Add New Aura ID"], width = "full",
		get = function() return L["None"] end,
		set = function(_, value)
			local Name = GetSpellInfo(tonumber(value))
			E.db.SoraClassTimer["BlackList"][Name] = true
			self:UpdateBlackListTable()
		end,
	}
	BlackListTable["BlackListDel"] = {
		type = "input", order = 1,
		name = L["Delete Aura ID"], width = "full",
		get = function() return L["None"] end,
		set = function(_, value)
			local Name = GetSpellInfo(tonumber(value))
			E.db.SoraClassTimer["BlackList"][Name] = nil
			self:UpdateBlackListTable()
		end,
	}
	
	local Order = 2
	for key, value in pairs(E.db.SoraClassTimer["BlackList"]) do
		Order = Order + 1
		BlackListTable[key] = {
			type = "toggle", order = Order,
			name = key, desc = L["Enable/Disable"],
			get = function() return value end,
			set = function(_, val)
				E.db.SoraClassTimer["BlackList"][key] = val
				self:UpdateBlackListTable()
			end,
		}
	end
end

function Module:UpdateWhiteListTable()
	wipe(WhiteListTable)
	WhiteListTable["WhiteListNew"] = {
		type = "input", order = 1,
		name = L["Add New Aura ID"], width = "full",
		get = function() return L["None"] end,
		set = function(_, value)
			local Name = GetSpellInfo(tonumber(value))
			E.db.SoraClassTimer["WhiteList"][Name] = true
			self:UpdateWhiteListTable()
		end,
	}
	WhiteListTable["WhiteListDel"] = {
		type = "input", order = 1,
		name = L["Delete Aura ID"], width = "full",
		get = function() return L["None"] end,
		set = function(_, value)
			local Name = GetSpellInfo(tonumber(value))
			E.db.SoraClassTimer["WhiteList"][Name] = nil
			self:UpdateWhiteListTable()
		end,
	}	
	local Order = 2
	for key, value in pairs(E.db.SoraClassTimer["WhiteList"]) do
		Order = Order + 1
		WhiteListTable[key] = {
			type = "toggle", order = Order,
			name = key, desc = L["Enable/Disable"],
			get = function() return value end,
			set = function(_, val)
				E.db.SoraClassTimer["WhiteList"][key] = val
				self:UpdateWhiteListTable()
			end,
		}
	end
end

E.Options.args.SoraClassTimer =  {
	type = "group", order = 6,
	name = '00.'..E.ValColor..L["SoraClassTimer"].."|r",
	args = {
		intro = {
			type = "description", order = 0,
			name = L["Sora's ClassTimer desc"],
			width = "full",
		},
		enable = {
			type = "toggle", order = 1,
			name = L["Enable"],
			get = function() return E.private.SoraClassTimer.enable end,
			set = function(_, value)
				E.private.SoraClassTimer.enable = value;	
				E:StaticPopup_Show("CONFIG_RL") 
			end
		},
		default = {
			type = "execute", order = 2,
			name = L["Defaults"],
			disabled = function() return not E.private.SoraClassTimer.enable end,
			func = function() E.db.SoraClassTimer = P["SoraClassTimer"]; StaticPopup_Show("CONFIG_RL") end,
		},
		timelimit = {
			type = "range", order = 3,
			name = L['Duration Limit'],
			desc = L['The aura must be below this duration for the buff to show, set to 0 to disable. Note: This is in seconds.'],
			min = 0, max = 300, step = 1,
		},
		fontGroup = {
			order = 4,
			type = 'group',
			guiInline = true,
			name = L['Fonts'],
			get = function(info) return E.db.AuraWatch[ info[#info] ] end,
			set = function(info, value) E.db.AuraWatch[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL"); end,			
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 4,
					name = L["Font"],
					values = AceGUIWidgetLSMlists.font,
				},
				fontSize = {
					order = 5,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,
				},	
				fontOutline = {
					order = 6,
					name = L["Font Outline"],
					desc = L["Set the font outline."],
					type = "select",
					values = {
						['NONE'] = L['None'],
						['OUTLINE'] = 'OUTLINE',
					--	['MONOCHROME'] = 'MONOCHROME',
						['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
						['THICKOUTLINE'] = 'THICKOUTLINE',
					},
				},	
			},
		},		
		Gruop_1 = {
			type = "group", order = 10, 
			name = " ", guiInline = true, 
			disabled = function() return not E.private.SoraClassTimer.enable end,
			args = {
				PlayerMode = {
					type = "select", order = 1,
					name = L["Player Aura Timer"], desc = L["Choise Timer Mode"],
					values = {["Bar"] = L["Bar Mode"], ["Icon"] = L["Icon Mode"], ["None"] = L["None"]},
					get = function() return E.db.SoraClassTimer["PlayerMode"] end,
					set = function(_, value)
						E.db.SoraClassTimer["PlayerMode"] = value
						Module:ClearAura("player")
					end,
				},
				PlayerIconSize = {
					type = "range", order = 2,
					name = L["Player Aura Timer Icon Size"],
					min = 10, max = 100, step = 1,
					width = "double",
					get = function() return E.db.SoraClassTimer["PlayerIconSize"] end,
					set = function(_, value)
						E.db.SoraClassTimer["PlayerIconSize"] = value
						Module:ClearAura("player")
					end,
				},
				TargetMode = {
					type = "select", order = 3,
					name = L["Target Aura Timer"], desc = L["Choise Timer Mode"],
					values = {["Bar"] = L["Bar Mode"], ["Icon"] = L["Icon Mode"], ["None"] = L["None"]},
					get = function() return E.db.SoraClassTimer["TargetMode"] end,
					set = function(_, value)
						E.db.SoraClassTimer["TargetMode"] = value
						Module:ClearAura("target")
					end,
				}, 
				TargetIconSize = {
					type = "range", order = 4,
					name = L["Target Aura Timer Icon Size"],
					min = 10, max = 100, step = 1,
					width = "double",
					get = function() return E.db.SoraClassTimer["TargetIconSize"] end,
					set = function(_, value)
						E.db.SoraClassTimer["TargetIconSize"] = value
						Module:ClearAura("target")
					end,
				},
			},
		}, 
		Gruop_2 = {
			type = "group", order = 11, 
			name = L["Blacklist"], guiInline = true, 
			desc = L["Always will not be displayed"],
			disabled = function() return (E.db.SoraClassTimer["PlayerMode"] == "None" and E.db.SoraClassTimer["TargetMode"] == "None") end,
			args = BlackListTable,
		}, 
		Gruop_3 = {
			type = "group", order = 12, 
			name = L["Whitelist"], guiInline = true, 
			desc = L["Without a time limit of 60 seconds, and will always be displayed"],
			disabled = function() return (E.db.SoraClassTimer["PlayerMode"] == "None" and E.db.SoraClassTimer["TargetMode"] == "None") end,
			args = WhiteListTable,
		}, 
	},
}

