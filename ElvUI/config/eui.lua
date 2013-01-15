local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

G['skins'] = {
	['embedRight'] = '',
	['embedcombat'] = false,
}
G['reminder'] = {}
G['extracd'] = {}

V['reminder'] = {
	['enable'] = true,
	['sound'] = "Warning",
}

P['sao'] = {
	['enable'] = true,
	['onlyTime'] = 'time', --no,time,name
	['offsetX'] = 0,
	['offsetY'] = 0,
	['useIcon'] = false,
	['fontSize'] = 24,
	['useBuffIcon'] = false,
	['iconSize'] = 64,
	['iconGap'] = 8,
	['spells'] = {
		['DRUID'] = {
			[69369] = {
				['enable'] = true,
				['texture'] = 'FURY_OF_STORMRAGE',
				['position'] = 'TOP',
				['showing'] = false,
				['active'] = false,
				['offsetX'] = 0,
				['offsetY'] = 0,
			},
		},
		['PRIEST'] = {},
		['HUNTER'] = {},
		['MAGE'] = {},
		['PALADIN'] = {},
		['SHAMAN'] = {},
		['WARRIOR'] = {},
		['DEATHKNIGHT'] = {
			[50421] = {
				['enable'] = true,
				['texture'] = 'FURY_OF_STORMRAGE',
				['position'] = 'TOP',
				['showing'] = false,
				['active'] = false,
				['offsetX'] = 0,
				['offsetY'] = 0,
			},		
		},
		['ROGUE'] = {},
		['WARLOCK'] = {},
		['MONK'] = {},
	},
}

P['general'].bordercolor = { r = .31,g = .31,b = .31 }
P['general'].backdropfadecolor = { r = .06,g = .06,b = .06, a = 0.9 }
P['general'].stickyFrames = false
P['unitframe'].colors.health = P.general.bordercolor
P['unitframe'].colors.auraBarBuff = P.general.bordercolor

P['bags'].alignToChat = false
P['bags'].spacing = 4
P['bags'].point = {}

P["FindIt"] = {
	msg = "",
	FindType = "spell",
}

P["AuraWatch"] = {
	["enable"] = false,
	["checkSpellid"] = false,
	["loadDefault"] = false,
	['font'] = 'EUI',
	['fontSize'] = 11,
	['fontOutline'] = 'OUTLINE',
	["DB"] = {},
}

V["AuraWatch"] = {
	["enable"] = false,
}

V["SoraClassTimer"] = {
	["enable"] = false,
}

P["SoraClassTimer"] = {
	["enable"] = false,
	['font'] = 'EUI',
	['fontSize'] = 11,
	['fontOutline'] = 'OUTLINE',	
	["timelimit"] = 60,
	["PlayerMode"] = "Icon",
		["PlayerIconSize"] = 48,
	["TargetMode"] = "Icon",
		["TargetIconSize"] = 42,
	["BlackList"] = {
		[GetSpellInfo(80166)] = true, --喝水
		[GetSpellInfo(87601)] = true, --进食
	},
	["WhiteList"] = {

		[GetSpellInfo( 2825)] = true, -- 嗜血
	},
}	

P['general'].font = 'EUI'
P['nameplate'].font = 'EUI'
P['nameplate'].fontSize = 10
P['nameplate'].fontOutline = 'OUTLINE'
P['nameplate'].auraFont = 'EUI'
P['nameplate'].auraFontOutline = 'OUTLINE'
P['auras'].font = 'EUI'
P['auras'].auraFont = 'EUI'
P['auras'].auraFontOutline = 'OUTLINE'
P['auras'].fontOutline = 'OUTLINE'
P['auras'].fontSize = 12
P['auras'].consolidatedBuffs.consolidateTo = false
P['auras'].consolidatedBuffs.font = 'EUI'
P['auras'].consolidatedBuffs.fontOutline = 'OUTLINE'
P['auras'].consolidatedBuffs.fontSize = 11

P['chat'].font = 'EUI'
P['chat'].tabFont = 'EUI'
P['datatexts'].font = 'EUI'
P['unitframe'].font = 'EUI'
P['actionbar'].font = 'EUI'

if GetLocale()=="zhCN" then
	V["general"].dmgfont = "伤害数字"
	V["general"].namefont = "EUI"
	P['unitframe'].fontOutline = 'OUTLINE'
	P['actionbar'].fontOutline = 'OUTLINE'
	P['unitframe'].fontSize = 12
elseif GetLocale() == "zhTW" then
	P['unitframe'].fontOutline = 'OUTLINE'
	P['actionbar'].fontOutline = 'OUTLINE'
	P['unitframe'].fontSize = 12
	V["general"].dmgfont = "傷害數字"
	V["general"].namefont = "EUI"
end	

P['chat'].keywords = '%MYNAME%, EUI, 宝库, 恐惧之心, 永春台'
P['chat'].sendRW = false
P["actionbar"].euiabstyle = "None"
P["actionbar"].keyDown = false
P["actionbar"]["bar1"]["paging"]["ROGUE"] = "[stance:1] 7; [stance:2] 7; [stance:3] 10;"
P["actionbar"]["bar1"].backdrop = true
P["actionbar"]["bar1"].buttonspacing = 4
P["actionbar"]["bar1"].buttonsize = 30
P["actionbar"]["bar2"].buttonsize = 30
P["actionbar"]["bar3"].buttonsize = 30
P["actionbar"]["bar4"].buttonsize = 30
P["actionbar"]["bar5"].buttonsize = 30

P["actionbar"]["bar2"].buttonspacing = 4
P["actionbar"]["bar3"].buttonspacing = 4
P["actionbar"]["bar3"].backdrop = true
P["actionbar"]["bar5"].buttonspacing = 4
P["actionbar"]["barPet"].buttonspacing = 4
P["actionbar"]["barPet"].backdrop = true
P["actionbar"]["stanceBar"].buttonspacing = 4

for i = 6, 9 do
	P["actionbar"]['bar'..i] = {
		['enabled'] = false,
		['mouseover'] = false,
		['buttons'] = 12,
		['buttonsPerRow'] = 12,
		['point'] = 'BOTTOMLEFT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,		
		['alpha'] = 1,
		['paging'] = {},
		['visibility'] = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; show",
	}
end

P['datatexts']['panels']['MainABInfobar'] = {
	['left'] = '',
	['middle'] = '',
	['right'] = '',
}
P['datatexts']['panels']['ABLeftInfobar'] = ''
P['datatexts']['panels']['ABRightInfobar'] = ''

P["general"].panelWidth = 360
P["general"].transparent = false
P["general"].classcolor = false
P['general'].bottomPanel = false
P["general"].uiscale = 0.71

P["skins"] = {
	fontSize = 12,
	barHeight = 10,
}

V['chat'].embedright = "None"
V['chat'].embedcombat = false
P['chat'].leftpanelWidth = 362
P['chat'].leftpanelHeight = 180
P['chat'].rightpanelWidth = 362
P['chat'].rightpanelHeight = 180
P['chat'].throttleInterval = 0
P['chat'].autojoin = true

P['tooltip'].range = true
P['tooltip'].ilevel = true
P['tooltip'].talent = true
P['tooltip'].achievementpoint = true
P['tooltip'].transparent = false

P["nameplate"].showhealth = true
P["nameplate"].trackauras = true
P["nameplate"].trackfilter = ''
P["nameplate"].iconsize = 20
P["nameplate"].fontsize = 9
P["nameplate"].healthtext = 'CURRENT_PERCENT'

P["unitframe"].number = "K"
P["unitframe"].colors.nameclasscolor = false
P["unitframe"].targetGlow = true
P["unitframe"].unitframeType = 1
P["unitframe"].transparent = false
P["unitframe"].powertrans = true
P['unitframe'].units.target.smartAuraDisplay = 'DISABLED'
P['unitframe'].units.target.name.position = 'LEFT'
P['unitframe'].units.target.power.position = 'BOTTOMRIGHT'
P['unitframe'].units.target.debuffs.useWhitelist = {friendly = false, enemy = true}
P['unitframe'].units.target.buffs.playerOnly = {friendly = false, enemy = false}
P['unitframe'].units.target.castbar.InterruptSound = false
P['unitframe'].units.focus.castbar.InterruptSound = false
P['unitframe'].units.player.classbar.text = true
P['unitframe'].units.player.aurabar.auraBarWidth = 270
P['unitframe'].units.player.aurabar.auraBarHeight = 20
P['unitframe'].units.player.aurabar.lock = true
P['unitframe'].units.target.aurabar.auraBarWidth = 270
P['unitframe'].units.target.aurabar.auraBarHeight = 20
P['unitframe'].units.target.aurabar.lock = true
P['unitframe'].units.target.aurabar.attachTo = 'DEBUFFS'
P['unitframe'].units.target.tapped = {
	['position'] = 'TOPLEFT',
	['text_format'] = '||cFFB04F4F[tapped]||r',
}
P['unitframe'].units.focus.aurabar.auraBarWidth = 190
P['unitframe'].units.focus.aurabar.auraBarHeight = 20
P['unitframe'].units.focus.aurabar.lock = true
P['unitframe'].units.player.tankshield = {
	['enable'] = true,
	['position'] = 'RIGHT',
}
P['unitframe'].units.target.range = {
	['enable'] = true,
	['position'] = 'BOTTOMLEFT',
	['offsetX'] = 2,
	['offsetY'] = 2,
}
P['unitframe'].units.focus.range = {
	['enable'] = true,
	['position'] = 'TOPLEFT',
	['offsetX'] = 2,
	['offsetY'] = 2,
}

P['unitframe'].units.boss.health.text_format = '[healthcolor][health:current-percent]'

P["unitframe"].units.player.swing = false
P["unitframe"].units.player.portrait.enable = true
P["unitframe"].units.player.portrait.overlay = true
P["unitframe"].units.player.power.width = 'fill'
P["unitframe"].units.player.classbar.totemtime = true
P["unitframe"].units.player.classbar.fill = 'spaced'
P["unitframe"].units.player.combobar = {
	['enable'] = false,
	['fill'] = 'spaced',
	['height'] = 10,
}

P["unitframe"].units.target.power.width = 'fill'
P["unitframe"].units.targettarget.power.width = 'fill'
P["unitframe"].units.targettarget.name.length = 'LONGLEVEL'
P["unitframe"].colors.castColor = { r = .78,g = .67,b = .35 }
P["unitframe"].units.target.portrait.enable = true
P["unitframe"].units.target.portrait.overlay = true
P["unitframe"].units.target.debuffs.enable = true
P["unitframe"].units.raid25.width = 70
P["unitframe"].units.raid25.power.width = 'fill'
P["unitframe"].units.raid25.showParty = false
P["unitframe"].units.raid25.maxColumns = 8
P["unitframe"].units.raid25.visibility = '[@raid41,exists] hide;show'
P["unitframe"].units.raid25.debuffs.enable = false
P["unitframe"].units.raid25.debuffs.initialAnchor = 'BOTTOMRIGHT'
P["unitframe"].units.raid25.debuffs.anchorPoint = 'BOTTOMRIGHT'
P["unitframe"].units.raid25.debuffs['growth-x'] = 'LEFT'
P["unitframe"].units.raid25.debuffs.useFilter = 'RaidDebuffs'
P["unitframe"].units.raid25.rdebuffs.enable = true
P["unitframe"].units.raid25.rdebuffs.xOffset = 0
P["unitframe"].units.raid25.rdebuffs.yOffset = 2
P["unitframe"].units.raid25.roleIcon.position = 'BOTTOMLEFT'
P["unitframe"].colors.nameclasscolor = true

P["unitframe"].units.party.showRaid = false
P["unitframe"].units.party.visibility = "[@raid2,exists] hide;show"
P["unitframe"].units.attention =  {
	['enable'] = true,
	['width'] = 120,
	['height'] = 28,
}

G['chatfilter'] = {
	["Enabled"] = true,
	["WhiteList"] = {
		["宝库"] = true,
	},	
	["BlackList"] = {
		["代.*练.*代.*打"] = true,
		["代.*打.*评.*级"] = true,
	},
	["ShieldPlayers"] = {
		"塞纳.*号",
	},	
	BlankName = {},
	SafeWords = {
		"recruit",
		"dkp",
		"looking",
		"lf[gm]",
		"|cff",
		"raid",
		"recount",
		"skada",
		"boss",
		"dps",
	},
	DangerWords = {
		"平[台臺]",
		"工作室",
		"点[卡心]",
		"[烧大小]饼",
		"[担擔]保",
		"承接",
		"手[工打]",
		"代[打练刷做]",
		"带[打练刷做]",
		"dai[打练刷做]",
		"[带代]评级",
		"[打卖售]金",
		"[打卖售]g",
		"[代售].*s1",
		"[刷扰]屏[勿见]",
		"详[情谈询]",
		"信[誉赖]",
		"服务",
		"价.*优惠",
		"绑定.*上马",
		"上马.*绑定",
		"价格公道",
		"货到付款",
		"非诚勿扰",
		"先.*后[款钱]",
		"游戏币",
		"最低价",
		"无黑金",
		"不封号",
		"无风险",
		"[金g元]=",
		"支付[宝寶]",
		"淘[宝寶]",
		"[皇冲]冠",
		"[热促]销",
		"[加q]q",
		"企业q",
		"咨询",
		"联系",
		"电话",
		"旺旺",
		"口口",
		"扣扣",
		"叩叩",
		"歪歪",
		"yy",
		"[萬万w]g",
		"[萬万w]金",
		"taobao",
		"180",
		"185",
		"190",
		"8085",
		"8090",
		"8590",
		"496509",
		"509516",
	},	
}
	
P["chatfilter"] = {
	["chatfilterbylevel"] = 0, --过滤低等级玩家信息，默认为5
	["ScanOurself"] = false, --Scan ourself. // 是否扫描自己的聊天信息
	["ScanFriend"] = false, --Scan friends. // 是否扫描好友的聊天信息
	["ScanTeam"] = false, --Scan raid/party members. // 是否扫描队友的聊天信息
	["ScanGuild"] = false, --Scan guildies. // 是否扫描公会成员的聊天信息
		
	["noprofanityFilter"] = false, --Disable the profanityFilter. // 关闭语言过滤器
	["nojoinleaveChannel"] = true, --Disable the alert joinleaveChannel. // 关闭进出频道提示
		
	["MergeTalentSpec"] = true, --Merge the messages:"You have learned/unlearned..." // 当切换天赋后合并显示“你学会了/忘却了法术…”
	["FilterPetTalentSpec"] = false, --Filter the messages:"Your pet has learned/unlearned..." // 不显示“你的宠物学会了/忘却了…”
		
	["MergeAchievement"] = true, --Merge the messages:"...has earned the achievement..." // 合并显示获得成就
	["MergeManufacturing"] = true, --Merge the messages:"You has created..." // 合并显示“你制造了…”
		
	["FilterAuctionMSG"] = false, --Filter the messages:"Auction created/cancelled."// 过滤“已开始拍卖/拍卖取消.”
	["FilterRaidAlert"] = false, --Filter the bullshit messages from RaidAlert. // 过滤煞笔RaidAlert的脑残信息
	["FilterQuestReport"] = true, --Filter the bullshit messages from QuestReport. // 过滤掉烦人的任务通报信息
	["FilterDuelMSG"] = true, --Filter the messages:"... has defeated/fled from ... in a duel." // 过滤“...在决斗中战胜了...”
	["FilterDrunkMSG"] = true, --Filter the drunk messages:"... has drunked ..."// 过滤“...喝醉了.”	
	["FilterAdvertising"] = true, --Filter the advertising messages. // 过滤广告信息
	["AllowMatchs"] = 2, --How many words can be allowd to use. // 允许的关键字配对个数

	["ShieldAdvPlayer"] = true, --Shield the player who`s advertising. // 屏蔽发广告的玩家
	["ShieldTimes"] = 30, --How many times shall we shield. // 屏蔽多长时间后解封(分钟)
		
	["FilterMultiLine"] = true, --Filter the multiple messages. // 过滤多行信息
	["AllowLines"] = 3, --How many lines can be allowd. // 允许的最大行数
	
	["FilterRepeat"] = true, --Filter the repeat messages. // 过滤重复聊天信息
	["RepeatAlike"] = 85, --Set the similarity between the messages. // 设定重复信息相似度
	["RepeatInterval"] = 30, --Set the interval between the messages. // 设定重复信息间隔时间
--	["RepeatMaxCache"] = 200, --Set the max cache from the messages. // 设定最多缓存多少条消息
}

P["clickset"] = {
	['spec1'] = {
		["type1"] = "NONE",
		["shiftztype1"]	= "NONE",
		["ctrlztype1"]	= "NONE",
		["altztype1"]	= "NONE",
		["altzctrlztype1"]	= "NONE",
		["type2"]		= "NONE",
		["shiftztype2"]	= "NONE",
		["ctrlztype2"]	= "NONE",
		["altztype2"]	= "NONE",
		["altzctrlztype2"]	= "NONE",
		["type3"]		= "NONE",
		["shiftztype3"]	= "NONE",
		["ctrlztype3"]	= "NONE",
		["altztype3"]	= "NONE",
		["altzctrlztype3"]	= "NONE",	
		["shiftztype4"]	= "NONE",
		["ctrlztype4"]	= "NONE",
		["altztype4"]	= "NONE",
		["altzctrlztype4"]	= "NONE",
		["type4"] = "NONE",
		["shiftztype5"]	= "NONE",
		["ctrlztype5"]	= "NONE",
		["altztype5"]	= "NONE",
		["altzctrlztype5"]	= "NONE",
		["type5"] = "NONE",
	},
	['spec2'] = {
		["type1"] = "NONE",
		["shiftztype1"]	= "NONE",
		["ctrlztype1"]	= "NONE",
		["altztype1"]	= "NONE",
		["altzctrlztype1"]	= "NONE",
		["type2"]		= "NONE",
		["shiftztype2"]	= "NONE",
		["ctrlztype2"]	= "NONE",
		["altztype2"]	= "NONE",
		["altzctrlztype2"]	= "NONE",
		["type3"]		= "NONE",
		["shiftztype3"]	= "NONE",
		["ctrlztype3"]	= "NONE",
		["altztype3"]	= "NONE",
		["altzctrlztype3"]	= "NONE",	
		["shiftztype4"]	= "NONE",
		["ctrlztype4"]	= "NONE",
		["altztype4"]	= "NONE",
		["altzctrlztype4"]	= "NONE",
		["type4"] = "NONE",
		["shiftztype5"]	= "NONE",
		["ctrlztype5"]	= "NONE",
		["altztype5"]	= "NONE",
		["altzctrlztype5"]	= "NONE",
		["type5"] = "NONE",
	},
	["enable"] = true,
	["clicksetlist"] = {},
	["defaultlistloaded"] = false,
	["specswap"] = true,
}

P["euiscript"] = {
	["oldtopinfobar"] = false;
	["bossnotes"] = true,
	["castby"] = true,
	["chatmod"] = true,
	["drag"] = true,
--	["ilevel"] = true,
	["openall"] = true,
	["recipients"] = true,
	["sr"] = true,
	["statreport"] = true,
--	["talent"] = true,
	["tradetabs"] = true,
	["dispel"] = false,
	["raidcheck"] = true,
	["hovertip"] = true,
	["idq"] = false,
	["raidcd"] = true,
		["raidcd_width"] = 208,
		["raidcd_height"] = 20,
		["raidcd_maxbars"] = 10,
		["raidcd_direction"] = "down",
	["classcd"] = true,
		["classcd_width"] = 130,
		["classcd_height"] = 40,
		["classcd_maxbars"] = 5,
		["classcd_direction"] = "right",
		["classcd_style"] = "icon",
	["wildmushroom"] = true,
		["wildmushroom_width"] = 208,
		["wildmushroom_height"] = 20,
		["wildmushroom_direction"] = "down",
	["priestpet"] = true,
		["priestpet_width"] = 208,
		["priestpet_height"] = 20,
	["mapfull"] = false,
	["chatbar"] = true,
	["mapmove"] = true,
	["combatnoti"] = true,
		["combatnoti_leaving"] = "LEAVING COMBAT",
		["combatnoti_entering"] = "ENTERING COMBAT",
	["wgtimenoti"] = 'GUILD',
	["lfgnoti"] = 'GUILD',
--	["chatemote"] = true,
	["autogreed"] = true,
--	["buffreminder"] = true,
	["autoinvenable"] = true,
	["ainvkeyword"] = "eui",
	["errorenable"] = true,
	["threat"] = true,
	["dcp"] = false,
	["autosell"] = true,
	["autoLFG"] = false,
	["RecipientsDB"] = {},
	["MozzFullWorldMap"] = {},
	["dcp_saved"] = {
		fadeInTime = 0.3, 
		fadeOutTime = 0.7, 
		maxAlpha = 0.7, 
		animScale = 1.5, 
		iconSize = 75, 
		holdTime = 0,
		petOverlay = {1,1,1},
		ignoredSpells = "",
		showSpellName = nil,
		x = UIParent:GetWidth()/2, 
		y = UIParent:GetHeight()/2,	
	},
	["autobutton"] = {
		["enable"] = true,
		["size"] = 40,
		["questNum"] = 5,
		["slotNum"] = 5,
	},
	['wsbutton'] = {
		["enable"] = true,
		["size"] = 40,
		["fontsize"] = 20,
	},
	["camerafactor"] = 2,
	["cameradistance"] = 20,
	["auto_confirm_de"] = false,
	["bloodshield"] = false,
	["autobuy"] = true,
	["bgInfo"] = true,
	["TaintError"] = false,
	["achievementpoint"] = true,
	["myslot"] = '',
	["shift_marking"] = true,
	["autochangeloot"] = false,
	['inviteRank'] = 4,
	['embedfocuser'] = true,
}

P["combattext"] = {
	["enable"] = false,							-- Global enable combat text
	["blizz_head_numbers"] = false,				-- Use blizzard damage/healing output(above mob/player head)
	["damage_style"] = true,					-- Change default damage/healing font above mobs/player heads(you need to restart WoW to see changes)
	["damage"] = true,							-- Show outgoing damage in it's own frame
	["healing"] = true,							-- Show outgoing healing in it's own frame
	["show_hots"] = true,						-- Show periodic healing effects in healing frame
	["show_overhealing"] = true,				-- Show outgoing overhealing
	["pet_damage"] = true,						-- Show your pet damage
	["dot_damage"] = true,						-- Show damage from your dots
	["damage_color"] = true,					-- Display damage numbers depending on school of magic
	["crit_prefix"] = "*",						-- Symbol that will be added before crit
	["crit_postfix"] = "*",						-- Symbol that will be added after crit
	["icons"] = true,							-- Show outgoing damage icons
	["icon_size"] = 16,							-- Icon size of spells in outgoing damage frame, also has effect on dmg font size
	["treshold"] = 1,							-- Minimum damage to show in damage frame
	["heal_treshold"] = 1,						-- Minimum healing to show in incoming/outgoing healing messages
	["scrollable"] = false,						-- Allows you to scroll frame lines with mousewheel
	["max_lines"] = 15,							-- Max lines to keep in scrollable mode(more lines = more memory)
	["time_visible"] = 3,						-- Time(seconds) a single message will be visible
	["stop_ve_spam"] = false,					-- Automaticly turns off healing spam for priests in shadowform
	["dk_runes"] = true,						-- Show deathknight rune recharge
	["killingblow"] = false,					-- Tells you about your killingblows
	["merge_aoe_spam"] = true,					-- Merges multiple aoe damage spam into single message
	["merge_aoe_spam_time"] = 3,				-- Time in seconds aoe spell will be merged into single message(works only with ["damage"] = true)
	["dispel"] = true,							-- Tells you about your dispels(works only with ["damage"] = true)
	["interrupt"] = true,						-- Tells you about your interrupts(works only with ["damage"] = true)
	["combat_text_font_size"] = 16,				-- 伤害字体尺寸
	["direction"] = "bottom",					-- 滚动方向
}

if(GetLocale()=="zhCN") then
	P["euiscript"].combatnoti_entering = "进入战斗状态"
	P["euiscript"].combatnoti_leaving = "离开战斗状态"
elseif (GetLocale()=="zhTW") then
	P["euiscript"].combatnoti_entering = "進入戰鬥狀態"
	P["euiscript"].combatnoti_leaving = "離開戰鬥狀態"
else
	P["euiscript"].combatnoti_entering = "ENTERING COMBAT"
	P["euiscript"].combatnoti_leaving = "LEAVING COMBAT"
end

E.ClickSets_Sets = {
	PRIEST = { --牧师
			["shift-type1"]	= 139,--"恢復",
			["ctrl-type1"]	= 527,--"驅散魔法",
			["alt-type1"]	= 2061,--"快速治療",
			["alt-ctrl-type1"]	= 2006,--"復活術",
			["type2"]		= 17,--"真言術:盾",
			["shift-type2"]	= 33076,--"癒合禱言",
			["ctrl-type2"]	= 528,--"驅除疾病", 
			["alt-type2"]	= 2060,--"強效治療術",
			["alt-ctrl-type2"]	= 32546,--"束縛治療",
			["type3"]		= 34861,--"治療之環",
			["shift-type3"] = 2050, --治疗术
			["alt-type3"] = 1706, --漂浮术
			["ctrl-type3"] = 21562,--耐
			["type4"] = 596, --治疗祷言
			["shift-type4"] = 47758, -- 苦修
			["ctrl-type4"] = 73325, -- 信仰飞跃	
			["type5"] = 48153, -- 守护之魂
			["shift-type5"] = 88625, -- 圣言术
			["ctrl-type5"] = 33206,--痛苦压制
	},
	
	DRUID = { --XD
			["shift-type1"]	= 774,--"回春術",
			["ctrl-type1"]	= 2782,--"净化腐蚀",
			["alt-type1"]	= 8936,--"癒合",
			["alt-ctrl-type1"]	= 50769,--"復活",
			["type2"]		= 48438,--"野性成长",
			["shift-type2"]	= 18562,--"迅捷治愈",
			["ctrl-type2"]	= 88423, -- 自然治愈
			["alt-type2"]	= 50464,--"滋補術",
			["alt-ctrl-type2"] = 1126, -- 野性印记
			["type3"]		= 33763,--"生命之花",
			["shift-type3"] = 5185,--治疗之触
			["ctrl-type3"] = 20484,--复生
			["alt-type3"] = 29166, --激活
	},
	SHAMAN = { --SM
			["alt-type1"]	= 8004,		--"治疗之拥",
			["shift-type1"]	= 974,		--"大地之盾",
			["ctrl-type1"]	= 1064,		--"治疗链",
			["alt-ctrl-type1"]	= 2008,	--"先祖之魂",
			["type2"]		= 61295,	--"激流",
			["alt-type2"]	= 331,		--"治疗波",
			["shift-type2"]	= 77472,	--"强效治疗波",
			["ctrl-type2"]	= 51886,	--"净化灵魂",
			["type3"]		= 1064,		--"治疗链",
			["shift-type3"] = 546, --水上漂
			["alt-type3"] = 131, --水下游
	},

	PALADIN = { --QS
			["shift-type1"]	= 635,--"聖光術",
			["alt-type1"]	= 19750,--"聖光閃現",
			["ctrl-type1"]	= 53563,--"圣光信标",
			["alt-ctrl-type1"]	= 7328,--"救贖",
		["type2"]		= 20473,--"神聖震擊",
			["shift-type2"]	= 82326,--"Divine Light",
			["ctrl-type2"]	= 4987,--"淨化術",
			["alt-type2"]	= 85673,--"Word of Glory",
			["alt-ctrl-type2"]	= 633,--"聖療術",
		["type3"]		= 31789,--正義防護
			["alt-type3"]	= 20217,--王者
			["shift-type3"]	= 20911,--庇護
			["ctrl-type3"]	= 19740,--力量
			["alt-ctrl-type3"] = 31789, -- 正义防御
		["type4"] = 1022, --保护之手
			["alt-type4"] = 1044, -- 自由之手
			["shift-type4"] = 1038, -- 拯救之手
			["ctrl-type4"] = 6940, -- 牺牲之手
	},

	WARRIOR = { --ZS
			["ctrl-type1"]	= 50720,--"戒備守護",
			["type2"]		= 3411,--"阻擾",
	},

	MAGE = { --FS
			["alt-type1"]	= 1459,--"秘法智力",
			["ctrl-type1"]	= 54646,--"专注",
			["type2"]		= 475,--"解除詛咒",
			["shift-type2"]	= 130,--"缓落",
	},

	WARLOCK = { --SS
			["alt-type1"]	= 80398,--"黑暗意图",
			["type2"]		= 5697,--"魔息",
	},

	HUNTER = { --LR
			["type2"]		= 34477,--"誤導",
			["shift-type2"] = 136, --治疗宠物
	},
	
	ROGUE = { --DZ
			["type2"]		= 57933,--"偷天換日",
	},
	
	DEATHKNIGHT = {
			["shift-type1"] = 61999, --战复
			["type2"] = 47541, --死缠
			["type3"] = 49016, -- 邪恶狂乱（邪恶天赋)
	},
	MONK = {
			["shift-type1"] = 115450, -- 化瘀术
			["alt-type1"]	= 116849, 
			["ctrl-type1"]	= 115175,
			["type2"]		= 124682,
			["alt-type2"]	= 116841,
			["shift-type2"]	= 115151,
	},	
}

local class = select(2, UnitClass("player"))

for k, v in pairs(E.ClickSets_Sets[class]) do
	if GetSpellInfo(v) then P["clickset"]['spec1'][string.gsub(k,"-","z")] = GetSpellInfo(v) end
	if GetSpellInfo(v) then P["clickset"]['spec2'][string.gsub(k,"-","z")] = GetSpellInfo(v) end
end

E.build = GetAddOnMetadata("EuiScript", "Version")