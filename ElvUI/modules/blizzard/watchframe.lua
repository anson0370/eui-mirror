local E, L, DF = unpack(select(2, ...))
local B = E:GetModule('Blizzard');

local WatchFrameHolder = CreateFrame("Frame", "WatchFrameHolder", E.UIParent)
WatchFrameHolder:SetWidth(130)
WatchFrameHolder:SetHeight(22)
WatchFrameHolder:SetPoint('TOPRIGHT', E.UIParent, 'TOPRIGHT', -135, -300)

function B:MoveWatchFrame()
	E:CreateMover(WatchFrameHolder, 'WatchFrameMover', L['Watch Frame'])
	WatchFrameHolder:SetAllPoints(WatchFrameMover)

	
	WatchFrame:ClearAllPoints()
	WatchFrame:SetPoint('TOP', WatchFrameHolder, 'TOP')
	WatchFrame:Height(E.screenheight / 2)
	
	hooksecurefunc(WatchFrame,"SetPoint",function(_,_,parent)
		if parent ~= WatchFrameHolder then
			WatchFrame:ClearAllPoints()
			WatchFrame:SetPoint('TOP', WatchFrameHolder, 'TOP')
		end
	end)	
end

----------------------------------------------------------------------------------------
--	Difficulty color for watchframe lines
----------------------------------------------------------------------------------------
hooksecurefunc("WatchFrame_Update", function()
	local questIndex
	local numQuestWatches = GetNumQuestWatches()

	for i = 1, numQuestWatches do
		questIndex = GetQuestIndexForWatch(i)
		if questIndex then
			local title, level = GetQuestLogTitle(questIndex)
			local col = GetQuestDifficultyColor(level)

			for j = 1, #WATCHFRAME_QUESTLINES do
				WATCHFRAME_QUESTLINES[j].text:FontTemplate(nil, 14, nil)
				if WATCHFRAME_QUESTLINES[j].text:GetText() == title then
					WATCHFRAME_QUESTLINES[j].text:FontTemplate(nil, 17, nil)
					WATCHFRAME_QUESTLINES[j].text:SetTextColor(col.r, col.g, col.b)
					WATCHFRAME_QUESTLINES[j].col = col
				end
			end
		end
	end
end)

----------------------------------------------------------------------------------------
--	Auto collapse WatchFrame in instance
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
	if IsInInstance() then
		WatchFrame_CollapseExpandButton_OnClick(WatchFrame_CollapseExpandButton)
	elseif WatchFrame.collapsed and not InCombatLockdown() then
		WatchFrame_CollapseExpandButton_OnClick(WatchFrame_CollapseExpandButton)
	end
end)