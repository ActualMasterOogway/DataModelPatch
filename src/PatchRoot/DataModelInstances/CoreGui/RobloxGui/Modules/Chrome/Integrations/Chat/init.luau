local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v8 = require(l_script_FirstAncestor_0.Service);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v10 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local v11 = require(l_script_FirstAncestor_0.ChromeShared.Service.ViewportUtil);
local l_MappedSignal_0 = v9.MappedSignal;
local v13 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_GameSettings_0 = UserSettings().GameSettings;
local l_GuiService_0 = game:GetService("GuiService");
local v16 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v17 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_InExperienceAppChatExperimentation_0 = v16.App.InExperienceAppChatExperimentation;
local l_InExperienceAppChatModal_0 = v16.App.InExperienceAppChatModal;
local l_getFFlagAppChatCoreUIConflictFix_0 = v17.getFFlagAppChatCoreUIConflictFix;
local v21 = require(l_RobloxGui_0.Modules.ChatSelector);
local l_GetFFlagEnableAppChatInExperience_0 = v17.GetFFlagEnableAppChatInExperience;
local v23 = require(l_script_FirstAncestor_0.Flags.GetFFlagAddChromeActivatedEvents);
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = v17.GetFFlagRemoveChromeRobloxGuiReferences;
local l_getFFlagExpChatGetLabelAndIconFromUtil_0 = v17.getFFlagExpChatGetLabelAndIconFromUtil;
local l_getExperienceChatVisualConfig_0 = require(l_CorePackages_0.Workspace.Packages.ExpChat).getExperienceChatVisualConfig;
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local v28 = 0;
local l_v21_Visibility_0 = v21:GetVisibility();
local v30 = nil;
local v31 = nil;
v31 = if l_getFFlagExpChatAlwaysRunTCS_0() then v21.ChromeVisibilityStateChanged else v21.VisibilityStateChanged;
local v33 = l_MappedSignal_0.new(v31, function() --[[ Line: 46 ]]
    -- upvalues: l_v21_Visibility_0 (ref)
    return l_v21_Visibility_0;
end, function(v32) --[[ Line: 48 ]]
    -- upvalues: l_GuiService_0 (copy), l_GameSettings_0 (copy), l_v21_Visibility_0 (ref), v28 (ref), v30 (ref)
    if not l_GuiService_0.MenuIsOpen then
        l_GameSettings_0.ChatVisible = v32;
    end;
    l_v21_Visibility_0 = v32;
    if v32 and v28 and v30.notification then
        v28 = 0;
        v30.notification:clear();
    end;
end);
local function v35(v34) --[[ Line: 61 ]]
    -- upvalues: l_getFFlagAppChatCoreUIConflictFix_0 (copy), l_InExperienceAppChatModal_0 (copy), v21 (copy), l_v21_Visibility_0 (ref)
    if l_getFFlagAppChatCoreUIConflictFix_0() then
        if l_InExperienceAppChatModal_0:getVisible() then
            l_InExperienceAppChatModal_0.default:setVisible(false);
        end;
        v21:SetVisible(true);
        return;
    else
        if v34 then
            if not l_v21_Visibility_0 then
                v21:ToggleVisibility();
                return;
            end;
        else
            v21:ToggleVisibility();
        end;
        return;
    end;
end;
v30 = v8:register({
    id = "chat", 
    label = "CoreScripts.TopBar.Chat", 
    activated = function(_) --[[ Line: 82 ]] --[[ Name: activated ]]
        -- upvalues: l_v21_Visibility_0 (ref), l_getFFlagAppChatCoreUIConflictFix_0 (copy), v21 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v10 (copy), v35 (copy), v9 (copy)
        if l_v21_Visibility_0 then
            if l_getFFlagAppChatCoreUIConflictFix_0() then
                v21:SetVisible(false);
                return;
            else
                v21:ToggleVisibility();
                return;
            end;
        elseif l_GetFFlagRemoveChromeRobloxGuiReferences_0() then
            v10.dismissRobloxMenuAndRun(function(v37) --[[ Line: 91 ]]
                -- upvalues: v35 (ref)
                v35(v37);
            end);
            return;
        else
            v9.dismissRobloxMenuAndRun(function(v38) --[[ Line: 95 ]]
                -- upvalues: v35 (ref)
                v35(v38);
            end);
            return;
        end;
    end, 
    isActivated = v23() and function() --[[ Line: 102 ]]
        -- upvalues: v33 (copy)
        return v33:get();
    end or nil, 
    components = {
        Icon = function(_) --[[ Line: 107 ]] --[[ Name: Icon ]]
            -- upvalues: l_getFFlagExpChatGetLabelAndIconFromUtil_0 (copy), l_getExperienceChatVisualConfig_0 (copy), v13 (copy), v33 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_InExperienceAppChatExperimentation_0 (copy)
            if l_getFFlagExpChatGetLabelAndIconFromUtil_0() then
                local v40 = l_getExperienceChatVisualConfig_0();
                return v13(v40.icon.off, v40.icon.on, v33);
            elseif l_GetFFlagEnableAppChatInExperience_0() and l_InExperienceAppChatExperimentation_0.default.variant.ShowInExperienceChatNewIcon then
                return v13("icons/menu/publicChatOff", "icons/menu/publicChatOn", v33);
            else
                return v13("icons/menu/chat_off", "icons/menu/chat_on", v33);
            end;
        end
    }
});
v30.notification:fireCount(v28);
l_TextChatService_0.MessageReceived:Connect(function() --[[ Line: 126 ]]
    -- upvalues: l_v21_Visibility_0 (ref), v28 (ref), v30 (ref)
    if not l_v21_Visibility_0 then
        v28 = v28 + 1;
        v30.notification:fireCount(v28);
    end;
end);
local v41 = 0;
v21.MessagesChanged:connect(function(v42) --[[ Line: 134 ]]
    -- upvalues: l_v21_Visibility_0 (ref), v28 (ref), v41 (ref), v30 (ref)
    if not l_v21_Visibility_0 then
        v28 = v28 + (v42 - v41);
        v30.notification:fireCount(v28);
    end;
    v41 = v42;
end);
coroutine.wrap(function() --[[ Line: 142 ]]
    -- upvalues: l_Players_0 (copy), l_RunService_0 (copy), l_Chat_0 (copy), v30 (ref), v9 (copy), l_GameSettings_0 (copy), v11 (copy), l_v21_Visibility_0 (ref), v21 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    local v44 = true;
    if not l_RunService_0:IsStudio() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 151 ]]
            -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0);
        end);
        v44 = l_status_0 and l_result_0;
    end;
    if v44 and v30.availability then
        v9.setCoreGuiAvailability(v30, Enum.CoreGuiType.Chat, function(v47) --[[ Line: 158 ]]
            -- upvalues: v30 (ref)
            if v47 then
                v30.availability:pinned();
                return;
            else
                v30.availability:unavailable();
                return;
            end;
        end);
        local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
        if v11.isSmallTouchScreen() then
            l_ChatVisible_0 = false;
        end;
        l_v21_Visibility_0 = l_ChatVisible_0;
        v21:SetVisible(l_ChatVisible_0);
    end;
end)();
_simulateChat = function() --[[ Line: 176 ]] --[[ Name: _simulateChat ]]
    -- upvalues: l_v21_Visibility_0 (ref), v28 (ref), v30 (ref)
    while true do
        task.wait(math.random(1, 15));
        if not l_v21_Visibility_0 then
            v28 = v28 + 1;
            v30.notification:fireCount(v28);
        end;
    end;
end;
return v30;