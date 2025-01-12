local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SocialCommon);
local v3 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableAppChatInExperience_0 = v3.GetFFlagEnableAppChatInExperience;
local l_default_0 = v2.Experiments.NewChatTabExperimentation.default;
local v6 = require(l_script_FirstAncestor_0.App.InExperienceAppChatExperimentation);
local l_GetFFlagAppChatRebrandStringUpdates_0 = v3.GetFFlagAppChatRebrandStringUpdates;
local l_getFFlagAppChatRebrandIconUpdates_0 = v3.getFFlagAppChatRebrandIconUpdates;
local v9 = game:DefineFastFlag("AppChatRebrandIconUpdatesNew", false);
local v10 = game:DefineFastString("AppChatRebrandIconUpdatesNewOn", "icons/menu/2-person-with-bubble-on");
local v11 = game:DefineFastString("AppChatRebrandIconUpdatesNewOff", "icons/menu/2-person-with-bubble");
return function() --[[ Line: 20 ]]
    -- upvalues: l_default_0 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v6 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_getFFlagAppChatRebrandIconUpdates_0 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v12 = UDim2.new(0, 0, 0, 0);
    local v13 = "Feature.SocialTab.Label.Connect";
    local v14 = {
        on = "icons/menu/chat_on", 
        off = "icons/menu/chat_off"
    };
    if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then
        v13 = "CommonUI.Features.Label.Chat";
    end;
    if l_GetFFlagEnableAppChatInExperience_0() then
        if v6.default.variant.ShowPlatformChatNewTitleInUniversalApp then
            v13 = "Feature.Chat.Label.Connect";
        end;
        if v6.default.variant.ShowPlatformChatNewIconInUniversalApp then
            v14 = {
                on = "icons/menu/platformChatOn", 
                off = "icons/menu/platformChatOff"
            };
            v12 = UDim2.new(0, -6, 0, -1);
        end;
    end;
    if l_GetFFlagAppChatRebrandStringUpdates_0() then
        v13 = "Feature.Squads.Label.Party";
    end;
    if l_getFFlagAppChatRebrandIconUpdates_0() then
        v14 = {
            on = "icons/menu/groups_on", 
            off = "icons/menu/groups"
        };
    end;
    if v9 then
        v14 = {
            on = v10, 
            off = v11
        };
    end;
    return {
        label = v13, 
        icon = v14, 
        badgeOffset = v12
    };
end;