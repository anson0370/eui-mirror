local E, _, DF = unpack(ElvUI)
if E.db["euiscript"].chatmod ~= true then return end

function ChatEdit_CustomTabPressed(self)
   if (self:GetAttribute("chatType") == "SAY") then
      if Ash_Tabcus then
         self:SetAttribute("chatType", "CHANNEL");
         self.text = "/"..Ash_Tabcus.." "..self.text
         ChatEdit_UpdateHeader(self);
      elseif (GetNumSubgroupMembers()>0) then
         self:SetAttribute("chatType", "PARTY");
         ChatEdit_UpdateHeader(self);
      elseif (GetNumGroupMembers()>0) then
         self:SetAttribute("chatType", "RAID");
         ChatEdit_UpdateHeader(self);
      elseif (GetNumBattlefieldScores()>0) then
         self:SetAttribute("chatType", "INSTANCE_CHAT");
         ChatEdit_UpdateHeader(self);
      elseif (IsInGuild()) then
         self:SetAttribute("chatType", "GUILD");
         ChatEdit_UpdateHeader(self);
      else
         return;
      end
   elseif (self:GetAttribute("chatType") == "PARTY") then
      if (GetNumGroupMembers()>0) then
         self:SetAttribute("chatType", "RAID");
         ChatEdit_UpdateHeader(self);
      elseif (GetNumBattlefieldScores()>0) then
         self:SetAttribute("chatType", "INSTANCE_CHAT");
         ChatEdit_UpdateHeader(self);
      elseif (IsInGuild()) then
         self:SetAttribute("chatType", "GUILD");
         ChatEdit_UpdateHeader(self);
      else
         self:SetAttribute("chatType", "SAY");
         ChatEdit_UpdateHeader(self);
      end         
   elseif (self:GetAttribute("chatType") == "RAID") then
      if (GetNumBattlefieldScores()>0) then
         self:SetAttribute("chatType", "INSTANCE_CHAT");
         ChatEdit_UpdateHeader(self);
      elseif (IsInGuild()) then
         self:SetAttribute("chatType", "GUILD");
         ChatEdit_UpdateHeader(self);
      else
         self:SetAttribute("chatType", "SAY");
         ChatEdit_UpdateHeader(self);
      end
   elseif (self:GetAttribute("chatType") == "INSTANCE_CHAT") then
      if (IsInGuild) then
         self:SetAttribute("chatType", "GUILD");
         ChatEdit_UpdateHeader(self);
      else
         self:SetAttribute("chatType", "SAY");
         ChatEdit_UpdateHeader(self);
      end
   elseif (self:GetAttribute("chatType") == "GUILD") then
      self:SetAttribute("chatType", "SAY");
      ChatEdit_UpdateHeader(self);
   elseif (self:GetAttribute("chatType") == "CHANNEL") then
      if (GetNumSubgroupMembers()>0) then
         self:SetAttribute("chatType", "PARTY");
         ChatEdit_UpdateHeader(self);
      elseif (GetNumGroupMembers()>0) then
         self:SetAttribute("chatType", "RAID");
         ChatEdit_UpdateHeader(self);
      elseif (GetNumBattlefieldScores()>0) then
         self:SetAttribute("chatType", "INSTANCE_CHAT");
         ChatEdit_UpdateHeader(self);
      elseif (IsInGuild()) then
         self:SetAttribute("chatType", "GUILD");
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
				_G[chat.."EditBoxLanguage"].SetPoint = E.noop
				_G[chat.."EditBoxLanguage"]:Size(_G[chat.."EditBox"]:GetHeight()-6)
				_G[chat.."EditBoxLanguage"]:StripTextures()
				_G[chat.."EditBoxLanguage"]:SetTemplate("Default", true)
			end
		end
	end
end)