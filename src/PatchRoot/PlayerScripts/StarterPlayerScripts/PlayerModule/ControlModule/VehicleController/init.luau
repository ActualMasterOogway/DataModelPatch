local l_ContextActionService_0 = game:GetService("ContextActionService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = setmetatable({}, v1);
    v3.CONTROL_ACTION_PRIORITY = v2;
    v3.enabled = false;
    v3.vehicleSeat = nil;
    v3.throttle = 0;
    v3.steer = 0;
    v3.acceleration = 0;
    v3.decceleration = 0;
    v3.turningRight = 0;
    v3.turningLeft = 0;
    v3.vehicleMoveVector = Vector3.new(0, 0, 0, 0);
    v3.autoPilot = {};
    v3.autoPilot.MaxSpeed = 0;
    v3.autoPilot.MaxSteeringAngle = 0;
    return v3;
end;
v1.BindContextActions = function(v4) --[[ Line: 51 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindActionAtPriority("throttleAccel", function(v5, v6, v7) --[[ Line: 53 ]]
        -- upvalues: v4 (copy)
        v4:OnThrottleAccel(v5, v6, v7);
        return Enum.ContextActionResult.Pass;
    end, false, v4.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonR2);
    l_ContextActionService_0:BindActionAtPriority("throttleDeccel", function(v8, v9, v10) --[[ Line: 57 ]]
        -- upvalues: v4 (copy)
        v4:OnThrottleDeccel(v8, v9, v10);
        return Enum.ContextActionResult.Pass;
    end, false, v4.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonL2);
    l_ContextActionService_0:BindActionAtPriority("arrowSteerRight", function(v11, v12, v13) --[[ Line: 62 ]]
        -- upvalues: v4 (copy)
        v4:OnSteerRight(v11, v12, v13);
        return Enum.ContextActionResult.Pass;
    end, false, v4.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Right);
    l_ContextActionService_0:BindActionAtPriority("arrowSteerLeft", function(v14, v15, v16) --[[ Line: 66 ]]
        -- upvalues: v4 (copy)
        v4:OnSteerLeft(v14, v15, v16);
        return Enum.ContextActionResult.Pass;
    end, false, v4.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Left);
end;
v1.Enable = function(v17, v18, v19) --[[ Line: 72 ]] --[[ Name: Enable ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v18 == v17.enabled and v19 == v17.vehicleSeat then
        return;
    else
        v17.enabled = v18;
        v17.vehicleMoveVector = Vector3.new(0, 0, 0, 0);
        if v18 then
            if v19 then
                v17.vehicleSeat = v19;
                v17:SetupAutoPilot();
                v17:BindContextActions();
                return;
            end;
        else
            l_ContextActionService_0:UnbindAction("throttleAccel");
            l_ContextActionService_0:UnbindAction("throttleDeccel");
            l_ContextActionService_0:UnbindAction("arrowSteerRight");
            l_ContextActionService_0:UnbindAction("arrowSteerLeft");
            v17.vehicleSeat = nil;
        end;
        return;
    end;
end;
v1.OnThrottleAccel = function(v20, _, v22, _) --[[ Line: 98 ]] --[[ Name: OnThrottleAccel ]]
    if v22 == Enum.UserInputState.End or v22 == Enum.UserInputState.Cancel then
        v20.acceleration = 0;
    else
        v20.acceleration = -1;
    end;
    v20.throttle = v20.acceleration + v20.decceleration;
end;
v1.OnThrottleDeccel = function(v24, _, v26, _) --[[ Line: 107 ]] --[[ Name: OnThrottleDeccel ]]
    if v26 == Enum.UserInputState.End or v26 == Enum.UserInputState.Cancel then
        v24.decceleration = 0;
    else
        v24.decceleration = 1;
    end;
    v24.throttle = v24.acceleration + v24.decceleration;
end;
v1.OnSteerRight = function(v28, _, v30, _) --[[ Line: 116 ]] --[[ Name: OnSteerRight ]]
    if v30 == Enum.UserInputState.End or v30 == Enum.UserInputState.Cancel then
        v28.turningRight = 0;
    else
        v28.turningRight = 1;
    end;
    v28.steer = v28.turningRight + v28.turningLeft;
end;
v1.OnSteerLeft = function(v32, _, v34, _) --[[ Line: 125 ]] --[[ Name: OnSteerLeft ]]
    if v34 == Enum.UserInputState.End or v34 == Enum.UserInputState.Cancel then
        v32.turningLeft = 0;
    else
        v32.turningLeft = -1;
    end;
    v32.steer = v32.turningRight + v32.turningLeft;
end;
v1.Update = function(v36, v37, v38, v39) --[[ Line: 135 ]] --[[ Name: Update ]]
    if v36.vehicleSeat then
        if v38 then
            v37 = v37 + Vector3.new(v36.steer, 0, v36.throttle);
            if not v39 then

            end;
            v36.vehicleSeat.ThrottleFloat = -v37.Z;
            v36.vehicleSeat.SteerFloat = v37.X;
            return v37, true;
        else
            local v40 = v36.vehicleSeat.Occupant.RootPart.CFrame:VectorToObjectSpace(v37);
            v36.vehicleSeat.ThrottleFloat = v36:ComputeThrottle(v40);
            v36.vehicleSeat.SteerFloat = v36:ComputeSteer(v40);
            return Vector3.new(0, 0, 0, 0), true;
        end;
    else
        return v37, false;
    end;
end;
v1.ComputeThrottle = function(_, v42) --[[ Line: 161 ]] --[[ Name: ComputeThrottle ]]
    if v42 ~= Vector3.new(0, 0, 0, 0) then
        return -v42.Z;
    else
        return 0;
    end;
end;
v1.ComputeSteer = function(v43, v44) --[[ Line: 170 ]] --[[ Name: ComputeSteer ]]
    if v44 ~= Vector3.new(0, 0, 0, 0) then
        return -math.atan2(-v44.x, -v44.z) * 57.29577951308232 / v43.autoPilot.MaxSteeringAngle;
    else
        return 0;
    end;
end;
v1.SetupAutoPilot = function(v45) --[[ Line: 179 ]] --[[ Name: SetupAutoPilot ]]
    v45.autoPilot.MaxSpeed = v45.vehicleSeat.MaxSpeed;
    v45.autoPilot.MaxSteeringAngle = 35;
end;
return v1;