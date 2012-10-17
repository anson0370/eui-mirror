local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local TOTEMS = E:NewModule('Totems', 'AceEvent-3.0');

E.TotemBar = TOTEMS

function TOTEMS:Update(event)
	local displayedTotems = 0
	for i=1, MAX_TOTEMS do
		local haveTotem, name, startTime, duration, icon = GetTotemInfo(i);
		if haveTotem and icon and icon ~= '' then
			self.bar[i]:Show()
			self.bar[i].iconTexture:SetTexture(icon)
			displayedTotems = displayedTotems + 1
			CooldownFrame_SetTimer(self.bar[i].cooldown, startTime, duration, 1)
		else
			self.bar[i]:Hide()
		end
	end
end

function TOTEMS:ToggleEnable()
	if self.db.enable then
		self.bar:Show()
		self:RegisterEvent('PLAYER_TOTEM_UPDATE', 'Update')
		self:RegisterEvent('PLAYER_ENTERING_WORLD', 'Update')
		self:Update()
	else
		self.bar:Hide()
		self:UnregisterEvent('PLAYER_TOTEM_UPDATE')
		self:UnregisterEvent('PLAYER_ENTERING_WORLD')
	end
end

function TOTEMS:PositionAndSize()
	for i=1, MAX_TOTEMS do
		local button = self.bar[i]
		local prevButton = self.bar[i-1]
		button:Size(self.db.size)
		button:ClearAllPoints()
		if self.db.growthDirection == 'HORIZONTAL' and self.db.sortDirection == 'ASCENDING' then
			if i == 1 then
				button:SetPoint('LEFT', self.bar, 'LEFT', self.db.spacing, 0)
			elseif prevButton then
				button:SetPoint('LEFT', prevButton, 'RIGHT', self.db.spacing, 0)
			end
		elseif self.db.growthDirection == 'VERTICAL' and self.db.sortDirection == 'ASCENDING' then
			if i == 1 then
				button:SetPoint('TOP', self.bar, 'TOP', 0, -self.db.spacing)
			elseif prevButton then
				button:SetPoint('TOP', prevButton, 'BOTTOM', 0, -self.db.spacing)
			end		
		elseif self.db.growthDirection == 'HORIZONTAL' and self.db.sortDirection == 'DESCENDING' then	
			if i == 1 then
				button:SetPoint('RIGHT', self.bar, 'RIGHT', -self.db.spacing, 0)
			elseif prevButton then
				button:SetPoint('RIGHT', prevButton, 'LEFT', -self.db.spacing, 0)
			end		
		else
			if i == 1 then
				button:SetPoint('BOTTOM', self.bar, 'BOTTOM', 0, self.db.spacing)
			elseif prevButton then
				button:SetPoint('BOTTOM', prevButton, 'TOP', 0, self.db.spacing)
			end			
		end
	end

	if self.db.growthDirection == 'HORIZONTAL' then
		self.bar:Width(self.db.size*(MAX_TOTEMS) + self.db.spacing*(MAX_TOTEMS) + self.db.spacing)
		self.bar:Height(self.db.size + self.db.spacing*2)	
	else
		self.bar:Height(self.db.size*(MAX_TOTEMS) + self.db.spacing*(MAX_TOTEMS) + self.db.spacing)
		self.bar:Width(self.db.size + self.db.spacing*2)		
	end
	self:Update()
end

function TOTEMS:OnClick()
	DestroyTotem(self:GetID());
end

function TOTEMS:OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
	GameTooltip:SetTotem(self:GetID());
end

function TOTEMS:OnLeave()
	GameTooltip:Hide()
end

function TOTEMS:Initialize()
	self.db = E.db.general.totems
	
	local bar = CreateFrame('Frame', 'ElvUI_TotemBar', E.UIParent)
	bar = CreateFrame('Frame', 'ElvUI_TotemBar', E.UIParent)
	bar:SetPoint('TOPLEFT', LeftChatPanel, 'TOPRIGHT', 4, 0)
	self.bar = bar;
	
	for i=1, MAX_TOTEMS do
		local frame = CreateFrame('Button', bar:GetName()..'Totem'..i, bar)
		frame:SetID(i)
		frame:SetTemplate('Default')
		frame:StyleButton()
		frame:Hide()
		frame:RegisterForClicks('RightButtonUp')
		frame:SetScript('OnClick', self.OnClick)
		frame:SetScript('OnEnter', self.OnEnter)
		frame:SetScript('OnLeave', self.OnLeave)
		
		frame.iconTexture = frame:CreateTexture(nil, 'ARTWORK')
		frame.iconTexture:SetInside()
		frame.iconTexture:SetTexCoord(unpack(E.TexCoords))
		
		frame.cooldown = CreateFrame('Cooldown', frame:GetName()..'Cooldown', frame, 'CooldownFrameTemplate')
		frame.cooldown:SetReverse(true)
		frame.cooldown:SetInside()
		self.bar[i] = frame;
	end
	
	self:ToggleEnable()
	self:PositionAndSize()

	E:CreateMover(bar, 'TotemBarMover', L['Totems']);
end

E:RegisterModule(TOTEMS:GetName())