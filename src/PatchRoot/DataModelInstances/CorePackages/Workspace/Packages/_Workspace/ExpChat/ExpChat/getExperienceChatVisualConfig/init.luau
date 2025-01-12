local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableAppChatInExperience_0 = v1.GetFFlagEnableAppChatInExperience;
local l_getFFlagAppChatRebrandIconUpdates_0 = v1.getFFlagAppChatRebrandIconUpdates;
local l_InExperienceAppChatExperimentation_0 = require(l_Parent_0.AppChat).App.InExperienceAppChatExperimentation;
return function() --[[ Line: 20 ]]
    -- upvalues: l_GetFFlagEnableAppChatInExperience_0 (copy), l_InExperienceAppChatExperimentation_0 (copy), l_getFFlagAppChatRebrandIconUpdates_0 (copy)
    local v5 = 20;
    local v6 = {
        on = "icons/menu/chat_on", 
        off = "icons/menu/chat_off"
    };
    if l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowInExperienceChatNewIcon then
        v5 = 30;
        v6 = {
            on = "icons/menu/publicChatOn", 
            off = "icons/menu/publicChatOff"
        };
    end;
    if l_getFFlagAppChatRebrandIconUpdates_0() then
        v5 = 30;
        v6 = {
            on = "icons/menu/platformChatOn", 
            off = "icons/menu/platformChatOff"
        };
    end;
    return {
        label = "CoreScripts.TopBar.Chat", 
        icon = v6, 
        iconSize = v5
    };
end;