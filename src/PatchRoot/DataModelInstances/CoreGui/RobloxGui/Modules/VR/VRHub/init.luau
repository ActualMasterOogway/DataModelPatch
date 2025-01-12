local _ = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_1 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0.RobloxGui;
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_LaserPointer_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).LaserPointer;
local l_VRControllerModel_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRControllerModel;
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local v14 = require(script.Parent.SafetyBubble);
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = l_HttpService_0:GenerateGUID(true);
v15.LaserPointer = nil;
v15.ControllerModelsEnabled = false;
v15.LeftControllerModel = nil;
v15.RightControllerModel = nil;
v15.isFPSAtTarget = l_SplashScreenManager_0.isFPSAtTarget();
v15.SafetyBubble = nil;
v15.IsFirstPerson = false;
l_StarterGui_1:RegisterSetCore("VRLaserPointerMode", function(v19) --[[ Line: 44 ]]
    -- upvalues: v15 (copy), l_LaserPointer_0 (copy)
    if not v15.LaserPointer then
        return;
    elseif not v19 or not tostring(v19) then
        return;
    else
        v15.LaserPointer:setMode(l_LaserPointer_0.Mode[tostring(v19)] or l_LaserPointer_0.Mode.Disabled);
        return;
    end;
end);
local function v21(v20) --[[ Line: 54 ]] --[[ Name: enableControllerModels ]]
    -- upvalues: v15 (copy), l_VRControllerModel_0 (copy)
    if v20 ~= v15.ControllerModelsEnabled then
        v15.ControllerModelsEnabled = v20;
        if v20 then
            if not v15.LeftControllerModel then
                v15.LeftControllerModel = l_VRControllerModel_0.new(Enum.UserCFrame.LeftHand);
            end;
            v15.LeftControllerModel:setEnabled(true);
            if not v15.RightControllerModel then
                v15.RightControllerModel = l_VRControllerModel_0.new(Enum.UserCFrame.RightHand);
            end;
            v15.RightControllerModel:setEnabled(true);
            return;
        else
            if v15.LeftControllerModel then
                v15.LeftControllerModel:setEnabled(false);
            end;
            if v15.RightControllerModel then
                v15.RightControllerModel:setEnabled(false);
            end;
        end;
    end;
end;
l_StarterGui_1:RegisterSetCore("VREnableControllerModels", function(v22) --[[ Line: 83 ]]
    -- upvalues: l_VRService_0 (copy)
    if v22 then
        l_VRService_0.ControllerModels = Enum.VRControllerModelMode.Transparent;
        return;
    else
        l_VRService_0.ControllerModels = Enum.VRControllerModelMode.Disabled;
        return;
    end;
end);
l_VRService_0:GetPropertyChangedSignal("ControllerModels"):Connect(function() --[[ Line: 91 ]]
    -- upvalues: v21 (copy), l_VRService_0 (copy)
    v21(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
end);
local v23 = tick();
local function v26() --[[ Line: 96 ]] --[[ Name: onRenderSteppedLast ]]
    -- upvalues: v23 (ref), v15 (copy)
    local v24 = tick();
    local v25 = v24 - v23;
    v23 = v24;
    if v15.LaserPointer then
        v15.LaserPointer:update(v25);
    end;
    if v15.LeftControllerModel then
        v15.LeftControllerModel:update(v25);
    end;
    if v15.RightControllerModel then
        v15.RightControllerModel:update(v25);
    end;
    if v15.SafetyBubble then
        v15.SafetyBubble:update(v25);
    end;
end;
local function v27() --[[ Line: 117 ]] --[[ Name: onCameraCFrameChanged ]]
    -- upvalues: v15 (copy)
    if v15.LaserPointer then
        v15.LaserPointer:update(0);
    end;
    if v15.LeftControllerModel then
        v15.LeftControllerModel:update(0);
    end;
    if v15.RightControllerModel then
        v15.RightControllerModel:update(0);
    end;
end;
local v28 = nil;
local function v29() --[[ Line: 135 ]] --[[ Name: onCurrentCameraChanged ]]
    -- upvalues: v28 (ref), v27 (copy)
    if v28 then
        v28:disconnect();
    end;
    if workspace.CurrentCamera then
        v28 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v27);
    end;
end;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v29);
if v28 then
    v28:disconnect();
end;
if workspace.CurrentCamera then
    v28 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v27);
end;
local function v30() --[[ Line: 147 ]] --[[ Name: onVREnabledChanged ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy), v15 (copy), l_LaserPointer_0 (copy), v21 (copy), l_RunService_0 (copy), v18 (copy), v26 (copy), v14 (copy), l_ContextActionService_0 (copy)
    if l_VRService_0.VREnabled then
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        if not v15.LaserPointer then
            v15.LaserPointer = l_LaserPointer_0.new();
        end;
        if v15.LaserPointer then
            if v15.isFPSAtTarget then
                v15.LaserPointer:setMode(l_LaserPointer_0.Mode.Navigation);
            else
                v15.LaserPointer:setMode(l_LaserPointer_0.Mode.Disabled);
            end;
        end;
        v21(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
        l_RunService_0:BindToRenderStep(v18, Enum.RenderPriority.Last.Value, v26);
        if v15.LaserPointer then
            v15.LaserPointer:setForcePointer(true);
        end;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        v15.SafetyBubble = v14.new();
        l_ContextActionService_0:BindCoreActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        return;
    else
        if v15.LaserPointer then
            v15.LaserPointer:setMode(l_LaserPointer_0.Mode.Disabled);
        end;
        l_RunService_0:UnbindFromRenderStep(v18);
        return;
    end;
end;
local function _(v31) --[[ Line: 186 ]] --[[ Name: onVREnabled ]]
    -- upvalues: v30 (copy)
    if v31 ~= "VREnabled" then
        return;
    else
        v30();
        return;
    end;
end;
local function v33() --[[ Line: 193 ]] --[[ Name: onVRSessionStateChanged ]]
    -- upvalues: l_VRService_0 (copy), v15 (copy), l_LaserPointer_0 (copy), v21 (copy)
    if l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
        if v15.LaserPointer and v15.LaserPointer.Mode.Disabled then
            v15.LaserPointer:setMode(l_LaserPointer_0.Mode.Navigation);
            v21(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
        end;
        if not v15.ControllerModelsEnabled then
            v21(l_VRService_0.ControllerModels == Enum.VRControllerModelMode.Transparent);
            return;
        end;
    else
        if v15.LaserPointer and v15.LaserPointer.Mode.Navigation then
            v15.LaserPointer:setMode(l_LaserPointer_0.Mode.Disabled);
        end;
        if v15.ControllerModelsEnabled then
            v21(false);
        end;
    end;
end;
local function v35(v34) --[[ Line: 212 ]] --[[ Name: onVRPropertyChanged ]]
    -- upvalues: v30 (copy), v33 (copy)
    if v34 == "VREnabled" then
        v30();
        return;
    else
        if v34 == "VRSessionState" then
            v33();
        end;
        return;
    end;
end;
v30();
l_VRService_0.Changed:connect(v35);
v15.RegisterModule = function(_, v37) --[[ Line: 224 ]] --[[ Name: RegisterModule ]]
    -- upvalues: v16 (copy)
    v16[v37.ModuleName] = v37;
end;
v15.GetModule = function(_, v39) --[[ Line: 228 ]] --[[ Name: GetModule ]]
    -- upvalues: v16 (copy)
    return v16[v39];
end;
v15.IsModuleOpened = function(_, v41) --[[ Line: 232 ]] --[[ Name: IsModuleOpened ]]
    -- upvalues: v17 (copy)
    return v17[v41] ~= nil;
end;
v15.GetOpenedModules = function(_) --[[ Line: 236 ]] --[[ Name: GetOpenedModules ]]
    -- upvalues: v17 (copy)
    local v43 = {};
    for _, v45 in pairs(v17) do
        table.insert(v43, v45);
    end;
    return v43;
end;
v15.ModuleOpened = l_Create_0("BindableEvent")({
    Name = "VRModuleOpened"
});
v15.FireModuleOpened = function(_, v47) --[[ Line: 250 ]] --[[ Name: FireModuleOpened ]]
    -- upvalues: v16 (copy), v17 (copy), v15 (copy)
    if not v16[v47] then
        error("Tried to open module that is not registered: " .. v47);
    end;
    if v17[v47] ~= v16[v47] then
        v17[v47] = v16[v47];
        v15.ModuleOpened:Fire(v47);
    end;
end;
v15.ModuleClosed = l_Create_0("BindableEvent")({
    Name = "VRModuleClosed"
});
v15.FireModuleClosed = function(_, v49) --[[ Line: 265 ]] --[[ Name: FireModuleClosed ]]
    -- upvalues: v16 (copy), v17 (copy), v15 (copy)
    if not v16[v49] then
        error("Tried to close module that is not registered: " .. v49);
    end;
    if v17[v49] ~= nil then
        v17[v49] = nil;
        v15.ModuleClosed:Fire(v49);
    end;
end;
v15.KeepVRTopbarOpen = function(_) --[[ Line: 276 ]] --[[ Name: KeepVRTopbarOpen ]]
    -- upvalues: v17 (copy)
    for _, v52 in pairs(v17) do
        if v52.KeepVRTopbarOpen then
            return true;
        end;
    end;
    return false;
end;
v15.ShowHighlightedLeaveGameIcon = false;
v15.ShowHighlightedLeaveGameIconToggled = l_Create_0("BindableEvent")({
    Name = "ShowHighlightedLeaveGameIconToggled"
});
v15.SetShowHighlightedLeaveGameIconToggled = function(_, v54) --[[ Line: 291 ]] --[[ Name: SetShowHighlightedLeaveGameIconToggled ]]
    -- upvalues: v15 (copy)
    if v15.ShowHighlightedLeaveGameIcon ~= v54 then
        v15.ShowHighlightedLeaveGameIcon = v54;
        v15.ShowHighlightedLeaveGameIconToggled:Fire();
    end;
end;
v15.ShowTopBar = true;
v15.ShowMoreMenu = false;
v15.ShowTopBarChanged = l_Create_0("BindableEvent")({
    Name = "ShowTopBarChanged"
});
v15.ShowMoreMenuChanged = l_Create_0("BindableEvent")({
    Name = "ShowMoreMenuChanged"
});
v15.SetShowTopBar = function(_, v56) --[[ Line: 309 ]] --[[ Name: SetShowTopBar ]]
    -- upvalues: v15 (copy)
    if v15.ShowTopBar ~= v56 then
        v15.ShowTopBar = v56;
        v15.ShowTopBarChanged:Fire();
    end;
end;
v15.SetShowMoreMenu = function(_, v58) --[[ Line: 316 ]] --[[ Name: SetShowMoreMenu ]]
    -- upvalues: v15 (copy)
    if v15.ShowMoreMenu ~= v58 then
        v15.ShowMoreMenu = v58;
        v15.ShowMoreMenuChanged:Fire();
    end;
end;
v15.ToggleSafetyBubble = function(_) --[[ Line: 323 ]] --[[ Name: ToggleSafetyBubble ]]
    -- upvalues: v15 (copy)
    if v15.SafetyBubble then
        v15.SafetyBubble:ToggleEnabled();
    end;
end;
v15.GetControllerModel = function(_, v61) --[[ Line: 329 ]] --[[ Name: GetControllerModel ]]
    -- upvalues: v15 (copy)
    if v61 == Enum.UserCFrame.LeftHand then
        return v15.LeftControllerModel;
    elseif v61 == Enum.UserCFrame.RightHand then
        return v15.RightControllerModel;
    else
        return nil;
    end;
end;
v15.GetControllerButtonPosition = function(_, v63) --[[ Line: 339 ]] --[[ Name: GetControllerButtonPosition ]]
    -- upvalues: v15 (copy)
    return v15.LeftControllerModel and v15.LeftControllerModel:getButtonPosition(v63), v15.RightControllerModel and v15.RightControllerModel:getButtonPosition(v63);
end;
l_SplashScreenManager_0.addStatusChangeListener(function(v64) --[[ Line: 345 ]]
    -- upvalues: v15 (copy), v30 (copy)
    v15.isFPSAtTarget = v64;
    v30();
end);
return v15;