local INVITE_STRING = "pour le raid"

local frame = CreateFrame("Frame", "OMWPLR")
frame:RegisterEvent("CHAT_MSG_WHISPER")

OMWPLR_DB = OMWPLR_DB or {}
local function eventHandler(self, event, ...)
  local message, sender = ...
  
  if not OMWPLR_DB.enabled then return end
  if message ~= INVITE_STRING then return end
  
  if (IsInGroup(LE_PARTY_CATEGORY_HOME) or IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then ConvertToRaid() end
  InviteUnit(sender)

end
frame:SetScript("OnEvent", eventHandler)

SLASH_OMWPLR1 = "/plr"
SLASH_OMWPLR2 = "/omwplr"
SlashCmdList["OMWPLR"] = function(msg)
  OMWPLR_DB.enabled = not OMWPLR_DB.enabled
  if OMWPLR_DB.enabled then 
    print("OMWPLR: enabled")
  else
    print("OMWPLR: disabled")
  end
end 