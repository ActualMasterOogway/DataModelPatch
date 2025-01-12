local v0 = {};
v0.__index = v0;
local v1 = {
    "CameraMinZoomDistance", 
    "CameraMaxZoomDistance", 
    "CameraMode", 
    "DevCameraOcclusionMode", 
    "DevComputerCameraMode", 
    "DevTouchCameraMode", 
    "DevComputerMovementMode", 
    "DevTouchMovementMode", 
    "DevEnableMouseLock"
};
local v2 = {
    "ComputerCameraMovementMode", 
    "ComputerMovementMode", 
    "ControlMode", 
    "GamepadCameraSensitivity", 
    "MouseSensitivity", 
    "RotationType", 
    "TouchCameraMovementMode", 
    "TouchMovementMode"
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script:WaitForChild("CameraInput"));
local l_ClassicCamera_0 = require(script:WaitForChild("ClassicCamera"));
local l_OrbitalCamera_0 = require(script:WaitForChild("OrbitalCamera"));
local l_LegacyCamera_0 = require(script:WaitForChild("LegacyCamera"));
local l_VehicleCamera_0 = require(script:WaitForChild("VehicleCamera"));
local l_VRCamera_0 = require(script:WaitForChild("VRCamera"));
local l_VRVehicleCamera_0 = require(script:WaitForChild("VRVehicleCamera"));
local l_Invisicam_0 = require(script:WaitForChild("Invisicam"));
local l_Poppercam_0 = require(script:WaitForChild("Poppercam"));
local l_TransparencyController_0 = require(script:WaitForChild("TransparencyController"));
local l_MouseLockController_0 = require(script:WaitForChild("MouseLockController"));
local v22 = {};
local v23 = {};
local l_PlayerScripts_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerScripts");
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
l_PlayerScripts_0 = l_FlagUtil_0.getUserFlag("UserRespectLegacyCameraOptions");
v0.new = function() --[[ Line: 99 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_TransparencyController_0 (copy), l_UserInputService_0 (copy), l_MouseLockController_0 (copy), l_PlayerScripts_0 (copy), l_RunService_0 (copy), v1 (copy), v2 (copy), l_UserGameSettings_0 (copy)
    local v25 = setmetatable({}, v0);
    v25.activeCameraController = nil;
    v25.activeOcclusionModule = nil;
    v25.activeTransparencyController = nil;
    v25.activeMouseLockController = nil;
    v25.currentComputerCameraMovementMode = nil;
    v25.cameraSubjectChangedConn = nil;
    v25.cameraTypeChangedConn = nil;
    for _, v27 in pairs(l_Players_0:GetPlayers()) do
        v25:OnPlayerAdded(v27);
    end;
    l_Players_0.PlayerAdded:Connect(function(v28) --[[ Line: 120 ]]
        -- upvalues: v25 (copy)
        v25:OnPlayerAdded(v28);
    end);
    v25.activeTransparencyController = l_TransparencyController_0.new();
    v25.activeTransparencyController:Enable(true);
    if not l_UserInputService_0.TouchEnabled then
        v25.activeMouseLockController = l_MouseLockController_0.new();
        local l_BindableToggleEvent_0 = v25.activeMouseLockController:GetBindableToggleEvent();
        if l_BindableToggleEvent_0 then
            l_BindableToggleEvent_0:Connect(function() --[[ Line: 131 ]]
                -- upvalues: v25 (copy)
                v25:OnMouseLockToggled();
            end);
        end;
    end;
    if l_PlayerScripts_0 then
        v25:ActivateCameraController();
    else
        v25:ActivateCameraController(v25:GetCameraControlChoice());
    end;
    v25:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
    v25:OnCurrentCameraChanged();
    l_RunService_0:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(v30) --[[ Line: 144 ]]
        -- upvalues: v25 (copy)
        v25:Update(v30);
    end);
    for _, v32 in pairs(v1) do
        l_Players_0.LocalPlayer:GetPropertyChangedSignal(v32):Connect(function() --[[ Line: 148 ]]
            -- upvalues: v25 (copy), v32 (copy)
            v25:OnLocalPlayerCameraPropertyChanged(v32);
        end);
    end;
    for _, v34 in pairs(v2) do
        l_UserGameSettings_0:GetPropertyChangedSignal(v34):Connect(function() --[[ Line: 154 ]]
            -- upvalues: v25 (copy), v34 (copy)
            v25:OnUserGameSettingsPropertyChanged(v34);
        end);
    end;
    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 158 ]]
        -- upvalues: v25 (copy)
        v25:OnCurrentCameraChanged();
    end);
    return v25;
end;
v0.GetCameraMovementModeFromSettings = function(_) --[[ Line: 165 ]] --[[ Name: GetCameraMovementModeFromSettings ]]
    -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
    else
        local v36 = nil;
        local v37 = nil;
        if l_UserInputService_0.TouchEnabled then
            v36 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
            v37 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
        else
            v36 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
            v37 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
        end;
        if v36 == Enum.DevComputerCameraMovementMode.UserChoice then
            return v37;
        else
            return v36;
        end;
    end;
end;
v0.ActivateOcclusionModule = function(v38, v39) --[[ Line: 190 ]] --[[ Name: ActivateOcclusionModule ]]
    -- upvalues: l_Poppercam_0 (copy), l_Invisicam_0 (copy), v23 (copy), l_Players_0 (copy)
    local v40 = nil;
    if v39 == Enum.DevCameraOcclusionMode.Zoom then
        v40 = l_Poppercam_0;
    elseif v39 == Enum.DevCameraOcclusionMode.Invisicam then
        v40 = l_Invisicam_0;
    else
        warn("CameraScript ActivateOcclusionModule called with unsupported mode");
        return;
    end;
    v38.occlusionMode = v39;
    if v38.activeOcclusionModule and v38.activeOcclusionModule:GetOcclusionMode() == v39 then
        if not v38.activeOcclusionModule:GetEnabled() then
            v38.activeOcclusionModule:Enable(true);
        end;
        return;
    else
        local l_activeOcclusionModule_0 = v38.activeOcclusionModule;
        v38.activeOcclusionModule = v23[v40];
        if not v38.activeOcclusionModule then
            v38.activeOcclusionModule = v40.new();
            if v38.activeOcclusionModule then
                v23[v40] = v38.activeOcclusionModule;
            end;
        end;
        if v38.activeOcclusionModule then
            if v38.activeOcclusionModule:GetOcclusionMode() ~= v39 then
                warn("CameraScript ActivateOcclusionModule mismatch: ", v38.activeOcclusionModule:GetOcclusionMode(), "~=", v39);
            end;
            if l_activeOcclusionModule_0 then
                if l_activeOcclusionModule_0 ~= v38.activeOcclusionModule then
                    l_activeOcclusionModule_0:Enable(false);
                else
                    warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
                end;
            end;
            if v39 == Enum.DevCameraOcclusionMode.Invisicam then
                if l_Players_0.LocalPlayer.Character then
                    v38.activeOcclusionModule:CharacterAdded(l_Players_0.LocalPlayer.Character, l_Players_0.LocalPlayer);
                end;
            else
                for _, v43 in pairs(l_Players_0:GetPlayers()) do
                    if v43 and v43.Character then
                        v38.activeOcclusionModule:CharacterAdded(v43.Character, v43);
                    end;
                end;
                v38.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
            end;
            v38.activeOcclusionModule:Enable(true);
        end;
        return;
    end;
end;
v0.ShouldUseVehicleCamera = function(v44) --[[ Line: 269 ]] --[[ Name: ShouldUseVehicleCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return false;
    else
        local l_CameraType_0 = l_CurrentCamera_0.CameraType;
        local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
        local v48 = true;
        if l_CameraType_0 ~= Enum.CameraType.Custom then
            v48 = l_CameraType_0 == Enum.CameraType.Follow;
        end;
        local v49 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat") or false;
        local v50 = v44.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;
        return v49 and v48 and v50;
    end;
end;
v0.ActivateCameraController = function(v51, v52, v53) --[[ Line: 285 ]] --[[ Name: ActivateCameraController ]]
    -- upvalues: l_PlayerScripts_0 (copy), l_LegacyCamera_0 (copy), l_VRService_0 (copy), l_VRCamera_0 (copy), l_ClassicCamera_0 (copy), l_OrbitalCamera_0 (copy), l_VRVehicleCamera_0 (copy), l_VehicleCamera_0 (copy), v22 (copy)
    if l_PlayerScripts_0 then
        v53 = workspace.CurrentCamera.CameraType;
        v52 = v51:GetCameraMovementModeFromSettings();
    end;
    local v54 = nil;
    if l_PlayerScripts_0 and true or v53 ~= nil then
        if v53 == Enum.CameraType.Scriptable then
            if v51.activeCameraController then
                v51.activeCameraController:Enable(false);
                v51.activeCameraController = nil;
            end;
            return;
        elseif v53 == Enum.CameraType.Custom then
            v52 = v51:GetCameraMovementModeFromSettings();
        elseif v53 == Enum.CameraType.Track then
            v52 = Enum.ComputerCameraMovementMode.Classic;
        elseif v53 == Enum.CameraType.Follow then
            v52 = Enum.ComputerCameraMovementMode.Follow;
        elseif v53 == Enum.CameraType.Orbital then
            v52 = Enum.ComputerCameraMovementMode.Orbital;
        elseif v53 == Enum.CameraType.Attach or v53 == Enum.CameraType.Watch or v53 == Enum.CameraType.Fixed then
            v54 = l_LegacyCamera_0;
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", v53);
        end;
    end;
    if not v54 then
        if l_VRService_0.VREnabled then
            v54 = l_VRCamera_0;
        elseif v52 == Enum.ComputerCameraMovementMode.Classic or v52 == Enum.ComputerCameraMovementMode.Follow or v52 == Enum.ComputerCameraMovementMode.Default or v52 == Enum.ComputerCameraMovementMode.CameraToggle then
            v54 = l_ClassicCamera_0;
        elseif v52 == Enum.ComputerCameraMovementMode.Orbital then
            v54 = l_OrbitalCamera_0;
        else
            warn("ActivateCameraController did not select a module.");
            return;
        end;
    end;
    if v51:ShouldUseVehicleCamera() then
        v54 = if l_VRService_0.VREnabled then l_VRVehicleCamera_0 else l_VehicleCamera_0;
    end;
    local v55 = nil;
    if not v22[v54] then
        v55 = v54.new();
        v22[v54] = v55;
    else
        v55 = v22[v54];
        if v55.Reset then
            v55:Reset();
        end;
    end;
    if v51.activeCameraController then
        if v51.activeCameraController ~= v55 then
            v51.activeCameraController:Enable(false);
            v51.activeCameraController = v55;
            v51.activeCameraController:Enable(true);
        elseif not v51.activeCameraController:GetEnabled() then
            v51.activeCameraController:Enable(true);
        end;
    elseif v55 ~= nil then
        v51.activeCameraController = v55;
        v51.activeCameraController:Enable(true);
    end;
    if v51.activeCameraController then
        if l_PlayerScripts_0 then
            v51.activeCameraController:SetCameraMovementMode(v52);
            v51.activeCameraController:SetCameraType(v53);
            return;
        elseif v52 ~= nil then
            v51.activeCameraController:SetCameraMovementMode(v52);
            return;
        elseif v53 ~= nil then
            v51.activeCameraController:SetCameraType(v53);
        end;
    end;
end;
v0.OnCameraSubjectChanged = function(v56) --[[ Line: 397 ]] --[[ Name: OnCameraSubjectChanged ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v58 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if v56.activeTransparencyController then
        v56.activeTransparencyController:SetSubject(v58);
    end;
    if v56.activeOcclusionModule then
        v56.activeOcclusionModule:OnCameraSubjectChanged(v58);
    end;
    v56:ActivateCameraController(nil, l_CurrentCamera_1.CameraType);
end;
v0.OnCameraTypeChanged = function(v59, v60) --[[ Line: 412 ]] --[[ Name: OnCameraTypeChanged ]]
    -- upvalues: l_UserInputService_0 (copy), l_CameraUtils_0 (copy)
    if v60 == Enum.CameraType.Scriptable and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
        l_CameraUtils_0.restoreMouseBehavior();
    end;
    v59:ActivateCameraController(nil, v60);
end;
v0.OnCurrentCameraChanged = function(v61) --[[ Line: 424 ]] --[[ Name: OnCurrentCameraChanged ]]
    local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
    if not l_CurrentCamera_2 then
        return;
    else
        if v61.cameraSubjectChangedConn then
            v61.cameraSubjectChangedConn:Disconnect();
        end;
        if v61.cameraTypeChangedConn then
            v61.cameraTypeChangedConn:Disconnect();
        end;
        v61.cameraSubjectChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 436 ]]
            -- upvalues: v61 (copy), l_CurrentCamera_2 (copy)
            v61:OnCameraSubjectChanged(l_CurrentCamera_2.CameraSubject);
        end);
        v61.cameraTypeChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 440 ]]
            -- upvalues: v61 (copy), l_CurrentCamera_2 (copy)
            v61:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
        end);
        v61:OnCameraSubjectChanged(l_CurrentCamera_2.CameraSubject);
        v61:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
        return;
    end;
end;
v0.OnLocalPlayerCameraPropertyChanged = function(v63, v64) --[[ Line: 448 ]] --[[ Name: OnLocalPlayerCameraPropertyChanged ]]
    -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy)
    if v64 == "CameraMode" then
        if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
            if not v63.activeCameraController or v63.activeCameraController:GetModuleName() ~= "ClassicCamera" then
                v63:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
            end;
            if v63.activeCameraController then
                v63.activeCameraController:UpdateForDistancePropertyChange();
                return;
            end;
        elseif l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
            local l_v63_CameraMovementModeFromSettings_0 = v63:GetCameraMovementModeFromSettings();
            v63:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v63_CameraMovementModeFromSettings_0));
            return;
        else
            warn("Unhandled value for property player.CameraMode: ", l_Players_0.LocalPlayer.CameraMode);
            return;
        end;
    elseif v64 == "DevComputerCameraMode" or v64 == "DevTouchCameraMode" then
        local l_v63_CameraMovementModeFromSettings_1 = v63:GetCameraMovementModeFromSettings();
        v63:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v63_CameraMovementModeFromSettings_1));
        return;
    elseif v64 == "DevCameraOcclusionMode" then
        v63:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
        return;
    elseif v64 == "CameraMinZoomDistance" or v64 == "CameraMaxZoomDistance" then
        if v63.activeCameraController then
            v63.activeCameraController:UpdateForDistancePropertyChange();
            return;
        end;
    elseif v64 == "DevTouchMovementMode" then
        return;
    elseif v64 == "DevComputerMovementMode" then
        return;
    elseif v64 == "DevEnableMouseLock" then

    end;
end;
v0.OnUserGameSettingsPropertyChanged = function(v67, v68) --[[ Line: 492 ]] --[[ Name: OnUserGameSettingsPropertyChanged ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v68 == "ComputerCameraMovementMode" then
        local l_v67_CameraMovementModeFromSettings_0 = v67:GetCameraMovementModeFromSettings();
        v67:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v67_CameraMovementModeFromSettings_0));
    end;
end;
v0.Update = function(v70, v71) --[[ Line: 505 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraInput_0 (copy)
    if v70.activeCameraController then
        v70.activeCameraController:UpdateMouseBehavior();
        local v72, v73 = v70.activeCameraController:Update(v71);
        if v70.activeOcclusionModule then
            local v74, v75 = v70.activeOcclusionModule:Update(v71, v72, v73);
            v72 = v74;
            v73 = v75;
        end;
        local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
        l_CurrentCamera_3.CFrame = v72;
        l_CurrentCamera_3.Focus = v73;
        if v70.activeTransparencyController then
            v70.activeTransparencyController:Update(v71);
        end;
        if l_CameraInput_0.getInputEnabled() then
            l_CameraInput_0.resetInputForFrameEnd();
        end;
    end;
end;
if not l_PlayerScripts_0 then
    v0.GetCameraControlChoice = function(_) --[[ Line: 534 ]] --[[ Name: GetCameraControlChoice ]]
        -- upvalues: l_Players_0 (copy), l_UserInputService_0 (copy), l_CameraUtils_0 (copy), l_UserGameSettings_0 (copy)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch or l_UserInputService_0.TouchEnabled then
                if l_LocalPlayer_0.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                    return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
                else
                    return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_LocalPlayer_0.DevTouchCameraMode);
                end;
            elseif l_LocalPlayer_0.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
                local v79 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(v79);
            else
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_LocalPlayer_0.DevComputerCameraMode);
            end;
        else
            return;
        end;
    end;
end;
v0.OnCharacterAdded = function(v80, v81, v82) --[[ Line: 558 ]] --[[ Name: OnCharacterAdded ]]
    if v80.activeOcclusionModule then
        v80.activeOcclusionModule:CharacterAdded(v81, v82);
    end;
end;
v0.OnCharacterRemoving = function(v83, v84, v85) --[[ Line: 564 ]] --[[ Name: OnCharacterRemoving ]]
    if v83.activeOcclusionModule then
        v83.activeOcclusionModule:CharacterRemoving(v84, v85);
    end;
end;
v0.OnPlayerAdded = function(v86, v87) --[[ Line: 570 ]] --[[ Name: OnPlayerAdded ]]
    v87.CharacterAdded:Connect(function(v88) --[[ Line: 571 ]]
        -- upvalues: v86 (copy), v87 (copy)
        v86:OnCharacterAdded(v88, v87);
    end);
    v87.CharacterRemoving:Connect(function(v89) --[[ Line: 574 ]]
        -- upvalues: v86 (copy), v87 (copy)
        v86:OnCharacterRemoving(v89, v87);
    end);
end;
v0.OnMouseLockToggled = function(v90) --[[ Line: 579 ]] --[[ Name: OnMouseLockToggled ]]
    if v90.activeMouseLockController then
        local l_IsMouseLocked_0 = v90.activeMouseLockController:GetIsMouseLocked();
        local l_MouseLockOffset_0 = v90.activeMouseLockController:GetMouseLockOffset();
        if v90.activeCameraController then
            v90.activeCameraController:SetIsMouseLocked(l_IsMouseLocked_0);
            v90.activeCameraController:SetMouseLockOffset(l_MouseLockOffset_0);
        end;
    end;
end;
local _ = v0.new();
return {};