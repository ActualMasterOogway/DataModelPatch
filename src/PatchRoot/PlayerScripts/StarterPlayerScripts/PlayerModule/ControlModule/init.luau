local v0 = {};
v0.__index = v0;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local _ = script.Parent:WaitForChild("CommonUtils");
local l_Keyboard_0 = require(script:WaitForChild("Keyboard"));
local l_Gamepad_0 = require(script:WaitForChild("Gamepad"));
local l_DynamicThumbstick_0 = require(script:WaitForChild("DynamicThumbstick"));
local v12 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
v12 = l_status_0 and l_result_0;
l_status_0 = require(script:WaitForChild("TouchThumbstick"));
l_result_0 = require(script:WaitForChild("ClickToMoveController"));
local l_TouchJump_0 = require(script:WaitForChild("TouchJump"));
local l_VehicleController_0 = require(script:WaitForChild("VehicleController"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v18 = {
    [Enum.TouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbstick] = l_status_0, 
    [Enum.DevTouchMovementMode.Thumbstick] = l_status_0, 
    [Enum.TouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.ClickToMove] = l_result_0, 
    [Enum.DevTouchMovementMode.ClickToMove] = l_result_0, 
    [Enum.TouchMovementMode.Default] = l_DynamicThumbstick_0, 
    [Enum.ComputerMovementMode.Default] = l_Keyboard_0, 
    [Enum.ComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.Scriptable] = nil, 
    [Enum.ComputerMovementMode.ClickToMove] = l_result_0, 
    [Enum.DevComputerMovementMode.ClickToMove] = l_result_0
};
local v19 = {
    [Enum.UserInputType.Keyboard] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton1] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton2] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton3] = l_Keyboard_0, 
    [Enum.UserInputType.MouseWheel] = l_Keyboard_0, 
    [Enum.UserInputType.MouseMovement] = l_Keyboard_0, 
    [Enum.UserInputType.Gamepad1] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad2] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad3] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad4] = l_Gamepad_0
};
local v20 = nil;
v0.new = function() --[[ Line: 93 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_VehicleController_0 (copy), l_Value_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), l_GuiService_0 (copy)
    local v21 = setmetatable({}, v0);
    v21.controllers = {};
    v21.activeControlModule = nil;
    v21.activeController = nil;
    v21.touchJumpController = nil;
    v21.moveFunction = l_Players_0.LocalPlayer.Move;
    v21.humanoid = nil;
    v21.lastInputType = Enum.UserInputType.None;
    v21.controlsEnabled = true;
    v21.humanoidSeatedConn = nil;
    v21.vehicleController = nil;
    v21.touchControlFrame = nil;
    v21.currentTorsoAngle = 0;
    v21.inputMoveVector = Vector3.new(0, 0, 0, 0);
    v21.vehicleController = l_VehicleController_0.new(l_Value_0);
    l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v22) --[[ Line: 119 ]]
        -- upvalues: v21 (copy)
        v21:OnCharacterAdded(v22);
    end);
    l_Players_0.LocalPlayer.CharacterRemoving:Connect(function(v23) --[[ Line: 120 ]]
        -- upvalues: v21 (copy)
        v21:OnCharacterRemoving(v23);
    end);
    if l_Players_0.LocalPlayer.Character then
        v21:OnCharacterAdded(l_Players_0.LocalPlayer.Character);
    end;
    l_RunService_0:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(v24) --[[ Line: 125 ]]
        -- upvalues: v21 (copy)
        v21:OnRenderStepped(v24);
    end);
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v25) --[[ Line: 129 ]]
        -- upvalues: v21 (copy)
        v21:OnLastInputTypeChanged(v25);
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 134 ]]
        -- upvalues: v21 (copy)
        v21:OnTouchMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 137 ]]
        -- upvalues: v21 (copy)
        v21:OnTouchMovementModeChange();
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 141 ]]
        -- upvalues: v21 (copy)
        v21:OnComputerMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 144 ]]
        -- upvalues: v21 (copy)
        v21:OnComputerMovementModeChange();
    end);
    v21.playerGui = nil;
    v21.touchGui = nil;
    v21.playerGuiAddedConn = nil;
    l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 153 ]]
        -- upvalues: v21 (copy)
        v21:UpdateTouchGuiVisibility();
        v21:UpdateActiveControlModuleEnabled();
    end);
    if l_UserInputService_0.TouchEnabled then
        v21.playerGui = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v21.playerGui then
            v21:CreateTouchGuiContainer();
            v21:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
            return v21;
        else
            v21.playerGuiAddedConn = l_Players_0.LocalPlayer.ChildAdded:Connect(function(v26) --[[ Line: 164 ]]
                -- upvalues: v21 (copy), l_UserInputService_0 (ref)
                if v26:IsA("PlayerGui") then
                    v21.playerGui = v26;
                    v21:CreateTouchGuiContainer();
                    v21.playerGuiAddedConn:Disconnect();
                    v21.playerGuiAddedConn = nil;
                    v21:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
                end;
            end);
            return v21;
        end;
    else
        v21:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
        return v21;
    end;
end;
v0.GetMoveVector = function(v27) --[[ Line: 184 ]] --[[ Name: GetMoveVector ]]
    if v27.activeController then
        return v27.activeController:GetMoveVector();
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
local function _(v28) --[[ Line: 191 ]] --[[ Name: NormalizeAngle ]]
    v28 = (v28 + 12.566370614359172) % 6.283185307179586;
    if v28 > 3.141592653589793 then
        v28 = v28 - 6.283185307179586;
    end;
    return v28;
end;
local function _(v30, v31) --[[ Line: 199 ]] --[[ Name: AverageAngle ]]
    local v32 = (v31 - v30 + 12.566370614359172) % 6.283185307179586;
    if v32 > 3.141592653589793 then
        v32 = v32 - 6.283185307179586;
    end;
    local v33 = (v30 + v32 / 2 + 12.566370614359172) % 6.283185307179586;
    if v33 > 3.141592653589793 then
        v33 = v33 - 6.283185307179586;
    end;
    return v33;
end;
v0.GetEstimatedVRTorsoFrame = function(v35) --[[ Line: 204 ]] --[[ Name: GetEstimatedVRTorsoFrame ]]
    -- upvalues: l_VRService_0 (copy)
    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local _, v38, _ = l_l_VRService_0_UserCFrame_0:ToEulerAnglesYXZ();
    v38 = -v38;
    if not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v35.currentTorsoAngle = v38;
    else
        local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
        local v42 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_1.Position;
        local v43 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_2.Position;
        local v44 = -math.atan2(v42.X, v42.Z);
        local v45 = (-math.atan2(v43.X, v43.Z) - v44 + 12.566370614359172) % 6.283185307179586;
        if v45 > 3.141592653589793 then
            v45 = v45 - 6.283185307179586;
        end;
        v45 = (v44 + v45 / 2 + 12.566370614359172) % 6.283185307179586;
        if v45 > 3.141592653589793 then
            v45 = v45 - 6.283185307179586;
        end;
        local l_v45_0 = v45;
        v45 = (v38 - v35.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v45 > 3.141592653589793 then
            v45 = v45 - 6.283185307179586;
        end;
        local l_v45_1 = v45;
        local v48 = (l_v45_0 - v35.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v48 > 3.141592653589793 then
            v48 = v48 - 6.283185307179586;
        end;
        v45 = v48;
        v48 = false;
        if v45 > -1.5707963267948966 then
            v48 = v45 < 1.5707963267948966;
        end;
        if not v48 then
            v45 = l_v45_1;
        end;
        local v49 = math.min(v45, l_v45_1);
        local v50 = math.max(v45, l_v45_1);
        local v51 = 0;
        if v49 > 0 then
            v51 = v49;
        elseif v50 < 0 then
            v51 = v50;
        end;
        v35.currentTorsoAngle = v51 + v35.currentTorsoAngle;
    end;
    return CFrame.new(l_l_VRService_0_UserCFrame_0.Position) * CFrame.fromEulerAnglesYXZ(0, -v35.currentTorsoAngle, 0);
end;
v0.GetActiveController = function(v52) --[[ Line: 248 ]] --[[ Name: GetActiveController ]]
    return v52.activeController;
end;
v0.UpdateActiveControlModuleEnabled = function(v53) --[[ Line: 253 ]] --[[ Name: UpdateActiveControlModuleEnabled ]]
    -- upvalues: l_Players_0 (copy), l_result_0 (copy), l_status_0 (copy), l_DynamicThumbstick_0 (copy), l_TouchJump_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local function _() --[[ Line: 255 ]]
        -- upvalues: v53 (copy), l_Players_0 (ref)
        v53.activeController:Enable(false);
        if v53.touchJumpController then
            v53.touchJumpController:Enable(false);
        end;
        if v53.moveFunction then
            v53.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
    end;
    local function v55() --[[ Line: 266 ]]
        -- upvalues: v53 (copy), l_result_0 (ref), l_status_0 (ref), l_DynamicThumbstick_0 (ref), l_TouchJump_0 (ref), l_Players_0 (ref)
        if v53.touchControlFrame and (v53.activeControlModule == l_result_0 or v53.activeControlModule == l_status_0 or v53.activeControlModule == l_DynamicThumbstick_0) then
            if not v53.controllers[l_TouchJump_0] then
                v53.controllers[l_TouchJump_0] = l_TouchJump_0.new();
            end;
            v53.touchJumpController = v53.controllers[l_TouchJump_0];
            v53.touchJumpController:Enable(true, v53.touchControlFrame);
        elseif v53.touchJumpController then
            v53.touchJumpController:Enable(false);
        end;
        if v53.activeControlModule == l_result_0 then
            v53.activeController:Enable(true, l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, v53.touchJumpController);
            return;
        elseif v53.touchControlFrame then
            v53.activeController:Enable(true, v53.touchControlFrame);
            return;
        else
            v53.activeController:Enable(true);
            return;
        end;
    end;
    if not v53.activeController then
        return;
    elseif not v53.controlsEnabled then
        v53.activeController:Enable(false);
        if v53.touchJumpController then
            v53.touchJumpController:Enable(false);
        end;
        if v53.moveFunction then
            v53.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    elseif not l_GuiService_0.TouchControlsEnabled and l_UserInputService_0.TouchEnabled and (v53.activeControlModule == l_result_0 or v53.activeControlModule == l_status_0 or v53.activeControlModule == l_DynamicThumbstick_0) then
        v53.activeController:Enable(false);
        if v53.touchJumpController then
            v53.touchJumpController:Enable(false);
        end;
        if v53.moveFunction then
            v53.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    else
        v55();
        return;
    end;
end;
v0.Enable = function(v56, v57) --[[ Line: 325 ]] --[[ Name: Enable ]]
    if v57 == nil then
        v57 = true;
    end;
    v56.controlsEnabled = v57;
    if not v56.activeController then
        return;
    else
        v56:UpdateActiveControlModuleEnabled();
        return;
    end;
end;
v0.Disable = function(v58) --[[ Line: 339 ]] --[[ Name: Disable ]]
    v58.controlsEnabled = false;
    v58:UpdateActiveControlModuleEnabled();
end;
v0.SelectComputerMovementModule = function(_) --[[ Line: 347 ]] --[[ Name: SelectComputerMovementModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v19 (copy), v20 (ref), l_UserGameSettings_0 (copy), l_Keyboard_0 (copy), l_result_0 (copy), v18 (copy)
    if not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.GamepadEnabled then
        return nil, false;
    else
        local v60 = nil;
        local l_DevComputerMovementMode_0 = l_Players_0.LocalPlayer.DevComputerMovementMode;
        if l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.UserChoice then
            v60 = v19[v20];
            if l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v60 == l_Keyboard_0 then
                v60 = l_result_0;
            end;
        else
            v60 = v18[l_DevComputerMovementMode_0];
            if not v60 and l_DevComputerMovementMode_0 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", l_DevComputerMovementMode_0);
            end;
        end;
        if v60 then
            return v60, true;
        elseif l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true;
        else
            return nil, false;
        end;
    end;
end;
v0.SelectTouchModule = function(_) --[[ Line: 385 ]] --[[ Name: SelectTouchModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v18 (copy), l_UserGameSettings_0 (copy)
    if not l_UserInputService_0.TouchEnabled then
        return nil, false;
    else
        local v63 = nil;
        local l_DevTouchMovementMode_0 = l_Players_0.LocalPlayer.DevTouchMovementMode;
        if l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.UserChoice then
            v63 = v18[l_UserGameSettings_0.TouchMovementMode];
        elseif l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true;
        else
            v63 = v18[l_DevTouchMovementMode_0];
        end;
        return v63, true;
    end;
end;
local function v68() --[[ Line: 401 ]] --[[ Name: getGamepadRightThumbstickPosition ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1);
    for _, v67 in pairs(l_l_UserInputService_0_GamepadState_0) do
        if v67.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v67.Position;
        end;
    end;
    return (Vector3.new(0, 0, 0, 0));
end;
v0.calculateRawMoveVector = function(v69, v70, v71) --[[ Line: 411 ]] --[[ Name: calculateRawMoveVector ]]
    -- upvalues: l_Workspace_0 (copy), l_VRService_0 (copy), v68 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v71;
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        if l_VRService_0.VREnabled and v70.RootPart then
            local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            l_l_VRService_0_UserCFrame_3 = v69:GetEstimatedVRTorsoFrame();
            l_CFrame_0 = if (l_CurrentCamera_0.Focus.Position - l_CFrame_0.Position).Magnitude < 3 then l_CFrame_0 * l_l_VRService_0_UserCFrame_3 else l_CurrentCamera_0.CFrame * (l_l_VRService_0_UserCFrame_3.Rotation + l_l_VRService_0_UserCFrame_3.Position * l_CurrentCamera_0.HeadScale);
        end;
        if v70:GetState() == Enum.HumanoidStateType.Swimming then
            if l_VRService_0.VREnabled then
                v71 = Vector3.new(v71.X, 0, v71.Z);
                if v71.Magnitude < 0.01 then
                    return Vector3.zero;
                else
                    local v75 = -v68().Y * 1.3962634015954636;
                    local v76 = math.atan2(-v71.X, -v71.Z);
                    local _, v78, _ = l_CFrame_0:ToEulerAnglesYXZ();
                    v76 = v76 + v78;
                    return CFrame.fromEulerAnglesYXZ(v75, v76, 0).LookVector;
                end;
            else
                return l_CFrame_0:VectorToWorldSpace(v71);
            end;
        else
            local v80 = nil;
            local v81 = nil;
            local _, _, _, v85, v86, v87, _, _, v90, _, _, v93 = l_CFrame_0:GetComponents();
            if v90 < 1 and v90 > -1 then
                v80 = v93;
                v81 = v87;
            else
                v80 = v85;
                v81 = -v86 * math.sign(v90);
            end;
            local v94 = math.sqrt(v80 * v80 + v81 * v81);
            return (Vector3.new((v80 * v71.X + v81 * v71.Z) / v94, 0, (v80 * v71.Z - v81 * v71.X) / v94));
        end;
    end;
end;
v0.OnRenderStepped = function(v95, v96) --[[ Line: 470 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: l_Gamepad_0 (copy), l_VRService_0 (copy), l_Players_0 (copy)
    if v95.activeController and v95.activeController.enabled and v95.humanoid then
        local l_MoveVector_0 = v95.activeController:GetMoveVector();
        local v98 = v95.activeController:IsMoveVectorCameraRelative();
        local l_v95_ClickToMoveController_0 = v95:GetClickToMoveController();
        if v95.activeController == l_v95_ClickToMoveController_0 then
            l_v95_ClickToMoveController_0:OnRenderStepped(v96);
        elseif l_MoveVector_0.magnitude > 0 then
            l_v95_ClickToMoveController_0:CleanupPath();
        else
            l_v95_ClickToMoveController_0:OnRenderStepped(v96);
            l_MoveVector_0 = l_v95_ClickToMoveController_0:GetMoveVector();
            v98 = l_v95_ClickToMoveController_0:IsMoveVectorCameraRelative();
        end;
        local v100 = false;
        if v95.vehicleController then
            local v101, v102 = v95.vehicleController:Update(l_MoveVector_0, v98, v95.activeControlModule == l_Gamepad_0);
            l_MoveVector_0 = v101;
            v100 = v102;
        end;
        if v98 then
            l_MoveVector_0 = v95:calculateRawMoveVector(v95.humanoid, l_MoveVector_0);
        end;
        v95.inputMoveVector = l_MoveVector_0;
        if l_VRService_0.VREnabled then
            l_MoveVector_0 = v95:updateVRMoveVector(l_MoveVector_0);
        end;
        v95.moveFunction(l_Players_0.LocalPlayer, l_MoveVector_0, false);
        v95.humanoid.Jump = v95.activeController:GetIsJumping() or v95.touchJumpController and v95.touchJumpController:GetIsJumping();
    end;
end;
v0.updateVRMoveVector = function(v103, v104) --[[ Line: 519 ]] --[[ Name: updateVRMoveVector ]]
    -- upvalues: l_VRService_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v106 = l_CurrentCamera_1.Focus.Position - l_CurrentCamera_1.CFrame.Position;
    local v107 = false;
    if v106.Magnitude < 5 then
        v107 = true;
    end;
    if v104.Magnitude == 0 and v107 and l_VRService_0.AvatarGestures and v103.humanoid and not v103.humanoid.Sit then
        local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        l_l_VRService_0_UserCFrame_4 = l_l_VRService_0_UserCFrame_4.Rotation + l_l_VRService_0_UserCFrame_4.Position * l_CurrentCamera_1.HeadScale;
        local v109 = -0.7 * v103.humanoid.RootPart.Size.Y / 2;
        local v110 = (l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_4 * CFrame.new(0, v109, 0)).Position - v103.humanoid.RootPart.CFrame.Position;
        return (Vector3.new(v110.x, 0, v110.z));
    else
        return v104;
    end;
end;
v0.OnHumanoidSeated = function(v111, v112, v113) --[[ Line: 544 ]] --[[ Name: OnHumanoidSeated ]]
    -- upvalues: l_Value_0 (copy)
    if v112 then
        if v113 and v113:IsA("VehicleSeat") then
            if not v111.vehicleController then
                v111.vehicleController = v111.vehicleController.new(l_Value_0);
            end;
            v111.vehicleController:Enable(true, v113);
            return;
        end;
    elseif v111.vehicleController then
        v111.vehicleController:Enable(false, v113);
    end;
end;
v0.OnCharacterAdded = function(v114, v115) --[[ Line: 559 ]] --[[ Name: OnCharacterAdded ]]
    v114.humanoid = v115:FindFirstChildOfClass("Humanoid");
    while not v114.humanoid do
        v115.ChildAdded:wait();
        v114.humanoid = v115:FindFirstChildOfClass("Humanoid");
    end;
    v114:UpdateTouchGuiVisibility();
    if v114.humanoidSeatedConn then
        v114.humanoidSeatedConn:Disconnect();
        v114.humanoidSeatedConn = nil;
    end;
    v114.humanoidSeatedConn = v114.humanoid.Seated:Connect(function(v116, v117) --[[ Line: 572 ]]
        -- upvalues: v114 (copy)
        v114:OnHumanoidSeated(v116, v117);
    end);
end;
v0.OnCharacterRemoving = function(v118, _) --[[ Line: 577 ]] --[[ Name: OnCharacterRemoving ]]
    v118.humanoid = nil;
    v118:UpdateTouchGuiVisibility();
end;
v0.UpdateTouchGuiVisibility = function(v120) --[[ Line: 583 ]] --[[ Name: UpdateTouchGuiVisibility ]]
    -- upvalues: l_GuiService_0 (copy)
    if v120.touchGui then
        local v121 = v120.humanoid and l_GuiService_0.TouchControlsEnabled;
        v120.touchGui.Enabled = not not v121;
    end;
end;
v0.SwitchToController = function(v122, v123) --[[ Line: 597 ]] --[[ Name: SwitchToController ]]
    -- upvalues: l_Value_0 (copy)
    if not v123 then
        if v122.activeController then
            v122.activeController:Enable(false);
        end;
        v122.activeController = nil;
        v122.activeControlModule = nil;
        return;
    else
        if not v122.controllers[v123] then
            v122.controllers[v123] = v123.new(l_Value_0);
        end;
        if v122.activeController ~= v122.controllers[v123] then
            if v122.activeController then
                v122.activeController:Enable(false);
            end;
            v122.activeController = v122.controllers[v123];
            v122.activeControlModule = v123;
            v122:UpdateActiveControlModuleEnabled();
        end;
        return;
    end;
end;
v0.OnLastInputTypeChanged = function(v124, v125) --[[ Line: 625 ]] --[[ Name: OnLastInputTypeChanged ]]
    -- upvalues: v20 (ref), v19 (copy)
    if v20 == v125 then
        warn("LastInputType Change listener called with current type.");
    end;
    v20 = v125;
    if v20 == Enum.UserInputType.Touch then
        local v126, v127 = v124:SelectTouchModule();
        if v127 then
            while not v124.touchControlFrame do
                wait();
            end;
            v124:SwitchToController(v126);
        end;
    elseif v19[v20] ~= nil then
        local v128 = v124:SelectComputerMovementModule();
        if v128 then
            v124:SwitchToController(v128);
        end;
    end;
    v124:UpdateTouchGuiVisibility();
end;
v0.OnComputerMovementModeChange = function(v129) --[[ Line: 652 ]] --[[ Name: OnComputerMovementModeChange ]]
    local v130, v131 = v129:SelectComputerMovementModule();
    if v131 then
        v129:SwitchToController(v130);
    end;
end;
v0.OnTouchMovementModeChange = function(v132) --[[ Line: 659 ]] --[[ Name: OnTouchMovementModeChange ]]
    local v133, v134 = v132:SelectTouchModule();
    if v134 then
        while not v132.touchControlFrame do
            wait();
        end;
        v132:SwitchToController(v133);
    end;
end;
v0.CreateTouchGuiContainer = function(v135) --[[ Line: 669 ]] --[[ Name: CreateTouchGuiContainer ]]
    -- upvalues: v12 (ref)
    if v135.touchGui then
        v135.touchGui:Destroy();
    end;
    v135.touchGui = Instance.new("ScreenGui");
    v135.touchGui.Name = "TouchGui";
    v135.touchGui.ResetOnSpawn = false;
    v135.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v135:UpdateTouchGuiVisibility();
    if v12 then
        v135.touchGui.ClipToDeviceSafeArea = false;
    end;
    v135.touchControlFrame = Instance.new("Frame");
    v135.touchControlFrame.Name = "TouchControlFrame";
    v135.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
    v135.touchControlFrame.BackgroundTransparency = 1;
    v135.touchControlFrame.Parent = v135.touchGui;
    v135.touchGui.Parent = v135.playerGui;
end;
v0.GetClickToMoveController = function(v136) --[[ Line: 692 ]] --[[ Name: GetClickToMoveController ]]
    -- upvalues: l_result_0 (copy), l_Value_0 (copy)
    if not v136.controllers[l_result_0] then
        v136.controllers[l_result_0] = l_result_0.new(l_Value_0);
    end;
    return v136.controllers[l_result_0];
end;
return v0.new();