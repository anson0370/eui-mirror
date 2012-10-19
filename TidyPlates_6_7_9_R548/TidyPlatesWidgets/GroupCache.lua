
--Group Roster Monitor
		
local Group = {}
Group.Names = {}
Group.Tanks = {}
Group.Class = {}
Group.Role = {}
Group.UnitId = {}
Group.GUID = {}
Group.Type = "solo"
Group.Size = 1
	
local function IsUnitTank(unitId)
	if GetPartyAssignment("MAINTANK", unitId) or ("TANK" == UnitGroupRolesAssigned(unitId)) then return true end
end

local function UpdateRoster(frame, event, ...)
	-- Queue Update
	TidyPlates:Update()
	
	-- Clear Cache
	wipe(Group.Names)
	wipe(Group.Tanks)
	wipe(Group.Class)
	wipe(Group.Role)
	wipe(Group.UnitId)
	wipe(Group.GUID)
	
	-- Check Group Type
	local groupType, groupSize, unitId, unitName
	if UnitInRaid("player") then 
		groupType = "raid"
		groupSize = TidyPlatesUtility.GetNumRaidMembers() - 1
	elseif UnitInParty("player") then 
		groupType = "party"
		groupSize = TidyPlatesUtility.GetNumPartyMembers() - 1 		--  Add a, '- 1'  ?
	else 
		Group.Type = "solo"
		Group.Size = 1
		return
	end

	Group.Type = groupType
	Group.Size = groupSize
	
	-- Cycle through Group
	if groupType then
		for index = 1, groupSize do
			unitId = groupType..index	
			unitName = UnitName(unitId)
			if unitName then
				Group.Names[unitId] = unitName
				Group.Class[unitName] = select(2,UnitClass(unitId))
				Group.Tanks[unitName] = IsUnitTank(unitId)
				Group.Role[unitName] = UnitGroupRolesAssigned(unitId)
				Group.UnitId[unitName] = unitId
				Group.GUID[UnitGUID(unitId)] = unitId
			end
		end
	end
end

local function Enable()
	if not RosterMonitor then RosterMonitor = CreateFrame("Frame") end
	RosterMonitor:RegisterEvent("GROUP_ROSTER_UPDATE")
	RosterMonitor:RegisterEvent("PARTY_CONVERTED_TO_RAID")
	RosterMonitor:RegisterEvent("PLAYER_ENTERING_WORLD")
	RosterMonitor:SetScript("OnEvent", UpdateRoster)

	UpdateRoster()
end

local function Disable() 
	if RosterMonitor then
		RosterMonitor:SetScript("OnEvent", nil)
		RosterMonitor:UnregisterAllEvents()
		RosterMonitor = nil
		
		wipe(Group.Names)
		wipe(Group.Tanks)
		wipe(Group.Class)
		wipe(Group.Role)
		wipe(Group.UnitId)

		Group.Type = nil
		Group.Size = nil
	end
end

TidyPlatesUtility.GroupMembers = Group
TidyPlatesUtility.EnableGroupWatcher = Enable
TidyPlatesUtility.DisableGroupWatcher = Disable
