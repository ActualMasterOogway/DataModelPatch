local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_ExternalEventConnection_0 = v6.Utility.ExternalEventConnection;
local v9 = require(l_script_FirstAncestor_0.Config);
local l_AvatarChatUISettings_0 = v9.AvatarChatUISettings;
local l_Permissions_0 = v9.Permissions;
local v12 = require(l_script_FirstAncestor_0.GlobalFlags);
local v13 = require(script.Parent.ControlBubble);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagVoiceTCSBubbleClickState);
local v15 = require(l_script_FirstAncestor_0.Flags.GetFFlagExpChatEnableVoiceReverseNudge);
local v16 = game:DefineFastFlag("PreventMicToggleIfGameConsumedEvent", false);
local v17 = v4.PureComponent:extend("PlayerButtons");
v17.defaultProps = {
    LayoutOrder = 1
};
v17.init = function(v18) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: l_FaceAnimatorService_0 (copy), v16 (copy), v14 (copy), v12 (copy), l_Permissions_0 (copy)
    v18:setState({
        cameraEnabled = if l_FaceAnimatorService_0 then l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled else false
    });
    v18.toggleMic = function(v19) --[[ Line: 47 ]]
        -- upvalues: v16 (ref), v14 (ref), v18 (copy)
        if v16 and v19 then
            return;
        elseif v14() then
            v18.props.onClickedVoiceIndicator(v18.props.userId, v18.props.voiceState);
            return;
        else
            v18.props.onClickedVoiceIndicator(v18.props.userId);
            return;
        end;
    end;
    v18.onVideoButtonPressed = function() --[[ Line: 59 ]]
        -- upvalues: v12 (ref), v18 (copy), l_Permissions_0 (ref)
        if v12.DoNotPromptCameraPermissionsOnMount and not v18.props.hasCameraPermissions then
            local function v22(v20, _) --[[ Line: 62 ]]
                -- upvalues: v18 (ref)
                if v20 then
                    v18:toggleVideo();
                    if v18.props.setCameraPermissionStateFromControl then
                        v18.props.setCameraPermissionStateFromControl(v20);
                        return;
                    end;
                elseif v18.props.displayCameraDeniedToast then
                    v18.props.displayCameraDeniedToast();
                end;
            end;
            if v18.props.getPermissions then
                v18.props.getPermissions(v22, l_Permissions_0.CAMERA_ACCESS);
                return;
            end;
        else
            v18:toggleVideo();
        end;
    end;
    v18.toggleVideo = function() --[[ Line: 84 ]]
        -- upvalues: v18 (copy)
        v18.props.onClickedCameraIndicator();
    end;
    v18.updateVideo = function() --[[ Line: 88 ]]
        -- upvalues: v18 (copy), l_FaceAnimatorService_0 (ref)
        v18:setState({
            cameraEnabled = l_FaceAnimatorService_0.VideoAnimationEnabled
        });
    end;
end;
v17.shouldShowCameraIndicator = function(v23) --[[ Line: 95 ]] --[[ Name: shouldShowCameraIndicator ]]
    return v23.props.isLocalPlayer and v23:getCameraButtonVisibleAtMount();
end;
v17.shouldShowMicOffIndicator = function(v24) --[[ Line: 99 ]] --[[ Name: shouldShowMicOffIndicator ]]
    -- upvalues: v12 (copy)
    if v24.props.isLocalPlayer then
        local v25 = true;
        if v24.props.voiceState ~= "Muted" then
            v25 = v24.props.voiceState == "LOCAL_MUTED";
        end;
        if v12.JoinWithoutMicPermissions then
            return v25;
        else
            return v25 or not v24.props.hasMicPermissions;
        end;
    else
        return false;
    end;
end;
v17.getCameraButtonVisibleAtMount = function(v26) --[[ Line: 112 ]] --[[ Name: getCameraButtonVisibleAtMount ]]
    -- upvalues: v12 (copy)
    if v12.EnableAlwaysAvailableCamera and v26.props.isCameraOnlyUser and v26.props.isCameraOnlyUser() then
        return false;
    elseif v26.props.isCamEnabledForUserAndPlace then
        return v26.props.isCamEnabledForUserAndPlace();
    else
        return false;
    end;
end;
v17.render = function(v27) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_AvatarChatUISettings_0 (copy), v4 (copy), l_Dictionary_0 (copy), v13 (copy), l_HttpService_0 (copy), l_FaceAnimatorService_0 (copy), l_ExternalEventConnection_0 (copy)
    local v28 = v27.props.hasMicPermissions or v27.props.voiceEnabled;
    if v12.JoinWithoutMicPermissions then
        v28 = v27.props.voiceEnabled;
    end;
    local v29 = v27:shouldShowCameraIndicator();
    local v30 = v27:shouldShowMicOffIndicator();
    local v31 = v29 and v28;
    local l_chatSettings_0 = v27.props.chatSettings;
    local v33 = v31 and l_AvatarChatUISettings_0.DoubleIconCornerRadiusOffset or l_AvatarChatUISettings_0.SingleIconCornerRadiusOffset;
    local v34 = v31 and l_AvatarChatUISettings_0.DoubleIconButtonSize or l_AvatarChatUISettings_0.SingleIconButtonSize;
    local v35 = v27.props.isLocalPlayer and "microphone" or "speaker";
    local v36 = v27.state.cameraEnabled and v27.props.hasCameraPermissions and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    if v12.DoNotPromptCameraPermissionsOnMount then
        v36 = v27.state.cameraEnabled and v27:getCameraButtonVisibleAtMount() and "icons/controls/voice/video_on_light" or "icons/controls/voice/video_off_light";
    end;
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, l_AvatarChatUISettings_0.FrameHeight), 
        LayoutOrder = v27.props.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        Visible = v28 or v29
    }, {
        Scale = v4.createElement("UIScale", {
            Scale = not v27.props.isInsideMaximizeDistance and 0.75 or 1
        }), 
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v33)
        }), 
        Container = v4.createElement("ImageLabel", l_Dictionary_0.join({
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, l_chatSettings_0.ImageLabel), {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v33)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MicrophoneBubble = v28 and v4.createElement(v13, {
                LayoutOrder = 1, 
                onActivated = v27.toggleMic, 
                chatSettings = l_chatSettings_0, 
                controlBubbleSize = v34, 
                cornerRadiusOffset = v33, 
                iconAssetName = v30 and "icons/controls/voice/microphone_off_light" or nil, 
                iconSize = l_AvatarChatUISettings_0.IconSize, 
                iconTransparency = l_AvatarChatUISettings_0.IconTransparency, 
                voiceState = v27.props.voiceState, 
                renderStepName = l_HttpService_0:GenerateGUID(), 
                iconStyle = v35, 
                isUserToxic = v27.props.isUserToxic
            }), 
            Divider = v28 and v29 and v4.createElement("Frame", {
                Size = l_AvatarChatUISettings_0.DividerSize, 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                ZIndex = 1, 
                BackgroundColor3 = l_AvatarChatUISettings_0.DividerColor
            }), 
            CameraBubble = v29 and v4.createElement(v13, {
                LayoutOrder = 3, 
                onActivated = v12.DoNotPromptCameraPermissionsOnMount and v27.onVideoButtonPressed or v27.toggleVideo, 
                chatSettings = l_chatSettings_0, 
                cornerRadiusOffset = v33, 
                controlBubbleSize = v34, 
                iconAssetName = v36, 
                iconSize = l_AvatarChatUISettings_0.IconSize, 
                iconTransparency = l_AvatarChatUISettings_0.IconTransparency, 
                iconStyle = v35, 
                isUserToxic = v27.props.isUserToxic
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
        }, {
            CaratGradient = l_chatSettings_0.UIGradient and v4.createElement("UIGradient", l_chatSettings_0.UIGradient)
        }), 
        BubbleGradient = l_chatSettings_0.UIGradient and v4.createElement("UIGradient", l_chatSettings_0.UIGradient), 
        VideoEnabledChanged = l_FaceAnimatorService_0 and v4.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v27.updateVideo
        }) or nil
    });
end;
return v5.connect(function(v37, v38) --[[ Line: 245 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v15 (copy)
    local v39 = false;
    if v15() and v37.ReverseNudgeToxicUsers then
        v39 = v37.ReverseNudgeToxicUsers[v38.userId];
        if v39 == nil then
            v39 = false;
        end;
    end;
    return {
        voiceState = v37.Voice.participants[v38.userId], 
        isUserToxic = v39
    };
end)(v17);