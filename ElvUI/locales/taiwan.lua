local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhTW")
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
	L["You have changed your UIScale, however you still have the AutoScale option enabled in ElvUI. Press accept if you would like to disable the Auto Scale option."] = '你改變了UI縮放比率,但是你仍啟用了EUI的自動縮放, 點確定將禁用自動縮放並重載界面.';
	L["One or more of the changes you have made require a ReloadUI."] = "一個或更多的改變,需要重載插件";
	L["A taint has occured that is preventing you from using your talents/glyphs, this can happen if you've inspected someone. Unfortionatly theres nothing we can do to fix it, please reload your ui and try again."] = "壹個戰鬥汙染發生在你查看天賦/幻化窗口時, 你可以輸入/rl 重載界面.";
end

--General
do
	L['Dark'] = '黑暗';
	L["High Resolution"] = '高分辨率';
	L['Low Resolution'] = '低分辨率';
	L['Nudge'] = '微調';
	L['Location Text'] = '地區文字';
	L['Change settings for the display of the location text that is on the minimap.'] = '改變小地圖上地區名稱文字顯示方式';
	L['Minimap Mouseover'] = '鼠標滑過顯示';
	L['Always Display'] = '總是顯示';
	L['Hide'] = '隱藏';
	L['Top Panel'] = '頂部面板';
	L['Display a panel across the top of the screen. This is for cosmetic only.'] = '顯示跨越屏幕頂部的面板,僅僅是用于裝飾';
	L['Bottom Panel'] = '底部面板';
	L['Display a panel across the bottom of the screen. This is for cosmetic only.'] = '顯示跨越屏幕底部的面板,僅僅是用于裝飾';
	L["Menu"] = '主菜單';
	L["RaidTool"] = '團隊工具';
	L["Shortcuts"] = '快捷操作';
	L["UF Style"] = '框體樣式';
	L["AB Style"] = '動作條樣式';
	L["Name Font"] = '名字字體';
	L["The font that appears on the text above players heads. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"] = '這控制玩家頭頂上名字的字體.|cffFF0000警告:這需要重新進入遊戲才能生效.|r'
	L['Enable/Disable the minimap. |cffFF0000Warning: This will prevent you from seeing the consolidated buffs bar, and prevent you from seeing the minimap datatexts.|r'] = "啓用/禁用小地圖, |cffFF0000警告: 這將影響到綜合BUFF條的顯示和小地圖下面的信息文字顯示";
	L["Version"] = true;
	L["Enable"] = "啟用";

	L["General"] = "一般設置";
	L["ELVUI_DESC"] = "EUI [ElvUI-Edit] 是一個用來替換WOW原始插件的用戶介面. http://eui.cc";
	L["Auto Scale"] = "自動縮放";
		L["Automatically scale the User Interface based on your screen resolution"] = "根據你的解析度自動縮放UI介面";
	L["UI Scale"] = "UI缩放比例";
		L["Controls the scaling of the entire User Interface"] = "縮放用戶介面縮放比例";
	L["None"] = "無";
	L["You don't have permission to mark targets."] = "你沒有許可權標誌目標";
	L['LOGIN_MSG'] = '歡迎使用 %sEUI [ElvUI-Edit]|r 版本 %s%s|r, 鍵入 /ec 來訪問設置介面. 如果你需要技術支持請訪問 http://www.eui.cc';
	L['Login Message'] = "登陸資訊";
	
	L["Reset Anchors"] = "重設位置";
	L["Reset all frames to their original positions."] = "重新設置所有框體到它們的默認位置";
	
	L['Install'] = "安裝";
	L['Run the installation process.'] = "運行安裝進程";
	
	L["Credits"] = "創作組";
	L['ELVUI_CREDITS'] = "我想用一個特別的方式感謝那些測試,翻譯和通過捐助幫助我的人. 請捐助過的人在論壇中PM給我, 我將把你的名字添加到這兒."
	L['Coding:'] = "翻譯";
	L['Testing:'] = "測試";
	L['Donations:'] = "捐助";
	
	--Installation
	L["Welcome to ElvUI version %s!"] = "歡迎使用 EUI [ElvUI-Edit] 版本 %s";
	L["This install process will help you learn some of the features in ElvUI has to offer and also prepare your user interface for usage."] = "此安裝過程將幫助你瞭解 EUI [ElvUI-Edit] 特性";
	L["The in-game configuration menu can be accesses by typing the /ec command or by clicking the 'C' button on the minimap. Press the button below if you wish to skip the installation process."] = "內建的設置介面可以通過 /ec 命令來訪問, \n或點擊小地圖旁邊的 C 按鈕來打開. \n如果你想跳過安裝過程按下麵的按鈕";
	L["Please press the continue button to go onto the next step."] = "請按繼續按鈕到下一步";
	L["Skip Process"] = "跳過";
	L["ElvUI Installation"] = "EUI [ElvUI-Edit] 安裝";
	
	L["CVars"] = true;
	L["This part of the installation process sets up your World of Warcraft default options it is recommended you should do this step for everything to behave properly."] = "此步驟是來改變你的WOW一些默認設置";
	L["Please click the button below to setup your CVars."] = "請點擊下麵的按鈕設置 CVars";
	L["Setup CVars"] = "設置 CVars";
	
	L["Importance: |cff07D400High|r"] = "重要性: |cff07D400高|r";
	L["Importance: |cffD3CF00Medium|r"] = "重要性: |cffD3CF00中|r";

	L["Chat"] = "聊天";
	L["This part of the installation process sets up your chat windows names, positions and colors."] = "此部份的安裝將會設置你聊天框的名字,位置和顏色";
	L["The chat windows function the same as Blizzard standard chat windows, you can right click the tabs and drag them around, rename, etc. Please click the button below to setup your chat windows."] = "此聊天框與WOW原始聊天框功能相似的, 你可以拖拉標籤來移動或重命名等. 請點擊下麵的按鈕設置你的聊天窗口.";
	L["Setup Chat"] = "設置聊天框";
	L['AutoHide Panels'] = "自動隱藏面板";
	L['When a chat frame does not exist, hide the panel.'] = "當聊天框不存在時,自動隱藏面板";
	
	L["Installation Complete"] = "安裝過程";
	L["You are now finished with the installation process. Bonus Hint: If you wish to access blizzard micro menu, middle click on the minimap. If you don't have a middle click button then hold down shift and right click the minimap. If you are in need of technical support please visit us at www.tukui.org."] = "你已經完成安裝過程. 訪問WOW系統菜單,請中擊小地圖, 如果你沒有中鍵, 請按住SHIFT鍵右擊小地圖. 如需技術支持請訪問 www.eui.cc.";
	L["Please click the button below so you can setup variables and ReloadUI."] = "請點擊下麵的按鈕設置變數並重載介面";
	L["Finished"] = "完成";
	L["CVars Set"] = "CVars 設置";
	L["Chat Set"] = "聊天設置";
	L['Trade'] = "交易";
	
	L['Panels'] = "面板(聊天框)";
	L['Announce Interrupts'] = "打斷通告";
	L['Announce when you interrupt a spell to the specified chat channel.'] = "在指定頻道通報技能打斷資訊";	
	L["Movers unlocked. Move them now and click Lock when you are done."] = "移動鎖定. 現在可以移動它們移好了點擊鎖定.";
	L['Lock'] = "鎖定";	
	L["This can't be right, you must of broke something! Please turn on lua errors and report the issue to Elv http://www.tukui.org/forums/forum.php?id=146"] = "請到介面幫助裏打開顯示LUA錯誤,並把錯誤報告給我 http://www.eui.cc";
	
	L['Panel Width'] = "面板寬度";
	L['Panel Height'] = "面板高度";
	L['PANEL_DESC'] = '調整左右聊天框的尺寸, 這會影響到你的聊天和背包.';
	L['URL Links'] = "網址鏈結";
	L['Attempt to create URL links inside the chat.'] = "在聊天框中創建超鏈結";
	L['Short Channels'] = "頻道名縮寫";
	L['Shorten the channel names in chat.'] = "縮短聊天頻道的名字";
	L["Are you sure you want to reset every mover back to it's default position?"] = "你確信你想重置移動的框體到它的默認位置?";
	
	L['Panel Backdrop'] = "聊天框背景";
	L['Toggle showing of the left and right chat panels.'] = "控制左右聊天框背景顯示的開關";
	L['Hide Both'] = "全部隱藏";
	L['Show Both'] = "全部顯示";
	L['Left Only'] = "只顯示左邊";
	L['Right Only'] = "只顯示右邊";	
	
	L['Tank'] = "坦克";
	L['Healer'] = "治療";
	L['Melee DPS'] = "混合DPS";
	L['Caster DPS'] = "法系DPS";
	L["Primary Layout"] = "第一樣式";
	L["Secondary Layout"] = "第二樣式";
	L["Primary Layout Set"] = "第一樣式設置";
	L["Secondary Layout Set"] = "第二樣式設置";
	L["You can now choose what layout you wish to use for your primary talents."] = "你能為你的主天賦選擇樣式.";
	L["You can now choose what layout you wish to use for your secondary talents."] = "你能為你的副天賦選擇樣式.";
	L["This will change the layout of your unitframes, raidframes, and datatexts."] = "這些將改變你的頭像框體,團隊框體和資訊文字."	
	
	L['INCOMPATIBLE_ADDON'] = "插件 %s 不相容與EUI的 %s 模組。請禁用插件或模組.";
	
	L['Panel Texture (Left)'] = "左面板材質";
	L['Panel Texture (Right)'] = "右面板材質";
	L['Specify a filename located inside the World of Warcraft directory. Textures folder that you wish to have set as a panel background.\n\nPlease Note:\n-The image size recommended is 256x128\n-You must do a complete game restart after adding a file to the folder.\n-The file type must be tga format.\n\nExample: Interface\\AddOns\\ElvUI\\media\\textures\\copy\n\nOr for most users it would be easier to simply put a tga file into your WoW folder, then type the name of the file here.'] = "為聊天面板的背景指定一個材質檔.\n\n請注意: \n -建議圖像大小為256*128\n -添加檔到檔夾後請重新啟動遊戲.\n -檔類型必須是TGA格式\n -舉例: \n   Interface\\Addons\\Euiscript\\1 \n   Interface\\Addons\\Euiscript\\2 \n\n -對於大多數用戶會更容易簡單地把一個TGA檔放到你的魔獸檔夾，然後鍵入檔案名。";
	L["Are you sure you want to disband the group?"] = "你確信要解散隊伍麼?";
	
	L["Your version of ElvUI is out of date. You can download the latest version from www.tukui.org"] = "已檢測到新版本的 EUI，請使用自動更新器獲取最新版本或訪問 www.eui.cc";
	
	L["Primary Texture"] = "主材質"
	L["The texture that will be used mainly for statusbars."] = "此材質將被應用於主要的狀態條."
	L["Secondary Texture"] = "次材質"
	L["This texture will get used on objects like chat windows and dropdown menus."] = "此材質將被應用於聊天窗口和下拉菜單類."	
	L['Accept Invites'] = "自動接受邀請";
	L['Automatically accept invites from guild/friends.'] = "自動接受來自公會/好友的組隊邀請";
	L["Classcolor Theme"] = "職業色主題";
	L["Transparent Theme"] = "透明主題";
	L["Transparent Theme desc"] = "開啟後單位框體的能量條偏移樣式會失效,建議關閉血量按數值變化,修改生命值顏色為紅色";
	L["One or more of the changes you have made will effect all characters using this addon. You will have to reload the user interface to see the changes you have made."] = "一個或更多的變更將影響使用此插件的所有角色, 你必需重新載入UI才能生效.";
	L["Layout"] = "佈局";
	L["You can now choose what layout you wish to use based on your combat role."] = "你現在能選擇一個符合你身份的佈局";
	L["Resolution"] = "解析度";
	L["Your current resolution is %s, this is considered a %s resolution."] = "你的當前解析度是 %s, 這是一個 %s 解析度.";
	L["high"] = "高";
	L["low"] = "低";
	L["Click the button below to resize your chat frames, unitframes, and reposition your actionbars."] = "點擊下麵的按鈕將調整你的聊天框, 單位框體和動作條位置";
	L["Resolution Setup"] = "解析度設置";
	L["This resolution requires that you change some settings to get everything to fit on your screen."] = "當前解析度需你改變一些設置來適應你的螢幕";
	L["This resolution doesn't require that you change settings for the UI to fit on your screen."] = "當前解析度無需調整就能適應你的螢幕";
	L["Importance: |cffFF0000Low|r"] = "重要性: |cffFF0000低|r";
	L["This is completely optional."] = "這是一個可選操作";
	L["You may need to further alter these settings depending how low you resolution is."] = "你可能需要進一步修改設置來適應這麼低的解析度.";
	L["Resolution Style Set"] = "解析度樣式設置";	
	L['Layout Set'] = "布局設置";
	L['Minimap Size'] = "小地圖尺寸";
	L['Adjust the size of the minimap.'] = "調整小地圖的尺寸";
	L['Raid Reminder'] = "副本BUFF提示";
	L['Display raid reminder bar on the minimap.'] = "在小地圖旁邊顯示副本BUFF提示條";	
	L['Detected either the Routes or GatherMate2 addon running, if you wish to use these addons with ElvUI you must type the /farmmode command.'] = "檢測到採集插件Routs,GatherMate2運行,你必需使用/farmmode模式下的小地圖來顯示採集點"	
	L['Grid Size:'] = "网格尺寸:"
	L['Aura perRow'] = "每行Buff/Debuff的數量";
	L["BN:"] = true;
	L['Profile Binds'] = "配置綁定";
	L['Save your keybinds with your ElvUI profile. That way if you have the dual spec feature enabled in ElvUI you can swap keybinds with your specs.'] = "保存快捷鍵綁定到你的配置檔中. 如果你開啟雙天賦切換的話,將會隨著天賦切換你的快捷鍵設置";
	L['Chat Bubbles'] = "聊天泡泡";
	L['Skin the blizzard chat bubbles.'] = "美化暴雪聊天泡泡";	
	L['Multisample Fix'] = "多重採樣修正";
	L['Attempt to fix blurry borders when using a multisample setting that is greater than one. |cffFF0000WARNING: This is extremely experimental and may cause issues with gameplay.|r'] = '嘗試來解決當多重採樣設置大於1時發生的邊框模糊問題. |cffFF0000警告: 此選項為實驗功能, 可能導致遊戲異常.|r';
	L['|cFFE30000Lua error recieved. You can view the error message when you exit combat.'] = '|cFFE30000LUA錯誤已接收, 退出戰鬥後顯示.|r';
	L["%s: %s tried to call the protected function '%s'."] = "%s: %s 嘗試調用保護函數 '%s'.";
	L["No locals to dump"] = true;	
	L["First"] = "第一個";
	L["Last"] = "最後";	
	L['Minimap Panels'] = "小地圖資訊條";
	L['Display minimap panels below the minimap, used for datatexts.'] = "在小地圖下方顯示一個資訊條用來放置資訊文字";		
	L["A setting you have changed will change an option for this character only. This setting that you have changed will be uneffected by changing user profiles. Changing this setting requires that you reload your User Interface."] = "您已更改的設置將改變這個角色的一個選項，您需要重新加載你的用戶介面.";	
	L['Theme Set'] = "主題設置";
	L['Theme Setup'] = "設置主題";
	L['Choose a theme layout you wish to use for your initial setup.'] = "選擇一個主題樣式為你的初始設置";
	L['You can always change fonts and colors of any element of elvui from the in-game configuration.'] = "你能在EUI的設置中改變字體,顏色等選項";
	L['Classic'] = "經典";
	L['Classic Pixel'] = true;
	L['Toggle Chat Frame'] = "開關聊天框";
	L['Toggle Embedded Addon'] = "開關內嵌插件";
	L['Left Click:'] = "左鍵:";
	L['Right Click:'] = "右鍵:";		
	L['Toggle Tutorials'] = "教學開關";
	L['Config Mode:'] = "设置模式:";
	L["Select the type of aura system you want to use with ElvUI's unitframes. The integrated system utilizes both aura-bars and aura-icons. The icons only system will display only icons and aurabars won't be used."] = '選擇你要顯示在單位框體上的光環系統, "綜合"將顯示圖標和光環條, "圖標"將只顯示圖標,不顯示光環條.';
	L["If you have an icon or aurabar that you don't want to display simply hold down shift and right click the icon for it to disapear."] = "如果你有壹個圖標或光環條不想顯示的話,只需按住shift 並右擊它的圖標即可.";
	L['Integrated'] = '綜合';
	L['Icons Only'] = '圖標';
	L["Because of the mass confusion caused by the new aura system I've implemented a new step to the installation process. This is optional. If you like how your auras are setup go to the last step and click finished to not be prompted again."] = "爲了防止新的光環條引起的混亂,我准備了壹個新的安裝步驟, 在安裝過程中,這是可選的.";	
end

--Aura
do
	L['Remaining Time'] = '剩餘時間';
	L['consolidateTo'] = '收集綜合BUFF';
	L['Consolidated buffs will be consolidate to consolideBuffs'] = '將收集綜合BUFF至綜合BUFF條中';
	L['Filter Consolidated'] = '過濾綜合BUFF';
	L['Only show consolidated icons on the consolidated bar that your class/spec is interested in. This is useful for raid leading.'] = '只顯示與你職業和天賦相關的綜合BUFF圖標'
	L['AURAS_DESC'] = '配置出現在小地圖附近的BUFF/DEBUFF.';
	L['Consolidated Buffs'] = '綜合BUFF';
	L['Display the consolidated buffs bar.'] = '顯示綜合BUFF條';
	L['Set the size of the individual auras.'] = '設置個人光環尺寸';
	L['Wrap After'] = '每行數目';
	L['Begin a new row or column after this many auras.'] = '在多少個BUFF/DEBUFF後換行';
	L['X Spacing'] = '水準間隔';
	L['Y Spacing'] = '垂直間隔';
	L['Sort Method'] = '排序方式';
	L['Defines how the group is sorted.'] = '定義的組進行排序';
	L['Index'] = '索引'
	L['Time'] = '時間';
	L['Name'] = '名稱';
	L['Sort Direction'] = '排序方向';
	L['Defines the sort order of the selected sort method.'] = '定義所選排序方法的排序順序';
	L['Max Wraps'] = '最大行數';
	L['Limit the number of rows or columns.'] = '限制行或列的數量';
	L['Seperate'] = '分離式';
	L['Indicate whether buffs you cast yourself should be separated before or after.'] = '你施放的BUFF在前面或後面分開';
	L["Other's First"] = '其他的第一';
	L['No Sorting'] = '不排序';
	L['Your Auras First'] = '你第一個光環';
	L["Fade Threshold"] = '變化閥值'
	L['Threshold before text changes red, goes into decimal form, and the icon will fade. Set to -1 to disable.'] = '變成紅色文字前的閥值,進入小數形式, 圖標會閃爍. 設置為 -1 禁用'
end

--Media
do	
	L["Media"] = "材質字體";
	L["Fonts"] = "字體";
	L["Font Size"] = "字體尺寸";
		L["Set the font size for everything in UI. Note: This doesn't effect somethings that have their own seperate options (UnitFrame Font, Datatext Font, ect..)"] = "設置介面上所有字體尺寸,但不影響到那些有獨立設置的(如單位框體字體,資訊文字字體等...)";
	L["Default Font"] = "默認字體";
		L["The font that the core of the UI will use."] = "此字體是介面的核心字體";
	L["UnitFrame Font"] = "單位框體字體";
		L["The font that unitframes will use"] = "此字體被單位框體使用";
	L["CombatText Font"] = "戰鬥文字字體";
		L["The font that combat text will use. |cffFF0000WARNING: This requires a game restart or re-log for this change to take effect.|r"] = "此字體被戰鬥檔使用, |cffFF0000需要重新啟用遊戲或重登錄才會生效.|r";
	L["Textures"] = "材質";
	L["StatusBar Texture"] = "狀態條材質";
		L["Main statusbar texture."] = "主狀態條材質";
	L["Gloss Texture"] = "光亮材質";
		L["This gets used by some objects."] = "只被一些目標使用";
	L["Colors"] = "顏色";
	L["Border Color"] = "邊框顏色";
		L["Main border color of the UI."] = "介面主邊框顏色";
	L["Backdrop Color"] = "背景顏色";
		L["Main backdrop color of the UI."] = "介面主背景色";
	L["Backdrop Faded Color"] = "背景透明色";
		L["Backdrop color of transparent frames"] = "透明框體的背景顏色";
	L["Restore Defaults"] = "恢復默認";
		
	L["Toggle Anchors"] = "解鎖開關";
	L["Unlock various elements of the UI to be repositioned."] = "解鎖介面上的各種元件用來移動位置";
	
	L["Value Color"] = "數值顏色";
	L["Color some texts use."] = "一些字段使用的顏色";
end

--NamePlate Config
do
	L['Mistweaver'] = '織霧';
	L['Background Multiplier'] = "背景色透明度";
	L['The backdrop of the nameplates color is scaled to match the color of the nameplate by this percentage. Set to zero to have no color in the nameplate backdrop.'] = "姓名版背景色透明度, 設為0時姓名版背景沒有顏色(黑色)";
	L['Additional Filter'] = '額外的過濾器';
	L["NamePlates"] = "姓名版";
	L["NAMEPLATE_DESC"] = "修改姓名版設置.";
	L["Width"] = "寬度";
		L["Controls the width of the nameplate"] = "控制姓名版的寬度";
	L["Height"] = "高度";
		L["Controls the height of the nameplate"] = "控制姓名版的高度";
	L["Good Color"] = "安全色";
		L["This is displayed when you have threat as a tank, if you don't have threat it is displayed as a DPS/Healer"] = "做為坦克時獲得仇恨, 或做為DPS/治療時沒有獲得仇恨的顏色";
	L["Bad Color"] = "危險色";
		L["This is displayed when you don't have threat as a tank, if you do have threat it is displayed as a DPS/Healer"] = "做為坦克時未獲得仇恨, 或做為DPS/治療時獲得仇恨的顏色";
	L["Good Transition Color"] = "安全過渡色";
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when gaining threat, for a dps/healer it would be displayed when losing threat"] = "做為坦克將獲得仇恨,或做為DPS/治療將丟失仇恨時顯示的顏色";
	L["Bad Transition Color"] = "危險過渡色";
		L["This color is displayed when gaining/losing threat, for a tank it would be displayed when losing threat, for a dps/healer it would be displayed when gaining threat"] = "做為坦克將丟失仇恨,或做為DPS/治療將獲得仇恨";	
	L["Castbar Height"] = "施法條高度";
		L["Controls the height of the nameplate's castbar"] = "控制姓名版施法條的高度";
	L["Health Text"] = "生命值";
		L["Toggles health text display"] = "生命值顯示開關";
	L["Personal Debuffs"] = "個人Debuff";
		L["Display your personal debuffs over the nameplate."] = "在姓名版上顯示你個人的Debuffs";
	L["Display level text on nameplate for nameplates that belong to units that aren't your level."] = "在姓名版上顯示該單位的等級,不是你的等級";
	L["Enhance Threat"] = "仇恨增強";
		L["Color the nameplate's healthbar by your current threat, Example: good threat color is used if your a tank when you have threat, opposite for DPS."] = "根據你的天賦改變姓名版血條的顏色";
	L["Combat Toggle"] = "戰鬥切換";
		L["Toggles the nameplates off when not in combat."] = "不在戰鬥時自動關閉姓名版";
	L["Friendly NPC"] = "友好的NPC";
	L["Friendly Player"] = "友好的玩家";
	L["Neutral"] = "中立";
	L["Enemy"] = "敵對";
	L["Threat"] = "仇恨";
	L["Reactions"] = "聲望";
	L["Filters"] = "過濾";
	L['Add Name'] = "添加名字";
	L['Remove Name'] = "刪除名字";
	L['Use this filter.'] = "使用篩檢程式";
	L["You can't remove a default name from the filter, disabling the name."] = "你不能刪除篩檢程式的默認名字, 禁用此名字";
	L['Hide'] = "隱藏";
		L['Prevent any nameplate with this unit name from showing.'] = "阻止此單位名字的姓名版顯示";
	L['Custom Color'] = "定制顏色";
		L['Disable threat coloring for this plate and use the custom color.'] = "禁用仇恨顏色,並使用定制顏色";
	L['Custom Scale'] = "定制比例";
		L['Set the scale of the nameplate.'] = "設置姓名版的縮放比例";
	L['Good Scale'] = "安全比例";
	L['Bad Scale'] = "危險比例";
	L["Auras"] = "光環";
	L['Healer Icon'] = "治療標誌";
	L['Display a healer icon over known healers inside battlegrounds.'] = "在戰場上顯示治療標誌";
	L['Restoration'] = "恢復";
	L['Holy'] = "神聖";
	L['Discipline'] = "戒律";	
	L['Filter already exists!'] = "過濾器已存在!";
end

--ClassTimers
do
	L['ClassTimers'] = "職業計時條";
	L["CLASSTIMER_DESC"] = '在玩家和目標框體上顯示 buff/debuff 資訊.\n建議不要和技能監視同時開啟.';
	
	L['Player Anchor'] = "玩家錨點";
	L['What frame to anchor the class timer bars to.'] = "職業計時條依附的框體.";
	L['Target Anchor'] = "目標錨點";
	L['Trinket Anchor'] = "飾品錨點";
	L['Player Buffs'] = "玩家 Buffs";
	L['Target Buffs']  = "目標 Buffs";
	L['Player Debuffs'] = "玩家 Debuffs";
	L['Target Debuffs']  = "目標 Debuffs";
	L['Player'] = "玩家";
	L['Target'] = "目標";
	L['Trinket'] = "飾品";
	L['Procs'] = "特效";
	L['Any Unit'] = "任意人(施放)";
	L['Unit Type'] = "單元類型";	
	L["Buff Color"] = "Buff 顏色";
	L["Debuff Color"] = "Debuff 顏色";
	L['You have attempted to anchor a classtimer frame to a frame that is dependant on this classtimer frame, try changing your anchors again.'] = "你嘗試定位職業計時條在它自身上, 請改變你的錨點";
	L['Remove Color'] = "刪除顏色";
	L['Reset color back to the bar default.'] = "重設顏色為默認值";
	L['Add SpellID'] = "添加技能ID";
	L['Remove SpellID'] = "刪除技能ID";
	L['You cannot remove a spell that is default, disabling the spell for you however.'] = "你不能刪除默認內置的技能, 可以禁用它";
	L['Spell already exists in filter.'] = "技能在篩檢程式中已經存在";
	L['Spell not found.'] = "未找到此技能.";
	L["All"] = "所有人";
	L["Friendly"] = "友方";
	L["Enemy"] = "敵方";	
end

--oUF_AuraBar
do	
	L['The spell "%s" has been added to the DebuffBlacklist unitframe filter.'] = '技能 "%s" 將加被添加單位框體篩檢程式的DEBUFF黑名單中';
	L['Aura Bars'] = '光環條';
	L['The object you want to attach to.'] = '你想目標依附到哪';
	L['No Duration'] = '無持續時間';
	L['Allow displaying of aura bars that do not have a duration.'] = '允許顯示無持續時間的光環條';
	L['No Consolidated'] = true;
	L['Allow displaying of aura bars that are considered consolidated by Blizzard.'] = true;
	L['Above'] = '上面';
	L['Below'] = '下麵';	
end

--ACTIONBARS
do
	L['Out of Range'] = "超出距離的顏色";
	L['Color of the actionbutton when out of range.'] = "當超出距離時動作條按鍵的顏色";
	L['Out of Power'] = "能量不足的顏色";
	L['Color of the actionbutton when out of power (Mana, Rage, Focus, Holy Power).'] = "當能量不足時（如法力，怒力等）動作條按鍵的顏色";
	L["Delete Actionbar Layout DB"] = "刪除配置存檔";
	L["Actionbar layout db is delete!"] = "動作條按鍵配置已經刪除！";
	L["Output Actionbar layout"] = "導出動作條按鍵配置";
	L["Input Actionbar layout"] = "導入動作條按鍵配置";
	L["Actionbar Layout Save and Load"] = "動作條按鍵配置保存和讀取";
	L["Save Actionbar Layout"] = "保存配置";
	L["Load Actionbar Layout"] = "讀取配置";
	L["Actionbar layout is saved!"] = "動作條按鍵配置已保存!";
	L["Actionbar layout load success!"] = "動作條按鍵配置已恢複成功!";	
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
	L["Hover your mouse over any actionbutton or spellbook button to bind it. Press the escape key or right click to clear the current actionbutton's keybinding."] = "移動滑鼠到動作條或技能書按鈕上綁定快捷鍵. 按ESC或右擊按鈕取消當前綁定";
	L['Save'] = "保存";
	L['Discard'] = "取消";
	L['Binds Saved'] = "保存綁定";
	L['Binds Discarded'] = "取消綁定";
	L["All keybindings cleared for |cff00ff00%s|r."] = "取消 |cff00ff00%s|r 所有綁定的快捷鍵.";
	L[" |cff00ff00bound to |r"] = true;
	L["No bindings set."] = "無綁定設置";
	L["Binding"] = "綁定";
	L["Key"] = "鍵";	
	L['Trigger'] = true;
	
	--CONFIG
	L["ActionBars"] = "動作條";
		L["Keybind Mode"] = "快捷鍵綁定模式";
		
	L['Macro Text'] = "宏名字";
		L['Display macro names on action buttons.'] = "在動作條按鈕上顯示宏名字";
	L['Keybind Text'] = "快捷鍵";
		L['Display bind names on action buttons.'] = "在動作條按鈕上顯示快捷鍵名字";
	L['Button Size'] = "按鈕尺寸";
		L['The size of the action buttons.'] = "動作條按鈕尺寸";
	L['Button Spacing'] = "按鈕間距";
		L['The spacing between buttons.'] = "兩個按鈕之間的距離";
	L['Bar '] = "動作條 ";
	L['Backdrop'] = "背景";
		L['Toggles the display of the actionbars backdrop.'] = "動作條顯示背景框的開關";
	L['Buttons'] = "按鈕數";
		L['The amount of buttons to display.'] = "顯示多少個動作條按鈕";
	L['Buttons Per Row'] = "每行按鈕數";
		L['The amount of buttons to display per row.'] = "每行顯示多少個按鈕數";
	L['Anchor Point'] = "錨點方向";
		L['The first button anchors itself to this point on the bar.'] = "第一個按鈕對齊動作條的方向";
	L['Height Multiplier'] = "高度倍增";
	L['Width Multiplier'] = "寬度倍增";
		L['Multiply the backdrops height or width by this value. This is usefull if you wish to have more than one bar behind a backdrop.'] = "根據此值增加背景的高度或寬度. 一般用來在一個背景框裏放置多條動作條";
	L['Action Paging'] = "動作條翻頁";
		L["This works like a macro, you can run different situations to get the actionbar to page differently.\n Example: '[combat] 2;'"] = "和宏一樣工作, 能根據你不同的狀態得到不同的動作條翻頁.\n 比如: '[combat] 2;'";
	L['Visibility State'] = "可見狀態";
		L["This works like a macro, you can run different situations to get the actionbar to show/hide differently.\n Example: '[combat] show;hide'"] = "和宏一樣工作, 能根據你不同的狀態使動作條顯示或隱藏.\n 比如: '[combat] show;hide'";
	L['Restore Bar'] = "還原動作條";
		L['Restore the actionbars default settings'] = "恢復此功能條的默認設置";
		L['Set the font size of the action buttons.'] = "設置此動作條按鈕的字體尺寸";
	L['Mouse Over'] = "滑鼠劃過顯示";
		L['The frame is not shown unless you mouse over the frame.'] = "此框體不顯示,直到滑鼠經過框體時";
	L['Pet Bar'] = "寵物動作條";
	L['Alt-Button Size'] = "小按鈕尺寸";
		L['The size of the Pet and Shapeshift bar buttons.'] = "寵物動作條和姿態條按鈕尺寸";
	L['Stance Bar'] = "姿態條";
	L['Cooldown Text'] = "冷卻文字";
		L['Display cooldown text on anything with the cooldown spiril.'] = "顯示技能冷卻時間";
	L['Low Threshold'] = "低門檻";
		L['Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red'] = "低於此門檻的文字將轉為紅色並顯示小數. 設為 -1 則不會變為紅色";
	L['Expiring'] = "到期";
		L['Color when the text is about to expire'] = "即將到期的文字顏色";
	L['Seconds'] = "秒";
		L['Color when the text is in the seconds format.'] = "以秒顯示時的文字顏色";
	L['Minutes'] = "分";
		L['Color when the text is in the minutes format.'] = "以分顯示時的文字顏色";
	L['Hours'] = "時";
		L['Color when the text is in the hours format.'] = "以小時顯示時的文字顏色";
	L['Days'] = "天";
		L['Color when the text is in the days format.'] = "以天顯示時的文字顏色";
	L['Totem Bar'] = "圖騰條";
	L['Action Mode'] = "按鍵模式";
	L['Use the button when clicking or pressing the keybind on the keydown motion or on the keyup motion.'] = "當你點擊或按下快捷鍵是按下還是鬆開時執行這個按鈕";	
	L['Max Paging'] = "最大翻頁";
	L['When enabled the main actionbar will use the maximum amount of pages available. This means if you have another actionbar disabled, the actionbar page will become available on the main actionbar. Having this disabled will limit the main actionbar to two pages.'] = "主動作條最大翻頁特性. 如果禁用其他動作條, 他們將會在主動作條的翻頁中出現,如果禁用此選項, 主動作條只能翻兩頁";
	L['Micro Bar'] = "微型系統菜單條"
	L['Alpha'] = "透明度"
	L['Change the alpha level of the frame.'] = "改變框體的透明等級"
	L['The button you must hold down in order to drag an ability to another action button.'] = "按住某個鍵後才能拖動動作條的按鈕";
	L['Key Down'] = '按下鍵施法';
end

--UNITFRAMES
do	
	L['About UI'] = '界面相關';
	L['About Prompt info'] = '提示信息相關';
	L['About Invite'] = '邀請組隊相關';
	L['About Loot'] = '拾取相關';
	L['Invite guild ranks member'] = '按會階邀請成員進團';
	L['Start Invite'] = '發起邀請';
	L['Invite guild ranks is %s member, in 10 sec.'] = '會階為 %s 的成員,將在10秒後被邀請進團.';
	L['Interrupting the voice prompts'] = '打斷聲音提示';
	L["Block Non-Personal Auras"] = '阻止非個人光環';
	L["Block Non-Whitelisted Auras"] = '阻止不在白名單的光環';
	L['Block Non-Dispellable Auras'] = '阻止不可驅散的光環';
	L['By Type'] = '按類型';
	L['Color aurabar debuffs by type.'] = '按DEBUFF類型彩色化光環條';
	L['TOPLEFT'] = '左上';
	L['LEFT'] = '左';
	L['BOTTOMLEFT'] = '左下';
	L['RIGHT'] = '右';
	L['TOPRIGHT'] = '右上';
	L['BOTTOMRIGHT'] = '右下';
	L['CENTER'] = '中間';
	L['TOP'] = '頂部';
	L['BOTTOM'] = '底部';
	L["Affliction"] = "痛苦";
	L["Demonology"] = "惡魔";
	L["Destruction"] = "毀滅";
	L['Interruptable'] = "可打斷顏色";
	L['Non-Interruptable'] = "不可打斷顏色";
	L['Harmony'] = "真氣";
	L['Blood'] = "鮮血符文";
	L['Unholy'] = "邪惡符文";
	L['Frost'] = "冰霜符文";
	L['Death'] = "死亡符文";
	L['Holy Power'] = "聖能";
	L['Arcane Charges'] = "奧術衝能";
	L['Shadow Orbs'] = "暗影寶珠";
	L['Lunar'] = "月能";
	L['Solar'] = "日能";
	L['Class Resources'] = "職業資源";
	L['Center'] = "中";
	L['JustifyH'] = "水準對齊";
	L["Sets the font instance's horizontal text alignment style."] = "設置字體實例的水準文本對齊方式";
	L['Spells'] = '技能';
	L['This filter is used for both aura bars and aura icons no matter what. Its purpose is to block out specific spellids from being shown. For example a paladin can have two sacred shield buffs at once, we block out the short one.'] = '這個篩檢程式作用於光環條和光環圖示,不管是什麼,其目的是為了用阻止特定技能ID的技能被顯示. 例如: 聖騎士可以一次有兩個神聖之盾BUFF, 我們阻止了時間短的那個顯示.';
	L['Style'] = '樣式';
	L['Select the display method of the portrait.'] = '選擇頭像顯示方式';
	L['2D'] = true;
	L['3D'] = true;
	L['Friendly'] = '友好';
	L['Enemy'] = '敵對';
	L['If the unit is friendly then this filter will be checked, otherwise it will be ignored.'] = '如果單位是友好的,那麼這個篩檢程式會檢查,否則將被忽略.';
	L['If the unit is an enemy then this filter will be checked, otherwise it will be ignored.'] = '如果單位是敵對的,那麼這個篩檢程式會檢查,否則將被忽略.';
	L['Allow Dispellable Auras'] = '允許能被驅散的光環';
	L["Block Raid Buffs"] = '阻止團隊BUFF';
	L["Block Auras Without Duration"] = '阻止無持續時間的光環';
	L["Block Blacklisted Auras"] = '阻止列入黑名單的光環';
	L["Allow Whitelisted Auras"] = '允許列入白名單的光環';
	L["Allow Personal Auras"] = '允許個人光環';
	L['Player Frame Aura Bars'] = '玩家框體光環條';
	L['Filter Auras Not Dispellable By Me'] = '過濾不能被我驅散的光環';
	L['Allow displaying of auras that can be dispelled by me.'] = '只允許顯示能被我驅散的光環';
	L['Click Through'] = "點擊透過";
	L['Ignore mouse events.'] = "忽略滑鼠事件";
	L['Additional Filter'] = '額外的過濾器';
	L['Filter Non-Personal Auras'] = '過濾不是自已的光環';
	L['Use Blacklist Filter'] = '使用黑名單過濾';
	L['Use Whitelist Filter'] = '使用白名單過濾';
	L['Filter Auras with No Duration'] = '過濾無持續時間的光環';
	L['Filter Raid Buffs'] = '過濾團隊Buff';
	L['The spell "%s" has been added to the Blacklist unitframe aura filter.'] = '技能 "%s" 被添加到單位框體的光環過濾器的黑名單裏';
	L['match frame size'] = '匹配框體尺寸';
	L['Focus'] = '焦點';
	L['Display icon on arena frame indicating the units talent specialization or the units faction if inside a battleground.'] = '在競技場框體上顯示天賦圖標或在戰場內.';
	L['PVP Trinket'] = 'PvP 飾品';
	L['Spec Icon'] = '天賦圖標';
	L['Assist Target'] = "助理目標";
	L['Tank Target'] = "坦克目標";
	L['Growth Direction'] = "延展方向";
	L['Current / Max'] = "當前值/最大值";
	L['Current'] = "當前值";
	L['Remaining'] = "剩餘值";
	L['Format'] = "格式";
	L['X Offset'] = "X 方向偏移";
	L['Y Offset'] = "Y 方向偏移";
	L['RaidDebuff Indicator'] = "中心圖標DEBUFF指示器";
	L['Debuff Highlighting'] = "Debuff 高亮";
		L['Color the unit healthbar if there is a debuff that can be dispelled by you.'] = "高亮顯示單元,如果DEBUFF能被你驅散";
	L['Disable Blizzard'] = "禁用暴雪框體";
		L['Disables the blizzard party/raid frames.'] = "禁用暴雪小隊/團隊框架";
	L['OOR Alpha'] = "距離透明度";
		L['The alpha to set units that are out of range to.'] = "單元超出距離顯示的透明度";
	L['You cannot set the Group Point and Column Point so they are opposite of each other.'] = "你不能設置隊伍位置和列位置這些他們是互相對立的.";
	L['Orientation'] = "方向";
		L['Direction the health bar moves when gaining/losing health.'] = "當增加/減少血量時血條的移動方向";
		L['Horizontal'] = "水準";
		L['Vertical'] = "垂直";
	L['Camera Distance Scale'] = "鏡頭距離比例";
		L['How far away the portrait is from the camera.'] = "頭像距鏡頭有多遠";
	L['Offline'] = "離線";
	L['UnitFrames'] = "單位框體";
	L['Ghost'] = "死亡";
	L['Smooth Bars'] = "平滑條";
		L['Bars will transition smoothly.'] = "條將平滑過渡";
	L["The font that the unitframes will use."] = "單位框體字體";
		L["Set the font size for unitframes."] = "設置單位框體字體尺寸";
	L['Font Outline'] = "字體描邊";
		L["Set the font outline."] = "設置字體的描邊";
	L['Bars'] = "條";
	L['Fonts'] = "字體";
	L['Class Health'] = "職業色生命";
		L['Color health by classcolor or reaction.'] = "以職業色顯示生命";
	L['Class Power'] = "職業色能量";
		L['Color power by classcolor or reaction.'] = "以職業色顯示能量";
	L['Health By Value'] = "按數值變化血量";
		L['Color health by amount remaining.'] = "按數值變化血量";
	L['Custom Health Backdrop'] = "定制血條背景";
		L['Use the custom health backdrop color instead of a multiple of the main health color.'] = "自定義血條背景色";
	L['Class Backdrop'] = "職業色背景";
		L['Color the health backdrop by class or reaction.'] = "血條背景色以職業色顯示";
	L['Health'] = "血條";
	L['Health Backdrop'] = "血條背景";
	L['Tapped'] = "已被攻擊";
	L['Disconnected'] = "斷開";
	L['Powers'] = "能量";
	L['Reactions'] = "聲望";
	L['Bad'] = "危險";
	L['Neutral'] = "中立";
	L['Good'] = "安全";
	L['Player Frame'] = "玩家框體";
	L['Width'] = "寬";
	L['Height'] = "高";
	L['Low Mana Threshold'] = "低魔法閾值";
		L['When you mana falls below this point, text will flash on the player frame.'] = "當你的魔法低於此位置時,將在玩家框體上顯示一行閃爍的文字";
	L['Combat Fade'] = "戰鬥隱藏";
		L['Fade the unitframe when out of combat, not casting, no target exists.'] = "隱藏框體在非戰鬥, 沒有施法和沒有目標時";
	L['Health'] = "血量";
		L['Text'] = "文字";
		L['Text Format'] = "文字格式";	
	L['Current - Percent'] = "當前值 - 百分比";
	L['Current - Max | Percent'] = "當前值 - 最大值 | 百分比";
	L['Current - Max'] = "當前值 - 最大值";
	L['Current'] = "當前值";
	L['Percent'] = "百分比";
	L['Deficit'] = "虧損值";
	L['Filled'] = "全長";
	L['Spaced'] = "留空";
	L['Power'] = "能量";
	L['Offset'] = "偏移";
		L['Offset of the powerbar to the healthbar, set to 0 to disable.'] = "偏移能量條與血條的位置, 設為 0 禁用.";
	L['Alt-Power'] = "特殊能量值";
	L['Overlay'] = "覆蓋";
		L['Overlay the healthbar']= "覆蓋血條";
	L['Portrait'] = "頭像";
	L['Name'] = "姓名";
	L['Up'] = "上";
	L['Down'] = "下";
	L['Left'] = "左";
	L['Right'] = "右";
	L['Num Rows'] = "行數";
	L['Per Row'] = "每行";
	L['Buffs'] = true;
	L['Debuffs'] = true;
	L['Y-Growth'] = "Y 方向增長";
	L['X-Growth'] = "X 方向增長";
		L['Growth direction of the buffs'] = "buffs 增長方向";
	L['Initial Anchor'] = "初始化位置";
		L['The initial anchor point of the buffs on the frame'] = "初始化框體 buff 的位置";
	L['Castbar'] = "施法條";
	L['Icon'] = "圖示";
	L['Latency'] = "延時";
	L['Color'] = "顏色";
	L['Interrupt Color'] = "不可打斷顏色";
	L['Match Frame Width'] = "匹配框體寬度";
	L['Fill'] = "填充";
	L['Classbar'] = "職業條";
	L['Position'] = "位置";
	L['Target Frame'] = "目標框體";
	L['Text Toggle On NPC'] = "NPC 文字顯示開關";
		L['Power text will be hidden on NPC targets, in addition the name text will be repositioned to the power texts anchor point.'] = "NPC 目標將隱藏能量值文字";
	L['Combobar'] = "連擊點";
	L['Use Filter'] = "使用篩檢程式";
		L['Select a filter to use.'] = "選擇一個篩檢程式使用";
		L['Select a filter to use. These are imported from the unitframe aura filter.'] = "選擇一個篩檢程式使用. 這些從單位框體的光環篩檢程式中輸入";
	L['Personal Auras'] = "個人光環";
	L['If set only auras belonging to yourself in addition to any aura that passes the set filter may be shown.'] = "如果設置了只顯示自己釋放的光環，那麼除了你設置的過濾條件（只顯示自己釋放的）以外的光環都不會顯示";
	L['Create Filter'] = "創建篩檢程式";
		L['Create a filter, once created a filter can be set inside the buffs/debuffs section of each unit.'] = "創建一個篩檢程式, 一旦創建能被每個單元的 buff/debuff 所使用";
	L['Delete Filter'] = "刪除篩檢程式";
		L['Delete a created filter, you cannot delete pre-existing filters, only custom ones.'] = "刪除一個創建的篩檢程式, 你不能刪除內置的篩檢程式, 只有你自已添加的能";
	L["You can't remove a pre-existing filter."] = "你不能刪除一個內置的篩檢程式";
	L['Select Filter'] = "選擇篩檢程式";
	L['Whitelist'] = "白名單";
	L['Blacklist'] = "黑名單";
	L['Filter Type'] = "篩檢程式類型";
		L['Set the filter type, blacklisted filters hide any aura on the like and show all else, whitelisted filters show any aura on the filter and hide all else.'] = "設置篩檢程式類型, 黑名單隱藏所有在名單裏面的光環, 白名字則顯示所有在名單裏的光環";
	L['Add Spell'] = "添加技能";
		L['Add a spell to the filter.'] = "添加一個技能到篩檢程式";
	L['Remove Spell'] = "移除技能";
		L['Remove a spell from the filter.'] = "從篩檢程式中移除一個技能";
	L['You may not remove a spell from a default filter that is not customly added. Setting spell to false instead.'] = "你不能移除一個內置技能, 可以禁用此技能.";
	L['Unit Reaction'] = "單元聲望";
		L['This filter only works for units with the set reaction.'] = "此篩檢程式只工作在那些單元有聲望時";
		L['All'] = "全部";
		L['Friend'] = "友好";
		L['Enemy'] = "敵對";
	L['Duration Limit'] = "時間限制";
		L['The aura must be below this duration for the buff to show, set to 0 to disable. Note: This is in seconds.'] = "光環必需低於此時間buff才會顯示, 設為0禁用. 注意: 此時間單位為 秒.";
	L['TargetTarget Frame'] = "目標的目標框體";
	L['Attach To'] = "附加到";
		L['What to attach the buff anchor frame to.'] = "buff 錨點附加到哪兒";
		L["What to attach the debuff anchor frame to."] = "Debuff 錨點附加到哪兒";
		L['Frame'] = "框體";
	L['Anchor Point'] = "錨點方向";
		L['What point to anchor to the frame you set to attach to.'] = "框體的錨點對齊方向";
	L['Focus Frame'] = "焦點框體";
	L['FocusTarget Frame'] = "焦點目標框體";
	L['Pet Frame'] = "寵物框體";
	L['PetTarget Frame'] = "寵物目標框體";
	L['Boss Frames'] = "BOSS 框體";
	L['Growth Direction'] = "延展方向";
	L['Arena Frames'] = "競技場框體";
	L['Profiles'] = "配置";
	L['New Profile'] = "新配置";
	L['Delete Profile'] = "刪除配置";
	L['Copy From'] = "複製自";
	L['Talent Spec #1'] = "天賦位 #1";
	L['Talent Spec #2'] = "天賦位 #2";
	L['NEW_PROFILE_DESC'] = '你能創建一個新的單位框體配置檔, 你能分配某些配置為某個天賦使用. 在這兒你能刪除, 複製或重置配置檔.';
	L["Delete a profile, doing this will permanently remove the profile from this character's settings."] = "刪除一個配置檔, 將永遠的從角色設置中移除此配置.";
	L["Copy a profile, you can copy the settings from a selected profile to the currently active profile."] = "複製一個配置檔, 你能複製設置從選擇的配置到當前活動配置.";
	L["Assign profile to active talent specialization."] = "指定配置為當前天賦專用";
	L['Active Profile'] = "啟動配置";
	L['Reset Profile'] = "重設配置";
		L['Reset the current profile to match default settings from the primary layout.'] = "重設當前配置為默認值";
	L['Party Frames'] = "隊伍框";
	L['Group Point'] = "隊伍位置";
		L['What each frame should attach itself to, example setting it to TOP every unit will attach its top to the last point bottom.'] = "每一個框體都會依附在你設定的位置上, 例如: 你設置依附於TOP那麼每一個單元都將把它單元TOP依附於前一個單元的BOTTOM";
	L['Column Point'] = "列位置";
		L['The anchor point for each new column. A value of LEFT will cause the columns to grow to the right.'] = "每一行的錨點. 設置這個值為LEFT, 那麼這一行的將從左向增長";
	L['Max Columns'] = "最大列數";
		L['The maximum number of columns that the header will create.'] = "最大顯示多少列";
	L['Units Per Column'] = "每列單元數";
		L['The maximum number of units that will be displayed in a single column.'] = "一列最多顯示多少個單元";
	L['Column Spacing'] = "列間距";
		L['The amount of space (in pixels) between the columns.'] = "列之間的間隔距離(像素)";
	L['xOffset'] = "X 方向偏移";
		L['An X offset (in pixels) to be used when anchoring new frames.'] = "新框體X方向的偏移值";
	L['yOffset'] = "Y 方向偏移";
		L['An Y offset (in pixels) to be used when anchoring new frames.'] = "新框體Y方向的偏移值";
	L['Show Party'] = "隊伍時顯示";
		L['When true, the group header is shown when the player is in a party.'] = "選中此項, 當玩家在隊伍中時顯示";
	L['Show Raid'] = "團隊時顯示";
		L['When true, the group header is shown when the player is in a raid.'] = "選中此項, 當玩家進入團隊時顯示";
	L['Show Solo'] = "單人時顯示";
		L['When true, the header is shown when the player is not in any group.'] = "選中此項, 只有玩家一個人時也顯示隊伍";
	L['Display Player'] = "顯示玩家";
		L['When true, the header includes the player when not in a raid.'] = "選中此項,隊伍中將顯示玩家";
	L['Visibility'] = "可見性";
		L['The following macro must be true in order for the group to be shown, in addition to any filter that may already be set.'] = "此處的宏為真將顯示此組";
	L['Blank'] = "空";
	L['Buff Indicator'] = "四角Hot提示器";
	L['Color Icons'] = "圖示顏色";
		L['Color the icon to their set color in the filters section, otherwise use the icon texture.'] = "以色塊顯示圖示, 否則使用圖示自身的材質";
	L['Size'] = "尺寸";
		L['Size of the indicator icon.'] = "指示器圖示尺寸";
	L["Select Spell"] = "選擇技能";
	L['Add SpellID'] = "添加技能ID";
	L['Remove SpellID'] = "移除技能ID";
	L["Not valid spell id"] = "不正確的技能ID";
	L["Spell not found in list."] = "列表中未發現技能";
	L['Show Missing'] = "顯示未命中";
	L['Any Unit'] = "任意單元";
	L['Move UnitFrames'] = "移動單位框體";
	L['Reset Positions'] = "重設位置";
	L['Sticky Frames'] = "粘性窗口";
	L['Attempt to snap frames to nearby frames.'] = "使窗口自動吸附旁邊的窗口, 方便解鎖移動時調整位置";
	L['Raid-25 Frames'] = "團隊框架";
	L['Raid-40 Frames'] = "40人團隊";
	L['Copy From'] = "複製自";
	L['Select a unit to copy settings from.'] = "選擇一個單元來複製設置從.";
	L['You cannot copy settings from the same unit.'] = "你不能從相同的單元複製設置";
	L['Restore Defaults'] = "恢復默認";
	L['Role Icon'] = "職責圖示";
	L['Smart Raid Filter'] = "智能團隊過濾";
	L['Override any custom visibility setting in certain situations, EX: Only show groups 1 and 2 inside a 10 man instance.'] = "在某些必然的情況重寫可見性的定義, 比如: 在10人副本裏只顯示1隊和2隊";	
	L['Heal Prediction'] = "治療預估";
	L['Show a incomming heal prediction bar on the unitframe. Also display a slightly different colored bar for incoming overheals.'] = "在單位框體上顯示治療預估條";
	L['Assist Frames'] = "助理框";
	L['Tank Frames'] = "主坦克框";
	L['Swing'] = "平砍計時條";
	L['Swing Bar'] = "顯示平砍計時條，比如LR的射擊條";
	L['Vengeance'] = "復仇條";
	L['Vengeance Bar'] = "顯示坦克的復仇條";	

	L['Party Pets'] = "隊伍寵物";
	L['Party Targets'] = "隊伍目標";
	L["Display Pets"] = "顯示寵物";
	L['Ticks'] = "分段"	L['Display tick marks on the castbar for channelled spells. This will adjust automatically for spells like Drain Soul and add additional ticks based on haste.'] = "在通道施法條上添加分段標誌, 會隨著急速改變";	
	
	L['CCDebuffs'] = "控場類DEBUFF"
	L['TurtleBuffs'] = "減傷類DEBUFF"
	L['DebuffBlacklist'] = "DEBUFF黑名單"
	L['RaidDebuffs'] = "團隊副本DEBUFF"
	L['RaidDebuffs2'] = "團隊副本DEBUFF圖標2"	
	
	L['Totem Time'] = "顯示圖騰時間和星月條能量值"
	L['Attention Frames'] = "關注框體"
	L['%s frame(s) has a conflicting anchor point, please change either the buff or debuff anchor point so they are not attached to each other. Forcing the debuffs to be attached to the main unitframe until fixed.'] = '%s 框體有互相衝突的錨點, 請改變BUFF 或DEBUFF的錨點設置使他們沒有附加到對方. 強制DEBUFF被附加到主框體上直到修正.';
	L['Spark'] = "閃光";
	L['Display a spark texture at the end of the castbar statusbar to help show the differance between castbar and backdrop.'] = "在施法條的尾端增加一個閃光用來區分施法條和背景";	
	L['Frequent Updates'] = "高頻更新";
	L['Rapidly update the health, uses more memory and cpu. Only recommended for healing.'] = "高頻率的更新血量, 將消耗更多的記憶體和CPU. 只建議治療使用";		
	L['targetGlow'] = "目標邊框染色";
	L['In the party and raid frame for is your target to add a classcolor border.'] = "在隊伍和團隊框體上為你的目標添加一個職業色邊框效果";		
	L['Rest Icon'] = "休息圖示";
	L['Display the rested icon on the unitframe.'] = "在框體上顯示休息圖示";
	L["Eui UF Style"] = "EUI單位框體樣式";
	L["Display Target"] = "顯示目標";
	L["Display the target of the cast on the castbar."] = "在施法條上顯示施法目標";	
	L['Double Icon'] = "雙圖標顯示";
	
	L["Short"] = "短";
	L["Medium"] = "中";
	L["Long"] = "長";
	L["Long (Include Level)"] = "長(含等級)";
	L["Length"] = "長度";	
	L["Tanks First"] = "坦克優先";
	L['Size Override'] = "尺寸覆蓋";
	L['If not set to 0 then override the size of the aura icon to this.'] = "如果不為0, 此值將覆蓋光環圖示的尺寸定義";	
	L["Set the priority order of the spell, please note that prioritys are only used for the raid debuff module, not the standard buff/debuff module. If you want to disable set to zero."] = "設置該法術的優先順序, 請注意.. 優先順序只用於RAID DEBUFF模組, 而不是標準的BUFF/ DEBUFF模組。如果你想禁用設置為零";
	L["Priority"] = "優先順序";	
	L['Display Frames'] = "顯示框體";
	L['Force the frames to show, they will act as if they are the player frame.'] = "強制框體顯示";		
	L['Show Auras'] = "顯示光環";
	L['RL / ML Icons'] = "隊長/拾取圖標";
	L['Focus Castbar'] = '焦点施法条';
	L['Player Castbar'] = '玩家施法条';
	L['Target Castbar'] = '目标施法条';		
	L['Custom Texts'] = "自定義文本";
	L['Create a custom fontstring. Once you enter a name you will be able to select it from the elements dropdown list.'] = "創建自定義的文本, 壹旦你輸入壹個名稱, 你將能夠從下拉列表元素中選擇";
	L['Smart Auras'] = "智能光環";
	L['Disabled'] = "禁用"
	L['Friendlies: Show Debuffs'] = "友好: 顯示 Debuff"
	L['Friendlies: Show Buffs'] = "友好: 顯示 Buff"
	L['Use Whitelist'] = "使用白名單"
	L['If set then if the aura is found on the whitelist filter it will display. Note: You can change between only doing this on friendly or enemy units.'] = "如果設置了,那麽當白名單過濾器上發現的光環將會顯示. 注意:你可以更改友好或敵對單位之間"
	L['Use Blacklist'] = "使用黑名單"
	L['If set then if the aura is found on the blacklist filter it will not display. Note: You can change between only doing this on friendly or enemy units.'] ="如果設置了,那麽當黑名單過濾器上發現的光環將會顯示. 注意:你可以更改友好或敵對單位之間"
	L['Allow displaying of auras that do not have a duration.'] = "允許顯示無持續時間的光環"
	L['If set, only auras belonging to yourself in addition to any aura that passes the set filter(s) may be shown. Note: You can change between only doing this on friendly or enemy units.'] = "如果設置了, 只會顯示屬于你自已施放的並通過過濾器的光環"
	L['No Consolidated'] = "非綜合類";
	L['Allow displaying of auras that are considered consolidated by Blizzard.'] = "允許顯示被暴雪認爲是綜合類的光環";
	L['When set the Buffs and Debuffs will toggle being displayed depending on if the unit is friendly or an enemy. This will not effect the aurabars module.'] = "當單位是友好或敵對切換顯示BUFF和DEBUFF, 不會影響光環條模塊";
	L['Friendly Aura Type'] = "友好光環類型"
	L['Set the type of auras to show when a unit is friendly.'] = "當單位是友好時設置光環顯示的類型"
	L['Enemy Aura Type'] = "敵對光環類型"
	L['Set the type of auras to show when a unit is a foe.'] = "當單位是敵對時設置光環顯示的類型"	
	L['TEXT_FORMAT_DESC'] = [=[提供壹個字符串來更改文本格式.

示例: 
[namecolor][name] [difficultycolor][smartlevel] [shortclassification]
[healthcolor][health:current-max]
[powercolor][power:current]

血量 / 能量格式:
'current' - 當前值
'percent' - 百分比
'current-max' - 當前值-最大值
'current-percent' - 當前值-百分比
'current-max-percent' - 當前值-最大值-百分比
'deficit' - 缺少值

姓名格式:
'name:short' - 最多顯示4個字符
'name:medium' - 最多顯示15個字符
'name:long' - 最多顯示20個字符

更多的信息請訪問 http://eui.cc]=];	
end

--Datatext
do
	L["Reset Data: Hold Shift + Right Click"] = '重設數據: 按Shift + 右鍵點擊';
	L["World Boss(s)"] = "世界首領:";
	L['Sha of Anger'] = "怒之煞";
	L['Galleon'] = '炮艦';
	L['Crit'] = '爆擊';
	L['Datatext Panel (Left)'] = '信息文字左面板';
	L['Datatext Panel (Right)'] = '信息文字右面板';
	L['Display data panels below the chat, used for datatexts.'] = '顯示信息文字面板在聊天框底部';
	L['ABLeftInfobar'] = '動作條左信息條';
	L['ABRightInfobar'] = '動作條右信息條';
	L['MainABInfobar'] = '主動作條信息條';	
	L["Game Time:"] = "遊戲時間:";
	L['Orb Possessions'] = "寶珠屬地";
	L['Victory Points'] = "勝利點";
	L['Carts Controlled'] = "控制的車";
	L['Bandwidth'] = "帶寬";
	L['Download'] = "下載";
	L['Total Memory:'] = "總記憶體:";
	L['Home Latency:'] = "本地延遲:";
	L['World Latency:'] = "世界延遲:";
	
	L.goldabbrev = "|cffffd700g|r"
	L.silverabbrev = "|cffc7c7cfs|r"
	L.copperabbrev = "|cffeda55fc|r"	
	
	L['Session:'] = "本次登陸";
	L["Character: "] = "角色: ";
	L["Server: "] = "伺服器: ";
	L["Total: "] = "合計: ";
	L["Saved Raid(s)"]= "已有進度的副本";
	L["Currency:"] = "貨幣";	
	L["Earned:"] = "掙取:";	
	L["Spent:"] = "花費:";	
	L["Deficit:"] = "赤字:";
	L["Profit:"	] = "利潤:";	
	
	L["DataTexts"] = "資訊文字";
	L["DATATEXT_DESC"] = "設置在螢幕上顯示的一些資訊文字.";
	L["Multi-Spec Swap"] = "多天賦切換";
	L['Swap to an alternative layout when changing talent specs. If turned off only the spec #1 layout will be used.'] = "當改變天賦時切換到另一個層. 當關閉時只有 #1 層被使用.";
	L['24-Hour Time'] = "24小時制";
	L['Toggle 24-hour mode for the time datatext.'] = "資訊檔時間段以24小時制顯示開關";
	L['Local Time'] = "本地時間";
	L['If not set to true then the server time will be displayed instead.'] = "如果關閉此項,將顯示伺服器時間";
	L['Primary Talents'] = "主天賦";
	L['Secondary Talents'] = "副天賦";
	L['left'] = '左';
	L['middle'] = '中';
	L['right'] = '右';
	L['LeftChatDataPanel'] = '左聊天框';
	L['RightChatDataPanel'] = '右聊天框';
	L['LeftMiniPanel'] = '小地圖左';
	L['RightMiniPanel'] = '小地圖右';
	L['EuiTopLeftDataTexts'] = '頂部信息條左';
	L['EuiTopRightDataTexts'] = '頂部信息條右';	
	L['Friends'] = "好友";
	L['Friends List'] = "好友列表";
	
	L['Head'] = "頭";
	L['Shoulder'] = "肩";
	L['Chest'] = "胸";
	L['Waist'] = "腰";
	L['Wrist'] = "護腕";
	L['Hands'] = "手";
	L['Legs'] = "腿";
	L['Feet'] = "腳";
	L['Main Hand'] = "主手";
	L['Offhand'] = "副手";
	L['Ranged'] = "遠程";
	L['Mitigation By Level: '] = "等級減傷";
	L['lvl'] = "等級";
	L["Avoidance Breakdown"] = "免傷統計";
	L['AVD: '] = "免傷: ";
	L['Unhittable:'] = "未命中: ";
	L['AP'] = "攻強";
	L['SP'] = "法術傷害";
	L['HP'] = "法術治療";
	L['allunavailable'] = "無法獲得戰爭的召喚資訊."
	L['nodungeons'] = "沒有副本提供戰爭的召喚."
	
	L["Armor"] = "護甲";
	L["Attack Power"] = "攻擊強度";
	L["Avoidance"] = "免傷";
	L["Crit Chance"] = "爆擊率";
	L["DTName"] = true;
	L["Durability"] = "耐久";
	L["Friends"] = "好友";
	L["Gold"] = "金幣";
	L["Guild"] = "公會";
	L["Spell/Heal Power"] = "法術傷害/治療";
	L["System"] = "系統資訊";
	L["Time"] = "時間";
	L["Bags"] = "背包";
	L["Call to Arms"] = "戰鬥的召喚"
	L["Spec Switch"] = "天賦切換"
	L["Mana Regen"] = "法力回復"
	L["Vengeance"] = GetSpellInfo(93098) or GetSpellInfo(76691)
	L["Expertise"] = STAT_EXPERTISE
	L["DPS"] = "DPS"
	L["HPS"] = "HPS"
	L["Haste"] = STAT_HASTE
	L["Hit Rating"] = "命中"
	L["Mastery"] = STAT_MASTERY
	
	L['Total CPU:'] = true;
	L['(Hold Shift) Memory Usage'] = "按住Shift顯示記憶體使用";
	L['Flags Captured'] = "佔領旗幟";
	L['Flags Returned'] = "交還旗幟";
	L['Graveyards Assaulted'] = "墓地突襲";
	L['Graveyards Defended'] = "墓地防守";
	L['Towers Assaulted'] = "哨塔突襲";
	L['Towers Defended'] = "哨塔防禦";
	L['Demolishers Destroyed'] = "攻城車摧毀";
	L['Gates Destroyed'] = "大門摧毀";
	L['Bases Assaulted'] = "基地突襲";
	L['Bases Defended'] = "基地防禦";
	L['Battleground datatexts temporarily hidden, to show type /bgstats or right click the "C" icon near the minimap.'] = "戰場資訊文字臨時隱藏,輸入/bgstats或右擊小地圖右下角的C";
	L['Toggle Configuration'] = "設置開關";
	L['Show BG Texts'] = "顯示戰場資訊文字";
	L['Battleground datatexts will now show again if you are inside a battleground.'] = "戰場資訊文字將再次顯示,如果你在戰場中";
	L['Battleground Texts'] = "戰場文字";
	L['When inside a battleground display personal scoreboard information on the main datatext bars.'] = "在戰場上資訊文字顯示個人記分資訊";		
	L['Stats For:'] = "統計:";
end

--Tooltip
do
	L['Spell/Item IDs'] = '技能/物品ID';
	L['Display the spell or item ID when mousing over a spell or item tooltip.'] = '在鼠標提示中顯示技能或物品的ID';
	L['Item Count'] = '物品數量';
	L['Display how many of a certain item you have in your possession.'] = '顯示當前物品在你身上有多少個';
	L["Your Status: Completed on "] = "你的狀態: 完成 ";
	L["Your Status: Incomplete"] = "你的狀態: 未完成";
	L["Your Status:"] = "你的狀態:";
	L["TOOLTIP_DESC"] = '提示資訊設置選項.';
	L['Targeted By:'] = "同目標的有:";
	L['Tooltip'] = "滑鼠提示";
	L['Count'] = "計數";
	L['Anchor Mode'] = "位置模式";
	L['Set the type of anchor mode the tooltip should use.'] = "設置滑鼠提示位置顯示模式";
	L['Smart'] = "智能";
	L['Cursor'] = "游標跟隨";
	L['Anchor'] = "固定位置";
	L['UF Hide'] = "單位框體提示隱藏";
	L["Don't display the tooltip when mousing over a unitframe."] = "當滑鼠指向單位框體時不顯示滑鼠提示";
	L["Who's targetting who?"] = "目標關注";
	L["When in a raid group display if anyone in your raid is targetting the current tooltip unit."] = "在團隊中顯示與你當前滑鼠提示目標相同目標的隊友";
	L["Combat Hide"] = "戰鬥隱藏";
	L["Hide tooltip while in combat."] = "戰鬥時不顯示提示";
	L['Item-ID'] = "物品ID";
	L['Display the item id on item tooltips.'] = "在物品提示資訊中顯示物品ID";
	L["Yard"] = "碼";
	L["Range"] = "距離";
	L["Current Talent"] = "當前天賦";
	L["Reserve Talent"] = "備用天賦";
	L["AvgItemLvl"] = "平均裝等";		
end

--Chat
do
	L['Send to Screen'] = '轉發至屏幕';
	L['Chat EditBox Position'] = '聊天編輯框位置';
	L['Position of the Chat EditBox, if datatexts are disabled this will be forced to be above chat.'] = '聊天編輯框位置,如果底部的信息文字被禁用的話,將會強制顯示在聊天框頂部';
	L['Below Chat'] = '聊天框底部';
	L['Above Chat'] = '聊天框頂部';
	L['Lock Positions'] = '鎖定位置';
	L['Attempt to lock the left and right chat frame positions. Disabling this option will allow you to move the main chat frame anywhere you wish.'] = '鎖定左右聊天框位置,禁用則可以移動聊天框到任意位置';
	L['Chat History'] = '聊天歷史';
	L['Log the main chat frames history. So when you reloadui or log in and out you see the history from your last session.'] = '記錄聊天歷史,當你重載,登錄和退出時會恢復你最後一次會話';
	L['Fade Chat'] = '文字淡出';
	L['Fade the chat text when there is no activity.'] = '當聊天不啟動時聊天文字淡出';
	L['CHAT_DESC'] = '調整聊天相關設置.';
	L["Chat"] = "聊天框";
	L['Invalid Target'] = "不正確的目標";
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
	L['Hyperlink Hover'] = "超鏈接懸停";
	L['Display the hyperlink tooltip while hovering over a hyperlink.'] = "經過超鏈結時顯示一個超鏈結的提示";
	L['Spam Interval'] = "廣告間隔";
	L['Prevent the same messages from displaying in chat more than once within this set amount of seconds, set to zero to disable.'] = "兩次相同資訊顯示的間隔,設為0禁用";
	L['Scroll Interval'] = "滾屏間隔";
	L["Number of time in seconds to scroll down to the bottom of the chat window if you are not scrolled down completely."] = "一定時間內將聊天框的內容自動滾動底部."
	L["You need to be at least level %d to whisper me."] = "你需要至少 %d 級才能密我.";
	L["You have reached the maximum amount of friends, remove 2 for this module to function properly."] = "你好友已滿, 請保留兩個空格才能使用此功能";
	L['Whisper Level'] = "密語等級";
	L["Minimum level of the sender to able to whisper you."] = "能密語你的最小等級";	
	L["BigFootChannel"] = "大腳世界頻道";
	L["Auto join BigFootChannel"] = "自動加入大腳世界頻道";
	L["Copy Text"] = "復制文字";
	L["Sticky Chat"] = "頻道粘滯";
	L["When opening the Chat Editbox to type a message having this option set means it will retain the last channel you spoke in. If this option is turned off opening the Chat Editbox should always default to the SAY channel."] = "當你開始輸入消息時此選項的啟用將會讓你保留最後一次聊天的頻道, 如果關閉將始終使用說話頻道."	
	L['List of words to color in chat if found in a message. If you wish to add multiple words you must seperate the word with a comma. To search for your current name you can use %MYNAME%.\n\nExample:\n%MYNAME%, ElvUI, RBGs, Tank'] = "一個以逗號分隔能被修改的關鍵字列表, 如果資訊中發現這些關鍵字會顯示不同的顏色";
	L['Keywords'] = "關鍵字高亮";
	L["Embedded Addon"] = "右聊天框嵌入"
	L["Select an addon to embed to the right chat window. This will resize the addon to fit perfectly into the chat window, it will also parent it to the chat window so hiding the chat window will also hide the addon."] = "將插件內嵌入右聊天框內"
	L["embedcombat"] = "右聊天框嵌入戰鬥切換"
	L["embedcombat_desc"] ="右側聊天框嵌入的插件默認隱藏, 進入戰鬥時顯示."
	L["Whisper Alert"] = "密語聲音";
	L["Keyword Alert"] = "關鍵字聲音";
	L['Emotion Icons'] = "表情圖示";
	L['Display emotion icons in chat.'] = "在聊天中顯示表情圖示";		
end

--Skins
do
	L['Loss Control'] = '迷失控制';
	L['Void Storage'] = '虛空儲存';
	L['Item Upgrade'] = '物品升級';
	L["You do not own this pet."] = "你沒有此類型寵物。";
	L["Owned: "] = "我的寵物: ";
	L['Black Market AH'] = "黑市";
	L['Transmogrify Frame'] = "幻化窗口";
	L['Open Tukui_UIPackages_Skins option'] = "打開插件美化皮膚選項";
	L["Skins"] = "美化皮膚";
	L["SKINS_DESC"] = '調整皮膚設置.';
	L['Spacing'] = "空隙";
	L['The spacing in between bars.'] = "兩個進度條之間的間隙";
	L["TOGGLESKIN_DESC"] = "啟用/禁用此皮膚.";
	L["Encounter Journal"] = "地下城手冊";
	L["Bags"] = "背包";
	L["Reforge Frame"] = "重鑄";
	L["Calendar Frame"] = "日曆";
	L["Achievement Frame"] = "成就";
	L["LF Guild Frame"] = true;
	L["Inspect Frame"] = "觀察";
	L["KeyBinding Frame"] = "快捷鍵";
	L["Guild Bank"] = "公會銀行";
	L["Archaeology Frame"] = "考古";
	L["Guild Control Frame"] = "公會控制";
	L["Guild Frame"] = "公會";
	L["TradeSkill Frame"] = "商業技能";
	L["Raid Frame"] = "團隊";
	L["Talent Frame"] = "天賦";
	L["Glyph Frame"] = "雕文";
	L["Auction Frame"] = "拍賣";
	L["Barbershop Frame"] = "理髮店";
	L["Macro Frame"] = "宏";
	L["Debug Tools"] = "調試工具";
	L["Trainer Frame"] = "訓練師";
	L["Socket Frame"] = "珠寶";
	L["Achievement Popup Frames"] = "成就彈出窗";
	L["BG Score"] = "戰場記分窗";
	L["Merchant Frame"] = "商人";
	L["Mail Frame"] = "信箱";
	L["Help Frame"] = "幫助";
	L["Trade Frame"] = "交易";
	L["Gossip Frame"] = "閒談";
	L["Greeting Frame"] = "歡迎";
	L["World Map"] = "世界地圖";
	L["Taxi Frame"] = "載具";
	L["LFD Frame"] = "尋求組隊";
	L["Quest Frames"] = "任務";
	L["Petition Frame"] = "簽名";
	L["Dressing Room"] = "試衣間";
	L["PvP Frames"] = "PvP窗口";
	L["Non-Raid Frame"] = true;
	L["Friends"] = "好友";
	L["Spellbook"] = "技能書";
	L["Character Frame"] = "角色";
	L["LFG Frame"] = true;
	L["Misc Frames"] = true;
	L["Tabard Frame"] = "戰袍";
	L["Guild Registrar"] = "公會註冊";
	L["Time Manager"] = "時間管理";	
	L['Embedded Bar Height'] = "內嵌條高度";
	L['The height of the bars while skada is embedded.'] = "當Skada內嵌入聊天框時計量條的高度";		
	L["Mounts & Pets"] = "座騎和寵物";
	L["Pet Battle"] = "寵物對戰";
end

--Misc
do
	L['Bags'] = "背包";
	L['Totems'] = "圖騰";
	L['No Guild'] = "無公會";
	L['Left Chat'] = "左聊天框";
	L['Right Chat'] = "右聊天框";
	L["Experience Bar"] = "經驗條";
	L["Reputation Bar"] = "聲望條";
	L['Experience'] = "經驗條";
	L['Bars'] = "條";
	L['XP:'] = "經驗:";
	L['Remaining:'] = "剩餘:";
	L['Rested:'] = "休息:";
	
	L['Empty Slot'] = "空位";
	L['Fishy Loot'] = "魚";
	L["Can't Roll"] = "不能 Roll";
	L['Disband Group'] = "解散隊伍";
	L['Raid Menu'] = "團隊菜單";
	L['Your items have been repaired for: '] = "你的物品已經被修理: ";
	L["You don't have enough money to repair."] = "你沒有足夠的錢來修理.";
	L['Auto Repair'] = "自動修理";
	L['Automatically repair using the following method when visiting a merchant.'] = "當訪問NPC時已所設置的方法自動修理物品";
	L['Your items have been repaired using guild bank funds for: '] = "你所有的物品已經修正,使用公會銀行:";
	L['Loot Roll'] = "ROLL框";
	L['Enable/Disable the loot roll frame.'] = "啟用/禁用增強LOOT框體";
	L['Loot'] = "拾取框";
	L['Enable/Disable the loot frame.'] = "啟用/禁用拾取框";
	L['Exp/Rep Position'] = "經驗/聲望條位置";
	L['Change the position of the experience/reputation bar.'] = "改變經驗/聲望條位置";
	L['Top Screen'] = "螢幕頂端";
	L["Below Minimap"] = "依附小地圖";		
	L["Map Alpha While Moving"] = "地圖透明度";
	L['Controls what the transparency of the worldmap will be set to when you are moving.'] = "控制地圖移動時的透明度";
	L['Font'] = "字體"
end

--Bags
do
	L['Currency Format'] = "貨幣格式";
	L['The display format of the currency icons that get displayed below the main bag. (You have to be watching a currency for this to display)'] = "背包底部的貨幣顯示格式. (你需要在貨幣頁中勾選顯示)";
	L["Icons Only"] = "圖標";
	L["Icons and Text"] = "圖標和文字";
	L['Bag Width'] = '背包寬度';
	L['Bank Width'] = '銀行寬度';
	L['Already Running.. Bailing Out!'] = "已在運行";
	L['You must be at a bank.'] = "你必需在銀行";
	L['Confused.. Try Again!'] = "重試";
	L['Sort Inverted'] = "倒序";
	L['Stack Bags to Bank'] = "堆疊背包到銀行";
	L['Stack Bank to Bags'] = "堆疊銀行到背包";
	L['Click to search..'] = "點擊搜索";
	L['Sort Bags'] = "背包整理";
	L['Stack Items'] = "堆疊物品";
	L['Vendor Grays'] = "出售灰色物品";
	L['Toggle Bags'] = "背包開關";
	L['You must be at a vendor.'] = "你必需以商人為目標.";
	L['Vendored gray items for:'] = "已出售灰色物品: ";
	L['No gray items to sell.'] = "無灰白物品出售.";
	L['Hold Shift:'] = "按住 Shift:";
	L['Stack Special'] = "堆疊特殊背包";
	L['Sort Special'] = "整理特殊背包";
	L['Purchase'] = "購買";
	L["Can't buy anymore slots!"] = "再也不能購買空的背包位置";
	L['You must purchase a bank slot first!'] = "你必需購買一個銀行包位置";
	L['Enable/Disable the all-in-one bag.'] = "啟用/禁用整合背包";
	L['Delete Grays'] = '刪除灰色物品';
	L['Deleted %d gray items. Total Worth: %s'] = '刪除 %d 灰色物品。總價值：%s';	
	L["Are you sure you want to delete all your gray items?"] = "你確認要刪除你所有的灰色物品麼?";
	L['No gray items to delete.'] = "無灰色物品可刪除";
	L["Ascending"] = "昇冪";
	L["Bag-Bar"] = "背包條";
	L["Descending"] = "降序"
	L["Enable Bag-Bar"] = "啟用背包條"
	L["Enable/Disable the Bag-Bar."] = "啟用/禁用 背包條."
	L["Set the size of your bag buttons."] = "設置背包按鈕尺寸."
	L["Sort Direction"] = "排列方向"
	L["The direction that the bag frames be (Horizontal or Vertical)."] = "此方向決定框體是橫排還是豎排."
	L["The direction that the bag frames will grow from the anchor."] = "背包框體將從此方向開始排列."
	L["Bar Direction"] = "條方向"		
end

--AuraWatch
do
	L["AuraWatch"] = "技能監視"
	L["Sora's AuraWatch"] = "Sora's AuraWatch 技能監視模組, 不要和職業計時條同時使用";
	L["Choise Aura group"] = "選擇光環組";
	L["Add New Aurar"] = "添加光環";
	L["Delete Aura"] = "刪除光環";
	L["AuraID："] = "技能ID";
		L["Input BUFF/DEBUFF's AuraID, SpellID or ItemID"] = "請輸入 BUFF/DEBUFF 的法術ID, 技能ID或者物品ID";
	L["Monitor Type: "] = "監視類型";
	L["Aura"] = "BUFF/DEBUFF";
	L["Spell CD"] = "技能CD";
	L["Item ID"] = "物品CD";
	L["Monitor Object: "] = "監視目標";
	L["Filter by caster: "] = "按施法者過濾";
	L["Filter by Stacked layers: "] = "按堆疊層數過濾";
	L["Choise Group:"] = "選擇光環組";
	L["Add Group"] = "添加光環組";
	L["New Group"] = "新光環組(請改名)";
	L["Delete Group"] = "刪除光環組";
	L["Group Name"] = "光環組名稱";
		L["Input Group's Name"] = "輸入一個光環組名稱";
	L["Display Mode"] = "顯示模式";
	L["Icon Mode"] = "圖示樣式";
	L["Bar Mode"] = "計時條樣式";
	L["Direction"] = "方向";
	L["Growth direction"] = "增長方式";
	L["LEFT"] = "左";
	L["RIGHT"] = "右";
	L["UP"] = "上";
	L["DOWN"] = "下";
	L["Interval"] = "間隔";
	L["Icon Size"] = "圖示尺寸";
	L["Bar Width"] = "計時條寬度";
end

--Clickset
do
	L["ClickSet"] = "點擊施法"
	L["CLICKSET_DESC"] = "可以使用滑鼠直接點擊團隊/小隊框體進行施法"
	L["default"] = "啟用預設點擊方案"
	L["MouseButton1"] = "滑鼠左鍵"
	L["MouseButton2"] = "滑鼠右鍵"
	L["MouseButton3"] = "滑鼠中鍵"
	L["MouseButton4"] = "滑鼠第四鍵"
	L["MouseButton5"] = "滑鼠第五鍵"
	L["CustomClickSetSpell"] = "自定義技能列表"
		L["clickset_newname"] = "新增技能"
			L["clickset_newname_desc"] = "請輸入想添加的技能ID,由滑鼠提示中獲得"
		L["clickset_newname_err1"] = "無此對應ID的技能"
		L['clickset_deletename'] = "刪除技能"
			L['clickset_deletename_desc'] = "請輸入想刪除的技能ID"
		L["clickset_deletename_err"] = "無此技能"
		L["clicksetlist"] = "自定義點擊施法技能列表"
		
		L["DEFAULT_DESC"] = "啟用預設點擊方案, 關閉此項可使用自定義法術"
		L["type1"] = "滑鼠左鍵"
			L["TYPE1_DESC"] = "使用滑鼠左鍵直接點擊框體進行施法"
		L["shiftztype1"] = "Shift+滑鼠左鍵"
			L["SHIFTZTYPE1_DESC"] = "使用Shift+滑鼠左鍵點擊框體進行施法"
		L["ctrlztype1"] = "Ctrl+滑鼠左鍵"
			L["CTRLZTYPE1_DESC"] = "使用Ctrl+滑鼠左鍵直接點擊框體進行施法"
		L["altztype1"] = "Alt+滑鼠左鍵"
			L["ALTZTYPE1_DESC"] = "使用Alt+滑鼠左鍵直接點擊框體進行施法"
		L["altzctrlztype1"] = "Alt+Ctrl+滑鼠左鍵"
			L["ALTZCTRLZTYPE1_DESC"] = "使用Alt+Ctrl+滑鼠左鍵直接點擊框體進行施法"
		L["type2"] = "滑鼠右鍵"
			L["TYPE2_DESC"] = "使用滑鼠右鍵直接點擊框體進行施法"
		L["shiftztype2"] = "Shift+滑鼠右鍵"
			L["SHIFTZTYPE2_DESC"] = "使用Shift+滑鼠右鍵直接點擊框體進行施法"
		L["ctrlztype2"] = "Ctrl+滑鼠右鍵"
			L["CTRLZTYPE2_DESC"] = "使用Ctrl+滑鼠右鍵直接點擊框體進行施法"
		L["altztype2"] = "Alt+滑鼠右鍵"
			L["ALTZTYPE2_DESC"] = "使用Alt+滑鼠右鍵直接點擊框體進行施法"
		L["altzctrlztype2"] = "Alt+Ctrl+滑鼠右鍵"
			L["ALTZCTRLZTYPE2_DESC"] = "使用Alt+Ctrl+滑鼠右鍵直接點擊框體進行施法"
		L["type3"] = "滑鼠中鍵"
			L["TYPE3_DESC"] = "使用滑鼠中鍵直接點擊框體進行施法"
		L["shiftztype3"] = "Shift+滑鼠中鍵"
			L["SHIFTZTYPE3_DESC"] = "使用Shift+滑鼠中鍵直接點擊框體進行施法"
		L["ctrlztype3"] = "Ctrl+滑鼠中鍵"
			L["CTRLZTYPE3_DESC"] = "使用Ctrl+滑鼠中鍵直接點擊框體進行施法"
		L["altztype3"] = "Alt+滑鼠中鍵"
			L["ALTZTYPE3_DESC"] = "使用Alt+滑鼠中鍵直接點擊框體進行施法"
		L["altzctrlztype3"] = "Alt+Ctrl+滑鼠中鍵"
			L["ALTZCTRLZTYPE3_DESC"] = "使用Alt+Ctrl+滑鼠中鍵直接點擊框體進行施法"
		L["shiftztype4"] = "Shift+滑鼠第四鍵"
			L["SHIFTZTYPE4_DESC"] = "使用Shift+滑鼠第四鍵直接點擊框體進行施法"
		L["ctrlztype4"] = "Ctrl+滑鼠第四鍵"
			L["CTRLZTYPE4_DESC"] = "使用Ctrl+滑鼠第四鍵直接點擊框體進行施法"
		L["altztype4"] = "Alt+滑鼠第四鍵"
			L["ALTZTYPE4_DESC"] = "使用Alt+滑鼠第四鍵直接點擊框體進行施法"
		L["altzctrlztype4"] = "Alt+Ctrl+滑鼠第四鍵"
			L["ALTZCTRLZTYPE4_DESC"] = "使用Alt+Ctrl+鼠第四鍵鍵直接點擊框體進行施法"
		L["type4"] = "滑鼠第四鍵"
			L["TYPE4_DESC"] = "使用滑鼠第四鍵直接點擊框體進行施法"
		L["shiftztype5"] = "Shift+滑鼠第五鍵"
			L["SHIFTZTYPE5_DESC"] = "使用Shift+滑鼠第五鍵直接點擊框體進行施法"
		L["ctrlztype5"] = "Ctrl+滑鼠第五鍵"
			L["CTRLZTYPE5_DESC"] = "使用Ctrl+滑鼠第五鍵直接點擊框體進行施法"
		L["altztype5"] = "Alt+滑鼠第五鍵"
			L["ALTZTYPE5_DESC"] = "使用Alt+滑鼠第五鍵直接點擊框體進行施法"
		L["altzctrlztype5"] = "Alt+Ctrl+滑鼠第五鍵"
			L["ALTZCTRLZTYPE5_DESC"] = "使用Alt+Ctrl+滑鼠第五鍵直接點擊框體進行施法"
		L["type5"] = "滑鼠第五鍵"
			L["TYPE5_DESC"] = "使用滑鼠第五鍵直接點擊框體進行施法"	
		L["menu"] = "菜單"
		L["target"] = "目標"	
	L["value type"] = "數值顯示類型"
	L["set value type"] = "設置數值顯示是否以K(千),或W(萬)縮寫"
	L["0"] = "具體數值"
	L["K"] = "千位縮寫"
	L["W"] = "萬位縮寫"	
	
	L["Eui AB Style"] = "Eui預置動作條樣式"
	L["EuiABStyle_desc"] = "提供三種預設動作條佈局樣式, \n自定義佈局請設此項為'None'"
	L["Low ScreenResolution Style"] = "低解析度樣式"
	L["Middle ScreenResolution Style"] = "中分辨率樣式"
	L["High ScreenResolution Style"] = "高解析度樣式"
	
	L["embedright"] = "右聊天框嵌入"
	L["embedright_desc"] = "將插件內嵌入右聊天框內"
	L["embedcombat"] = "右聊天框嵌入戰鬥切換"
	L["embedcombat_desc"] ="右側聊天框嵌入的插件默認隱藏, 進入戰鬥時顯示."	
	
	L["Incoming Heals"] = "治療預估"
	L["Show predicted incoming heals"] = "顯示治療預估值"

	L['Primary'] = "主天賦"
	L['Secondary'] = "副天賦"	

	L["calendar_string"] = "日曆"
	L["GameMenu"] = "遊戲選項"
	
	L["Force Name Classcolor"] = "強制名字職業色"
end	

--euiscript
do
	L["Auto change loot"] = "自動更改分配方式";
	L["InGroup change loot to freecall, InRaid change loot to master"] = "隊伍中改爲自由拾取,團隊中改爲團長分配,界限爲史詩";
	L['Display spell trigger graphics prompt'] = '技能觸發圖形提示';
	L["All Mail"] = '所有信件';
	L["All Cash"] = '所有金幣';
	L["lfg notification"] = "隨機本獎勵提示";
	L['Quset Button Number'] = '任務物品按鈕數量';
	L['Slot Button Number'] = '裝備按鈕數量';
	L["euiscript"] = "增強功能"
	L["euiscript_desc"] = "國服版增強功能開關"
	L["euiscript_general"] = "一般設置"
	L["bossnotes"] = "啟用一句話攻略"
		L["BOSSNOTES_DESC"] = "選中BOSS為目標,輸入/boss即可"
	L["castby"] = "顯示光環的施法者"
		L["CASTBY_DESC"] = "顯示BUFF/DEBUFF是由誰施放的"
	L["chatmod"] = "啟用TAB切換頻道"
		L["CHATMOD_DESC"] = "啟用TAB鍵切換頻道功能,及語言標籤美化"
	L["drag"] = "啟用暴雪框體拖拉功能"
		L["DRAG_DESC"] = "可以任意拖拉介面的大都多的窗口"
	L["ilevel"] = "顯示目標裝備等級"
		L["ILEVEL_DESC"] = "在滑鼠提示中顯示指向目標的裝備平均等級"
	L["mapmove"] = "啟用大地圖移動按鈕"
		L["MAPMOVE_DESC"] = "在大地圖上增加一個十字型的移動按鈕,如果安裝第三方地圖插件,建議關閉"
	L["openall"] = "啟用一鍵收取郵件功能"
		L["OPENALL_DESC"] = "在郵箱介面添加一鍵收信的兩個按鈕"
	L["recipients"] = "啟用郵件收件人列表"
		L["RECIPIENTS_DESC"] = "在發件人框添加一個下拉框可以保存收件人姓名以供使用"
	L["sr"] = "啟用增強經驗/聲望顯示"
		L["SR_DESC"] = "在聊天框中以當前經驗(聲望)/總經驗(聲望)的方式顯示"
	L["statreport"] = "啟用角色數據報告模組"
		L["STATREPORT_DESC"] = "在聊天框左上角添加一個劃過顯示的按鈕,用來發送角色數據報告"
	L["talent"] = "啟用目標天賦顯示"
		L["TALENT_DESC"] = "在滑鼠提示中顯示指向目標的天賦"
	L["tradetabs"] = "啟用專業技能標籤"
		L["TRADETABS_DESC"] = "在專業技能窗口顯示你所學的專業技能圖示,方便切換專業"
	L["mousedispel"] = "啟用滑鼠滾輪驅散"
		L["MOUSEDISPEL_DESC"] = "將創建兩個滑鼠指向宏用來在團隊/小隊框體上滾動滾輪驅散DEBUFF, 原視野放大縮小變更為Alt+滑鼠滾輪"
	L["hovertip"] = "自動裝備比較"
		L["HOVERTIP_DESC"] = "滑鼠劃過鏈結直接顯示聊天框中的物品資訊和裝備比較"
	L["idQuestAutomation"] = "自動交接任務"
		L["idQuestAutomation_desc"] = "按住Shift可禁用自動交接"
	L["raidcd"] = "團隊技能冷卻監視"
		L["raidcd_width"] = "冷卻條寬度"
		L["raidcd_height"] = "冷卻條高度"
		L["raidcd_maxbars"] = "最大條數"
		L["raidcd_direction"] = "增長方向"
		L["raidcd_desc"] = "在小地圖下方列出顯示團隊關鍵技能冷卻計時條"
		L["up"] = "上"
		L["down"] = "下"
		L["left"] = "左"
		L["right"] = "右"		
	L["classcd"] = "內置CD冷卻監視"
		L["classcd_width"] = "寬度"
		L["classcd_height"] = "高度"
		L["classcd_maxbars"] = "最大條數"
		L["classcd_direction"] = "增長方向"
		L["classcd_desc"] = "列出顯示職業被動冷卻技能和飾品及FM的內置CD計時條"
		L["classcd_style"] = "樣式\n圖示樣式時尺寸同高度"
		L["icon"] = "圖示樣式"
		L["bar"] = "計時條樣式"
	L["wildmushroom"] = "鳥德蘑菇條"
		L["wildmushroom_width"] = "冷卻條寬度"
		L["wildmushroom_height"] = "冷卻條高度"
		L["wildmushroom_direction"] = "增長方向"
		L["wildmushroom_desc"] = "鳥德野性蘑菇的計時條"
	L["mapfull"] = "顯示未探索地區"	
	L["chatbar"] = "頻道切換條"
	L["combatnoti"] = "進出戰鬥提示"
		L["combatnoti_leaving"] = "離開戰鬥提示資訊"
		L["combatnoti_entering"] = "進入戰鬥提示資訊"
	L["wgtimenoti"] = "托巴倒計時提示"
	L["chatemote"] = "聊天表情"
	L["autogreed"] = "自動貪婪/分解綠裝"
	L["buffreminder"] = "BUFF提示"
	L["autoacceptinv"] = "自動接受邀請"
	L["autoinvenable"] = "關鍵字組隊"
	L["ainvkeyword"] = "自動組隊關鍵字"
	L["errorenable"] = "戰鬥時遮罩紅字錯誤"
	
	L['DoomCooldownPulse'] = "冷卻提示模塊";
	L['Usge: /dcp'] = "命令: /dcp";
	L["Icon Size"] = "圖示尺寸";
	L["Fade In Time"] = "漸穩進入時間";
	L["Fade Out Time"] = "漸隱淡出時間";
	L["Max Opacity"] = "最大透明度";
	L["Max Opacity Hold Time"] = "最大透明度持續時間";
	L["Animation Scaling"] = "動態效果縮放比率";
	L["Close"] = "關閉";
	L["Test"] = "測試";
	L["Unlock"] = "解鎖";
	L["Lock"] = "鎖定";
	L["Defaults"] = "默認";
	L["Show spell name:"] = "顯示技能名稱";
	L["Cooldowns to ignore:"] = "被忽略的技能冷卻:";
	L["Pet color overlay:"] = "寵物顏色覆蓋";
	L["Note: Separate multiple spells with commas"] = "注: 用逗號分隔多個技能名";	
	
	L["Auto Sell"] = "自動出售灰色物品";
	L["Auto Join LFD"] = "自動進入隨機本";
	L["Camera Distance MAX Factory"] = "鏡頭最遠距離係數";
	L["Camera Distance MAX"] = "鏡頭最遠距離";	
	L["Auto Disenchant confirmation"] = "自動確認分解";
	L["BloodShield"] = "護盾監視";
		L["BloodShield desc"] = "在玩家框體上顯示所有坦和MS盾的主減傷護盾時間,DK坦同時顯示吸收數值"
	L["autobuy reagents"] = "自動購買施法材料"
	L["Auto QuestItem Button"] = "自動任務物品按鍵";
	L["Auto InventoryItem Button"] = "自動裝備飾品按鍵";
	L["Battleground Info"] = "战场信息条"
	L["TaintError"] = "顯示戰鬥污染錯誤"
	L["achievementpoint"] = "成就點數";
	L['SaveButton'] = "保存動作條按鍵和技能";
	L['LoadButton'] = "載入動作條按鍵和技能";
	L['Only Save current talnet actionbar button, DoubleTalnet use double profile file to save.'] = "只保存當前天賦狀態下的動作條技能位置和快捷鍵設置,雙天賦建議使用多配置來分別保存";
	L["Button is Saved!"] = "動作條按鍵和技能保存成功!";
	L["MySlot Support"] = "以下功能需要MySlot插件支持,可到EUI自動更新器的可選插件中下載.";	
	L["alt marking"] = "Alt+左鍵快速標記";
end

--Mover
do
	L["Loot / Alert Frames"] = "拾取 / 成就框";
	L['Weapons'] = "武器(毒藥/強化等)";
	L["Auras Frame"] = "BUFF/DEBUFF 窗口";
	L["Achievement Frames"] = "成就窗口";
	L["GM Ticket Frame"] = "GM 對話框";
	L["Alert Frames"] = "彈出窗口";
	L['Alternative Power'] = "特殊能量條";
	L["Loot Frames"] = "拾取框";
	L["Vehicle Seat Frame"] = "載具座位框";
	L["Watch Frame"] = "任務追蹤框";
	L["Minimap"] = "小地圖";
	L["Loot Frame"] = "拾取窗口";
	L["LootRoll Frame"] = "ROLL 框";
	L["Tooltip"] = "滑鼠提示";
	L["Player Frame"] = "玩家框體";
	L["Target Frame"] = "目標框體";
	L["TargetTarget Frame"] = "目標的目標框體";
	L["Focus Frame"] = "焦點框體";
	L["FocusTarget Frame"] = "焦點目標框體";
	L["Pet Frame"] = "寵物框體";
	L["PetTarget Frame"] = "寵物目標框體";
	L["Party Frames"] = "隊伍框體";
	L["Arena Frames"] = "競技場框體"
	L["Boss Frames"] = "BOSS框體"
	L["Raid 1-25 Frames"] = "團隊框架";
	L["MT Frames"] = "主坦克框體"
	L["MA Frames"] = "主助理框體"
	L["Attention Frames"] = "關注框體"
	L["raid2640"] = "40人團隊";
	L['Bar 1'] = "動作條1";
	L['Bar 2'] = "動作條2";
	L['Bar 3'] = "動作條3";
	L['Bar 4'] = "動作條4";
	L['Bar 5'] = "動作條5";
	L['Bar 6'] = "動作條6";
	L['Bar 7'] = "動作條7";
	L['Bar 8'] = "動作條8";
	L['Bar 9'] = "動作條9";	
	L['Pet Bar'] = "寵物動作條";
	L['Stance Bar'] = "姿態條";
	L['Totem Bar'] = "圖騰條";
	L['Boss Button'] = "特殊技能鍵";
	L["Top Infobar"] = "頂部資訊條";
	L["BNet Frame"] = "戰網提示資訊";
	L['LeftChatPanel'] = "左聊天框面板";
	L['RightChatPanel'] = "右聊天框面板";	
	L['Micro Bar'] = "微型系統菜單欄";
end

-- Attention Frame
do
	L["ATTENTION_TIP1"] = "EUI玩家關注目標添加命令";
	L["ATTENTION_TIP2"] = "請選中你要關注的目標";
	L["ATTENTION_TIP3"] = "請先啟用玩家關注目標功能";
	L["ATTENTION_TIP4"] = "戰鬥中不能使用此功能";
	L["ATTENTION_TIP5"] = " 已在關注列表中";
	L["ATTENTION_TIP6"] = " 已添加為關注目標";
	L["ATTENTION_TIP7"] = "EUI玩家關注目標移除命令";
	L["ATTENTION_TIP8"] = "請選中你要移除關注的目標";
	L["ATTENTION_TIP9"] = "關注列表中無此玩家";
	L["ATTENTION_TIP10"] = " 從關注列表中移除了";
end

-- SoraClassTimer
do
	L["SoraClassTimer"] = "法術監視"
		L["Sora's ClassTimer desc"] = "顯示玩家小於60秒的BUFF, 目標小於60秒的DEBUFF.\n\n玩家DEBUFF只會顯示白名單中的技能. 目標只會顯示友好對象的小於60秒的BUFF.\n\n白名單中的技能不受60秒時間限制. 黑名單中的技能總是不顯示的."
	L["Player Aura Timer"] = "玩家光環監視"
		L["Choise Timer Mode"] = "選擇光環監視模式"
	L["Player Aura Timer Icon Size"] = "玩家光環圖示尺寸"
	L["Target Aura Timer"] = "目標光環監視"
	L["Target Aura Timer Icon Size"] = "目標光環圖示尺寸"
	L["Always will not be displayed"] = "總是不會顯示的"
	L["Without a time limit of 60 seconds, and will always be displayed"] = "不受60秒時間限制,總是會顯示的"
	L["Add New Aura ID"] = "添加新的光環ID"
	L["Delete Aura ID"] = "刪除光環ID"
	L["Enable/Disable"] = "啟用/禁用"
end

--ChatFilter
do
	L["Filter the bullshit messages from RaidAlert"] = '過濾RaidAlert信息';
	L["Filter the drunk messages:'... has drunked ...'"] = '過濾某人喝醉了...的信息';
	L["chatfilter"] = "資訊過濾"
	L["Enabled"] = "啟用"
	L["Scan ourself"] = "是否掃描自己的聊天資訊"
	L["Scan friends"] = "是否掃描好友的聊天資訊"
	L["Scan raid/party members"] = "是否掃描隊友的聊天資訊"
	L["Scan guildies"] = "是否掃描公會成員的聊天資訊"
	
	L["Disable the profanityFilter"] = "關閉語言篩檢程式"
	L["Disable the alert joinleaveChannel"] = "關閉進出頻道提示"
	
	L["Merge the messages:'You have learned/unlearned...'"] = "當切換天賦後合併顯示“你學會了/忘卻了法術…”"
	L["Filter the messages:'Your pet has learned/unlearned...'"] = "不顯示“你的寵物學會了/忘卻了…”"
	
	L["Merge the messages:'...has earned the achievement...'"] = "合併顯示獲得成就"
	L["Merge the messages:'You has created...'"] = "合併顯示“你製造了…”"
	
	L["Filter the messages:'Auction created/cancelled'"] = "過濾“已開始拍賣/拍賣取消.”"
	L["Filter the messages:'... has defeated/fled from ... in a duel'"] =  "過濾“...在決鬥中戰勝了...”"
	
	L["Filter the advertising messages"] = "過濾廣告資訊"
	L["How many words can be allowd to use"] = "允許的關鍵字配對個數"
	
	L["Filter the multiple messages"] = "過濾多行資訊"
	L["How many lines can be allowd"] = "允許的最大行數"
	
	L["Filter the repeat messages"] = "過濾重複聊天資訊"
	L["Set the similarity between the messages"] = "設定重複資訊相似度"
	L["Set the interval between the messages"] = "設定重複資訊間隔時間"
	L["Set the max cache from the messages"] = "設定最多緩存多少條消息"
	L["Word BlackList"] = "關鍵字黑名單";
	L["Word WhiteList"] = "關鍵字白名單";
	L["Word BlackList intro"] = "黑名單中的關鍵字如果在聊天中出現, 則此條聊天資訊不會顯示";
	L["Word WhiteList intro"] = "白名單中的關鍵字如果在聊天中出現, 則此條聊天資訊不受黑名單和其他任何限制總是會顯示";
	L["BlackList"] = "黑名單列表";
	L["WhiteList"] = "白名單列表";
	L["New Word"] = "新增關鍵字";
	L["Delete Word"] = "刪除關鍵字";		
	L["sender blanklist"] = "發言人黑名單";
	L["sender blanklist intro"] = "這些列表中的玩家發言將會被過濾掉";	
end

-- Combat text options
do
	L["combattext"] = "戰鬥文字"
	L["combattext desc"] = "設置命令/MSBT"
	L["blizz head numbers"] = "使用暴雪默認傷害/治療模式（模型頂部/玩家頭像）"
	L["damage style"] = "改變模型頂部/玩家頭像的傷害/治療字體"
	L["damage"] = "獨立顯示傷害輸出"
	L["healing"]= "獨立顯示治療輸出"
	L["show hots"] = "顯示hot造成的治療"
	L["show overhealing"] = "顯示過量治療輸出"
	L["pet damage"] = "顯示寵物傷害輸出"
	L["dot damage"] = "顯示dot造成的傷害"
	L["damage color"] = "以法術系別顏色顯示傷害文字"
	L["crit prefix"] = "文本左側爆擊效果修飾符號"
	L["crit postfix"] = "文本右側爆擊效果修飾符號"
	L["icons"] = "顯示輸出傷害技能圖示"
	L["icon size"] = "傷害輸出圖示大小"
	L["treshold"] = "傷害輸出資訊最小閥值"
	L["heal treshold"] = "治療承受資訊/輸出最小閥值"
	L["scrollable"] = "允許滑鼠調整滾動區域"
	L["max lines"] = "滾動區域顯示最多行數"
	L["time visible"] = "資訊保留時間(秒)"
	L["stop ve spam"] = "自動遮罩吸血鬼之擁(@暗牧)的垃圾資訊"
	L["dk runes"] = "顯示死亡騎士符文恢復"
	L["killingblow"] = "顯示擊殺資訊"
	L["merge aoe spam"] = "將AOE傷害合併為一條資訊"
	L["merge aoe spam time"] = "AOE傷害合併資訊閥值(秒)"
	L["dispel"] = "當你驅散成功的時候提示"
	L["interrupt"] = "當你打斷成功的時候提示"
	L["combat text font size"] = "傷害數字尺寸"
	L["Scroll Direction"] = "滾動方向"	
end

-- Bags
do
	L['BAGS_DESC'] = '調整EUI背包設置. 左鍵移動(位置不保存)';
	L['Bag Columns'] = '背包列數';
	L['Number of columns (width) of bags. Set it to 0 to match the width of the chat panels.'] = '背包列數(寬度), 設為0自動匹配右聊天框寬度.';
	L['Bank Columns'] = '銀行列數';
	L['Number of columns (width) of the bank. Set it to 0 to match the width of the chat panels.'] = '銀行列數(寬度), 設為0自動匹配左聊天框寬度.';
	L['Sort Orientation'] = '排序方向';
	L['Direction the bag sorting will use to allocate the items.'] = '整理背包時物品排序方向.';
	L['Bottom to Top'] = '底部到頂部';
	L['Top to Bottom'] = '頂部到底部';
	L['Panel Width (Bags)'] = "背包面板寬度";
	L['Toggle Bags'] = '開關背包';
	L['Align To Chat'] = '對齊到聊天框';
	L['Panel Width (Bank)'] = '銀行面板寬度';
	L['Adjust the width of the bank frame.'] = '調整銀行背包框體寬度';
	L['Button Size (Bag)'] = '背包格子尺寸';
	L['Align the width of the bag frame to fit inside the chat box.'] = '調整背包框的寬度以適應聊天框';
	L['Adjust the width of the bag frame.'] = '調整背包框體寬度';
	L['The size of the individual buttons on the bank frame.'] = '銀行框體單個格子的尺寸';
	L['The size of the individual buttons on the bag frame.'] = '背包框體單個格子的尺寸';
	L['Button Size (Bank)'] = '銀行背包格子尺寸';	
end

-- Reminder
do
	L["Add Group"] = "添加組";
	L["Any"] = "任意"
	L["Caster"] = "施法者"
	L["Combat"] = "戰鬥"
	L["Group already exists!"] = "組已經存在!!"
	L["If any spell found inside this list is found the icon will hide as well"] = "列表中的任何技能圖示將會被隱藏"
	L["Inside BG/Arena"] = "戰場/競技場內"
	L["Inside Raid/Party"] = "團隊或隊伍內"
	L["Instead of hiding the frame when you have the buff, show the frame when you have the buff. You must have either a Role or Spec set for this option to work."] = "隱藏框體, 顯示框體你必需通過職責或天賦檢查使此選項生效."
	L["Level Requirement"] = "等級需求"
	L["Level requirement for the icon to be able to display. 0 for disabled."] = "達到等級才能顯示. 0則禁用."
	L["Negate Spells"] = "不想要的法術"
	L["New ID"] = "新ID"
	L["New ID (Negate)"] = "新ID(不想要的)"
	L["Only check if the buff is coming from you."] = "只檢查BUFF是否是你的."
	L["Only run checks during combat."] = "只檢查是否在戰鬥中."
	L["Only run checks inside BG/Arena instances."] = "只檢查是否在戰場/競技場中."
	L["Only run checks inside raid/party instances."] = "只檢查是否在隊伍/團隊中."
	L["Personal Buffs"] = "個人 Buffs"
	L["REMINDER_DESC"] = "此模組將在螢幕中顯示一個警告的圖示, 當你少某個BUFF或有某個不想要的BUFF."
	L["Reminders"] = "BUFF 提示"
	L["Remove Group"] = "刪除組"
	L["Remove ID"] = "刪除 ID"
	L["Remove ID (Negate)"] = "刪除 ID (不想要的)"
	L["Reverse Check"] = "逆向檢查"
	L["Role"] = "職責"
	L["Select Group"] = "選擇組"
	L["Set a talent tree to not follow the reverse check."] = "設置天賦樹不按照逆向檢查."
	L["Spell not found in list"] = "列表中未發現技能"
	L["Spells"] = "技能"
	L["Talent Tree"] = "天賦樹"
	L["Tree Exception"] = "樹異常"
	L["Value must be a number"] = "值必須是一個數字"
	L["You can't remove a default group from the list, disabling the group."] = "你不能刪除內置組,可以禁用它."
	L["You must be a certain role for the icon to appear."] = "你必需有一個可靠的職責來顯示此圖示."
	L["You must be using a certain talent tree for the icon to show."] = "你必需使用一個可靠的天賦樹來顯示圖示."
	L["Sound"] = "聲音"
	L["Sound that will play when you have a warning icon displayed."] = "當警告圖示顯示時播放聲音."
	L["Change this if you want the Reminder module to check for weapon enchants, setting this will cause it to ignore any spells listed."] = "改變BUFF提示模組來檢查武器附魔, 設置這個將導致它忽略所有的技能列表."
	L["Group By"] = "組按"
	L["Set the order that the group will sort."] = "設置組排序的順序."
	L["Spell"] = "技能"
	L["Weapon"] = "武器"
	L["Attempted to show a reminder icon that does not have any spells. You must add a spell first."] = "嘗試顯示一個提示但沒有任何技能。你必須先添加一個技能."
	L["Strict Filter"] = "嚴格匹配"
	L["This ensures you can only see spells that you actually know. You may want to uncheck this option if you are trying to monitor a spell that is not directly clickable out of your spellbook."] = "這將保證只會顯示你已經學會的技能. 你可能想取消這個選項, 如果你想監視一個你不會的技能."
	L["Disable Sound"] = "禁用聲音"
	L["Don't play the warning sound."] = "不播放警告聲音."
	L['CD Fade'] = "透明度";
	L["Cooldown"] = "CD";
	L["Spell ID"] = "技能ID";
	L["OnCooldown"] = "CD時";
	L["SHOW"] = "顯示";
	L["HIDE"] = "隱藏";	
end

--FindIt
do
	L["FindIt"] = "搜索模組";
	L["Search achievement, item and spell... etc."] = "可用來搜索成就,物品和技能等, 注意搜索物品時只能填入物品ID, 點擊搜索結果可發送至聊天框查看詳細內容.";
	L["Find Type"] = "類別";
	L["achievement"] = "成就";
	L["currency"] = "貨幣";
	L["dungeon"] = "副本";
	L["faction"] = "陣營";
	L["item"] = "物品";
	L["spell"] = "法術";
	L["MSG"] = "內容";
	L["Search"] = "搜索";
	L["Non-ID lookups for items are disabled!"] = "物品搜索因BLZ限制只能填入物品ID";
	L["Search result"] = "搜索結果";
end

--Q&A
do
	L["Q&A"] = "常見問題解答"
	L["Q1"] = "初次使用EUI, 進入遊戲後介面混亂, 很多報錯等..."
		L["A1"] = "EUI是個完整功能的WOW插件, 不能與其它的整合插件如魔盒,大腳等同時使用, 也不要和其他OUF插件共用."
	L["Q2"] = "設置介面上一些術語的解釋"
		L["A2"] = "人物模型頭頂的那個叫姓名版, 顯示玩家,目標等血量的框體包含在單位框體內,相關選項如BUFF,DEBUFF,施法等都可以在其入找到, 篩檢程式包含兩種工作方式,黑名單方式和白名單方式,大部份內置默認為白名單"
	L["Q3"] = "如何監視玩家自已的一些觸發BUFF或目標身上的DEBUFF效果"
		L["A3"] = "EUI內置三種監視模組,在設置介面上00開頭的藍色字體的三種,默認啟用的光環條模組, 此模組可移動, 可調尺寸，顯示方式為計時條, 添加監視內容在光環條頁的過濾頁裏. 這三種模組最好只開一種,否則比較混亂, 除了職業計時條其他兩種模組可以通過L解鎖移動."
	L["Q4"] = "如何調整介面上各個框體的位置"
		L["A4"] = "點左聊天框右上角的L,可以快速解鎖介面上各元件,如果被擋住,也可點小地圖的右下角的C,或主菜單中的EUI進入, 或者輸入/ec命令訪問, 設置介面有個解鎖按鈕."
	L["Q5"] = "如何移動施法條的位置和改變尺寸"
		L["A5"] = "在設置介面的單位框體裏,找到玩家框體, 注意右上角的下拉菜單, 在其內找到施法條, 調節X,Y值可移動位置,點顯示/隱藏按鈕可預覽施法條."
	L["Q6"] = "透明主題如何開啟"
		L["A6"] = "透明主題的總開關在材質和字體設置頁的中下部, 單位框體的一般設置頁的透明主題開關單獨影響單位框體模組,但受總開關控制"
	L["Q7"] = "人物, 法術書等系統菜單到哪兒找"
		L["A7"] = "EUI對這部份進行了精簡, 可通過右擊頂部資訊條,或在小地圖框內按滑鼠中鍵來訪問此菜單"
	L["Q8"] = "UI縮放問題"
		L["A8"] = "EUI接管了系統自帶的UI縮放,在一般設置裏, 默認是使用自動縮放, 如果不合適,可關閉自動縮放,手工調整後面的縮放值, 每次調整後,需/rl重載生效."
	L["Q9"] = "大腳表情和角色數據報告在哪兒? 5人副本的功略呢?"
		L["A9"] = "在左聊天框E是表情,S是發送角色報告, 旁邊的腳丫圖示是開關大腳世界頻道的,L是框體解鎖. 在5人FB裏選中BOSS為目標輸入/boss命令可發送功略"
	L["Q10"] = "背包在哪兒調"
		L["A10"] = "EUI V4開始不帶Baudbag背包了,內置整合背包,可直接左鍵移動，並可保存位置，可調網路尺寸, 在EUI設置介面的背包頁裏調整"
	L["Q11"] = "雙天賦切換介面及配置檔等問題"
		L["A11"] = "在設置介面的配置頁裏, 可以新建一個配置檔, 然後勾選雙天賦配置,可設置好主副天賦的配置檔, 這樣切換天賦後就會自動切換配置檔,達到新介面的效果. 當然你也可以手動切換,比如打副本一個配置,PVP一個等."
	L["Q12"] = "潛行者的影舞和潛行能不能區分動作條"
		L["A12"] = "在設置介面的動作條頁裏, 找到動作條1, 在翻頁設置中改為[stance:1] 7;  [stance:2] 7; [stance:3] 10;"
	L["Q13"] = "介面邊框顏色,血量顏色等如何調整."
		L["A13"] = "介面整體邊框, 背景顏色在一般設置的中下部設置, 職業色血條在單位框體的一般設置頁裏最下麵有職業色血量顯示等."
	L["Q14"] = "在10人副本,或25人副本中如何顯示出所有的隊伍."
		L["A14"] = "在單位框體的一般設置中,關閉智能團隊過濾即可, 團隊框架將會顯示其設置值允許的隊伍數,默認為8"
	L["Q15"] = "如何將Skada, recount等插件裝入右邊聊天框中."
		L["A15"] = "在設置介面的聊天框頁裏, 有個右聊天框嵌入, 並可選擇戰鬥切換."
	L["Q16"] = "聊天框亂了或沒了, 怎麼辦?"
		L["A16"] = "進入EUI設置(/ec)點安裝, 點到設置聊天框這一步就行了. 如果左右聊天框不小心點到最左下角或最右角隱藏掉的話,只要在最左下角或右下角相同位置再點一下就會出現."
	L["Q17"] = "聊天框中的人名,裝備,物品不能點了怎麼辦?"
		L["A17"] = "滑鼠右擊點擊聊天框的綜合, 去除'使其不可交互'選項."
	L["Q18"] = "右上角的BUFF顯示不完整怎麼辦."
		L["A18"] = "在系統介面遊戲,增益效果和負面效果裏,去除整理增益效果開關."
	L["Q19"] = "傷害顯示在哪兒打開?"
		L["A19"] = "EUI默認使用暴雪內置的傷害顯示模式, 當然也集成了XCT,開關設置介面的戰鬥文字裏, 如果要顯示承受傷害,記得打開系統介面浮動戰鬥資訊裏的我的浮動戰鬥資訊"		
	L["Q20"] = "稀有怪報警插件等怎麼沒有呀"
		L["A20"] = "EUI默認只有一些必需的插件, 這些插件可通過EUI自動更新器的可選插件進行下載安裝"
	L["Q21"] = "BOSS技能計時條怎麼移動"
		L["A21"] = "這個是DBM插件的功能, /DBM調出設置介面,在計時條選項裏可以解鎖移動"
	L["Q22"] = "其他單體插件與EUI的相容性問題"
		L["A22"] = "原則上EUI相容所有的單體插件,但注意如果單體插件提供的功能是EUI已經有的功能,則可能造成衝突.如右上角的BUFF顯示插件."
	L["Q23"] = "常用設置命令有哪些"
		L["A23"] = "/ec 打開設置介面\n /luaerror 開關顯示插件錯誤 \n /egrid 顯示網格線方便對齊\n /moveui 解鎖框體移動\n /resetui 重置EUI插件\n /frammode 採集模式小地圖\n /kb 設置動作條快捷鍵\n /cleanguild 清理公會會員\n /skada toggle 開關Skada窗口"
end			

--Tukui_ElvUI_Skins
L['AddOns'] = "插件美化包";
L['Misc Options'] = "雜項設置";
L['Square minimap icons'] = "方形小地圖圖示";
L['DBM Half-bar Skin'] = 'DBM 半高樣式';
L['Recount Backdrop'] = "Recount 背景";
L['Skada Backdrop'] = "Skada 背景";
L['Embed Settings'] = "聊天框內嵌設置";
L['Settings to control addons embedded in right chat panel'] = "控制插件嵌入到右聊天框面板";
L['Hide while out of combat'] = "脫離戰鬥時隱藏";
L['Attach SexyCD to action bar'] = "附加 SexyCD 到動作條";