local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = v6.Utility.ExternalEventConnection;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_Modules_0.Settings.getCamMicPermissions);
local v12 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v13 = v5.PureComponent:extend("FlashingDot");
local function _(v14, v15, v16) --[[ Line: 29 ]] --[[ Name: lerpNum ]]
    return v14 + (v15 - v14) * v16;
end;
v13.validateProps = v7.strictInterface({});
v13.init = function(v18) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_default_0 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v12 (copy)
    v18:setState({
        Visible = false, 
        isUsingMic = false, 
        hasMicPermissions = false, 
        hasCameraPermissions = false
    });
    v18.prevTime = 1.5707963267948966;
    v18.prevSinTime = 1;
    local v19, v20 = v5.createBinding(0);
    v18.transparencyBinding = v19;
    v18.updateTransparencyBinding = v20;
    v18.checkNewVisibility = function() --[[ Line: 47 ]]
        -- upvalues: v18 (copy), l_default_0 (ref), l_FaceAnimatorService_0 (ref), l_VideoCaptureService_0 (ref), v12 (ref)
        local v21 = v18.state.hasMicPermissions and l_default_0.localMuted ~= nil and not l_default_0.localMuted;
        local v22 = v18.state.hasCameraPermissions and l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        local v23 = v21 or v22;
        local v24 = v18.state.Visible ~= v23;
        local v25 = v12 and v18.state.isUsingMic ~= v21;
        if v24 or v25 then
            v18:setState({
                Visible = v23, 
                isUsingMic = v21
            });
        end;
    end;
    v18.animationConnection = function(v26) --[[ Line: 70 ]]
        -- upvalues: v18 (copy)
        local v27 = v18.prevTime + v26;
        local v28 = math.sin(v27 * 3);
        local v29 = math.abs(v18.prevSinTime);
        v18.updateTransparencyBinding(0.5 + -0.5 * v29);
        v18.prevTime = v27;
        v18.prevSinTime = v28;
    end;
end;
v13.didMount = function(v30) --[[ Line: 81 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy)
    v30.isMounted = true;
    v11(function(v31) --[[ Line: 83 ]]
        -- upvalues: v30 (copy)
        if not v30.isMounted then
            return;
        else
            v30:setState({
                hasCameraPermissions = v31.hasCameraPermissions, 
                hasMicPermissions = v31.hasMicPermissions
            });
            return;
        end;
    end, nil, nil, "FlashingDot.didMount");
    v30.checkNewVisibility();
end;
v13.didUpdate = function(v32, v33, _) --[[ Line: 97 ]] --[[ Name: didUpdate ]]
    if v32.state.hasMicPermissions ~= v33.hasMicPermissions or v32.state.hasCameraPermissions ~= v33.hasCameraPermissions then
        v32.checkNewVisibility();
    end;
end;
v13.render = function(v35) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_default_0 (copy), l_RunService_0 (copy)
    local v36 = nil;
    local v37 = UDim2.fromOffset(4, 4);
    if v12 then
        local v38 = v35.state.hasCameraPermissions and l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v35.state.isUsingMic then
            v36 = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png";
        elseif v38 then
            v36 = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
            v37 = UDim2.fromOffset(12, 12);
        end;
    end;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 3), 
        Size = UDim2.fromOffset(4, 4), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Visible = v35.state.Visible
    }, {
        FlashingDot = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = if v12 then Vector2.new(0.5, 0.5) else nil, 
            Position = if v12 then UDim2.fromScale(0.5, 0.5) else nil, 
            Size = v37, 
            Image = if v12 then v36 else "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png", 
            ImageTransparency = v35.transparencyBinding, 
            LayoutOrder = 2
        }), 
        MuteChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v35.checkNewVisibility
        }), 
        CameraChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v35.checkNewVisibility
        }), 
        AnimationConnection = if v35.state.Visible then v5.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v35.animationConnection
        }) else nil
    });
end;
v13.willUnmount = function(v39) --[[ Line: 156 ]] --[[ Name: willUnmount ]]
    v39.isMounted = false;
end;
return v13;