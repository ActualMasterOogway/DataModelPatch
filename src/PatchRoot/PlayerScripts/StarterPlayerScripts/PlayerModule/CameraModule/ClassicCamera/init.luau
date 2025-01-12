local _ = Vector2.new(0, 0);
local v1 = 0;
local v2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0);
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local v5 = l_FlagUtil_0.getUserFlag("UserFixCameraOffsetJitter2");
local v6 = l_FlagUtil_0.getUserFlag("UserCameraInputDt");
local v7 = l_FlagUtil_0.getUserFlag("UserFixCameraFPError");
local l_Players_0 = game:GetService("Players");
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v12 = setmetatable({}, l_BaseCamera_0);
v12.__index = v12;
v12.new = function() --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v12 (copy), l_CameraUtils_0 (copy)
    local v13 = setmetatable(l_BaseCamera_0.new(), v12);
    v13.isFollowCamera = false;
    v13.isCameraToggle = false;
    v13.lastUpdate = tick();
    v13.cameraToggleSpring = l_CameraUtils_0.Spring.new(5, 0);
    return v13;
end;
v12.GetCameraToggleOffset = function(v14, v15) --[[ Line: 52 ]] --[[ Name: GetCameraToggleOffset ]]
    -- upvalues: l_CameraInput_0 (copy), l_CameraUtils_0 (copy)
    if v14.isCameraToggle then
        local l_currentSubjectDistance_0 = v14.currentSubjectDistance;
        if l_CameraInput_0.getTogglePan() then
            v14.cameraToggleSpring.goal = math.clamp(l_CameraUtils_0.map(l_currentSubjectDistance_0, 0.5, v14.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1);
        else
            v14.cameraToggleSpring.goal = 0;
        end;
        local v17 = math.clamp(l_CameraUtils_0.map(l_currentSubjectDistance_0, 0.5, 64, 0, 1), 0, 1) + 1;
        return (Vector3.new(0, v14.cameraToggleSpring:step(v15) * v17, 0));
    else
        return (Vector3.new());
    end;
end;
v12.SetCameraMovementMode = function(v18, v19) --[[ Line: 70 ]] --[[ Name: SetCameraMovementMode ]]
    -- upvalues: l_BaseCamera_0 (copy)
    l_BaseCamera_0.SetCameraMovementMode(v18, v19);
    v18.isFollowCamera = v19 == Enum.ComputerCameraMovementMode.Follow;
    v18.isCameraToggle = v19 == Enum.ComputerCameraMovementMode.CameraToggle;
end;
v12.Update = function(v20, v21) --[[ Line: 77 ]] --[[ Name: Update ]]
    -- upvalues: v6 (copy), v2 (copy), l_Players_0 (copy), l_CameraInput_0 (copy), v1 (ref), v5 (copy), l_CameraUtils_0 (copy), v7 (copy)
    local v22 = tick();
    local v23 = v22 - v20.lastUpdate;
    if v6 then
        v23 = v21;
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local v27 = nil;
    if v20.resetCameraAngle then
        local l_v20_HumanoidRootPart_0 = v20:GetHumanoidRootPart();
        v27 = if l_v20_HumanoidRootPart_0 then (l_v20_HumanoidRootPart_0.CFrame * v2).lookVector else v2.lookVector;
        v20.resetCameraAngle = false;
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_v20_Humanoid_0 = v20:GetHumanoid();
    local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
    local v32 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat");
    local v33 = l_CameraSubject_0 and l_CameraSubject_0:IsA("SkateboardPlatform");
    local v34 = l_v20_Humanoid_0 and l_v20_Humanoid_0:GetState() == Enum.HumanoidStateType.Climbing;
    if v20.lastUpdate == nil or v23 > 1 then
        v20.lastCameraTransform = nil;
    end;
    local v35 = l_CameraInput_0.getRotation(v23);
    v20:StepZoom();
    local l_v20_CameraHeight_0 = v20:GetCameraHeight();
    if v35 ~= Vector2.new() then
        v1 = 0;
        v20.lastUserPanCamera = tick();
    end;
    local v37 = v22 - v20.lastUserPanCamera < 2;
    local l_v20_SubjectPosition_0 = v20:GetSubjectPosition();
    if l_v20_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        local l_v20_CameraToSubjectDistance_0 = v20:GetCameraToSubjectDistance();
        if l_v20_CameraToSubjectDistance_0 < 0.5 then
            l_v20_CameraToSubjectDistance_0 = 0.5;
        end;
        if v20:GetIsMouseLocked() and not v20:IsInFirstPerson() then
            local v40 = v20:CalculateNewLookCFrameFromArg(v27, v35);
            local l_v20_MouseLockOffset_0 = v20:GetMouseLockOffset();
            if v5 and l_v20_Humanoid_0 then
                l_v20_MouseLockOffset_0 = l_v20_MouseLockOffset_0 + l_v20_Humanoid_0.CameraOffset;
            end;
            local v42 = l_v20_MouseLockOffset_0.X * v40.RightVector + l_v20_MouseLockOffset_0.Y * v40.UpVector + l_v20_MouseLockOffset_0.Z * v40.LookVector;
            if l_CameraUtils_0.IsFiniteVector3(v42) then
                l_v20_SubjectPosition_0 = l_v20_SubjectPosition_0 + v42;
            end;
        elseif not (v35 ~= Vector2.new()) and v20.lastCameraTransform then
            local v43 = v20:IsInFirstPerson();
            if (v32 or v33 or v20.isFollowCamera and v34) and v20.lastUpdate and l_v20_Humanoid_0 and l_v20_Humanoid_0.Torso then
                if v43 then
                    if v20.lastSubjectCFrame and (v32 or v33) and l_CameraSubject_0:IsA("BasePart") then
                        local v44 = -l_CameraUtils_0.GetAngleBetweenXZVectors(v20.lastSubjectCFrame.lookVector, l_CameraSubject_0.CFrame.lookVector);
                        if l_CameraUtils_0.IsFinite(v44) then
                            v35 = v35 + Vector2.new(v44, 0);
                        end;
                        v1 = 0;
                    end;
                elseif not v37 then
                    local l_lookVector_0 = l_v20_Humanoid_0.Torso.CFrame.lookVector;
                    v1 = math.clamp(v1 + 3.839724354387525 * v23, 0, 4.363323129985824);
                    local v46 = math.clamp(v1 * v23, 0, 1);
                    if v20:IsInFirstPerson() and (not v20.isFollowCamera or not v20.isClimbing) then
                        v46 = 1;
                    end;
                    local v47 = l_CameraUtils_0.GetAngleBetweenXZVectors(l_lookVector_0, v20:GetCameraLookVector());
                    if l_CameraUtils_0.IsFinite(v47) and math.abs(v47) > 1.0E-4 then
                        v35 = v35 + Vector2.new(v47 * v46, 0);
                    end;
                end;
            elseif v20.isFollowCamera and not v43 and not v37 then
                local v48 = -(v20.lastCameraTransform.p - l_v20_SubjectPosition_0);
                local v49 = l_CameraUtils_0.GetAngleBetweenXZVectors(v48, v20:GetCameraLookVector());
                if l_CameraUtils_0.IsFinite(v49) and math.abs(v49) > 1.0E-4 and math.abs(v49) > 0.4 * v23 then
                    v35 = v35 + Vector2.new(v49, 0);
                end;
            end;
        end;
        if not v20.isFollowCamera then
            l_Focus_0 = CFrame.new(l_v20_SubjectPosition_0);
            local l_p_0 = l_Focus_0.p;
            local v51 = v20:CalculateNewLookVectorFromArg(v27, v35);
            l_CFrame_0 = if v7 then CFrame.lookAlong(l_p_0 - l_v20_CameraToSubjectDistance_0 * v51, v51) else CFrame.new(l_p_0 - l_v20_CameraToSubjectDistance_0 * v51, l_p_0);
        else
            local v52 = v20:CalculateNewLookVectorFromArg(v27, v35);
            l_Focus_0 = CFrame.new(l_v20_SubjectPosition_0);
            l_CFrame_0 = if v7 then CFrame.lookAlong(l_Focus_0.p - l_v20_CameraToSubjectDistance_0 * v52, v52) else CFrame.new(l_Focus_0.p - l_v20_CameraToSubjectDistance_0 * v52, l_Focus_0.p) + Vector3.new(0, l_v20_CameraHeight_0, 0);
        end;
        local l_v20_CameraToggleOffset_0 = v20:GetCameraToggleOffset(v23);
        l_Focus_0 = l_Focus_0 + l_v20_CameraToggleOffset_0;
        l_CFrame_0 = l_CFrame_0 + l_v20_CameraToggleOffset_0;
        v20.lastCameraTransform = l_CFrame_0;
        v20.lastCameraFocus = l_Focus_0;
        if (v32 or v33) and l_CameraSubject_0:IsA("BasePart") then
            v20.lastSubjectCFrame = l_CameraSubject_0.CFrame;
        else
            v20.lastSubjectCFrame = nil;
        end;
    end;
    v20.lastUpdate = v22;
    return l_CFrame_0, l_Focus_0;
end;
return v12;