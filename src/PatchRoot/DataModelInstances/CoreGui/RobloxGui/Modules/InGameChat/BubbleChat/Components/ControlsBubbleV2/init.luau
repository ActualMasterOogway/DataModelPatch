local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_ExternalEventConnection_0 = v7.Utility.ExternalEventConnection;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(script.Parent.ControlBubbleV2);
local l_default_1 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v14 = require(l_Modules_0.InGameChat.BubbleChat.Constants);
local v15 = require(l_Modules_0.SelfView.publicApi);
local v16 = require(l_Modules_0.SelfView.toggleSelfViewSignal);
local v17 = require(l_Modules_0.SelfView.Analytics).new();
local l_GetFFlagLocalMutedNilFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix;
local v19 = require(l_Modules_0.VoiceChat.Constants);
local v20 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v21 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v22 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
local v23 = require(l_RobloxGui_0.Modules.Settings.isCameraOnlyUser);
local v24 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v25 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v26 = require(l_RobloxGui_0.Modules.Flags.getFFlagLegacyConnectingMicStateFix);
local l_AVATAR_CHAT_UI_SETTINGS_0 = v14.AVATAR_CHAT_UI_SETTINGS;
local v28 = v4.PureComponent:extend("ControlsBubble");
v28.validateProps = v6.strictInterface({
    chatSettings = v6.table, 
    isInsideMaximizeDistance = v6.boolean, 
    isLocalPlayer = v6.boolean, 
    LayoutOrder = v6.optional(v6.number), 
    hasCameraPermissions = v6.boolean, 
    hasMicPermissions = v6.boolean, 
    isShowingDueToEasierUnmuting = v6.optional(v6.boolean)
});
v28.defaultProps = {
    LayoutOrder = 1
};
v28.init = function(v29) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), l_default_1 (copy), v14 (copy), v17 (copy), v19 (copy), v24 (copy), v22 (copy), v20 (copy), l_default_0 (copy), v15 (copy), v16 (copy)
    local v30 = if l_FaceAnimatorService_0 then l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled else false;
    v29:setState({
        microphoneEnabled = if l_GetFFlagLocalMutedNilFix_0 then l_default_1.localMuted == false else not l_default_1.localMuted, 
        cameraEnabled = v30
    });
    v29.toggleMic = function() --[[ Line: 76 ]]
        -- upvalues: v29 (copy), v14 (ref), l_default_1 (ref), v17 (ref), v19 (ref)
        if v29.props.isLocalPlayer then
            if not v29.props.hasMicPermissions then
                return;
            elseif v29.props.voiceState == v14.VOICE_STATE.ERROR then
                l_default_1:RejoinPreviousChannel();
                return;
            elseif v29.props.voiceState == v14.VOICE_STATE.CONNECTING then
                l_default_1:ShowVoiceChatLoadingMessage();
                return;
            else
                v17:setLastCtx("bubbleChatToggle");
                l_default_1:ToggleMic("LegacyBubbleChatToggle");
                v29:setState({
                    microphoneEnabled = not l_default_1.localMuted
                });
                return;
            end;
        else
            l_default_1:ToggleMutePlayer(tonumber(v29.props.userId), if v29.props.isShowingDueToEasierUnmuting then v19.VOICE_CONTEXT_TYPE.EASIER_UNMUTING else v19.VOICE_CONTEXT_TYPE.BUBBLE_CHAT);
            return;
        end;
    end;
    v29.updateVideo = function() --[[ Line: 105 ]]
        -- upvalues: v29 (copy), l_FaceAnimatorService_0 (ref)
        v29:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
    v29.onVideoButtonPressed = function() --[[ Line: 112 ]]
        -- upvalues: v24 (ref), v29 (copy), v22 (ref), v20 (ref), l_default_0 (ref)
        if v24() and not v29.props.hasCameraPermissions then
            v20(function(v31) --[[ Line: 115 ]]
                -- upvalues: v29 (ref), v22 (ref)
                if v31.hasCameraPermissions then
                    v29:toggleVideo();
                    v29.props.setCameraPermissionStateFromControl(v31.hasCameraPermissions);
                    return;
                else
                    v22();
                    return;
                end;
            end, {
                l_default_0.Permissions.CAMERA_ACCESS
            });
            return;
        else
            v29:toggleVideo();
            return;
        end;
    end;
    v29.toggleVideo = function() --[[ Line: 131 ]]
        -- upvalues: v24 (ref), v29 (copy), l_FaceAnimatorService_0 (ref), v17 (ref), v15 (ref), v16 (ref)
        if not v24() and not v29.props.hasCameraPermissions then
            return;
        elseif not l_FaceAnimatorService_0 or not l_FaceAnimatorService_0:IsStarted() then
            return;
        else
            l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
            v17:setLastCtx("bubbleChatToggle");
            v29:setState({
                cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
            });
            local v32 = v15.getSelfViewIsOpenAndVisible();
            if l_FaceAnimatorService_0.VideoAnimationEnabled and not v32 then
                v16:fire();
            end;
            return;
        end;
    end;
    v29.muteChangedEvent = function(v33) --[[ Line: 156 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            microphoneEnabled = not v33
        });
    end;
end;
v28.shouldShowCameraIndicator = function(v34) --[[ Line: 165 ]] --[[ Name: shouldShowCameraIndicator ]]
    if v34.props.isLocalPlayer and v34:getCameraButtonVisibleAtMount() then
        return true;
    else
        return false;
    end;
end;
v28.shouldShowMicOffIndicator = function(v35) --[[ Line: 173 ]] --[[ Name: shouldShowMicOffIndicator ]]
    -- upvalues: v26 (copy), v14 (copy)
    if v35.props.isLocalPlayer then
        local v36 = nil;
        v36 = if v26() then not v35.props.hasMicPermissions else not (v35.state.microphoneEnabled and v35.props.hasMicPermissions);
        local v37 = true;
        if v35.props.voiceState ~= v14.VOICE_STATE.MUTED then
            v37 = v35.props.voiceState == v14.VOICE_STATE.LOCAL_MUTED;
        end;
        if v36 or v37 then
            return true;
        end;
    end;
    return false;
end;
v28.getCameraButtonVisibleAtMount = function(_) --[[ Line: 194 ]] --[[ Name: getCameraButtonVisibleAtMount ]]
    -- upvalues: v25 (copy), v23 (copy), v21 (copy)
    if v25() and v23() then
        return false;
    else
        return v21();
    end;
end;
v28.render = function(v39) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: l_AVATAR_CHAT_UI_SETTINGS_0 (copy), v24 (copy), v4 (copy), v12 (copy), l_HttpService_0 (copy), l_ExternalEventConnection_0 (copy), l_default_1 (copy), l_FaceAnimatorService_0 (copy)
    local v40 = v39.props.hasMicPermissions and v39.props.voiceEnabled;
    local v41 = v39:shouldShowCameraIndicator();
    local v42 = v39:shouldShowMicOffIndicator();
    local v43 = v41 and v40;
    local l_chatSettings_0 = v39.props.chatSettings;
    local v45 = v43 and l_AVATAR_CHAT_UI_SETTINGS_0.DoubleIconCornerRadiusOffset or l_AVATAR_CHAT_UI_SETTINGS_0.SingleIconCornerRadiusOffset;
    local v46 = v43 and l_AVATAR_CHAT_UI_SETTINGS_0.DoubleIconButtonSize or l_AVATAR_CHAT_UI_SETTINGS_0.SingleIconButtonSize;
    local v47 = v39.props.isLocalPlayer and "microphone" or "speaker";
    local v48 = v39.state.cameraEnabled and v39.props.hasCameraPermissions and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    if v24() then
        v48 = v39.state.cameraEnabled and v39:getCameraButtonVisibleAtMount() and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    end;
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_AVATAR_CHAT_UI_SETTINGS_0.FrameHeight), 
        LayoutOrder = v39.props.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        Visible = v40 or v41
    }, {
        Scale = v4.createElement("UIScale", {
            Scale = not v39.props.isInsideMaximizeDistance and 0.75 or 1
        }), 
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v45)
        }), 
        Container = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            UICorner = l_chatSettings_0.CornerEnabled and v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v45)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MicrophoneBubble = v40 and v4.createElement(v12, {
                LayoutOrder = 1, 
                onActivated = v39.toggleMic, 
                chatSettings = l_chatSettings_0, 
                controlBubbleSize = v46, 
                cornerRadiusOffset = v45, 
                iconAssetName = v42 and "icons/controls/voice/microphone_off_light" or nil, 
                iconSize = l_AVATAR_CHAT_UI_SETTINGS_0.IconSize, 
                iconTransparency = l_AVATAR_CHAT_UI_SETTINGS_0.IconTransparency, 
                voiceState = v39.props.voiceState, 
                renderStepName = l_HttpService_0:GenerateGUID(), 
                iconStyle = v47
            }), 
            Divider = v40 and v41 and v4.createElement("Frame", {
                Size = l_AVATAR_CHAT_UI_SETTINGS_0.DividerSize, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                ZIndex = 1, 
                BackgroundColor3 = l_AVATAR_CHAT_UI_SETTINGS_0.DividerColor
            }), 
            CameraBubble = v41 and v4.createElement(v12, {
                LayoutOrder = 3, 
                onActivated = v24() and v39.onVideoButtonPressed or v39.toggleVideo, 
                chatSettings = l_chatSettings_0, 
                cornerRadiusOffset = v45, 
                controlBubbleSize = v46, 
                iconAssetName = v48, 
                iconSize = l_AVATAR_CHAT_UI_SETTINGS_0.IconSize, 
                iconTransparency = l_AVATAR_CHAT_UI_SETTINGS_0.IconTransparency, 
                iconStyle = v47
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v4.createElement("ImageLabel", {
            LayoutOrder = 3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = l_chatSettings_0.BackgroundTransparency
        }), 
        MuteChangedEvent = v4.createElement(l_ExternalEventConnection_0, {
            event = l_default_1.muteChanged.Event, 
            callback = v39.muteChangedEvent
        }), 
        VideoEnabledChanged = l_FaceAnimatorService_0 and v4.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v39.updateVideo
        }) or nil
    });
end;
return v5.connect(function(v49, v50) --[[ Line: 312 ]] --[[ Name: mapStateToProps ]]
    return {
        voiceState = v49.voiceState[v50.userId]
    };
end)(v28);