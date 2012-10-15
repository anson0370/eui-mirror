local E = unpack(ElvUI) -- Import Functions/Constants, Config, Locales
if E.db["euiscript"].bossnotes ~= true then return end

--BOSS数据来源于163网站
local BossData = {
	["魔古山宫殿"] = {
		{name = "力冠三军库乌艾", raiders = "坦克将BOSS背对人群，躲好震荡波，拉好穆辛巴，治疗刷好穆辛巴的毁灭目标。"},
		{name = "鬼谋神算明谷子", raiders = "躲开回旋风暴和磁场，打断好闪电箭。"},
		{name = "势不可挡的哈伊岩", raiders = "施放流星时集中，施放燃烧时分散。"},
		{name = "杰翰", raiders = "坦克拉好四只小怪，优先击杀铁皮战士，再击杀潜藏者，再击杀其他两种小怪，击杀BOSS"},
		{name = "武器大师席恩", raiders = "坦克将BOSS背对人群，BOSS施放砸击地面时，离开BOSS正面。所有人都要躲好烈焰之环，旋风之斧，利刃陷阱"},
	},
	["围攻砮皂寺"] = {
		{name = "宰相金巴卡", raiders = "BOSS施放引爆的时候，场中的水池（腐蚀毒液），一定要有人去踩，踩了之后会变小，让引爆伤害降低。踩水池的会中树脂残渣，治疗刷好。"},
		{name = "指挥官沃加克", raiders = "使用螳螂妖焦油桶，扔向进攻上来的虫群，希克提克歼灭者受到攻击会自爆，远程直接点杀，躲开希克提克琥珀飞翼的轰炸, BOSS战时，使用螳螂妖焦油桶时，丢向BOSS，不要丢在坦克的脚下，其他人注意躲好冲刺打击，千仞时近战远离BOSS。"},
		{name = "将军帕瓦拉克", raiders = "注意躲好BOSS的利刃冲锋和空中的工程炸药，BOSS壁垒时，坦克拉好援军小怪，其他人全力打破壁垒，玩家可以在工程炸弹爆炸之前将其丢向BOSS或者小怪。"},
		{name = "翼虫领袖尼诺洛克", raiders = "躲开地上的粘稠沥青，中了加热的树脂的可以通过跳跃抵消，BOSS施放尘风时，使用快速移动技能到桥的另外一边，打断它。" },
	},
	["残阳关"] = {
		{name = "吉普提拉克", raiders = "注意永远不要和稳定的军火站一条线上。"},
		{name = "加杜卡", raiders = "躲开地上的火焰（扫射），躲开地上的酸液炸弹，治疗和DPS注意跟着坦克集中。"},
		{name = "瑞魔克", raiders = "躲开地上的流毒物质，在BOSS施放狂乱攻击的时候，不要站在BOSS正面。"},
		{name = "菜公", raiders = "P1,坦克拉好小怪，DPS在BOSS撞墙之前跳上边上的炮台，跳到BOSS头部，攻击BOSS的弱点，注意撞墙之前一定要下来. P2，点名风筝，RUSH BOSS。"},
	},
	["血色大厅"] = {
		{name = "驯犬者布兰恩", raiders = "远程注意分散站位，坦克拉好召唤出来的狗。"},
		{name = "武器大师哈兰", raiders = "坦克将BOSS背对人群，拉好召唤的小怪，BOSS跳到场中间施放光明之刃时，注意远离。"},
		{name = "织焰者孔格勒", raiders = "躲开焚烧书籍的火焰，BOSS施放巨龙之息的时，绕着BOSS躲开巨龙之息，打断BOSS的好连珠火球和炎爆术。"},
	},
	["血色修道院"] = {
		{name = "裂魂者萨尔诺斯", raiders = "注意打断灵魂强风，如果没打断，注意躲开，坦克拉好小怪，迅速A掉" },
		{name = "科洛夫修士", raiders = "躲好正面的炙炎拳，火焰风暴踢时近战让开，躲好地上的火焰（炙灼之土）。"},
		{name = "指挥官杜兰德", raiders = "打断技能，先杀奶妈"},
		{name = "怀特迈恩", raiders = "P1，躲好冲刺打击。P2，优先打断怀特迈恩的技能，击杀怀特迈恩。"},
	},
	["通灵学院"] = {
		{name = "指导者寒心", raiders = "第一阶段，在冰墙合拢之前击杀BOSS，不要碰到冰墙，远程分散站开，第二阶段，全力击杀护命匣，远程分散站开"},
		{name = "詹迪斯•巴罗夫", raiders = "坦克将BOSS背对人群，施放奇能迅击时，远离BOSS正面，BOSS施放扭曲幻象时，迅速击杀分身，寻找真身，找到后坦克迅速接住BOSS"},
		{name = "血骨傀儡", raiders = "躲开灵魂烈焰，玩家可以找到骨堆，点击骨堆获得骨甲术效果，坦克在BOSS生锈效果达到10层以上时，风筝BOSS，直到生锈效果消失"},
		{name = "莉莉安•沃斯", raiders = "P1，远程分散站位，BOSS施放死亡之握之后，注意分散跑起来，直到黯焰效果结束。P2，被凝视的玩家远离BOSS，如果BOSS击中玩家施放黯焰，其他人保持移动，躲开黯焰。" },
		{name = "黑暗院长加丁", raiders = "坦克注意拉好小怪，被传送到书房的玩家，注意击杀小怪，然后出来。"},
	},
	["影踪禅院"] = {
		{name = "古•穿云", raiders = "P1注意躲开地上的“静电力场”，P2直接去打天上的龙，中了“磁力帷幕”，治疗直接刷爆。P3直接开大技能rush掉"},
		{name = "雪流大师", raiders = "P1坦克和近战注意躲避“怒雷破”，BOSS施放此技能时不会移动。P2打掉两个假身，然后对真身输出"},
		{name = "狂之煞", raiders = "很简单的一个BOSS，当治疗被冲撞后，注意开技能保命。"},
		{name = "祝踏岚", raiders = "控制好仇恨值，解决好蚀心之怨，应该就能比较顺利的解决Boss了"},
	},
	["青龙寺"] = {
		{name = "贤者马里", raiders = "别长时间停留在堕落之水中。第一阶段优先击杀腐化之水，并躲开腐化之水留下来的残渣。第二阶段在躲避BOSS的喷涌的同时进行输出。"},
		{name = "争吵与危殆", raiders = "如果碰到的是野牛人的考验，当其中的一个BOSS的buff叠加到10层后，迅速切换目标攻击另一个BOSS。"},
		{name = "太阳", raiders = "如果是射日勇士，击杀天上的太阳，然后干掉boss。"},
		{name = "刘·焰心", raiders = "远程职业注意躲避红色和青色的火焰波。BOSS的血量到30%后就会召唤玉龙，这时注意躲避地上的火焰，然后迅速击杀玉龙即可。"},
		{name = "疑之煞", raiders = "BOSS施放“虚无之触”后，DPS优先击杀治疗的臆像，然后逐个干掉剩下的臆像。臆像不能被嘲讽，所以不要乱跑，尽可能快的杀掉臆像。"},
	},
	["风暴烈酒酿造厂"] = {
		{name = "乌克乌克", raiders = "BOSS的血量很高，正常输出要打很久。所以每次酒桶一出现，DPS一定要使用酒桶去撞击BOSS，每撞击一次能让BOSS受到的伤害提高10%，效果可以叠加。撞击10次左右基本就能完成击杀。"},
		{name = "跳跳大王", raiders = "boss旋转和喷吐胡萝卜的时候，所有人都注意躲开。当出现跳舞兔后，DPS优先将它杀掉，然后拾取掉在地上的大棒槌，使用特殊技能迅速干掉周围的小怪。"},
		{name = "破桶而出的炎诛", raiders = "中了“膨胀”debuff的玩家，注意转动方向，保证自己的左右两边没有队友。召唤出小怪后，迅速击杀掉，不然会恢复boss的血量。Boss施放“碳酸饱和”后，迅速点击周围的水泡，漂浮到上空继续输出。如果留在地面的话，你将无法施放任何技能。"},
	},
}

SLASH_BOSS1 = "/boss"
SLASH_BOSS2 = "/BOSS"
SlashCmdList["BOSS"] = function(input)
	local bossname = UnitName("target")
	if bossname == nil then
		DEFAULT_CHAT_FRAME:AddMessage("请选中BOSS为你的目标",1,0,0)
		return
	end
	for k, v in pairs(BossData) do
		for i, info in ipairs(v) do
			if(type(info.raiders)=="string") then
				if bossname == info.name then
					if UnitInRaid("player") then
						SendChatMessage(info.raiders, "RAID");
					else
						SendChatMessage(info.raiders, "PARTY");
					end
					return;
				end
			end
		end
	end
	DEFAULT_CHAT_FRAME:AddMessage("无此BOSS数据",1,0,0);
end