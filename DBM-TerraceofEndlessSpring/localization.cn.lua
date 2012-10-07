﻿if GetLocale() ~= "zhCN" then return end
local L

------------
-- Protectors of the Endless --
------------
L= DBM:GetModLocalization(683)

L:SetOptionLocalization({
	RangeFrame			= "距离监视(8码)：$spell:111850(智能)",
	HudMAP				= "高级定位监视(HUD)：$spell:111850的位置",
	SetIconOnPrison		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(117436),
	SoundDW				= "语音警告：$spell:117283的驱散",
	SoundWOP			= "语音警告：重要技能"
})


------------
-- Tsulong --
------------
L= DBM:GetModLocalization(742)

L:SetOptionLocalization({
	SoundWOP					= "语音警告：重要技能",
	SoundJK						= "语音警告：$spell:123011的预先警告",
	HudMAP						= "高级定位监视(HUD)：$spell:122770的位置(仅10人准确)",
	optDS						= "\"恐怖阴影\"叠加几层时，开始报警",
	six							= "6层",
	nine						= "9层",
	twelve						= "12层",
	fifteen						= "15层",
	none						= "不报警",
})

L:SetMiscLocalization{
	Victory	= "谢谢你，陌生人。我重获自由了。"
}


-------------------------------
-- Lei Shi --
-------------------------------
L= DBM:GetModLocalization(729)

L:SetWarningLocalization({
	warnHideOver			= "%s 已结束"
})

L:SetTimerLocalization({
	timerSpecialCD			= "下一次特殊技能"
})

L:SetOptionLocalization({
	warnHideOver			= "警告：当$spell:123244结束时",
	timerSpecialCD			= "计时器：下一次特殊技能",
	SoundWOP				= "语音警告：重要技能"
})

L:SetMiscLocalization{
	Victory	= "我...啊..喔!我曾经...?我是不是...?这一切...都太...模糊了。"--wtb alternate and less crappy victory event.
}


----------------------
-- Sha of Fear --
----------------------
L= DBM:GetModLocalization(709)

L:SetOptionLocalization({
	SoundDD				= "语音警告：$spell:131996",
	SoundWOP			= "语音警告：重要技能"
})