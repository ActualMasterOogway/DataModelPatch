local l_abs_0 = math.abs;
local l_clamp_0 = math.clamp;
local l_exp_0 = math.exp;
local l_rad_0 = math.rad;
local l_sign_0 = math.sign;
local l_sqrt_0 = math.sqrt;
local l_tan_0 = math.tan;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 32 ]]
    -- upvalues: l_Workspace_0 (copy), l_CurrentCamera_0 (ref)
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if l_CurrentCamera_1 then
        l_CurrentCamera_0 = l_CurrentCamera_1;
    end;
end);
local v17 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
    return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock");
end);
v17 = l_status_0 and l_result_0;
l_status_0 = nil;
local v20;
l_result_0, v20 = pcall(function() --[[ Line: 49 ]]
    return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles");
end);
l_status_0 = l_result_0 and v20;
l_result_0 = Enum.ContextActionPriority.Low.Value;
v20 = Enum.ContextActionPriority.High.Value;
local v21 = {
    Enum.KeyCode.LeftShift, 
    Enum.KeyCode.P
};
local v22 = Vector3.new(1, 1, 1, 0) * 64;
local v23 = Vector2.new(0.75, 1) * 8;
local v24 = {};
v24.__index = v24;
v24.new = function(v25, v26) --[[ Line: 77 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy)
    local v27 = setmetatable({}, v24);
    v27.f = v25;
    v27.p = v26;
    v27.v = v26 * 0;
    return v27;
end;
v24.Update = function(v28, v29, v30) --[[ Line: 85 ]] --[[ Name: Update ]]
    -- upvalues: l_exp_0 (copy)
    local v31 = v28.f * 2 * 3.141592653589793;
    local l_p_0 = v28.p;
    local l_v_0 = v28.v;
    local v34 = v30 - l_p_0;
    local v35 = l_exp_0(-v31 * v29);
    local v36 = v30 + (l_v_0 * v29 - v34 * (v31 * v29 + 1)) * v35;
    local v37 = (v31 * v29 * (v34 * v31 - l_v_0) + l_v_0) * v35;
    v28.p = v36;
    v28.v = v37;
    return v36;
end;
v24.Reset = function(v38, v39) --[[ Line: 102 ]] --[[ Name: Reset ]]
    v38.p = v39;
    v38.v = v39 * 0;
end;
local v40 = Vector3.new();
local v41 = Vector2.new();
local v42 = 0;
local v43 = v24.new(1.5, (Vector3.new()));
local v44 = v24.new(1, Vector2.new());
local v45 = v24.new(4, 0);
local v46 = {};
local v47 = nil;
local function v49(v48) --[[ Line: 125 ]] --[[ Name: fCurve ]]
    -- upvalues: l_exp_0 (copy)
    return (l_exp_0(2 * v48) - 1) / 6.38905609893065;
end;
local function v51(v50) --[[ Line: 129 ]] --[[ Name: fDeadzone ]]
    -- upvalues: l_exp_0 (copy)
    return (l_exp_0(2 * ((v50 - 0.15) / 0.85)) - 1) / 6.38905609893065;
end;
v47 = function(v52) --[[ Line: 133 ]] --[[ Name: thumbstickCurve ]]
    -- upvalues: l_sign_0 (copy), l_abs_0 (copy), l_exp_0 (copy), l_clamp_0 (copy)
    return l_sign_0(v52) * l_clamp_0((l_exp_0(2 * ((l_abs_0(v52) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1);
end;
v49 = {
    ButtonX = 0, 
    ButtonY = 0, 
    DPadDown = 0, 
    DPadUp = 0, 
    ButtonL2 = 0, 
    ButtonR2 = 0, 
    Thumbstick1 = Vector2.new(), 
    Thumbstick2 = Vector2.new()
};
v51 = {
    W = 0, 
    A = 0, 
    S = 0, 
    D = 0, 
    E = 0, 
    Q = 0, 
    U = 0, 
    H = 0, 
    J = 0, 
    K = 0, 
    I = 0, 
    Y = 0, 
    Up = 0, 
    Down = 0, 
    LeftShift = 0, 
    RightShift = 0
};
local v53 = {
    Delta = Vector2.new(), 
    MouseWheel = 0
};
local v54 = Vector2.new(1, 1) * 0.04908738521234052;
local v55 = Vector2.new(1, 1) * 0.39269908169872414;
local v56 = 1;
local l_v51_0 = v51 --[[ copy: 34 -> 46 ]];
local l_v49_0 = v49 --[[ copy: 33 -> 47 ]];
do
    local l_v47_0, l_v56_0 = v47, v56;
    v46.Vel = function(v61) --[[ Line: 184 ]] --[[ Name: Vel ]]
        -- upvalues: l_v56_0 (ref), l_v51_0 (copy), l_clamp_0 (copy), l_v47_0 (ref), l_v49_0 (copy), l_UserInputService_0 (copy)
        l_v56_0 = l_clamp_0(l_v56_0 + v61 * (l_v51_0.Up - l_v51_0.Down) * 0.75, 0.01, 4);
        local v62 = Vector3.new(l_v47_0(l_v49_0.Thumbstick1.X), l_v47_0(l_v49_0.ButtonR2) - l_v47_0(l_v49_0.ButtonL2), l_v47_0(-l_v49_0.Thumbstick1.Y)) * Vector3.new(1, 1, 1, 0);
        local v63 = Vector3.new(l_v51_0.D - l_v51_0.A + l_v51_0.K - l_v51_0.H, l_v51_0.E - l_v51_0.Q + l_v51_0.I - l_v51_0.Y, l_v51_0.S - l_v51_0.W + l_v51_0.J - l_v51_0.U) * Vector3.new(1, 1, 1, 0);
        local v64 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
        return (v62 + v63) * (l_v56_0 * (v64 and 0.25 or 1));
    end;
    local l_v55_0 = v55 --[[ copy: 37 -> 48 ]];
    local l_v53_0 = v53 --[[ copy: 35 -> 49 ]];
    local l_v54_0 = v54 --[[ copy: 36 -> 50 ]];
    v46.Pan = function(_) --[[ Line: 204 ]] --[[ Name: Pan ]]
        -- upvalues: l_v47_0 (ref), l_v49_0 (copy), l_v55_0 (copy), l_v53_0 (copy), l_v54_0 (copy)
        local v69 = Vector2.new(l_v47_0(l_v49_0.Thumbstick2.Y), l_v47_0(-l_v49_0.Thumbstick2.X)) * l_v55_0;
        local v70 = l_v53_0.Delta * l_v54_0;
        l_v53_0.Delta = Vector2.new();
        return v69 + v70;
    end;
    v46.Fov = function(_) --[[ Line: 214 ]] --[[ Name: Fov ]]
        -- upvalues: l_v49_0 (copy), l_v53_0 (copy)
        local v72 = (l_v49_0.ButtonX - l_v49_0.ButtonY) * 0.25;
        local v73 = l_v53_0.MouseWheel * 1;
        l_v53_0.MouseWheel = 0;
        return v72 + v73;
    end;
    local function v77(_, v75, v76) --[[ Line: 222 ]] --[[ Name: Keypress ]]
        -- upvalues: l_v51_0 (copy)
        l_v51_0[v76.KeyCode.Name] = v75 == Enum.UserInputState.Begin and 1 or 0;
        return Enum.ContextActionResult.Sink;
    end;
    local function v81(_, v79, v80) --[[ Line: 227 ]] --[[ Name: GpButton ]]
        -- upvalues: l_v49_0 (copy)
        l_v49_0[v80.KeyCode.Name] = v79 == Enum.UserInputState.Begin and 1 or 0;
        return Enum.ContextActionResult.Sink;
    end;
    local function v86(_, _, v84) --[[ Line: 232 ]] --[[ Name: MousePan ]]
        -- upvalues: l_v53_0 (copy)
        local l_Delta_0 = v84.Delta;
        l_v53_0.Delta = Vector2.new(-l_Delta_0.y, -l_Delta_0.x);
        return Enum.ContextActionResult.Sink;
    end;
    local function v90(_, _, v89) --[[ Line: 238 ]] --[[ Name: Thumb ]]
        -- upvalues: l_v49_0 (copy)
        l_v49_0[v89.KeyCode.Name] = v89.Position;
        return Enum.ContextActionResult.Sink;
    end;
    local function v94(_, _, v93) --[[ Line: 243 ]] --[[ Name: Trigger ]]
        -- upvalues: l_v49_0 (copy)
        l_v49_0[v93.KeyCode.Name] = v93.Position.z;
        return Enum.ContextActionResult.Sink;
    end;
    local function v98(_, _, v97) --[[ Line: 248 ]] --[[ Name: MouseWheel ]]
        -- upvalues: l_v53_0 (copy)
        l_v53_0[v97.UserInputType.Name] = -v97.Position.z;
        return Enum.ContextActionResult.Sink;
    end;
    local function _(v99) --[[ Line: 253 ]] --[[ Name: Zero ]]
        for v100, v101 in pairs(v99) do
            v99[v100] = v101 * 0;
        end;
    end;
    local l_v77_0 = v77 --[[ copy: 39 -> 51 ]];
    local l_v86_0 = v86 --[[ copy: 41 -> 52 ]];
    local l_v81_0 = v81 --[[ copy: 40 -> 53 ]];
    local l_v94_0 = v94 --[[ copy: 43 -> 54 ]];
    local l_v90_0 = v90 --[[ copy: 42 -> 55 ]];
    v46.StartCapture = function() --[[ Line: 259 ]] --[[ Name: StartCapture ]]
        -- upvalues: l_ContextActionService_0 (copy), l_v77_0 (copy), v20 (copy), l_v86_0 (copy), v98 (copy), l_v81_0 (copy), l_v94_0 (copy), l_v90_0 (copy)
        l_ContextActionService_0:BindActionAtPriority("FreecamKeyboard", l_v77_0, false, v20, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
        l_ContextActionService_0:BindActionAtPriority("FreecamMousePan", l_v86_0, false, v20, Enum.UserInputType.MouseMovement);
        l_ContextActionService_0:BindActionAtPriority("FreecamMouseWheel", v98, false, v20, Enum.UserInputType.MouseWheel);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadButton", l_v81_0, false, v20, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadTrigger", l_v94_0, false, v20, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadThumbstick", l_v90_0, false, v20, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
    end;
    v46.StopCapture = function() --[[ Line: 276 ]] --[[ Name: StopCapture ]]
        -- upvalues: l_v56_0 (ref), l_v49_0 (copy), l_v51_0 (copy), l_v53_0 (copy), l_ContextActionService_0 (copy)
        l_v56_0 = 1;
        local l_l_v49_0_0 = l_v49_0;
        for v109, v110 in pairs(l_l_v49_0_0) do
            l_l_v49_0_0[v109] = v110 * 0;
        end;
        l_l_v49_0_0 = l_v51_0;
        for v111, v112 in pairs(l_l_v49_0_0) do
            l_l_v49_0_0[v111] = v112 * 0;
        end;
        l_l_v49_0_0 = l_v53_0;
        for v113, v114 in pairs(l_l_v49_0_0) do
            l_l_v49_0_0[v113] = v114 * 0;
        end;
        l_ContextActionService_0:UnbindAction("FreecamKeyboard");
        l_ContextActionService_0:UnbindAction("FreecamMousePan");
        l_ContextActionService_0:UnbindAction("FreecamMouseWheel");
        l_ContextActionService_0:UnbindAction("FreecamGamepadButton");
        l_ContextActionService_0:UnbindAction("FreecamGamepadTrigger");
        l_ContextActionService_0:UnbindAction("FreecamGamepadThumbstick");
    end;
end;
v47 = function(v115) --[[ Line: 293 ]] --[[ Name: StepFreecam ]]
    -- upvalues: v43 (copy), v46 (copy), v44 (copy), v45 (copy), v42 (ref), l_rad_0 (copy), l_tan_0 (copy), l_sqrt_0 (copy), l_clamp_0 (copy), v41 (ref), v23 (copy), v40 (ref), v22 (copy), l_CurrentCamera_0 (ref)
    local v116 = v43:Update(v115, v46.Vel(v115));
    local v117 = v44:Update(v115, v46.Pan(v115));
    local v118 = v45:Update(v115, v46.Fov(v115));
    local v119 = l_sqrt_0(0.7002075382097097 / l_tan_0((l_rad_0(v42 / 2))));
    v42 = l_clamp_0(v42 + v118 * 300 * (v115 / v119), 1, 120);
    v41 = v41 + v117 * v23 * (v115 / v119);
    v41 = Vector2.new(l_clamp_0(v41.x, -1.5707963267948966, 1.5707963267948966), v41.y % 6.283185307179586);
    local v120 = CFrame.new(v40) * CFrame.fromOrientation(v41.x, v41.y, 0) * CFrame.new(v116 * v22 * v115);
    v40 = v120.p;
    l_CurrentCamera_0.CFrame = v120;
    l_CurrentCamera_0.Focus = v120;
    l_CurrentCamera_0.FieldOfView = v42;
end;
v49 = function() --[[ Line: 312 ]] --[[ Name: CheckMouseLockAvailability ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_DevEnableMouseLock_0 = l_Players_0.LocalPlayer.DevEnableMouseLock;
    local v122 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
    local v123 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
    local v124 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    return l_DevEnableMouseLock_0 and v123 and not v124 and not v122;
end;
v51 = {};
v53 = nil;
v54 = nil;
v55 = nil;
v56 = nil;
local v125 = nil;
local v126 = nil;
local v127 = {};
local v128 = {
    Backpack = true, 
    Chat = true, 
    Health = true, 
    PlayerList = true
};
local v129 = {
    BadgesNotificationsActive = true, 
    PointsNotificationsActive = true
};
do
    local l_v53_1, l_v54_1, l_v55_1, l_v56_1, l_v125_0, l_v126_0 = v53, v54, v55, v56, v125, v126;
    v51.Push = function() --[[ Line: 344 ]] --[[ Name: Push ]]
        -- upvalues: v128 (copy), l_StarterGui_0 (copy), v129 (copy), l_LocalPlayer_0 (ref), v127 (copy), l_v126_0 (ref), l_CurrentCamera_0 (ref), l_v55_1 (ref), l_v125_0 (ref), l_v56_1 (ref), l_v54_1 (ref), l_UserInputService_0 (copy), v17 (ref), l_Players_0 (copy), l_GameSettings_0 (copy), l_v53_1 (ref)
        local v136 = false;
        for v137 in pairs(v128) do
            v128[v137] = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType[v137]);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v137], false);
        end;
        for v138 in pairs(v129) do
            v129[v138] = l_StarterGui_0:GetCore(v138);
            l_StarterGui_0:SetCore(v138, false);
        end;
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        if l_PlayerGui_0 then
            for _, v141 in pairs(l_PlayerGui_0:GetChildren()) do
                if v141:IsA("ScreenGui") and v141.Enabled then
                    v127[#v127 + 1] = v141;
                    v141.Enabled = false;
                end;
            end;
        end;
        l_v126_0 = l_CurrentCamera_0.FieldOfView;
        l_CurrentCamera_0.FieldOfView = 70;
        l_v55_1 = l_CurrentCamera_0.CameraType;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_v125_0 = l_CurrentCamera_0.CFrame;
        l_v56_1 = l_CurrentCamera_0.Focus;
        l_v54_1 = l_UserInputService_0.MouseIconEnabled;
        l_UserInputService_0.MouseIconEnabled = false;
        if v17 then
            local l_DevEnableMouseLock_1 = l_Players_0.LocalPlayer.DevEnableMouseLock;
            local v143 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
            local v144 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
            local v145 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
            if l_DevEnableMouseLock_1 and v144 and not v145 and not v143 then
                l_v53_1 = Enum.MouseBehavior.Default;
                v136 = true;
            end;
        end;
        if not v136 then
            l_v53_1 = l_UserInputService_0.MouseBehavior;
        end;
        v136 = false;
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
    end;
    v51.Pop = function() --[[ Line: 384 ]] --[[ Name: Pop ]]
        -- upvalues: v128 (copy), l_StarterGui_0 (copy), v129 (copy), v127 (copy), l_CurrentCamera_0 (ref), l_v126_0 (ref), l_v55_1 (ref), l_v125_0 (ref), l_v56_1 (ref), l_UserInputService_0 (copy), l_v54_1 (ref), l_v53_1 (ref)
        for v146, v147 in pairs(v128) do
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v146], v147);
        end;
        for v148, v149 in pairs(v129) do
            l_StarterGui_0:SetCore(v148, v149);
        end;
        for _, v151 in pairs(v127) do
            if v151.Parent then
                v151.Enabled = true;
            end;
        end;
        l_CurrentCamera_0.FieldOfView = l_v126_0;
        l_v126_0 = nil;
        l_CurrentCamera_0.CameraType = l_v55_1;
        l_v55_1 = nil;
        l_CurrentCamera_0.CFrame = l_v125_0;
        l_v125_0 = nil;
        l_CurrentCamera_0.Focus = l_v56_1;
        l_v56_1 = nil;
        l_UserInputService_0.MouseIconEnabled = l_v54_1;
        l_v54_1 = nil;
        l_UserInputService_0.MouseBehavior = l_v53_1;
        l_v53_1 = nil;
    end;
end;
v53 = function() --[[ Line: 417 ]] --[[ Name: StartFreecam ]]
    -- upvalues: l_status_0 (ref), l_CurrentCamera_0 (ref), v41 (ref), v40 (ref), v42 (ref), v43 (copy), v44 (copy), v45 (copy), v51 (copy), l_RunService_0 (copy), v47 (copy), v46 (copy)
    if l_status_0 then
        script:SetAttribute("FreecamEnabled", true);
    end;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    v41 = Vector2.new(l_CFrame_0:toEulerAnglesYXZ());
    v40 = l_CFrame_0.p;
    v42 = l_CurrentCamera_0.FieldOfView;
    v43:Reset((Vector3.new()));
    v44:Reset(Vector2.new());
    v45:Reset(0);
    v51.Push();
    l_RunService_0:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v47);
    v46.StartCapture();
end;
v54 = function() --[[ Line: 436 ]] --[[ Name: StopFreecam ]]
    -- upvalues: l_status_0 (ref), v46 (copy), l_RunService_0 (copy), v51 (copy)
    if l_status_0 then
        script:SetAttribute("FreecamEnabled", false);
    end;
    v46.StopCapture();
    l_RunService_0:UnbindFromRenderStep("Freecam");
    v51.Pop();
end;
v55 = false;
do
    local l_v55_2 = v55;
    v56 = function() --[[ Line: 451 ]] --[[ Name: ToggleFreecam ]]
        -- upvalues: l_v55_2 (ref), l_status_0 (ref), v46 (copy), l_RunService_0 (copy), v51 (copy), v53 (copy)
        if l_v55_2 then
            if l_status_0 then
                script:SetAttribute("FreecamEnabled", false);
            end;
            v46.StopCapture();
            l_RunService_0:UnbindFromRenderStep("Freecam");
            v51.Pop();
        else
            v53();
        end;
        l_v55_2 = not l_v55_2;
    end;
    v125 = function(v154) --[[ Line: 460 ]] --[[ Name: CheckMacro ]]
        -- upvalues: l_UserInputService_0 (copy), l_v55_2 (ref), l_status_0 (ref), v46 (copy), l_RunService_0 (copy), v51 (copy), v53 (copy)
        for v155 = 1, #v154 - 1 do
            if not l_UserInputService_0:IsKeyDown(v154[v155]) then
                return;
            end;
        end;
        if l_v55_2 then
            if l_status_0 then
                script:SetAttribute("FreecamEnabled", false);
            end;
            v46.StopCapture();
            l_RunService_0:UnbindFromRenderStep("Freecam");
            v51.Pop();
        else
            v53();
        end;
        l_v55_2 = not l_v55_2;
    end;
    l_ContextActionService_0:BindActionAtPriority("FreecamToggle", function(_, v157, v158) --[[ Line: 469 ]] --[[ Name: HandleActivationInput ]]
        -- upvalues: v21 (copy), v125 (copy)
        if v157 == Enum.UserInputState.Begin and v158.KeyCode == v21[#v21] then
            v125(v21);
        end;
        return Enum.ContextActionResult.Pass;
    end, false, l_result_0, v21[#v21]);
    if l_status_0 then
        script:SetAttribute("FreecamEnabled", l_v55_2);
        script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function() --[[ Line: 482 ]]
            -- upvalues: l_v55_2 (ref), v53 (copy), l_status_0 (ref), v46 (copy), l_RunService_0 (copy), v51 (copy)
            local l_script_Attribute_0 = script:GetAttribute("FreecamEnabled");
            if typeof(l_script_Attribute_0) ~= "boolean" then
                script:SetAttribute("FreecamEnabled", l_v55_2);
                return;
            else
                if l_script_Attribute_0 ~= l_v55_2 then
                    if l_script_Attribute_0 then
                        v53();
                        l_v55_2 = true;
                        return;
                    else
                        if l_status_0 then
                            script:SetAttribute("FreecamEnabled", false);
                        end;
                        v46.StopCapture();
                        l_RunService_0:UnbindFromRenderStep("Freecam");
                        v51.Pop();
                        l_v55_2 = false;
                    end;
                end;
                return;
            end;
        end);
    end;
end;