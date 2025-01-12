local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v7 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v10 = Vector2.new(1, 0.77) * 0.06981317007977318;
local v11 = Vector2.new(1, 0.77) * 0.008726646259971648;
local v12 = Vector2.new(1, 0.77) * 0.12217304763960307;
local v13 = Vector2.new(1, 0.66) * 0.017453292519943295;
if v7 then
    v10 = v10 * 60;
end;
local v14 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
    return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen");
end);
v14 = l_status_0 and l_result_0;
l_status_0 = nil;
local v17;
l_result_0, v17 = pcall(function() --[[ Line: 49 ]]
    return UserSettings():IsUserFeatureEnabled("UserClearPanOnCameraDisable");
end);
l_status_0 = l_result_0 and v17;
l_result_0 = nil;
local v18;
v17, v18 = pcall(function() --[[ Line: 57 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixGamepadSensitivity");
end);
l_result_0 = v17 and v18;
v17 = nil;
v18 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
v17 = l_BindableEvent_0.Event;
v18 = l_BindableEvent_1.Event;
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 20 -> 52 ]];
l_UserInputService_0.InputBegan:Connect(function(v22, v23) --[[ Line: 71 ]]
    -- upvalues: l_l_BindableEvent_0_0 (copy)
    if not v23 and v22.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_0_0:Fire();
    end;
end);
local l_l_BindableEvent_1_0 = l_BindableEvent_1 --[[ copy: 21 -> 53 ]];
l_UserInputService_0.InputEnded:Connect(function(v25, _) --[[ Line: 77 ]]
    -- upvalues: l_l_BindableEvent_1_0 (copy)
    if v25.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_1_0:Fire();
    end;
end);
l_BindableEvent_0 = nil;
l_BindableEvent_0 = function(v27) --[[ Line: 88 ]] --[[ Name: thumbstickCurve ]]
    local v28 = (math.exp(2 * ((math.abs(v27) - 0.1) / 0.9)) - 1) / 6.38905609893065;
    return math.sign(v27) * math.clamp(v28, 0, 1);
end;
l_BindableEvent_1 = function(v29) --[[ Line: 102 ]] --[[ Name: adjustTouchPitchSensitivity ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v29;
    else
        local v31 = l_CurrentCamera_0.CFrame:ToEulerAnglesYXZ();
        if v29.Y * v31 >= 0 then
            return v29;
        else
            local v32 = (1 - (2 * math.abs(v31) / 3.141592653589793) ^ 0.75) * 0.75 + 0.25;
            return Vector2.new(1, v32) * v29;
        end;
    end;
end;
local function v41(v33) --[[ Line: 128 ]] --[[ Name: isInDynamicThumbstickArea ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
    local v35 = l_PlayerGui_0 and l_PlayerGui_0:FindFirstChild("TouchGui");
    local v36 = v35 and v35:FindFirstChild("TouchControlFrame");
    local v37 = v36 and v36:FindFirstChild("DynamicThumbstickFrame");
    if not v37 then
        return false;
    elseif not v35.Enabled then
        return false;
    else
        local l_AbsolutePosition_0 = v37.AbsolutePosition;
        local v39 = l_AbsolutePosition_0 + v37.AbsoluteSize;
        local v40 = false;
        if v33.X >= l_AbsolutePosition_0.X then
            v40 = false;
            if v33.Y >= l_AbsolutePosition_0.Y then
                v40 = false;
                if v33.X <= v39.X then
                    v40 = v33.Y <= v39.Y;
                end;
            end;
        end;
        return v40;
    end;
end;
local v42 = 0.016666666666666666;
l_RunService_0.Stepped:Connect(function(_, v44) --[[ Line: 153 ]]
    -- upvalues: v42 (ref)
    v42 = v44;
end);
local v45 = {};
local v46 = {};
local v47 = 0;
do
    local l_v46_0, l_v47_0 = v46, v47;
    local function _() --[[ Line: 163 ]] --[[ Name: incPanInputCount ]]
        -- upvalues: l_v47_0 (ref)
        l_v47_0 = math.max(0, l_v47_0 + 1);
    end;
    local function _() --[[ Line: 167 ]] --[[ Name: decPanInputCount ]]
        -- upvalues: l_v47_0 (ref)
        l_v47_0 = math.max(0, l_v47_0 - 1);
    end;
    local function _() --[[ Line: 171 ]] --[[ Name: resetPanInputCount ]]
        -- upvalues: l_v47_0 (ref)
        l_v47_0 = 0;
    end;
    local v53 = {
        Thumbstick2 = Vector2.new()
    };
    local v54 = {
        Left = 0, 
        Right = 0, 
        I = 0, 
        O = 0
    };
    local v55 = {
        Movement = Vector2.new(), 
        Wheel = 0, 
        Pan = Vector2.new(), 
        Pinch = 0
    };
    local v56 = {
        Move = Vector2.new(), 
        Pinch = 0
    };
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    v45.gamepadZoomPress = l_BindableEvent_2.Event;
    local v58 = l_VRService_0.VREnabled and Instance.new("BindableEvent") or nil;
    if l_VRService_0.VREnabled then
        v45.gamepadReset = v58.Event;
    end;
    local l_v53_0 = v53 --[[ copy: 30 -> 54 ]];
    v45.getRotationActivated = function() --[[ Line: 204 ]] --[[ Name: getRotationActivated ]]
        -- upvalues: l_v47_0 (ref), l_v53_0 (copy)
        local v60 = true;
        if l_v47_0 <= 0 then
            v60 = l_v53_0.Thumbstick2.Magnitude > 0;
        end;
        return v60;
    end;
    v45.getRotation = function(v61, v62) --[[ Line: 208 ]] --[[ Name: getRotation ]]
        -- upvalues: l_UserGameSettings_0 (copy), v7 (copy), v54 (copy), v42 (ref), l_result_0 (ref), l_v53_0 (copy), v55 (copy), l_BindableEvent_1 (copy), v56 (copy), v10 (ref), v11 (copy), v12 (copy), v13 (copy)
        local v63 = Vector2.new(1, l_UserGameSettings_0:GetCameraYInvertValue());
        local v64 = nil;
        v64 = if v7 then Vector2.new(v54.Right - v54.Left, 0) * v61 else Vector2.new(v54.Right - v54.Left, 0) * v42;
        local v65 = nil;
        v65 = if l_result_0 then l_v53_0.Thumbstick2 * l_UserGameSettings_0.GamepadCameraSensitivity else l_v53_0.Thumbstick2;
        if v7 then
            v65 = v65 * v61;
        end;
        local l_Movement_0 = v55.Movement;
        local l_Pan_0 = v55.Pan;
        local v68 = l_BindableEvent_1(v56.Move);
        if v62 then
            v64 = Vector2.new();
        end;
        return (v64 * 2.0943951023931953 + v65 * v10 + l_Movement_0 * v11 + l_Pan_0 * v12 + v68 * v13) * v63;
    end;
    v45.getZoomDelta = function() --[[ Line: 248 ]] --[[ Name: getZoomDelta ]]
        -- upvalues: v54 (copy), v55 (copy), v56 (copy)
        local v69 = v54.O - v54.I;
        local v70 = -v55.Wheel + v55.Pinch;
        local v71 = -v56.Pinch;
        return v69 * 0.1 + v70 * 1 + v71 * 0.04;
    end;
    local function v76(_, _, v74) --[[ Line: 256 ]] --[[ Name: thumbstick ]]
        -- upvalues: l_v53_0 (copy), l_BindableEvent_0 (ref)
        local l_Position_0 = v74.Position;
        l_v53_0[v74.KeyCode.Name] = Vector2.new(l_BindableEvent_0(l_Position_0.X), -l_BindableEvent_0(l_Position_0.Y));
        return Enum.ContextActionResult.Pass;
    end;
    local function _(v77) --[[ Line: 262 ]] --[[ Name: mouseMovement ]]
        -- upvalues: v55 (copy)
        local l_Delta_0 = v77.Delta;
        v55.Movement = Vector2.new(l_Delta_0.X, l_Delta_0.Y);
    end;
    local _ = function(_, _, v82) --[[ Line: 267 ]] --[[ Name: mouseWheel ]]
        -- upvalues: v55 (copy)
        v55.Wheel = v82.Position.Z;
        return Enum.ContextActionResult.Pass;
    end;
    local function v87(_, v85, v86) --[[ Line: 272 ]] --[[ Name: keypress ]]
        -- upvalues: v54 (copy)
        v54[v86.KeyCode.Name] = v85 == Enum.UserInputState.Begin and 1 or 0;
    end;
    local function v91(_, v89, _) --[[ Line: 276 ]] --[[ Name: gamepadZoomPress ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if v89 == Enum.UserInputState.Begin then
            l_BindableEvent_2:Fire();
        end;
    end;
    local function v95(_, v93, _) --[[ Line: 282 ]] --[[ Name: gamepadReset ]]
        -- upvalues: v58 (copy)
        if v93 == Enum.UserInputState.Begin then
            v58:Fire();
        end;
    end;
    local function v100() --[[ Line: 288 ]] --[[ Name: resetInputDevices ]]
        -- upvalues: l_v53_0 (copy), v54 (copy), v55 (copy), v56 (copy), l_status_0 (ref), l_v47_0 (ref)
        for _, v97 in pairs({
            l_v53_0, 
            v54, 
            v55, 
            v56
        }) do
            for v98, v99 in pairs(v97) do
                if type(v99) == "boolean" then
                    v97[v98] = false;
                else
                    v97[v98] = v97[v98] * 0;
                end;
            end;
        end;
        if l_status_0 then
            l_v47_0 = 0;
        end;
    end;
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    local v104 = nil;
    local v105 = {};
    local v106 = nil;
    local v107 = nil;
    do
        local l_v105_0, l_v106_0, l_v107_0 = v105, v106, v107;
        v101 = function(v111, v112) --[[ Line: 316 ]] --[[ Name: touchBegan ]]
            -- upvalues: l_v106_0 (ref), v41 (copy), l_v47_0 (ref), l_v105_0 (ref)
            assert(v111.UserInputType == Enum.UserInputType.Touch);
            assert(v111.UserInputState == Enum.UserInputState.Begin);
            if l_v106_0 == nil and v41(v111.Position) and not v112 then
                l_v106_0 = v111;
                return;
            else
                if not v112 then
                    l_v47_0 = math.max(0, l_v47_0 + 1);
                end;
                l_v105_0[v111] = v112;
                return;
            end;
        end;
        v103 = function(v113, _) --[[ Line: 336 ]] --[[ Name: touchEnded ]]
            -- upvalues: l_v106_0 (ref), l_v105_0 (ref), l_v107_0 (ref), l_v47_0 (ref)
            assert(v113.UserInputType == Enum.UserInputType.Touch);
            assert(v113.UserInputState == Enum.UserInputState.End);
            if v113 == l_v106_0 then
                l_v106_0 = nil;
            end;
            if l_v105_0[v113] == false then
                l_v107_0 = nil;
                l_v47_0 = math.max(0, l_v47_0 - 1);
            end;
            l_v105_0[v113] = nil;
        end;
        v102 = function(v115, v116) --[[ Line: 355 ]] --[[ Name: touchChanged ]]
            -- upvalues: l_v106_0 (ref), l_v105_0 (ref), v56 (copy), l_v107_0 (ref)
            assert(v115.UserInputType == Enum.UserInputType.Touch);
            assert(v115.UserInputState == Enum.UserInputState.Change);
            if v115 == l_v106_0 then
                return;
            else
                if l_v105_0[v115] == nil then
                    l_v105_0[v115] = v116;
                end;
                local v117 = {};
                for v118, v119 in pairs(l_v105_0) do
                    if not v119 then
                        table.insert(v117, v118);
                    end;
                end;
                if #v117 == 1 and l_v105_0[v115] == false then
                    local l_Delta_1 = v115.Delta;
                    local l_v56_0 = v56;
                    l_v56_0.Move = l_v56_0.Move + Vector2.new(l_Delta_1.X, l_Delta_1.Y);
                end;
                if #v117 == 2 then
                    local l_Magnitude_0 = (v117[1].Position - v117[2].Position).Magnitude;
                    if l_v107_0 then
                        local l_v56_1 = v56;
                        l_v56_1.Pinch = l_v56_1.Pinch + (l_Magnitude_0 - l_v107_0);
                    end;
                    l_v107_0 = l_Magnitude_0;
                    return;
                else
                    l_v107_0 = nil;
                    return;
                end;
            end;
        end;
        v104 = function() --[[ Line: 399 ]] --[[ Name: resetTouchState ]]
            -- upvalues: l_v105_0 (ref), l_v106_0 (ref), l_v107_0 (ref), v14 (ref), l_v47_0 (ref)
            l_v105_0 = {};
            l_v106_0 = nil;
            l_v107_0 = nil;
            if v14 then
                l_v47_0 = 0;
            end;
        end;
    end;
    v105 = function(v124, v125, v126, v127) --[[ Line: 409 ]] --[[ Name: pointerAction ]]
        -- upvalues: v55 (copy)
        if not v127 then
            v55.Wheel = v124;
            v55.Pan = v125;
            v55.Pinch = -v126;
        end;
    end;
    do
        local l_v101_0, l_v102_0, l_v103_0, l_v104_0 = v101, v102, v103, v104;
        v106 = function(v132, v133) --[[ Line: 417 ]] --[[ Name: inputBegan ]]
            -- upvalues: l_v101_0 (ref), l_v47_0 (ref)
            if v132.UserInputType == Enum.UserInputType.Touch then
                l_v101_0(v132, v133);
                return;
            else
                if v132.UserInputType == Enum.UserInputType.MouseButton2 and not v133 then
                    l_v47_0 = math.max(0, l_v47_0 + 1);
                end;
                return;
            end;
        end;
        v107 = function(v134, v135) --[[ Line: 426 ]] --[[ Name: inputChanged ]]
            -- upvalues: l_v102_0 (ref), v55 (copy)
            if v134.UserInputType == Enum.UserInputType.Touch then
                l_v102_0(v134, v135);
                return;
            else
                if v134.UserInputType == Enum.UserInputType.MouseMovement then
                    local l_Delta_2 = v134.Delta;
                    v55.Movement = Vector2.new(l_Delta_2.X, l_Delta_2.Y);
                end;
                return;
            end;
        end;
        local function v139(v137, v138) --[[ Line: 435 ]] --[[ Name: inputEnded ]]
            -- upvalues: l_v103_0 (ref), l_v47_0 (ref)
            if v137.UserInputType == Enum.UserInputType.Touch then
                l_v103_0(v137, v138);
                return;
            else
                if v137.UserInputType == Enum.UserInputType.MouseButton2 then
                    l_v47_0 = math.max(0, l_v47_0 - 1);
                end;
                return;
            end;
        end;
        local v140 = false;
        v45.setInputEnabled = function(v141) --[[ Line: 446 ]] --[[ Name: setInputEnabled ]]
            -- upvalues: v140 (ref), v100 (copy), l_v104_0 (ref), l_ContextActionService_0 (copy), v76 (copy), l_Value_0 (copy), v87 (copy), l_VRService_0 (copy), v95 (copy), v91 (copy), l_v46_0 (ref), l_UserInputService_0 (copy), v106 (copy), v107 (copy), v139 (copy), v105 (copy), v14 (ref)
            if v140 == v141 then
                return;
            else
                v140 = v141;
                v100();
                l_v104_0();
                if v140 then
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraThumbstick", v76, false, l_Value_0, Enum.KeyCode.Thumbstick2);
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraKeypress", v87, false, l_Value_0, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:BindAction("RbxCameraGamepadReset", v95, false, Enum.KeyCode.ButtonL3);
                    end;
                    l_ContextActionService_0:BindAction("RbxCameraGamepadZoom", v91, false, Enum.KeyCode.ButtonR3);
                    table.insert(l_v46_0, l_UserInputService_0.InputBegan:Connect(v106));
                    table.insert(l_v46_0, l_UserInputService_0.InputChanged:Connect(v107));
                    table.insert(l_v46_0, l_UserInputService_0.InputEnded:Connect(v139));
                    table.insert(l_v46_0, l_UserInputService_0.PointerAction:Connect(v105));
                    if v14 then
                        local l_GuiService_0 = game:GetService("GuiService");
                        table.insert(l_v46_0, l_GuiService_0.MenuOpened:connect(l_v104_0));
                        return;
                    end;
                else
                    l_ContextActionService_0:UnbindAction("RbxCameraThumbstick");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseMove");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseWheel");
                    l_ContextActionService_0:UnbindAction("RbxCameraKeypress");
                    l_ContextActionService_0:UnbindAction("RbxCameraGamepadZoom");
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:UnbindAction("RbxCameraGamepadReset");
                    end;
                    for _, v144 in pairs(l_v46_0) do
                        v144:Disconnect();
                    end;
                    l_v46_0 = {};
                end;
                return;
            end;
        end;
        v45.getInputEnabled = function() --[[ Line: 518 ]] --[[ Name: getInputEnabled ]]
            -- upvalues: v140 (ref)
            return v140;
        end;
        v45.resetInputForFrameEnd = function() --[[ Line: 522 ]] --[[ Name: resetInputForFrameEnd ]]
            -- upvalues: v55 (copy), v56 (copy)
            v55.Movement = Vector2.new();
            v56.Move = Vector2.new();
            v56.Pinch = 0;
            v55.Wheel = 0;
            v55.Pan = Vector2.new();
            v55.Pinch = 0;
        end;
        l_UserInputService_0.WindowFocused:Connect(v100);
        l_UserInputService_0.WindowFocusReleased:Connect(v100);
    end;
end;
v46 = false;
v47 = false;
local v145 = 0;
do
    local l_v46_1, l_v47_1, l_v145_0 = v46, v47, v145;
    v45.getHoldPan = function() --[[ Line: 543 ]] --[[ Name: getHoldPan ]]
        -- upvalues: l_v46_1 (ref)
        return l_v46_1;
    end;
    v45.getTogglePan = function() --[[ Line: 547 ]] --[[ Name: getTogglePan ]]
        -- upvalues: l_v47_1 (ref)
        return l_v47_1;
    end;
    v45.getPanning = function() --[[ Line: 551 ]] --[[ Name: getPanning ]]
        -- upvalues: l_v47_1 (ref), l_v46_1 (ref)
        return l_v47_1 or l_v46_1;
    end;
    v45.setTogglePan = function(v149) --[[ Line: 555 ]] --[[ Name: setTogglePan ]]
        -- upvalues: l_v47_1 (ref)
        l_v47_1 = v149;
    end;
    local v150 = false;
    local v151 = nil;
    local v152 = nil;
    v45.enableCameraToggleInput = function() --[[ Line: 563 ]] --[[ Name: enableCameraToggleInput ]]
        -- upvalues: v150 (ref), l_v46_1 (ref), l_v47_1 (ref), v151 (ref), v152 (ref), v17 (ref), l_v145_0 (ref), v18 (ref), l_UserInputService_0 (copy)
        if v150 then
            return;
        else
            v150 = true;
            l_v46_1 = false;
            l_v47_1 = false;
            if v151 then
                v151:Disconnect();
            end;
            if v152 then
                v152:Disconnect();
            end;
            v151 = v17:Connect(function() --[[ Line: 580 ]]
                -- upvalues: l_v46_1 (ref), l_v145_0 (ref)
                l_v46_1 = true;
                l_v145_0 = tick();
            end);
            v152 = v18:Connect(function() --[[ Line: 585 ]]
                -- upvalues: l_v46_1 (ref), l_v145_0 (ref), l_v47_1 (ref), l_UserInputService_0 (ref)
                l_v46_1 = false;
                if tick() - l_v145_0 < 0.3 and (l_v47_1 or l_UserInputService_0:GetMouseDelta().Magnitude < 2) then
                    l_v47_1 = not l_v47_1;
                end;
            end);
            return;
        end;
    end;
    v45.disableCameraToggleInput = function() --[[ Line: 593 ]] --[[ Name: disableCameraToggleInput ]]
        -- upvalues: v150 (ref), v151 (ref), v152 (ref)
        if not v150 then
            return;
        else
            v150 = false;
            if v151 then
                v151:Disconnect();
                v151 = nil;
            end;
            if v152 then
                v152:Disconnect();
                v152 = nil;
            end;
            return;
        end;
    end;
end;
return v45;