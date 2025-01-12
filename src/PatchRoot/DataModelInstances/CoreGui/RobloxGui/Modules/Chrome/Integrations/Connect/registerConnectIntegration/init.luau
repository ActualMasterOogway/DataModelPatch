local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(script.Parent.ConnectIcon);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v6 = require(l_script_FirstAncestor_0.ChromeShared.Service.LocalStore);
local v7 = require(l_script_FirstAncestor_0.Flags.GetFFlagAppChatInExpConnectIconEnableSquadIndicator);
local v8 = require(l_script_FirstAncestor_0.Flags.GetFStringConnectTooltipLocalStorageKey);
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local v10 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local v12 = game:DefineFastFlag("AppChatInExpForceCursor", false);
local v13 = game:DefineFastFlag("AppChatInExpUseUnibarNotification", false);
local l_GetFFlagAppChatInExperienceRenameToRobloxChat_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatInExperienceRenameToRobloxChat;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
return function(v16, v17) --[[ Line: 28 ]]
    -- upvalues: v7 (copy), v3 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagAppChatInExperienceRenameToRobloxChat_0 (copy), l_InExperienceAppChatModal_0 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v6 (copy), v8 (copy), v2 (copy), v4 (copy), v13 (copy), v12 (copy), l_Symbol_0 (copy), v10 (copy)
    local v18 = false;
    if v16 == "connect_unibar" then
        v18 = v7();
    end;
    local v20 = v3:register({
        id = v16, 
        label = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Squads.Label.Party" or l_GetFFlagAppChatInExperienceRenameToRobloxChat_0() and "Feature.Chat.Label.RobloxChat" or "Feature.Chat.Label.Connect", 
        activated = function() --[[ Line: 39 ]] --[[ Name: activated ]]
            -- upvalues: l_InExperienceAppChatModal_0 (ref), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v6 (ref), v8 (ref)
            l_InExperienceAppChatModal_0:toggleVisibility();
            if l_FFlagEnableUnibarFtuxTooltips_0 then
                v6.storeForLocalPlayer(v8(), true);
            end;
        end, 
        isActivated = function() --[[ Line: 45 ]] --[[ Name: isActivated ]]
            -- upvalues: l_InExperienceAppChatModal_0 (ref)
            return l_InExperienceAppChatModal_0:getVisible();
        end, 
        components = {
            Icon = function(v19) --[[ Line: 49 ]] --[[ Name: Icon ]]
                -- upvalues: v2 (ref), v4 (ref), v16 (copy), v13 (ref), v18 (copy)
                return v2.createElement(v4, {
                    integrationId = v16, 
                    isIconVisible = v19.visible, 
                    shouldShowCustomBadge = not v13, 
                    isSquadIndicatorEnabled = v18
                });
            end
        }, 
        initialAvailability = v17
    });
    if v13 then
        if v18 then
            local function _(v21, v22) --[[ Line: 64 ]] --[[ Name: updateNotificationBadge ]]
                -- upvalues: v20 (copy)
                if v21 == 0 or v22 then
                    v20.notification:clear();
                    return;
                else
                    v20.notification:fireCount(v21);
                    return;
                end;
            end;
            l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v24) --[[ Line: 73 ]]
                -- upvalues: l_InExperienceAppChatModal_0 (ref), v20 (copy)
                local l_unreadCount_0 = l_InExperienceAppChatModal_0.default.unreadCount;
                local v26 = v24 ~= "";
                if l_unreadCount_0 == 0 or v26 then
                    v20.notification:clear();
                    return;
                else
                    v20.notification:fireCount(l_unreadCount_0);
                    return;
                end;
            end);
            l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v27) --[[ Line: 77 ]]
                -- upvalues: l_InExperienceAppChatModal_0 (ref), v20 (copy)
                local v28 = l_InExperienceAppChatModal_0.default.currentSquadId ~= "";
                if v27 == 0 or v28 then
                    v20.notification:clear();
                    return;
                else
                    v20.notification:fireCount(v27);
                    return;
                end;
            end);
            local l_unreadCount_1 = l_InExperienceAppChatModal_0.default.unreadCount;
            local v30 = l_InExperienceAppChatModal_0.default.currentSquadId ~= "";
            if l_unreadCount_1 == 0 or v30 then
                v20.notification:clear();
            else
                v20.notification:fireCount(l_unreadCount_1);
            end;
        else
            local function _(v31) --[[ Line: 86 ]] --[[ Name: updateUnreadMessageCount ]]
                -- upvalues: v20 (copy)
                if v31 == 0 then
                    v20.notification:clear();
                    return;
                else
                    v20.notification:fireCount(v31);
                    return;
                end;
            end;
            l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v33) --[[ Line: 94 ]]
                -- upvalues: v20 (copy)
                if v33 == 0 then
                    v20.notification:clear();
                    return;
                else
                    v20.notification:fireCount(v33);
                    return;
                end;
            end);
            local l_unreadCount_2 = l_InExperienceAppChatModal_0.default.unreadCount;
            if l_unreadCount_2 == 0 then
                v20.notification:clear();
            else
                v20.notification:fireCount(l_unreadCount_2);
            end;
        end;
    end;
    if v12 then
        local v35 = l_Symbol_0.named("InExperienceRobloxConnect");
        l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v36) --[[ Line: 105 ]]
            -- upvalues: v10 (ref), v35 (copy)
            if v36 then
                v10.push(v35, Enum.OverrideMouseIconBehavior.ForceShow);
                return;
            else
                v10.pop(v35);
                return;
            end;
        end);
    end;
    return v20;
end;