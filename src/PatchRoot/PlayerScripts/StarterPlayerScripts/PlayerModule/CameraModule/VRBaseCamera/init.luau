local v0 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 17 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = game:GetService("VRService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Lighting_0 = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v10 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v12 = setmetatable({}, l_BaseCamera_0);
v12.__index = v12;
v12.new = function() --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v12 (copy)
    local v13 = setmetatable(l_BaseCamera_0.new(), v12);
    v13.gamepadZoomLevels = {
        0, 
        7
    };
    v13.headScale = 1;
    v13:SetCameraToSubjectDistance(7);
    v13.VRFadeResetTimer = 0;
    v13.VREdgeBlurTimer = 0;
    v13.gamepadResetConnection = nil;
    v13.needsReset = true;
    v13.recentered = false;
    v13:Reset();
    return v13;
end;
v12.Reset = function(v14) --[[ Line: 67 ]] --[[ Name: Reset ]]
    v14.stepRotateTimeout = 0;
end;
v12.GetModuleName = function(_) --[[ Line: 71 ]] --[[ Name: GetModuleName ]]
    return "VRBaseCamera";
end;
v12.GamepadZoomPress = function(v16) --[[ Line: 75 ]] --[[ Name: GamepadZoomPress ]]
    -- upvalues: l_BaseCamera_0 (copy)
    l_BaseCamera_0.GamepadZoomPress(v16);
    v16:GamepadReset();
    v16:ResetZoom();
end;
v12.GamepadReset = function(v17) --[[ Line: 83 ]] --[[ Name: GamepadReset ]]
    v17.stepRotateTimeout = 0;
    v17.needsReset = true;
end;
v12.ResetZoom = function(v18) --[[ Line: 88 ]] --[[ Name: ResetZoom ]]
    -- upvalues: l_ZoomController_0 (copy)
    l_ZoomController_0.SetZoomParameters(v18.currentSubjectDistance, 0);
    l_ZoomController_0.ReleaseSpring();
end;
v12.OnEnabledChanged = function(v19) --[[ Line: 93 ]] --[[ Name: OnEnabledChanged ]]
    -- upvalues: l_BaseCamera_0 (copy), l_CameraInput_0 (copy), l_status_0 (copy), v0 (ref), l_LocalPlayer_0 (copy), l_Lighting_0 (copy)
    l_BaseCamera_0.OnEnabledChanged(v19);
    if v19.enabled then
        v19.gamepadResetConnection = l_CameraInput_0.gamepadReset:Connect(function() --[[ Line: 97 ]]
            -- upvalues: v19 (copy)
            v19:GamepadReset();
        end);
        v19.thirdPersonOptionChanged = l_status_0:GetPropertyChangedSignal("ThirdPersonFollowCamEnabled"):Connect(function() --[[ Line: 102 ]]
            -- upvalues: v0 (ref), v19 (copy)
            if v0 then
                v19:Reset();
                return;
            else
                if not v19:IsInFirstPerson() then
                    v19:Reset();
                end;
                return;
            end;
        end);
        v19.vrRecentered = l_status_0.UserCFrameChanged:Connect(function(v20, _) --[[ Line: 113 ]]
            -- upvalues: v19 (copy)
            if v20 == Enum.UserCFrame.Floor then
                v19.recentered = true;
            end;
        end);
        return;
    else
        if v19.inFirstPerson then
            v19:GamepadZoomPress();
        end;
        if v19.thirdPersonOptionChanged then
            v19.thirdPersonOptionChanged:Disconnect();
            v19.thirdPersonOptionChanged = nil;
        end;
        if v19.vrRecentered then
            v19.vrRecentered:Disconnect();
            v19.vrRecentered = nil;
        end;
        if v19.cameraHeadScaleChangedConn then
            v19.cameraHeadScaleChangedConn:Disconnect();
            v19.cameraHeadScaleChangedConn = nil;
        end;
        if v19.gamepadResetConnection then
            v19.gamepadResetConnection:Disconnect();
            v19.gamepadResetConnection = nil;
        end;
        v19.VREdgeBlurTimer = 0;
        v19:UpdateEdgeBlur(l_LocalPlayer_0, 1);
        local l_VRFade_0 = l_Lighting_0:FindFirstChild("VRFade");
        if l_VRFade_0 then
            l_VRFade_0.Brightness = 0;
        end;
        return;
    end;
end;
v12.OnCurrentCameraChanged = function(v23) --[[ Line: 155 ]] --[[ Name: OnCurrentCameraChanged ]]
    -- upvalues: l_BaseCamera_0 (copy)
    l_BaseCamera_0.OnCurrentCameraChanged(v23);
    if v23.cameraHeadScaleChangedConn then
        v23.cameraHeadScaleChangedConn:Disconnect();
        v23.cameraHeadScaleChangedConn = nil;
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 then
        v23.cameraHeadScaleChangedConn = l_CurrentCamera_0:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ Line: 167 ]]
            -- upvalues: v23 (copy)
            v23:OnHeadScaleChanged();
        end);
        v23:OnHeadScaleChanged();
    end;
end;
v12.OnHeadScaleChanged = function(v25) --[[ Line: 172 ]] --[[ Name: OnHeadScaleChanged ]]
    local l_HeadScale_0 = workspace.CurrentCamera.HeadScale;
    for v27, v28 in v25.gamepadZoomLevels do
        v25.gamepadZoomLevels[v27] = v28 * l_HeadScale_0 / v25.headScale;
    end;
    v25:SetCameraToSubjectDistance(v25:GetCameraToSubjectDistance() * l_HeadScale_0 / v25.headScale);
    v25.headScale = l_HeadScale_0;
end;
v12.GetVRFocus = function(v29, v30, v31) --[[ Line: 188 ]] --[[ Name: GetVRFocus ]]
    local v32 = v29.lastCameraFocus or v30;
    v29.cameraTranslationConstraints = Vector3.new(v29.cameraTranslationConstraints.x, math.min(1, v29.cameraTranslationConstraints.y + v31), v29.cameraTranslationConstraints.z);
    local v33 = Vector3.new(0, v29:GetCameraHeight(), 0);
    return (CFrame.new(Vector3.new(v30.x, v32.y, v30.z):Lerp(v30 + v33, v29.cameraTranslationConstraints.y)));
end;
v12.StartFadeFromBlack = function(v34) --[[ Line: 204 ]] --[[ Name: StartFadeFromBlack ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Lighting_0 (copy)
    if l_UserGameSettings_0.VignetteEnabled == false then
        return;
    else
        local l_VRFade_1 = l_Lighting_0:FindFirstChild("VRFade");
        if not l_VRFade_1 then
            l_VRFade_1 = Instance.new("ColorCorrectionEffect");
            l_VRFade_1.Name = "VRFade";
            l_VRFade_1.Parent = l_Lighting_0;
        end;
        l_VRFade_1.Brightness = -1;
        v34.VRFadeResetTimer = 0.1;
        return;
    end;
end;
v12.UpdateFadeFromBlack = function(v36, v37) --[[ Line: 219 ]] --[[ Name: UpdateFadeFromBlack ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_VRFade_2 = l_Lighting_0:FindFirstChild("VRFade");
    if v36.VRFadeResetTimer > 0 then
        v36.VRFadeResetTimer = math.max(v36.VRFadeResetTimer - v37, 0);
        local l_VRFade_3 = l_Lighting_0:FindFirstChild("VRFade");
        if l_VRFade_3 and l_VRFade_3.Brightness < 0 then
            l_VRFade_3.Brightness = math.min(l_VRFade_3.Brightness + v37 * 10, 0);
            return;
        end;
    elseif l_VRFade_2 then
        l_VRFade_2.Brightness = 0;
    end;
end;
v12.StartVREdgeBlur = function(v40, v41) --[[ Line: 235 ]] --[[ Name: StartVREdgeBlur ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_RunService_0 (copy), l_status_0 (copy)
    if l_UserGameSettings_0.VignetteEnabled == false then
        return;
    else
        local v42 = nil;
        v42 = workspace.CurrentCamera:FindFirstChild("VRBlurPart");
        if not v42 then
            v42 = Instance.new("Part");
            v42.Name = "VRBlurPart";
            v42.Parent = workspace.CurrentCamera;
            v42.CanTouch = false;
            v42.CanCollide = false;
            v42.CanQuery = false;
            v42.Anchored = true;
            v42.Size = Vector3.new(0.4399999976158142, 0.4699999988079071, 1, 0);
            v42.Transparency = 1;
            v42.CastShadow = false;
            l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 255 ]]
                -- upvalues: l_status_0 (ref), v42 (ref)
                local l_l_status_0_UserCFrame_0 = l_status_0:GetUserCFrame(Enum.UserCFrame.Head);
                local v45 = workspace.CurrentCamera.CFrame * (CFrame.new(l_l_status_0_UserCFrame_0.p * workspace.CurrentCamera.HeadScale) * (l_l_status_0_UserCFrame_0 - l_l_status_0_UserCFrame_0.p));
                v42.CFrame = v45 * CFrame.Angles(0, 3.141592653589793, 0) + v45.LookVector * (1.05 * workspace.CurrentCamera.HeadScale);
                v42.Size = Vector3.new(0.4399999976158142, 0.4699999988079071, 1, 0) * workspace.CurrentCamera.HeadScale;
            end);
        end;
        local l_VRBlurScreen_0 = v41.PlayerGui:FindFirstChild("VRBlurScreen");
        local v47 = nil;
        if l_VRBlurScreen_0 then
            v47 = l_VRBlurScreen_0:FindFirstChild("VRBlur");
        end;
        if not v47 then
            if not l_VRBlurScreen_0 then
                l_VRBlurScreen_0 = Instance.new("SurfaceGui") or Instance.new("ScreenGui");
            end;
            l_VRBlurScreen_0.Name = "VRBlurScreen";
            l_VRBlurScreen_0.Parent = v41.PlayerGui;
            l_VRBlurScreen_0.Adornee = v42;
            v47 = Instance.new("ImageLabel");
            v47.Name = "VRBlur";
            v47.Parent = l_VRBlurScreen_0;
            v47.Image = "rbxasset://textures/ui/VR/edgeBlur.png";
            v47.AnchorPoint = Vector2.new(0.5, 0.5);
            v47.Position = UDim2.new(0.5, 0, 0.5, 0);
            local v48 = workspace.CurrentCamera.ViewportSize.X * 2.3 / 512;
            local v49 = workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512;
            v47.Size = UDim2.fromScale(v48, v49);
            v47.BackgroundTransparency = 1;
            v47.Active = true;
            v47.ScaleType = Enum.ScaleType.Stretch;
        end;
        v47.Visible = true;
        v47.ImageTransparency = 0;
        v40.VREdgeBlurTimer = 0.14;
        return;
    end;
end;
v12.UpdateEdgeBlur = function(v50, v51, v52) --[[ Line: 304 ]] --[[ Name: UpdateEdgeBlur ]]
    local l_VRBlurScreen_1 = v51.PlayerGui:FindFirstChild("VRBlurScreen");
    local v54 = nil;
    if l_VRBlurScreen_1 then
        v54 = l_VRBlurScreen_1:FindFirstChild("VRBlur");
    end;
    if v54 then
        if v50.VREdgeBlurTimer > 0 then
            v50.VREdgeBlurTimer = v50.VREdgeBlurTimer - v52;
            local l_VRBlurScreen_2 = v51.PlayerGui:FindFirstChild("VRBlurScreen");
            if l_VRBlurScreen_2 then
                local l_VRBlur_0 = l_VRBlurScreen_2:FindFirstChild("VRBlur");
                if l_VRBlur_0 then
                    l_VRBlur_0.ImageTransparency = 1 - math.clamp(v50.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142;
                    return;
                end;
            end;
        else
            v54.Visible = false;
        end;
    end;
end;
v12.GetCameraHeight = function(v57) --[[ Line: 329 ]] --[[ Name: GetCameraHeight ]]
    if not v57.inFirstPerson then
        return 0.25881904510252074 * v57.currentSubjectDistance;
    else
        return 0;
    end;
end;
v12.GetSubjectCFrame = function(v58) --[[ Line: 336 ]] --[[ Name: GetSubjectCFrame ]]
    -- upvalues: l_BaseCamera_0 (copy)
    local v59 = l_BaseCamera_0.GetSubjectCFrame(v58);
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v61 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if not v61 then
        return v59;
    else
        if v61:IsA("Humanoid") and v61:GetState() == Enum.HumanoidStateType.Dead and v61 == v58.lastSubject then
            v59 = v58.lastSubjectCFrame;
        end;
        if v59 then
            v58.lastSubjectCFrame = v59;
        end;
        return v59;
    end;
end;
v12.GetSubjectPosition = function(v62) --[[ Line: 362 ]] --[[ Name: GetSubjectPosition ]]
    -- upvalues: l_BaseCamera_0 (copy)
    local v63 = l_BaseCamera_0.GetSubjectPosition(v62);
    local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
    local v65 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if v65 then
        if v65:IsA("Humanoid") then
            if v65:GetState() == Enum.HumanoidStateType.Dead and v65 == v62.lastSubject then
                v63 = v62.lastSubjectPosition;
            end;
        elseif v65:IsA("VehicleSeat") then
            v63 = v65.CFrame.p + v65.CFrame:vectorToWorldSpace((Vector3.new(0, 4, 0, 0)));
        end;
        v62.lastSubjectPosition = v63;
        return v63;
    else
        return nil;
    end;
end;
v12.getRotation = function(v66, v67) --[[ Line: 391 ]] --[[ Name: getRotation ]]
    -- upvalues: l_CameraInput_0 (copy), l_UserGameSettings_0 (copy), v10 (copy)
    local v68 = l_CameraInput_0.getRotation(v67);
    local v69 = 0;
    if l_UserGameSettings_0.VRSmoothRotationEnabled then
        if v10 then
            return v68.X;
        else
            return v68.X * 40 * v67;
        end;
    else
        if math.abs(v68.X) > 0.03 then
            if v66.stepRotateTimeout > 0 then
                v66.stepRotateTimeout = v66.stepRotateTimeout - v67;
            end;
            if v66.stepRotateTimeout <= 0 then
                v69 = 1;
                if v68.X < 0 then
                    v69 = -1;
                end;
                v69 = v69 * 0.5235987755982988;
                v66:StartFadeFromBlack();
                v66.stepRotateTimeout = 0.25;
                return v69;
            end;
        elseif math.abs(v68.X) < 0.02 then
            v66.stepRotateTimeout = 0;
        end;
        return v69;
    end;
end;
return v12;