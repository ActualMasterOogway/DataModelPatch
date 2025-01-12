local l_Popper_0 = require(script:WaitForChild("Popper"));
local l_clamp_0 = math.clamp;
local l_exp_0 = math.exp;
local l_min_0 = math.min;
local l_max_0 = math.max;
local v5 = nil;
local v6 = nil;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
assert(l_LocalPlayer_0);
local l_l_LocalPlayer_0_0 = l_LocalPlayer_0 --[[ copy: 7 -> 11 ]];
local function v9() --[[ Line: 23 ]] --[[ Name: updateBounds ]]
    -- upvalues: v5 (ref), l_l_LocalPlayer_0_0 (copy), v6 (ref)
    v5 = l_l_LocalPlayer_0_0.CameraMinZoomDistance;
    v6 = l_l_LocalPlayer_0_0.CameraMaxZoomDistance;
end;
v5 = l_LocalPlayer_0.CameraMinZoomDistance;
v6 = l_LocalPlayer_0.CameraMaxZoomDistance;
l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(v9);
l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(v9);
l_LocalPlayer_0 = {};
l_LocalPlayer_0.__index = l_LocalPlayer_0;
l_LocalPlayer_0.new = function(v10, v11, v12, v13) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: l_clamp_0 (copy), l_LocalPlayer_0 (copy)
    v11 = l_clamp_0(v11, v12, v13);
    return (setmetatable({
        freq = v10, 
        x = v11, 
        v = 0, 
        minValue = v12, 
        maxValue = v13, 
        goal = v11
    }, l_LocalPlayer_0));
end;
l_LocalPlayer_0.Step = function(v14, v15) --[[ Line: 49 ]] --[[ Name: Step ]]
    -- upvalues: l_exp_0 (copy)
    local v16 = v14.freq * 2 * 3.141592653589793;
    local l_x_0 = v14.x;
    local l_v_0 = v14.v;
    local l_minValue_0 = v14.minValue;
    local l_maxValue_0 = v14.maxValue;
    local l_goal_0 = v14.goal;
    local v22 = l_goal_0 - l_x_0;
    local v23 = v16 * v15;
    local v24 = l_exp_0(-v23);
    local v25 = l_goal_0 + (l_v_0 * v15 - v22 * (v23 + 1)) * v24;
    local v26 = ((v22 * v16 - l_v_0) * v23 + l_v_0) * v24;
    if v25 < l_minValue_0 then
        v25 = l_minValue_0;
        v26 = 0;
    elseif l_maxValue_0 < v25 then
        v25 = l_maxValue_0;
        v26 = 0;
    end;
    v14.x = v25;
    v14.v = v26;
    return v25;
end;
v9 = l_LocalPlayer_0.new(4.5, 12.5, 0.5, v6);
local function _(v27, v28, v29, v30) --[[ Line: 87 ]] --[[ Name: stepTargetZoom ]]
    -- upvalues: l_clamp_0 (copy)
    v27 = l_clamp_0(v27 + v28 * (1 + v27 * 0.0375), v29, v30);
    if v27 < 1 then
        v27 = v28 <= 0 and v29 or 1;
    end;
    return v27;
end;
local v32 = 0;
return {
    Update = function(v33, v34, v35) --[[ Line: 98 ]] --[[ Name: Update ]]
        -- upvalues: v9 (copy), v32 (ref), v5 (ref), v6 (ref), l_clamp_0 (copy), l_max_0 (copy), l_Popper_0 (copy), l_min_0 (copy)
        local v36 = 1e999;
        if v9.goal > 1 then
            local l_x_1 = v9.x;
            local l_goal_1 = v9.goal;
            local l_v32_0 = v32;
            local l_v5_0 = v5;
            local l_v6_0 = v6;
            l_goal_1 = l_clamp_0(l_goal_1 + l_v32_0 * (1 + l_goal_1 * 0.0375), l_v5_0, l_v6_0);
            if l_goal_1 < 1 then
                l_goal_1 = l_v32_0 <= 0 and l_v5_0 or 1;
            end;
            local v42 = l_max_0(l_x_1, l_goal_1);
            v36 = l_Popper_0(v34 * CFrame.new(0, 0, 0.5), v42 - 0.5, v35) + 0.5;
        end;
        v9.minValue = 0.5;
        v9.maxValue = l_min_0(v6, v36);
        return v9:Step(v33);
    end, 
    GetZoomRadius = function() --[[ Line: 122 ]] --[[ Name: GetZoomRadius ]]
        -- upvalues: v9 (copy)
        return v9.x;
    end, 
    SetZoomParameters = function(v43, v44) --[[ Line: 126 ]] --[[ Name: SetZoomParameters ]]
        -- upvalues: v9 (copy), v32 (ref)
        v9.goal = v43;
        v32 = v44;
    end, 
    ReleaseSpring = function() --[[ Line: 131 ]] --[[ Name: ReleaseSpring ]]
        -- upvalues: v9 (copy)
        v9.x = v9.goal;
        v9.v = 0;
    end
};