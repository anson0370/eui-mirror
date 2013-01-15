local E, L, V, P, G, _ = unpack(ElvUI); --Engine
local class = select(2, UnitClass("player"));
local format = string.format

E.Options.args.euiscript = {
	type = "group",
	name = '14.'..L["euiscript"],
	desc = L["euiscript_desc"],
	childGroups = "tree",
	get = function(info) return E.db.euiscript[ info[#info] ] end,
	set = function(info, value) E.db.euiscript[ info[#info] ] = value end,
	args = {
		euiscript_general = {
			order = 1,
			type = "group",
			name = L["euiscript_general"],
			guiInline = true,
			get = function(info) return E.db.euiscript[ info[#info] ] end,
			set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
			args = {
				uiGroup = {
					order = 1,
					type = 'group',
					guiInline = true,
					name = L['About UI'],
					get = function(info) return E.db.euiscript[ info[#info] ] end,
					set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,	
					args = {
						chatbar = {
							order = 1,
							type = "toggle",
							name = L["chatbar"],
						},
						statreport = {
							order = 2,
							type = "toggle",
							name = L["statreport"],
						},
						chatmod = {
							order = 3,
							type = "toggle",
							name = L["chatmod"],
						},						
						drag = {
							order = 4,
							type = "toggle",
							name = L["drag"],
						},
						castby = {
							order = 5,
							type = "toggle",
							name = L["castby"],
						},
						tradetabs = {
							order = 6,
							type = "toggle",
							name = L["tradetabs"],
						},
						sr = {
							order = 7,
							type = "toggle",
							name = L["sr"],
						},
						idq = {
							order = 8,
							type = "toggle",
							name = L["idQuestAutomation"],
							desc = L["idQuestAutomation_desc"],
						},
						recipients = {
							order = 9,
							type = "toggle",
							name = L["recipients"],
						},
						hovertip = {
							order = 10,
							type = "toggle",
							name = L["hovertip"],
							desc = L["HOVERTIP_DESC"],
						},
						openall = {
							order = 11,
							type = "toggle",
							name = L["openall"],
						},
						errorenable = {
							order = 12,
							type = "toggle",
							name = L["errorenable"],
						},
						dcp = {
							order = 13,
							type = "toggle",
							name = L['DoomCooldownPulse'],
							desc = L['Usge: /dcp'],
						},
						oldtopinfobar = {
							order = 14,
							type = "toggle",
							name = L["Top Infobar"],
						},
						shift_marking = {
							order = 15,
							type = "toggle",
							name = L["alt marking"],
						},
						dispel = {
							order = 16,
							type = "toggle",
							name = L["mousedispel"],
							desc = L["MOUSEDISPEL_DESC"],
						},
						bossnotes = {
							order = 17,
							type = "toggle",
							name = L["bossnotes"],
						},	
						embedfocuser = {
							order = 18,
							type = "toggle",
							name = L["Shift+LeftButton set focus"],
						},						
						camerafactor = {
							order = 19,
							type = "range",
							min = 1, max = 7, step = 1,
							name = L["Camera Distance MAX Factory"],
							set = function(info, value) SetCVar("cameraDistanceMaxFactor", value); E.db.euiscript.camerafactor = value end,
							get = function() return tonumber(GetCVar("cameraDistanceMaxFactor")) end,
						},
						cameradistance = {
							order = 20,
							type = "range",
							min = 1, max = 50, step = 1,
							name = L["Camera Distance MAX"],
							set = function(info, value) SetCVar("cameraDistanceMax", value); E.db.euiscript.cameradistance = value end,
							get = function() return tonumber(GetCVar("cameraDistanceMax")) end,
						},
					},
				},
				notiGroup = {
					order = 2,
					type = 'group',
					guiInline = true,
					name = L['About Prompt info'],
					get = function(info) return E.db.euiscript[ info[#info] ] end,
					set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,						
					args = {
						combatnoti = {
							order = 1,
							type = "toggle",
							name = L["combatnoti"],
						},	
						combatnoti_leaving = {
							order = 2,
							type = "input",
							disabled = function(info) return not E.db.euiscript.combatnoti end,
							set = function(info, value) E.db.euiscript[ info[#info] ] = value; end,
							name = L["combatnoti_leaving"],
						},
						combatnoti_entering = {
							order = 3,
							type = "input",
							disabled = function(info) return not E.db.euiscript.combatnoti end,
							set = function(info, value) E.db.euiscript[ info[#info] ] = value; end,
							name = L["combatnoti_entering"],
						},						
						lfgnoti = {
							order = 4,
							name = L["lfg notification"],
							type = "select",
							values = {
								['NONE'] = NONE,
								['GUILD'] = GUILD,
								['PARTY'] = PARTY,
								['RAID'] = RAID,
							},
						},
						wgtimenoti = {
							order = 5,
							name = L["wgtimenoti"],
							type = "select",
							values = {
								['NONE'] = NONE,
								['GUILD'] = GUILD,
								['PARTY'] = PARTY,
								['RAID'] = RAID,
							},					
						},
					},
				},
				inviteGroup = {
					order = 3,
					type = 'group',
					name = L['About Invite'],
					get = function(info) return E.db.euiscript[ info[#info] ] end,
					set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,						
					args = {
						autoinvenable = {
							order = 1,
							type = "toggle",
							name = L["autoinvenable"],
						},
						ainvkeyword = {
							order = 2,
							type = "input",
							disabled = function(info) return not E.db.euiscript.autoinvenable end,
							set = function(info, value) E.db.euiscript.ainvkeyword = value; end,					
							name = L["ainvkeyword"],
						},
						spacer = {
							type = 'description',
							name = '',
							desc = '',
							order = 3,
						},
						inviteRank = {
							order = 4,
							type = 'select',
							name = L['Invite guild ranks member'],
							set = function(info,value) E.db.euiscript.inviteRank = value; end,
							get = function(info) return E.db.euiscript.inviteRank end,
							disabled = function() return not IsInGuild() end,
							values = E:GetModule('EuiScript'):GetGuildRanks(),
						},
						refresh = {
							order = 5,
							type = 'execute',
							name = REFRESH..RANK,
							func = function() E.Options.args.euiscript.args.euiscript_general.args.inviteGroup.args.inviteRank.values = E:GetModule('EuiScript'):GetGuildRanks(); end,
						},
						startInvite = {
							order = 6,
							type = 'execute',
							name = L['Start Invite'],
							disabled = function() return not IsInGuild() end,
							func = function() 
								SendChatMessage(format(L['Invite guild ranks is %s member, in 10 sec.'], GuildControlGetRankName(E.db.euiscript.inviteRank)), 'GUILD')
								E:ScheduleTimer(E:GetModule('EuiScript').InviteRanks, 10);
							end,
						},
						
					},
				},
				lootGroup = {
					order = 4,
					type = 'group',
					name = L['About Loot'],
					get = function(info) return E.db.euiscript[ info[#info] ] end,
					set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,					
					args = {
						autogreed = {
							order = 1,
							type = "toggle",
							name = L["autogreed"],
							disabled = (UnitLevel('player') ~= MAX_PLAYER_LEVEL),
						},
						autochangeloot = {
							order = 2,
							type = "toggle",
							name = L["Auto change loot"],
							desc = L["InGroup change loot to freecall, InRaid change loot to master"],
						},	
						autosell = {
							order = 3,
							type = "toggle",
							name = L["Auto Sell"],
							set = function(info, value) E.db.euiscript.autosell = value; end,
						},
						auto_confirm_de = {
							order = 4,
							type = "toggle",
							name = L["Auto Disenchant confirmation"],
						},		
						autobuy = {
							order = 5,
							type = "toggle",
							name = L["autobuy reagents"],
						},
					},
				},			
			},
		},
		euiscript_raidcd = {
			order = 2,
			type = "group",
			name = L["raidcd"],
			get = function(info) return E.db.euiscript[ info[#info] ] end,
			set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
			args = {
				raidcd = {
					order = 1,
					type = "toggle",
					name = L["raidcd"],
					desc = L["raidcd_desc"],
				},
				raidcd_width = {
					order = 2,
					type = "range",
					name = L["raidcd_width"],
					min = 10, max = 300, step = 1,
				},
				raidcd_height = {
					order = 3,
					type = "range",
					name = L["raidcd_height"],
					min = 1, max = 100, step = 1,
				},
				raidcd_maxbars = {
					order = 4,
					type = "range",
					name = L["raidcd_maxbars"],
					min = 1, max = 40, step = 1,
				},
				raidcd_direction = {
					order = 5,
					type = "select",
					name = L["raidcd_direction"],
					values = {
						["up"] = L["up"],
						["down"] = L["down"],
					},
				},
			},
		},
		euiscript_classcd = {
			order = 3,
			type = "group",
			name = L["classcd"],
			get = function(info) return E.db.euiscript[ info[#info] ] end,
			set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:GetModule('CLASSCD'):UpdateSetting(); end,
			args = {
				classcd = {
					order = 1,
					type = "toggle",
					name = L["classcd"],
					desc = L["classcd_desc"],
					set = function(info, value) E.db.euiscript.classcd = value; E:GetModule('CLASSCD'):ToggleClassCD(); end
				},
				classcd_width = {
					order = 2,
					type = "range",
					name = L["classcd_width"],
					min = 10, max = 200, step = 1,
				},
				classcd_height = {
					order = 3,
					type = "range",
					name = L["classcd_height"],
					min = 1, max = 100, step = 1,
				},
				classcd_maxbars = {
					order = 4,
					type = "range",
					name = L["classcd_maxbars"],
					min = 1, max = 40, step = 1,
				},
				classcd_direction = {
					order = 5,
					type = "select",
					name = L["classcd_direction"],
					values = function() 
						local values = {}
						if E.db.euiscript.classcd_style == 'bar' then
							values['up'] = L['up']
							values['down'] = L['down']
						else
							values['left'] = L['left']
							values['right'] = L['right']
						end
						return values
					end,
				},
				classcd_style = {
					order = 6,
					type = "select",
					name = L["classcd_style"],
					set = function(info, value)
						E.db.euiscript[ info[#info] ] = value
						if value == 'bar' then
							E.db.euiscript.classcd_direction = 'up'
						else
							E.db.euiscript.classcd_direction = 'right'
						end
						E:StaticPopup_Show("CONFIG_RL")
					end,
					values = {
						["bar"] = L["bar"],
						["icon"] = L["icon"],
					},
				},
			},
		},		
		euiscript_priestpet = {
			order = 5,
			type = "group",
			name = GetSpellInfo(34433),
			get = function(info) return E.db.euiscript[ info[#info] ] end,
			set = function(info, value) E.db.euiscript[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
			args = {
				priestpet = {
					order = 1,
					type = "toggle",
					name = GetSpellInfo(34433),
				},
				priestpet_width = {
					order = 2,
					type = "range",
					name = L["wildmushroom_width"],
					min = 10, max = 200, step = 1,
				},
				priestpet_height = {
					order = 3,
					type = "range",
					name = L["wildmushroom_height"],
					min = 1, max = 100, step = 1,
				},
			},
		},
		autobutton = {
			order = 6,
			type = 'group',
			name = L["Auto QuestItem Button"],
			get = function(info) return E.db.euiscript.autobutton[ info[#info] ] end,
			set = function(info, value) E.db.euiscript.autobutton[ info[#info] ] = value; E:GetModule('AutoButton'):UpdateAutoButton() end,
			args = {
				enable = {
					order = 1,
					type = 'toggle',
					name = L['Enable'],
				},
				size = {
					order = 2,
					type = 'range',
					name = L['Size'],
					min = 10, max = 100, step = 1,
				},
				questNum = {
					order = 3,
					type = 'range',
					name = L['Quset Button Number'],
					min = 0, max = 12, step = 1,
				},
				slotNum = {
					order = 4,
					type = 'range',
					name = L['Slot Button Number'],
					min = 0, max = 12, step = 1,
				},
			},
		},
		wsbutton = {
			order = 7,
			type = 'group',
			name = GetSpellInfo(119611),
			get = function(info) return E.db.euiscript.wsbutton[ info[#info] ] end,
			set = function(info, value) E.db.euiscript.wsbutton[ info[#info] ] = value; E:GetModule('WS'):Toggle() end,
			args = {
				enable = {
					order = 1,
					type = 'toggle',
					name = L['Enable'],
				},
				size = {
					order = 2,
					type = 'range',
					name = L['Size'],
					min = 10, max = 100, step = 1,
				},
				fontsize = {
					order = 3,
					type = 'range',
					name = L["Font Size"],
					type = "range",
					min = 6, max = 50, step = 1,
				},
			},
		},
	},
}

if class ~= 'MONK' then E.Options.args.euiscript.args.wsbutton = nil; end
if class ~= 'PRIEST' then E.Options.args.euiscript.args.euiscript_priestpet = nil; end

local positionValues = {
	TOPLEFT = L['TOPLEFT'],
	LEFT = L['LEFT'],
	BOTTOMLEFT = L['BOTTOMLEFT'],
	RIGHT = L['RIGHT'],
	TOPRIGHT = L['TOPRIGHT'],
	BOTTOMRIGHT = L['BOTTOMRIGHT'],
	CENTER = L['CENTER'],
	TOP = L['TOP'],
	BOTTOM = L['BOTTOM'],
};

local selectedspell = 0

local function UpdateSAOGroup()
	if selectedspell == 0 or not E.db.sao['spells'][E.myclass][selectedspell] then
		E.Options.args.sao.args.spell.args.spellGroup = nil
		return
	end
	
	E.Options.args.sao.args.spell.args.spellGroup = {
		type = "group",
		name = GetSpellInfo(selectedspell),
		order = 15,
		guiInline = true,
		args = {
			enable = {
				order = 1,
				name = L["Enable"],
				type = "toggle",
				get = function() return E.db.sao['spells'][E.myclass][selectedspell].enable end,
				set = function(info, value) E.db.sao['spells'][E.myclass][selectedspell].enable = value; UpdateSAOGroup(); end
			},
			texture = {
				order = 2,
				name = L["Textures"], dialogControl = 'LSM30_Background',
				type = "select",
				get = function() return E.db.sao['spells'][E.myclass][selectedspell].texture end,
				set = function(info, value) E.db.sao['spells'][E.myclass][selectedspell].texture = value; UpdateSAOGroup(); end,
				disabled = function() return E.db.sao.useBuffIcon end,
				values = LibStub("LibSharedMedia-3.0"):HashTable("sao"),
			},
			position = {
				order = 3,
				name = L['Position'],
				type = "select",
				get = function() return E.db.sao['spells'][E.myclass][selectedspell].position end,
				set = function(info, value) E.db.sao['spells'][E.myclass][selectedspell].position = value; UpdateSAOGroup(); end,
				values = positionValues,
			},
			offsetX = {
				order = 4,
				type = 'range',
				name = L['X Offset'],
				min = -800, max = 800, step = 1,
				get = function() return E.db.sao['spells'][E.myclass][selectedspell].offsetX end,
				set = function(info, value) E.db.sao['spells'][E.myclass][selectedspell].offsetX = value; UpdateSAOGroup(); end,
			},
			offsetY = {
				order = 5,
				type = 'range',
				name = L['Y Offset'],
				min = -600, max = 600, step = 1,
				get = function() return E.db.sao['spells'][E.myclass][selectedspell].offsetY end,
				set = function(info, value) E.db.sao['spells'][E.myclass][selectedspell].offsetY = value; UpdateSAOGroup(); end,
			},			
		},				
	}	
end

E.Options.args.sao = {
	type = 'group',
	name = '00.'..E.ValColor..L['Display spell trigger graphics prompt'].."|r",
	childGroups = 'tree',
	get = function(info) return E.db.sao[ info[#info] ] end,
	set = function(info, value) E.db.sao[ info[#info] ] = value end,
	args = {
		enable = {
			order = 1,
			type = 'toggle',
			name = L['Enable'],
			set = function(info, value) 
				E.db.sao.enable = value; 
				if value then SetCVar('displaySpellActivationOverlays', 1) end
				E:StaticPopup_Show("CONFIG_RL") 
			end,
		},
		general = {
			order = 2,
			type = 'group',
			name = L["General"],
			guiInline = true,
			disabled = function() return not E.db.sao.enable end,
			args = {
				onlyTime = {
					order = 3,
					type = 'select',
					name = L['Text Format'],
					values = {
						['no'] = NONE,
						['time'] = L['Remaining Time'],
						['name'] = L["Show spell name:"].. L['Remaining Time'],
					},
				},
				offsetX = {
					order = 4,
					type = 'range',
					name = L['X Offset'],
					min = -800, max = 800, step = 1,
				},
				offsetY = {
					order = 5,
					type = 'range',
					name = L['Y Offset'],
					min = -600, max = 600, step = 1,
				},					
				fontSize = {
					order = 6,
					type = 'range',
					name = L["Font Size"],
					min = 5, max = 50, step = 1,
				},
			},
		},
 		useIcon = {
			order = 6,
			type = 'group',
			name = L['useIcon style'],
			guiInline = true,
			disabled = function() return not E.db.sao.enable end,
			args = {
				useIcon = {
					order = 1,
					type = 'toggle',
					name = L['useIcon style'],
					set = function(info, value) if value then E.db.sao.useIcon = value; E.db.sao.useBuffIcon = value; end end,
				},
				useBuffIcon = {
					order = 7,
					type = 'toggle',
					name = L['use Buff Icon'],
					disabled = function() return not E.db.sao.useIcon end,
				},
				iconSize = {
					order = 8,
					type = 'range',
					name = L["Icon Size"],
					min = 10, max = 100, step = 1,
					disabled = function() return not E.db.sao.useIcon end,
				},
				iconGap = {
					order = 9,
					type = 'range',
					name = L['X Spacing'],
					min = 1, max = 20, step = 1,
					disabled = function() return not E.db.sao.useIcon end,
				}, 			
			},
		},
		spell = {
			order = 100,
			type = 'group',
			name = L['Spells'],
			guiInline = true,
			disabled = function() return not E.db.sao.enable end,
			args = {
				addSpell = {
					order = 1,
					name = L['Add Spell']..'ID',
					desc = L['Add a spell to the filter.'],
					type = 'input',
					get = function(info) return "" end,
					set = function(info, value) 
						if not tonumber(value) or not GetSpellInfo(tonumber(value)) then return; end
						if not E.db.sao['spells'][E.myclass][tonumber(value)] then
							E.db.sao['spells'][E.myclass][tonumber(value)] = { 
								['texture'] = 'FURY_OF_STORMRAGE',
								['position'] = 'TOP',
								['showing'] = false,
								['active'] = false,
								['enable'] = true,
							}
						end
						UpdateSAOGroup();
					end,					
				},
				removeSpell = {
					order = 2,
					name = L['Remove Spell']..'ID',
					desc = L['Remove a spell from the filter.'],
					type = 'input',
					get = function(info) return "" end,
					set = function(info, value) 
						if P['sao']['spells'][E.myclass] then
							if P['sao']['spells'][E.myclass][tonumber(value)] then
								E.db.sao['spells'][E.myclass][tonumber(value)].enable = false;
								E:Print(L['You may not remove a spell from a default filter that is not customly added. Setting spell to false instead.'])
							else
								E.db.sao['spells'][E.myclass][tonumber(value)] = nil;
							end
						else
							E.db.sao['spells'][E.myclass][tonumber(value)] = nil;
						end
						
						UpdateSAOGroup();
					end,				
				},		
				selectSpell = {
					name = L["Select Spell"],
					type = 'select',
					order = 0,
					get = function(info) return selectedspell end,
					set = function(info, value) selectedspell = value; UpdateSAOGroup() end,							
					values = function()
						local spells = {}
						spells[0] = NONE
						for k in pairs(E.db.sao['spells'][E.myclass]) do
							if type(k) == 'number' and GetSpellInfo(k) then
								spells[k] = GetSpellInfo(k)..'( '..k..' )'
							end
						end

						return spells
					end,
				},				
			},
		},
	},
}


E.Options.args.chatfilter = {
	type = "group",
	name = '13.'..L["chatfilter"],
	get = function(info) return E.db.chatfilter[ info[#info] ] end,
	set = function(info, value) E.db.chatfilter[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,
	args = {
		Enabled = {
			order = 0,
			type = "toggle",
			name = L["Enabled"],
			get = function(info) return E.global.chatfilter.Enabled end,
			set = function(info, value) E.global.chatfilter.Enabled = value; E:StaticPopup_Show("CONFIG_RL") end,
		},
		chatfilterbylevel = {
			order = 1,
			type = "range",
			min = 0, max = MAX_PLAYER_LEVEL - 1, step = 1,
			name = L["Filter low-level players chat"],
		},
		chatfilter_general = {
			order = 2,
			type = "group",
			name = L["General"],
			guiInline = true,
			disabled = function() return not E.global.chatfilter.Enabled end,
			args = {
				ScanOurself = {
					order = 1,
					type = "toggle",
					name = L["Scan ourself"],
				},
				ScanFriend = {
					order = 2,
					type = "toggle",
					name = L["Scan friends"],
				},
				ScanTeam = {
					order = 3,
					type = "toggle",
					name = L["Scan raid/party members"],
				},
				ScanGuild = {
					order = 4,
					type = "toggle",
					name = L["Scan guildies"],
				},
				noprofanityFilter = {
					order = 5,
					type = "toggle",
					name = L["Disable the profanityFilter"],
				},
				nojoinleaveChannel = {
					order = 5,
					type = "toggle",
					name = L["Disable the alert joinleaveChannel"],
				},
				MergeTalentSpec = {
					order = 6,
					type = "toggle",
					name = L["Merge the messages:'You have learned/unlearned...'"],
				},
				FilterPetTalentSpec = {
					order = 7,
					type = "toggle",
					name = L["Filter the messages:'Your pet has learned/unlearned...'"],
				},
				MergeAchievement = {
					order = 8,
					type = "toggle",
					name = L["Merge the messages:'...has earned the achievement...'"],
				},
				MergeManufacturing = {
					order = 9,
					type = "toggle",
					name = L["Merge the messages:'You has created...'"],
				},
				FilterAuctionMSG = {
					order = 10,
					type = "toggle",
					name = L["Filter the messages:'Auction created/cancelled'"],
				},
				FilterDuelMSG = {
					order = 11,
					type = "toggle",
					name = L["Filter the messages:'... has defeated/fled from ... in a duel'"],
				},
				FilterRaidAlert = {
					order = 11,
					type = 'toggle',
					name = L["Filter the bullshit messages from RaidAlert"],
				},
				FilterDrunkMSG = {
					order = 11,
					type = 'toggle',
					name = L["Filter the drunk messages:'... has drunked ...'"],
				},
				FilterQuestReport = {
					order = 11,
					type = 'toggle',
					name = L["Filter the bullshit messages from QuestReport"],
				},
				FilterAdvertising = {
					order = 12,
					type = "toggle",
					name = L["Filter the advertising messages"],
				},
				AllowMatchs = {
					order = 13,
					type = "range",
					min = 1, max = 10, step = 1,
					name = L["How many words can be allowd to use"],
				},
				FilterMultiLine = {
					order = 14,
					type = "toggle",
					name = L["Filter the multiple messages"],
				},
				AllowLines = {
					order = 15,
					type = "range",
					min = 1, max = 10, step = 1,
					name = L["How many lines can be allowd"],
				},
				FilterRepeat = {
					order = 16,
					type = "toggle",
					name = L["Filter the repeat messages"],
				},
				RepeatAlike = {
					order = 17,
					type = "range",
					min = 1, max = 100, step = 1,
					name = L["Set the similarity between the messages"],
				},
				RepeatInterval = {
					order = 18,
					type = "range",
					min = 1, max = 300, step = 5,
					name = L["Set the interval between the messages"],
				},
				ShieldAdvPlayer = {
					order = 19,
					type = "toggle",
					name = L["Shield the player who`s advertising"],
				},
				ShieldTimes = {
					order = 20,
					type = "range",
					min = 1, max = 60, step = 1,
					name = L["How many times shall we shield."],
				},
			},
		},
		BlackList = {
			order = 3,
			type = "group",
			name = L["Word BlackList"],
			disabled = function() return not E.global.chatfilter.Enabled end,
			args = {
				intro = {
					order = 0,
					type = "description",
					name = L["Word BlackList intro"],
				},
				NewWord = {
					order = 1,
					type = "input",
					name = L["New Word"],
					get = function(info) return "" end,
					set = function(info, value)
						E.global.chatfilter.BlackList[value] = true
						E.Options.args.chatfilter.args.BlackList.args.List.values[value] = value
					end,
				},
				DeleteWord = {
					order = 2,
					type = "input",
					name = L["Delete Word"],
					get = function(info) return "" end,
					set = function(info, value)
						if E.global.chatfilter.BlackList[value] ~= nil then
							E.global.chatfilter.BlackList[value] = nil
							E.Options.args.chatfilter.args.BlackList.args.List.values[value] = nil
						end
					end,
				},
				List = {
					order = 3,
					type = "multiselect",
					name = L["BlackList"],
					get = function(info, k) return E.global.chatfilter.BlackList[k] end,
					set = function(info, k, v)
						E.global.chatfilter.BlackList[k] = v
					end,
					values = {
					},
				},
			},
		},
		WhiteList = {
			order = 4,
			type = "group",
			name = L["Word WhiteList"],
			disabled = function() return not E.global.chatfilter.Enabled end,
			args = {
				intro = {
					order = 0,
					type = "description",
					name = L["Word WhiteList intro"],
				},
				NewWord = {
					order = 1,
					type = "input",
					name = L["New Word"],
					get = function(info) return "" end,
					set = function(info, value)
						E.global.chatfilter.WhiteList[value] = true
						E.Options.args.chatfilter.args.WhiteList.args.List.values[value] = value
					end,
				},
				DeleteWord = {
					order = 2,
					type = "input",
					name = L["Delete Word"],
					get = function(info) return "" end,
					set = function(info, value)
						if E.global.chatfilter.WhiteList[value] ~= nil then
							E.global.chatfilter.WhiteList[value] = nil
							E.Options.args.chatfilter.args.WhiteList.args.List.values[value] = nil
						end
					end,
				},
				List = {
					order = 3,
					type = "multiselect",
					name = L["WhiteList"],
					get = function(info, k) return E.global.chatfilter.WhiteList[k] end,
					set = function(info, k, v)
						E.global.chatfilter.WhiteList[k] = v
					end,
					values = {
					},
				},
			},
		},
		BlankName = {
			order = 5,
			type = "group",
			name = L["sender blanklist"],
			disabled = function() return not E.global.chatfilter.Enabled end,
			args = {
				intro = {
					order = 0,
					type = "description",
					name = L["sender blanklist intro"],
				},
				NewWord = {
					order = 1,
					type = "input",
					name = L["New Word"],
					get = function(info) return "" end,
					set = function(info, value)
						E.global.chatfilter.BlankName[value] = true
					end,
				},
				DeleteWord = {
					order = 2,
					type = "input",
					name = L["Delete Word"],
					get = function(info) return "" end,
					set = function(info, value)
						if E.global.chatfilter.BlankName[value] ~= nil then
							E.global.chatfilter.BlankName[value] = nil
						end
					end,
				},
				Reset = {
					order = 3,
					type = "execute",
					name = L['Restore Defaults'],
					func = function() wipe(E.global.chatfilter.BlankName); E:StaticPopup_Show("CONFIG_RL") end,
				},
				List = {
					order = 4,
					type = "multiselect",
					name = L["BlackList"],
					get = function(info, k) return E.global.chatfilter.BlankName[k] end,
					set = function(info, k, v)
						E.global.chatfilter.BlankName[k] = v
					end,
					values = {
					},
				},
			},
		},			
	},
}

for k, v in pairs(E.global.chatfilter.BlankName) do
	E.Options.args.chatfilter.args.BlankName.args.List.values[k] = k
end	

for k, v in pairs(E.global.chatfilter.BlackList) do
	E.Options.args.chatfilter.args.BlackList.args.List.values[k] = k
end

for k, v in pairs(E.global.chatfilter.WhiteList) do
	E.Options.args.chatfilter.args.WhiteList.args.List.values[k] = k
end

E.Options.args.combattext = {
	type = "group",
	name = '15.'..L["combattext"],
	args = {
		desc = {
			order = 0,
			type = "description",
			name = L["combattext desc"],
		},
		enable = {
			order = 1,
			type = "toggle",
			name = 'MSBT',
			get = function() return IsAddOnLoaded('MikScrollingBattleText') end,
			set = function(info, value)
				if value then
					EnableAddOn('MikScrollingBattleText')
				else
					DisableAddOn('MikScrollingBattleText')
				end
				E:StaticPopup_Show("CONFIG_RL")
			end,
		},
		option = {
			order = 2,
			type = "execute",
			name = L['Toggle Configuration'],
			disabled = function() return not IsAddOnLoaded('MikScrollingBattleText') end,
			func = function()
				local optionsName = "MSBTOptions"
				if (not IsAddOnLoaded(optionsName)) then
					local loaded, failureReason = LoadAddOn(optionsName)
					if (not loaded) then
						local failureMessage = _G["ADDON_" .. failureReason] or failureReason or ""
						E:Print(format(ADDON_LOAD_FAILED, optionsName, failureMessage))
					end
				end
				if (IsAddOnLoaded(optionsName)) then MSBTOptions.Main.ShowMainFrame(); E:ToggleConfig() end
			end,
		},
		xct = {
			order = 3,
			type = 'toggle',
			name = 'XCT',
			get = function() return E.db.combattext.enable end,
			set = function(info, value)
				E.db.combattext.enable = value;
				if value then
					if IsAddOnLoaded('MikScrollingBattleText') then DisableAddOn('MikScrollingBattleText') end
				end					
				E:StaticPopup_Show("CONFIG_RL")
			end,
		},
	},
}

if E.db.combattext.enable then
	E.Options.args.combattext.args.general = {
		order = 4,
		type = "group",
		guiInline = true,
		name = L["General"],
		get = function(info) return E.db.combattext[ info[#info] ] end,
		set = function(info, value) E.db.combattext[ info[#info] ] = value; E:StaticPopup_Show("CONFIG_RL") end,		
		disabled = function() return not E.db.combattext.enable end,
		args = {
			damage_style = {
				order = 2,
				type = "toggle",
				name = L["damage style"],
			},
			damage = {
				order = 3,
				type = "toggle",
				name = L["damage"],
			},
			healing = {
				order = 4,
				type = "toggle",
				name = L["healing"],
			},
			show_hots = {
				order = 5,
				type = "toggle",
				name = L["show hots"],
			},
			show_overhealing = {
				order = 6,
				type = "toggle",
				name = L["show overhealing"],
			},
			pet_damage = {
				order = 7,
				type = "toggle",
				name = L["pet damage"],
			},
			dot_damage = {
				order = 8,
				type = "toggle",
				name = L["dot damage"],
			},
			damage_color = {
				order = 9,
				type = "toggle",
				name = L["damage color"],
			},
			crit_prefix = {
				order = 10,
				type = "input",
				name = L["crit prefix"],
			},
			crit_postfix = {
				order = 11,
				type = "input",
				name = L["crit postfix"],
			},
			icons = {
				order = 12,
				type = "toggle",
				name = L["icons"],
			},
			icon_size = {
				order = 13,
				type = "range",
				name = L["icon size"],
				min = 5, max = 50, step = 1,
			},
			treshold = {
				order = 14,
				type = "range",
				name = L["treshold"],
				min = 1, max = 10000, step = 10,
			},
			heal_treshold = {
				order = 15,
				type = "range",
				name = L["heal treshold"],
				min = 1, max = 10000, step = 10,
			},
			scrollable = {
				order = 16,
				type = "toggle",
				name = L["scrollable"],
			},
			max_lines = {
				order = 17,
				type = "range",
				min = 1, max = 100, step = 1,
				name = L["max lines"],
			},
			time_visible = {
				order = 18,
				type = "range",
				min = 1, max = 10, step = 1,
				name = L["time visible"],
			},
			stop_ve_spam = {
				order = 19,
				type = "toggle",
				name = L["stop ve spam"],
			},
			dk_runes = {
				order = 20,
				type = "toggle",
				name = L["dk runes"],
			},
			killingblow = {
				order = 21,
				type = "toggle",
				name = L["killingblow"],
			},
			merge_aoe_spam = {
				order = 22,
				type = "toggle",
				name = L["merge aoe spam"],
			},
			merge_aoe_spam_time = {
				order = 23,
				type = "range",
				min = 1, max = 10, step = 1,
				name = L["merge aoe spam time"],
			},
			dispel = {
				order = 24,
				type = "toggle",
				name = L["dispel"],
			},
			interrupt = {
				order = 25,
				type = "toggle",
				name = L["interrupt"],
			},
			combat_text_font_size = {
				order = 26,
				type = "range",
				name = L["combat text font size"],
				min = 5, max = 50, step = 1,
			},
			direction = {
				order = 27,
				type = "select",
				name = L["Scroll Direction"],
				values = {
					["top"] = "TOP",
					["bottom"] = "BOTTOM",
				},
			},				
		},
	}
end
	
E.Options.args.FindIt = {
	type = "group",
	name = L["FindIt"],
	get = function(info) return E.db.FindIt[ info[#info] ] end,
	set = function(info, value) E.db.FindIt[ info[#info] ] = value end,	
	args = {
		desc = {
			order = 0,
			type = "description",
			name = L["Search achievement, item and spell... etc."],
		},
		FindType = {
			order = 1,
			type = "select",
			name = L["Find Type"],
			values = {
				["achievement"] = L["achievement"], --成就
				["currency"] = L["currency"], --货币
				["dungeon"] = L["dungeon"], --地下城
				["faction"] = L["faction"], --阵营
				["item"] = L["item"], --物品
				["spell"] = L["spell"], --技能
			},
		},
		msg = {
			order = 2,
			type = "input",
			name = L["MSG"],
		},
		spacer = {
			type = 'description',
			name = '',
			desc = '',
			order = 3,
		},
		search = {
			order = 4,
			type = "execute",
			name = L["Search"],
			func = function()
				local FindIt = E.FindIt
				if not E.db.FindIt.msg or E.db.FindIt.msg == "" then return end
				if E.db.FindIt.FindType == 'item' and not tonumber(E.db.FindIt.msg) then
					DEFAULT_CHAT_FRAME:AddMessage(L["Non-ID lookups for items are disabled!"], 1, 0, 0)
					return
				end
				wipe(E.Options.args.FindIt.args.result.values)
				FindIt:FindObject(E.db.FindIt.FindType, E.db.FindIt.msg)
			end,
		},
		result = {
			order = 4,
			type = "multiselect",
			name = L["Search result"],
			set = function(info, value) DEFAULT_CHAT_FRAME:AddMessage(value, 1, 1, 1) end,
			values = {
			},
		},
	},
}

if E.zhlocale then
	local QASTRING = ''
	for i = 1, 200 do
		if L["Q"..i] == tostring("Q"..i) then break end
		QASTRING = QASTRING ..'\n\n'..E.ValColor..L["Q"..i]..'|r'..'\n'..L["A"..i]
	end

	E.Options.args.QA = {
		type = "group",
		name = E.ValColor..L["Q&A"].."|r",
		order = -2,
		args = {
			text = {
				order  = 1,
				type = "description",
				name = QASTRING,
			},
		},
	}
end

local auraFilterTypes = {
	['ALL'] = ALL,
	['ENEMY'] = ENEMY,
	['FRIENDLY'] = FRIENDLY,
	['NONE'] = NONE,
}
local UF = E:GetModule('UnitFrames');
local selectedSpell = ''

local function UpdateFilterGroup()
	if not selectedSpell or not E.global.unitframe['aurafilters']['Blacklist']['spells'][selectedSpell] then
		E.Options.args.aurabar.args.filters.args.spellGroup = nil
		return
	end
	
	E.Options.args.aurabar.args.filters.args.spellGroup = {
		type = "group",
		name = selectedSpell,
		order = 15,
		guiInline = true,
		--disabled = function() return (not selectedSpell) or (not E.global.unitframe['aurafilters']['Blacklist']['spells'][selectedSpell]) end,
		args = {
			enable = {
				name = L["Enable"],
				type = "toggle",
				get = function() return E.global.unitframe['aurafilters']['Blacklist']['spells'][selectedSpell].enable end,
				set = function(info, value) E.global.unitframe['aurafilters']['Blacklist']['spells'][selectedSpell].enable = value; UpdateFilterGroup(); UF:Update_AllFrames(); end
			},
			priority = {
				name = L["Priority"],
				type = "range",
				get = function() return E.global.unitframe['aurafilters']['Blacklist']['spells'][selectedSpell].priority end,
				set = function(info, value) E.global.unitframe['aurafilters']['Blacklist']['spells'][selectedSpell].priority = value; UpdateFilterGroup(); UF:Update_AllFrames(); end,
				min = 0, max = 10, step = 1,
				desc = L["Set the priority order of the spell, please note that prioritys are only used for the raid debuff module, not the standard buff/debuff module. If you want to disable set to zero."],
			},			
		},				
	}	
end

E.Options.args.aurabar = {
	type = "group",
	name = '00.'.. E.ValColor.. L["Aura Bars"].. "|r",
	args = {
		colors = {
			order = 0,
			type = 'group',
			guiInline = true,
			name = L['Colors'],
			args = {
				BUFFS = {
					order = 1,
					name = L['Buffs'],
					type = 'color',
					get = function(info)
						local t = E.db.unitframe.colors.auraBarBuff
						return t.r, t.g, t.b, t.a
					end,
					set = function(info, r, g, b)
						E.db.general[ info[#info] ] = {}
						local t = E.db.unitframe.colors.auraBarBuff
						t.r, t.g, t.b = r, g, b
						UF:Update_AllFrames()
					end,										
				},	
				DEBUFFS = {
					order = 2,
					name = L['Debuffs'],
					type = 'color',
					get = function(info)
						local t = E.db.unitframe.colors.auraBarDebuff
						return t.r, t.g, t.b, t.a
					end,
					set = function(info, r, g, b)
						E.db.general[ info[#info] ] = {}
						local t = E.db.unitframe.colors.auraBarDebuff
						t.r, t.g, t.b = r, g, b
						UF:Update_AllFrames()
					end,										
				},									
			},
		},		
		player = {
			order = 1,
			type = 'group',
			name = L['Player Frame'],
			guiInline = true,
			get = function(info) return E.db.unitframe.units['player']['aurabar'][ info[#info] ] end,
			set = function(info, value) E.db.unitframe.units['player']['aurabar'][ info[#info] ] = value; UF:CreateAndUpdateUF('player') end,
			args = E.Options.args.unitframe.args.player.args.aurabar.args,
		},
		target = {
			order = 2,
			type = 'group',
			name = L['Target Frame'],
			guiInline = true,
			get = function(info) return E.db.unitframe.units['target']['aurabar'][ info[#info] ] end,
			set = function(info, value) E.db.unitframe.units['target']['aurabar'][ info[#info] ] = value; UF:CreateAndUpdateUF('target') end,
			args = E.Options.args.unitframe.args.target.args.aurabar.args,
		},
		focus = {
			name = L['Focus Frame'],
			type = 'group',
			order = 3,
			guiInline = true,
			get = function(info) return E.db.unitframe.units['focus']['aurabar'][ info[#info] ] end,
			set = function(info, value) E.db.unitframe.units['focus']['aurabar'][ info[#info] ] = value; UF:CreateAndUpdateUF('focus') end,
			args = E.Options.args.unitframe.args.focus.args.aurabar.args,
		},
		filters = {
			name = L['Filters'],
			type = 'group',
			order = 10,
			args = {
				filterGroup = {
					type = 'group',
					name = L['Blacklist'],
					guiInline = true,
					order = 10,
					args = {
						addSpell = {
							order = 1,
							name = L['Add Spell'],
							desc = L['Add a spell to the filter.'],
							type = 'input',
							get = function(info) return "" end,
							set = function(info, value) 
								if not E.global.unitframe['aurafilters']['Blacklist']['spells'][value] then
									E.global.unitframe['aurafilters']['Blacklist']['spells'][value] = { 
										['enable'] = true,
										['priority'] = 0,
									}
								end
								UpdateFilterGroup();
								UF:Update_AllFrames();
							end,					
						},
						removeSpell = {
							order = 1,
							name = L['Remove Spell'],
							desc = L['Remove a spell from the filter.'],
							type = 'input',
							get = function(info) return "" end,
							set = function(info, value) 
								if G['unitframe']['aurafilters']['Blacklist'] then
									if G['unitframe']['aurafilters']['Blacklist']['spells'][value] then
										E.global.unitframe['aurafilters']['Blacklist']['spells'][value].enable = false;
										E:Print(L['You may not remove a spell from a default filter that is not customly added. Setting spell to false instead.'])
									else
										E.global.unitframe['aurafilters']['Blacklist']['spells'][value] = nil;
									end
								else
									E.global.unitframe['aurafilters']['Blacklist']['spells'][value] = nil;
								end
								
								UpdateFilterGroup();
								UF:Update_AllFrames();
							end,				
						},		
						filterType = {
							order = 4,
							name = L['Filter Type'],
							desc = L['Set the filter type, blacklisted filters hide any aura on the like and show all else, whitelisted filters show any aura on the filter and hide all else.'],
							type = 'select',
							values = {
								['Whitelist'] = L['Whitelist'],
								['Blacklist'] = L['Blacklist'],
							},
							get = function() return E.global.unitframe['aurafilters']['Blacklist'].type end,
							set = function(info, value) E.global.unitframe['aurafilters']['Blacklist'].type = value; UF:Update_AllFrames(); end,
						},	
						selectSpell = {
							name = L["Select Spell"],
							type = 'select',
							order = -9,
							get = function(info) return selectedSpell end,
							set = function(info, value) selectedSpell = value; UpdateFilterGroup() end,							
							values = function()
								local filters = {}
								filters[''] = NONE
								for filter in pairs(E.global.unitframe['aurafilters']['Blacklist']['spells']) do
									filters[filter] = filter
								end

								return filters
							end,
						},
					},
				},
			},
		},		
	},
}