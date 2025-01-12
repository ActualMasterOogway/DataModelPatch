local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v2 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixGamepadMaxZoom");
end);
v2 = l_status_0 and l_result_0;
l_status_0 = l_FlagUtil_0.getUserFlag("UserFixCameraOffsetJitter2");
l_result_0 = Vector2.new(0.2617993877991494, 0);
local _ = Vector2.new(0.7853981633974483, 0);
local _ = Vector2.new(0, 0);
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_CameraToggleStateController_0 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUI_0 = require(script.Parent:WaitForChild("CameraUI"));
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v18 = {};
v18.__index = v18;
v18.new = function() --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy)
    local v19 = setmetatable({}, v18);
    v19.gamepadZoomLevels = {
        0, 
        10, 
        20
    };
    v19.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
    v19.cameraType = nil;
    v19.cameraMovementMode = nil;
    v19.lastCameraTransform = nil;
    v19.lastUserPanCamera = tick();
    v19.humanoidRootPart = nil;
    v19.humanoidCache = {};
    v19.lastSubject = nil;
    v19.lastSubjectPosition = Vector3.new(0, 5, 0, 0);
    v19.lastSubjectCFrame = CFrame.new(v19.lastSubjectPosition);
    v19.currentSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v19.inFirstPerson = false;
    v19.inMouseLockedMode = false;
    v19.portraitMode = false;
    v19.isSmallTouchScreen = false;
    v19.resetCameraAngle = true;
    v19.enabled = false;
    v19.PlayerGui = nil;
    v19.cameraChangedConn = nil;
    v19.viewportSizeChangedConn = nil;
    v19.shouldUseVRRotation = false;
    v19.VRRotationIntensityAvailable = false;
    v19.lastVRRotationIntensityCheckTime = 0;
    v19.lastVRRotationTime = 0;
    v19.vrRotateKeyCooldown = {};
    v19.cameraTranslationConstraints = Vector3.new(1, 1, 1, 0);
    v19.humanoidJumpOrigin = nil;
    v19.trackingHumanoid = nil;
    v19.cameraFrozen = false;
    v19.subjectStateChangedConn = nil;
    v19.gamepadZoomPressConnection = nil;
    v19.mouseLockOffset = Vector3.new(0, 0, 0, 0);
    if l_LocalPlayer_0.Character then
        v19:OnCharacterAdded(l_LocalPlayer_0.Character);
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(function(v20) --[[ Line: 137 ]]
        -- upvalues: v19 (copy)
        v19:OnCharacterAdded(v20);
    end);
    if v19.playerCameraModeChangeConn then
        v19.playerCameraModeChangeConn:Disconnect();
    end;
    v19.playerCameraModeChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 142 ]]
        -- upvalues: v19 (copy)
        v19:OnPlayerCameraPropertyChange();
    end);
    if v19.minDistanceChangeConn then
        v19.minDistanceChangeConn:Disconnect();
    end;
    v19.minDistanceChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 147 ]]
        -- upvalues: v19 (copy)
        v19:OnPlayerCameraPropertyChange();
    end);
    if v19.maxDistanceChangeConn then
        v19.maxDistanceChangeConn:Disconnect();
    end;
    v19.maxDistanceChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 152 ]]
        -- upvalues: v19 (copy)
        v19:OnPlayerCameraPropertyChange();
    end);
    if v19.playerDevTouchMoveModeChangeConn then
        v19.playerDevTouchMoveModeChangeConn:Disconnect();
    end;
    v19.playerDevTouchMoveModeChangeConn = l_LocalPlayer_0:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 157 ]]
        -- upvalues: v19 (copy)
        v19:OnDevTouchMovementModeChanged();
    end);
    v19:OnDevTouchMovementModeChanged();
    if v19.gameSettingsTouchMoveMoveChangeConn then
        v19.gameSettingsTouchMoveMoveChangeConn:Disconnect();
    end;
    v19.gameSettingsTouchMoveMoveChangeConn = l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 163 ]]
        -- upvalues: v19 (copy)
        v19:OnGameSettingsTouchMovementModeChanged();
    end);
    v19:OnGameSettingsTouchMovementModeChanged();
    l_UserGameSettings_0:SetCameraYInvertVisible();
    l_UserGameSettings_0:SetGamepadCameraSensitivityVisible();
    v19.hasGameLoaded = game:IsLoaded();
    if not v19.hasGameLoaded then
        v19.gameLoadedConn = game.Loaded:Connect(function() --[[ Line: 173 ]]
            -- upvalues: v19 (copy)
            v19.hasGameLoaded = true;
            v19.gameLoadedConn:Disconnect();
            v19.gameLoadedConn = nil;
        end);
    end;
    v19:OnPlayerCameraPropertyChange();
    return v19;
end;
v18.GetModuleName = function(_) --[[ Line: 185 ]] --[[ Name: GetModuleName ]]
    return "BaseCamera";
end;
v18.OnCharacterAdded = function(v22, v23) --[[ Line: 189 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_UserInputService_0 (copy), l_LocalPlayer_0 (copy)
    v22.resetCameraAngle = v22.resetCameraAngle or v22:GetEnabled();
    v22.humanoidRootPart = nil;
    if l_UserInputService_0.TouchEnabled then
        v22.PlayerGui = l_LocalPlayer_0:WaitForChild("PlayerGui");
        for _, v25 in ipairs(v23:GetChildren()) do
            if v25:IsA("Tool") then
                v22.isAToolEquipped = true;
            end;
        end;
        v23.ChildAdded:Connect(function(v26) --[[ Line: 199 ]]
            -- upvalues: v22 (copy)
            if v26:IsA("Tool") then
                v22.isAToolEquipped = true;
            end;
        end);
        v23.ChildRemoved:Connect(function(v27) --[[ Line: 204 ]]
            -- upvalues: v22 (copy)
            if v27:IsA("Tool") then
                v22.isAToolEquipped = false;
            end;
        end);
    end;
end;
v18.GetHumanoidRootPart = function(v28) --[[ Line: 212 ]] --[[ Name: GetHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if not v28.humanoidRootPart and l_LocalPlayer_0.Character then
        local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            v28.humanoidRootPart = l_Humanoid_0.RootPart;
        end;
    end;
    return v28.humanoidRootPart;
end;
v18.GetBodyPartToFollow = function(_, v31, _) --[[ Line: 224 ]] --[[ Name: GetBodyPartToFollow ]]
    if v31:GetState() == Enum.HumanoidStateType.Dead then
        local l_Parent_0 = v31.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return l_Parent_0:FindFirstChild("Head") or v31.RootPart;
        end;
    end;
    return v31.RootPart;
end;
v18.GetSubjectCFrame = function(v34) --[[ Line: 236 ]] --[[ Name: GetSubjectCFrame ]]
    -- upvalues: l_status_0 (copy)
    local l_lastSubjectCFrame_0 = v34.lastSubjectCFrame;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v37 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    if not v37 then
        return l_lastSubjectCFrame_0;
    else
        if v37:IsA("Humanoid") then
            local v38 = v37:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_0 = v37.CameraOffset;
            if l_status_0 and v34:GetIsMouseLocked() then
                l_CameraOffset_0 = Vector3.new();
            end;
            local l_RootPart_0 = v37.RootPart;
            if v38 and v37.Parent and v37.Parent:IsA("Model") then
                l_RootPart_0 = v37.Parent:FindFirstChild("Head") or l_RootPart_0;
            end;
            if l_RootPart_0 and l_RootPart_0:IsA("BasePart") then
                local v41 = nil;
                if v37.RigType == Enum.HumanoidRigType.R15 then
                    if v37.AutomaticScalingEnabled then
                        v41 = Vector3.new(0, 1.5, 0, 0);
                        local l_RootPart_1 = v37.RootPart;
                        if l_RootPart_0 == l_RootPart_1 then
                            v41 = v41 + Vector3.new(0, (l_RootPart_1.Size.Y - Vector3.new(2, 2, 1, 0).Y) / 2, 0);
                        end;
                    else
                        v41 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v41 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v38 then
                    v41 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectCFrame_0 = l_RootPart_0.CFrame * CFrame.new(v41 + l_CameraOffset_0);
            end;
        elseif v37:IsA("BasePart") then
            l_lastSubjectCFrame_0 = v37.CFrame;
        elseif v37:IsA("Model") then
            l_lastSubjectCFrame_0 = if v37.PrimaryPart then v37:GetPrimaryPartCFrame() else CFrame.new();
        end;
        if l_lastSubjectCFrame_0 then
            v34.lastSubjectCFrame = l_lastSubjectCFrame_0;
        end;
        return l_lastSubjectCFrame_0;
    end;
end;
v18.GetSubjectVelocity = function(_) --[[ Line: 310 ]] --[[ Name: GetSubjectVelocity ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v45 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if not v45 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v45:IsA("BasePart") then
        return v45.Velocity;
    else
        if v45:IsA("Humanoid") then
            local l_RootPart_2 = v45.RootPart;
            if l_RootPart_2 then
                return l_RootPart_2.Velocity;
            end;
        elseif v45:IsA("Model") then
            local l_PrimaryPart_0 = v45.PrimaryPart;
            if l_PrimaryPart_0 then
                return l_PrimaryPart_0.Velocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v18.GetSubjectRotVelocity = function(_) --[[ Line: 339 ]] --[[ Name: GetSubjectRotVelocity ]]
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v50 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if not v50 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v50:IsA("BasePart") then
        return v50.RotVelocity;
    else
        if v50:IsA("Humanoid") then
            local l_RootPart_3 = v50.RootPart;
            if l_RootPart_3 then
                return l_RootPart_3.RotVelocity;
            end;
        elseif v50:IsA("Model") then
            local l_PrimaryPart_1 = v50.PrimaryPart;
            if l_PrimaryPart_1 then
                return l_PrimaryPart_1.RotVelocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v18.StepZoom = function(v53) --[[ Line: 368 ]] --[[ Name: StepZoom ]]
    -- upvalues: l_CameraInput_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_0 = v53.currentSubjectDistance;
    local v55 = l_CameraInput_0.getZoomDelta();
    if math.abs(v55) > 0 then
        local v56 = nil;
        v56 = if v55 > 0 then math.max(l_currentSubjectDistance_0 + v55 * (1 + l_currentSubjectDistance_0 * 0.5), v53.FIRST_PERSON_DISTANCE_THRESHOLD) else math.max((l_currentSubjectDistance_0 + v55) / (1 - v55 * 0.5), 0.5);
        if v56 < v53.FIRST_PERSON_DISTANCE_THRESHOLD then
            v56 = 0.5;
        end;
        v53:SetCameraToSubjectDistance(v56);
    end;
    return l_ZoomController_0.GetZoomRadius();
end;
v18.GetSubjectPosition = function(v57) --[[ Line: 393 ]] --[[ Name: GetSubjectPosition ]]
    -- upvalues: l_status_0 (copy)
    local l_lastSubjectPosition_0 = v57.lastSubjectPosition;
    local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
    local v60 = l_CurrentCamera_3 and l_CurrentCamera_3.CameraSubject;
    if v60 then
        if v60:IsA("Humanoid") then
            local v61 = v60:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_1 = v60.CameraOffset;
            if l_status_0 and v57:GetIsMouseLocked() then
                l_CameraOffset_1 = Vector3.new();
            end;
            local l_RootPart_4 = v60.RootPart;
            if v61 and v60.Parent and v60.Parent:IsA("Model") then
                l_RootPart_4 = v60.Parent:FindFirstChild("Head") or l_RootPart_4;
            end;
            if l_RootPart_4 and l_RootPart_4:IsA("BasePart") then
                local v64 = nil;
                if v60.RigType == Enum.HumanoidRigType.R15 then
                    if v60.AutomaticScalingEnabled then
                        v64 = Vector3.new(0, 1.5, 0, 0);
                        if l_RootPart_4 == v60.RootPart then
                            v64 = v64 + Vector3.new(0, v60.RootPart.Size.Y / 2 - Vector3.new(2, 2, 1, 0).Y / 2, 0);
                        end;
                    else
                        v64 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v64 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v61 then
                    v64 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectPosition_0 = l_RootPart_4.CFrame.p + l_RootPart_4.CFrame:vectorToWorldSpace(v64 + l_CameraOffset_1);
            end;
        elseif v60:IsA("VehicleSeat") then
            l_lastSubjectPosition_0 = v60.CFrame.p + v60.CFrame:vectorToWorldSpace((Vector3.new(0, 5, 0, 0)));
        elseif v60:IsA("SkateboardPlatform") then
            l_lastSubjectPosition_0 = v60.CFrame.p + Vector3.new(0, 5, 0, 0);
        elseif v60:IsA("BasePart") then
            l_lastSubjectPosition_0 = v60.CFrame.p;
        elseif v60:IsA("Model") then
            l_lastSubjectPosition_0 = if v60.PrimaryPart then v60:GetPrimaryPartCFrame().p else v60:GetModelCFrame().p;
        end;
        v57.lastSubject = v60;
        v57.lastSubjectPosition = l_lastSubjectPosition_0;
        return l_lastSubjectPosition_0;
    else
        return nil;
    end;
end;
v18.OnViewportSizeChanged = function(v65) --[[ Line: 470 ]] --[[ Name: OnViewportSizeChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    v65.portraitMode = l_ViewportSize_0.X < l_ViewportSize_0.Y;
    v65.isSmallTouchScreen = l_UserInputService_0.TouchEnabled and (l_ViewportSize_0.Y < 500 or l_ViewportSize_0.X < 700);
end;
v18.OnCurrentCameraChanged = function(v67) --[[ Line: 478 ]] --[[ Name: OnCurrentCameraChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled then
        if v67.viewportSizeChangedConn then
            v67.viewportSizeChangedConn:Disconnect();
            v67.viewportSizeChangedConn = nil;
        end;
        local l_CurrentCamera_4 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_4 then
            v67:OnViewportSizeChanged();
            v67.viewportSizeChangedConn = l_CurrentCamera_4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 489 ]]
                -- upvalues: v67 (copy)
                v67:OnViewportSizeChanged();
            end);
        end;
    end;
    if v67.cameraSubjectChangedConn then
        v67.cameraSubjectChangedConn:Disconnect();
        v67.cameraSubjectChangedConn = nil;
    end;
    local l_CurrentCamera_5 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_5 then
        v67.cameraSubjectChangedConn = l_CurrentCamera_5:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 503 ]]
            -- upvalues: v67 (copy)
            v67:OnNewCameraSubject();
        end);
        v67:OnNewCameraSubject();
    end;
end;
v18.OnDynamicThumbstickEnabled = function(v70) --[[ Line: 510 ]] --[[ Name: OnDynamicThumbstickEnabled ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled then
        v70.isDynamicThumbstickEnabled = true;
    end;
end;
v18.OnDynamicThumbstickDisabled = function(v71) --[[ Line: 516 ]] --[[ Name: OnDynamicThumbstickDisabled ]]
    v71.isDynamicThumbstickEnabled = false;
end;
v18.OnGameSettingsTouchMovementModeChanged = function(v72) --[[ Line: 520 ]] --[[ Name: OnGameSettingsTouchMovementModeChanged ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy)
    if l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
        if l_UserGameSettings_0.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or l_UserGameSettings_0.TouchMovementMode == Enum.TouchMovementMode.Default then
            v72:OnDynamicThumbstickEnabled();
            return;
        else
            v72:OnDynamicThumbstickDisabled();
        end;
    end;
end;
v18.OnDevTouchMovementModeChanged = function(v73) --[[ Line: 531 ]] --[[ Name: OnDevTouchMovementModeChanged ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if l_LocalPlayer_0.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
        v73:OnDynamicThumbstickEnabled();
        return;
    else
        v73:OnGameSettingsTouchMovementModeChanged();
        return;
    end;
end;
v18.OnPlayerCameraPropertyChange = function(v74) --[[ Line: 539 ]] --[[ Name: OnPlayerCameraPropertyChange ]]
    v74:SetCameraToSubjectDistance(v74.currentSubjectDistance);
end;
v18.InputTranslationToCameraAngleChange = function(_, v76, v77) --[[ Line: 544 ]] --[[ Name: InputTranslationToCameraAngleChange ]]
    return v76 * v77;
end;
v18.GamepadZoomPress = function(v78) --[[ Line: 550 ]] --[[ Name: GamepadZoomPress ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (ref)
    local l_v78_CameraToSubjectDistance_0 = v78:GetCameraToSubjectDistance();
    local l_CameraMaxZoomDistance_0 = l_LocalPlayer_0.CameraMaxZoomDistance;
    for v81 = #v78.gamepadZoomLevels, 1, -1 do
        local v82 = v78.gamepadZoomLevels[v81];
        if l_CameraMaxZoomDistance_0 >= v82 then
            if v82 < l_LocalPlayer_0.CameraMinZoomDistance then
                v82 = l_LocalPlayer_0.CameraMinZoomDistance;
                if v2 and l_CameraMaxZoomDistance_0 == v82 then
                    break;
                end;
            end;
            if v2 or l_CameraMaxZoomDistance_0 ~= v82 then
                if v82 + (l_CameraMaxZoomDistance_0 - v82) / 2 < l_v78_CameraToSubjectDistance_0 then
                    v78:SetCameraToSubjectDistance(v82);
                    return;
                else
                    l_CameraMaxZoomDistance_0 = v82;
                end;
            else
                break;
            end;
        end;
    end;
    v78:SetCameraToSubjectDistance(v78.gamepadZoomLevels[#v78.gamepadZoomLevels]);
end;
v18.Enable = function(v83, v84) --[[ Line: 595 ]] --[[ Name: Enable ]]
    if v83.enabled ~= v84 then
        v83.enabled = v84;
        v83:OnEnabledChanged();
    end;
end;
v18.OnEnabledChanged = function(v85) --[[ Line: 603 ]] --[[ Name: OnEnabledChanged ]]
    -- upvalues: l_CameraInput_0 (copy), l_LocalPlayer_0 (copy)
    if v85.enabled then
        l_CameraInput_0.setInputEnabled(true);
        v85.gamepadZoomPressConnection = l_CameraInput_0.gamepadZoomPress:Connect(function() --[[ Line: 607 ]]
            -- upvalues: v85 (copy)
            v85:GamepadZoomPress();
        end);
        if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
            v85.currentSubjectDistance = 0.5;
            if not v85.inFirstPerson then
                v85:EnterFirstPerson();
            end;
        end;
        if v85.cameraChangedConn then
            v85.cameraChangedConn:Disconnect();
            v85.cameraChangedConn = nil;
        end;
        v85.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 619 ]]
            -- upvalues: v85 (copy)
            v85:OnCurrentCameraChanged();
        end);
        v85:OnCurrentCameraChanged();
        return;
    else
        l_CameraInput_0.setInputEnabled(false);
        if v85.gamepadZoomPressConnection then
            v85.gamepadZoomPressConnection:Disconnect();
            v85.gamepadZoomPressConnection = nil;
        end;
        v85:Cleanup();
        return;
    end;
end;
v18.GetEnabled = function(v86) --[[ Line: 635 ]] --[[ Name: GetEnabled ]]
    return v86.enabled;
end;
v18.Cleanup = function(v87) --[[ Line: 639 ]] --[[ Name: Cleanup ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v87.subjectStateChangedConn then
        v87.subjectStateChangedConn:Disconnect();
        v87.subjectStateChangedConn = nil;
    end;
    if v87.viewportSizeChangedConn then
        v87.viewportSizeChangedConn:Disconnect();
        v87.viewportSizeChangedConn = nil;
    end;
    if v87.cameraChangedConn then
        v87.cameraChangedConn:Disconnect();
        v87.cameraChangedConn = nil;
    end;
    v87.lastCameraTransform = nil;
    v87.lastSubjectCFrame = nil;
    l_CameraUtils_0.restoreMouseBehavior();
end;
v18.UpdateMouseBehavior = function(v88) --[[ Line: 660 ]] --[[ Name: UpdateMouseBehavior ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_CameraUI_0 (copy), l_CameraInput_0 (copy), l_CameraToggleStateController_0 (copy), l_CameraUtils_0 (copy)
    local v89 = l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    if v88.isCameraToggle and v89 == false then
        l_CameraUI_0.setCameraModeToastEnabled(true);
        l_CameraInput_0.enableCameraToggleInput();
        l_CameraToggleStateController_0(v88.inFirstPerson);
        return;
    else
        l_CameraUI_0.setCameraModeToastEnabled(false);
        l_CameraInput_0.disableCameraToggleInput();
        if v88.inFirstPerson or v88.inMouseLockedMode then
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
            l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
            return;
        else
            l_CameraUtils_0.restoreRotationType();
            if l_CameraInput_0.getRotationActivated() then
                l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
                return;
            else
                l_CameraUtils_0.restoreMouseBehavior();
                return;
            end;
        end;
    end;
end;
v18.UpdateForDistancePropertyChange = function(v90) --[[ Line: 688 ]] --[[ Name: UpdateForDistancePropertyChange ]]
    v90:SetCameraToSubjectDistance(v90.currentSubjectDistance);
end;
v18.SetCameraToSubjectDistance = function(v91, v92) --[[ Line: 694 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_1 = v91.currentSubjectDistance;
    if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
        v91.currentSubjectDistance = 0.5;
        if not v91.inFirstPerson then
            v91:EnterFirstPerson();
        end;
    else
        local v94 = math.clamp(v92, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        if v94 < 1 then
            v91.currentSubjectDistance = 0.5;
            if not v91.inFirstPerson then
                v91:EnterFirstPerson();
            end;
        else
            v91.currentSubjectDistance = v94;
            if v91.inFirstPerson then
                v91:LeaveFirstPerson();
            end;
        end;
    end;
    l_ZoomController_0.SetZoomParameters(v91.currentSubjectDistance, (math.sign(v92 - l_currentSubjectDistance_1)));
    return v91.currentSubjectDistance;
end;
v18.SetCameraType = function(v95, v96) --[[ Line: 728 ]] --[[ Name: SetCameraType ]]
    v95.cameraType = v96;
end;
v18.GetCameraType = function(v97) --[[ Line: 733 ]] --[[ Name: GetCameraType ]]
    return v97.cameraType;
end;
v18.SetCameraMovementMode = function(v98, v99) --[[ Line: 738 ]] --[[ Name: SetCameraMovementMode ]]
    v98.cameraMovementMode = v99;
end;
v18.GetCameraMovementMode = function(v100) --[[ Line: 742 ]] --[[ Name: GetCameraMovementMode ]]
    return v100.cameraMovementMode;
end;
v18.SetIsMouseLocked = function(v101, v102) --[[ Line: 746 ]] --[[ Name: SetIsMouseLocked ]]
    v101.inMouseLockedMode = v102;
end;
v18.GetIsMouseLocked = function(v103) --[[ Line: 750 ]] --[[ Name: GetIsMouseLocked ]]
    return v103.inMouseLockedMode;
end;
v18.SetMouseLockOffset = function(v104, v105) --[[ Line: 754 ]] --[[ Name: SetMouseLockOffset ]]
    v104.mouseLockOffset = v105;
end;
v18.GetMouseLockOffset = function(v106) --[[ Line: 758 ]] --[[ Name: GetMouseLockOffset ]]
    return v106.mouseLockOffset;
end;
v18.InFirstPerson = function(v107) --[[ Line: 762 ]] --[[ Name: InFirstPerson ]]
    return v107.inFirstPerson;
end;
v18.EnterFirstPerson = function(v108) --[[ Line: 766 ]] --[[ Name: EnterFirstPerson ]]
    v108.inFirstPerson = true;
    v108:UpdateMouseBehavior();
end;
v18.LeaveFirstPerson = function(v109) --[[ Line: 771 ]] --[[ Name: LeaveFirstPerson ]]
    v109.inFirstPerson = false;
    v109:UpdateMouseBehavior();
end;
v18.GetCameraToSubjectDistance = function(v110) --[[ Line: 777 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v110.currentSubjectDistance;
end;
v18.GetMeasuredDistanceToFocus = function(_) --[[ Line: 784 ]] --[[ Name: GetMeasuredDistanceToFocus ]]
    local l_CurrentCamera_6 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_6 then
        return (l_CurrentCamera_6.CoordinateFrame.p - l_CurrentCamera_6.Focus.p).magnitude;
    else
        return nil;
    end;
end;
v18.GetCameraLookVector = function(_) --[[ Line: 792 ]] --[[ Name: GetCameraLookVector ]]
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1, 0);
end;
v18.CalculateNewLookCFrameFromArg = function(v114, v115, v116) --[[ Line: 796 ]] --[[ Name: CalculateNewLookCFrameFromArg ]]
    local v117 = v115 or v114:GetCameraLookVector();
    local v118 = math.asin(v117.Y);
    local v119 = math.clamp(v116.Y, -1.3962634015954636 + v118, 1.3962634015954636 + v118);
    local v120 = Vector2.new(v116.X, v119);
    local v121 = CFrame.new(Vector3.new(0, 0, 0, 0), v117);
    return CFrame.Angles(0, -v120.X, 0) * v121 * CFrame.Angles(-v120.Y, 0, 0);
end;
v18.CalculateNewLookVectorFromArg = function(v122, v123, v124) --[[ Line: 806 ]] --[[ Name: CalculateNewLookVectorFromArg ]]
    return v122:CalculateNewLookCFrameFromArg(v123, v124).LookVector;
end;
v18.CalculateNewLookVectorVRFromArg = function(v125, v126) --[[ Line: 811 ]] --[[ Name: CalculateNewLookVectorVRFromArg ]]
    local l_unit_0 = ((v125:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1, 0)).unit;
    local v128 = Vector2.new(v126.X, 0);
    local v129 = CFrame.new(Vector3.new(0, 0, 0, 0), l_unit_0);
    return ((CFrame.Angles(0, -v128.X, 0) * v129 * CFrame.Angles(-v128.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1, 0)).unit;
end;
v18.GetHumanoid = function(v130) --[[ Line: 821 ]] --[[ Name: GetHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v131 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v131 then
        local v132 = v130.humanoidCache[l_LocalPlayer_0];
        if v132 and v132.Parent == v131 then
            return v132;
        else
            v130.humanoidCache[l_LocalPlayer_0] = nil;
            local l_Humanoid_1 = v131:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_1 then
                v130.humanoidCache[l_LocalPlayer_0] = l_Humanoid_1;
            end;
            return l_Humanoid_1;
        end;
    else
        return nil;
    end;
end;
v18.GetHumanoidPartToFollow = function(_, v135, v136) --[[ Line: 839 ]] --[[ Name: GetHumanoidPartToFollow ]]
    if v136 == Enum.HumanoidStateType.Dead then
        local l_Parent_1 = v135.Parent;
        if l_Parent_1 then
            return l_Parent_1:FindFirstChild("Head") or v135.Torso;
        else
            return v135.Torso;
        end;
    else
        return v135.Torso;
    end;
end;
v18.OnNewCameraSubject = function(v138) --[[ Line: 853 ]] --[[ Name: OnNewCameraSubject ]]
    if v138.subjectStateChangedConn then
        v138.subjectStateChangedConn:Disconnect();
        v138.subjectStateChangedConn = nil;
    end;
end;
v18.IsInFirstPerson = function(v139) --[[ Line: 860 ]] --[[ Name: IsInFirstPerson ]]
    return v139.inFirstPerson;
end;
v18.Update = function(_, _) --[[ Line: 864 ]] --[[ Name: Update ]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
v18.GetCameraHeight = function(v142) --[[ Line: 868 ]] --[[ Name: GetCameraHeight ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled and not v142.inFirstPerson then
        return 0.25881904510252074 * v142.currentSubjectDistance;
    else
        return 0;
    end;
end;
return v18;