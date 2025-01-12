local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v8 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v9 = require(l_CorePackages_0.Packages.Promise);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v12 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v14 = require(l_CoreGui_0.RobloxGui.Modules.SelfieView.Flags.GetFFlagSelfieViewEnabled);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v16 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v17 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local l_GetFFlagGetRawMicrophonePermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetRawMicrophonePermissions;
local v20 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
local v21 = game:DefineFastFlag("CheckCameraAvailabilityBeforePermissions", false);
local v22 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v23 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v24 = nil;
local v25 = nil;
local v26 = {};
local v27 = false;
local function v32(v28, v29, v30) --[[ Line: 78 ]] --[[ Name: removePermissionsBasedOnUserSetting ]]
    -- upvalues: v5 (copy), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v22 (copy), v21 (copy), l_VideoCaptureService_0 (copy)
    if not v28.isCameraEnabled and v5.List.find(v29, l_default_0.Permissions.CAMERA_ACCESS) then
        v29 = v5.List.removeValue(v29, l_default_0.Permissions.CAMERA_ACCESS);
    end;
    if l_GetFFlagJoinWithoutMicPermissions_0() then
        if not v28.isVoiceEnabled and v5.List.find(v29, l_default_0.Permissions.MICROPHONE_ACCESS) or v30 == nil then
            v29 = v5.List.removeValue(v29, l_default_0.Permissions.MICROPHONE_ACCESS);
        end;
    elseif not v28.isVoiceEnabled and v5.List.find(v29, l_default_0.Permissions.MICROPHONE_ACCESS) then
        v29 = v5.List.removeValue(v29, l_default_0.Permissions.MICROPHONE_ACCESS);
    end;
    if v22 and v5.List.find(v29, l_default_0.Permissions.MICROPHONE_ACCESS) then
        v29 = v5.List.removeValue(v29, l_default_0.Permissions.MICROPHONE_ACCESS);
    end;
    if v21 and v5.List.find(v29, l_default_0.Permissions.CAMERA_ACCESS) then
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        if v5.isEmpty(l_l_VideoCaptureService_0_CameraDevices_0) then
            v29 = v5.List.removeValue(v29, l_default_0.Permissions.CAMERA_ACCESS);
        end;
    end;
    return v29;
end;
local function v60(v33, v34, v35, v36, v37, v38) --[[ Line: 132 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v13 (copy), v14 (copy), v5 (copy), l_default_0 (copy), v32 (copy), v27 (ref), v9 (copy), v20 (copy), v8 (copy), v24 (ref), v25 (ref), v7 (copy), v17 (copy), l_RunService_0 (copy), l_RbxAnalyticsService_0 (copy), v16 (copy), v11 (copy), v12 (copy)
    local v39 = true;
    local v40 = true;
    if v13 or v14() then
        v39 = v5.List.find(v36, l_default_0.Permissions.CAMERA_ACCESS) ~= nil;
        v40 = v5.List.find(v36, l_default_0.Permissions.MICROPHONE_ACCESS) ~= nil;
    end;
    local v41 = v32(v33, v36, v37);
    local v42 = v5.List.find(v41, l_default_0.Permissions.CAMERA_ACCESS) ~= nil;
    local v43 = v5.List.find(v41, l_default_0.Permissions.MICROPHONE_ACCESS) ~= nil;
    if not v41 or #v41 <= 0 then
        v34({
            hasCameraPermissions = false, 
            hasMicPermissions = false
        });
        v27 = false;
        v35();
        return;
    elseif v37 == true then
        return v9.new(function(v44, _) --[[ Line: 166 ]]
            -- upvalues: v41 (copy), l_default_0 (ref), v34 (copy), v27 (ref), v35 (copy)
            local v46 = {};
            for _, v48 in ipairs(v41) do
                local v49, v50 = l_default_0:hasPermissions({
                    v48
                }):await();
                if v49 then
                    v46[v48] = v50.status == l_default_0.Status.AUTHORIZED;
                else
                    v46[v48] = false;
                end;
            end;
            local v51 = {
                hasCameraPermissions = v46[l_default_0.Permissions.CAMERA_ACCESS] or false, 
                hasMicPermissions = v46[l_default_0.Permissions.MICROPHONE_ACCESS] or false
            };
            v34(v51);
            v27 = false;
            v35();
            v44(v46);
        end);
    else
        return l_default_0:hasPermissions(v41):andThen(function(v52) --[[ Line: 194 ]]
            -- upvalues: l_default_0 (ref), v42 (copy), v43 (copy), v34 (copy), v27 (ref), v35 (copy), v20 (ref), v38 (copy), v8 (ref), v41 (copy), v5 (ref), v24 (ref), v39 (ref), v25 (ref), v40 (ref), v7 (ref), v17 (ref), l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v16 (ref), v11 (ref), v12 (ref)
            if v52.status == l_default_0.Status.AUTHORIZED then
                local v53 = {
                    hasCameraPermissions = v42, 
                    hasMicPermissions = v43
                };
                v34(v53);
                v27 = false;
                v35();
                return v52;
            else
                if v20() and v43 and v38 then
                    v8:logPromptImpression({
                        didAuthorize = false, 
                        uiContext = v38
                    });
                end;
                return l_default_0:requestPermissions(v41):andThen(function(v54) --[[ Line: 214 ]]
                    -- upvalues: v42 (ref), l_default_0 (ref), v5 (ref), v43 (ref), v24 (ref), v39 (ref), v25 (ref), v40 (ref), v7 (ref), v17 (ref), l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v20 (ref), v38 (ref), v8 (ref), v16 (ref), v11 (ref), v12 (ref), v34 (ref), v27 (ref), v35 (ref)
                    if typeof(v54) == "table" then
                        local v55 = v42 and (v54.status == l_default_0.Status.AUTHORIZED or not v5.List.find(v54.missingPermissions, l_default_0.Permissions.CAMERA_ACCESS));
                        local v56 = v43 and (v54.status == l_default_0.Status.AUTHORIZED or not v5.List.find(v54.missingPermissions, l_default_0.Permissions.MICROPHONE_ACCESS));
                        v24 = if v39 then v55 else nil;
                        v25 = if v40 then v56 else nil;
                        if v24 then
                            v7:fire();
                        end;
                    elseif v54 == l_default_0.Status.AUTHORIZED then
                        v7:fire();
                        v24 = v42;
                        v25 = v43;
                    else
                        v24 = false;
                        v25 = false;
                    end;
                    local v57 = {
                        hasCameraPermissions = v24 or false, 
                        hasMicPermissions = v25 or false
                    };
                    if v17() and v42 then
                        local v58 = v24 or false;
                        local v59 = l_RunService_0:IsStudio() and "studio" or "client";
                        l_RbxAnalyticsService_0:SendEventDeferred(v59, "avatarChat", "CameraDevicePermissionPrompted", {
                            didAuthorize = v58
                        });
                    end;
                    if v20() and v43 and v38 then
                        v8:logPromptInteraction({
                            didAuthorize = v25, 
                            uiContext = v38
                        });
                    end;
                    if v42 and not v24 and not v16() then
                        v11:showPrompt(v12.VideoNoPermission);
                    end;
                    v34(v57);
                    v27 = false;
                    v35();
                    return v54;
                end);
            end;
        end);
    end;
end;
local function v65(v61) --[[ Line: 300 ]] --[[ Name: tryGetCachedResults ]]
    -- upvalues: v22 (copy), v25 (ref), v24 (ref), l_default_0 (copy)
    if v22 then
        v25 = true;
    end;
    if v24 == nil or v25 == nil then
        return nil;
    else
        local v62 = false;
        for _, v64 in v61 do
            if v64 ~= l_default_0.Permissions.MICROPHONE_ACCESS and v64 ~= l_default_0.Permissions.CAMERA_ACCESS then
                v62 = true;
            end;
        end;
        if v62 then
            return nil;
        else
            return {
                hasCameraPermissions = v24 or false, 
                hasMicPermissions = v25 or false
            };
        end;
    end;
end;
local function v66(v67, v68, v69, v70, v71) --[[ Line: 332 ]] --[[ Name: getCamMicPermissions ]]
    -- upvalues: l_default_0 (copy), v26 (copy), v66 (copy), v13 (copy), v14 (copy), l_GetFFlagGetRawMicrophonePermissions_0 (copy), v65 (copy), v27 (ref), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v9 (copy), v23 (copy), v60 (copy)
    local v72 = {};
    v72 = v68 or {
        l_default_0.Permissions.MICROPHONE_ACCESS, 
        l_default_0.Permissions.CAMERA_ACCESS
    };
    local function v74() --[[ Line: 350 ]] --[[ Name: invokeNextRequest ]]
        -- upvalues: v26 (ref), v66 (ref)
        if v26[1] then
            local v73 = v26[1];
            table.remove(v26, 1);
            v66(v73.callback, v73.permissionsToRequest, v73.shouldNotRequestPerms, v73.context, v73.getRawPermission);
        end;
    end;
    if (v13 or v14()) and (not l_GetFFlagGetRawMicrophonePermissions_0() or not v71) then
        local v75 = v65(v72);
        if v75 then
            v67(v75);
            if v26[1] then
                local v76 = v26[1];
                table.remove(v26, 1);
                v66(v76.callback, v76.permissionsToRequest, v76.shouldNotRequestPerms, v76.context, v76.getRawPermission);
            end;
            return;
        end;
    end;
    if v27 then
        table.insert(v26, {
            callback = v67, 
            permissionsToRequest = v68, 
            shouldNotRequestPerms = v69, 
            context = v70, 
            getRawPermission = v71
        });
        return;
    else
        v27 = true;
        if l_GetFFlagGetRawMicrophonePermissions_0() and v71 then
            return l_default_0:hasPermissions(v72):andThen(function(v77) --[[ Line: 392 ]]
                -- upvalues: v67 (copy), v27 (ref), v26 (ref), v66 (ref)
                v67(v77);
                v27 = false;
                if v26[1] then
                    local v78 = v26[1];
                    table.remove(v26, 1);
                    v66(v78.callback, v78.permissionsToRequest, v78.shouldNotRequestPerms, v78.context, v78.getRawPermission);
                end;
            end);
        elseif (v13 or v14()) and l_GetFFlagAvatarChatServiceEnabled_0() then
            return v9.new(function(v79, _) --[[ Line: 401 ]]
                -- upvalues: v23 (ref)
                if v23.ClientFeaturesInitialized then
                    v79({
                        isVoiceEnabled = v23:IsEnabled(v23.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio), 
                        isCameraEnabled = v23:IsEnabled(v23.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
                    });
                    return;
                else
                    local v81 = nil;
                    v81 = v23:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 417 ]]
                        -- upvalues: v81 (ref), v23 (ref), v79 (copy)
                        v81:Disconnect();
                        local v82 = {
                            isVoiceEnabled = v23:IsEnabled(v23.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio), 
                            isCameraEnabled = v23:IsEnabled(v23.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
                        };
                        v79(v82);
                    end);
                    return;
                end;
            end):andThen(function(v83) --[[ Line: 432 ]]
                -- upvalues: v60 (ref), v67 (copy), v74 (copy), v72 (ref), v69 (copy), v70 (copy)
                v60(v83, v67, v74, v72, v69, v70);
            end);
        else
            return v9.new(function(v84, _) --[[ Line: 445 ]]
                v84({
                    isVoiceEnabled = false, 
                    isCameraEnabled = false
                });
            end);
        end;
    end;
end;
return v66;