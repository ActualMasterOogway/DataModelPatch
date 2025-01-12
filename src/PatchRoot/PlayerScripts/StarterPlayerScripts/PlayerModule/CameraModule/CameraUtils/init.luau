local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v3 = {};
local function _(v4) --[[ Line: 12 ]] --[[ Name: round ]]
    return (math.floor(v4 + 0.5));
end;
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        freq = v7, 
        goal = v8, 
        pos = v8, 
        vel = 0
    }, v6));
end;
v6.step = function(v9, v10) --[[ Line: 31 ]] --[[ Name: step ]]
    local v11 = v9.freq * 2 * 3.141592653589793;
    local l_goal_0 = v9.goal;
    local l_pos_0 = v9.pos;
    local l_vel_0 = v9.vel;
    local v15 = l_pos_0 - l_goal_0;
    local v16 = math.exp(-v11 * v10);
    local v17 = (v15 * (1 + v11 * v10) + l_vel_0 * v10) * v16 + l_goal_0;
    local v18 = (l_vel_0 * (1 - v11 * v10) - v15 * (v11 * v11 * v10)) * v16;
    v9.pos = v17;
    v9.vel = v18;
    return v17;
end;
v3.Spring = v6;
v3.map = function(v19, v20, v21, v22, v23) --[[ Line: 53 ]] --[[ Name: map ]]
    return (v19 - v20) * (v23 - v22) / (v21 - v20) + v22;
end;
v3.mapClamp = function(v24, v25, v26, v27, v28) --[[ Line: 58 ]] --[[ Name: mapClamp ]]
    return (math.clamp((v24 - v25) * (v28 - v27) / (v26 - v25) + v27, math.min(v27, v28), (math.max(v27, v28))));
end;
v3.getLooseBoundingSphere = function(v29) --[[ Line: 67 ]] --[[ Name: getLooseBoundingSphere ]]
    local v30 = table.create(#v29);
    for v31, v32 in pairs(v29) do
        v30[v31] = v32.Position;
    end;
    local v33 = v30[1];
    local l_v33_0 = v33;
    local v35 = 0;
    for _, v37 in ipairs(v30) do
        local l_Magnitude_0 = (v37 - v33).Magnitude;
        if v35 < l_Magnitude_0 then
            l_v33_0 = v37;
            v35 = l_Magnitude_0;
        end;
    end;
    local l_l_v33_0_0 = l_v33_0;
    local v40 = 0;
    for _, v42 in ipairs(v30) do
        local l_Magnitude_1 = (v42 - l_v33_0).Magnitude;
        if v40 < l_Magnitude_1 then
            l_l_v33_0_0 = v42;
            v40 = l_Magnitude_1;
        end;
    end;
    local v44 = (l_v33_0 + l_l_v33_0_0) * 0.5;
    local v45 = (l_v33_0 - l_l_v33_0_0).Magnitude * 0.5;
    for _, v47 in ipairs(v30) do
        local l_Magnitude_2 = (v47 - v44).Magnitude;
        if v45 < l_Magnitude_2 then
            v44 = v44 + (l_Magnitude_2 - v45) * 0.5 * (v47 - v44).Unit;
            v45 = (l_Magnitude_2 + v45) * 0.5;
        end;
    end;
    return v44, v45;
end;
v3.sanitizeAngle = function(v49) --[[ Line: 123 ]] --[[ Name: sanitizeAngle ]]
    return (v49 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
end;
v3.Round = function(v50, v51) --[[ Line: 128 ]] --[[ Name: Round ]]
    local v52 = 10 ^ v51;
    return math.floor(v50 * v52 + 0.5) / v52;
end;
v3.IsFinite = function(v53) --[[ Line: 133 ]] --[[ Name: IsFinite ]]
    local v54 = false;
    if v53 == v53 then
        v54 = false;
        if v53 ~= 1e999 then
            v54 = v53 ~= -1e999;
        end;
    end;
    return v54;
end;
v3.IsFiniteVector3 = function(v55) --[[ Line: 137 ]] --[[ Name: IsFiniteVector3 ]]
    -- upvalues: v3 (copy)
    return v3.IsFinite(v55.X) and v3.IsFinite(v55.Y) and v3.IsFinite(v55.Z);
end;
v3.GetAngleBetweenXZVectors = function(v56, v57) --[[ Line: 142 ]] --[[ Name: GetAngleBetweenXZVectors ]]
    return (math.atan2(v57.X * v56.Z - v57.Z * v56.X, v57.X * v56.X + v57.Z * v56.Z));
end;
v3.RotateVectorByAngleAndRound = function(v58, v59, v60) --[[ Line: 146 ]] --[[ Name: RotateVectorByAngleAndRound ]]
    if v58.Magnitude > 0 then
        v58 = v58.Unit;
        local v61 = math.atan2(v58.Z, v58.X);
        return math.floor((math.atan2(v58.Z, v58.X) + v59) / v60 + 0.5) * v60 - v61;
    else
        return 0;
    end;
end;
local function _(v62) --[[ Line: 160 ]] --[[ Name: SCurveTranform ]]
    v62 = math.clamp(v62, -1, 1);
    if v62 >= 0 then
        return 0.35 * v62 / (0.35 - v62 + 1);
    else
        return -(0.8 * -v62 / (0.8 + v62 + 1));
    end;
end;
local function _(v64) --[[ Line: 169 ]] --[[ Name: toSCurveSpace ]]
    return 1.1 * (2 * math.abs(v64) - 1) - 0.1;
end;
local function _(v66) --[[ Line: 173 ]] --[[ Name: fromSCurveSpace ]]
    return v66 / 2 + 0.5;
end;
v3.GamepadLinearToCurve = function(v68) --[[ Line: 177 ]] --[[ Name: GamepadLinearToCurve ]]
    local function _(v69) --[[ Line: 178 ]] --[[ Name: onAxis ]]
        local v70 = 1;
        if v69 < 0 then
            v70 = -1;
        end;
        local v71 = math.clamp(1.1 * (2 * math.abs((math.abs(v69))) - 1) - 0.1, -1, 1);
        return (math.clamp(((if v71 >= 0 then 0.35 * v71 / (0.35 - v71 + 1) else -(0.8 * -v71 / (0.8 + v71 + 1))) / 2 + 0.5) * v70, -1, 1));
    end;
    local l_new_0 = Vector2.new;
    local l_X_0 = v68.X;
    local v75 = 1;
    if l_X_0 < 0 then
        v75 = -1;
    end;
    local v76 = math.clamp(1.1 * (2 * math.abs((math.abs(l_X_0))) - 1) - 0.1, -1, 1);
    local v77 = math.clamp(((if v76 >= 0 then 0.35 * v76 / (0.35 - v76 + 1) else -(0.8 * -v76 / (0.8 + v76 + 1))) / 2 + 0.5) * v75, -1, 1);
    v75 = v68.Y;
    local v78 = 1;
    if v75 < 0 then
        v78 = -1;
    end;
    local v79 = math.clamp(1.1 * (2 * math.abs((math.abs(v75))) - 1) - 0.1, -1, 1);
    return l_new_0(v77, (math.clamp(((if v79 >= 0 then 0.35 * v79 / (0.35 - v79 + 1) else -(0.8 * -v79 / (0.8 + v79 + 1))) / 2 + 0.5) * v78, -1, 1)));
end;
v3.ConvertCameraModeEnumToStandard = function(v80) --[[ Line: 191 ]] --[[ Name: ConvertCameraModeEnumToStandard ]]
    if v80 == Enum.TouchCameraMovementMode.Default then
        return Enum.ComputerCameraMovementMode.Follow;
    elseif v80 == Enum.ComputerCameraMovementMode.Default then
        return Enum.ComputerCameraMovementMode.Classic;
    elseif v80 == Enum.TouchCameraMovementMode.Classic or v80 == Enum.DevTouchCameraMovementMode.Classic or v80 == Enum.DevComputerCameraMovementMode.Classic or v80 == Enum.ComputerCameraMovementMode.Classic then
        return Enum.ComputerCameraMovementMode.Classic;
    elseif v80 == Enum.TouchCameraMovementMode.Follow or v80 == Enum.DevTouchCameraMovementMode.Follow or v80 == Enum.DevComputerCameraMovementMode.Follow or v80 == Enum.ComputerCameraMovementMode.Follow then
        return Enum.ComputerCameraMovementMode.Follow;
    elseif v80 == Enum.TouchCameraMovementMode.Orbital or v80 == Enum.DevTouchCameraMovementMode.Orbital or v80 == Enum.DevComputerCameraMovementMode.Orbital or v80 == Enum.ComputerCameraMovementMode.Orbital then
        return Enum.ComputerCameraMovementMode.Orbital;
    elseif v80 == Enum.ComputerCameraMovementMode.CameraToggle or v80 == Enum.DevComputerCameraMovementMode.CameraToggle then
        return Enum.ComputerCameraMovementMode.CameraToggle;
    elseif v80 == Enum.DevTouchCameraMovementMode.UserChoice or v80 == Enum.DevComputerCameraMovementMode.UserChoice then
        return Enum.DevComputerCameraMovementMode.UserChoice;
    else
        return Enum.ComputerCameraMovementMode.Classic;
    end;
end;
local function _() --[[ Line: 240 ]] --[[ Name: getMouse ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    assert(l_LocalPlayer_0);
    return l_LocalPlayer_0:GetMouse();
end;
local v83 = "";
local v84 = nil;
v3.setMouseIconOverride = function(v85) --[[ Line: 252 ]] --[[ Name: setMouseIconOverride ]]
    -- upvalues: l_Players_0 (copy), v84 (ref), v83 (ref)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_1 then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    end;
    assert(l_LocalPlayer_1);
    local l_l_LocalPlayer_1_Mouse_0 = l_LocalPlayer_1:GetMouse();
    if l_l_LocalPlayer_1_Mouse_0.Icon ~= v84 then
        v83 = l_l_LocalPlayer_1_Mouse_0.Icon;
    end;
    l_l_LocalPlayer_1_Mouse_0.Icon = v85;
    v84 = v85;
end;
v3.restoreMouseIcon = function() --[[ Line: 263 ]] --[[ Name: restoreMouseIcon ]]
    -- upvalues: l_Players_0 (copy), v84 (ref), v83 (ref)
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_2 then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    end;
    assert(l_LocalPlayer_2);
    local l_l_LocalPlayer_2_Mouse_0 = l_LocalPlayer_2:GetMouse();
    if l_l_LocalPlayer_2_Mouse_0.Icon == v84 then
        l_l_LocalPlayer_2_Mouse_0.Icon = v83;
    end;
    v84 = nil;
end;
local l_Default_0 = Enum.MouseBehavior.Default;
local v91 = nil;
v3.setMouseBehaviorOverride = function(v92) --[[ Line: 274 ]] --[[ Name: setMouseBehaviorOverride ]]
    -- upvalues: l_UserInputService_0 (copy), v91 (ref), l_Default_0 (ref)
    if l_UserInputService_0.MouseBehavior ~= v91 then
        l_Default_0 = l_UserInputService_0.MouseBehavior;
    end;
    l_UserInputService_0.MouseBehavior = v92;
    v91 = v92;
end;
v3.restoreMouseBehavior = function() --[[ Line: 283 ]] --[[ Name: restoreMouseBehavior ]]
    -- upvalues: l_UserInputService_0 (copy), v91 (ref), l_Default_0 (ref)
    if l_UserInputService_0.MouseBehavior == v91 then
        l_UserInputService_0.MouseBehavior = l_Default_0;
    end;
    v91 = nil;
end;
local l_MovementRelative_0 = Enum.RotationType.MovementRelative;
local v94 = nil;
v3.setRotationTypeOverride = function(v95) --[[ Line: 292 ]] --[[ Name: setRotationTypeOverride ]]
    -- upvalues: l_UserGameSettings_0 (copy), v94 (ref), l_MovementRelative_0 (ref)
    if l_UserGameSettings_0.RotationType ~= v94 then
        l_MovementRelative_0 = l_UserGameSettings_0.RotationType;
    end;
    l_UserGameSettings_0.RotationType = v95;
    v94 = v95;
end;
v3.restoreRotationType = function() --[[ Line: 301 ]] --[[ Name: restoreRotationType ]]
    -- upvalues: l_UserGameSettings_0 (copy), v94 (ref), l_MovementRelative_0 (ref)
    if l_UserGameSettings_0.RotationType == v94 then
        l_UserGameSettings_0.RotationType = l_MovementRelative_0;
    end;
    v94 = nil;
end;
return v3;