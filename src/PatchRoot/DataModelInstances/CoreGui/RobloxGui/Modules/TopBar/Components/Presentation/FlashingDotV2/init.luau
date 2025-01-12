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
local v11 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v12 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v13 = require(l_CoreGui_0.RobloxGui.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v14 = v5.PureComponent:extend("FlashingDot");
local function _(v15, v16, v17) --[[ Line: 32 ]] --[[ Name: lerpNum ]]
    return v15 + (v16 - v15) * v17;
end;
v14.validateProps = v7.strictInterface({});
v14.init = function(v19) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_default_0 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v13 (copy), v11 (copy), v12 (copy)
    v19:setState({
        Visible = false, 
        isUsingMic = false
    });
    v19.prevTime = 1.5707963267948966;
    v19.prevSinTime = 1;
    local v20, v21 = v5.createBinding(0);
    v19.transparencyBinding = v20;
    v19.updateTransparencyBinding = v21;
    v19.checkNewVisibility = function() --[[ Line: 48 ]]
        -- upvalues: l_default_0 (ref), l_FaceAnimatorService_0 (ref), l_VideoCaptureService_0 (ref), v13 (ref), v19 (copy), v11 (ref)
        local v22 = false;
        if l_default_0.localMuted ~= nil then
            v22 = not l_default_0.localMuted;
        end;
        local v23 = l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v13() then
            v23 = l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        end;
        local v24 = v22 or v23;
        local v25 = v19.state.Visible ~= v24;
        local v26 = v11 and v19.state.isUsingMic ~= v22;
        if v25 or v26 then
            v19:setState({
                Visible = v24, 
                isUsingMic = v22
            });
        end;
    end;
    v19.animationConnection = function(v27) --[[ Line: 71 ]]
        -- upvalues: v19 (copy)
        local v28 = v19.prevTime + v27;
        local v29 = math.sin(v28 * 3);
        local v30 = math.abs(v19.prevSinTime);
        v19.updateTransparencyBinding(0.5 + -0.5 * v30);
        v19.prevTime = v28;
        v19.prevSinTime = v29;
    end;
    if v13() then
        v19.teardownCameraPermissionGrantedListener = function() --[[ Line: 82 ]]
            -- upvalues: v19 (copy)
            if v19.cameraPermissionGrantedListener then
                v19.cameraPermissionGrantedListener:disconnect();
                v19.cameraPermissionGrantedListener = nil;
            end;
        end;
        v19.cameraPermissionGrantedListener = v12:connect(function() --[[ Line: 90 ]]
            -- upvalues: v19 (copy)
            v19.checkNewVisibility();
        end);
    end;
end;
v14.didMount = function(v31) --[[ Line: 96 ]] --[[ Name: didMount ]]
    v31.checkNewVisibility();
end;
v14.willUnmount = function(v32) --[[ Line: 100 ]] --[[ Name: willUnmount ]]
    if v32.teardownCameraPermissionGrantedListener then
        v32.teardownCameraPermissionGrantedListener();
    end;
end;
v14.render = function(v33) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_FaceAnimatorService_0 (copy), l_VideoCaptureService_0 (copy), v13 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_default_0 (copy), l_RunService_0 (copy)
    local v34 = nil;
    local v35 = UDim2.fromOffset(4, 4);
    if v11 then
        local v36 = l_FaceAnimatorService_0.VideoAnimationEnabled and l_VideoCaptureService_0.Active;
        if v13() then
            v36 = l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        end;
        if v33.state.isUsingMic then
            v34 = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png";
        elseif v36 then
            v34 = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
            v35 = UDim2.fromOffset(12, 12);
        end;
    end;
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -4, 0, 3), 
        Size = UDim2.fromOffset(4, 4), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Visible = v33.state.Visible
    }, {
        FlashingDot = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = if v11 then Vector2.new(0.5, 0.5) else nil, 
            Position = if v11 then UDim2.fromScale(0.5, 0.5) else nil, 
            Size = v35, 
            Image = if v11 then v34 else "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png", 
            ImageTransparency = v33.transparencyBinding, 
            LayoutOrder = 2
        }), 
        MuteChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_default_0.muteChanged.Event, 
            callback = v33.checkNewVisibility
        }), 
        CameraChangedEvent = v5.createElement(l_ExternalEventConnection_0, {
            event = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"), 
            callback = v33.checkNewVisibility
        }), 
        AnimationConnection = if v33.state.Visible then v5.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v33.animationConnection
        }) else nil
    });
end;
return v14;