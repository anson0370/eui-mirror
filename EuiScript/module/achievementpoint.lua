local E, L, DF = unpack(ElvUI) -- Import Functions/Constants, Config, Locales

if E.db["tooltip"].achievementpoint then 
	local Needy = CreateFrame('Frame', 'Needy', UIParent)
	if GetLocale() == 'zhCN' then
		Needy.str1 = '成就点数'
		Needy.str2 = '正在查询成就'
	elseif GetLocale() == 'zhTW' then
		Needy.str1 = '成就點數'
		Needy.str2 = '正在查詢成就'
	else
		Needy.str1 = 'Achievement Point'
		Needy.str2 = 'Achievement is inquiry'
	end
	
	Needy:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)
	Needy:RegisterEvent('MODIFIER_STATE_CHANGED')

	if TinyTip then
		TinyTip.HookOnTooltipSetUnit(GameTooltip, Needy.UPDATE_MOUSEOVER_UNIT)
	else
		Needy:RegisterEvent('UPDATE_MOUSEOVER_UNIT')
	end

	function Needy:INSPECT_ACHIEVEMENT_READY()
		self:UnregisterEvent('INSPECT_ACHIEVEMENT_READY')
		self.line:SetText()

		if GameTooltip:GetUnit() == self.unit then
			local stats, text = {}, ''

			stats.TotalAchievemen = tonumber(GetComparisonAchievementPoints()) or 0
				text = text .. '|cFFF1C502'.. self.str1.. ':  |cff1784d1' .. stats.TotalAchievemen

			if text ~= '' then
				self.line:SetText(text)
			end
		end

		GameTooltip:Show()

		if not UnitName('mouseover') then
			GameTooltip:FadeOut()
		end

		ClearAchievementComparisonUnit()

		if _G.GearScore then
			_G.GearScore:RegisterEvent('INSPECT_ACHIEVEMENT_READY')
		end

		if Elite then
			Elite:RegisterEvent('INSPECT_ACHIEVEMENT_READY')
		end

		if AchievementFrameComparison then
			AchievementFrameComparison:RegisterEvent('INSPECT_ACHIEVEMENT_READY')
		end

		self:RegisterEvent('UPDATE_MOUSEOVER_UNIT')
	end

	function Needy:MODIFIER_STATE_CHANGED()
		if arg1 == 'LCTRL' or arg1 == 'RCTRL' then
			if self.line and UnitName('mouseover') == self.unit then
				self:UPDATE_MOUSEOVER_UNIT(true)
			end
		end
	end

	function Needy:UPDATE_MOUSEOVER_UNIT(refresh)
		if not refresh then
			self.unit, self.line = nil, nil
		end

		if (UnitAffectingCombat('player')) or UnitIsDead('player') or not UnitExists('mouseover')
		or not UnitIsPlayer('mouseover') or not UnitIsConnected('mouseover') or UnitIsDead('mouseover') then
			return
		end

		self.unit = UnitName('mouseover')

		local text = '\n' .. self.str2.. '..'

		if refresh then
			self.line:SetText(text)
		else
			GameTooltip:AddLine(text)
			self.line = _G['GameTooltipTextLeft' .. GameTooltip:NumLines()]
		end

		GameTooltip:Show()

		if _G.GearScore then
			_G.GearScore:UnregisterEvent('INSPECT_ACHIEVEMENT_READY')
		end

		if Elite then
			Elite:UnregisterEvent('INSPECT_ACHIEVEMENT_READY')
		end

		if AchievementFrameComparison then
			AchievementFrameComparison:UnregisterEvent('INSPECT_ACHIEVEMENT_READY')
		end

		self:UnregisterEvent('UPDATE_MOUSEOVER_UNIT')
		self:RegisterEvent('INSPECT_ACHIEVEMENT_READY')

		SetAchievementComparisonUnit('mouseover')
	end
end