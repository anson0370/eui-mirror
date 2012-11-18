local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local CH = E:GetModule('Chat')

E.Options.args.chat = {
	type = "group",
	name = '06.'..L["Chat"],
	get = function(info) return E.db.chat[ info[#info] ] end,
	set = function(info, value) E.db.chat[ info[#info] ] = value end,
	args = {
		intro = {
			order = 1,
			type = "description",
			name = L["CHAT_DESC"],
		},		
		enable = {
			order = 2,
			type = "toggle",
			name = L["Enable"],
			get = function(info) return E.private.chat.enable end,
			set = function(info, value) E.private.chat.enable = value; E:StaticPopup_Show("PRIVATE_RL") end
		},
		lockPositions = {
			order = 6,
			type = 'toggle',
			name = L['Lock Positions'],
			desc = L['Attempt to lock the left and right chat frame positions. Disabling this option will allow you to move the main chat frame anywhere you wish.'],	
		},		
		panelBackdrop = {
			order = 3,
			type = 'select',
			name = L['Panel Backdrop'],
			desc = L['Toggle showing of the left and right chat panels.'],
			get = function(info) return E.db.chat.panelBackdrop end,
			set = function(info, value) E.db.chat.panelBackdrop = value; E:GetModule('Layout'):ToggleChatPanels(); E:GetModule('Chat'):PositionChat(true); end,
			values = {
				['HIDEBOTH'] = L['Hide Both'],
				['SHOWBOTH'] = L['Show Both'],
				['LEFT'] = L['Left Only'],
				['RIGHT'] = L['Right Only'],
			},
		},
		panelBackdropNameLeft = {
			order = 4,
			type = 'input',
			width = 'full',
			name = L['Panel Texture (Left)'],
			desc = L['Specify a filename located inside the World of Warcraft directory. Textures folder that you wish to have set as a panel background.\n\nPlease Note:\n-The image size recommended is 256x128\n-You must do a complete game restart after adding a file to the folder.\n-The file type must be tga format.\n\nExample: Interface\\AddOns\\ElvUI\\media\\textures\\copy\n\nOr for most users it would be easier to simply put a tga file into your WoW folder, then type the name of the file here.'],
			get = function(info) return E.db.chat.panelBackdropNameLeft end,
			set = function(info, value) 
				E.db.chat[ info[#info] ] = value
				E:UpdateMedia()
			end,
		},	
		panelBackdropNameRight = {
			order = 5,
			type = 'input',
			width = 'full',
			name = L['Panel Texture (Right)'],
			desc = L['Specify a filename located inside the World of Warcraft directory. Textures folder that you wish to have set as a panel background.\n\nPlease Note:\n-The image size recommended is 256x128\n-You must do a complete game restart after adding a file to the folder.\n-The file type must be tga format.\n\nExample: Interface\\AddOns\\ElvUI\\media\\textures\\copy\n\nOr for most users it would be easier to simply put a tga file into your WoW folder, then type the name of the file here.'],
			get = function(info) return E.db.chat.panelBackdropNameRight end,
			set = function(info, value) 
				E.db.chat[ info[#info] ] = value
				E:UpdateMedia()
			end,
		},			
		general = {
			order = 10,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {	
				url = {
					order = 1,
					type = 'toggle',
					name = L['URL Links'],
					desc = L['Attempt to create URL links inside the chat.'],
				},
				shortChannels = {
					order = 2,
					type = 'toggle',
					name = L['Short Channels'],
					desc = L['Shorten the channel names in chat.'],
				},	
				hyperlinkHover = {
					order = 3,
					type = 'toggle',
					name = L['Hyperlink Hover'],
					desc = L['Display the hyperlink tooltip while hovering over a hyperlink.'],
					set = function(info, value) 
						E.db.chat[ info[#info] ] = value 
						if value == true then
							CH:EnableHyperlink()
						else
							CH:DisableHyperlink()
						end
					end,
				},
				throttleInterval = {
					order = 4,
					type = 'range',
					name = L['Spam Interval'],
					desc = L['Prevent the same messages from displaying in chat more than once within this set amount of seconds, set to zero to disable.'],
					min = 0, max = 120, step = 1,
					set = function(info, value) 
						E.db.chat[ info[#info] ] = value 
						if value == 0 then
							CH:DisableChatThrottle()
						end
					end,					
				},
				scrollDownInterval = {
					order = 5,
					type = 'range',
					name = L['Scroll Interval'],
					desc = L['Number of time in seconds to scroll down to the bottom of the chat window if you are not scrolled down completely.'],
					min = 0, max = 120, step = 5,
					set = function(info, value) 
						E.db.chat[ info[#info] ] = value 
					end,					
				},	
				sticky = {
					order = 6,
					type = 'toggle',
					name = L['Sticky Chat'],
					desc = L['When opening the Chat Editbox to type a message having this option set means it will retain the last channel you spoke in. If this option is turned off opening the Chat Editbox should always default to the SAY channel.'],
					set = function(info, value)
						E.db.chat[ info[#info] ] = value 
					end,
				},
				fade = {
					order = 7,
					type = 'toggle',
					name = L['Fade Chat'],
					desc = L['Fade the chat text when there is no activity.'],
					set = function(info, value)
						E.db.chat[ info[#info] ] = value
						CH:UpdateFading()
					end,					
				},	
				chatHistory = {
					order = 8,
					type = 'toggle',
					name = L['Chat History'],
					desc = L['Log the main chat frames history. So when you reloadui or log in and out you see the history from your last session.'],
				},				
				autojoin = {
					order = 9,
					name = L["Auto join BigFootChannel"],
					type = "toggle",
					set = function(info, value)
						E.db.chat.autojoin = value
						if value then
							JoinTemporaryChannel(L["BigFootChannel"])
							ChatFrame_RemoveChannel(DEFAULT_CHAT_FRAME, L["BigFootChannel"])
							ChatFrame_AddChannel(DEFAULT_CHAT_FRAME, L["BigFootChannel"])							
						else
							SlashCmdList["LEAVE"](L["BigFootChannel"])
						end
					end,
				},	
				emotionIcons = {
					order = 10,
					type = 'toggle',
					name = L['Emotion Icons'],
					desc = L['Display emotion icons in chat.'],
					set = function(info, value)
						E.db.chat[ info[#info] ] = value 
					end,
				},	
				whisperSound = {
					order = 11,
					type = 'select', dialogControl = 'LSM30_Sound',
					name = L["Whisper Alert"],
					disabled = function() return not E.db.chat.whisperSound end,
					values = AceGUIWidgetLSMlists.sound,
					set = function(info, value) E.db.chat.whisperSound = value; end,
				},
				timeStampFormat = {
					order = 12,
					type = 'select',
					name = TIMESTAMPS_LABEL,
					desc = OPTION_TOOLTIP_TIMESTAMPS,
					values = {
						['NONE'] = NONE,
						["%I:%M "] = "03:27",
						["%I:%M:%S "] = "03:27:32",
						["%I:%M %p "] = "03:27 PM",
						["%I:%M:%S %p "] = "03:27:32 PM",
						["%H:%M "] = "15:27",
						["%H:%M:%S "] =	"15:27:32"					
					},
				},		
				editBoxPosition = {
					order = 13,
					type = 'select',
					name = L['Chat EditBox Position'],
					desc = L['Position of the Chat EditBox, if datatexts are disabled this will be forced to be above chat.'],
					values = {
						['BELOW_CHAT'] = L['Below Chat'],
						['ABOVE_CHAT'] = L['Above Chat'],
					},
					set = function(info, value) E.db.chat[ info[#info] ] = value; CH:UpdateAnchors() end,
					disabled = function() return not E.db.datatexts.leftChatPanel end,
				},				
				keywords = {
					order = 100,
					name = L['Keywords'],
					desc = L['List of words to color in chat if found in a message. If you wish to add multiple words you must seperate the word with a comma. To search for your current name you can use %MYNAME%.\n\nExample:\n%MYNAME%, ElvUI, RBGs, Tank'],
					type = 'input',
					width = 'full',
					set = function(info, value) E.db.chat[ info[#info] ] = value; CH:UpdateChatKeywords() end,
				},
				keywordSound = {
					order = 101,
					type = 'select', dialogControl = 'LSM30_Sound',
					name = L["Keyword Alert"],
					disabled = function() return not E.db.chat.keywordSound end,
					values = AceGUIWidgetLSMlists.sound,
					set = function(info, value) E.db.chat.keywordSound = value; end,
				},				
				sendRW = {
					order = 102,
					name = L['Send to Screen'],
					type = 'toggle',
					disabled = function() return not E.db.chat.keywordSound end,
				},
				spacer = {
					type = 'description',
					name = '',
					desc = '',
					order = 103,
				},				
				embedRight = {
					order = 200,
					type = 'select',
					name = L['Embedded Addon'],
					desc = L['Select an addon to embed to the right chat window. This will resize the addon to fit perfectly into the chat window, it will also parent it to the chat window so hiding the chat window will also hide the addon.'],
					disabled = function() return not IsAddOnLoaded("ElvUI_AddOnSkins") end,
					values = {
						["Skada"] = "Skada",
						["Recount"] = "Recount",
						["Omen"] = "Omen",
						["OmenRecount"] = "Omen+Recount",
						["TinyDPS"] = "TinyDPS",
						["None"] = "None",
					},
					get = function(info) 
						if E.private.skins.addons.EmbedSkada then return "Skada" end;
						if E.private.skins.addons.EmbedRecount then return "Recount" end;
						if E.private.skins.addons.EmbedOmen then return "Omen" end;
						if E.private.skins.addons.EmbedRO then return "OmenRecount" end;
						if E.private.skins.addons.EmbedTDPS then return "TinyDPS" end;						
						return "None"
					end,
					set = function(info, value)
						if value == "Skada" then
							E.private.skins.addons.EmbedSkada = true;
						elseif value == "Recount" then
							E.private.skins.addons.EmbedRecount = true;
						elseif value == "Omen" then
							E.private.skins.addons.EmbedOmen = true;
						elseif value == "OmenRecount" then
							E.private.skins.addons.EmbedRO = true;
						elseif value == "TinyDPS" then
							E.private.skins.addons.EmbedTDPS = true;
						elseif value == "None" then
							E.private.skins.addons.EmbedSkada = false;
							E.private.skins.addons.EmbedRecount = false;
							E.private.skins.addons.EmbedOmen = false;
							E.private.skins.addons.EmbedRO = false;
							E.private.skins.addons.EmbedTDPS = false;							
						end
						E:StaticPopup_Show("CONFIG_RL")
					end,
				},
				embedcombat = {
					order = 201,
					type = "toggle",
					name = L["embedcombat"],
					desc = L["embedcombat_desc"],
					set = function(info, value) E.private.skins.addons.EmbedOoC = value; E:StaticPopup_Show("PRIVATE_RL") end,
					get = function() return E.private.skins.addons.EmbedOoC end,
					disabled = function() return not IsAddOnLoaded("ElvUI_AddOnSkins") end,
				},					
			},
		},
		panel = {
			order = 20,
			type = "group",
			name = L['Panels'],
			guiInline = true,
			args = {
				leftpanelWidth = {
					order = 1,
					type = 'range',
					name = L["LEFT"].. L['Panel Width'],
					desc = L['PANEL_DESC'],
					set = function(info, value) E.db.chat.leftpanelWidth = value; E:GetModule('Chat'):PositionChat(true); local bags = E:GetModule('Bags'); bags:Layout(); bags:Layout(true); end,
					min = 150, max = 700, step = 1,
				},
				leftpanelHeight = {
					order = 2,
					type = 'range',
					name = L["LEFT"].. L['Panel Height'],
					desc = L['PANEL_DESC'],
					set = function(info, value) E.db.chat.leftpanelHeight = value; E:GetModule('Chat'):PositionChat(true); end,
					min = 100, max = 600, step = 1,
				},
				spacer = {
					type = 'description',
					name = '',
					desc = '',
					order = 3,
				},
				rightpanelWidth = {
					order = 4,
					type = 'range',
					name = L["RIGHT"].. L['Panel Width'],
					desc = L['PANEL_DESC'],
					set = function(info, value) E.db.chat.rightpanelWidth = value; E:GetModule('Chat'):PositionChat(true); local bags = E:GetModule('Bags'); bags:Layout(); bags:Layout(true); E:StaticPopup_Show("PRIVATE_RL") end,
					min = 150, max = 700, step = 1,
				},
				rightpanelHeight = {
					order = 5,
					type = 'range',
					name = L["RIGHT"].. L['Panel Height'],
					desc = L['PANEL_DESC'],
					set = function(info, value) E.db.chat.rightpanelHeight = value; E:GetModule('Chat'):PositionChat(true); E:StaticPopup_Show("PRIVATE_RL") end,
					min = 100, max = 600, step = 1,
				},
			},
		},
		fontGroup = {
			order = 120,
			type = 'group',
			guiInline = true,
			name = L['Fonts'],
			set = function(info, value) E.db.chat[ info[#info] ] = value; CH:SetupChat() end,
			args = {
				font = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 1,
					name = L["Font"],
					values = AceGUIWidgetLSMlists.font,
				},
				fontOutline = {
					order = 2,
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
				tabFont = {
					type = "select", dialogControl = 'LSM30_Font',
					order = 4,
					name = L["Tab Font"],
					values = AceGUIWidgetLSMlists.font,
				},
				tabFontSize = {
					order = 5,
					name = L["Tab Font Size"],
					type = "range",
					min = 6, max = 22, step = 1,
				},	
				tabFontOutline = {
					order = 6,
					name = L["Tab Font Outline"],
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
	},
}