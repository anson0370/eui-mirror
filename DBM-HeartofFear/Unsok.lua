﻿local mod	= DBM:NewMod(737, "DBM-HeartofFear", nil, 330)
local L		= mod:GetLocalizedStrings()
local sndWOP	= mod:NewSound(nil, "SoundWOP", true)

mod:SetRevision(("$Revision: 8027 $"):sub(12, -3))
mod:SetCreatureID(62511)
mod:SetModelID(43126)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"UNIT_POWER"
)

--[[WoL Reg Expression
(spellid = 45477 or spellid = 122540 or spellid = 122532 or spellid = 122348) and fulltype = SPELL_CAST_SUCCESS or (spellid =122784 or spellid =121949 or spellid = 122395 or spellid = 121994) and fulltype = SPELL_AURA_APPLIED or (spellid =122370 or spellid = 122540 or spellid = 122395 or spellid = 121994) and fulltype = SPELL_AURA_REMOVED or (spellid = 122408 or spellid = 122413 or spellid = 122398 or spellid = 122540 or spellid = 122402) and fulltype = SPELL_CAST_START or fulltype = UNIT_DIED and (targetname = "Omegal" or targetname = "Shiramune")
(spellid = 45477 or spellid = 122540) and fulltype = SPELL_CAST_SUCCESS or (spellid =122784 or spellid =121949 or spellid = 122395 or spellid = 121994) and fulltype = SPELL_AURA_APPLIED or (spellid =122370 or spellid = 122540 or spellid = 122395 or spellid = 121994) and fulltype = SPELL_AURA_REMOVED or (spellid = 122408 or spellid = 122413 or spellid = 122398 or spellid = 122540 or spellid = 122402) and fulltype = SPELL_CAST_START or fulltype = UNIT_DIED and (targetname = "Omegal" or targetname = "Shiramune")
--]]
--Boss
local warnReshapeLife			= mod:NewTargetAnnounce(122784, 4)
local warnAmberScalpel			= mod:NewSpellAnnounce(121994, 3)
local warnParasiticGrowth		= mod:NewTargetAnnounce(121949, 4, nil, mod:IsHealer())
--Construct
local warnAmberExplosion		= mod:NewAnnounce("warnAmberExplosion", 3, 122398, false)--In case you want to get warned for all of them, but could be spammy later fight so off by default. This announce includes source of cast.
local warnStruggleForControl	= mod:NewTargetAnnounce(122395, 2)--Disabled in phase 3 as at that point it's just a burn.
local warnDestabalize			= mod:NewStackAnnounce(123059, 1, nil, false)--This can be super spammy so off by default.
--Living Amber
local warnLivingAmber			= mod:NewSpellAnnounce("ej6261", 2, nil, false)--122348 is what you check spawns with. ALso spamming and off by default
local warnBurningAmber			= mod:NewCountAnnounce("ej6567", 2, nil, false)--Keep track of Burning Amber Puddles. Spammy, but nessesary for heroic for someone managing them.
--Amber Monstrosity
local warnAmberCarapace			= mod:NewTargetAnnounce(122540, 4)--Monstrosity Shielding Boss (phase 2 start)
local warnMassiveStomp			= mod:NewCastAnnounce(122408, 3)
local warnAmberExplosionSoon	= mod:NewPreWarnAnnounce(122402, 10, 3)
local warnFling					= mod:NewSpellAnnounce(122413, 3)--think this always does his aggro target but not sure. If it does random targets it will need target scanning.
local warnInterruptsAvailable	= mod:NewAnnounce("warnInterruptsAvailable", 1, 122398)

--Boss
local specwarnAmberScalpel		= mod:NewSpecialWarningSpell(121994, nil, nil, nil, true)
local specwarnReshape			= mod:NewSpecialWarningYou(122784)
local specwarnParasiticGrowth	= mod:NewSpecialWarningTarget(121949, mod:IsHealer())
--Construct
local specwarnAmberExplosionYou		= mod:NewSpecialWarning("specwarnAmberExplosionYou")--Only interruptable by the player controling construct casting, so only that person gets warning. non generic used to make this one more specific.
local specwarnAmberExplosionOther	= mod:NewSpecialWarningInterrupt(122398)--Ones you can interrupt.
local specwarnAmberExplosion		= mod:NewSpecialWarningTarget(122398, nil, nil, nil, true)--One you can't interrupt it
local specwarnWillPower				= mod:NewSpecialWarning("specwarnWillPower")--Special warning for when your will power is low (construct)
--local specwarnBossDebuff			= mod:NewSpecialWarning("specwarnBossDebuff")--Some special warning that says "get your ass to boss and refresh debuff NOW" (Debuff stacks up to 255 with 10% damage taken increase every stack, keeping buff up and stacking is paramount to dps check on heroic)
--Living Amber
local specwarnBurningAmber		= mod:NewSpecialWarningMove(122504)--Standing in a puddle
local specwarnScalpel			= mod:NewSpecialWarningMove(121995)
local specwarnScalpelAmber		= mod:NewSpecialWarningMove(122005)
--Amber Monstrosity
local specwarnAmberMonstrosity	= mod:NewSpecialWarningSwitch("ej6254", not mod:IsHealer())
local specwarnMassiveStomp		= mod:NewSpecialWarningSpell(122408, nil, nil, nil, true)

--Boss
local timerReshapeLifeCD		= mod:NewNextTimer(50, 122784)--50 second cd in phase 1-2, 15 second in phase 3. if no construct is up, cd is ignored and boss casts it anyways to make sure 1 is always up.
local timerAmberScalpelCD		= mod:NewCDTimer(40, 121994)--40 seconds after last one ENDED
local timerAmberScalpel			= mod:NewBuffActiveTimer(10, 121994)
local timerParasiticGrowthCD	= mod:NewCDTimer(35, 121949, nil, mod:IsHealer())--35-50 variation (most of the time 50, rare pulls he decides to use 35 sec cd instead)
local timerParasiticGrowth		= mod:NewTargetTimer(30, 121949, nil, mod:IsHealer())
--Construct
local timerAmberExplosionCD		= mod:NewNextSourceTimer(13, 122398)--13 second cd on player controled units, 18 seconds on non player controlled constructs
local timerDestabalize			= mod:NewTargetTimer(10, 123059)
local timerStruggleForControl	= mod:NewTargetTimer(5, 122395)
--Amber Monstrosity
local timerMassiveStompCD		= mod:NewCDTimer(18, 122540)--18-25 seconds variation
local timerFlingCD				= mod:NewCDTimer(25, 122413)--25-40sec variation.
local timerAmberExplosionAMCD	= mod:NewTimer(49, "timerAmberExplosionAMCD", 122402)--Special timer just for amber monstrosity. easier to cancel, easier to tell apart. His bar is the MOST important and needs to be seperate from any other bar option.

mod:AddBoolOption("InfoFrame", false)--Needs more work.

local Phase = 1
local Puddles = 0
local Constructs = 0
local playerIsConstruct = false
local lastStrike = 0
local Monstrosity = EJ_GetSectionInfo(6254)
local MutatedConstruct = EJ_GetSectionInfo(6249)
local canInterrupt = {}
local guids = {}
local guidTableBuilt = false--Entirely for DCs, so we don't need to reset between pulls cause it doesn't effect building table on combat start and after a DC then it will be reset to false always
local function buildGuidTable()
	table.wipe(guids)
	for i = 1, DBM:GetGroupMembers() do
		guids[UnitGUID("raid"..i) or "none"] = GetRaidRosterInfo(i)
	end
end

function mod:OnCombatStart(delay)
	buildGuidTable()
	Phase = 1
	Puddles = 0
	Constructs = 0
	lastStrike = 0
	table.wipe(canInterrupt)
	playerIsConstruct = false
	timerAmberScalpelCD:Start(9-delay)
	timerReshapeLifeCD:Start(20-delay)
	timerParasiticGrowthCD:Start(23.5-delay)
	if self.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(L.WillPower)--This is a work in progress
		DBM.InfoFrame:Show(10, "playerpower", 1, ALTERNATE_POWER_INDEX)--At a point i need to add an arg that lets info frame show the 5 LOWEST not the 5 highest, instead of just showing 10
	end
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end 

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(123059) and not args:GetDestCreatureID() == 62691 then--Only track debuffs on boss, constructs, or monstrosity, ignore oozes.
		warnDestabalize:Show(args.destName, args.amount or 1)
		timerDestabalize:Start(args.destName)
	elseif args:IsSpellID(121949) then
		warnParasiticGrowth:Show(args.destName)
		specwarnParasiticGrowth:Show(args.destName)
		timerParasiticGrowth:Start(args.destName)
		timerParasiticGrowthCD:Start()
		if mod:IsHealer() then
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_jscz.mp3") --寄生成長
		end
	elseif args:IsSpellID(122540) then
		Phase = 2
		warnAmberCarapace:Show(args.destName)
		specwarnAmberMonstrosity:Show()
		timerMassiveStompCD:Start(20)
		timerFlingCD:Start(33)
		warnAmberExplosionSoon:Schedule(45.5)
		timerAmberExplosionAMCD:Start(55.5)
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ptwo.mp3")--P2
	elseif args:IsSpellID(122395) and Phase < 3 then
		warnStruggleForControl:Show(args.destName)
		timerStruggleForControl:Start(args.destName)
	elseif args:IsSpellID(122784) then
		Constructs = Constructs + 1
		warnReshapeLife:Show(args.destName)
		if args:IsPlayer() then
			playerIsConstruct = true
			specwarnReshape:Show()
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_nbzh.mp3") --你被轉化
		end
		if Phase < 3 then
			timerReshapeLifeCD:Start()
		else
			timerReshapeLifeCD:Start(15)--More often in phase 3
		end
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(122754) then
		timerDestabalize:Cancel(args.destName)
	elseif args:IsSpellID(122784) then
		Constructs = Constructs - 1
		if args:IsPlayer() then
			playerIsConstruct = false
		end
	elseif args:IsSpellID(121994) then
		timerAmberScalpelCD:Start()
	elseif args:IsSpellID(121949) then
		timerParasiticGrowth:Cancel(args.destName)
	elseif args:IsSpellID(122540) then--Phase 3
		Phase = 3
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\pthree.mp3")--p3
		timerMassiveStompCD:Cancel()
		timerFlingCD:Cancel()
		timerAmberExplosionAMCD:Cancel()
		warnAmberExplosionSoon:Cancel()
		--He does NOT reset reshape live cd here, he finishes outlast CD first, THEN starts using new one.
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(122398) then --琥珀小怪
		warnAmberExplosion:Show(args.sourceName, args.spellName)
		if args:GetSrcCreatureID() == 62701 then--Cast by a wild construct not controlled by player
			if playerIsConstruct then--Player is construct
				if GetTime() - lastStrike >= 4 then--Check if Amber Strike will be available before cast ends.
					specwarnAmberExplosionOther:Show(args.sourceName)--Only give interrupt warning if you are capable of doing it.
					sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\kickcast.mp3") --快打斷
					if self:LatencyCheck() then--if you're too laggy we don't want you telling us you can interrupt it 2-3 seconds from now. we only care if you can interrupt it NOW
						self:SendSync("InterruptAvailable", UnitGUID("player"), 122398)
					end
				end
			end
			if Constructs == 0 then--No constructs, thus no interrupt. Give a beware warning.
				specwarnAmberExplosion:Show(args.sourceName)
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_hpbz.mp3") --琥珀爆炸
			end
			timerAmberExplosionCD:Start(18, args.sourceName, args.sourceGUID)--Longer CD if it's a non player controlled construct. Everyone needs to see this bar because there is no way to interrupt these.
		elseif args.sourceGUID == UnitGUID("player") then--Cast by YOU
			specwarnAmberExplosionYou:Show(args.spellName)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\stopcast.mp3") --停止施法
			timerAmberExplosionCD:Start(13, args.sourceName)--Only player needs to see this, they are only person who can do anything about it.
		end
	elseif args:IsSpellID(122402) then --琥珀巨怪
		warnAmberExplosion:Show(args.sourceName, args.spellName)
		if playerIsConstruct then--Player is construct
			if GetTime() - lastStrike >= 4 then--Check if Amber Strike will be available before cast ends.
				specwarnAmberExplosionOther:Show(args.sourceName)--Only give interrupt warning if you are capable of doing it.
				sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\kickcast.mp3") --快打斷
				if self:LatencyCheck() then--if you're too laggy we don't want you telling us you can interrupt it 2-3 seconds from now. we only care if you can interrupt it NOW
					self:SendSync("InterruptAvailable", UnitGUID("player"), 122402)
				end
			end
		end
		if Constructs == 0 then--No constructs, thus no interrupt. Give a beware warning.
			specwarnAmberExplosion:Show(args.sourceName)
			sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_jgbz.mp3") --巨怪爆炸
		end
		warnAmberExplosionSoon:Cancel()
		warnAmberExplosionSoon:Schedule(39)
		timerAmberExplosionAMCD:Start(49, args.sourceName, args.sourceGUID)
	elseif args:IsSpellID(122408) then
		warnMassiveStomp:Show()
		specwarnMassiveStomp:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\stompsoon.mp3") --準備踐踏
		timerMassiveStompCD:Start()
	elseif args:IsSpellID(122413) then
		warnFling:Show()
		timerFlingCD:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(122348) then
		warnLivingAmber:Show()
	elseif args:IsSpellID(121994) then
		warnAmberScalpel:Show()
		specwarnAmberScalpel:Show()
	elseif args:IsSpellID(122532) then
		Puddles = Puddles + 1
		warnBurningAmber:Show(Puddles)
	elseif args:IsSpellID(123156) then
		Puddles = Puddles - 1
		warnBurningAmber:Show(Puddles)
	elseif args:IsSpellID(122389) and args.sourceGUID == UnitGUID("player") then--Amber Strike
		lastStrike = GetTime()
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 122504 and destGUID == UnitGUID("player") and self:AntiSpam(3, 1) then
		specwarnBurningAmber:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runaway.mp3") --快躲開
	elseif spellId == 121995 and destGUID == UnitGUID("player") and self:AntiSpam(3, 2) then
		specwarnScalpel:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runaway.mp3")
	elseif spellId == 122005 and destGUID == UnitGUID("player") and self:AntiSpam(3, 2) then
		specwarnScalpelAmber:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\runaway.mp3")
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:UNIT_POWER(uId)
	if uId ~= "player" then return end
	if UnitPower(uId, ALTERNATE_POWER_INDEX) < 28 and not warnedWill then
		warnedWill = true
		specwarnWillPower:Show()
		sndWOP:Play("Interface\\AddOns\\DBM-Core\\extrasounds\\ex_mop_yzgd.mp3") --意志過低
	elseif UnitPower(uId, ALTERNATE_POWER_INDEX) >= 32 and warnedWill then
		warnedWill = false
	end
end

local function warnAmberExplosionCast(SpellId)
	if #canInterrupt == 0 then--No interupts, warn the raid to prep for aoe damage with beware! alert.
		if SpellId == 122402 then
			specwarnAmberExplosion:Show(Monstrosity)
		else
			specwarnAmberExplosion:Show(MutatedConstruct)
		end
	else--Interrupts available, lets call em out as a great tool to give raid leader split second decisions on who to allocate to the task (so they don't all waste it on same target and not have for next one).
		if SpellId == 122402 then
			warnInterruptsAvailable:Show(Monstrosity, table.concat(canInterrupt, "<, >"))
		else
			warnInterruptsAvailable:Show(MutatedConstruct, table.concat(canInterrupt, "<, >"))
		end
	end
	table.wipe(canInterrupt)
end

function mod:OnSync(msg, guid, SpellId)
	if not guidTableBuilt then
		buildGuidTable()
		guidTableBuilt = true
	end
	if msg == "InterruptAvailable" and guids[guid] and SpellId then
		canInterrupt[#canInterrupt + 1] = guids[guid]
		self:Unschedule(warnAmberExplosionCast)
		self:Schedule(0.3, warnAmberExplosionCast, SpellId)
	end
end
