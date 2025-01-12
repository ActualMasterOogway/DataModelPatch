local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_RobloxGui_0.Modules;
local l_Settings_0 = l_Modules_0.Settings;
local v9 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local l_ShareGame_0 = l_Settings_0.Pages.ShareGame;
local v12 = require(l_ShareGame_0.Components.FullModalShareGameComponent);
local v13 = require(l_ShareGame_0.AppReducer);
local v14 = require(l_ShareGame_0.InviteStore);
local v15 = require(l_Modules_0.Flags.GetFFlagEnableSharedInviteStore);
local v16 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v17 = {};
v17.__index = v17;
v17.new = function(v18) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy)
    local v19 = {
        mountTarget = v18, 
        isActive = false
    };
    setmetatable(v19, v17);
    return v19;
end;
v17.withSocialServiceAndLocalPlayer = function(v20, v21, v22) --[[ Line: 48 ]] --[[ Name: withSocialServiceAndLocalPlayer ]]
    v20.socialService = v21;
    v20.localPlayer = v22;
    return v20;
end;
v17.withAnalytics = function(v23, v24) --[[ Line: 54 ]] --[[ Name: withAnalytics ]]
    v23.analytics = v24;
    return v23;
end;
v17._createTree = function(v25, v26, v27) --[[ Line: 59 ]] --[[ Name: _createTree ]]
    -- upvalues: v15 (copy), v14 (copy), v6 (copy), v13 (copy), v5 (copy), v12 (copy)
    local v28 = if v15() then v14 else v6.Store.new(v13, nil, {
        v6.thunkMiddleware
    });
    return v5.createElement(v12, {
        store = v28, 
        isVisible = v26, 
        analytics = v25.analytics, 
        promptMessage = v27 and v27.promptMessage, 
        inviteUserId = v27 and v27.inviteUserId, 
        inviteMessageId = v27 and v27.inviteMessageId, 
        launchData = v27 and v27.launchData, 
        isLoading = v27 and v27.isLoading, 
        onAfterClosePage = function(_) --[[ Line: 72 ]] --[[ Name: onAfterClosePage ]]
            -- upvalues: v25 (copy)
            v25:hide({});
        end
    });
end;
v17.show = function(v30, v31) --[[ Line: 85 ]] --[[ Name: show ]]
    -- upvalues: v9 (copy), l_GameInviteEvents_0 (copy), v16 (copy), v5 (copy), l_ContextActionService_0 (copy)
    if v30.isActive then
        return;
    else
        v30.isLoading = v31 and v31.isLoading;
        v30.isActive = not v30.isLoading;
        if v31 then
            local v32 = if v31.inviteUserId then v9.Triggers.DeveloperSingle else v9.Triggers.DeveloperMultiple;
            local v33 = false;
            if v31.launchData ~= nil then
                v33 = v31.launchData ~= "";
            end;
            v30.analytics:sendEvent(v32, l_GameInviteEvents_0.ModalOpened, if v16() then {
                isLaunchDataProvided = v33
            } else nil);
        end;
        if not v30.instance then
            v30.instance = v5.mount(v30:_createTree(true, v31), v30.mountTarget, "invitePrompt");
        else
            v30.instance = v5.update(v30.instance, v30:_createTree(true, v31));
        end;
        if v30.analytics and not v30.isLoading then
            v30.analytics:inputShareGameEntryPoint();
        end;
        l_ContextActionService_0:BindCoreAction("hideInvitePrompt", function(_, v35, _) --[[ Line: 114 ]]
            -- upvalues: v30 (copy)
            if v35 == Enum.UserInputState.Begin then
                v30:hide();
            end;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace);
        return;
    end;
end;
v17.hide = function(v37, _) --[[ Line: 121 ]] --[[ Name: hide ]]
    -- upvalues: v5 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    if not v37.isActive and not v37.isLoading then
        return;
    else
        v37.isLoading = false;
        v37.isActive = false;
        v37.instance = v5.update(v37.instance, v37:_createTree(false));
        if v37.socialService and v37.localPlayer then
            v37.socialService:InvokeGameInvitePromptClosed(v37.localPlayer, {});
        end;
        l_ContextActionService_0:UnbindCoreAction("hideInvitePrompt");
        l_GuiService_0.SelectedCoreObject = nil;
        l_GuiService_0:RemoveSelectionGroup("invitePrompt");
        return;
    end;
end;
v17.destruct = function(v39) --[[ Line: 138 ]] --[[ Name: destruct ]]
    -- upvalues: v5 (copy)
    if v39.instance then
        v5.unmount(v39.instance);
    end;
end;
return v17;