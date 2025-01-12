local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_VRService_0 = game:GetService("VRService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Create_0 = require(l_CorePackages_0:WaitForChild("Workspace"):WaitForChild("Packages"):WaitForChild("AppCommonLib")).Create;
local v12 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local v13 = require(l_RobloxGui_0.Modules.Common.Url);
local v14 = game:DefineFastFlag("DebugEnableErrorStringTesting", false);
local v15 = game:DefineFastFlag("ShouldMuteUnlocalizedError", false);
local v16 = game:DefineFastInt("PotentialClientTimeoutSeconds", 7200);
local v17 = game:DefineFastInt("MaxKickMessageLength", 200);
local v18 = game:DefineFastFlag("RefactorReconnectUnblockTeleport", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("CoreGuiOverflowDetection");
local v20 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptShowTeleportPrompt);
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local v22 = require(l_RobloxGui_0.Modules.Flags.FFlagRemoveKickWhitespaceSub);
local v23 = require(l_RobloxGui_0.Modules.Flags.FFlagEmptyKickMessageTranslation);
local v24 = require(l_RobloxGui_0.Modules.Flags.FFlagAllowDisconnectGuiForOkUnknown);
local function _(v25, v26) --[[ Line: 42 ]] --[[ Name: safeGetFInt ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 43 ]]
        -- upvalues: v25 (copy)
        return (tonumber(settings():GetFVariable(v25)));
    end);
    return l_status_0 and l_result_0 or v26;
end;
local function _(v30, v31) --[[ Line: 49 ]] --[[ Name: safeGetFString ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 50 ]]
        -- upvalues: v30 (copy)
        return settings():GetFVariable(v30);
    end);
    return l_status_1 and l_result_1 or v31;
end;
local l_pcall_0 = pcall;
local v36 = "DefaultTimeoutTimeMs";
local l_v36_0 = v36 --[[ copy: 31 -> 69 ]];
local v38;
l_pcall_0, v38 = l_pcall_0(function() --[[ Line: 43 ]]
    -- upvalues: l_v36_0 (copy)
    return (tonumber(settings():GetFVariable(l_v36_0)));
end);
local v39 = (l_pcall_0 and v38 or 10000) / 1000;
local l_FFlag_0 = settings():GetFFlag("ReconnectDisabled");
v38 = pcall;
local v41 = "ReconnectDisabledReason";
local l_v41_0 = v41 --[[ copy: 32 -> 70 ]];
v38, v36 = v38(function() --[[ Line: 50 ]]
    -- upvalues: l_v41_0 (copy)
    return settings():GetFVariable(l_v41_0);
end);
l_pcall_0 = v38 and v36 or "We're sorry, Roblox is temporarily unavailable.  Please try again later.";
v38 = tick();
v36 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
v41 = nil;
local v43 = -1;
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local v45 = nil;
if v21() then
    v45 = l_RobloxGui_0.AbsoluteSize.Y;
end;
local v46 = {
    NONE = 1, 
    RECONNECT_PLACELAUNCH = 2, 
    RECONNECT_DISCONNECT = 3, 
    TELEPORT_FAILED = 4, 
    IS_RECONNECTING = 5, 
    RECONNECT_DISABLED_DISCONNECT = 6, 
    RECONNECT_DISABLED_PLACELAUNCH = 7, 
    RECONNECT_DISABLED = 8, 
    OUT_OF_MEMORY_KEEPPLAYING_LEAVE = 9
};
local l_NONE_0 = v46.NONE;
local l_OK_0 = Enum.ConnectionError.OK;
local v49 = {
    [v46.RECONNECT_PLACELAUNCH] = "Join Error", 
    [v46.RECONNECT_DISABLED_PLACELAUNCH] = "Join Error", 
    [v46.RECONNECT_DISCONNECT] = "Disconnected", 
    [v46.RECONNECT_DISABLED_DISCONNECT] = "Disconnected", 
    [v46.TELEPORT_FAILED] = "Teleport Failed", 
    [v46.RECONNECT_DISABLED] = "Error", 
    [v46.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "Low Memory Warning"
};
local v50 = {
    [v46.RECONNECT_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError", 
    [v46.RECONNECT_DISABLED_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError", 
    [v46.RECONNECT_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected", 
    [v46.RECONNECT_DISABLED_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected", 
    [v46.TELEPORT_FAILED] = "InGame.ConnectionError.Title.TeleportFailed", 
    [v46.RECONNECT_DISABLED] = "InGame.CommonUI.Title.Error", 
    [v46.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "InGame.ConnectionError.Title.LowMemoryWarning"
};
local function v58(v51) --[[ Line: 119 ]] --[[ Name: fetchStarterPlaceId ]]
    -- upvalues: v13 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local v52 = "universeIds=" .. v51;
    local v53 = v13.GAME_URL .. "v1/games" .. "?" .. v52;
    local l_status_2, l_result_2 = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v53);
    if l_status_2 then
        local v56 = l_HttpService_0:JSONDecode(l_result_2);
        if v56 and v56.data and v56.data[1] then
            local l_rootPlaceId_0 = v56.data[1].rootPlaceId;
            if l_rootPlaceId_0 then
                return true, l_rootPlaceId_0;
            end;
        end;
    end;
    return false, -1;
end;
local v59 = l_Create_0("ScreenGui")({
    Parent = l_CoreGui_0, 
    Name = "RobloxPromptGui", 
    OnTopOfCoreBlur = true, 
    DisplayOrder = 9, 
    AutoLocalize = false
});
local v60 = l_Create_0("Frame")({
    Name = "promptOverlay", 
    BackgroundColor3 = Color3.new(0, 0, 0), 
    BackgroundTransparency = 1, 
    Size = UDim2.new(1, 0, 1, 36), 
    Position = UDim2.new(0, 0, 0, -36), 
    Active = false, 
    Parent = v59
});
coroutine.wrap(function() --[[ Line: 157 ]]
    -- upvalues: l_RobloxGui_0 (copy), v60 (copy)
    local l_TopBarHeight_0 = require(l_RobloxGui_0.Modules.TopBar.Constants).TopBarHeight;
    v60.Size = UDim2.new(1, 0, 1, l_TopBarHeight_0);
    v60.Position = UDim2.new(0, 0, 0, -l_TopBarHeight_0);
end)();
local function v67() --[[ Line: 166 ]]
    -- upvalues: l_NONE_0 (ref), v46 (copy), l_RbxAnalyticsService_0 (copy), v41 (ref), v58 (copy), v43 (ref), l_TeleportService_0 (copy), v20 (copy), v18 (copy), l_GuiService_0 (copy)
    if l_NONE_0 == v46.IS_RECONNECTING then
        return;
    else
        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-ReconnectActivated");
        l_NONE_0 = v46.IS_RECONNECTING;
        v41:primaryShimmerPlay();
        local v62 = nil;
        local v63 = nil;
        if game.GameId > 0 then
            local v64, v65 = v58(game.GameId);
            v62 = v64;
            v63 = v65;
        end;
        local v66 = tick();
        if v66 < v43 then
            wait(v43 - v66);
        end;
        if v62 and v63 > 0 then
            l_TeleportService_0:Teleport(v63);
        else
            l_TeleportService_0:Teleport(game.PlaceId);
        end;
        if v20 then
            if v18 then
                l_TeleportService_0:UnblockAsync();
                return;
            else
                l_GuiService_0:SetMenuIsOpen(false, "ErrorPrompt");
            end;
        end;
        return;
    end;
end;
local function v68() --[[ Line: 199 ]]
    -- upvalues: l_GuiService_0 (copy), l_RunService_0 (copy)
    l_GuiService_0.SelectedCoreObject = nil;
    l_RunService_0.RenderStepped:wait();
    l_RunService_0.RenderStepped:wait();
    game:Shutdown();
end;
local function v69() --[[ Line: 207 ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:ClearError();
end;
local v70 = {
    [Enum.ConnectionError.DisconnectLuaKick] = true, 
    [Enum.ConnectionError.DisconnectSecurityKeyMismatch] = true, 
    [Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = true, 
    [Enum.ConnectionError.DisconnectDuplicateTicket] = true, 
    [Enum.ConnectionError.DisconnectWrongVersion] = true, 
    [Enum.ConnectionError.DisconnectProtocolMismatch] = true, 
    [Enum.ConnectionError.DisconnectBadhash] = true, 
    [Enum.ConnectionError.DisconnectIllegalTeleport] = true, 
    [Enum.ConnectionError.DisconnectDuplicatePlayer] = true, 
    [Enum.ConnectionError.DisconnectCloudEditKick] = true, 
    [Enum.ConnectionError.DisconnectOnRemoteSysStats] = true, 
    [Enum.ConnectionError.DisconnectPrivateServerKickout] = true, 
    [Enum.ConnectionError.DisconnectRaknetErrors] = true, 
    [Enum.ConnectionError.PlacelaunchFlooded] = true, 
    [Enum.ConnectionError.PlacelaunchHashException] = true, 
    [Enum.ConnectionError.PlacelaunchHashExpired] = true, 
    [Enum.ConnectionError.PlacelaunchUnauthorized] = true, 
    [Enum.ConnectionError.PlacelaunchUserLeft] = true, 
    [Enum.ConnectionError.PlacelaunchRestricted] = true, 
    [Enum.ConnectionError.PlacelaunchUserPrivacyUnauthorized] = true, 
    [Enum.ConnectionError.PlacelaunchCreatorBan] = true
};
if l_game_EngineFeature_0 then
    v70[Enum.ConnectionError.DisconnectClientFailure] = true;
end;
local v71 = {
    [v46.RECONNECT_PLACELAUNCH] = {
        {
            Text = "Retry", 
            LocalizationKey = "InGame.CommonUI.Button.Retry", 
            LayoutOrder = 2, 
            Callback = v67, 
            Primary = true
        }, 
        {
            Text = "Cancel", 
            LocalizationKey = "Feature.SettingsHub.Action.CancelSearch", 
            LayoutOrder = 1, 
            Callback = v68
        }
    }, 
    [v46.RECONNECT_DISCONNECT] = {
        {
            Text = "Reconnect", 
            LocalizationKey = "InGame.ConnectionError.Button.Reconnect", 
            LayoutOrder = 2, 
            Callback = v67, 
            Primary = true
        }, 
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v68
        }
    }, 
    [v46.TELEPORT_FAILED] = {
        {
            Text = "OK", 
            LocalizationKey = "InGame.CommonUI.Button.Ok", 
            LayoutOrder = 1, 
            Callback = v69, 
            Primary = true
        }
    }, 
    [v46.RECONNECT_DISABLED_DISCONNECT] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v68, 
            Primary = true
        }
    }, 
    [v46.RECONNECT_DISABLED_PLACELAUNCH] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v68, 
            Primary = true
        }
    }, 
    [v46.RECONNECT_DISABLED] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v68, 
            Primary = true
        }
    }, 
    [v46.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = {
        {
            Text = "Keep Playing", 
            LocalizationKey = "InGame.CommonUI.Button.KeepPlaying", 
            LayoutOrder = 1, 
            Callback = v69
        }, 
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 2, 
            Callback = v68, 
            Primary = true
        }
    }
};
local v72 = {
    [v46.NONE] = function() --[[ Line: 328 ]]
        -- upvalues: l_RunService_0 (copy), v60 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v60.Active = false;
        v60.Transparency = 1;
    end, 
    [v46.RECONNECT_DISCONNECT] = function() --[[ Line: 333 ]]
        -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), v60 (copy)
        if l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(false);
        else
            l_RunService_0:SetRobloxGuiFocused(true);
        end;
        v60.Active = true;
        v60.Transparency = 1;
    end, 
    [v46.RECONNECT_PLACELAUNCH] = function() --[[ Line: 342 ]]
        -- upvalues: l_RunService_0 (copy), v60 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v60.Active = true;
        v60.Transparency = 0.3;
    end, 
    [v46.TELEPORT_FAILED] = function() --[[ Line: 347 ]]
        -- upvalues: l_RunService_0 (copy), v60 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v60.Active = true;
        v60.Transparency = 0.3;
    end, 
    [v46.RECONNECT_DISABLED_DISCONNECT] = function() --[[ Line: 352 ]]
        -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), v60 (copy)
        if l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(false);
        else
            l_RunService_0:SetRobloxGuiFocused(true);
        end;
        v60.Active = true;
        v60.Transparency = 1;
    end, 
    [v46.RECONNECT_DISABLED_PLACELAUNCH] = function() --[[ Line: 361 ]]
        -- upvalues: l_RunService_0 (copy), v60 (copy)
        l_RunService_0:SetRobloxGuiFocused(false);
        v60.Active = true;
        v60.Transparency = 0.3;
    end, 
    [v46.RECONNECT_DISABLED] = function() --[[ Line: 366 ]]
        -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), v60 (copy)
        if l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(false);
        else
            l_RunService_0:SetRobloxGuiFocused(true);
        end;
        v60.Active = true;
        v60.Transparency = 1;
    end
};
local function v75(v73) --[[ Line: 377 ]] --[[ Name: onEnter ]]
    -- upvalues: v41 (ref), v14 (copy), v12 (copy), v60 (copy), v21 (copy), l_X_0 (ref), v45 (ref), v72 (copy), v49 (copy), v50 (copy), v71 (copy)
    if not v41 then
        local v74 = {
            MenuIsOpenKey = "ConnectionErrorPrompt", 
            PlayAnimation = not v14
        };
        v41 = v12.new("Default", v74);
        v41:setParent(v60);
        if v21() then
            v41:resizeWidthAndHeight(l_X_0, v45);
        else
            v41:resizeWidth(l_X_0);
        end;
    end;
    if v72[v73] then
        v72[v73]();
    end;
    v41:setErrorTitle(v49[v73], v50[v73]);
    v41:updateButtons(v71[v73]);
end;
local function _(v76) --[[ Line: 398 ]] --[[ Name: onExit ]]
    -- upvalues: v46 (copy), v41 (ref)
    if v76 == v46.IS_RECONNECTING then
        v41:primaryShimmerStop();
    end;
end;
local function v81(v78, v79, v80) --[[ Line: 405 ]] --[[ Name: stateTransit ]]
    -- upvalues: v24 (copy), v46 (copy), l_FFlag_0 (copy), v38 (ref), v43 (ref), v39 (copy), l_OK_0 (ref), v70 (copy), l_RbxAnalyticsService_0 (copy), v16 (copy)
    if v24 then
        if v79 == Enum.ConnectionError.OK then
            return v46.NONE;
        end;
    elseif v78 == Enum.ConnectionError.OK then
        return v46.NONE;
    end;
    if v80 == v46.NONE then
        if l_FFlag_0 then
            return v46.RECONNECT_DISABLED;
        else
            v38 = tick();
            if v24 then
                assert(v79 ~= Enum.ConnectionError.OK);
                if v78 == Enum.ConnectionError.OK then
                    return v46.RECONNECT_DISCONNECT;
                end;
            end;
            if v78 == Enum.ConnectionError.DisconnectErrors then
                v43 = tick() + v39;
                l_OK_0 = Enum.ConnectionError.DisconnectErrors;
                if v79 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
                    return v46.OUT_OF_MEMORY_KEEPPLAYING_LEAVE;
                elseif v70[v79] then
                    return v46.RECONNECT_DISABLED_DISCONNECT;
                else
                    l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-Disconnect");
                    return v46.RECONNECT_DISCONNECT;
                end;
            elseif v78 == Enum.ConnectionError.PlacelaunchErrors then
                l_OK_0 = Enum.ConnectionError.PlacelaunchErrors;
                if v70[v79] then
                    return v46.RECONNECT_DISABLED_PLACELAUNCH;
                else
                    l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-PlaceLaunch");
                    return v46.RECONNECT_PLACELAUNCH;
                end;
            elseif v78 == Enum.ConnectionError.TeleportErrors then
                l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-TeleportFailed");
                return v46.TELEPORT_FAILED;
            end;
        end;
    end;
    if v80 == v46.IS_RECONNECTING then
        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-ReconnectFailed");
        if v78 == Enum.ConnectionError.TeleportErrors then
            if tick() > v38 + v16 then
                if l_OK_0 == Enum.ConnectionError.PlacelaunchErrors then
                    return v46.RECONNECT_DISABLED_PLACELAUNCH;
                else
                    return v46.RECONNECT_DISABLED_DISCONNECT;
                end;
            elseif l_OK_0 == Enum.ConnectionError.PlacelaunchErrors then
                return v46.RECONNECT_PLACELAUNCH;
            elseif l_OK_0 == Enum.ConnectionError.DisconnectErrors then
                return v46.RECONNECT_DISCONNECT;
            end;
        end;
    end;
    return v80;
end;
local function v100(v82, v83, v84) --[[ Line: 486 ]] --[[ Name: getErrorString ]]
    -- upvalues: v36 (ref), v22 (copy), v17 (copy), v23 (copy), v15 (copy)
    if v83 == Enum.ConnectionError.OK then
        return "";
    elseif v84 then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 492 ]]
            -- upvalues: v36 (ref)
            return v36:FormatByKey("InGame.ConnectionError.ReconnectFailed");
        end);
        if l_status_3 then
            return l_result_3;
        else
            return "Reconnect was unsuccessful. Please try again.";
        end;
    elseif v83 == Enum.ConnectionError.DisconnectLuaKick then
        if not v22() then
            v82 = v82:gsub("%s+", " ");
        end;
        v82 = v82:sub(1, v17);
        local v87 = false;
        local l_v82_0 = v82;
        if v23() then
            if v82 == "" then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 514 ]]
                    -- upvalues: v36 (ref)
                    return v36:FormatByKey("InGame.ConnectionError.DisconnectLuaKick");
                end);
                v87 = l_status_4;
                l_v82_0 = l_result_4;
            else
                local l_status_5, l_result_5 = pcall(function() --[[ Line: 518 ]]
                    -- upvalues: v36 (ref), v82 (ref)
                    return v36:FormatByKey("InGame.ConnectionError.DisconnectLuaKickWithMessage", {
                        RBX_STR = v82
                    });
                end);
                v87 = l_status_5;
                l_v82_0 = l_result_5;
            end;
        else
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 524 ]]
                -- upvalues: v36 (ref), v82 (ref)
                return v36:FormatByKey("InGame.ConnectionError.DisconnectLuaKickWithMessage", {
                    RBX_STR = v82
                });
            end);
            v87 = l_status_6;
            l_v82_0 = l_result_6;
        end;
        if v87 then
            return l_v82_0;
        else
            return v82;
        end;
    else
        local v95 = string.gsub(tostring(v83), "Enum", "InGame");
        if v36 then
            local l_status_7, l_result_7 = pcall(function() --[[ Line: 537 ]]
                -- upvalues: v83 (copy), v36 (ref), v95 (copy)
                if v83 == Enum.ConnectionError.DisconnectIdle then
                    return v36:FormatByKey(v95, {
                        RBX_NUM = tostring(20)
                    });
                else
                    return v36:FormatByKey(v95);
                end;
            end);
            if not l_status_7 and v15 then
                local l_status_8, l_result_8 = pcall(function() --[[ Line: 546 ]]
                    -- upvalues: v36 (ref)
                    return v36:FormatByKey("InGame.ConnectionError.UnknownError");
                end);
                return l_status_8 and l_result_8 or "";
            elseif l_status_7 then
                return l_result_7;
            end;
        end;
        return v82;
    end;
end;
local function v105(v101, v102, v103) --[[ Line: 559 ]] --[[ Name: updateErrorPrompt ]]
    -- upvalues: v81 (copy), l_NONE_0 (ref), v46 (copy), v41 (ref), v75 (copy), v100 (copy), l_pcall_0 (copy)
    local v104 = v81(v103, v102, l_NONE_0);
    if v104 ~= l_NONE_0 then
        if l_NONE_0 == v46.IS_RECONNECTING then
            v41:primaryShimmerStop();
        end;
        l_NONE_0 = v104;
        v75(v104);
    end;
    v101 = if v103 == Enum.ConnectionError.TeleportErrors and l_NONE_0 ~= v46.TELEPORT_FAILED then v100(v101, v102, true) else v100(v101, v102);
    if l_NONE_0 == v46.RECONNECT_DISABLED then
        v101 = l_pcall_0;
    end;
    if v41 then
        v41:onErrorChanged(v101, v102);
    end;
end;
local function v109() --[[ Line: 585 ]] --[[ Name: onErrorMessageChanged ]]
    -- upvalues: l_GuiService_0 (copy), v105 (copy)
    local l_l_GuiService_0_ErrorMessage_0 = l_GuiService_0:GetErrorMessage();
    local l_l_GuiService_0_ErrorCode_0 = l_GuiService_0:GetErrorCode();
    local l_l_GuiService_0_ErrorType_0 = l_GuiService_0:GetErrorType();
    v105(l_l_GuiService_0_ErrorMessage_0, l_l_GuiService_0_ErrorCode_0, l_l_GuiService_0_ErrorType_0);
end;
local function v112() --[[ Line: 592 ]] --[[ Name: onScreenSizeChanged ]]
    -- upvalues: v41 (ref), l_RobloxGui_0 (copy), v21 (copy), l_X_0 (ref), v45 (ref)
    if not v41 then
        return;
    else
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        if v21() then
            local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
            if l_X_0 ~= l_X_1 or v45 ~= l_Y_0 then
                l_X_0 = l_X_1;
                v45 = l_Y_0;
                v41:resizeWidthAndHeight(l_X_0, v45);
                return;
            end;
        elseif l_X_0 ~= l_X_1 then
            l_X_0 = l_X_1;
            v41:resizeWidth(l_X_0);
        end;
        return;
    end;
end;
local function v113() --[[ Line: 612 ]] --[[ Name: onLocaleIdChanged ]]
    -- upvalues: v36 (ref), l_CoreGui_0 (copy), l_LocalizationService_0 (copy)
    v36 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v112);
l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):connect(v113);
v105(l_GuiService_0:GetErrorMessage(), l_GuiService_0:GetErrorCode(), (l_GuiService_0:GetErrorType()));
l_GuiService_0.ErrorMessageChanged:connect(v109);
if v14 then
    local v114 = require(l_RobloxGui_0.Modules.ErrorTestSets);
    for v115, v116 in pairs(v114) do
        for _, v118 in pairs(v116) do
            v105("Should show localized strings, please file a jira ticket for missing translation.", v118, v115);
            wait(2);
            l_NONE_0 = v46.NONE;
        end;
    end;
end;
if l_game_EngineFeature_0 then
    l_GuiService_0.CoreGuiRenderOverflowed:Connect(function() --[[ Line: 640 ]]
        -- upvalues: l_CoreGui_0 (copy)
        for _, v120 in pairs(l_CoreGui_0:GetChildren()) do
            if v120:IsA("ScreenGui") and v120.Name ~= "RobloxPromptGui" then
                v120.Enabled = false;
            end;
        end;
    end);
end;