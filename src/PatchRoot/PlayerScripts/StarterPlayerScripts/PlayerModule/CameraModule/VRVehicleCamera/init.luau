local v0 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
    return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = {
    0, 
    30
};
l_result_0 = UserSettings():GetService("UserGameSettings");
local l_VRBaseCamera_0 = require(script.Parent:WaitForChild("VRBaseCamera"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local _ = require(script.Parent:WaitForChild("VehicleCamera"));
local l_VehicleCameraCore_0 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"));
local l_VehicleCameraConfig_0 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"));
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Spring_0 = l_CameraUtils_0.Spring;
local l_mapClamp_0 = l_CameraUtils_0.mapClamp;
local l_sanitizeAngle_0 = l_CameraUtils_0.sanitizeAngle;
local function _(v16, v17) --[[ Line: 46 ]] --[[ Name: pitchVelocity ]]
    return (math.abs((v17.XVector:Dot(v16))));
end;
local function _(v19, v20) --[[ Line: 51 ]] --[[ Name: yawVelocity ]]
    return (math.abs((v20.YVector:Dot(v19))));
end;
local v22 = 0.016666666666666666;
local v23 = setmetatable({}, l_VRBaseCamera_0);
v23.__index = v23;
v23.new = function() --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: l_VRBaseCamera_0 (copy), v23 (copy), l_RunService_0 (copy), v22 (ref)
    local v24 = setmetatable(l_VRBaseCamera_0.new(), v23);
    v24:Reset();
    l_RunService_0.Stepped:Connect(function(_, v26) --[[ Line: 64 ]]
        -- upvalues: v22 (ref)
        v22 = v26;
    end);
    return v24;
end;
v23.Reset = function(v27) --[[ Line: 72 ]] --[[ Name: Reset ]]
    -- upvalues: l_VehicleCameraCore_0 (copy), v0 (ref), l_Spring_0 (copy), l_VehicleCameraConfig_0 (copy), l_CameraUtils_0 (copy), l_status_0 (copy)
    v27.vehicleCameraCore = l_VehicleCameraCore_0.new(v27:GetSubjectCFrame());
    if v0 then
        v27.pitchSpring = l_Spring_0.new(0, 0);
    else
        v27.pitchSpring = l_Spring_0.new(0, -math.rad(l_VehicleCameraConfig_0.pitchBaseAngle));
    end;
    v27.yawSpring = l_Spring_0.new(0, 0);
    if v0 then
        v27.lastPanTick = 0;
        v27.currentDriftAngle = 0;
        v27.needsReset = true;
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v29 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    assert(l_CurrentCamera_0, "VRVehicleCamera initialization error");
    assert(v29);
    assert(v29:IsA("VehicleSeat"));
    local l_v29_ConnectedParts_0 = v29:GetConnectedParts(true);
    local v31, v32 = l_CameraUtils_0.getLooseBoundingSphere(l_v29_ConnectedParts_0);
    v27.assemblyRadius = math.max(v32, 5);
    v27.assemblyOffset = v29.CFrame:Inverse() * v31;
    v27.gamepadZoomLevels = {};
    for _, v34 in l_status_0 do
        table.insert(v27.gamepadZoomLevels, v34 * v27.headScale * v27.assemblyRadius / 10);
    end;
    v27.lastCameraFocus = nil;
    v27:SetCameraToSubjectDistance(v27.gamepadZoomLevels[#v27.gamepadZoomLevels]);
end;
v23._StepRotation = function(v35, v36, v37) --[[ Line: 112 ]] --[[ Name: _StepRotation ]]
    -- upvalues: l_sanitizeAngle_0 (copy), l_CameraInput_0 (copy), l_VehicleCameraConfig_0 (copy), l_mapClamp_0 (copy)
    local l_yawSpring_0 = v35.yawSpring;
    local l_pitchSpring_0 = v35.pitchSpring;
    local v40 = -v35:getRotation(v36);
    l_yawSpring_0.pos = l_sanitizeAngle_0(l_yawSpring_0.pos + v40);
    l_pitchSpring_0.pos = l_sanitizeAngle_0((math.clamp(l_pitchSpring_0.pos, -1.3962634015954636, 1.3962634015954636)));
    if l_CameraInput_0.getRotationActivated() then
        v35.lastPanTick = os.clock();
    end;
    local v41 = math.rad(l_VehicleCameraConfig_0.pitchDeadzoneAngle);
    if os.clock() - v35.lastPanTick > l_VehicleCameraConfig_0.autocorrectDelay then
        local v42 = l_mapClamp_0(v37, l_VehicleCameraConfig_0.autocorrectMinCarSpeed, l_VehicleCameraConfig_0.autocorrectMaxCarSpeed, 0, l_VehicleCameraConfig_0.autocorrectResponse);
        l_yawSpring_0.freq = v42;
        l_pitchSpring_0.freq = v42;
        if l_yawSpring_0.freq < 0.001 then
            l_yawSpring_0.vel = 0;
        end;
        if l_pitchSpring_0.freq < 0.001 then
            l_pitchSpring_0.vel = 0;
        end;
        if math.abs((l_sanitizeAngle_0(0 - l_pitchSpring_0.pos))) <= v41 then
            l_pitchSpring_0.goal = l_pitchSpring_0.pos;
        else
            l_pitchSpring_0.goal = 0;
        end;
    else
        l_yawSpring_0.freq = 0;
        l_yawSpring_0.vel = 0;
        l_pitchSpring_0.freq = 0;
        l_pitchSpring_0.vel = 0;
        l_pitchSpring_0.goal = 0;
    end;
    return CFrame.fromEulerAnglesYXZ(l_pitchSpring_0:step(v36), l_yawSpring_0:step(v36), 0);
end;
v23._GetThirdPersonLocalOffset = function(v43) --[[ Line: 176 ]] --[[ Name: _GetThirdPersonLocalOffset ]]
    -- upvalues: l_VehicleCameraConfig_0 (copy)
    return v43.assemblyOffset + Vector3.new(0, v43.assemblyRadius * l_VehicleCameraConfig_0.verticalCenterOffset, 0);
end;
v23._GetFirstPersonLocalOffset = function(v44, v45) --[[ Line: 180 ]] --[[ Name: _GetFirstPersonLocalOffset ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 and l_Character_0.Parent then
        local l_Head_0 = l_Character_0:FindFirstChild("Head");
        if l_Head_0 and l_Head_0:IsA("BasePart") then
            return v45:Inverse() * l_Head_0.Position;
        end;
    end;
    return v44:_GetThirdPersonLocalOffset();
end;
v23.Update = function(v48) --[[ Line: 194 ]] --[[ Name: Update ]]
    -- upvalues: v0 (ref), v22 (ref), l_LocalPlayer_0 (copy), l_VRService_0 (copy)
    if v0 then
        local l_v22_0 = v22;
        v22 = 0;
        v48:UpdateFadeFromBlack(l_v22_0);
        v48:UpdateEdgeBlur(l_LocalPlayer_0, l_v22_0);
        local _ = nil;
        local _ = nil;
        if l_VRService_0.ThirdPersonFollowCamEnabled then
            local v52, v53 = v48:UpdateStepRotation(l_v22_0);
            return v52, v53;
        else
            local v54, v55 = v48:UpdateComfortCamera(l_v22_0);
            return v54, v55;
        end;
    else
        return v48:UpdateComfortCamera();
    end;
end;
v23.addDrift = function(v56, v57, v58) --[[ Line: 217 ]] --[[ Name: addDrift ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_VRService_0 (copy)
    local function _(v59) --[[ Line: 218 ]] --[[ Name: NormalizeAngle ]]
        v59 = (v59 + 12.566370614359172) % 6.283185307179586;
        if v59 > 3.141592653589793 then
            v59 = v59 - 6.283185307179586;
        end;
        return v59;
    end;
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local l_v56_CameraToSubjectDistance_0 = v56:GetCameraToSubjectDistance();
    local l_v56_SubjectVelocity_0 = v56:GetSubjectVelocity();
    local l_v56_SubjectCFrame_0 = v56:GetSubjectCFrame();
    local _ = require(l_LocalPlayer_0:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"));
    if l_v56_SubjectVelocity_0.Magnitude > 0.1 then
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        l_l_VRService_0_UserCFrame_0 = l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_1.HeadScale;
        local v67 = l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_0;
        local _, v69, _ = v67:ToEulerAnglesYXZ();
        local _, v72, _ = l_v56_SubjectCFrame_0:ToEulerAnglesYXZ();
        local v74 = (v69 - v56.currentDriftAngle + 12.566370614359172) % 6.283185307179586;
        if v74 > 3.141592653589793 then
            v74 = v74 - 6.283185307179586;
        end;
        local l_v74_0 = v74;
        local v76 = (v72 - v56.currentDriftAngle + 12.566370614359172) % 6.283185307179586;
        if v76 > 3.141592653589793 then
            v76 = v76 - 6.283185307179586;
        end;
        v74 = v76;
        v76 = math.min(v74, l_v74_0);
        local v77 = math.max(v74, l_v74_0);
        local v78 = 0;
        if v76 > 0 then
            v78 = v76;
        elseif v77 < 0 then
            v78 = v77;
        end;
        v56.currentDriftAngle = v78 + v56.currentDriftAngle;
        local l_LookVector_0 = CFrame.fromEulerAnglesYXZ(0, v56.currentDriftAngle, 0).LookVector;
        local v80 = Vector3.new(l_LookVector_0.X, 0, l_LookVector_0.Z).Unit * l_v56_CameraToSubjectDistance_0;
        local v81 = v58.Position - v80;
        v57 = v57:Lerp(CFrame.new(l_CurrentCamera_1.CFrame.Position + v81 - v67.Position) * l_CurrentCamera_1.CFrame.Rotation, 0.01);
    end;
    return v57, v58;
end;
v23.UpdateRotationCamera = function(v82, v83) --[[ Line: 275 ]] --[[ Name: UpdateRotationCamera ]]
    -- upvalues: l_mapClamp_0 (copy), l_LocalPlayer_0 (copy)
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v85 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    local l_vehicleCameraCore_0 = v82.vehicleCameraCore;
    assert(l_CurrentCamera_2);
    assert(v85);
    assert(v85:IsA("VehicleSeat"));
    local l_v82_SubjectCFrame_0 = v82:GetSubjectCFrame();
    local l_v82_SubjectVelocity_0 = v82:GetSubjectVelocity();
    local l_v82_SubjectRotVelocity_0 = v82:GetSubjectRotVelocity();
    local v90 = math.abs((l_v82_SubjectVelocity_0:Dot(l_v82_SubjectCFrame_0.ZVector)));
    local v91 = math.abs((l_v82_SubjectCFrame_0.YVector:Dot(l_v82_SubjectRotVelocity_0)));
    local v92 = math.abs((l_v82_SubjectCFrame_0.XVector:Dot(l_v82_SubjectRotVelocity_0)));
    local l_v82_CameraToSubjectDistance_0 = v82:GetCameraToSubjectDistance();
    local v94 = l_mapClamp_0(l_v82_CameraToSubjectDistance_0, 0.5, v82.assemblyRadius, 1, 0);
    local v95 = v82:_GetThirdPersonLocalOffset():Lerp(v82:_GetFirstPersonLocalOffset(l_v82_SubjectCFrame_0), v94);
    l_vehicleCameraCore_0:setTransform(l_v82_SubjectCFrame_0);
    local v96 = l_vehicleCameraCore_0:step(v83, v92, v91, v94);
    local v97 = v82:_StepRotation(v83, v90);
    local v98 = v82:GetVRFocus(l_v82_SubjectCFrame_0 * v95, v83) * v96 * v97;
    local v99 = v98 * CFrame.new(0, 0, l_v82_CameraToSubjectDistance_0);
    if l_v82_SubjectVelocity_0.Magnitude > 0.1 then
        v82:StartVREdgeBlur(l_LocalPlayer_0);
    end;
    return v99, v98;
end;
v23.UpdateStepRotation = function(v100, v101) --[[ Line: 322 ]] --[[ Name: UpdateStepRotation ]]
    -- upvalues: l_mapClamp_0 (copy), l_result_0 (copy), l_VRService_0 (copy), l_LocalPlayer_0 (copy)
    local v102 = nil;
    local v103 = nil;
    local l_CurrentCamera_3 = workspace.CurrentCamera;
    local l_lastSubjectCFrame_0 = v100.lastSubjectCFrame;
    local l_v100_SubjectCFrame_0 = v100:GetSubjectCFrame();
    local l_v100_SubjectVelocity_0 = v100:GetSubjectVelocity();
    local l_v100_CameraToSubjectDistance_0 = v100:GetCameraToSubjectDistance();
    local v109 = l_mapClamp_0(l_v100_CameraToSubjectDistance_0, 0.5, v100.assemblyRadius, 1, 0);
    local v110 = v100:_GetThirdPersonLocalOffset():Lerp(v100:_GetFirstPersonLocalOffset(l_v100_SubjectCFrame_0), v109);
    v103 = v100:GetVRFocus(l_v100_SubjectCFrame_0 * v110, v101);
    local v111, v112 = v100:addDrift(v103:ToWorldSpace(v100:GetVRFocus(l_lastSubjectCFrame_0 * v110, v101):ToObjectSpace(l_CurrentCamera_3.CFrame)), v103);
    v102 = v111;
    v103 = v112;
    v111 = v100:getRotation(v101);
    if math.abs(v111) > 0 then
        v112 = v103:ToObjectSpace(v102);
        local v113 = v103 * CFrame.Angles(0, -v111, 0) * v112;
        if not l_result_0.VRSmoothRotationEnabled then
            local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            l_l_VRService_0_UserCFrame_1 = l_l_VRService_0_UserCFrame_1.Rotation + l_l_VRService_0_UserCFrame_1.Position * l_CurrentCamera_3.HeadScale;
            local v115 = v103 * l_v100_SubjectCFrame_0.Rotation;
            local v116 = v115:ToObjectSpace(v102 * l_l_VRService_0_UserCFrame_1);
            local v117 = math.acos((Vector3.new(v116.X, 0, v116.Z).Unit:Dot((Vector3.new(0, 0, 1, 0)))));
            local v118 = v115:ToObjectSpace(v113 * l_l_VRService_0_UserCFrame_1);
            if math.acos((Vector3.new(v118.X, 0, v118.Z).Unit:Dot((Vector3.new(0, 0, 1, 0))))) < v117 then
                if v111 < 0 then
                    v117 = v117 * -1;
                end;
                v113 = v103 * CFrame.Angles(0, -v117, 0) * v112;
            end;
        end;
        v102 = v113;
    end;
    if l_v100_SubjectVelocity_0.Magnitude > 0.1 then
        v100:StartVREdgeBlur(l_LocalPlayer_0);
    end;
    if v100.needsReset then
        v100.needsReset = false;
        l_VRService_0:RecenterUserHeadCFrame();
        v100:StartFadeFromBlack();
        v100:ResetZoom();
    end;
    if v100.recentered then
        v102 = v103 * l_v100_SubjectCFrame_0.Rotation * CFrame.new(0, 0, l_v100_CameraToSubjectDistance_0);
        v100.recentered = false;
    end;
    return v102, v102 * CFrame.new(0, 0, -l_v100_CameraToSubjectDistance_0);
end;
v23.UpdateComfortCamera = function(v119, v120) --[[ Line: 408 ]] --[[ Name: UpdateComfortCamera ]]
    -- upvalues: v0 (ref), v22 (ref), l_mapClamp_0 (copy), l_LocalPlayer_0 (copy)
    local l_CurrentCamera_4 = workspace.CurrentCamera;
    local v122 = l_CurrentCamera_4 and l_CurrentCamera_4.CameraSubject;
    local l_vehicleCameraCore_1 = v119.vehicleCameraCore;
    assert(l_CurrentCamera_4);
    assert(v122);
    assert(v122:IsA("VehicleSeat"));
    if not v0 then
        v120 = v22;
        v22 = 0;
    end;
    local l_v119_SubjectCFrame_0 = v119:GetSubjectCFrame();
    local l_v119_SubjectVelocity_0 = v119:GetSubjectVelocity();
    local l_v119_SubjectRotVelocity_0 = v119:GetSubjectRotVelocity();
    local _ = math.abs((l_v119_SubjectVelocity_0:Dot(l_v119_SubjectCFrame_0.ZVector)));
    local v128 = math.abs((l_v119_SubjectCFrame_0.YVector:Dot(l_v119_SubjectRotVelocity_0)));
    local v129 = math.abs((l_v119_SubjectCFrame_0.XVector:Dot(l_v119_SubjectRotVelocity_0)));
    local v130 = v119:StepZoom();
    local v131 = l_mapClamp_0(v130, 0.5, v119.assemblyRadius, 1, 0);
    local v132 = v119:_GetThirdPersonLocalOffset():Lerp(v119:_GetFirstPersonLocalOffset(l_v119_SubjectCFrame_0), v131);
    l_vehicleCameraCore_1:setTransform(l_v119_SubjectCFrame_0);
    local v133 = l_vehicleCameraCore_1:step(v120, v129, v128, v131);
    local v134 = nil;
    local v135 = nil;
    if not v0 then
        v119:UpdateFadeFromBlack(v120);
    end;
    if not v119:IsInFirstPerson() then
        v134 = CFrame.new(l_v119_SubjectCFrame_0 * v132) * v133;
        v135 = v134 * CFrame.new(0, 0, v130);
        if not v119.lastCameraFocus then
            v119.lastCameraFocus = v134;
            v119.needsReset = true;
        end;
        local v136 = v134.Position - l_CurrentCamera_4.CFrame.Position;
        local l_magnitude_0 = v136.magnitude;
        if v136.Unit:Dot(l_CurrentCamera_4.CFrame.LookVector) > 0.56 and l_magnitude_0 < 200 and not v119.needsReset then
            v134 = v119.lastCameraFocus;
            local l_p_0 = v134.p;
            local l_v119_CameraLookVector_0 = v119:GetCameraLookVector();
            local v140 = v119:CalculateNewLookVectorFromArg(Vector3.new(l_v119_CameraLookVector_0.X, 0, l_v119_CameraLookVector_0.Z).Unit, Vector2.new(0, 0));
            v135 = CFrame.new(l_p_0 - v130 * v140, l_p_0);
        else
            v119.lastCameraFocus = v119:GetVRFocus(l_v119_SubjectCFrame_0.Position, v120);
            v119.needsReset = false;
            v119:StartFadeFromBlack();
            v119:ResetZoom();
        end;
        if not v0 then
            v119:UpdateEdgeBlur(l_LocalPlayer_0, v120);
        end;
    else
        local l_Unit_0 = Vector3.new(v133.LookVector.X, 0, v133.LookVector.Z).Unit;
        local v142 = CFrame.new(v133.Position, l_Unit_0);
        v134 = CFrame.new(l_v119_SubjectCFrame_0 * v132) * v142;
        v135 = v134 * CFrame.new(0, 0, v130);
        if v0 then
            if l_v119_SubjectVelocity_0.Magnitude > 0.1 then
                v119:StartVREdgeBlur(l_LocalPlayer_0);
            end;
        else
            v119:StartVREdgeBlur(l_LocalPlayer_0);
        end;
    end;
    return v135, v134;
end;
return v23;