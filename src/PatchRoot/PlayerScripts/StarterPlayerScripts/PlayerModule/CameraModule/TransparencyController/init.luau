local l_VRService_0 = game:GetService("VRService");
local v1 = {
    "BasePart", 
    "Decal", 
    "Beam", 
    "ParticleEmitter", 
    "Trail", 
    "Fire", 
    "Smoke", 
    "Sparkles", 
    "Explosion"
};
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v3 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
    return UserSettings():IsUserFeatureEnabled("UserHideCharacterParticlesInFirstPerson");
end);
v3 = l_status_0 and l_result_0;
l_status_0 = {};
l_status_0.__index = l_status_0;
l_status_0.new = function() --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: l_status_0 (copy)
    local v6 = setmetatable({}, l_status_0);
    v6.transparencyDirty = false;
    v6.enabled = false;
    v6.lastTransparency = nil;
    local v7 = nil;
    local v8 = nil;
    v6.descendantAddedConn = v7;
    v6.descendantRemovingConn = v8;
    v6.toolDescendantAddedConns = {};
    v6.toolDescendantRemovingConns = {};
    v6.cachedParts = {};
    return v6;
end;
l_status_0.HasToolAncestor = function(v9, v10) --[[ Line: 54 ]] --[[ Name: HasToolAncestor ]]
    if v10.Parent == nil then
        return false;
    else
        assert(v10.Parent, "");
        return v10.Parent:IsA("Tool") or v9:HasToolAncestor(v10.Parent);
    end;
end;
l_status_0.IsValidPartToModify = function(v11, v12) --[[ Line: 60 ]] --[[ Name: IsValidPartToModify ]]
    -- upvalues: v3 (ref), v1 (copy)
    if v3 then
        for _, v14 in v1 do
            if v12:IsA(v14) then
                return not v11:HasToolAncestor(v12);
            end;
        end;
    elseif v12:IsA("BasePart") or v12:IsA("Decal") then
        return not v11:HasToolAncestor(v12);
    end;
    return false;
end;
l_status_0.CachePartsRecursive = function(v15, v16) --[[ Line: 76 ]] --[[ Name: CachePartsRecursive ]]
    if v16 then
        if v15:IsValidPartToModify(v16) then
            v15.cachedParts[v16] = true;
            v15.transparencyDirty = true;
        end;
        for _, v18 in pairs(v16:GetChildren()) do
            v15:CachePartsRecursive(v18);
        end;
    end;
end;
l_status_0.TeardownTransparency = function(v19) --[[ Line: 88 ]] --[[ Name: TeardownTransparency ]]
    for v20, _ in pairs(v19.cachedParts) do
        v20.LocalTransparencyModifier = 0;
    end;
    v19.cachedParts = {};
    v19.transparencyDirty = true;
    v19.lastTransparency = nil;
    if v19.descendantAddedConn then
        v19.descendantAddedConn:disconnect();
        v19.descendantAddedConn = nil;
    end;
    if v19.descendantRemovingConn then
        v19.descendantRemovingConn:disconnect();
        v19.descendantRemovingConn = nil;
    end;
    for v22, v23 in pairs(v19.toolDescendantAddedConns) do
        v23:Disconnect();
        v19.toolDescendantAddedConns[v22] = nil;
    end;
    for v24, v25 in pairs(v19.toolDescendantRemovingConns) do
        v25:Disconnect();
        v19.toolDescendantRemovingConns[v24] = nil;
    end;
end;
l_status_0.SetupTransparency = function(v26, v27) --[[ Line: 114 ]] --[[ Name: SetupTransparency ]]
    v26:TeardownTransparency();
    if v26.descendantAddedConn then
        v26.descendantAddedConn:disconnect();
    end;
    v26.descendantAddedConn = v27.DescendantAdded:Connect(function(v28) --[[ Line: 118 ]]
        -- upvalues: v26 (copy), v27 (copy)
        if v26:IsValidPartToModify(v28) then
            v26.cachedParts[v28] = true;
            v26.transparencyDirty = true;
            return;
        else
            if v28:IsA("Tool") then
                if v26.toolDescendantAddedConns[v28] then
                    v26.toolDescendantAddedConns[v28]:Disconnect();
                end;
                v26.toolDescendantAddedConns[v28] = v28.DescendantAdded:Connect(function(v29) --[[ Line: 126 ]]
                    -- upvalues: v26 (ref)
                    v26.cachedParts[v29] = nil;
                    if v29:IsA("BasePart") or v29:IsA("Decal") then
                        v29.LocalTransparencyModifier = 0;
                    end;
                end);
                if v26.toolDescendantRemovingConns[v28] then
                    v26.toolDescendantRemovingConns[v28]:disconnect();
                end;
                v26.toolDescendantRemovingConns[v28] = v28.DescendantRemoving:Connect(function(v30) --[[ Line: 134 ]]
                    -- upvalues: v27 (ref), v26 (ref)
                    wait();
                    if v27 and v30 and v30:IsDescendantOf(v27) and v26:IsValidPartToModify(v30) then
                        v26.cachedParts[v30] = true;
                        v26.transparencyDirty = true;
                    end;
                end);
            end;
            return;
        end;
    end);
    if v26.descendantRemovingConn then
        v26.descendantRemovingConn:disconnect();
    end;
    v26.descendantRemovingConn = v27.DescendantRemoving:connect(function(v31) --[[ Line: 146 ]]
        -- upvalues: v26 (copy)
        if v26.cachedParts[v31] then
            v26.cachedParts[v31] = nil;
            v31.LocalTransparencyModifier = 0;
        end;
    end);
    v26:CachePartsRecursive(v27);
end;
l_status_0.Enable = function(v32, v33) --[[ Line: 157 ]] --[[ Name: Enable ]]
    if v32.enabled ~= v33 then
        v32.enabled = v33;
    end;
end;
l_status_0.SetSubject = function(v34, v35) --[[ Line: 163 ]] --[[ Name: SetSubject ]]
    local v36 = nil;
    if v35 and v35:IsA("Humanoid") then
        v36 = v35.Parent;
    end;
    if v35 and v35:IsA("VehicleSeat") and v35.Occupant then
        v36 = v35.Occupant.Parent;
    end;
    if v36 then
        v34:SetupTransparency(v36);
        return;
    else
        v34:TeardownTransparency();
        return;
    end;
end;
l_status_0.Update = function(v37, v38) --[[ Line: 178 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraUtils_0 (copy), l_VRService_0 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 and v37.enabled then
        local l_magnitude_0 = (l_CurrentCamera_0.Focus.p - l_CurrentCamera_0.CoordinateFrame.p).magnitude;
        local v41 = l_magnitude_0 < 2 and 1 - (l_magnitude_0 - 0.5) / 1.5 or 0;
        if v41 < 0.5 then
            v41 = 0;
        end;
        if v37.lastTransparency and v41 < 1 and v37.lastTransparency < 0.95 then
            local v42 = v41 - v37.lastTransparency;
            local v43 = 2.8 * v38;
            v42 = math.clamp(v42, -v43, v43);
            v41 = v37.lastTransparency + v42;
        else
            v37.transparencyDirty = true;
        end;
        v41 = math.clamp(l_CameraUtils_0.Round(v41, 2), 0, 1);
        if v37.transparencyDirty or v37.lastTransparency ~= v41 then
            for v44, _ in pairs(v37.cachedParts) do
                if l_VRService_0.VREnabled and l_VRService_0.AvatarGestures then
                    local v46 = {
                        [Enum.AccessoryType.Hat] = true, 
                        [Enum.AccessoryType.Hair] = true, 
                        [Enum.AccessoryType.Face] = true, 
                        [Enum.AccessoryType.Eyebrow] = true, 
                        [Enum.AccessoryType.Eyelash] = true
                    };
                    if v44.Parent:IsA("Accessory") and v46[v44.Parent.AccessoryType] or v44.Name == "Head" then
                        v44.LocalTransparencyModifier = v41;
                    else
                        v44.LocalTransparencyModifier = 0;
                    end;
                else
                    v44.LocalTransparencyModifier = v41;
                end;
            end;
            v37.transparencyDirty = false;
            v37.lastTransparency = v41;
        end;
    end;
end;
return l_status_0;