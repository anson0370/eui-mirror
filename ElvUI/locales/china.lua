local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhCN")
if not L then return end

--Copy the entire english file here and set values = to something
--[[
	Where it says:
	L["Auto Scale"] = true
	
	That just means thats default, you can still set it to say something else like this
	L["Auto Scale"] = "Blah blah, speaking another language, blah blah"
	
	You can post the file here for it to be added to default ElvUI files: http://www.tukui.org/forums/forum.php?id=88
]]
--Static Popup
do
	L["You have changed your UIScale, however you still have the AutoScale option enabled in ElvUI. Press accept if you would like to disable the Auto Scale option."] = '你改变了UI缩放比率,但是你启用了EUI的自动缩放, 点确定将禁用自动缩放并重载界面.';
	L["One or more of the changes you have made require a ReloadUI."] = "一个或更多的改变,需要重载插件";
	L["A taint has occured that is preventing you from using your talents/glyphs, this can happen if you've inspected someone. Unfortionatly theres nothing we can do to fix it, please reload your ui and try again."] = "一个战斗污染发生在你查看天赋/幻化窗口时, 你可以输入/rl 重载界面.";
end

--General
do
	L['Dark'] = '黑暗';
	L["High Resolution"] = '高分辨率';
	L['Low Resolution'] = '低分辨率';
	L['Nudge'] = '微调';
	L['Location Text'] = '地区文字';
	L['Change settings for the display of the location text that is on the minimap.'] = '改变小地图上地区名称文字显示方式';
	L['Minimap Mouseover'] = '鼠标滑过显示';
	L['Always Display'] = '总是显示';
	L['Hide'] = '隐藏';
	L['Top Panel'] = '顶部面板';
	L['Display a panel across the top of the screen. This is for cosmetic only.'] = '显示跨越屏幕顶部的面板,仅仅是用于装饰';
	L['Bottom Panel'] = '底部面板';
	L['Display a panel across the bottom of the screen. This is for cosmetic only.'] = '显示跨越屏幕底部的面板,仅仅是用于装饰';
	L["Menu"] = '主菜单';
	L["RaidTool"] = '团队工具';
	L["Shortcuts"] = '快捷操作';
	L["UF Style"] = '框体样式';
	L["AB Style"] = '动作条样式';
	L["Name Font"] = '名字字体';
	L["The font that appears on the text above players heads. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"] = '这控制玩家头顶上名字的字体.|cffFF0000警告:这需要重新进入游戏才能生效.|r';
	L['Enable/Disable the minimap. |cffFF0000Warning: This will prevent you from seeing the consolidated buffs bar, and prevent you from seeing the minimap datatexts.|r'] = "启用/禁用小地图, |cffFF0000警告: 这将影响到综合BUFF条的显示和小地图下面的信息文字显示";
	L["Version"] = true;
	L["Enable"] = "启用";

	L["General"] = "一般设置";
	L["ELVUI_DESC"] = "EUI [ElvUI-Edit] 是一个用来替换WOW原始插件的用户界面. http://eui.cc";
	L["Auto Scale"] = "自动缩放";
		L["Automatically scale the User Interface based on your screen resolution"] = "根据你的分辨率自动缩放UI界面";
	L["UI Scale"] = "UI缩放比例";
		L["Controls the scaling of the entire User Interface"] = "缩放用户界面缩放比例";
	L["None"] = "无";
	L["You don't have permission to mark targets."] = "你没有权限标志目标";
	L['LOGIN_MSG'] = '欢迎使用 %sEUI [ElvUI-Edit]|r 版本 %s%s|r, 键入 /ec 来访问设置界面. 如果你需要技术支持请访问 http://www.eui.cc';
	L['Login Message'] = "登陆信息";
	
	L["Reset Anchors"] = "重设位置";
	L["Reset all frames to their original positions."] = "重新设置所有框体到它们的默认位置";
	
	L['Install'] = "安装";
	L['Run the installation process.'] = "运行安装进程";
	
	L["Credits"] = "创作组";
	L['ELVUI_CREDITS'] = "我想用一个特别的方式感谢那些测试,翻译和通过捐助帮助我的人. 请捐助过的人在论坛中PM给我, 我将把你的名字添加到这儿."
	L['Coding:'] = "翻译";
	L['Testing:'] = "测试";
	L['Donations:'] = "捐助";
	
	--Installation
	L["Welcome to ElvUI version %s!"] = "欢迎使用 EUI [ElvUI-Edit] 版本 %s";
	L["This install process will help you learn some of the features in ElvUI has to offer and also prepare your user interface for usage."] = "此安装过程将帮助你了解 EUI [ElvUI-Edit] 特性";
	L["The in-game configuration menu can be accesses by typing the /ec command or by clicking the 'C' button on the minimap. Press the button below if you wish to skip the installation process."] = "内建的设置界面可以通过 /ec 命令来访问, \n或点击小地图旁边的 C 按钮来打开. \n如果你想跳过安装过程按下面的按钮";
	L["Please press the continue button to go onto the next step."] = "请按继续按钮到下一步";
	L["Skip Process"] = "跳过";
	L["ElvUI Installation"] = "EUI [ElvUI-Edit] 安装";
	
	L["CVars"] = true;
	L["This part of the installation process sets up your World of Warcraft default options it is recommended you should do this step for everything to behave properly."] = "此步骤是来改变你的WOW一些默认设置";
	L["Please click the button below to setup your CVars."] = "请点击下面的按钮设置 CVars";
	L["Setup CVars"] = "设置 CVars";
	
	L["Importance: |cff07D400High|r"] = "重要性: |cff07D400高|r";
	L["Importance: |cffD3CF00Medium|r"] = "重要性: |cffD3CF00中|r";

	L["Chat"] = "聊天";
	L["This part of the installation process sets up your chat windows names, positions and colors."] = "此部份的安装将会设置你聊天框的名字,位置和颜色";
	L["The chat windows function the same as Blizzard standard chat windows, you can right click the tabs and drag them around, rename, etc. Please click the button below to setup your chat windows."] = "此聊天框与WOW原始聊天框功能相似的, 你可以拖拉标签来移动或重命名等. 请点击下面的按钮设置你的聊天窗口.";
	L["Setup Chat"] = "设置聊天框";
	L['AutoHide Panels'] = "自动隐藏面板";
	L['When a chat frame does not exist, hide the panel.'] = "当聊天框不存在时,自动隐藏面板";
	
	L["Installation Complete"] = "安装过程";
	L["You are now finished with the installation process. Bonus Hint: If you wish to access blizzard micro menu, middle click on the minimap. If you don't have a middle click button then hold down shift and right click the minimap. If you are in need of technical support please visit us at www.tukui.org."] = "你已经完成安装过程. 如果你要访问WOW的系统菜单, 请在小地图上按鼠标中键, 如果你没有中键, 可按住Shift键右击小地图. 如需技术支持请访问 www.eui.cc.";
	L["Please click the button below so you can setup variables and ReloadUI."] = "请点击下面的按钮设置变量并重载界面";
	L["Finished"] = "完成";
	L["CVars Set"] = "CVars 设置";
	L["Chat Set"] = "聊天设置";
	L['Trade'] = "交易";
	
	L['Panels'] = "面板(聊天框)";
	L['Announce Interrupts'] = "打断通告";
	L['Announce when you interrupt a spell to the specified chat channel.'] = "在指定频道通报技能打断信息";	
	L["Movers unlocked. Move them now and click Lock when you are done."] = "移动锁定. 现在可以移动它们移好了点击锁定.";
	L['Lock'] = "锁定";	
	L["This can't be right, you must of broke something! Please turn on lua errors and report the issue to Elv http://www.tukui.org/forums/forum.php?id=146"] = "请到界面帮助里打开显示LUA错误,并把错误报告给我 http://www.eui.cc";
	
	L['Panel Width'] = "面板宽度";
	L['Panel Height'] = "面板高度";
	L['PANEL_DESC'] = '调整左右聊天框的尺寸, 这会影响到你的聊天和背包.';
	L['URL Links'] = "网址链结";
	L['Attempt to create URL links inside the chat.'] = "在聊天框中创建超链结";
	L['Short Channels'] = "频道名缩写";
	L['Shorten the channel names in chat.'] = "缩短聊天频道的名字";
	L["Are you sure you want to reset every mover back to it's default position?"] = "你确信你想重置移动的框体到它的默认位置?";
	
	L['Panel Backdrop'] = "聊天框背景";
	L['Toggle showing of the left and right chat panels.'] = "控制左右聊天框背景显示的开关";
	L['Hide Both'] = "全部隐藏";
	L['Show Both'] = "全部显示";
	L['Left Only'] = "只显示左边";
	L['Right Only'] = "只显示右边";
	
	L['Tank'] = "坦克";
	L['Healer'] = "治疗";
	L['Physical DPS'] = "物理DPS";
	L['Caster DPS'] = "法系DPS";
	L["Primary Layout"] = "第一样式";
	L["Secondary Layout"] = "第二样式";
	L["Primary Layout Set"] = "第一样式设置";
	L["Secondary Layout Set"] = "第二样式设置";
	L["You can now choose what layout you wish to use for your primary talents."] = "你能为你的主天赋选择样式.";
	L["You can now choose what layout you wish to use for your secondary talents."] = "你能为你的副天赋选择样式.";
	L["This will change the layout of your unitframes, raidframes, and datatexts."] = "这些将改变你的头像框体,团队框体和信息文字.";
	
	L['INCOMPATIBLE_ADDON'] = "插件 %s 不兼容与EUI的 %s 模块。请禁用插件或模块.";
	
	L['Panel Texture (Left)'] = "左面板材质";
	L['Panel Texture (Right)'] = "右面板材质";
	L['Specify a filename located inside the World of Warcraft directory. Textures folder that you wish to have set as a panel background.\n\nPlease Note:\n-The image size recommended is 256x128\n-You must do a complete game restart after adding a file to the folder.\n-The file type must be tga format.\n\nExample: Interface\\AddOns\\ElvUI\\media\\textures\\copy\n\nOr for most users it would be easier to simply put a tga file into your WoW folder, then type the name of the file here.'] = "为聊天面板的背景指定一个材质文件.\n\n请注意: \n -建议图像大小为256*128\n -添加文件到文件夹后请重新启动游戏.\n -文件类型必须是TGA格式\n -举例: \n   Interface\\Addons\\Euiscript\\1 \n   Interface\\Addons\\Euiscript\\2 \n\n -对于大多数用户会更容易简单地把一个TGA文件放到你的魔兽文件夹，然后键入文件名。";
	L["Are you sure you want to disband the group?"] = "你确信要解散队伍么?";
	
	L["Your version of ElvUI is out of date. You can download the latest version from www.tukui.org"] = "已检测到新版本的 EUI，请使用自动更新器获取最新版本或访问 www.eui.cc";
	
	L["Primary Texture"] = "主材质"
	L["The texture that will be used mainly for statusbars."] = "此材质将被应用于主要的状态条."
	L["Secondary Texture"] = "次材质"
	L["This texture will get used on objects like chat windows and dropdown menus."] = "此材质将被应用于聊天窗口和下拉菜单类."
	L['Accept Invites'] = "自动接受邀请";
	L['Automatically accept invites from guild/friends.'] = "自动接受来自公会/好友的组队邀请";
	L["Classcolor Theme"] = "职业色主题";
	L["Transparent Theme"] = "透明主题";
	L["Transparent Theme desc"] = "开启后单位框体的能量条偏移样式会失效,建议关闭血量按数值变化,修改生命值颜色为红色";
	L["One or more of the changes you have made will effect all characters using this addon. You will have to reload the user interface to see the changes you have made."] = "一个或更多的变更将影响使用此插件的所有角色, 你必需重新载入UI才能生效.";
	L["Layout"] = "布局";
	L["You can now choose what layout you wish to use based on your combat role."] = "你现在能选择一个符合你身份的布局";
	L["Resolution"] = "分辨率";
	L["Your current resolution is %s, this is considered a %s resolution."] = "你的当前分辨率是 %s, 这是一个 %s 分辨率.";
	L["high"] = "高";
	L["low"] = "低";
	L["Click the button below to resize your chat frames, unitframes, and reposition your actionbars."] = "点击下面的按钮将调整你的聊天框, 单位框体和动作条位置";
	L["Resolution Setup"] = "分辨率设置";
	L["This resolution requires that you change some settings to get everything to fit on your screen."] = "当前分辨率需你改变一些设置来适应你的屏幕";
	L["This resolution doesn't require that you change settings for the UI to fit on your screen."] = "当前分辨率无需调整就能适应你的屏幕";
	L["Importance: |cffFF0000Low|r"] = "重要性: |cffFF0000低|r";
	L["This is completely optional."] = "这是一个可选操作";
	L["You may need to further alter these settings depending how low you resolution is."] = "你可能需要进一步修改设置来适应这么低的分辨率.";
	L["Resolution Style Set"] = "分辨率样式设置";
	L['Layout Set'] = "布局设置";
	L['Minimap Size'] = "小地图尺寸";
	L['Adjust the size of the minimap.'] = "调整小地图的尺寸";
	L['Raid Reminder'] = "副本BUFF提示";
	L['Display raid reminder bar on the minimap.'] = "在小地图旁边显示副本BUFF提示条";
	L['Detected either the Routes or GatherMate2 addon running, if you wish to use these addons with ElvUI you must type the /farmmode command.'] = "检测到采集插件Routs,GatherMate2运行,你必需使用/farmmode模式下的小地图来显示采集点"
	L['Grid Size:'] = "网格尺寸:";
	L['Aura perRow'] = "每行Buff/Debuff的数量";
	L["BN:"] = true;
	L['Profile Binds'] = "配置绑定";
	L['Save your keybinds with your ElvUI profile. That way if you have the dual spec feature enabled in ElvUI you can swap keybinds with your specs.'] = "保存快捷键绑定到你的配置文件中. 如果你开启双天赋切换的话,将会随着天赋切换你的快捷键设置";
	L['Chat Bubbles'] = "聊天泡泡";
	L['Skin the blizzard chat bubbles.'] = "美化暴雪聊天泡泡";
	L['Multisample Fix'] = "多重采样修正";
	L['Attempt to fix blurry borders when using a multisample setting that is greater than one. |cffFF0000WARNING: This is extremely experimental and may cause issues with gameplay.|r'] = '尝试来解决当多重采样设置大于1时发生的边框模糊问题. |cffFF0000警告: 此选项为实验功能, 可能导致游戏异常.|r';
	L['|cFFE30000Lua error recieved. You can view the error message when you exit combat.'] = '|cFFE30000LUA错误已接收, 退出战斗后显示.|r';
	L["%s: %s tried to call the protected function '%s'."] = "%s: %s 尝试调用保护函数 '%s'.";
	L["No locals to dump"] = true;
	L["First"] = "第一个";
	L["Last"] = "最后";
	L['Minimap Panels'] = "小地图信息条";
	L['Display minimap panels below the minimap, used for datatexts.'] = "在小地图下方显示一个信息条用来放置信息文字";		
	L["A setting you have changed will change an option for this character only. This setting that you have changed will be uneffected by changing user profiles. Changing this setting requires that you reload your User Interface."] = "您已更改的设置将改变这个角色的一个选项，您需要重新加载你的用户界面.";
	L['Theme Set'] = "主题设置";
	L['Theme Setup'] = "设置主题";
	L['Choose a theme layout you wish to use for your initial setup.'] = "选择一个主题样式为你的初始设置";
	L['You can always change fonts and colors of any element of elvui from the in-game configuration.'] = "你能在EUI的设置中改变字体,颜色等选项";
	L['Classic'] = "经典";
	L['Classic Pixel'] = true;
	L['Toggle Chat Frame'] = "开关聊天框";
	L['Toggle Embedded Addon'] = "开关内嵌插件";
	L['Left Click:'] = "左键:";
	L['Right Click:'] = "右键:";	
	L['Toggle Tutorials'] = "教学开关";	
	L['Config Mode:'] = "设置模式:";
	L["Auras Set"] = "光环设置";
	L["Auras System"] = "光环系统";
	L["Select the type of aura system you want to use with ElvUI's unitframes. The integrated system utilizes both aura-bars and aura-icons. The icons only system will display only icons and aurabars won't be used."] = '选择你要显示在单位框体上的光环系统, "综合"将显示图标和光环条, "图标"将只显示图标,不显示光环条.';
	L["If you have an icon or aurabar that you don't want to display simply hold down shift and right click the icon for it to disapear."] = "如果你有一个图标或光环条不想显示的话,只需按住shift 并右击它的图标即可.";
	L['Integrated'] = '综合';
	L['Icons Only'] = '图标';
	L["Because of the mass confusion caused by the new aura system I've implemented a new step to the installation process. This is optional. If you like how your auras are setup go to the last step and click finished to not be prompted again."] = "为了防止新的光环条引起的混乱,我准备了一个新的安装步骤, 在安装过程中,这是可选的.";	
end

--Aura
do
	L['Remaining Time'] = '剩余时间';
	L['consolidateTo'] = '收集综合BUFF';
	L['Consolidated buffs will be consolidate to consolideBuffs'] = '将收集综合BUFF到综合BUFF条中';
	L['Filter Consolidated'] = '过滤综合BUFF';
	L['Only show consolidated icons on the consolidated bar that your class/spec is interested in. This is useful for raid leading.'] = '只显示与你职业和天赋相关的综合BUFF图标';
	L['AURAS_DESC'] = '配置出现在小地图附近的BUFF/DEBUFF.';
	L['Consolidated Buffs'] = '综合BUFF';
	L['Display the consolidated buffs bar.'] = '显示综合BUFF条';
	L['Set the size of the individual auras.'] = '设置个人光环尺寸';
	L['Wrap After'] = '每行数目';
	L['Begin a new row or column after this many auras.'] = '在多少个BUFF/DEBUFF后换行';
	L['X Spacing'] = '水平间隔';
	L['Y Spacing'] = '垂直间隔';
	L['Sort Method'] = '排序方式';
	L['Defines how the group is sorted.'] = '定义的组进行排序';
	L['Index'] = '索引'
	L['Time'] = '时间';
	L['Name'] = '名称';
	L['Sort Direction'] = '排序方向';
	L['Defines the sort order of the selected sort method.'] = '定义所选排序方法的排序顺序';
	L['Max Wraps'] = '最大行数';
	L['Limit the number of rows or columns.'] = '限制行或列的数量';
	L['Seperate'] = '分离式';
	L['Indicate whether buffs you cast yourself should be separated before or after.'] = '你施放的BUFF在前面或后面分开';
	L["Other's First"] = '其它的第一';
	L['No Sorting'] = '不排序';
	L['Your Auras First'] = '你第一个光环';
	L["Fade Threshold"] = '变化阀值'
	L['Threshold before text changes red, goes into decimal form, and the icon will fade. Set to -1 to disable.'] = '变成红色文字前的阀值,进入小数形式, 图标会闪烁. 设置为 -1 禁用'
end

--Media
do	
	L["Media"] = "材质字体";
	L["Fonts"] = "字体";
	L["Font Size"] = "字体尺寸";
		L["Set the font size for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"] = "设置界面上所有字体尺寸,但不影响到那些有独立设置的(如单位框体字体,信息文字字体等...)";
	L["Default Font"] = "默认字体";
		L["The font that the core of the UI will use."] = "此字体是界面的核心字体";
	L["UnitFrame Font"] = "单位框体字体";
		L["The font that unitframes will use"] = "此字体被单位框体使用";
	L["CombatText Font"] = "战斗文字字体";
		L["The font that combat text will use. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"] = "此字体被战斗文件使用, |cffFF0000需要重新启用游戏或重登录才会生效.|r";
	L["Textures"] = "材质";
	L["StatusBar Texture"] = "状态条材质";
		L["Main statusbar texture."] = "主状态条材质";
	L["Gloss Texture"] = "光亮材质";
		L["This gets used by some objects."] = "只被一些目标使用";
	L["Colors"] = "颜色";
	L["Border Color"] = "边框颜色";
		L["Main border color of the UI."] = "界面主边框颜色";
	L["Backdrop Color"] = "背景颜色";
		L["Main backdrop color of the UI."] = "界面主背景色";
	L["Backdrop Faded Color"] = "背景透明色";
		L["Backdrop color of transparent frames"] = "透明框体的背景颜色";
	L["Restore Defaults"] = "恢复默认";
		
	L["Toggle Anchors"] = "解锁开关";
	L["Unlock various elements of the UI to be repositioned."] = "解锁界面上的各种元件用来移动位置";
	
	L["Value Color"] = "数值颜色";
	L["Color some texts use."] = "一些字段使用的颜色";
end

--NamePlate Config
do
	L['Mistweaver'] = '织雾';
	L['Background Multiplier'] = "背景色透明度";
	L['The backdrop of the nameplates color is scaled to match the color of the nameplate by this percentage. Set to zero to have no color in the nameplate backdrop.'] = "姓名版背景色透明度, 设为0时姓名版背景没有颜色(黑色)";
	L["NamePlates"] = "姓名版";
	L["NAMEPLATE_DESC"] = "修改姓名版设置.";
	L["Width"] = "宽度";
		L["Controls the width of the nameplate"] = "控制姓名版的宽度";
	L["Height"] = "高度";
		L["Controls the height of the nameplate"] = "控制姓名版的高度";
	L["Good Color"] = "安全色";
		L["This is displayed when you have threat as a tank, if you don't have threat it is displayed as a DPS/Healer"] = "做为坦克时获得仇恨, 或做为DPS/治疗时没有获得仇恨的颜色";
	L["Bad Color"] = "危险色";
		L["This is displayed when you don't have threat as a tank, if you do have threat it is displayed as a DPS/Healer"] = "做为坦克时未获得仇恨, 或做为DPS/治疗时获得仇恨的颜色";
	L["Good Transition Color"] = "安全过渡色";
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when gaining threat, for a dps/healer it would be displayed when losing threat"] = "做为坦克将获得仇恨,或做为DPS/治疗将丢失仇恨时显示的颜色";
	L["Bad Transition Color"] = "危险过渡色";
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when losing threat, for a dps/healer it would be displayed when gaining threat"] = "做为坦克将丢失仇恨,或做为DPS/治疗将获得仇恨";	
	L["Castbar Height"] = "施法条高度";
		L["Controls the height of the nameplate's castbar"] = "控制姓名版施法条的高度";
	L["Health Text"] = "生命值";
		L["Toggles health text display"] = "生命值显示开关";
	L["Personal Debuffs"] = "个人Debuff";
		L["Display your personal debuffs over the nameplate."] = "在姓名版上显示你个人的Debuffs";
	L["Display level text on nameplate for nameplates that belong to units that aren't your level."] = "在姓名版上显示该单位的等级,不是你的等级";
	L["Enhance Threat"] = "仇恨增强";
		L["Color the nameplate's healthbar by your current threat, Example: good threat color is used if your a tank when you have threat, opposite for DPS."] = "根据你的天赋改变姓名版血条的颜色";
	L["Combat Toggle"] = "战斗切换";
		L["Toggles the nameplates off when not in combat."] = "不在战斗时自动关闭姓名版";
	L["Friendly NPC"] = "友好的NPC";
	L["Friendly Player"] = "友好的玩家";
	L["Neutral"] = "中立";
	L["Enemy"] = "敌对";
	L["Threat"] = "仇恨";
	L["Reactions"] = "声望";
	L["Filters"] = "过滤";
	L['Add Name'] = "添加名字";
	L['Remove Name'] = "删除名字";
	L['Use this filter.'] = "使用过滤器";
	L["You can't remove a default name from the filter, disabling the name."] = "你不能删除过滤器的默认名字, 禁用此名字";
	L['Hide'] = "隐藏";
		L['Prevent any nameplate with this unit name from showing.'] = "阻止此单位名字的姓名版显示";
	L['Custom Color'] = "定制颜色";
		L['Disable threat coloring for this plate and use the custom color.'] = "禁用仇恨颜色,并使用定制颜色";
	L['Custom Scale'] = "定制比例";
		L['Set the scale of the nameplate.'] = "设置姓名版的缩放比例";
	L['Good Scale'] = "安全比例";
	L['Bad Scale'] = "危险比例";
	L["Auras"] = "光环";
	L['Healer Icon'] = "治疗标志";
	L['Display a healer icon over known healers inside battlegrounds.'] = "在战场上显示治疗标志";
	L['Restoration'] = "恢复";
	L['Holy'] = "神圣";
	L['Discipline'] = "戒律";
	L['Filter already exists!'] = "过滤器已存在!";
	L['Low Health Warning'] = '低生命值警报';
	L['Color the border of the nameplate yellow when it reaches the threshold point on these types of frames.'] = true;
	L['Players'] = "玩家";
	L['Low Health Threshold'] = "低生命值阀值";
	L['Color the border of the nameplate yellow when it reaches this point, it will be colored red when it reaches half this value.'] = true;
end

--ClassTimers
do
	L['ClassTimers'] = "职业计时条";
	L["CLASSTIMER_DESC"] = '在玩家和目标框体上显示 buff/debuff 信息.\n建议不要和技能监视同时开启.';
	
	L['Player Anchor'] = "玩家锚点";
	L['What frame to anchor the class timer bars to.'] = "职业计时条依附的框体.";
	L['Target Anchor'] = "目标锚点";
	L['Trinket Anchor'] = "饰品锚点";
	L['Player Buffs'] = "玩家 Buffs";
	L['Target Buffs']  = "目标 Buffs";
	L['Player Debuffs'] = "玩家 Debuffs";
	L['Target Debuffs']  = "目标 Debuffs";
	L['Player'] = "玩家";
	L['Target'] = "目标";
	L['Trinket'] = "饰品";
	L['Procs'] = "特效";
	L['Any Unit'] = "任意人(施放)";
	L['Unit Type'] = "单元类型";	
	L["Buff Color"] = "Buff 颜色";
	L["Debuff Color"] = "Debuff 颜色";
	L['You have attempted to anchor a classtimer frame to a frame that is dependant on this classtimer frame, try changing your anchors again.'] = "你尝试定位职业计时条在它自身上, 请改变你的锚点";
	L['Remove Color'] = "删除颜色";
	L['Reset color back to the bar default.'] = "重设颜色为默认值";
	L['Add SpellID'] = "添加技能ID";
	L['Remove SpellID'] = "删除技能ID";
	L['You cannot remove a spell that is default, disabling the spell for you however.'] = "你不能删除默认内置的技能, 可以禁用它";
	L['Spell already exists in filter.'] = "技能在过滤器中已经存在";
	L['Spell not found.'] = "未找到此技能.";
	L["All"] = "所有人";
	L["Friendly"] = "友方";
	L["Enemy"] = "敌方";	
end

--oUF_AuraBar
do	
	L['The spell "%s" has been added to the DebuffBlacklist unitframe filter.'] = '技能 "%s" 将加被添加单位框体过滤器的DEBUFF黑名单中';
	L['Aura Bars'] = '光环条';
	L['The object you want to attach to.'] = '你想目标依附到哪';
	L['No Duration'] = '无持续时间';
	L['Allow displaying of aura bars that do not have a duration.'] = '允许显示无持续时间的光环条';
	L['No Consolidated'] = true;
	L['Allow displaying of aura bars that are considered consolidated by Blizzard.'] = true;
	L['Above'] = '上面';
	L['Below'] = '下面';	
end
	
--ACTIONBARS
do
	L['Out of Range'] = "超出距离的颜色";
	L['Color of the actionbutton when out of range.'] = "当超出距离时动作条按键的颜色";
	L['Out of Power'] = "能量不足的颜色";
	L['Color of the actionbutton when out of power (Mana, Rage, Focus, Holy Power).'] = "当能量不足时（如法力，怒力等）动作条按键的颜色";
	L["Delete Actionbar Layout DB"] = "删除配置存档";
	L["Actionbar layout db is delete!"] = "动作条按键配置已经删除！";
	L["Output Actionbar layout"] = "导出动作条按键配置";
	L["Input Actionbar layout"] = "导入动作条按键配置";
	L["Actionbar Layout Save and Load"] = "动作条按键配置保存和读取";
	L["Save Actionbar Layout"] = "保存配置";
	L["Load Actionbar Layout"] = "读取配置";
	L["Actionbar layout is saved!"] = "动作条按键配置已保存!";
	L["Actionbar layout load success!"] = "动作条按键配置已恢复成功!";
	L['Remove Bar %d Action Page'] = true;
	--HOTKEY TEXTS
	L['KEY_SHIFT'] = 'S';
	L['KEY_ALT'] = 'A';
	L['KEY_CTRL'] = 'C';
	L['KEY_MOUSEBUTTON'] = 'M';
	L['KEY_MOUSEWHEELUP'] = 'MU';
	L['KEY_MOUSEWHEELDOWN'] = 'MD';
	L['KEY_BUTTON3'] = 'M3';
	L['KEY_NUMPAD'] = 'N';
	L['KEY_PAGEUP'] = 'PU';
	L['KEY_PAGEDOWN'] = 'PD';
	L['KEY_SPACE'] = 'SpB';
	L['KEY_INSERT'] = 'Ins';
	L['KEY_HOME'] = 'Hm';
	L['KEY_DELETE'] = 'Del';
	L['KEY_MOUSEWHEELUP'] = 'MwU';
	L['KEY_MOUSEWHEELDOWN'] = 'MwD';

	--BLIZZARD MODIFERS TO SEARCH FOR
	L['KEY_LOCALE_SHIFT'] = '(SHIFT%-)';
	L['KEY_LOCALE_ALT'] = '(ALT%-)';
	L['KEY_LOCALE_CTRL'] = '(CTRL%-)';
	
	--KEYBINDING
	L["Hover your mouse over any actionbutton or spellbook button to bind it. Press the escape key or right click to clear the current actionbutton's keybinding."] = "移动鼠标到动作条或技能书按钮上绑定快捷键. 按ESC或右击按钮取消当前绑定";
	L['Save'] = "保存";
	L['Discard'] = "取消";
	L['Binds Saved'] = "保存绑定";
	L['Binds Discarded'] = "取消绑定";
	L["All keybindings cleared for |cff00ff00%s|r."] = "取消 |cff00ff00%s|r 所有绑定的快捷键.";
	L[" |cff00ff00bound to |r"] = true;
	L["No bindings set."] = "无绑定设置";
	L["Binding"] = "绑定";
	L["Key"] = "键";	
	L['Trigger'] = true;
	
	--CONFIG	
	L["ActionBars"] = "动作条";
		L["Keybind Mode"] = "快捷键绑定模式";
		
	L['Macro Text'] = "宏名字";
		L['Display macro names on action buttons.'] = "在动作条按钮上显示宏名字";
	L['Keybind Text'] = "快捷键";
		L['Display bind names on action buttons.'] = "在动作条按钮上显示快捷键名字";
	L['Button Size'] = "按钮尺寸";
		L['The size of the action buttons.'] = "动作条按钮尺寸";
	L['Button Spacing'] = "按钮间距";
		L['The spacing between buttons.'] = "两个按钮之间的距离";
	L['Bar '] = "动作条 ";
	L['Backdrop'] = "背景";
		L['Toggles the display of the actionbars backdrop.'] = "动作条显示背景框的开关";
	L['Buttons'] = "按钮数";
		L['The amount of buttons to display.'] = "显示多少个动作条按钮";
	L['Buttons Per Row'] = "每行按钮数";
		L['The amount of buttons to display per row.'] = "每行显示多少个按钮数";
	L['Anchor Point'] = "锚点方向";
		L['The first button anchors itself to this point on the bar.'] = "第一个按钮对齐动作条的方向";
	L['Height Multiplier'] = "高度倍增";
	L['Width Multiplier'] = "宽度倍增";
		L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'] = "根据此值增加背景的高度或宽度. 一般用来在一个背景框里放置多条动作条";
	L['Action Paging'] = "动作条翻页";
		L["This works like a macro, you can run different situations to get the actionbar to page differently.\n Example: '[combat] 2;'"] = "和宏一样工作, 能根据你不同的状态得到不同的动作条翻页.\n 比如: '[combat] 2;'";
	L['Visibility State'] = "可见状态";
		L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"] = "和宏一样工作, 能根据你不同的状态使动作条显示或隐藏.\n 比如: '[combat] show;hide'";
	L['Restore Bar'] = "还原动作条";
		L['Restore the actionbars default settings'] = "恢复此功能条的默认设置";
		L['Set the font size of the action buttons.'] = "设置此动作条按钮的字体尺寸";
	L['Mouse Over'] = "鼠标划过显示";
		L['The frame is not shown unless you mouse over the frame.'] = "此框体不显示,直到鼠标经过框体时";
	L['Pet Bar'] = "宠物动作条";
	L['Alt-Button Size'] = "小按钮尺寸";
		L['The size of the Pet and Shapeshift bar buttons.'] = "宠物动作条和姿态条按钮尺寸";
	L['Stance Bar'] = "姿态条";
	L['Cooldown Text'] = "冷却文字";
		L['Display cooldown text on anything with the cooldown spiril.'] = "显示技能冷却时间";
	L['Low Threshold'] = "低门槛";
		L['Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red'] = "低于此门槛的文字将转为红色并显示小数. 设为 -1 则不会变为红色";
	L['Expiring'] = "到期";
		L['Color when the text is about to expire'] = "即将到期的文字颜色";
	L['Seconds'] = "秒";
		L['Color when the text is in the seconds format.'] = "以秒显示时的文字颜色";
	L['Minutes'] = "分";
		L['Color when the text is in the minutes format.'] = "以分显示时的文字颜色";
	L['Hours'] = "时";
		L['Color when the text is in the hours format.'] = "以小时显示时的文字颜色";
	L['Days'] = "天";
		L['Color when the text is in the days format.'] = "以天显示时的文字颜色";
	L['Totem Bar'] = "图腾条";
	L['Action Mode'] = "按键模式";
	L['Use the button when clicking or pressing the keybind on the keydown motion or on the keyup motion.'] = "当你点击或按下快捷键是按下还是松开时执行这个按钮";	
	L['Max Paging'] = "最大翻页";
	L['When enabled the main actionbar will use the maximum amount of pages available. This means if you have another actionbar disabled, the actionbar page will become available on the main actionbar. Having this disabled will limit the main actionbar to two pages.'] = "主动作条最大翻页特性. 如果禁用其它动作条, 他们将会在主动作条的翻页中出现,如果禁用此选项, 主动作条只能翻两页";
	L['Micro Bar'] = "微型系统菜单条"
	L['Alpha'] = "透明度"
	L['Change the alpha level of the frame.'] = "改变框体的透明等级"
	L['The button you must hold down in order to drag an ability to another action button.'] = "按住某个键后才能拖动动作条的按钮";
	L['Key Down'] = '按下键施法';
end

--UNITFRAMES
do
	L['By Type'] = '按类型';
	L['Color aurabar debuffs by type.'] = '按DEBUFF类型彩色化光环条';
	L['TOPLEFT'] = '左上';
	L['LEFT'] = '左';
	L['BOTTOMLEFT'] = '左下';
	L['RIGHT'] = '右';
	L['TOPRIGHT'] = '右上';
	L['BOTTOMRIGHT'] = '右下';
	L['CENTER'] = '中间';
	L['TOP'] = '顶部';
	L['BOTTOM'] = '底部';
	L["Affliction"] = "痛苦";
	L["Demonology"] = "恶魔";
	L["Destruction"] = "毁灭";
	L['Interruptable'] = "可打断颜色";
	L['Non-Interruptable'] = "不可打断颜色";
	L['Harmony'] = "真气";
	L['Blood'] = "鲜血符文";
	L['Unholy'] = "邪恶符文";
	L['Frost'] = "冰霜符文";
	L['Death'] = "死亡符文";
	L['Holy Power'] = "圣能";
	L['Arcane Charges'] = "奥术冲能";
	L['Shadow Orbs'] = "暗影宝珠";
	L['Lunar'] = "月能";
	L['Solar'] = "日能";
	L['Class Resources'] = "职业资源";
	L['Center'] = "中";
	L['JustifyH'] = "水平对齐";
	L["Sets the font instance's horizontal text alignment style."] = "设置字体实例的水平文本对齐方式";
	L['Spells'] = '技能';
	L['This filter is used for both aura bars and aura icons no matter what. Its purpose is to block out specific spellids from being shown. For example a paladin can have two sacred shield buffs at once, we block out the short one.'] = '这个过滤器作用于光环条和光环图标,不管是什么,其目的是为了用阻止特定技能ID的技能被显示. 例如: 圣骑士可以一次有两个神圣之盾BUFF, 我们阻止了时间短的那个显示.';
	L['Style'] = '样式';
	L['Select the display method of the portrait.'] = '选择头像显示方式';
	L['2D'] = true;
	L['3D'] = true;
	L['Friendly'] = '友好';
	L['Enemy'] = '敌对';
	L['If the unit is friendly then this filter will be checked, otherwise it will be ignored.'] = '如果单位是友好的,那么这个过滤器会检查,否则将被忽略.';
	L['If the unit is an enemy then this filter will be checked, otherwise it will be ignored.'] = '如果单位是敌对的,那么这个过滤器会检查,否则将被忽略.';
	L['Allow Dispellable Auras'] = '允许能被驱散的光环';
	L["Block Raid Buffs"] = '阻止团队BUFF';
	L["Block Auras Without Duration"] = '阻止无持续继时间的光环';
	L["Block Blacklisted Auras"] = '阻止列入黑名单的光环';
	L["Allow Whitelisted Auras"] = '允许列入白名单的光环';
	L["Allow Personal Auras"] = '允许个人光环';
	L['Player Frame Aura Bars'] = '玩家框体光环条';
	L['Filter Auras Not Dispellable By Me'] = '过滤不能被我驱散的光环';
	L['Allow displaying of auras that can be dispelled by me.'] = '只允许显示能被我驱散的光环';
	L['Click Through'] = "点击透过";
	L['Ignore mouse events.'] = "忽略鼠标事件";
	L['Additional Filter'] = '额外的过滤器';
	L['Filter Non-Personal Auras'] = '过滤不是自已的光环';
	L['Use Blacklist Filter'] = '使用黑名单过滤';
	L['Use Whitelist Filter'] = '使用白名单过滤';
	L['Filter Auras with No Duration'] = '过滤无持续时间的光环';
	L['Filter Raid Buffs'] = '过滤团队Buff';
	L['The spell "%s" has been added to the Blacklist unitframe aura filter.'] = '技能 "%s" 被添加到单位框体的光环过滤器的黑名单里';
	L['match frame size'] = '匹配框体尺寸';
	L['Focus'] = '焦点';
	L['Display icon on arena frame indicating the units talent specialization or the units faction if inside a battleground.'] = '在竞技场框体上显示天赋图标或在战场内.';
	L['PVP Trinket'] = 'PvP 饰品';
	L['Spec Icon'] = '天赋图标';
	L['Assist Target'] = "助理目标";
	L['Tank Target'] = "坦克目标";
	L['Growth Direction'] = "延展方向";
	L['Current / Max'] = "当前值/最大值";
	L['Current'] = "当前值";
	L['Remaining'] = "剩余值";
	L['Format'] = "格式";
	L['X Offset'] = "X 方向偏移";
	L['Y Offset'] = "Y 方向偏移";
	L['RaidDebuff Indicator'] = "中心图标DEBUFF显示";
	L['Debuff Highlighting'] = "Debuff 高亮";
		L['Color the unit healthbar if there is a debuff that can be dispelled by you.'] = "高亮显示单元,如果DEBUFF能被你驱散";
	L['Disable Blizzard'] = "禁用暴雪框体";
		L['Disables the blizzard party/raid frames.'] = "禁用暴雪小队/团队框架";
	L['OOR Alpha'] = "距离透明度";
		L['The alpha to set units that are out of range to.'] = "单元超出距离显示的透明度";
	L['You cannot set the Group Point and Column Point so they are opposite of each other.'] = "你不能设置队伍位置和列位置这些他们是互相对立的.";
	L['Orientation'] = "方向";
		L['Direction the health bar moves when gaining/losing health.'] = "当增加/减少血量时血条的移动方向";
		L['Horizontal'] = "水平";
		L['Vertical'] = "垂直";
	L['Camera Distance Scale'] = "镜头距离比例";
		L['How far away the portrait is from the camera.'] = "头像距镜头有多远";
	L['Offline'] = "离线";
	L['UnitFrames'] = "单位框体";
	L['Ghost'] = "死亡";
	L['Smooth Bars'] = "平滑条";
		L['Bars will transition smoothly.'] = "条将平滑过渡";
	L["The font that the unitframes will use."] = "单位框体字体";
		L["Set the font size for unitframes."] = "设置单位框体字体尺寸";
	L['Font Outline'] = "字体描边";
		L["Set the font outline."] = "设置字体的描边";
	L['Bars'] = "条";
	L['Fonts'] = "字体";
	L['Class Health'] = "职业色生命";
		L['Color health by classcolor or reaction.'] = "以职业色显示生命";
	L['Class Power'] = "职业色能量";
		L['Color power by classcolor or reaction.'] = "以职业色显示能量";
	L['Health By Value'] = "按数值变化血量";
		L['Color health by amount remaining.'] = "按数值变化血量";
	L['Custom Health Backdrop'] = "定制血条背景";
		L['Use the custom health backdrop color instead of a multiple of the main health color.'] = "自定义血条背景色";
	L['Class Backdrop'] = "职业色背景";
		L['Color the health backdrop by class or reaction.'] = "血条背景色以职业色显示";
	L['Health'] = "血条";
	L['Health Backdrop'] = "血条背景";
	L['Tapped'] = "已被攻击";
	L['Disconnected'] = "断开";
	L['Powers'] = "能量";
	L['Reactions'] = "声望";
	L['Bad'] = "危险";
	L['Neutral'] = "中立";
	L['Good'] = "安全";
	L['Player Frame'] = "玩家框体";
	L['Width'] = "宽";
	L['Height'] = "高";
	L['Low Mana Threshold'] = "低魔法阈值";
		L['When you mana falls below this point, text will flash on the player frame.'] = "当你的魔法低于此位置时,将在玩家框体上显示一行闪烁的文字";
	L['Combat Fade'] = "战斗隐藏";
		L['Fade the unitframe when out of combat, not casting, no target exists.'] = "隐藏框体在非战斗, 没有施法和没有目标时";
	L['Health'] = "血量";
		L['Text'] = "文字";
		L['Text Format'] = "文字格式";	
	L['Current - Percent'] = "当前值 - 百分比";
	L['Current - Max | Percent'] = "当前值 - 最大值 | 百分比";
	L['Current - Max'] = "当前值 - 最大值";
	L['Current'] = "当前值";
	L['Percent'] = "百分比";
	L['Deficit'] = "亏损值";
	L['Filled'] = "全长";
	L['Spaced'] = "留空";
	L['Power'] = "能量";
	L['Offset'] = "偏移";
		L['Offset of the powerbar to the healthbar, set to 0 to disable.'] = "偏移能量条与血条的位置, 设为 0 禁用.";
	L['Alt-Power'] = "特殊能量值";
	L['Overlay'] = "覆盖";
		L['Overlay the healthbar']= "覆盖血条";
	L['Portrait'] = "头像";
	L['Name'] = "姓名";
	L['Up'] = "上";
	L['Down'] = "下";
	L['Left'] = "左";
	L['Right'] = "右";
	L['Num Rows'] = "行数";
	L['Per Row'] = "每行";
	L['Buffs'] = true;
	L['Debuffs'] = true;
	L['Y-Growth'] = "Y 方向增长";
	L['X-Growth'] = "X 方向增长";
		L['Growth direction of the buffs'] = "buffs 增长方向";
	L['Initial Anchor'] = "初始化位置";
		L['The initial anchor point of the buffs on the frame'] = "初始化框体 buff 的位置";
	L['Castbar'] = "施法条";
	L['Icon'] = "图标";
	L['Latency'] = "延时";
	L['Color'] = "颜色";
	L['Interrupt Color'] = "不可打断颜色";
	L['Match Frame Width'] = "匹配框体宽度";
	L['Fill'] = "填充";
	L['Classbar'] = "职业条";
	L['Position'] = "位置";
	L['Target Frame'] = "目标框体";
	L['Text Toggle On NPC'] = "NPC 文字显示开关";
		L['Power text will be hidden on NPC targets, in addition the name text will be repositioned to the power texts anchor point.'] = "NPC 目标将隐藏能量值文字";
	L['Combobar'] = "连击点";
	L['Use Filter'] = "使用过滤器";
		L['Select a filter to use.'] = "选择一个过滤器使用";
		L['Select a filter to use. These are imported from the unitframe aura filter.'] = "选择一个过滤器使用. 这些从单位框体的光环过滤器中输入";
	L['Personal Auras'] = "个人光环";
	L['If set only auras belonging to yourself in addition to any aura that passes the set filter may be shown.'] = "如果设置了只显示自己释放的光环，那么除了你设置的过滤条件（只显示自己释放的）以外的光环都不会显示";
	L['Create Filter'] = "创建过滤器";
		L['Create a filter, once created a filter can be set inside the buffs/debuffs section of each unit.'] = "创建一个过滤器, 一旦创建能被每个单元的 buff/debuff 所使用";
	L['Delete Filter'] = "删除过滤器";
		L['Delete a created filter, you cannot delete pre-existing filters, only custom ones.'] = "删除一个创建的过滤器, 你不能删除内置的过滤器, 只有你自已添加的能";
	L["You can't remove a pre-existing filter."] = "你不能删除一个内置的过滤器";
	L['Select Filter'] = "选择过滤器";
	L['Whitelist'] = "白名单";
	L['Blacklist'] = "黑名单";
	L['Filter Type'] = "过滤器类型";
		L['Set the filter type, blacklisted filters hide any aura on the like and show all else, whitelisted filters show any aura on the filter and hide all else.'] = "设置过滤器类型, 黑名单隐藏所有在名单里面的光环, 白名字则显示所有在名单里的光环";
	L['Add Spell'] = "添加技能";
		L['Add a spell to the filter.'] = "添加一个技能到过滤器";
	L['Remove Spell'] = "移除技能";
		L['Remove a spell from the filter.'] = "从过滤器中移除一个技能";
	L['You may not remove a spell from a default filter that is not customly added. Setting spell to false instead.'] = "你不能移除一个内置技能, 可以禁用此技能.";
	L['Unit Reaction'] = "单元声望";
		L['This filter only works for units with the set reaction.'] = "此过滤器只工作在那些单元有声望时";
		L['All'] = "全部";
		L['Friend'] = "友好";
		L['Enemy'] = "敌对";
	L['Duration Limit'] = "时间限制";
		L['The aura must be below this duration for the buff to show, set to 0 to disable. Note: This is in seconds.'] = "光环必需低于此时间buff才会显示, 设为0禁用. 注意: 此时间单位为 秒.";
	L['TargetTarget Frame'] = "目标的目标框体";
	L['Attach To'] = "附加到";
		L['What to attach the buff anchor frame to.'] = "buff 锚点附加到哪儿";
		L["What to attach the debuff anchor frame to."] = "Debuff 锚点附加到哪儿";
		L['Frame'] = "框体";
	L['Anchor Point'] = "锚点方向";
		L['What point to anchor to the frame you set to attach to.'] = "框体的锚点对齐方向";
	L['Focus Frame'] = "焦点框体";
	L['FocusTarget Frame'] = "焦点目标框体";
	L['Pet Frame'] = "宠物框体";
	L['PetTarget Frame'] = "宠物目标框体";
	L['Boss Frames'] = "BOSS 框体";
	L['Growth Direction'] = "延展方向";
	L['Arena Frames'] = "竞技场框体";
	L['Profiles'] = "配置";
	L['New Profile'] = "新配置";
	L['Delete Profile'] = "删除配置";
	L['Copy From'] = "复制自";
	L['Talent Spec #1'] = "天赋位 #1";
	L['Talent Spec #2'] = "天赋位 #2";
	L['NEW_PROFILE_DESC'] = '你能创建一个新的单位框体配置文件, 你能分配某些配置为某个天赋使用. 在这儿你能删除, 复制或重置配置文件.';
	L["Delete a profile, doing this will permanently remove the profile from this character's settings."] = "删除一个配置文件, 将永远的从角色设置中移除此配置.";
	L["Copy a profile, you can copy the settings from a selected profile to the currently active profile."] = "复制一个配置文件, 你能复制设置从选择的配置到当前活动配置.";
	L["Assign profile to active talent specialization."] = "指定配置为当前天赋专用";
	L['Active Profile'] = "激活配置";
	L['Reset Profile'] = "重设配置";
		L['Reset the current profile to match default settings from the primary layout.'] = "重设当前配置为默认值";
	L['Party Frames'] = "队伍框";
	L['Group Point'] = "队伍位置";
		L['What each frame should attach itself to, example setting it to TOP every unit will attach its top to the last point bottom.'] = "每一个框体都会依附在你设定的位置上, 例如: 你设置依附于TOP那么每一个单元都将把它单元TOP依附于前一个单元的BOTTOM";
	L['Column Point'] = "列位置";
		L['The anchor point for each new column. A value of LEFT will cause the columns to grow to the right.'] = "每一行的锚点. 设置这个值为LEFT, 那么这一行的将从左向增长";
	L['Max Columns'] = "最大列数";
		L['The maximum number of columns that the header will create.'] = "最大显示多少列";
	L['Units Per Column'] = "每列单元数";
		L['The maximum number of units that will be displayed in a single column.'] = "一列最多显示多少个单元";
	L['Column Spacing'] = "列间距";
		L['The amount of space (in pixels) between the columns.'] = "列之间的间隔距离(像素)";
	L['xOffset'] = "X 方向偏移";
		L['An X offset (in pixels) to be used when anchoring new frames.'] = "新框体X方向的偏移值";
	L['yOffset'] = "Y 方向偏移";
		L['An Y offset (in pixels) to be used when anchoring new frames.'] = "新框体Y方向的偏移值";
	L['Show Party'] = "队伍时显示";
		L['When true, the group header is shown when the player is in a party.'] = "选中此项, 当玩家在队伍中时显示";
	L['Show Raid'] = "团队时显示";
		L['When true, the group header is shown when the player is in a raid.'] = "选中此项, 当玩家进入团队时显示";
	L['Show Solo'] = "单人时显示";
		L['When true, the header is shown when the player is not in any group.'] = "选中此项, 只有玩家一个人时也显示队伍";
	L['Display Player'] = "显示玩家";
		L['When true, the header includes the player when not in a raid.'] = "选中此项,队伍中将显示玩家";
	L['Visibility'] = "可见性";
		L['The following macro must be true in order for the group to be shown, in addition to any filter that may already be set.'] = "此处的宏为真将显示此组";
	L['Blank'] = "空";
	L['Buff Indicator'] = "四角Hot提示器";
	L['Color Icons'] = "图标颜色";
		L['Color the icon to their set color in the filters section, otherwise use the icon texture.'] = "以色块显示图标, 否则使用图标自身的材质";
	L['Size'] = "尺寸";
		L['Size of the indicator icon.'] = "指示器图标尺寸";
	L["Select Spell"] = "选择技能";
	L['Add SpellID'] = "添加技能ID";
	L['Remove SpellID'] = "移除技能ID";
	L["Not valid spell id"] = "不正确的技能ID";
	L["Spell not found in list."] = "列表中未发现技能";
	L['Show Missing'] = "显示未命中";
	L['Any Unit'] = "任意单元";
	L['Move UnitFrames'] = "移动单位框体";
	L['Reset Positions'] = "重设位置";
	L['Sticky Frames'] = "粘性窗口";
	L['Attempt to snap frames to nearby frames.'] = "使窗口自动吸附旁边的窗口, 方便解锁移动时调整位置";
	L['Raid-25 Frames'] = "团队框架";
	L['Raid-40 Frames'] = "40人团队";
	L['Copy From'] = "复制自";
	L['Select a unit to copy settings from.'] = "选择一个单元来复制设置从.";
	L['You cannot copy settings from the same unit.'] = "你不能从相同的单元复制设置";
	L['Restore Defaults'] = "恢复默认";
	L['Role Icon'] = "职责图标";
	L['Smart Raid Filter'] = "智能团队过滤";
	L['Override any custom visibility setting in certain situations, EX: Only show groups 1 and 2 inside a 10 man instance.'] = "在某些必然的情况重写可见性的定义, 比如: 在10人副本里只显示1队和2队";	
	L['Heal Prediction'] = "治疗预估";
	L['Show a incomming heal prediction bar on the unitframe. Also display a slightly different colored bar for incoming overheals.'] = "在单位框体上显示治疗预估条";
	L['Assist Frames'] = "助理框";
	L['Tank Frames'] = "主坦克框";
	L['Swing'] = "平砍计时条";
	L['Swing Bar'] = "显示平砍计时条，比如LR的射击条";
	L['Vengeance'] = "复仇条";
	L['Vengeance Bar'] = "显示坦克的复仇条";

	L['Party Pets'] = "队伍宠物";
	L['Party Targets'] = "队伍目标";
	L["Display Pets"] = "显示宠物";
	L['Ticks'] = "分段"	L['Display tick marks on the castbar for channelled spells. This will adjust automatically for spells like Drain Soul and add additional ticks based on haste.'] = "在通道施法条上添加分段标志, 会随着急速改变";
	
	L['CCDebuffs'] = "控场类DEBUFF"
	L['TurtleBuffs'] = "减伤类DEBUFF"
	L['DebuffBlacklist'] = "DEBUFF黑名单"
	L['RaidDebuffs'] = "团队副本DEBUFF"
	L['RaidDebuffs2'] = "团队副本DEBUFF图标2"
	
	L['Totem Time'] = "显示图腾时间和星月条能量值"
	L['Attention Frames'] = "关注框体"
	L['%s frame(s) has a conflicting anchor point, please change either the buff or debuff anchor point so they are not attached to each other. Forcing the debuffs to be attached to the main unitframe until fixed.'] = '%s 框体有互相冲突的锚点, 请改变BUFF 或DEBUFF的锚点设置使他们没有附加到对方. 强制DEBUFF被附加到主框体上直到修正.'
	L['Spark'] = "闪光";
	L['Display a spark texture at the end of the castbar statusbar to help show the differance between castbar and backdrop.'] = "在施法条的尾端增加一个闪光用来区分施法条和背景";
	L['Frequent Updates'] = "高频更新";
	L['Rapidly update the health, uses more memory and cpu. Only recommended for healing.'] = "高频率的更新血量, 将消耗更多的内存和CPU. 只建议治疗使用";	
	L['targetGlow'] = "目标边框染色";
	L['In the party and raid frame for is your target to add a classcolor border.'] = "在队伍和团队框体上为你的目标添加一个职业色边框效果";	
	L['Rest Icon'] = "休息图标";
	L['Display the rested icon on the unitframe.'] = "在框体上显示休息图标";	
	L["Eui UF Style"] = "EUI单位框体样式";
	L["Display Target"] = "显示目标";
	L["Display the target of the cast on the castbar."] = "在施法条上显示施法目标";
	L['Double Icon'] = "双图标显示";
	
	L["Short"] = "短";
	L["Medium"] = "中";
	L["Long"] = "长";
	L["Long (Include Level)"] = "长(含等级)";
	L["Length"] = "长度";
	L["Tanks First"] = "坦克优先"
	L['Size Override'] = "尺寸覆盖";
	L['If not set to 0 then override the size of the aura icon to this.'] = "如果不为0, 此值将覆盖光环图标的尺寸定义";	
	L["Set the priority order of the spell, please note that prioritys are only used for the raid debuff module, not the standard buff/debuff module. If you want to disable set to zero."] = "设置该法术的优先顺序, 请注意.. 优先级只用于RAID DEBUFF模块, 而不是标准的BUFF/ DEBUFF模块。如果你想禁用设置为零";
	L["Priority"] = "优先级";		
	L['Display Frames'] = "显示框体";
	L['Force the frames to show, they will act as if they are the player frame.'] = "强制框体显示";		
	L['Show Auras'] = "显示光环";
	L['RL / ML Icons'] = "队长/拾取图标";
	L['Focus Castbar'] = '焦点施法条';
	L['Player Castbar'] = '玩家施法条';
	L['Target Castbar'] = '目标施法条';	
	L['Custom Texts'] = "自定义文本";
	L['Create a custom fontstring. Once you enter a name you will be able to select it from the elements dropdown list.'] = "创建自定义的文本, 一旦你输入一个名称, 你将能够从下拉列表元素中选择";
	L['Smart Auras'] = "智能光环";
	L['Disabled'] = "禁用"
	L['Friendlies: Show Debuffs'] = "友好: 显示 Debuff"
	L['Friendlies: Show Buffs'] = "友好: 显示 Buff"
	L['Use Whitelist'] = "使用白名单"
	L['If set then if the aura is found on the whitelist filter it will display. Note: You can change between only doing this on friendly or enemy units.'] = "如果设置了,那么当白名单过滤器上发现的光环将会显示. 注意:你可以更改友好或敌对单位之间"
	L['Use Blacklist'] = "使用黑名单"
	L['If set then if the aura is found on the blacklist filter it will not display. Note: You can change between only doing this on friendly or enemy units.'] ="如果设置了,那么当黑名单过滤器上发现的光环将会显示. 注意:你可以更改友好或敌对单位之间"
	L['Allow displaying of auras that do not have a duration.'] = "允许显示无持续时间的光环"
	L['If set, only auras belonging to yourself in addition to any aura that passes the set filter(s) may be shown. Note: You can change between only doing this on friendly or enemy units.'] = "如果设置了, 只会显示属于你自已施放的并通过过滤器的光环"
	L['No Consolidated'] = "非综合类";
	L['Allow displaying of auras that are considered consolidated by Blizzard.'] = "允许显示被暴雪认为是综合类的光环";
	L['When set the Buffs and Debuffs will toggle being displayed depending on if the unit is friendly or an enemy. This will not effect the aurabars module.'] = "当单位是友好或敌对切换显示BUFF和DEBUFF, 不会影响光环条模块";
	L['Friendly Aura Type'] = "友好光环类型"
	L['Set the type of auras to show when a unit is friendly.'] = "当单位是友好时设置光环显示的类型"
	L['Enemy Aura Type'] = "敌对光环类型"
	L['Set the type of auras to show when a unit is a foe.'] = "当单位是敌对时设置光环显示的类型"
	L['TEXT_FORMAT_DESC'] = [=[提供一个字符串来更改文本格式.

示例: 
[namecolor][name] [difficultycolor][smartlevel] [shortclassification]
[healthcolor][health:current-max]
[powercolor][power:current]

血量 / 能量格式:
'current' - 当前值
'percent' - 百分比
'current-max' - 当前值-最大值
'current-percent' - 当前值-百分比
'current-max-percent' - 当前值-最大值-百分比
'deficit' - 缺少值

姓名格式:
'name:short' - 最多显示4个字符
'name:medium' - 最多显示15个字符
'name:long' - 最多显示20个字符

更多的信息请访问 http://eui.cc]=];	
end

--Datatext
do
	L["World Boss(s)"] = "世界首领:";
	L['Sha of Anger'] = "怒之煞";
	L['Galleon'] = '炮舰';
	L['Crit'] = '爆击';
	L['Datatext Panel (Left)'] = '信息文字左面板';
	L['Datatext Panel (Right)'] = '信息文字右面板';
	L['Display data panels below the chat, used for datatexts.'] = '显示信息文字面板在聊天框底部';
	L['ABLeftInfobar'] = '动作条左信息条';
	L['ABRightInfobar'] = '动作条右信息条';
	L['MainABInfobar'] = '主动作条信息条';
	L["Game Time:"] = "游戏时间:";
	L['Orb Possessions'] = "宝珠属地";
	L['Victory Points'] = "胜利点";
	L['Carts Controlled'] = "控制的车";
	L['Bandwidth'] = "带宽";
	L['Download'] = "下载";
	L['Total Memory:'] = "总内存:";
	L['Home Latency:'] = "本地延迟:";
	L['World Latency:'] = "世界延迟:";
	
	L.goldabbrev = "|cffffd700g|r"
	L.silverabbrev = "|cffc7c7cfs|r"
	L.copperabbrev = "|cffeda55fc|r"	
	
	L['Session:'] = "本次登陆";
	L["Character: "] = "角色: ";
	L["Server: "] = "服务器: ";
	L["Total: "] = "合计: ";
	L["Saved Raid(s)"]= "已有进度的副本";
	L["Currency:"] = "货币";	
	L["Earned:"] = "挣取:";	
	L["Spent:"] = "花费:";	
	L["Deficit:"] = "赤字:";
	L["Profit:"	] = "利润:";	
	
	L["DataTexts"] = "信息文字";
	L["DATATEXT_DESC"] = "设置在屏幕上显示的一些信息文字.";
	L["Multi-Spec Swap"] = "多天赋切换";
	L['Swap to an alternative layout when changing talent specs. If turned off only the spec #1 layout will be used.'] = "当改变天赋时切换到另一个层. 当关闭时只有 #1 层被使用.";
	L['24-Hour Time'] = "24小时制";
	L['Toggle 24-hour mode for the time datatext.'] = "信息文件时间段以24小时制显示开关";
	L['Local Time'] = "本地时间";
	L['If not set to true then the server time will be displayed instead.'] = "如果关闭此项,将显示服务器时间";
	L['Primary Talents'] = "主天赋";
	L['Secondary Talents'] = "副天赋";
	L['left'] = '左';
	L['middle'] = '中';
	L['right'] = '右';
	L['LeftChatDataPanel'] = '左聊天框';
	L['RightChatDataPanel'] = '右聊天框';
	L['LeftMiniPanel'] = '小地图左';
	L['RightMiniPanel'] = '小地图右';
	L['EuiTopLeftDataTexts'] = '顶部信息条左';
	L['EuiTopRightDataTexts'] = '顶部信息条右';
	L['Friends'] = "好友";
	L['Friends List'] = "好友列表";
	
	L['Head'] = "头";
	L['Shoulder'] = "肩";
	L['Chest'] = "胸";
	L['Waist'] = "腰";
	L['Wrist'] = "护腕";
	L['Hands'] = "手";
	L['Legs'] = "腿";
	L['Feet'] = "脚";
	L['Main Hand'] = "主手";
	L['Offhand'] = "副手";
	L['Ranged'] = "远程";
	L['Mitigation By Level: '] = "等级减伤";
	L['lvl'] = "等级";
	L["Avoidance Breakdown"] = "免伤统计";
	L['AVD: '] = "免伤: ";
	L['Unhittable:'] = "未命中: ";
	L['AP'] = "攻强";
	L['SP'] = "法术伤害";
	L['HP'] = "法术治疗";
	L['allunavailable'] = "无法获得战争的召唤信息."
	L['nodungeons'] = "没有副本提供战争的召唤."
	
	L["Armor"] = "护甲";
	L["Attack Power"] = "攻击强度";
	L["Avoidance"] = "免伤";
	L["Crit Chance"] = "爆击率";
	L["DTName"] = true;
	L["Durability"] = "耐久";
	L["Friends"] = "好友";
	L["Gold"] = "金币";
	L["Guild"] = "公会";
	L["Spell/Heal Power"] = "法术伤害/治疗";
	L["System"] = "系统信息";
	L["Time"] = "时间";
	L["Bags"] = "背包";
	L["Call to Arms"] = "战斗的召唤"
	L["Spec Switch"] = "天赋切换"
	L["Mana Regen"] = "法力回复"
	L["Vengeance"] = GetSpellInfo(93098) or GetSpellInfo(76691)
	L["Expertise"] = STAT_EXPERTISE
	L["DPS"] = "DPS"
	L["HPS"] = "HPS"
	L["Haste"] = STAT_HASTE
	L["Hit Rating"] = "命中"
	L["Mastery"] = STAT_MASTERY
	
	L['Total CPU:'] = true;
	L['(Hold Shift) Memory Usage'] = "按住Shift显示内存使用";
	L['Flags Captured'] = "占领旗帜";
	L['Flags Returned'] = "交还旗帜";
	L['Graveyards Assaulted'] = "墓地突袭";
	L['Graveyards Defended'] = "墓地防守";
	L['Towers Assaulted'] = "哨塔突袭";
	L['Towers Defended'] = "哨塔防御";
	L['Demolishers Destroyed'] = "攻城车摧毁";
	L['Gates Destroyed'] = "大门摧毁";
	L['Bases Assaulted'] = "基地突袭";
	L['Bases Defended'] = "基地防御";
	L['Battleground datatexts temporarily hidden, to show type /bgstats or right click the "C" icon near the minimap.'] = "战场信息文字临时隐藏,输入/bgstats或右击小地图右下角的C";
	L['Toggle Configuration'] = "设置开关";
	L['Show BG Texts'] = "显示战场信息文字";
	L['Battleground datatexts will now show again if you are inside a battleground.'] = "战场信息文字将再次显示,如果你在战场中";
	L['Battleground Texts'] = "战场文字";
	L['When inside a battleground display personal scoreboard information on the main datatext bars.'] = "在战场上信息文字显示个人记分信息";		
	L['Stats For:'] = "统计:";
end

--Tooltip
do
	L['Spell/Item IDs'] = '技能/物品ID';
	L['Display the spell or item ID when mousing over a spell or item tooltip.'] = '在鼠标提示中显示技能或物品的ID';
	L['Item Count'] = '物品数量';
	L['Display how many of a certain item you have in your possession.'] = '显示当前物品在你身上有多少个';
	L['Always Hide'] = '总是隐藏';
	L['Never Hide'] = '绝不隐藏';
	L["Your Status: Completed on "] = "你的状态: 完成 ";
	L["Your Status: Incomplete"] = "你的状态: 未完成";
	L["Your Status:"] = "你的状态:";
	L["TOOLTIP_DESC"] = '提示信息设置选项.';
	L['Targeted By:'] = "同目标的有:";
	L['Tooltip'] = "鼠标提示";
	L['Count'] = "计数";
	L['Anchor Mode'] = "位置模式";
	L['Set the type of anchor mode the tooltip should use.'] = "设置鼠标提示位置显示模式";
	L['Smart'] = "智能";
	L['Cursor'] = "光标跟随";
	L['Anchor'] = "固定位置";
	L['UF Hide'] = "单位框体提示隐藏";
	L["Don't display the tooltip when mousing over a unitframe."] = "当鼠标指向单位框体时不显示鼠标提示";
	L["Who's targetting who?"] = "目标关注";
	L["When in a raid group display if anyone in your raid is targetting the current tooltip unit."] = "在团队中显示与你当前鼠标提示目标相同目标的队友";
	L["Combat Hide"] = "战斗隐藏";
	L["Hide tooltip while in combat."] = "战斗时不显示提示";
	L['Item-ID'] = "物品ID";
	L['Display the item id on item tooltips.'] = "在物品提示信息中显示物品ID";
	L["Yard"] = "码";
	L["Range"] = "距离";
	L["Current Talent"] = "当前天赋";
	L["Reserve Talent"] = "备用天赋";
	L["AvgItemLvl"] = "平均装等";	
end

--Chat
do
	L['Send to Screen'] = '转发至屏幕';
	L['Chat EditBox Position'] = '聊天编辑框位置';
	L['Position of the Chat EditBox, if datatexts are disabled this will be forced to be above chat.'] = '聊天编辑框位置,如果底部的信息文字被禁用的话,将会强制显示在聊天框顶部';
	L['Below Chat'] = '聊天框底部';
	L['Above Chat'] = '聊天框顶部';
	L['Lock Positions'] = '锁定位置';
	L['Attempt to lock the left and right chat frame positions. Disabling this option will allow you to move the main chat frame anywhere you wish.'] = '锁定左右聊天框位置,禁用则可以移动聊天框到任意位置';
	L['Chat History'] = '聊天历史';
	L['Log the main chat frames history. So when you reloadui or log in and out you see the history from your last session.'] = '记录聊天历史,当你重载,登录和退出时会恢复你最后一次会话';
	L['Fade Chat'] = '文字淡出';
	L['Fade the chat text when there is no activity.'] = '当聊天不激活时聊天文字淡出';
	L['CHAT_DESC'] = '调整聊天相关设置.';
	L["Chat"] = "聊天框";
	L['Invalid Target'] = "不正确的目标";
	L['BG'] = true;
	L['BGL'] = true;
	L['G'] = true;
	L['O'] = true;
	L['P'] = true;
	L['PG'] = true;
	L['PL'] = true;
	L['R'] = true;
	L['RL'] = true;
	L['RW'] = true;
	L['DND'] = true;
	L['AFK'] = true;
	L['whispers'] = true;
	L['says'] = true;
	L['yells'] = true;
	L['Hyperlink Hover'] = "超链接悬停";
	L['Display the hyperlink tooltip while hovering over a hyperlink.'] = "经过超链结时显示一个超链结的提示";
	L['Spam Interval'] = "广告间隔";
	L['Prevent the same messages from displaying in chat more than once within this set amount of seconds, set to zero to disable.'] = "两次相同信息显示的间隔,设为0禁用";
	L['Scroll Interval'] = "滚屏间隔";
	L["Number of time in seconds to scroll down to the bottom of the chat window if you are not scrolled down completely."] = "一定时间内将聊天框的内容自动滚动底部."
	L["You need to be at least level %d to whisper me."] = "你需要至少 %d 级才能密我.";
	L["You have reached the maximum amount of friends, remove 2 for this module to function properly."] = "你好友已满, 请保留两个空格才能使用此功能";
	L['Whisper Level'] = "密语等级";
	L["Minimum level of the sender to able to whisper you."] = "能密语你的最小等级";	
	L["BigFootChannel"] = "大脚世界频道";
	L["Auto join BigFootChannel"] = "自动加入大脚世界频道";
	L["Copy Text"] = "复制文字";
	L["Sticky Chat"] = "频道粘滞";
	L["When opening the Chat Editbox to type a message having this option set means it will retain the last channel you spoke in. If this option is turned off opening the Chat Editbox should always default to the SAY channel."] = "当你开始输入消息时此选项的启用将会让你保留最后一次聊天的频道, 如果关闭将始终使用说话频道."	
	L['List of words to color in chat if found in a message. If you wish to add multiple words you must seperate the word with a comma. To search for your current name you can use %MYNAME%.\n\nExample:\n%MYNAME%, ElvUI, RBGs, Tank'] = "一个以逗号分隔能被修改的关键词列表, 如果信息中发现这些关键词会显示不同的颜色";
	L['Keywords'] = "关键词高亮";	
	L["Embedded Addon"] = "右聊天框嵌入"
	L["Select an addon to embed to the right chat window. This will resize the addon to fit perfectly into the chat window, it will also parent it to the chat window so hiding the chat window will also hide the addon."] = "将插件内嵌入右聊天框内"
	L["embedcombat"] = "右聊天框嵌入战斗切换"
	L["embedcombat_desc"] ="右侧聊天框嵌入的插件默认隐藏, 进入战斗时显示."
	L["Whisper Alert"] = "密语声音";
	L["Keyword Alert"] = "关键词声音";
	L['Emotion Icons'] = "表情图标";
	L['Display emotion icons in chat.'] = "在聊天中显示表情图标";	
end

--Skins
do	
	L['Loss Control'] = '迷失控制';
	L['Void Storage'] = '虚空储存';
	L['Item Upgrade'] = '物品升级';
	L["You do not own this pet."] = '你没有此类型宠物.';
	L["Owned: "] = '我的宠物: ';
	L['Black Market AH'] = "黑市";
	L['Transmogrify Frame'] = "幻化窗口";
	L['Open Tukui_UIPackages_Skins option'] = "打开插件美化皮肤选项";
	L["Skins"] = "美化皮肤";
	L["SKINS_DESC"] = '调整皮肤设置.';
	L['Spacing'] = "空隙";
	L['The spacing in between bars.'] = "两个进度条之间的间隙";
	L["TOGGLESKIN_DESC"] = "启用/禁用此皮肤.";
	L["Encounter Journal"] = "地下城手册";
	L["Bags"] = "背包";
	L["Reforge Frame"] = "重铸";
	L["Calendar Frame"] = "日历";
	L["Achievement Frame"] = "成就";
	L["LF Guild Frame"] = true;
	L["Inspect Frame"] = "观察";
	L["KeyBinding Frame"] = "快捷键";
	L["Guild Bank"] = "公会银行";
	L["Archaeology Frame"] = "考古";
	L["Guild Control Frame"] = "公会控制";
	L["Guild Frame"] = "公会";
	L["TradeSkill Frame"] = "商业技能";
	L["Raid Frame"] = "团队";
	L["Talent Frame"] = "天赋";
	L["Glyph Frame"] = "雕文";
	L["Auction Frame"] = "拍卖";
	L["Barbershop Frame"] = "理发店";
	L["Macro Frame"] = "宏";
	L["Debug Tools"] = "调试工具";
	L["Trainer Frame"] = "训练师";
	L["Socket Frame"] = "珠宝";
	L["Achievement Popup Frames"] = "成就弹出窗";
	L["BG Score"] = "战场记分窗";
	L["Merchant Frame"] = "商人";
	L["Mail Frame"] = "信箱";
	L["Help Frame"] = "帮助";
	L["Trade Frame"] = "交易";
	L["Gossip Frame"] = "闲谈";
	L["Greeting Frame"] = "欢迎";
	L["World Map"] = "世界地图";
	L["Taxi Frame"] = "载具";
	L["LFD Frame"] = "寻求组队";
	L["Quest Frames"] = "任务";
	L["Petition Frame"] = "签名";
	L["Dressing Room"] = "试衣间";
	L["PvP Frames"] = "PvP窗口";
	L["Non-Raid Frame"] = true;
	L["Friends"] = "好友";
	L["Spellbook"] = "技能书";
	L["Character Frame"] = "角色";
	L["LFG Frame"] = true;
	L["Misc Frames"] = true;
	L["Tabard Frame"] = "战袍";
	L["Guild Registrar"] = "公会注册";
	L["Time Manager"] = "时间管理";	
	L['Embedded Bar Height'] = "内嵌条高度";
	L['The height of the bars while skada is embedded.'] = "当Skada内嵌入聊天框时计量条的高度";	
	L["Mounts & Pets"] = "座骑和宠物";
	L["Pet Battle"] = "宠物对战";
end

--Misc
do
	L['Bags'] = "背包";
	L['Totems'] = "图腾";
	L['No Guild'] = "无公会";
	L['Left Chat'] = "左聊天框";
	L['Right Chat'] = "右聊天框";
	L["Experience Bar"] = "经验条";
	L["Reputation Bar"] = "声望条";
	L['Experience'] = "经验条";
	L['Bars'] = "条";
	L['XP:'] = "经验:";
	L['Remaining:'] = "剩余:";
	L['Rested:'] = "休息:";
	
	L['Empty Slot'] = "空位";
	L['Fishy Loot'] = "鱼";
	L["Can't Roll"] = "不能 Roll";
	L['Disband Group'] = "解散队伍";
	L['Raid Menu'] = "团队菜单";
	L['Your items have been repaired for: '] = "你的物品已经被修理: ";
	L["You don't have enough money to repair."] = "你没有足够的钱来修理.";
	L['Auto Repair'] = "自动修理";
	L['Automatically repair using the following method when visiting a merchant.'] = "当访问NPC时已所设置的方法自动修理物品";
	L['Your items have been repaired using guild bank funds for: '] = "你所有的物品已经修正,使用公会银行:";
	L['Loot Roll'] = "ROLL框";
	L['Enable/Disable the loot roll frame.'] = "启用/禁用增强LOOT框体";
	L['Loot'] = "拾取框";
	L['Enable/Disable the loot frame.'] = "启用/禁用拾取框";

	L['Exp/Rep Position'] = "经验/声望条位置";
	L['Change the position of the experience/reputation bar.'] = "改变经验/声望条位置";
	L['Top Screen'] = "屏幕顶端";
	L["Below Minimap"] = "依附小地图";		
	L["Map Alpha While Moving"] = "地图透明度";
	L['Controls what the transparency of the worldmap will be set to when you are moving.'] = "控制地图移动时的透明度";
	L['Font'] = "字体"
end

--Bags
do
	L['Currency Format'] = "货币格式";
	L['The display format of the currency icons that get displayed below the main bag. (You have to be watching a currency for this to display)'] = "背包底部的货币显示格式. (你需要在货币页中勾选显示)";
	L["Icons Only"] = "图标";
	L["Icons and Text"] = "图标和文字";
	L['Already Running.. Bailing Out!'] = "已在运行";
	L['You must be at a bank.'] = "你必需在银行";
	L['Confused.. Try Again!'] = "重试";
	L['Sort Inverted'] = "倒序";
	L['Stack Bags to Bank'] = "堆叠背包到银行";
	L['Stack Bank to Bags'] = "堆叠银行到背包";
	L['Click to search..'] = "点击搜索";
	L['Sort Bags'] = "背包整理";
	L['Stack Items'] = "堆叠物品";
	L['Vendor Grays'] = "出售灰色物品";
	L['Toggle Bags'] = "背包开关";
	L['You must be at a vendor.'] = "你必需以商人为目标.";
	L['Vendored gray items for:'] = "已出售灰色物品: ";
	L['No gray items to sell.'] = "无灰白物品出售.";
	L['Hold Shift:'] = "按住 Shift:";
	L['Stack Special'] = "堆叠特殊背包";
	L['Sort Special'] = "整理特殊背包";
	L['Purchase'] = "购买";
	L["Can't buy anymore slots!"] = "再也不能购买空的背包位置";
	L['You must purchase a bank slot first!'] = "你必需购买一个银行包位置";
	L['Enable/Disable the all-in-one bag.'] = "启用/禁用整合背包";
	L['Delete Grays'] = '删除灰色物品';
	L['Deleted %d gray items. Total Worth: %s'] = '删除 %d 灰色物品。总价值：%s';
	L["Are you sure you want to delete all your gray items?"] = "你确认要删除你所有的灰色物品么?";
	L['No gray items to delete.'] = "无灰色物品可删除";
	L["Ascending"] = "升序";
	L["Bag-Bar"] = "背包条";
	L["Descending"] = "降序"
	L["Enable Bag-Bar"] = "启用背包条"
	L["Enable/Disable the Bag-Bar."] = "启用/禁用 背包条."
	L["Set the size of your bag buttons."] = "设置背包按钮尺寸."
	L["Sort Direction"] = "排列方向"
	L["The direction that the bag frames be (Horizontal or Vertical)."] = "此方向决定框体是横排还是竖排."
	L["The direction that the bag frames will grow from the anchor."] = "背包框体将从此方向开始排列."
	L["Bar Direction"] = "条方向"	
end

--AuraWatch
do
	L["AuraWatch"] = "技能监视"
	L["Sora's AuraWatch"] = "Sora's AuraWatch 技能监视模块, 不要和职业计时条同时使用";
	L["Choise Aura group"] = "选择光环组";
	L["Add New Aurar"] = "添加光环";
	L["Delete Aura"] = "删除光环";
	L["AuraID："] = "技能ID";
		L["Input BUFF/DEBUFF's AuraID, SpellID or ItemID"] = "请输入 BUFF/DEBUFF 的法术ID, 技能ID或者物品ID";
	L["Monitor Type: "] = "监视类型";
	L["Aura"] = "BUFF/DEBUFF";
	L["Spell CD"] = "技能CD";
	L["Item ID"] = "物品CD";
	L["Monitor Object: "] = "监视目标";
	L["Filter by caster: "] = "按施法者过滤";
	L["Filter by Stacked layers: "] = "按堆叠层数过滤";
	L["Choise Group:"] = "选择光环组";
	L["Add Group"] = "添加光环组";
	L["New Group"] = "新光环组(请改名)";
	L["Delete Group"] = "删除光环组";
	L["Group Name"] = "光环组名称";
		L["Input Group's Name"] = "输入一个光环组名称";
	L["Display Mode"] = "显示模式";
	L["Icon Mode"] = "图标样式";
	L["Bar Mode"] = "计时条样式";
	L["Direction"] = "方向";
	L["Growth direction"] = "增长方式";
	L["LEFT"] = "左";
	L["RIGHT"] = "右";
	L["UP"] = "上";
	L["DOWN"] = "下";
	L["Interval"] = "间隔";
	L["Icon Size"] = "图标尺寸";
	L["Bar Width"] = "计时条宽度";
end

--Clickset
do
	L["ClickSet"] = "点击施法"
	L["CLICKSET_DESC"] = "可以使用鼠标直接点击团队/小队框体进行施法"
	L["default"] = "启用预设点击方案"
	L["MouseButton1"] = "鼠标左键"
	L["MouseButton2"] = "鼠标右键"
	L["MouseButton3"] = "鼠标中键"
	L["MouseButton4"] = "鼠标第四键"
	L["MouseButton5"] = "鼠标第五键"
	L["CustomClickSetSpell"] = "自定义技能列表"
		L["clickset_newname"] = "新增技能"
			L["clickset_newname_desc"] = "请输入想添加的技能ID,由鼠标提示中获得"
		L["clickset_newname_err1"] = "无此对应ID的技能"
		L['clickset_deletename'] = "删除技能"
			L['clickset_deletename_desc'] = "请输入想删除的技能ID"
		L["clickset_deletename_err"] = "无此技能"
		L["clicksetlist"] = "自定义点击施法技能列表"
		
		L["DEFAULT_DESC"] = "启用预设点击方案, 关闭此项可使用自定义法术"
		L["type1"] = "鼠标左键"
			L["TYPE1_DESC"] = "使用鼠标左键直接点击框体进行施法"
		L["shiftztype1"] = "Shift+鼠标左键"
			L["SHIFTZTYPE1_DESC"] = "使用Shift+鼠标左键点击框体进行施法"
		L["ctrlztype1"] = "Ctrl+鼠标左键"
			L["CTRLZTYPE1_DESC"] = "使用Ctrl+鼠标左键直接点击框体进行施法"
		L["altztype1"] = "Alt+鼠标左键"
			L["ALTZTYPE1_DESC"] = "使用Alt+鼠标左键直接点击框体进行施法"
		L["altzctrlztype1"] = "Alt+Ctrl+鼠标左键"
			L["ALTZCTRLZTYPE1_DESC"] = "使用Alt+Ctrl+鼠标左键直接点击框体进行施法"
		L["type2"] = "鼠标右键"
			L["TYPE2_DESC"] = "使用鼠标右键直接点击框体进行施法"
		L["shiftztype2"] = "Shift+鼠标右键"
			L["SHIFTZTYPE2_DESC"] = "使用Shift+鼠标右键直接点击框体进行施法"
		L["ctrlztype2"] = "Ctrl+鼠标右键"
			L["CTRLZTYPE2_DESC"] = "使用Ctrl+鼠标右键直接点击框体进行施法"
		L["altztype2"] = "Alt+鼠标右键"
			L["ALTZTYPE2_DESC"] = "使用Alt+鼠标右键直接点击框体进行施法"
		L["altzctrlztype2"] = "Alt+Ctrl+鼠标右键"
			L["ALTZCTRLZTYPE2_DESC"] = "使用Alt+Ctrl+鼠标右键直接点击框体进行施法"
		L["type3"] = "鼠标中键"
			L["TYPE3_DESC"] = "使用鼠标中键直接点击框体进行施法"
		L["shiftztype3"] = "Shift+鼠标中键"
			L["SHIFTZTYPE3_DESC"] = "使用Shift+鼠标中键直接点击框体进行施法"
		L["ctrlztype3"] = "Ctrl+鼠标中键"
			L["CTRLZTYPE3_DESC"] = "使用Ctrl+鼠标中键直接点击框体进行施法"
		L["altztype3"] = "Alt+鼠标中键"
			L["ALTZTYPE3_DESC"] = "使用Alt+鼠标中键直接点击框体进行施法"
		L["altzctrlztype3"] = "Alt+Ctrl+鼠标中键"
			L["ALTZCTRLZTYPE3_DESC"] = "使用Alt+Ctrl+鼠标中键直接点击框体进行施法"
		L["shiftztype4"] = "Shift+鼠标第四键"
			L["SHIFTZTYPE4_DESC"] = "使用Shift+鼠标第四键直接点击框体进行施法"
		L["ctrlztype4"] = "Ctrl+鼠标第四键"
			L["CTRLZTYPE4_DESC"] = "使用Ctrl+鼠标第四键直接点击框体进行施法"
		L["altztype4"] = "Alt+鼠标第四键"
			L["ALTZTYPE4_DESC"] = "使用Alt+鼠标第四键直接点击框体进行施法"
		L["altzctrlztype4"] = "Alt+Ctrl+鼠标第四键"
			L["ALTZCTRLZTYPE4_DESC"] = "使用Alt+Ctrl+鼠第四键键直接点击框体进行施法"
		L["type4"] = "鼠标第四键"
			L["TYPE4_DESC"] = "使用鼠标第四键直接点击框体进行施法"
		L["shiftztype5"] = "Shift+鼠标第五键"
			L["SHIFTZTYPE5_DESC"] = "使用Shift+鼠标第五键直接点击框体进行施法"
		L["ctrlztype5"] = "Ctrl+鼠标第五键"
			L["CTRLZTYPE5_DESC"] = "使用Ctrl+鼠标第五键直接点击框体进行施法"
		L["altztype5"] = "Alt+鼠标第五键"
			L["ALTZTYPE5_DESC"] = "使用Alt+鼠标第五键直接点击框体进行施法"
		L["altzctrlztype5"] = "Alt+Ctrl+鼠标第五键"
			L["ALTZCTRLZTYPE5_DESC"] = "使用Alt+Ctrl+鼠标第五键直接点击框体进行施法"
		L["type5"] = "鼠标第五键"
			L["TYPE5_DESC"] = "使用鼠标第五键直接点击框体进行施法"	
		L["menu"] = "菜单"
		L["target"] = "目标"
	L["value type"] = "数值显示类型"
	L["set value type"] = "设置数值显示是否以K(千),或W(万)缩写"
	L["0"] = "具体数值"
	L["K"] = "千位缩写"
	L["W"] = "万位缩写"	
	
	L["Eui AB Style"] = "Eui预置动作条样式"
	L["EuiABStyle_desc"] = "提供三种预设动作条布局样式, \n自定义布局请设此项为'None'"
	L["Low ScreenResolution Style"] = "低分辨率样式"
	L["Middle ScreenResolution Style"] = "中分辨率样式"
	L["High ScreenResolution Style"] = "高分辨率样式"

	L["Incoming Heals"] = "治疗预估"
	L["Show predicted incoming heals"] = "显示治疗预估值"
	
	L['Primary'] = "主天赋"
	L['Secondary'] = "副天赋"
	
	L["calendar_string"] = "日历"
	L["GameMenu"] = "游戏选项"
	
	L["Force Name Classcolor"] = "强制名字职业色"
end	

--euiscript
do
	L["Auto change loot"] = "自动更改分配方式";
	L["InGroup change loot to freecall, InRaid change loot to master"] = "队伍中改为自由拾取,团队中改为团长分配,界限为史诗";
	L['Display spell trigger graphics prompt'] = '技能触发图形提示';
	L["All Mail"] = '所有信件';
	L["All Cash"] = '所有金币';
	L["lfg notification"] = "随机本奖励提示";
	L['Quset Button Number'] = '任务物品按钮数量';
	L['Slot Button Number'] = '装备按钮数量';
	L["euiscript"] = "增强功能"
	L["euiscript_desc"] = "国服版增强功能开关"
	L["euiscript_general"] = "一般设置"
	L["bossnotes"] = "启用一句话攻略"
		L["BOSSNOTES_DESC"] = "选中BOSS为目标,输入/boss即可"
	L["castby"] = "显示光环的施法者"
		L["CASTBY_DESC"] = "显示BUFF/DEBUFF是由谁施放的"
	L["chatmod"] = "启用TAB切换频道"
		L["CHATMOD_DESC"] = "启用TAB键切换频道功能,及语言标签美化"
	L["drag"] = "启用暴雪框体拖拉功能"
		L["DRAG_DESC"] = "可以任意拖拉界面的大都多的窗口"
	L["ilevel"] = "显示目标装备等级"
		L["ILEVEL_DESC"] = "在鼠标提示中显示指向目标的装备平均等级"
	L["mapmove"] = "启用大地图移动按钮"
		L["MAPMOVE_DESC"] = "在大地图上增加一个十字型的移动按钮,如果安装第三方地图插件,建议关闭"
	L["openall"] = "启用一键收取邮件功能"
		L["OPENALL_DESC"] = "在邮箱界面添加一键收信的两个按钮"
	L["recipients"] = "启用邮件收件人列表"
		L["RECIPIENTS_DESC"] = "在发件人框添加一个下拉框可以保存收件人姓名以供使用"
	L["sr"] = "启用增强经验/声望显示"
		L["SR_DESC"] = "在聊天框中以当前经验(声望)/总经验(声望)的方式显示"
	L["statreport"] = "启用角色数据报告模块"
		L["STATREPORT_DESC"] = "在聊天框左上角添加一个划过显示的按钮,用来发送角色数据报告"
	L["talent"] = "启用目标天赋显示"
		L["TALENT_DESC"] = "在鼠标提示中显示指向目标的天赋"
	L["tradetabs"] = "启用专业技能标签"
		L["TRADETABS_DESC"] = "在专业技能窗口显示你所学的专业技能图标,方便切换专业"
	L["mousedispel"] = "启用鼠标滚轮驱散"
		L["MOUSEDISPEL_DESC"] = "将创建两个鼠标指向宏用来在团队/小队框体上滚动滚轮驱散DEBUFF, 原视野放大缩小变更为Alt+鼠标滚轮"
	L["hovertip"] = "自动装备比较"
		L["HOVERTIP_DESC"] = "鼠标划过链结直接显示聊天框中的物品信息和装备比较"
	L["idQuestAutomation"] = "自动交接任务"
		L["idQuestAutomation_desc"] = "按住Shift可禁用自动交接"
	L["raidcd"] = "团队技能冷却监视"
		L["raidcd_width"] = "冷却条宽度"
		L["raidcd_height"] = "冷却条高度"
		L["raidcd_maxbars"] = "最大条数"
		L["raidcd_direction"] = "增长方向"
		L["raidcd_desc"] = "在小地图下方列出显示团队关键技能冷却计时条"
		L["up"] = "上"
		L["down"] = "下"
		L["left"] = "左"
		L["right"] = "右"
	L["classcd"] = "内置CD冷却监视"
		L["classcd_width"] = "宽度"
		L["classcd_height"] = "高度"
		L["classcd_maxbars"] = "最大条数"
		L["classcd_direction"] = "增长方向"
		L["classcd_desc"] = "列出显示职业被动冷却技能和饰品及FM的内置CD计时条"
		L["classcd_style"] = "样式\n图标样式时尺寸同高度"
		L["icon"] = "图标样式"
		L["bar"] = "计时条样式"
	L["wildmushroom"] = "鸟德蘑菇条"
		L["wildmushroom_width"] = "冷却条宽度"
		L["wildmushroom_height"] = "冷却条高度"
		L["wildmushroom_direction"] = "增长方向"
		L["wildmushroom_desc"] = "鸟德野性蘑菇的计时条"
	L["mapfull"] = "显示未探索地区"	
	L["chatbar"] = "频道切换条"
	L["combatnoti"] = "进出战斗提示"
		L["combatnoti_leaving"] = "离开战斗提示信息"
		L["combatnoti_entering"] = "进入战斗提示信息"
	L["wgtimenoti"] = "托巴倒计时提示"
	L["chatemote"] = "聊天表情"
	L["autogreed"] = "自动贪婪/分解绿装"
	L["buffreminder"] = "BUFF提示"
	L["autoacceptinv"] = "自动接受邀请"
	L["autoinvenable"] = "关键词组队"
	L["ainvkeyword"] = "自动组队关键词"
	L["errorenable"] = "战斗时屏蔽红字错误"
	
	L['DoomCooldownPulse'] = "冷却提示模块"
	L['Usge: /dcp'] = "命令: /dcp"
	L["Icon Size"] = "图标尺寸";
	L["Fade In Time"] = "渐稳进入时间";
	L["Fade Out Time"] = "渐隐淡出时间";
	L["Max Opacity"] = "最大透明度";
	L["Max Opacity Hold Time"] = "最大透明度持续时间";
	L["Animation Scaling"] = "动态效果缩放比率";
	L["Close"] = "关闭";
	L["Test"] = "测试";
	L["Unlock"] = "解锁";
	L["Lock"] = "锁定";
	L["Defaults"] = "默认";
	L["Show spell name:"] = "显示技能名称";
	L["Cooldowns to ignore:"] = "被忽略的技能冷却:";
	L["Pet color overlay:"] = "宠物颜色覆盖";	
	L["Note: Separate multiple spells with commas"] = "注: 用逗号分隔多个技能名";
	
	L["Auto Sell"] = "自动出售灰色物品";
	L["Auto Join LFD"] = "自动进入随机本";
	L["Camera Distance MAX Factory"] = "镜头最远距离系数";
	L["Camera Distance MAX"] = "镜头最远距离";
	L["Auto Disenchant confirmation"] = "自动确认分解";
	L["BloodShield"] = "护盾监视";
		L["BloodShield desc"] = "在玩家框体上显示所有坦和MS盾的主减伤护盾时间,DK坦同时显示吸收数值"
	L["autobuy reagents"] = "自动购买施法材料";
	L["Auto QuestItem Button"] = "自动任务物品按键";
	L["Auto InventoryItem Button"] = "自动装备饰品按键";
	L["Battleground Info"] = "战场信息条"
	L["TaintError"] = "显示战斗污染错误";
	L["achievementpoint"] = "成就点数";
	L['SaveButton'] = "保存动作条按键和技能";
	L['LoadButton'] = "载入动作条按键和技能";
	L['Only Save current talnet actionbar button, DoubleTalnet use double profile file to save.'] = "只保存当前天赋状态下的动作条技能位置和快捷键设置,双天赋建议使用多配置来分别保存";
	L["Button is Saved!"] = "动作条按键和技能保存成功!";	
	L["MySlot Support"] = "以下功能需要MySlot插件支持,可到EUI自动更新器的可选插件中下载.";
	L["alt marking"] = "Alt+左键快速标记";
end

--Mover
do
	L["Loot / Alert Frames"] = "拾取 / 成就框";
	L['Weapons'] = "武器(毒药/强化等)";
	L["Auras Frame"] = "BUFF/DEBUFF 窗口";
	L["Achievement Frames"] = "成就窗口";
	L["GM Ticket Frame"] = "GM 对话框";
	L["Alert Frames"] = "弹出窗口";
	L['Alternative Power'] = "特殊能量条";	
	L["Loot Frames"] = "拾取框";
	L["Vehicle Seat Frame"] = "载具座位框";
	L["Watch Frame"] = "任务追踪框";
	L["Minimap"] = "小地图";
	L["Loot Frame"] = "拾取窗口";
	L["LootRoll Frame"] = "ROLL 框";
	L["Tooltip"] = "鼠标提示";
	L["Player Frame"] = "玩家框体";
	L["Target Frame"] = "目标框体";
	L["TargetTarget Frame"] = "目标的目标框体";
	L["Focus Frame"] = "焦点框体";
	L["FocusTarget Frame"] = "焦点目标框体";
	L["Pet Frame"] = "宠物框体";
	L["PetTarget Frame"] = "宠物目标框体";
	L["Party Frames"] = "队伍框体";
	L["Arena Frames"] = "竞技场框体"
	L["Boss Frames"] = "BOSS框体"
	L["Raid 1-25 Frames"] = "团队框架";
	L["MT Frames"] = "主坦克框体"
	L["MA Frames"] = "主助理框体"
	L["Attention Frames"] = "关注框体"
	L["raid2640"] = "40人团队";
	L['Bar 1'] = "动作条1";
	L['Bar 2'] = "动作条2";
	L['Bar 3'] = "动作条3";
	L['Bar 4'] = "动作条4";
	L['Bar 5'] = "动作条5";
	L['Bar 6'] = "动作条6";
	L['Bar 7'] = "动作条7";
	L['Bar 8'] = "动作条8";
	L['Bar 9'] = "动作条9";	
	L['Pet Bar'] = "宠物动作条";
	L['Stance Bar'] = "姿态条";
	L['Totem Bar'] = "图腾条";
	L['Boss Button'] = "特殊技能键";
	L["Top Infobar"] = "顶部信息条";
	L["BNet Frame"] = "战网提示信息";
	L['LeftChatPanel'] = "左聊天框面板";
	L['RightChatPanel'] = "右聊天框面板";	
	L['Micro Bar'] = "微型系统菜单栏"
end

-- Attention Frame
do
	L["ATTENTION_TIP1"] = "EUI玩家关注目标添加命令";
	L["ATTENTION_TIP2"] = "请选中你要关注的目标";
	L["ATTENTION_TIP3"] = "请先启用玩家关注目标功能";
	L["ATTENTION_TIP4"] = "战斗中不能使用此功能";
	L["ATTENTION_TIP5"] = " 已在关注列表中";
	L["ATTENTION_TIP6"] = " 已添加为关注目标";
	L["ATTENTION_TIP7"] = "EUI玩家关注目标移除命令";
	L["ATTENTION_TIP8"] = "请选中你要移除关注的目标";
	L["ATTENTION_TIP9"] = "关注列表中无此玩家";
	L["ATTENTION_TIP10"] = " 从关注列表中移除了";
end

-- SoraClassTimer
do
	L["SoraClassTimer"] = "法术监视"
		L["Sora's ClassTimer desc"] = "显示玩家小于60秒的BUFF, 目标小于60秒的DEBUFF.\n\n玩家DEBUFF只会显示白名单中的技能. 目标只会显示友好对象的小于60秒的BUFF.\n\n白名单中的技能不受60秒时间限制. 黑名单中的技能总是不显示的."
	L["Player Aura Timer"] = "玩家光环监视"
		L["Choise Timer Mode"] = "选择光环监视模式"
	L["Player Aura Timer Icon Size"] = "玩家光环图标尺寸"
	L["Target Aura Timer"] = "目标光环监视"
	L["Target Aura Timer Icon Size"] = "目标光环图标尺寸"
	L["Always will not be displayed"] = "总是不会显示的"
	L["Without a time limit of 60 seconds, and will always be displayed"] = "不受60秒时间限制,总是会显示的"
	L["Add New Aura ID"] = "添加新的光环ID"
	L["Delete Aura ID"] = "删除光环ID"
	L["Enable/Disable"] = "启用/禁用"
end

--ChatFilter
do
	L["Filter the bullshit messages from RaidAlert"] = '过滤RaidAlert信息';
	L["Filter the drunk messages:'... has drunked ...'"] = '过滤某人喝醉了...的信息';
	L["chatfilter"] = "信息过滤"
	L["Enabled"] = "启用"
	L["Scan ourself"] = "是否扫描自己的聊天信息"
	L["Scan friends"] = "是否扫描好友的聊天信息"
	L["Scan raid/party members"] = "是否扫描队友的聊天信息"
	L["Scan guildies"] = "是否扫描公会成员的聊天信息"
	
	L["Disable the profanityFilter"] = "关闭语言过滤器"
	L["Disable the alert joinleaveChannel"] = "关闭进出频道提示"
	
	L["Merge the messages:'You have learned/unlearned...'"] = "当切换天赋后合并显示“你学会了/忘却了法术…”"
	L["Filter the messages:'Your pet has learned/unlearned...'"] = "不显示“你的宠物学会了/忘却了…”"
	
	L["Merge the messages:'...has earned the achievement...'"] = "合并显示获得成就"
	L["Merge the messages:'You has created...'"] = "合并显示“你制造了…”"
	
	L["Filter the messages:'Auction created/cancelled'"] = "过滤“已开始拍卖/拍卖取消.”"
	L["Filter the messages:'... has defeated/fled from ... in a duel'"] =  "过滤“...在决斗中战胜了...”"
	
	L["Filter the advertising messages"] = "过滤广告信息"
	L["How many words can be allowd to use"] = "允许的关键字配对个数"
	
	L["Filter the multiple messages"] = "过滤多行信息"
	L["How many lines can be allowd"] = "允许的最大行数"
	
	L["Filter the repeat messages"] = "过滤重复聊天信息"
	L["Set the similarity between the messages"] = "设定重复信息相似度"
	L["Set the interval between the messages"] = "设定重复信息间隔时间"
	L["Set the max cache from the messages"] = "设定最多缓存多少条消息"
	L["Word BlackList"] = "关键词黑名单";
	L["Word WhiteList"] = "关键词白名单";
	L["Word BlackList intro"] = "黑名单中的关键词如果在聊天中出现, 则此条聊天信息不会显示";
	L["Word WhiteList intro"] = "白名单中的关键词如果在聊天中出现, 则此条聊天信息不受黑名单和其它任何限制总是会显示";
	L["BlackList"] = "黑名单列表";
	L["WhiteList"] = "白名单列表";
	L["New Word"] = "新增关键词";
	L["Delete Word"] = "删除关键词";		
	L["sender blanklist"] = "发言人黑名单";
	L["sender blanklist intro"] = "这些列表中的玩家发言将会被过滤掉";	
end

-- Combat text options
do
	L["combattext"] = "战斗文字"
	L["combattext desc"] = "设置命令/MSBT"
	L["blizz head numbers"] = "使用暴雪默认伤害/治疗模式（模型顶部/玩家头像）"
	L["damage style"] = "改变模型顶部/玩家头像的伤害/治疗字体"
	L["damage"] = "独立显示伤害输出"
	L["healing"]= "独立显示治疗输出"
	L["show hots"] = "显示hot造成的治疗"
	L["show overhealing"] = "显示过量治疗输出"
	L["pet damage"] = "显示宠物伤害输出"
	L["dot damage"] = "显示dot造成的伤害"
	L["damage color"] = "以法术系别颜色显示伤害文字"
	L["crit prefix"] = "文本左侧爆击效果修饰符号"
	L["crit postfix"] = "文本右侧爆击效果修饰符号"
	L["icons"] = "显示输出伤害技能图标"
	L["icon size"] = "伤害输出图标大小"
	L["treshold"] = "伤害输出信息最小阀值"
	L["heal treshold"] = "治疗承受信息/输出最小阀值"
	L["scrollable"] = "允许滑鼠调整滚动区域"
	L["max lines"] = "滚动区域显示最多行数"
	L["time visible"] = "信息保留时间(秒)"
	L["stop ve spam"] = "自动屏蔽吸血鬼之拥(@暗牧)的垃圾信息"
	L["dk runes"] = "显示死亡骑士符文恢复"
	L["killingblow"] = "显示击杀信息"
	L["merge aoe spam"] = "将AOE伤害合并为一条信息"
	L["merge aoe spam time"] = "AOE伤害合并信息阀值(秒)"
	L["dispel"] = "当你驱散成功的时候提示"
	L["interrupt"] = "当你打断成功的时候提示"
	L["combat text font size"] = "伤害字体尺寸"
	L["Scroll Direction"] = "滚动方向"
end

-- Bags
do
	L['BAGS_DESC'] = '调整EUI背包设置. 左键移动(位置不保存)';
	L['Bag Columns'] = '背包列数';
	L['Number of columns (width) of bags. Set it to 0 to match the width of the chat panels.'] = '背包列数(宽度), 设为0自动匹配右聊天框宽度.';
	L['Bank Columns'] = '银行列数';
	L['Number of columns (width) of the bank. Set it to 0 to match the width of the chat panels.'] = '银行列数(宽度), 设为0自动匹配左聊天框宽度.';
	L['Sort Orientation'] = '排序方向';
	L['Direction the bag sorting will use to allocate the items.'] = '整理背包时物品排序方向.';
	L['Bottom to Top'] = '底部到顶部';
	L['Top to Bottom'] = '顶部到底部';
	L['Panel Width (Bags)'] = "背包面板宽度";
	L['Toggle Bags'] = '开关背包';
	L['Align To Chat'] = '对齐到聊天框';
	L['Panel Width (Bank)'] = '银行面板宽度';
	L['Adjust the width of the bank frame.'] = '调整银行背包框体宽度';
	L['Button Size (Bag)'] = '背包格子尺寸';
	L['Align the width of the bag frame to fit inside the chat box.'] = '调整背包框的宽度以适应聊天框';
	L['Adjust the width of the bag frame.'] = '调整背包框体宽度';
	L['The size of the individual buttons on the bank frame.'] = '银行框体单个格子的尺寸';
	L['The size of the individual buttons on the bag frame.'] = '背包框体单个格子的尺寸';
	L['Button Size (Bank)'] = '银行背包格子尺寸';
end

-- Reminder
do
	L["Add Group"] = "添加组";
	L["Any"] = "任意"
	L["Caster"] = "施法者"
	L["Combat"] = "战斗"
	L["Group already exists!"] = "组已经存在!!"
	L["If any spell found inside this list is found the icon will hide as well"] = "列表中的任何技能图标将会被隐藏"
	L["Inside BG/Arena"] = "战场/竞技场内"
	L["Inside Raid/Party"] = "团队或队伍内"
	L["Instead of hiding the frame when you have the buff, show the frame when you have the buff. You must have either a Role or Spec set for this option to work."] = "隐藏框体, 显示框体你必需通过职责或天赋检查使此选项生效."
	L["Level Requirement"] = "等级需求"
	L["Level requirement for the icon to be able to display. 0 for disabled."] = "达到等级才能显示. 0则禁用."
	L["Negate Spells"] = "不想要的法术"
	L["New ID"] = "新ID"
	L["New ID (Negate)"] = "新ID(不想要的)"
	L["Only check if the buff is coming from you."] = "只检查BUFF是否是你的."
	L["Only run checks during combat."] = "只检查是否在战斗中."
	L["Only run checks inside BG/Arena instances."] = "只检查是否在战场/竞技场中."
	L["Only run checks inside raid/party instances."] = "只检查是否在队伍/团队中."
	L["Personal Buffs"] = "个人 Buffs"
	L["REMINDER_DESC"] = "此模块将在屏幕中显示一个警告的图标, 当你少某个BUFF或有某个不想要的BUFF."
	L["Reminders"] = "BUFF 提示"
	L["Remove Group"] = "删除组"
	L["Remove ID"] = "删除 ID"
	L["Remove ID (Negate)"] = "删除 ID (不想要的)"
	L["Reverse Check"] = "逆向检查"
	L["Role"] = "职责"
	L["Select Group"] = "选择组"
	L["Set a talent tree to not follow the reverse check."] = "设置天赋树不按照逆向检查."
	L["Spell not found in list"] = "列表中未发现技能"
	L["Spells"] = "技能"
	L["Talent Tree"] = "天赋树"
	L["Tree Exception"] = "树异常"
	L["Value must be a number"] = "值必须是一个数字"
	L["You can't remove a default group from the list, disabling the group."] = "你不能删除内置组,可以禁用它."
	L["You must be a certain role for the icon to appear."] = "你必需有一个可靠的职责来显示此图标."
	L["You must be using a certain talent tree for the icon to show."] = "你必需使用一个可靠的天赋树来显示图标."
	L["Sound"] = "声音"
	L["Sound that will play when you have a warning icon displayed."] = "当警告图标显示时播放声音."
	L["Change this if you want the Reminder module to check for weapon enchants, setting this will cause it to ignore any spells listed."] = "改变BUFF提示模块来检查武器附魔, 设置这个将导致它忽略所有的技能列表."
	L["Group By"] = "组按"
	L["Set the order that the group will sort."] = "设置组排序的顺序."
	L["Spell"] = "技能"
	L["Weapon"] = "武器"
	L["Attempted to show a reminder icon that does not have any spells. You must add a spell first."] = "尝试显示一个提示但没有任何技能。你必须先添加一个技能."
	L["Strict Filter"] = "严格匹配"
	L["This ensures you can only see spells that you actually know. You may want to uncheck this option if you are trying to monitor a spell that is not directly clickable out of your spellbook."] = "这将保证只会显示你已经学会的技能. 你可能想取消这个选项, 如果你想监视一个你不会的技能."	
	L["Disable Sound"] = "禁用声音"
	L["Don't play the warning sound."] = "不播放警告声音."	
	L['CD Fade'] = "透明度";
	L["Cooldown"] = "CD";
	L["Spell ID"] = "技能ID";
	L["OnCooldown"] = "CD时";
	L["SHOW"] = "显示";
	L["HIDE"] = "隐藏";
end

--FindIt
do
	L["FindIt"] = "搜索模块";
	L["Search achievement, item and spell... etc."] = "可用来搜索成就,物品和技能等, 注意搜索物品时只能填入物品ID, 点击搜索结果可发送至聊天框查看详细内容.";
	L["Find Type"] = "类别";
	L["achievement"] = "成就";
	L["currency"] = "货币";
	L["dungeon"] = "副本";
	L["faction"] = "阵营";
	L["item"] = "物品";
	L["spell"] = "法术";
	L["MSG"] = "内容";
	L["Search"] = "搜索";
	L["Non-ID lookups for items are disabled!"] = "物品搜索因BLZ限制只能填入物品ID";
	L["Search result"] = "搜索结果";
end

--Q&A
do
	L["Q&A"] = "常见问题解答"
	L["Q1"] = "初次使用EUI, 进入游戏后界面混乱, 很多报错等..."
		L["A1"] = "EUI是个完整功能的WOW插件, 不能与其它的整合插件如魔盒,大脚等同时使用, 也不要和其它OUF插件共用."
	L["Q2"] = "设置界面上一些术语的解释"
		L["A2"] = "人物模型头顶的那个叫姓名版, 显示玩家,目标等血量的框体包含在单位框体内,相关选项如BUFF,DEBUFF,施法等都可以在其入找到, 过滤器包含两种工作方式,黑名单方式和白名单方式,大部份内置默认为白名单"
	L["Q3"] = "如何监视玩家自已的一些触发BUFF或目标身上的DEBUFF效果"
		L["A3"] = "EUI内置三种监视模块,在设置界面上00开头的蓝色字体的三种,默认启用的光环条模块, 此模块可移动, 可调尺寸，显示方式为计时条, 添加监视内容在光环条页的过滤页里. 这三种模块最好只开一种,否则比较混乱, 除了职业计时条其它两种模块可以通过L解锁移动."
	L["Q4"] = "如何调整界面上各个框体的位置"
		L["A4"] = "点左聊天框右上角的L,可以快速解锁界面上各元件,如果被挡住,也可点小地图的右下角的C,或主菜单中的EUI进入, 或者输入/ec命令访问, 设置界面有个解锁按钮."
	L["Q5"] = "如何移动施法条的位置和改变尺寸"
		L["A5"] = "在设置界面的单位框体里,找到玩家框体, 注意右上角的下拉菜单, 在其内找到施法条, 调节X,Y值可移动位置,点显示/隐藏按钮可预览施法条."
	L["Q6"] = "透明主题如何开启"
		L["A6"] = "透明主题的总开关在材质和字体设置页的中下部, 单位框体的一般设置页的透明主题开关单独影响单位框体模块,但受总开关控制"
	L["Q7"] = "人物, 法术书等系统菜单到哪儿找"
		L["A7"] = "EUI对这部份进行了精简, 可通过右击顶部信息条,或在小地图框内按鼠标中键来访问此菜单"
	L["Q8"] = "UI缩放问题"
		L["A8"] = "EUI接管了系统自带的UI缩放,在一般设置里, 默认是使用自动缩放, 如果不合适,可关闭自动缩放,手工调整后面的缩放值, 每次调整后,需/rl重载生效."
	L["Q9"] = "大脚表情和角色数据报告在哪儿? 5人副本的功略呢?"
		L["A9"] = "在左聊天框E是表情,S是发送角色报告, 旁边的脚丫图标是开关大脚世界频道的,L是框体解锁. 在5人FB里选中BOSS为目标输入/boss命令可发送功略"
	L["Q10"] = "背包在哪儿调"
		L["A10"] = "EUI V4开始不带Baudbag背包了,内置整合背包,可直接左键移动，并可保存位置，可调网络尺寸, 在EUI设置界面的背包页里调整"
	L["Q11"] = "双天赋切换界面及配置文件等问题"
		L["A11"] = "在设置界面的配置页里, 可以新建一个配置文件, 然后勾选双天赋配置,可设置好主副天赋的配置文件, 这样切换天赋后就会自动切换配置文件,达到新界面的效果. 当然你也可以手动切换,比如打副本一个配置,PVP一个等."
	L["Q12"] = "潜行者的影舞和潜行能不能区分动作条"
		L["A12"] = "在设置界面的动作条页里, 找到动作条1, 在翻页设置中改为[stance:1] 7;  [stance:2] 7; [stance:3] 10;"
	L["Q13"] = "界面边框颜色,血量颜色等如何调整."
		L["A13"] = "界面整体边框, 背景颜色在一般设置的中下部设置, 职业色血条在单位框体的一般设置页里最下面有职业色血量显示等."
	L["Q14"] = "在10人副本,或25人副本中如何显示出所有的队伍."
		L["A14"] = "在单位框体的一般设置中,关闭智能团队过滤即可, 团队框架将会显示其设置值允许的队伍数,默认为8"
	L["Q15"] = "如何将Skada, recount等插件装入右边聊天框中."
		L["A15"] = "在设置界面的聊天框页里, 有个右聊天框嵌入, 并可选择战斗切换."
	L["Q16"] = "聊天框乱了或没了, 怎么办?"
		L["A16"] = "进入EUI设置(/ec)点安装, 点到设置聊天框这一步就行了. 如果左右聊天框不小心点到最左下角或最右角隐藏掉的话,只要在最左下角或右下角相同位置再点一下就会出现."
	L["Q17"] = "聊天框中的人名,装备,物品不能点了怎么办?"
		L["A17"] = "鼠标右击点击聊天框的综合, 去除'使其不可交互'选项."
	L["Q18"] = "右上角的BUFF显示不完整怎么办."
		L["A18"] = "在系统界面游戏,增益效果和负面效果里,去除整理增益效果开关."
	L["Q19"] = "伤害显示在哪儿打开?"
		L["A19"] = "EUI默认使用暴雪内置的伤害显示模式, 当然也集成了XCT,开关设置界面的战斗文字里, 如果要显示承受伤害,记得打开系统界面浮动战斗信息里的我的浮动战斗信息"		
	L["Q20"] = "稀有怪报警插件等怎么没有呀"
		L["A20"] = "EUI默认只有一些必需的插件, 这些插件可通过EUI自动更新器的可选插件进行下载安装"
	L["Q21"] = "BOSS技能计时条怎么移动"
		L["A21"] = "这个是DBM插件的功能, /DBM调出设置界面,在计时条选项里可以解锁移动"
	L["Q22"] = "其它单体插件与EUI的兼容性问题"
		L["A22"] = "原则上EUI兼容所有的单体插件,但注意如果单体插件提供的功能是EUI已经有的功能,则可能造成冲突.如右上角的BUFF显示插件."
	L["Q23"] = "常用设置命令有哪些"
		L["A23"] = "/ec 打开设置界面\n /luaerror 开关显示插件错误 \n /egrid 显示网格线方便对齐\n /moveui 解锁框体移动\n /resetui 重置EUI插件\n /resetgold 重设金币统计\n /frammode 采集模式小地图\n /kb 设置动作条快捷键\n /skada toggle 开关Skada窗口"
end		

--Tukui_ElvUI_Skins
L['AddOns'] = "插件美化包";
L['Misc Options'] = "杂项设置";
L['Square minimap icons'] = "方形小地图图标";
L['DBM Half-bar Skin'] = 'DBM 半高样式';
L['Recount Backdrop'] = "Recount 背景";
L['Skada Backdrop'] = "Skada 背景";
L['Embed Settings'] = "聊天框内嵌设置";
L['Settings to control addons embedded in right chat panel'] = "控制插件嵌入到右聊天框面板";
L['Hide while out of combat'] = "脱离战斗时隐藏";
L['Attach SexyCD to action bar'] = "附加 SexyCD 到动作条";