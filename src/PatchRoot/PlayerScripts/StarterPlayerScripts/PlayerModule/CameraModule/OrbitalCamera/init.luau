local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local _ = {
    InitialDistance = 25, 
    MinDistance = 10, 
    MaxDistance = 100, 
    InitialElevation = 35, 
    MinElevation = 35, 
    MaxElevation = 35, 
    ReferenceAzimuth = -45, 
    CWAzimuthTravel = 90, 
    CCWAzimuthTravel = 90, 
    UseAzimuthLimits = false
};
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_Players_0 = game:GetService("Players");
local v6 = l_FlagUtil_0.getUserFlag("UserFixOrbitalCam");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v8 = setmetatable({}, l_BaseCamera_0);
v8.__index = v8;
v8.new = function() --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v8 (copy)
    local v9 = setmetatable(l_BaseCamera_0.new(), v8);
    v9.lastUpdate = tick();
    v9.changedSignalConnections = {};
    v9.refAzimuthRad = nil;
    v9.curAzimuthRad = nil;
    v9.minAzimuthAbsoluteRad = nil;
    v9.maxAzimuthAbsoluteRad = nil;
    v9.useAzimuthLimits = nil;
    v9.curElevationRad = nil;
    v9.minElevationRad = nil;
    v9.maxElevationRad = nil;
    v9.curDistance = nil;
    v9.minDistance = nil;
    v9.maxDistance = nil;
    v9.gamepadDollySpeedMultiplier = 1;
    v9.lastUserPanCamera = tick();
    v9.externalProperties = {};
    v9.externalProperties.InitialDistance = 25;
    v9.externalProperties.MinDistance = 10;
    v9.externalProperties.MaxDistance = 100;
    v9.externalProperties.InitialElevation = 35;
    v9.externalProperties.MinElevation = 35;
    v9.externalProperties.MaxElevation = 35;
    v9.externalProperties.ReferenceAzimuth = -45;
    v9.externalProperties.CWAzimuthTravel = 90;
    v9.externalProperties.CCWAzimuthTravel = 90;
    v9.externalProperties.UseAzimuthLimits = false;
    v9:LoadNumberValueParameters();
    return v9;
end;
v8.LoadOrCreateNumberValueParameter = function(v10, v11, v12, v13) --[[ Line: 86 ]] --[[ Name: LoadOrCreateNumberValueParameter ]]
    local l_script_FirstChild_0 = script:FindFirstChild(v11);
    if l_script_FirstChild_0 and l_script_FirstChild_0:IsA(v12) then
        v10.externalProperties[v11] = l_script_FirstChild_0.Value;
    elseif v10.externalProperties[v11] ~= nil then
        l_script_FirstChild_0 = Instance.new(v12);
        l_script_FirstChild_0.Name = v11;
        l_script_FirstChild_0.Parent = script;
        l_script_FirstChild_0.Value = v10.externalProperties[v11];
    else
        return;
    end;
    if v13 then
        if v10.changedSignalConnections[v11] then
            v10.changedSignalConnections[v11]:Disconnect();
        end;
        v10.changedSignalConnections[v11] = l_script_FirstChild_0.Changed:Connect(function(v15) --[[ Line: 106 ]]
            -- upvalues: v10 (copy), v11 (copy), v13 (copy)
            v10.externalProperties[v11] = v15;
            v13(v10);
        end);
    end;
end;
v8.SetAndBoundsCheckAzimuthValues = function(v16) --[[ Line: 113 ]] --[[ Name: SetAndBoundsCheckAzimuthValues ]]
    v16.minAzimuthAbsoluteRad = math.rad(v16.externalProperties.ReferenceAzimuth) - math.abs((math.rad(v16.externalProperties.CWAzimuthTravel)));
    v16.maxAzimuthAbsoluteRad = math.rad(v16.externalProperties.ReferenceAzimuth) + math.abs((math.rad(v16.externalProperties.CCWAzimuthTravel)));
    v16.useAzimuthLimits = v16.externalProperties.UseAzimuthLimits;
    if v16.useAzimuthLimits then
        v16.curAzimuthRad = math.max(v16.curAzimuthRad, v16.minAzimuthAbsoluteRad);
        v16.curAzimuthRad = math.min(v16.curAzimuthRad, v16.maxAzimuthAbsoluteRad);
    end;
end;
v8.SetAndBoundsCheckElevationValues = function(v17) --[[ Line: 123 ]] --[[ Name: SetAndBoundsCheckElevationValues ]]
    local v18 = math.max(v17.externalProperties.MinElevation, -80);
    local v19 = math.min(v17.externalProperties.MaxElevation, 80);
    v17.minElevationRad = math.rad((math.min(v18, v19)));
    v17.maxElevationRad = math.rad((math.max(v18, v19)));
    v17.curElevationRad = math.max(v17.curElevationRad, v17.minElevationRad);
    v17.curElevationRad = math.min(v17.curElevationRad, v17.maxElevationRad);
end;
v8.SetAndBoundsCheckDistanceValues = function(v20) --[[ Line: 139 ]] --[[ Name: SetAndBoundsCheckDistanceValues ]]
    v20.minDistance = v20.externalProperties.MinDistance;
    v20.maxDistance = v20.externalProperties.MaxDistance;
    v20.curDistance = math.max(v20.curDistance, v20.minDistance);
    v20.curDistance = math.min(v20.curDistance, v20.maxDistance);
end;
v8.LoadNumberValueParameters = function(v21) --[[ Line: 147 ]] --[[ Name: LoadNumberValueParameters ]]
    v21:LoadOrCreateNumberValueParameter("InitialElevation", "NumberValue", nil);
    v21:LoadOrCreateNumberValueParameter("InitialDistance", "NumberValue", nil);
    v21:LoadOrCreateNumberValueParameter("ReferenceAzimuth", "NumberValue", v21.SetAndBoundsCheckAzimuthValue);
    v21:LoadOrCreateNumberValueParameter("CWAzimuthTravel", "NumberValue", v21.SetAndBoundsCheckAzimuthValues);
    v21:LoadOrCreateNumberValueParameter("CCWAzimuthTravel", "NumberValue", v21.SetAndBoundsCheckAzimuthValues);
    v21:LoadOrCreateNumberValueParameter("MinElevation", "NumberValue", v21.SetAndBoundsCheckElevationValues);
    v21:LoadOrCreateNumberValueParameter("MaxElevation", "NumberValue", v21.SetAndBoundsCheckElevationValues);
    v21:LoadOrCreateNumberValueParameter("MinDistance", "NumberValue", v21.SetAndBoundsCheckDistanceValues);
    v21:LoadOrCreateNumberValueParameter("MaxDistance", "NumberValue", v21.SetAndBoundsCheckDistanceValues);
    v21:LoadOrCreateNumberValueParameter("UseAzimuthLimits", "BoolValue", v21.SetAndBoundsCheckAzimuthValues);
    v21.curAzimuthRad = math.rad(v21.externalProperties.ReferenceAzimuth);
    v21.curElevationRad = math.rad(v21.externalProperties.InitialElevation);
    v21.curDistance = v21.externalProperties.InitialDistance;
    v21:SetAndBoundsCheckAzimuthValues();
    v21:SetAndBoundsCheckElevationValues();
    v21:SetAndBoundsCheckDistanceValues();
end;
v8.GetModuleName = function(_) --[[ Line: 172 ]] --[[ Name: GetModuleName ]]
    return "OrbitalCamera";
end;
v8.SetInitialOrientation = function(v23, v24) --[[ Line: 176 ]] --[[ Name: SetInitialOrientation ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if not v24 or not v24.RootPart then
        warn("OrbitalCamera could not set initial orientation due to missing humanoid");
        return;
    else
        assert(v24.RootPart, "");
        local l_Unit_0 = (v24.RootPart.CFrame.LookVector - Vector3.new(0, 0.23000000417232513, 0, 0)).Unit;
        local v26 = l_CameraUtils_0.GetAngleBetweenXZVectors(l_Unit_0, v23:GetCameraLookVector());
        local v27 = math.asin(v23:GetCameraLookVector().Y) - math.asin(l_Unit_0.Y);
        if not l_CameraUtils_0.IsFinite(v26) then
            v26 = 0;
        end;
        if not l_CameraUtils_0.IsFinite(v27) then
            v27 = 0;
        end;
        return;
    end;
end;
v8.GetCameraToSubjectDistance = function(v28) --[[ Line: 194 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v28.curDistance;
end;
v8.SetCameraToSubjectDistance = function(v29, v30) --[[ Line: 198 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_Players_0 (copy)
    if l_Players_0.LocalPlayer then
        v29.currentSubjectDistance = math.clamp(v30, v29.minDistance, v29.maxDistance);
        v29.currentSubjectDistance = math.max(v29.currentSubjectDistance, v29.FIRST_PERSON_DISTANCE_THRESHOLD);
    end;
    v29.inFirstPerson = false;
    v29:UpdateMouseBehavior();
    return v29.currentSubjectDistance;
end;
v8.CalculateNewLookVector = function(v31, v32, v33) --[[ Line: 211 ]] --[[ Name: CalculateNewLookVector ]]
    local v34 = v32 or v31:GetCameraLookVector();
    local v35 = math.asin(v34.Y);
    local v36 = math.clamp(v33.Y, v35 - 1.3962634015954636, v35 - -1.3962634015954636);
    local v37 = Vector2.new(v33.X, v36);
    local v38 = CFrame.new(Vector3.new(0, 0, 0, 0), v34);
    return (CFrame.Angles(0, -v37.X, 0) * v38 * CFrame.Angles(-v37.Y, 0, 0)).LookVector;
end;
v8.Update = function(v39, v40) --[[ Line: 222 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraInput_0 (copy), v6 (copy), l_Players_0 (copy)
    local v41 = tick();
    local v42 = v41 - v39.lastUpdate;
    local v43 = l_CameraInput_0.getRotation(if v6 then v40 else nil) ~= Vector2.new();
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Focus_0 = l_CurrentCamera_0.Focus;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v48 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    local v49 = v48 and v48:IsA("VehicleSeat");
    local v50 = v48 and v48:IsA("SkateboardPlatform");
    if v39.lastUpdate == nil or v42 > 1 then
        v39.lastCameraTransform = nil;
    end;
    if v43 then
        v39.lastUserPanCamera = tick();
    end;
    local l_v39_SubjectPosition_0 = v39:GetSubjectPosition();
    if l_v39_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
        if v39.gamepadDollySpeedMultiplier ~= 1 then
            v39:SetCameraToSubjectDistance(v39.currentSubjectDistance * v39.gamepadDollySpeedMultiplier);
        end;
        l_Focus_0 = CFrame.new(l_v39_SubjectPosition_0);
        local v52 = l_CameraInput_0.getRotation(v40);
        v39.curAzimuthRad = v39.curAzimuthRad - v52.X;
        if v39.useAzimuthLimits then
            v39.curAzimuthRad = math.clamp(v39.curAzimuthRad, v39.minAzimuthAbsoluteRad, v39.maxAzimuthAbsoluteRad);
        else
            v39.curAzimuthRad = v39.curAzimuthRad ~= 0 and math.sign(v39.curAzimuthRad) * (math.abs(v39.curAzimuthRad) % 6.283185307179586) or 0;
        end;
        v39.curElevationRad = math.clamp(v39.curElevationRad + v52.Y, v39.minElevationRad, v39.maxElevationRad);
        local v53 = l_v39_SubjectPosition_0 + v39.currentSubjectDistance * (CFrame.fromEulerAnglesYXZ(-v39.curElevationRad, v39.curAzimuthRad, 0) * Vector3.new(0, 0, 1, 0));
        l_CFrame_0 = CFrame.new(v53, l_v39_SubjectPosition_0);
        v39.lastCameraTransform = l_CFrame_0;
        v39.lastCameraFocus = l_Focus_0;
        if (v49 or v50) and v48:IsA("BasePart") then
            v39.lastSubjectCFrame = v48.CFrame;
        else
            v39.lastSubjectCFrame = nil;
        end;
    end;
    v39.lastUpdate = v41;
    return l_CFrame_0, l_Focus_0;
end;
return v8;