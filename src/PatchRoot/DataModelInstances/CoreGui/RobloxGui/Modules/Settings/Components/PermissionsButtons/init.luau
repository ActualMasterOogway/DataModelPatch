local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_IXPService_0 = game:GetService("IXPService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.t);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v13 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v14 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v15 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v16 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v17 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
local v18 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local v19 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_ExternalEventConnection_0 = v10.Utility.ExternalEventConnection;
local l_Images_0 = v10.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v23 = require(l_Modules_0.Settings.Components.PermissionButton);
local v24 = require(l_Modules_0.Settings.Components.RecordingIndicator);
local l_default_1 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v26 = require(l_Modules_0.VoiceChat.Constants);
local v27 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFFlagInvertMuteAllPermissionButton);
local v29 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v30 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUpdateSelfieViewOnBan);
local v31 = require(l_RobloxGui_0.Modules.Flags.GetFFlagShowMicConnectingIconAndToast);
local v32 = require(l_RobloxGui_0.Modules.Flags.FFlagMuteNonFriendsEvent);
local v33 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v35 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceUpsell);
local v36 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpJoinVoiceAnalytics);
local v37 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectButtonAnalytics);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPassShouldRequestPermsArg);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v40 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagFixPermissionsButtonsEvents);
local l_GetFStringVoiceUpsellLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVoiceUpsellLayer;
local l_GetFFlagUseMicPermForEnrollment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseMicPermForEnrollment;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagEnableShowVoiceUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShowVoiceUI;
local v45 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceConnectDisconnectButton);
local v46 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local v47 = require(l_RobloxGui_0.Modules.Flags.GetFFlagHideVoiceDisconnectButton);
if v33() then
    v17 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
end;
local v48 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local l_VOICE_JOIN_PROGRESS_0 = v26.VOICE_JOIN_PROGRESS;
local v50 = v9.PureComponent:extend("PermissionsButtons");
local v51 = l_Images_0["icons/controls/video"];
local v52 = l_Images_0["icons/controls/videoOff"];
local v53 = l_Images_0["icons/controls/microphone"];
local v54 = l_Images_0["icons/controls/microphoneMute"];
local v55 = l_Images_0["icons/controls/selfie"];
local v56 = l_Images_0["icons/controls/selfieOff"];
local v57 = l_Images_0["icons/controls/headphone"];
local v58 = l_Images_0["icons/controls/headphoneDeafen"];
local v59 = l_Images_0["icons/controls/publicAudioJoin"];
local v60 = l_Images_0["icons/controls/publicAudioLeave"];
v50.validateProps = v11.strictInterface({
    isPortrait = v11.boolean, 
    isSmallTouchScreen = v11.boolean, 
    isTenFootInterface = v11.boolean, 
    ZIndex = v11.number, 
    LayoutOrder = v11.number, 
    shouldFillScreen = v11.boolean, 
    selfViewOpen = v11.boolean, 
    useNewMenuTheme = v11.boolean, 
    hubRef = v11.any
});
local function v62(v61) --[[ Line: 110 ]] --[[ Name: createDivider ]]
    -- upvalues: v9 (copy)
    return v9.createElement("Frame", {
        LayoutOrder = v61, 
        Size = UDim2.new(0, 2, 0, 24), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.2
    }, {
        UICorner = v9.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    });
end;
v50.init = function(v63) --[[ Line: 123 ]] --[[ Name: init ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), l_default_1 (copy), v29 (copy), l_StarterGui_0 (copy), v16 (copy), l_GetFFlagUseMicPermForEnrollment_0 (copy), v31 (copy), v35 (copy), v38 (copy), v27 (copy), v14 (copy), v18 (copy), v26 (copy), v48 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v17 (ref), v15 (copy), l_default_0 (copy), v13 (copy), v36 (copy), v37 (copy), v45 (copy), v19 (copy), l_AppStorageService_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v46 (copy), l_VOICE_JOIN_PROGRESS_0 (copy)
    local v64 = l_FaceAnimatorService_0 and l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
    local v65 = l_default_1.localMuted ~= nil and (not l_default_1.localMuted or false);
    local v66 = v29 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and (v16() or v63.state.hasMicPermissions or v63.state.hasCameraPermissions);
    v63:setState({
        allPlayersMuted = false, 
        microphoneEnabled = v65, 
        isVoiceConnecting = l_default_1.localMuted == nil, 
        voiceServiceInitialized = false, 
        cameraEnabled = v64, 
        selfViewOpen = v63.props.selfViewOpen, 
        showSelfView = v66, 
        hasCameraPermissions = false, 
        hasMicPermissions = false, 
        isFetchingMicPermissions = l_GetFFlagUseMicPermForEnrollment_0() and true or nil
    });
    if v31() then
        l_default_1:asyncInit():andThen(function() --[[ Line: 154 ]]
            -- upvalues: l_default_1 (ref), v63 (copy), v35 (ref), v38 (ref)
            if l_default_1:getService() then
                v63:setState({
                    voiceServiceInitialized = true
                });
                if v35() and v38() and not v63.state.hasMicPermissions then
                    v63:getMicPermission(false);
                end;
            end;
        end):catch(function() --[[ Line: 173 ]]
            -- upvalues: v27 (ref)
            v27:warning("VoiceChatServiceManager failed to initialize");
        end);
    end;
    v63.selfViewVisibilityUpdatedSignal = v14:connect(function() --[[ Line: 178 ]]
        -- upvalues: v63 (copy), v18 (ref)
        v63:setState({
            selfViewOpen = v18.getSelfViewIsOpenAndVisible()
        });
    end);
    v63.toggleMuteAll = function() --[[ Line: 185 ]]
        -- upvalues: l_default_1 (ref), v63 (copy), v26 (ref)
        if not l_default_1:getService() then
            return;
        else
            local v67 = not v63.state.allPlayersMuted;
            l_default_1:MuteAll(v67, v26.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
            v63:setState({
                allPlayersMuted = v67
            });
            return;
        end;
    end;
    v63.toggleMuteAllIcon = function(v68) --[[ Line: 200 ]]
        -- upvalues: v63 (copy)
        v63:setState({
            allPlayersMuted = v68
        });
    end;
    v63.toggleMic = function() --[[ Line: 208 ]]
        -- upvalues: v31 (ref), v63 (copy), l_default_1 (ref), v48 (ref)
        if v31() and v63.state.isVoiceConnecting then
            l_default_1:ShowVoiceChatLoadingMessage();
            return;
        elseif not l_default_1:getService() then
            return;
        else
            l_default_1:ToggleMic("InGameMenuPermissionsBar");
            v48:setLastCtx("inExperienceEscapeMenu");
            v63:setState({
                microphoneEnabled = not l_default_1.localMuted
            });
            return;
        end;
    end;
    if l_GetFFlagEnableShowVoiceUI_0() then
        v63:setState({
            isVoiceUIVisible = l_default_1.voiceUIVisible ~= nil and l_default_1.voiceUIVisible
        });
        l_default_1.showVoiceUI.Event:Connect(function() --[[ Line: 236 ]]
            -- upvalues: v63 (copy)
            v63:setState({
                isVoiceUIVisible = true
            });
        end);
        l_default_1.hideVoiceUI.Event:Connect(function() --[[ Line: 241 ]]
            -- upvalues: v63 (copy)
            v63:setState({
                isVoiceUIVisible = false
            });
        end);
    end;
    v63.toggleVideo = function() --[[ Line: 249 ]]
        -- upvalues: l_FaceAnimatorService_0 (ref), v48 (ref), v63 (copy)
        if not l_FaceAnimatorService_0 or not l_FaceAnimatorService_0:IsStarted() then
            return;
        else
            l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
            v48:setLastCtx("inExperienceEscapeMenu");
            v63:setState({
                cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
            });
            return;
        end;
    end;
    v63.onVideoButtonPressed = function() --[[ Line: 264 ]]
        -- upvalues: v63 (copy), v17 (ref), v15 (ref), l_default_0 (ref)
        if not v63.state.hasCameraPermissions then
            v15(function(v69) --[[ Line: 267 ]]
                -- upvalues: v63 (ref), v17 (ref)
                v63:setState({
                    hasCameraPermissions = v69.hasCameraPermissions
                });
                if v69.hasCameraPermissions then
                    v63:toggleVideo();
                    return;
                else
                    v17();
                    return;
                end;
            end, {
                l_default_0.Permissions.CAMERA_ACCESS
            });
            return;
        else
            v63:toggleVideo();
            return;
        end;
    end;
    v63.toggleSelfView = function() --[[ Line: 285 ]]
        -- upvalues: v13 (ref), v63 (copy)
        v13:fire();
        v63:setState({
            selfViewOpen = not v63.state.selfViewOpen
        });
    end;
    v63.muteChangedEvent = function(v70) --[[ Line: 292 ]]
        -- upvalues: v63 (copy)
        v63:setState({
            microphoneEnabled = not v70
        });
    end;
    v63.onSelfViewVisibilityUpdated = function() --[[ Line: 298 ]]
        -- upvalues: v63 (copy), v18 (ref)
        v63:setState({
            selfViewOpen = v18.getSelfViewIsOpenAndVisible()
        });
    end;
    v63.onCoreGuiChanged = function() --[[ Line: 304 ]]
        -- upvalues: l_StarterGui_0 (ref), v63 (copy), v29 (ref), v16 (ref)
        if l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) ~= v63.state.showSelfView then
            local v71 = v29 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and (v16() or v63.state.hasMicPermissions or v63.state.hasCameraPermissions);
            v63:setState({
                showSelfView = v71
            });
        end;
    end;
    v63.updateVideoCaptureEnabled = function() --[[ Line: 316 ]]
        -- upvalues: v63 (copy), l_FaceAnimatorService_0 (ref)
        v63:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
    if v31() then
        v63.onVoiceStateChange = function(_, v73) --[[ Line: 323 ]]
            -- upvalues: l_default_1 (ref), v63 (copy)
            if not (l_default_1:GetVoiceStateFromEnum(v73) == l_default_1.VOICE_STATE.CONNECTING) and v63.state.isVoiceConnecting then
                v63:setState({
                    isVoiceConnecting = false
                });
            end;
        end;
    end;
    v63.onJoinVoicePressed = function() --[[ Line: 335 ]]
        -- upvalues: l_default_1 (ref), v36 (ref), v37 (ref), v63 (copy), v45 (ref), v19 (ref), l_AppStorageService_0 (ref), v26 (ref), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (ref)
        local l_showVoiceInExperienceUpsellVariant_0 = l_default_1:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant;
        if v36() and not v37() then
            l_default_1.Analytics:reportJoinVoiceButtonEvent("clicked", v63:GetInExpJoinVoiceAnalyticsData());
        end;
        if v45() and l_default_1.previousGroupId then
            l_default_1:RejoinPreviousChannel();
            l_default_1:showPrompt(v19.JoinVoice);
            l_default_1:ShowVoiceUI();
        elseif v45() and l_default_1.isShowingFTUX then
            l_default_1.hideFTUXSignal:Fire();
            l_default_1:HideFTUX(l_AppStorageService_0);
        elseif v45() and l_default_1:UserVoiceEnabled() then
            l_default_1.attemptVoiceRejoin:Fire();
        elseif l_default_1:UserOnlyEligibleForVoice() then
            l_default_1:SetInExpUpsellEntrypoint(v26.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE);
            if l_showVoiceInExperienceUpsellVariant_0 == nil then
                l_showVoiceInExperienceUpsellVariant_0 = v26.IN_EXP_UPSELL_VARIANT.VARIANT1;
            end;
            local l_l_default_1_InExpUpsellPromptFromEnum_0 = l_default_1:GetInExpUpsellPromptFromEnum(l_showVoiceInExperienceUpsellVariant_0);
            l_default_1:showPrompt(l_l_default_1_InExpUpsellPromptFromEnum_0);
        elseif not v45() and l_default_1:UserVoiceEnabled() and not v63.state.hasMicPermissions then
            l_default_1:showPrompt(v19.Permission);
        elseif l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not l_default_1:UserVoiceEnabled() and l_default_1:FetchPhoneVerificationUpsell(v26.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v26.PHONE_UPSELL_VALUE_PROP.VoiceChat then
            v63.props.hubRef:SetVisibility(false, true);
            l_default_1:ShowInExperiencePhoneVoiceUpsell(v26.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, v26.IN_EXP_PHONE_UPSELL_IXP_LAYER);
        end;
        if v37() and v45() then
            if l_default_1:getService() then
                local v76 = nil;
                v76 = l_default_1:getService().StateChanged:Connect(function(v77, v78) --[[ Line: 394 ]]
                    -- upvalues: l_default_1 (ref), v76 (ref)
                    if v77 ~= v78 then
                        l_default_1.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_1:GetConnectDisconnectButtonAnalyticsData(true));
                        v76:Disconnect();
                    end;
                end);
                return;
            else
                l_default_1.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("clicked", l_default_1:GetConnectDisconnectButtonAnalyticsData(false));
            end;
        end;
    end;
    v63.onLeaveVoicePressed = function() --[[ Line: 412 ]]
        -- upvalues: v37 (ref), l_default_1 (ref), v46 (ref)
        if v37() then
            l_default_1.Analytics:reportLeaveVoiceButtonEvent("clicked", l_default_1:GetConnectDisconnectButtonAnalyticsData(true));
        end;
        l_default_1:Leave();
        if not v46() then
            l_default_1:SetVoiceConnectCookieValue(false);
        end;
    end;
    v63.voiceJoinProgressCallback = function(v79) --[[ Line: 425 ]]
        -- upvalues: l_VOICE_JOIN_PROGRESS_0 (ref), l_default_1 (ref), v26 (ref)
        if v79 == l_VOICE_JOIN_PROGRESS_0.Joined and l_default_1.inExpUpsellEntrypoint == v26.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
            l_default_1:ToggleMic();
        end;
    end;
end;
v50.getPermissions = function(v80) --[[ Line: 438 ]] --[[ Name: getPermissions ]]
    -- upvalues: v15 (copy)
    v15(function(v81) --[[ Line: 439 ]]
        -- upvalues: v80 (copy)
        v80:setState({
            hasCameraPermissions = v81.hasCameraPermissions, 
            hasMicPermissions = v81.hasMicPermissions
        });
    end, nil, nil, "PermissionsButtons.getPermissions");
end;
v50.getMicPermission = function(v82, v83) --[[ Line: 451 ]] --[[ Name: getMicPermission ]]
    -- upvalues: l_GetFFlagUseMicPermForEnrollment_0 (copy), v15 (copy), l_default_0 (copy), v38 (copy)
    v15(function(v84) --[[ Line: 452 ]]
        -- upvalues: v82 (copy), l_GetFFlagUseMicPermForEnrollment_0 (ref)
        v82:setState({
            hasMicPermissions = v84.hasMicPermissions, 
            isFetchingMicPermissions = not l_GetFFlagUseMicPermForEnrollment_0() and nil
        });
    end, {
        l_default_0.Permissions.MICROPHONE_ACCESS
    }, if v38() and v83 ~= nil then not v83 else nil, "PermissionsButtons.getMicPermission");
end;
v50.getCameraPermissionWithoutRequest = function(v85) --[[ Line: 469 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: v15 (copy), l_default_0 (copy)
    v15(function(v86) --[[ Line: 470 ]]
        -- upvalues: v85 (copy)
        v85:setState({
            hasCameraPermissions = v86.hasCameraPermissions
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
end;
v50.getCameraButtonVisibleAtMount = function(_) --[[ Line: 478 ]] --[[ Name: getCameraButtonVisibleAtMount ]]
    -- upvalues: v16 (copy)
    return v16();
end;
v50.getJoinVoiceButtonVisibleAtMount = function(v88) --[[ Line: 482 ]] --[[ Name: getJoinVoiceButtonVisibleAtMount ]]
    -- upvalues: v45 (copy), l_default_1 (copy), l_GetFStringVoiceUpsellLayer_0 (copy), l_IXPService_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v26 (copy)
    if v45() and l_default_1:IsSeamlessVoice() then
        return not v88.state.isVoiceUIVisible or l_default_1.isShowingFTUX;
    else
        local _ = nil;
        if l_default_1:UserVoiceEnabled() then
            if v88.state.isFetchingMicPermissions then
                return false;
            elseif not v88.state.hasMicPermissions then
                local v90 = l_default_1:FetchAgeVerificationOverlay(false);
                if v90 and v90.elegibleToSeeVoiceUpsell then
                    local v91 = l_GetFStringVoiceUpsellLayer_0();
                    if v91 ~= "" then
                        l_IXPService_0:LogUserLayerExposure(v91);
                    end;
                end;
                return (l_default_1:UserInInExperienceUpsellTreatment());
            end;
        end;
        local v92 = l_default_1:UserOnlyEligibleForVoice();
        if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v92 and not l_default_1:UserVoiceEnabled() and l_default_1:FetchPhoneVerificationUpsell(v26.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v26.PHONE_UPSELL_VALUE_PROP.VoiceChat then
            return true;
        elseif not v92 then
            return false;
        else
            return (l_default_1:UserInInExperienceUpsellTreatment());
        end;
    end;
end;
v50.getLeaveVoiceButtonVisibleAtMount = function(v93) --[[ Line: 530 ]] --[[ Name: getLeaveVoiceButtonVisibleAtMount ]]
    -- upvalues: v45 (copy), v47 (copy), l_default_1 (copy)
    if v45() and not v47() and l_default_1:IsSeamlessVoice() then
        return v93.state.isVoiceUIVisible and not l_default_1.isShowingFTUX;
    else
        return false;
    end;
end;
v50.didUpdate = function(v94, _, v96) --[[ Line: 543 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), v29 (copy), l_StarterGui_0 (copy), v16 (copy)
    if v94.state.hasCameraPermissions ~= v96.hasCameraPermissions or v94.state.hasMicPermissions ~= v96.hasMicPermissions or l_GetFFlagEnableShowVoiceUI_0() and v94.state.isVoiceUIVisible ~= v96.isVoiceUIVisible then
        v94:setState({
            showSelfView = v29 and l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView) and (v16() or v94.state.hasMicPermissions or v94.state.hasCameraPermissions)
        });
    end;
end;
v50.didMount = function(v97) --[[ Line: 558 ]] --[[ Name: didMount ]]
    -- upvalues: l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_default_1 (copy)
    v97:getMicPermission(if l_GetFFlagJoinWithoutMicPermissions_0() then not l_default_1:IsSeamlessVoice() else nil);
    v97:getCameraPermissionWithoutRequest();
end;
v50.isShowingPermissionButtons = function(v98) --[[ Line: 565 ]] --[[ Name: isShowingPermissionButtons ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_default_1 (copy), v35 (copy)
    if l_GetFFlagEnableShowVoiceUI_0() and l_GetFFlagJoinWithoutMicPermissions_0() then
        return not (not v98.state.voiceServiceInitialized or l_default_1:VoiceChatEnded()) and v98.state.isVoiceUIVisible or v98.state.hasCameraPermissions or v98.state.showSelfView or v98:getCameraButtonVisibleAtMount() or v35() and v98:getJoinVoiceButtonVisibleAtMount();
    else
        return v98.state.hasMicPermissions or v98.state.hasCameraPermissions or v98.state.showSelfView or v98:getCameraButtonVisibleAtMount() or v35() and v98:getJoinVoiceButtonVisibleAtMount();
    end;
end;
v50.GetInExpJoinVoiceAnalyticsData = function(_) --[[ Line: 585 ]] --[[ Name: GetInExpJoinVoiceAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v100 = "";
    if l_game_EngineFeature_0 then
        v100 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return game.GameId, game.PlaceId, v100;
end;
v50.render = function(v101) --[[ Line: 593 ]] --[[ Name: render ]]
    -- upvalues: v30 (copy), l_default_1 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v35 (copy), v45 (copy), v28 (copy), v31 (copy), v53 (copy), v54 (copy), v40 (copy), v9 (copy), v62 (copy), v23 (copy), v57 (copy), v58 (copy), v59 (copy), v60 (copy), v51 (copy), v52 (copy), v55 (copy), v56 (copy), v24 (copy), l_ExternalEventConnection_0 (copy), l_StarterGui_0 (copy), l_FaceAnimatorService_0 (copy), v32 (copy)
    local l_hasMicPermissions_0 = v101.state.hasMicPermissions;
    if v30() then
        l_hasMicPermissions_0 = v101.state.hasMicPermissions and not l_default_1:VoiceChatEnded();
    end;
    if l_GetFFlagJoinWithoutMicPermissions_0() then
        l_hasMicPermissions_0 = v101.state.voiceServiceInitialized;
    end;
    if l_GetFFlagEnableShowVoiceUI_0() then
        l_hasMicPermissions_0 = l_hasMicPermissions_0 and v101.state.isVoiceUIVisible and not l_default_1.isShowingFTUX;
    end;
    local v103 = v101:getCameraButtonVisibleAtMount();
    local v104 = v35() and v101:getJoinVoiceButtonVisibleAtMount();
    local v105 = v45() and v101:getLeaveVoiceButtonVisibleAtMount();
    local v106 = if v28() then not v101.state.allPlayersMuted else v101.state.allPlayersMuted;
    local v107 = not (not not v101.props.isPortrait or v101.props.isTenFootInterface) and not v101.props.isSmallTouchScreen or v101.props.useNewMenuTheme;
    local v108 = (not v31() or not v101.state.isVoiceConnecting) and l_hasMicPermissions_0;
    local l_v53_0 = v53;
    local v110 = nil;
    if v31() and v101.state.isVoiceConnecting then
        l_v53_0 = l_default_1:GetIcon("Connecting", "New");
        v110 = {
            Size = UDim2.fromOffset(14, 22), 
            Position = UDim2.fromOffset(9, 4)
        };
    elseif not v101.state.microphoneEnabled then
        l_v53_0 = v54;
    end;
    if v40() then
        return (v9.createFragment({
            Frame = v101:isShowingPermissionButtons() and v9.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                ZIndex = v101.props.ZIndex, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(v101.props.shouldFillScreen and 1 or 0, 0, 0, 0), 
                AnchorPoint = if v107 then Vector2.new(0, 0) else Vector2.new(0.5, 0.5), 
                LayoutOrder = v101.props.LayoutOrder, 
                Visible = not v101.props.isTenFootInterface
            }, {
                UIPaddingPermissionsContainer = v9.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v101.props.isSmallTouchScreen and 54 or 74), 
                    PaddingTop = UDim.new(0, 4)
                }), 
                UIListLayout = v9.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v101.props.isSmallTouchScreen and 10 or 24)
                }), 
                Divider1 = v62(1), 
                Container = v9.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromOffset(0, 38), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    LayoutOrder = 2
                }, {
                    UIListLayoutPermissionsContainer = v9.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v101.props.isSmallTouchScreen and 10 or 24)
                    }), 
                    if v30() then l_hasMicPermissions_0 and v9.createElement(v23, {
                        LayoutOrder = v45() and 2 or 1, 
                        image = if v106 then v57 else v58, 
                        callback = v101.toggleMuteAll, 
                        useNewMenuTheme = v101.props.useNewMenuTheme
                    }) else v9.createElement(v23, {
                        LayoutOrder = v45() and 2 or 1, 
                        image = if v106 then v57 else v58, 
                        callback = v101.toggleMuteAll, 
                        useNewMenuTheme = v101.props.useNewMenuTheme
                    }), 
                    JoinVoiceButton = v104 and v9.createElement(v23, {
                        LayoutOrder = 2, 
                        image = v59, 
                        callback = v101.onJoinVoicePressed, 
                        useNewMenuTheme = v101.props.useNewMenuTheme
                    }), 
                    LeaveVoiceButton = v105 and v9.createElement(v23, {
                        LayoutOrder = 1, 
                        image = v60, 
                        callback = v101.onLeaveVoicePressed, 
                        useNewMenuTheme = v101.props.useNewMenuTheme
                    }), 
                    ToggleMicButton = l_hasMicPermissions_0 and v9.createElement(v23, {
                        LayoutOrder = v35() and 3 or 2, 
                        image = l_v53_0, 
                        callback = v101.toggleMic, 
                        useNewMenuTheme = v101.props.useNewMenuTheme, 
                        imageLabelProps = v110
                    }), 
                    EnableVideoButton = v103 and v9.createElement(v23, {
                        LayoutOrder = v35() and 4 or 3, 
                        image = if v101.state.cameraEnabled then v51 else v52, 
                        callback = v101.onVideoButtonPressed, 
                        useNewMenuTheme = v101.props.useNewMenuTheme
                    }), 
                    EnableSelfViewButton = v101.state.showSelfView and v9.createElement(v23, {
                        LayoutOrder = v35() and 5 or 4, 
                        image = if v101.state.selfViewOpen then v55 else v56, 
                        callback = v101.toggleSelfView, 
                        useNewMenuTheme = v101.props.useNewMenuTheme
                    })
                }), 
                Divider2 = v62(5), 
                RecordingIndicator = v108 and v9.createElement(v24, {
                    micOn = v101.state.microphoneEnabled, 
                    hasMicPermissions = v101.state.hasMicPermissions, 
                    isSmallTouchScreen = v101.props.isSmallTouchScreen
                })
            }), 
            Events = v9.createFragment({
                MuteChangedEvent = v9.createElement(l_ExternalEventConnection_0, {
                    event = l_default_1.muteChanged.Event, 
                    callback = v101.muteChangedEvent
                }), 
                SelfViewChangedEvent = v9.createElement(l_ExternalEventConnection_0, {
                    event = l_StarterGui_0.CoreGuiChangedSignal, 
                    callback = v101.onCoreGuiChanged
                }), 
                MuteAllChangedEvent = v9.createElement(l_ExternalEventConnection_0, {
                    event = l_default_1.muteAllChanged.Event, 
                    callback = v101.toggleMuteAllIcon
                }), 
                VideoCaptureEnabledEvent = v9.createElement(l_ExternalEventConnection_0, {
                    event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
                    callback = v101.updateVideoCaptureEnabled
                }), 
                VoiceStateChangeEvent = if v31() and v101.state.voiceServiceInitialized then v9.createElement(l_ExternalEventConnection_0, {
                    event = l_default_1:getService().StateChanged, 
                    callback = v101.onVoiceStateChange
                }) else nil, 
                MuteNonFriendsEvent = if v32 then v9.createElement(l_ExternalEventConnection_0, {
                    event = l_default_1.mutedNonFriends.Event, 
                    callback = function() --[[ Line: 755 ]] --[[ Name: callback ]]
                        -- upvalues: v101 (copy)
                        v101.toggleMuteAllIcon(false);
                    end
                }) else nil, 
                VoiceJoinProgressChanged = if v35() then v9.createElement(l_ExternalEventConnection_0, {
                    event = l_default_1.VoiceJoinProgressChanged.Event, 
                    callback = v101.voiceJoinProgressCallback
                }) else nil
            })
        }));
    else
        return v101:isShowingPermissionButtons() and v9.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            ZIndex = v101.props.ZIndex, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(v101.props.shouldFillScreen and 1 or 0, 0, 0, 0), 
            AnchorPoint = if v107 then Vector2.new(0, 0) else Vector2.new(0.5, 0.5), 
            LayoutOrder = v101.props.LayoutOrder, 
            Visible = not v101.props.isTenFootInterface
        }, {
            UIPaddingPermissionsContainer = v9.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v101.props.isSmallTouchScreen and 54 or 74), 
                PaddingTop = UDim.new(0, 4)
            }), 
            UIListLayout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v101.props.isSmallTouchScreen and 10 or 24)
            }), 
            Divider1 = v62(1), 
            Container = v9.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.fromOffset(0, 38), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                LayoutOrder = 2
            }, {
                UIListLayoutPermissionsContainer = v9.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v101.props.isSmallTouchScreen and 10 or 24)
                }), 
                if v30() then l_hasMicPermissions_0 and v9.createElement(v23, {
                    LayoutOrder = 1, 
                    image = if v106 then v57 else v58, 
                    callback = v101.toggleMuteAll, 
                    useNewMenuTheme = v101.props.useNewMenuTheme
                }) else v9.createElement(v23, {
                    LayoutOrder = 1, 
                    image = if v106 then v57 else v58, 
                    callback = v101.toggleMuteAll, 
                    useNewMenuTheme = v101.props.useNewMenuTheme
                }), 
                JoinVoiceButton = v104 and v9.createElement(v23, {
                    LayoutOrder = 2, 
                    image = v59, 
                    callback = v101.onJoinVoicePressed, 
                    useNewMenuTheme = v101.props.useNewMenuTheme
                }), 
                ToggleMicButton = l_hasMicPermissions_0 and v9.createElement(v23, {
                    LayoutOrder = v35() and 3 or 2, 
                    image = l_v53_0, 
                    callback = v101.toggleMic, 
                    useNewMenuTheme = v101.props.useNewMenuTheme, 
                    imageLabelProps = v110
                }), 
                EnableVideoButton = v103 and v9.createElement(v23, {
                    LayoutOrder = v35() and 4 or 3, 
                    image = if v101.state.cameraEnabled then v51 else v52, 
                    callback = v101.onVideoButtonPressed, 
                    useNewMenuTheme = v101.props.useNewMenuTheme
                }), 
                EnableSelfViewButton = v101.state.showSelfView and v9.createElement(v23, {
                    LayoutOrder = v35() and 5 or 4, 
                    image = if v101.state.selfViewOpen then v55 else v56, 
                    callback = v101.toggleSelfView, 
                    useNewMenuTheme = v101.props.useNewMenuTheme
                })
            }), 
            Divider2 = v62(5), 
            RecordingIndicator = v108 and v9.createElement(v24, {
                micOn = v101.state.microphoneEnabled, 
                hasMicPermissions = v101.state.hasMicPermissions, 
                isSmallTouchScreen = v101.props.isSmallTouchScreen
            }), 
            MuteChangedEvent = v9.createElement(l_ExternalEventConnection_0, {
                event = l_default_1.muteChanged.Event, 
                callback = v101.muteChangedEvent
            }), 
            SelfViewChangedEvent = v9.createElement(l_ExternalEventConnection_0, {
                event = l_StarterGui_0.CoreGuiChangedSignal, 
                callback = v101.onCoreGuiChanged
            }), 
            MuteAllChangedEvent = v9.createElement(l_ExternalEventConnection_0, {
                event = l_default_1.muteAllChanged.Event, 
                callback = v101.toggleMuteAllIcon
            }), 
            VideoCaptureEnabledEvent = v9.createElement(l_ExternalEventConnection_0, {
                event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
                callback = v101.updateVideoCaptureEnabled
            }), 
            VoiceStateChangeEvent = if v31() and v101.state.voiceServiceInitialized then v9.createElement(l_ExternalEventConnection_0, {
                event = l_default_1:getService().StateChanged, 
                callback = v101.onVoiceStateChange
            }) else nil, 
            MuteNonFriendsEvent = if v32 then v9.createElement(l_ExternalEventConnection_0, {
                event = l_default_1.mutedNonFriends.Event, 
                callback = function() --[[ Line: 879 ]] --[[ Name: callback ]]
                    -- upvalues: v101 (copy)
                    v101.toggleMuteAllIcon(false);
                end
            }) else nil, 
            VoiceJoinProgressChanged = if v35() then v9.createElement(l_ExternalEventConnection_0, {
                event = l_default_1.VoiceJoinProgressChanged.Event, 
                callback = v101.voiceJoinProgressCallback
            }) else nil
        });
    end;
end;
v50.willUnmount = function(v111) --[[ Line: 893 ]] --[[ Name: willUnmount ]]
    if v111.selfViewVisibilityUpdatedSignal then
        v111.selfViewVisibilityUpdatedSignal:disconnect();
        v111.selfViewVisibilityUpdatedSignal = nil;
    end;
end;
return v50;