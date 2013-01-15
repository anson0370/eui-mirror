local E, _, DF = unpack(ElvUI)
if E.db["euiscript"].chatmod ~= true then return end

function ChatEdit_CustomTabPressed(self) 
if strsub(tostring(self:GetText()), 1, 1) == "/" then return end 
   if  (self:GetAttribute("chatType") == "SAY")  then 
      if (GetNumSubgroupMembers()>0) then 
         self:SetAttribute("chatType", "PARTY"); 
         ChatEdit_UpdateHeader(self); 
      elseif (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance()) then 
         self:SetAttribute("chatType", "INSTANCE_CHAT"); 
         ChatEdit_UpdateHeader(self); 
      elseif (GetNumGroupMembers()>0 and IsInRaid()) then 
         self:SetAttribute("chatType", "RAID"); 
         ChatEdit_UpdateHeader(self); 
      elseif (IsInGuild()) then 
         self:SetAttribute("chatType", "GUILD"); 
         ChatEdit_UpdateHeader(self); 
      elseif (CanEditOfficerNote()) then 
         self:SetAttribute("chatType", "OFFICER"); 
         ChatEdit_UpdateHeader(self); 
      else 
         return; 
      end 
   elseif (self:GetAttribute("chatType") == "PARTY") then 
         if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance())  then 
         self:SetAttribute("chatType", "INSTANCE_CHAT"); 
              ChatEdit_UpdateHeader(self); 
        elseif (GetNumGroupMembers()>0 and IsInRaid() ) then 
              self:SetAttribute("chatType", "RAID"); 
              ChatEdit_UpdateHeader(self); 
        elseif (IsInGuild()) then 
              self:SetAttribute("chatType", "GUILD"); 
              ChatEdit_UpdateHeader(self); 
         elseif (CanEditOfficerNote()) then 
              self:SetAttribute("chatType", "OFFICER"); 
              ChatEdit_UpdateHeader(self); 
      else 
         self:SetAttribute("chatType", "SAY"); 
         ChatEdit_UpdateHeader(self); 
      end         
   elseif (self:GetAttribute("chatType") == "INSTANCE_CHAT") then 
      if (IsInGuild()) then 
         self:SetAttribute("chatType", "GUILD"); 
         ChatEdit_UpdateHeader(self); 
      elseif (CanEditOfficerNote()) then 
         self:SetAttribute("chatType", "OFFICER"); 
         ChatEdit_UpdateHeader(self); 
      else 
         self:SetAttribute("chatType", "SAY"); 
         ChatEdit_UpdateHeader(self); 
      end 
   elseif (self:GetAttribute("chatType") == "RAID") then 
      if (IsInGuild) then 
         self:SetAttribute("chatType", "GUILD"); 
         ChatEdit_UpdateHeader(self); 
      elseif (CanEditOfficerNote()) then 
         self:SetAttribute("chatType", "OFFICER"); 
         ChatEdit_UpdateHeader(self); 
      else 
         self:SetAttribute("chatType", "SAY"); 
         ChatEdit_UpdateHeader(self); 
      end 
   elseif (self:GetAttribute("chatType") == "GUILD") then 
      if (CanEditOfficerNote()) then 
         self:SetAttribute("chatType", "OFFICER"); 
         ChatEdit_UpdateHeader(self); 
      else 
          self:SetAttribute("chatType", "SAY"); 
          ChatEdit_UpdateHeader(self); 
      end 
   elseif (self:GetAttribute("chatType") == "OFFICER") then 
       self:SetAttribute("chatType", "SAY"); 
       ChatEdit_UpdateHeader(self); 
--密语切换开始 不需要的请从这删除 
   elseif (self:GetAttribute("chatType") == "WHISPER") then 
       self:SetAttribute("chatType", "SAY"); 
       ChatEdit_UpdateHeader(self); 
--密语切换结束 删除到这里 
   elseif (self:GetAttribute("chatType") == "CHANNEL") then 
      if (GetNumSubgroupMembers()>0) then 
         self:SetAttribute("chatType", "PARTY"); 
         ChatEdit_UpdateHeader(self); 
      elseif (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance())  then 
         self:SetAttribute("chatType", "INSTANCE_CHAT"); 
         ChatEdit_UpdateHeader(self); 
      elseif (GetNumGroupMembers()>0 and IsInRaid() ) then 
         self:SetAttribute("chatType", "RAID"); 
         ChatEdit_UpdateHeader(self); 
      elseif (IsInGuild()) then 
         self:SetAttribute("chatType", "GUILD"); 
         ChatEdit_UpdateHeader(self); 
      elseif (CanEditOfficerNote()) then 
         self:SetAttribute("chatType", "OFFICER"); 
         ChatEdit_UpdateHeader(self); 
      else 
         self:SetAttribute("chatType", "SAY"); 
         ChatEdit_UpdateHeader(self); 
      end 
   end 
end 

local chatmod = CreateFrame("Frame")
chatmod:RegisterEvent("ADDON_LOADED")
chatmod:SetScript("OnEvent", function(self, event, ...)
	local addon = ...
	if event == "ADDON_LOADED" then
		if addon == "EuiScript" then
			self:UnregisterEvent("ADDON_LOADED")
			for i = 1, NUM_CHAT_WINDOWS do
				local chat = format("ChatFrame%s",i)
				_G[chat.."EditBoxLanguage"]:ClearAllPoints()
				_G[chat.."EditBoxLanguage"]:SetPoint("LEFT", _G[chat.."EditBox"], "RIGHT", E:Scale(3), 0)
				hooksecurefunc(_G[chat.."EditBoxLanguage"], "SetPoint", function(self, point, attachTo, anchorPoint, xOffset, yOffset)
					if point ~= 'LEFT' or attachTo ~= _G[chat.."EditBox"] or anchorPoint ~= 'RIGHT' or xOffset ~= E:Scale(3) or yOffset ~= 0 then
						_G[chat.."EditBoxLanguage"]:SetPoint("LEFT", _G[chat.."EditBox"], "RIGHT", E:Scale(3), 0)
					end
				end)
				_G[chat.."EditBoxLanguage"]:Size(_G[chat.."EditBox"]:GetHeight()-6)
				_G[chat.."EditBoxLanguage"]:StripTextures()
				_G[chat.."EditBoxLanguage"]:SetTemplate("Default", true)
			end
		end
	end
end)