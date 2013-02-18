local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore

local tsort, tinsert = table.sort, table.insert

E.Options.args = {
	ElvUI_Header = {
		order = 1,
		type = "header",
		name = L["Version"]..format(": |cff99ff33%s|r",E.version).." Build"..format(": |cffFFFFFF%s|r",E.build),
		width = "full",		
	},
	LoginMessage = {
		order = 2,
		type = 'toggle',
		name = L['Login Message'],
		get = function(info) return E.db.general.loginmessage end,
		set = function(info, value) E.db.general.loginmessage = value end,
	},	
	ToggleTutorial = {
		order = 3,
		type = 'execute',
		name = L['Toggle Tutorials'],
		func = function() E:Tutorials(true); E:ToggleConfig()  end,
	},
	Install = {
		order = 4,
		type = 'execute',
		name = L['Install'],
		desc = L['Run the installation process.'],
		func = function() E:Install(); E:ToggleConfig() end,
	},	
	ToggleAnchors = {
		order = 5,
		type = "execute",
		name = L["Toggle Anchors"],
		desc = L["Unlock various elements of the UI to be repositioned."],
		func = function() E:ToggleConfigMode() end,
	},
	ResetAllMovers = {
		order = 6,
		type = "execute",
		name = L["Reset Anchors"],
		desc = L["Reset all frames to their original positions."],
		func = function() E:ResetUI() end,
	},	
}

E.Options.args.general = {
	type = "group",
	name = '01.'..L["General"],
	order = 1,
	get = function(info) return E.db.general[ info[#info] ] end,
	set = function(info, value) E.db.general[ info[#info] ] = value end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["ELVUI_DESC"],
		},			
		general = {
			order = 2,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				autoScale = {
					order = 0,
					name = L["Auto Scale"],
					desc = L["Automatically scale the User Interface based on your screen resolution"],
					type = "toggle",	
					get = function(info) return E.global.general.autoScale end,
					set = function(info, value) E.global.general[ info[#info] ] = value; E:StaticPopup_Show("GLOBAL_RL") end
				},
				uiscale = {
					order = 1,
					name = L["UI Scale"],
					desc = L["Controls the scaling of the entire User Interface"],
					disabled = function(info) return E.global.general.autoScale end,
					type = "range",
					min = 0.64, max = 1.15, step = 0.01,
					isPercent = true,
					set = function(info, value) SetCVar("uiScale", value); E:StaticPopup_Show('CONFIG_RL') end,
					get = function() return tonumber(format('%.2f', GetCVar('uiScale'))) end,
				},			
				interruptAnnounce = {
					order = 11,
					name = L['Announce Interrupts'],
					desc = L['Announce when you interrupt a spell to the specified chat channel.'],
					type = 'select',
					values = {
						['NONE'] = NONE,
						['SAY'] = SAY,
						['PARTY'] = PARTY,
						['RAID'] = RAID,
					},
				},
				autoRepair = {
					order = 2,
					name = L['Auto Repair'],
					desc = L['Automatically repair using the following method when visiting a merchant.'],
					type = 'select',
					values = {
						['NONE'] = NONE,
						['GUILD'] = GUILD,
						['PLAYER'] = PLAYER,
					},				
				},
				mapAlpha = {
					order = 3,
					name = L['Map Alpha While Moving'],
					desc = L['Controls what the transparency of the worldmap will be set to when you are moving.'],
					type = 'range',
					isPercent = true,
					min = 0, max = 1, step = 0.01,
				},		
				autoAcceptInvite = {
					order = 5,
					name = L['Accept Invites'],
					desc = L['Automatically accept invites from guild/friends.'],
					type = 'toggle',
				},
				-- vendorGrays = {
					-- order = 6,
					-- name = L['Vendor Grays'],
					-- desc = L['Automatically vendor gray items when visiting a vendor.'],
					-- type = 'toggle',				
				-- },
				-- autoRoll = {
					-- order = 8,
					-- name = L['Auto Greed/DE'],
					-- desc = L['Automatically select greed or disenchant (when available) on green quality items. This will only work if you are the max level.'],
					-- type = 'toggle',		
					-- disabled = function() return not E.private.general.lootRoll end
				-- },
				loot = {
					order = 9,
					type = "toggle",
					name = L['Loot'],
					desc = L['Enable/Disable the loot frame.'],
					get = function(info) return E.private.general.loot end,
					set = function(info, value) E.private.general.loot = value; E:StaticPopup_Show("PRIVATE_RL") end
				},
				lootRoll = {
					order = 10,
					type = "toggle",
					name = L['Loot Roll'],
					desc = L['Enable/Disable the loot roll frame.'],
					get = function(info) return E.private.general.lootRoll end,
					set = function(info, value) E.private.general.lootRoll = value; E:StaticPopup_Show("PRIVATE_RL") end
				},
				bubbles = {
					order = 12,
					type = "toggle",
					name = L['Chat Bubbles'],
					desc = L['Skin the blizzard chat bubbles.'],
					get = function(info) return E.private.general.bubbles end,
					set = function(info, value) E.private.general.bubbles = value; E:StaticPopup_Show("PRIVATE_RL") end
				},	
				taintLog = {
					order = 13,
					type = "toggle",
					name = L["Log Taints"],
					desc = L["Send ADDON_ACTION_BLOCKED errors to the Lua Error frame. These errors are less important in most cases and will not effect your game performance. Also a lot of these errors cannot be fixed. Please only report these errors if you notice a Defect in gameplay."],
				},
				-- tinyWorldMap = {
					-- order = 14,
					-- type = "toggle",
					-- name = L["Tiny Map"],
					-- desc = L["Don't scale the large world map to block out sides of the screen."],
					-- get = function(info) return E.db.general.tinyWorldMap end,
					-- set = function(info, value) E.db.general.tinyWorldMap = value; E:GetModule('WorldMap'):ToggleTinyWorldMapSetting() end					
				-- },	
				bottomPanel = {
					order = 15,
					type = 'toggle',
					name = L['Bottom Panel'],
					desc = L['Display a panel across the bottom of the screen. This is for cosmetic only.'],
					get = function(info) return E.db.general.bottomPanel end,
					set = function(info, value) E.db.general.bottomPanel = value; E:GetModule('Layout'):BottomPanelVisibility() end						
				},
				topPanel = {
					order = 16,
					type = 'toggle',
					name = L['Top Panel'],
					desc = L['Display a panel across the top of the screen. This is for cosmetic only.'],
					get = function(info) return E.db.general.topPanel end,
					set = function(info, value) E.db.general.topPanel = value; E:GetModule('Layout'):TopPanelVisibility() end						
				},					
			},
		},	
		minimap = {
			order = 2,
			get = function(info) return E.db.general.minimap[ info[#info] ] end,	
			type = "group",
			name = MINIMAP_LABEL,
			guiInline = true,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					desc = L['Enable/Disable the minimap. |cffFF0000Warning: This will prevent you from seeing the consolidated buffs bar, and prevent you from seeing the minimap datatexts.|r'],
					get = function(info) return E.private.general.minimap[ info[#info] ] end,
					set = function(info, value) E.private.general.minimap[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end,	
				},
				size = {
					order = 2,
					type = "range",
					name = L["Size"],
					desc = L['Adjust the size of the minimap.'],
					min = 120, max = 250, step = 1,
					set = function(info, value) E.db.general.minimap[ info[#info] ] = value; E:GetModule('Minimap'):UpdateSettings() end,	
					disabled = function() return not E.private.general.minimap.enable end,
				},	
				locationText = {
					order = 3,
					type = 'select',
					name = L['Location Text'],
					desc = L['Change settings for the display of the location text that is on the minimap.'],
					get = function(info) return E.db.general.minimap.locationText end,
					set = function(info, value) E.db.general.minimap.locationText = value; E:GetModule('Minimap'):UpdateSettings() end,
					values = {
						['MOUSEOVER'] = L['Minimap Mouseover'],
						['SHOW'] = L['Always Display'],
						['HIDE'] = L['Hide'],
					},
					disabled = function() return not E.private.general.minimap.enable end,
				},				
			},		
		},
		experience = {
			order = 3,
			get = function(info) return E.db.general.experience[ info[#info] ] end,
			set = function(info, value) E.db.general.experience[ info[#info] ] = value; E:GetModule('Misc'):UpdateExpRepDimensions() end,		
			type = "group",
			name = XPBAR_LABEL,
			guiInline = true,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					set = function(info, value) E.db.general.experience[ info[#info] ] = value; E:GetModule('Misc'):EnableDisable_ExperienceBar() end,
				},
				width = {
					order = 2,
					type = "range",
					name = L["Width"],
					min = 100, max = 800, step = 1,
				},
				height = {
					order = 3,
					type = "range",
					name = L["Height"],
					min = 5, max = 30, step = 1,
				},
				textFormat = {
					order = 4,
					type = 'select',
					name = L["Text Format"],
					values = {
						NONE = NONE,
						PERCENT = L["Percent"],
						CURMAX = L["Current - Max"],
						CURPERC = L["Current - Percent"],
					},
					set = function(info, value) E.db.general.experience[ info[#info] ] = value; E:GetModule('Misc'):UpdateExperience() end,
				},		
				textSize = {
					order = 5,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,		
				},				
			},
		},
		reputation = {
			order = 4,
			get = function(info) return E.db.general.reputation[ info[#info] ] end,
			set = function(info, value) E.db.general.reputation[ info[#info] ] = value; E:GetModule('Misc'):UpdateExpRepDimensions() end,		
			type = "group",
			name = REPUTATION,
			guiInline = true,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					set = function(info, value) E.db.general.reputation[ info[#info] ] = value; E:GetModule('Misc'):EnableDisable_ReputationBar() end,
				},
				width = {
					order = 2,
					type = "range",
					name = L["Width"],
					min = 100, max = 800, step = 1,
				},
				height = {
					order = 3,
					type = "range",
					name = L["Height"],
					min = 5, max = 30, step = 1,
				},
				textFormat = {
					order = 4,
					type = 'select',
					name = L["Text Format"],
					values = {
						NONE = NONE,
						PERCENT = L["Percent"],
						CURMAX = L["Current - Max"],
						CURPERC = L["Current - Percent"],
					},
					set = function(info, value) E.db.general.reputation[ info[#info] ] = value; E:GetModule('Misc'):UpdateReputation() end,
				},		
				textSize = {
					order = 5,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,		
				},				
			},
		},	
		threat = {
			order = 4,
			get = function(info) return E.db.general.threat[ info[#info] ] end,
			set = function(info, value) E.db.general.threat[ info[#info] ] = value; E:GetModule('Threat'):ToggleEnable()end,		
			type = "group",
			name = L['Threat'],
			guiInline = true,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
				},
				position = {
					order = 2,
					type = 'select',
					name = L['Position'],
					desc = L['Adjust the position of the threat bar to either the left or right datatext panels.'],
					values = {
						['LEFTCHAT'] = L['Left Chat'],
						['RIGHTCHAT'] = L['Right Chat'],
					},
					set = function(info, value) E.db.general.threat[ info[#info] ] = value; E:GetModule('Threat'):UpdatePosition() end,	
				},
				textSize = {
					order = 3,
					name = L["Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,	
					set = function(info, value) E.db.general.threat[ info[#info] ] = value; E:GetModule('Threat'):UpdatePosition() end,	
				},		
			},
		},	
		totems = {
			order = 5,
			type = "group",
			name = TUTORIAL_TITLE47,
			guiInline = true,
			get = function(info) return E.db.general.totems[ info[#info] ] end,
			set = function(info, value) E.db.general.totems[ info[#info] ] = value; E:GetModule('Totems'):PositionAndSize() end,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					set = function(info, value) E.db.general.totems[ info[#info] ] = value; E:GetModule('Totems'):ToggleEnable() end,
				},					
				size = {
					order = 2,
					type = 'range',
					name = L["Button Size"],
					desc = L['Set the size of your bag buttons.'],
					min = 24, max = 60, step = 1,
				},
				spacing = {
					order = 3,
					type = 'range',
					name = L['Button Spacing'],
					desc = L['The spacing between buttons.'],
					min = 1, max = 10, step = 1,			
				},
				sortDirection = {
					order = 4,
					type = 'select',
					name = L["Sort Direction"],
					desc = L['The direction that the bag frames will grow from the anchor.'],
					values = {
						['ASCENDING'] = L['Ascending'],
						['DESCENDING'] = L['Descending'],
					},
				},
				growthDirection = {
					order = 5,
					type = 'select',
					name = L['Bar Direction'],
					desc = L['The direction that the bag frames be (Horizontal or Vertical).'],
					values = {
						['VERTICAL'] = L['Vertical'],
						['HORIZONTAL'] = L['Horizontal'],
					},
				},
			},
		},					
	},
}

E.Options.args.media = {
	order = 2,
	type = "group",
	name = "01.1.".. L["Media"],
	get = function(info) return E.db.general[ info[#info] ] end,
	set = function(info, value) E.db.general[ info[#info] ] = value end,	
	args = {
		fonts = {
			order = 1,
			type = "group",
			name = L["Fonts"],
			guiInline = true,
			args = {
				fontSize = {
					order = 1,
					name = L["Font Size"],
					desc = L["Set the font size for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"],
					type = "range",
					min = 6, max = 22, step = 1,
					set = function(info, value) E.db.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); end,
				},	
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 2,
					name = L["Default Font"],
					desc = L["The font that the core of the UI will use."],
					values = AceGUIWidgetLSMlists.font,	
					set = function(info, value) E.db.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); end,
				},
				dmgfont = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 3,
					name = L["CombatText Font"],
					desc = L["The font that combat text will use. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"],
					values = AceGUIWidgetLSMlists.font,
					get = function(info) return E.private.general[ info[#info] ] end,							
					set = function(info, value) E.private.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); E:StaticPopup_Show("PRIVATE_RL"); end,
				},
				namefont = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 3,
					name = L["Name Font"],
					desc = L["The font that appears on the text above players heads. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"],
					values = AceGUIWidgetLSMlists.font,
					get = function(info) return E.private.general[ info[#info] ] end,							
					set = function(info, value) E.private.general[ info[#info] ] = value; E:UpdateMedia(); E:UpdateFontTemplates(); E:StaticPopup_Show("PRIVATE_RL"); end,
				}
			},
		},	
		textures = {
			order = 2,
			type = "group",
			name = L["Textures"],
			guiInline = true,
			args = {
				normTex = {
					type = "select", dialogControl = 'LSM30_Statusbar',
					order = 1,
					name = L["Primary Texture"],
					desc = L["The texture that will be used mainly for statusbars."],
					values = AceGUIWidgetLSMlists.statusbar,
					get = function(info) return E.private.general[ info[#info] ] end,
					set = function(info, value) E.private.general[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end							
				},
				glossTex = {
					type = "select", dialogControl = 'LSM30_Statusbar',
					order = 2,
					name = L["Secondary Texture"],
					desc = L["This texture will get used on objects like chat windows and dropdown menus."],
					values = AceGUIWidgetLSMlists.statusbar,	
					get = function(info) return E.private.general[ info[#info] ] end,
					set = function(info, value) E.private.general[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL") end
				},				
			},
		},
		colors = {
			order = 3,
			type = "group",
			name = L["Colors"],
			guiInline = true,
			args = {
				bordercolor = {
					type = "color",
					order = 1,
					name = L["Border Color"],
					desc = L["Main border color of the UI."],
					hasAlpha = false,
					get = function(info)
						local t = E.db.general[ info[#info] ]
						return t.r, t.g, t.b, t.a
					end,
					set = function(info, r, g, b)
						E.db.general[ info[#info] ] = {}
						local t = E.db.general[ info[#info] ]
						t.r, t.g, t.b = r, g, b
						E:UpdateMedia()
						E:UpdateBorderColors()
					end,					
				},
				backdropcolor = {
					type = "color",
					order = 2,
					name = L["Backdrop Color"],
					desc = L["Main backdrop color of the UI."],
					hasAlpha = false,
					get = function(info)
						local t = E.db.general[ info[#info] ]
						return t.r, t.g, t.b, t.a
					end,
					set = function(info, r, g, b)
						E.db.general[ info[#info] ] = {}
						local t = E.db.general[ info[#info] ]
						t.r, t.g, t.b = r, g, b
						E:UpdateMedia()
						E:UpdateBackdropColors()
					end,						
				},
				backdropfadecolor = {
					type = "color",
					order = 3,
					name = L["Backdrop Faded Color"],
					desc = L["Backdrop color of transparent frames"],
					hasAlpha = true,
					get = function(info)
						local t = E.db.general[ info[#info] ]
						return t.r, t.g, t.b, t.a
					end,
					set = function(info, r, g, b, a)
						E.db.general[ info[#info] ] = {}
						local t = E.db.general[ info[#info] ]	
						t.r, t.g, t.b, t.a = r, g, b, a
						E:UpdateMedia()
						E:UpdateBackdropColors()
					end,						
				},
				valuecolor = {
					type = "color",
					order = 4,
					name = L["Value Color"],
					desc = L["Color some texts use."],
					hasAlpha = false,
					get = function(info)
						local t = E.db.general[ info[#info] ]
						return t.r, t.g, t.b, t.a
					end,
					set = function(info, r, g, b, a)
						E.db.general[ info[#info] ] = {}
						local t = E.db.general[ info[#info] ]	
						t.r, t.g, t.b, t.a = r, g, b, a
						E:UpdateMedia()
					end,						
				},	
				transparent = {
					type = "toggle",
					order = 5,
					name = L["Transparent Theme"],
					desc = L["Transparent Theme desc"],
					set = function(info, value)
						E.db.general.transparent = value
						E.db.unitframe.transparent = value
						if value then E:SetupTheme("transparent", true) else E:SetupTheme("classic", true) end
					end,
				},				
				resetbutton = {
					type = "execute",
					order = 6,
					name = L["Restore Defaults"],
					func = function() 
						E.db.general.backdropcolor = P.general.backdropcolor
						E.db.general.backdropfadecolor = P.general.backdropfadecolor
						E.db.general.bordercolor = P.general.bordercolor
						E.db.general.valuecolor = P.general.valuecolor
						E:UpdateMedia()
						E:UpdateFrameTemplates()								
					end,
				},
			},
		},
	},
}

local DONATOR_STRING = ""
local CNDONATOR_STRING = ""
local DEVELOPER_STRING = ""
local TESTER_STRING = ""
local LINE_BREAK = "\n"
local DONATORS = {
	"Dandruff",
	"Tobur/Tarilya",
	"Netu",
	"Alluren",
	"Thorgnir",
	"Emalal",
	"Bendmeova",
	"Curl",
	"Zarac",
	"Emmo",
	"Oz",
	"Hawké",
	"Aynya",
	"Tahira",
	"Karsten Lumbye Thomsen",
	"Thomas B. aka Pitschiqüü",
	"Sea Garnet",
	"Paul Storry",
	"Azagar",
	"Archury",
	"Donhorn",
	"Woodson Harmon",
	"Phoenyx",
	"Feat",
	"Konungr",
	"Leyrin",
	"Dragonsys",
	"Tkalec",
	"Paavi",
	"Giorgio",
	"Bearscantank",
	"Eidolic",
	"Cosmo",
	"Adorno",
	"Domoaligato",
	"Smorg"
}

local CNDONATORS = {
	"wxbbf",
	"sammyda",
	"zmmjoy1028",
	"lileimu0126",
	"happy_fly_pig",
	"lulu5205200701",
	"qq52776758",
	"lulu5205200701",
	"玩酷轨迹",
	"泉0510",
	"皮蛋oo",
	"雨季雷",
	"lmnno",
	"feliciagao",
	"炽天使zz",
	"忘归猪",
	"marger52",
	"maimang",
	"凌乱兰花",
	"不会吐泡的鱼",
	"gd2933",
	"realzhumen",
	"itachi_203",
	"wzadjl",
	"chaoyi3456",
	"shameless_pig",
	"chise1",
	"默默远去",
	"大只标",
	"波谲云诡1314",
	"大唐风羽",
	"叹息的足迹",
	"曦月刃语",
	"samwoody",
	"oinoon",
	"tb379270_2012",
	"被人踹下天",
	"风之路人11",
	"wargreymon1234",
	"chris6522",
	"情侣t恤",
	"lyq402631678",
	"silverhawx",
	"terrymu",
	"jianxinbang",
	"yydatou2",
	"liubin5381",
	"jh967354",
	"shome",
	"santon123",
	"chenyunlong00",
	"kaminakeita",
	"gypazyy",
	"belthil17",
	"deathduo",
	"吧嗒吧嗒大学生",
	"路过的羽毛",
	"open1648",
	"bigzmeng617",
	"geenar",
	"fxymike",
	"叶落心安",
	"duyu75526150",
	"jiangxuxing1985_",
	"上帝的知己",
	"atcc7212",
	"gugg594254843",
	"wawq919",
	"arler",
	"listzj",
}

local DEVELOPERS = {
	"Tukz",
	"Haste",
	"Nightcracker",
	"Omega1970",
	"Hydrazine"
}

local TESTERS = {
	"Tukui Community",
	"Affinity",
	"Modarch",
	"Bladesdruid",
	"Tirain",
	"Phima",
	"Veiled",
	"Blazeflack",
	"Repooc",
	"Darth Predator",
	'Alex',
	'Nidra',
	'Kurhyus',
	'BuG',
	'Yachanay',
	'Catok'
}

tsort(DONATORS, function(a,b) return a < b end) --Alphabetize
for _, donatorName in pairs(DONATORS) do
	tinsert(E.CreditsList, donatorName)
	DONATOR_STRING = DONATOR_STRING..LINE_BREAK..donatorName
end

tsort(DEVELOPERS, function(a,b) return a < b end) --Alphabetize
for _, devName in pairs(DEVELOPERS) do
	tinsert(E.CreditsList, devName)
	DEVELOPER_STRING = DEVELOPER_STRING..LINE_BREAK..devName
end

tsort(TESTERS, function(a,b) return a < b end) --Alphabetize
for _, testerName in pairs(TESTERS) do
	tinsert(E.CreditsList, testerName)
	TESTER_STRING = TESTER_STRING..LINE_BREAK..testerName
end

local cni = 0
for _, cndonatorName in pairs(CNDONATORS) do
	cni = cni + 1
	if mod(cni, 10) == 0 then
		CNDONATOR_STRING = CNDONATOR_STRING..LINE_BREAK..LINE_BREAK..cndonatorName
	else
		CNDONATOR_STRING = CNDONATOR_STRING.. (CNDONATOR_STRING ~= "" and ", " or "")..cndonatorName
	end
end

E.Options.args.credits = {
	type = "group",
	name = L["Credits"],
	order = -1,
	args = {
		text = {
			order = 1,
			type = "description",
			name = L['ELVUI_CREDITS']..'\n\n'..L['Coding:']..DEVELOPER_STRING..'\n\n'..L['Testing:']..TESTER_STRING..'\n\n'..L['Donations:']..DONATOR_STRING,
		},
	},
}

if E.zhlocale then
	E.Options.args.credits.args.text.name = L['EUI_DONATOR']..'\n\n\n'..CNDONATOR_STRING
	E.Options.args.credits.name = L['Donations:']
end