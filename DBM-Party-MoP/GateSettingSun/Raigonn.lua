﻿local mod	= DBM:NewMod(649, "DBM-Party-MoP", 4, 303)
local L		= mod:GetLocalizedStrings()
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 7834 $"):sub(12, -3))
mod:SetCreatureID(56877)
mod:SetModelID(39519)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"RAID_BOSS_EMOTE",
	"SPELL_CAST_START"
)

local warnHeadbutt				= mod:NewSpellAnnounce(111668, 2)
local warnScreechingSwarm		= mod:NewTargetAnnounce(111600, 4, nil, false)--Can be spam if adds not die.
local warnBrokenCarapace		= mod:NewSpellAnnounce(107146, 2)--Phase 2
local warnFixate				= mod:NewTargetAnnounce(111723, 4)
local warnStomp					= mod:NewCountAnnounce(111728, 3)

local specWarnScreechingSwarm	= mod:NewSpecialWarningDispel(111600, false)--Can be spam if adds not die.
local specWarnBrokenCarapace	= mod:NewSpecialWarningSpell(107146, mod:IsDps())
local specWarnWD				= mod:NewSpecialWarningMove(107279)

local timerHeadbuttCD			= mod:NewNextTimer(33, 111668)
local timerScreechingSwarm		= mod:NewTargetTimer(10, 111600)
local timerFixate				= mod:NewTargetTimer(15, 111723)
local timerFixateCD				= mod:NewNextTimer(20.5, 111723)
local timerStompCD				= mod:NewNextCountTimer(20.5, 111728)

local stompCount = 0

function mod:OnCombatStart(delay)
	stompCount = 0
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(107146) then
		warnBrokenCarapace:Show()
		specWarnBrokenCarapace:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\shieldover.mp3")--快打 護盾結束
		timerHeadbuttCD:Cancel()
		timerFixateCD:Start(5.5)--Timing for target pick, not cast start.
		timerStompCD:Start(20.5, 1)
	elseif args:IsSpellID(111723) then
		warnFixate:Show(args.destName)
		timerFixate:Start(args.destName)
		timerFixateCD:Start()
		if args:IsPlayer() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\justrun.mp3")--快跑
		end
	elseif args:IsSpellID(111600) then
		warnScreechingSwarm:Show(args.destName)
		specWarnScreechingSwarm:Show(args.destName)
		if mod:IsHealer() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\dispelnow.mp3")--快驅散
		end
		timerScreechingSwarm:Start(args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(111723) and args:IsPlayer() then
		timerFixate:Cancel(args.destName)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\targetchange.mp3")--目標改變
	elseif args:IsSpellID(111600) then
		timerScreechingSwarm:Cancel(args.destname)
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(111668) then
		warnHeadbutt:Show()
		timerHeadbuttCD:Start()
	elseif args:IsSpellID(111728) then
		stompCount = stompCount + 1
		warnStomp:Show(stompCount)
		timerStompCD:Start(20.5, stompCount+1)
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 107279 and destGUID == UnitGUID("player") and self:AntiSpam() then
		specWarnWD:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runaway.mp3")--快躲開
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:RAID_BOSS_EMOTE(msg)
	if msg == L.Kkxka or msg:find(L.Kkxka) or msg == L.Kkxkb or msg:find(L.Kkxkb) or msg == L.Kkxkc or msg:find(L.Kkxkc) then
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\mobsoon.mp3")--準備小怪
	end
end