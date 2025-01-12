local v0 = {
    0, 
    15, 
    30
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local _ = require(script.Parent:WaitForChild("ZoomController"));
local l_VehicleCameraCore_0 = require(script:WaitForChild("VehicleCameraCore"));
local l_VehicleCameraConfig_0 = require(script:WaitForChild("VehicleCameraConfig"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_CameraUtils_0.map;
local l_Spring_0 = l_CameraUtils_0.Spring;
local l_mapClamp_0 = l_CameraUtils_0.mapClamp;
local l_sanitizeAngle_0 = l_CameraUtils_0.sanitizeAngle;
local function _(v14, v15) --[[ Line: 31 ]] --[[ Name: pitchVelocity ]]
    return (math.abs((v15.XVector:Dot(v14))));
end;
local function _(v17, v18) --[[ Line: 36 ]] --[[ Name: yawVelocity ]]
    return (math.abs((v18.YVector:Dot(v17))));
end;
local v20 = 0.016666666666666666;
l_RunService_0.Stepped:Connect(function(_, v22) --[[ Line: 42 ]]
    -- upvalues: v20 (ref)
    v20 = v22;
end);
local v23 = setmetatable({}, l_BaseCamera_0);
v23.__index = v23;
v23.new = function() --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v23 (copy)
    local v24 = setmetatable(l_BaseCamera_0.new(), v23);
    v24:Reset();
    return v24;
end;
v23.Reset = function(v25) --[[ Line: 55 ]] --[[ Name: Reset ]]
    -- upvalues: l_VehicleCameraCore_0 (copy), l_Spring_0 (copy), l_VehicleCameraConfig_0 (copy), l_CameraUtils_0 (copy), v0 (copy)
    v25.vehicleCameraCore = l_VehicleCameraCore_0.new(v25:GetSubjectCFrame());
    v25.pitchSpring = l_Spring_0.new(0, -math.rad(l_VehicleCameraConfig_0.pitchBaseAngle));
    v25.yawSpring = l_Spring_0.new(0, 0);
    v25.lastPanTick = 0;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v27 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    assert(l_CurrentCamera_0);
    assert(v27);
    assert(v27:IsA("VehicleSeat"));
    local l_v27_ConnectedParts_0 = v27:GetConnectedParts(true);
    local v29, v30 = l_CameraUtils_0.getLooseBoundingSphere(l_v27_ConnectedParts_0);
    v25.assemblyRadius = math.max(v30, 5);
    v25.assemblyOffset = v27.CFrame:Inverse() * v29;
    v25.gamepadZoomLevels = {};
    for _, v32 in v0 do
        table.insert(v25.gamepadZoomLevels, v32 * v25.assemblyRadius / 10);
    end;
    v25:SetCameraToSubjectDistance(v25.gamepadZoomLevels[#v25.gamepadZoomLevels]);
end;
v23._StepRotation = function(v33, v34, v35) --[[ Line: 85 ]] --[[ Name: _StepRotation ]]
    -- upvalues: l_CameraInput_0 (copy), l_sanitizeAngle_0 (copy), l_VehicleCameraConfig_0 (copy), l_mapClamp_0 (copy)
    local l_yawSpring_0 = v33.yawSpring;
    local l_pitchSpring_0 = v33.pitchSpring;
    local v38 = l_CameraInput_0.getRotation(v34, true);
    local v39 = -v38.X;
    local v40 = -v38.Y;
    l_yawSpring_0.pos = l_sanitizeAngle_0(l_yawSpring_0.pos + v39);
    l_pitchSpring_0.pos = l_sanitizeAngle_0((math.clamp(l_pitchSpring_0.pos + v40, -1.3962634015954636, 1.3962634015954636)));
    if l_CameraInput_0.getRotationActivated() then
        v33.lastPanTick = os.clock();
    end;
    local v41 = -math.rad(l_VehicleCameraConfig_0.pitchBaseAngle);
    local v42 = math.rad(l_VehicleCameraConfig_0.pitchDeadzoneAngle);
    if os.clock() - v33.lastPanTick > l_VehicleCameraConfig_0.autocorrectDelay then
        local v43 = l_mapClamp_0(v35, l_VehicleCameraConfig_0.autocorrectMinCarSpeed, l_VehicleCameraConfig_0.autocorrectMaxCarSpeed, 0, l_VehicleCameraConfig_0.autocorrectResponse);
        l_yawSpring_0.freq = v43;
        l_pitchSpring_0.freq = v43;
        if l_yawSpring_0.freq < 0.001 then
            l_yawSpring_0.vel = 0;
        end;
        if l_pitchSpring_0.freq < 0.001 then
            l_pitchSpring_0.vel = 0;
        end;
        if math.abs((l_sanitizeAngle_0(v41 - l_pitchSpring_0.pos))) <= v42 then
            l_pitchSpring_0.goal = l_pitchSpring_0.pos;
        else
            l_pitchSpring_0.goal = v41;
        end;
    else
        l_yawSpring_0.freq = 0;
        l_yawSpring_0.vel = 0;
        l_pitchSpring_0.freq = 0;
        l_pitchSpring_0.vel = 0;
        l_pitchSpring_0.goal = v41;
    end;
    return CFrame.fromEulerAnglesYXZ(l_pitchSpring_0:step(v34), l_yawSpring_0:step(v34), 0);
end;
v23._GetThirdPersonLocalOffset = function(v44) --[[ Line: 148 ]] --[[ Name: _GetThirdPersonLocalOffset ]]
    -- upvalues: l_VehicleCameraConfig_0 (copy)
    return v44.assemblyOffset + Vector3.new(0, v44.assemblyRadius * l_VehicleCameraConfig_0.verticalCenterOffset, 0);
end;
v23._GetFirstPersonLocalOffset = function(v45, v46) --[[ Line: 152 ]] --[[ Name: _GetFirstPersonLocalOffset ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 and l_Character_0.Parent then
        local l_Head_0 = l_Character_0:FindFirstChild("Head");
        if l_Head_0 and l_Head_0:IsA("BasePart") then
            return v46:Inverse() * l_Head_0.Position;
        end;
    end;
    return v45:_GetThirdPersonLocalOffset();
end;
v23.Update = function(v49) --[[ Line: 166 ]] --[[ Name: Update ]]
    -- upvalues: v20 (ref), l_mapClamp_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v51 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    local l_vehicleCameraCore_0 = v49.vehicleCameraCore;
    assert(l_CurrentCamera_1);
    assert(v51);
    assert(v51:IsA("VehicleSeat"));
    local l_v20_0 = v20;
    v20 = 0;
    local l_v49_SubjectCFrame_0 = v49:GetSubjectCFrame();
    local l_v49_SubjectVelocity_0 = v49:GetSubjectVelocity();
    local l_v49_SubjectRotVelocity_0 = v49:GetSubjectRotVelocity();
    local v57 = math.abs((l_v49_SubjectVelocity_0:Dot(l_v49_SubjectCFrame_0.ZVector)));
    local v58 = math.abs((l_v49_SubjectCFrame_0.YVector:Dot(l_v49_SubjectRotVelocity_0)));
    local v59 = math.abs((l_v49_SubjectCFrame_0.XVector:Dot(l_v49_SubjectRotVelocity_0)));
    local v60 = v49:StepZoom();
    local v61 = v49:_StepRotation(l_v20_0, v57);
    local v62 = l_mapClamp_0(v60, 0.5, v49.assemblyRadius, 1, 0);
    local v63 = v49:_GetThirdPersonLocalOffset():Lerp(v49:_GetFirstPersonLocalOffset(l_v49_SubjectCFrame_0), v62);
    l_vehicleCameraCore_0:setTransform(l_v49_SubjectCFrame_0);
    local v64 = l_vehicleCameraCore_0:step(l_v20_0, v59, v58, v62);
    local v65 = CFrame.new(l_v49_SubjectCFrame_0 * v63) * v64 * v61;
    return v65 * CFrame.new(0, 0, v60), v65;
end;
v23.ApplyVRTransform = function(_) --[[ Line: 211 ]] --[[ Name: ApplyVRTransform ]]

end;
return v23;