local l_Players_0 = game:GetService("Players");
local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
local l_CommonUtils_0 = script.Parent.Parent.Parent:WaitForChild("CommonUtils");
local v3 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements");
local l_min_0 = math.min;
local l_tan_0 = math.tan;
local l_rad_0 = math.rad;
local l_new_0 = Ray.new;
local v8 = RaycastParams.new();
v8.IgnoreWater = true;
v8.FilterType = Enum.RaycastFilterType.Exclude;
local v9 = RaycastParams.new();
v9.IgnoreWater = true;
v9.FilterType = Enum.RaycastFilterType.Include;
local function _(v10) --[[ Line: 31 ]] --[[ Name: getTotalTransparency ]]
    return 1 - (1 - v10.Transparency) * (1 - v10.LocalTransparencyModifier);
end;
local function _(v12, v13) --[[ Line: 35 ]] --[[ Name: eraseFromEnd ]]
    for v14 = #v12, v13 + 1, -1 do
        v12[v14] = nil;
    end;
end;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local function v22() --[[ Line: 42 ]] --[[ Name: updateProjection ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_rad_0 (copy), v18 (ref), l_tan_0 (copy), v17 (ref)
    local v19 = l_rad_0(l_CurrentCamera_0.FieldOfView);
    local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
    local v21 = l_ViewportSize_0.X / l_ViewportSize_0.Y;
    v18 = 2 * l_tan_0(v19 / 2);
    v17 = v21 * v18;
end;
l_CurrentCamera_0:GetPropertyChangedSignal("FieldOfView"):Connect(v22);
l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v22);
local v23 = l_rad_0(l_CurrentCamera_0.FieldOfView);
local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
local v25 = l_ViewportSize_1.X / l_ViewportSize_1.Y;
v18 = 2 * l_tan_0(v23 / 2);
v17 = v25 * v18;
v16 = l_CurrentCamera_0.NearPlaneZ;
l_CurrentCamera_0:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 57 ]]
    -- upvalues: v16 (ref), l_CurrentCamera_0 (copy)
    v16 = l_CurrentCamera_0.NearPlaneZ;
end);
v22 = {};
v23 = {};
local l_v23_0 = v23 --[[ copy: 17 -> 27 ]];
l_ViewportSize_1 = function() --[[ Line: 65 ]] --[[ Name: refreshIgnoreList ]]
    -- upvalues: v22 (ref), l_v23_0 (copy)
    local v27 = 1;
    v22 = {};
    for _, v29 in pairs(l_v23_0) do
        v22[v27] = v29;
        v27 = v27 + 1;
    end;
end;
v25 = function(v30) --[[ Line: 74 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_v23_0 (copy), v22 (ref)
    local function v35(v31) --[[ Line: 75 ]] --[[ Name: characterAdded ]]
        -- upvalues: l_v23_0 (ref), v30 (copy), v22 (ref)
        l_v23_0[v30] = v31;
        local v32 = 1;
        v22 = {};
        for _, v34 in pairs(l_v23_0) do
            v22[v32] = v34;
            v32 = v32 + 1;
        end;
    end;
    local function v39() --[[ Line: 79 ]] --[[ Name: characterRemoving ]]
        -- upvalues: l_v23_0 (ref), v30 (copy), v22 (ref)
        l_v23_0[v30] = nil;
        local v36 = 1;
        v22 = {};
        for _, v38 in pairs(l_v23_0) do
            v22[v36] = v38;
            v36 = v36 + 1;
        end;
    end;
    v30.CharacterAdded:Connect(v35);
    v30.CharacterRemoving:Connect(v39);
    if v30.Character then
        l_v23_0[v30] = v30.Character;
        local v40 = 1;
        v22 = {};
        for _, v42 in pairs(l_v23_0) do
            v22[v40] = v42;
            v40 = v40 + 1;
        end;
    end;
end;
local function v47(v43) --[[ Line: 91 ]] --[[ Name: playerRemoving ]]
    -- upvalues: l_v23_0 (copy), v22 (ref)
    l_v23_0[v43] = nil;
    local v44 = 1;
    v22 = {};
    for _, v46 in pairs(l_v23_0) do
        v22[v44] = v46;
        v44 = v44 + 1;
    end;
end;
l_Players_0.PlayerAdded:Connect(v25);
l_Players_0.PlayerRemoving:Connect(v47);
for _, v49 in ipairs(l_Players_0:GetPlayers()) do
    v25(v49);
end;
local v50 = 1;
v22 = {};
for _, v52 in pairs(v23) do
    v22[v50] = v52;
    v50 = v50 + 1;
end;
v23 = nil;
l_ViewportSize_1 = nil;
l_CurrentCamera_0:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 125 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_ViewportSize_1 (ref)
    local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
    if l_CameraSubject_0:IsA("Humanoid") then
        l_ViewportSize_1 = l_CameraSubject_0.RootPart;
        return;
    elseif l_CameraSubject_0:IsA("BasePart") then
        l_ViewportSize_1 = l_CameraSubject_0;
        return;
    else
        l_ViewportSize_1 = nil;
        return;
    end;
end);
v25 = function(v54) --[[ Line: 136 ]] --[[ Name: canOcclude ]]
    -- upvalues: v23 (ref)
    local v55 = false;
    if 1 - (1 - v54.Transparency) * (1 - v54.LocalTransparencyModifier) < 0.25 then
        v55 = v54.CanCollide and v23 ~= (v54:GetRootPart() or v54) and not v54:IsA("TrussPart");
    end;
    return v55;
end;
v47 = {
    Vector2.new(0.4, 0), 
    Vector2.new(-0.4, 0), 
    Vector2.new(0, -0.4), 
    Vector2.new(0, 0.4), 
    Vector2.new(0, 0.2)
};
v50 = function(v56, v57) --[[ Line: 164 ]] --[[ Name: getCollisionPoint ]]
    -- upvalues: v3 (copy), v8 (copy), v22 (ref), l_new_0 (copy)
    if v3 then
        v8.FilterDescendantsInstances = v22;
        repeat
            local v58 = workspace:Raycast(v56, v57, v8);
            if v58 then
                if v58.Instance.CanCollide then
                    return v58.Position, true;
                else
                    v8:AddToFilter(v58.Instance);
                end;
            end;
        until not v58;
    else
        local v59 = #v22;
        while true do
            local l_workspace_PartOnRayWithIgnoreList_0, v61 = workspace:FindPartOnRayWithIgnoreList(l_new_0(v56, v57), v22, false, true);
            if l_workspace_PartOnRayWithIgnoreList_0 then
                if l_workspace_PartOnRayWithIgnoreList_0.CanCollide then
                    local l_v22_0 = v22;
                    for v63 = #l_v22_0, v59 + 1, -1 do
                        l_v22_0[v63] = nil;
                    end;
                    return v61, true;
                else
                    v22[#v22 + 1] = l_workspace_PartOnRayWithIgnoreList_0;
                end;
            end;
            if not l_workspace_PartOnRayWithIgnoreList_0 then
                l_workspace_PartOnRayWithIgnoreList_0 = v22;
                for v64 = #l_workspace_PartOnRayWithIgnoreList_0, v59 + 1, -1 do
                    l_workspace_PartOnRayWithIgnoreList_0[v64] = nil;
                end;
                break;
            end;
        end;
    end;
    return v56 + v57, false;
end;
local function v91(v65, v66, v67, v68) --[[ Line: 202 ]] --[[ Name: queryPoint ]]
    -- upvalues: v22 (ref), v16 (ref), v3 (copy), v8 (copy), v23 (ref), v9 (copy), l_new_0 (copy)
    debug.profilebegin("queryPoint");
    local v69 = #v22;
    v67 = v67 + v16;
    local v70 = v65 + v66 * v67;
    local v71 = 1e999;
    local v72 = 1e999;
    local l_v65_0 = v65;
    local v74 = 0;
    if v3 then
        repeat
            v8.FilterDescendantsInstances = v22;
            local v75 = workspace:Raycast(l_v65_0, v70 - l_v65_0, v8);
            local v76 = nil;
            local v77 = nil;
            if v75 then
                v76 = v75.Instance;
                v77 = v75.Position;
                v74 = v74 + 1;
                local v78 = v74 >= 64;
                local l_v76_0 = v76;
                local v80 = false;
                if 1 - (1 - l_v76_0.Transparency) * (1 - l_v76_0.LocalTransparencyModifier) < 0.25 then
                    v80 = l_v76_0.CanCollide and v23 ~= (l_v76_0:GetRootPart() or l_v76_0) and not l_v76_0:IsA("TrussPart");
                end;
                if v80 or v78 then
                    v9.FilterDescendantsInstances = {
                        v76
                    };
                    l_v76_0 = workspace:Raycast(v70, v77 - v70, v9);
                    local l_Magnitude_0 = (v77 - v65).Magnitude;
                    if l_v76_0 and not v78 then
                        if if v68 then workspace:Raycast(v68, v70 - v68, v9) or workspace:Raycast(v70, v68 - v70, v9) else nil then
                            v72 = l_Magnitude_0;
                        elseif v67 < v71 then
                            v71 = l_Magnitude_0;
                        end;
                    else
                        v72 = l_Magnitude_0;
                    end;
                end;
                v8:AddToFilter(v76);
                l_v65_0 = v77 - v66 * 0.001;
            end;
        until v72 < 1e999 or not v76;
    else
        repeat
            local l_workspace_PartOnRayWithIgnoreList_1, v83 = workspace:FindPartOnRayWithIgnoreList(l_new_0(l_v65_0, v70 - l_v65_0), v22, false, true);
            v74 = v74 + 1;
            if l_workspace_PartOnRayWithIgnoreList_1 then
                local v84 = v74 >= 64;
                local v85 = false;
                if 1 - (1 - l_workspace_PartOnRayWithIgnoreList_1.Transparency) * (1 - l_workspace_PartOnRayWithIgnoreList_1.LocalTransparencyModifier) < 0.25 then
                    v85 = l_workspace_PartOnRayWithIgnoreList_1.CanCollide and v23 ~= (l_workspace_PartOnRayWithIgnoreList_1:GetRootPart() or l_workspace_PartOnRayWithIgnoreList_1) and not l_workspace_PartOnRayWithIgnoreList_1:IsA("TrussPart");
                end;
                if v85 or v84 then
                    v85 = {
                        l_workspace_PartOnRayWithIgnoreList_1
                    };
                    local l_workspace_PartOnRayWithWhitelist_0 = workspace:FindPartOnRayWithWhitelist(l_new_0(v70, v83 - v70), v85, true);
                    local l_Magnitude_1 = (v83 - v65).Magnitude;
                    if l_workspace_PartOnRayWithWhitelist_0 and not v84 then
                        local v88 = false;
                        if v68 then
                            v88 = workspace:FindPartOnRayWithWhitelist(l_new_0(v68, v70 - v68), v85, true) or workspace:FindPartOnRayWithWhitelist(l_new_0(v70, v68 - v70), v85, true);
                        end;
                        if v88 then
                            v72 = l_Magnitude_1;
                        elseif v67 < v71 then
                            v71 = l_Magnitude_1;
                        end;
                    else
                        v72 = l_Magnitude_1;
                    end;
                end;
                v22[#v22 + 1] = l_workspace_PartOnRayWithIgnoreList_1;
                l_v65_0 = v83 - v66 * 0.001;
            end;
        until v72 < 1e999 or not l_workspace_PartOnRayWithIgnoreList_1;
        local l_v22_1 = v22;
        for v90 = #l_v22_1, v69 + 1, -1 do
            l_v22_1[v90] = nil;
        end;
    end;
    debug.profileend();
    return v71 - v16, v72 - v16;
end;
local function v109(v92, v93) --[[ Line: 306 ]] --[[ Name: queryViewport ]]
    -- upvalues: l_CurrentCamera_0 (copy), v17 (ref), v18 (ref), v16 (ref), v91 (copy)
    debug.profilebegin("queryViewport");
    local l_p_0 = v92.p;
    local l_rightVector_0 = v92.rightVector;
    local l_upVector_0 = v92.upVector;
    local v97 = -v92.lookVector;
    local l_ViewportSize_2 = l_CurrentCamera_0.ViewportSize;
    local v99 = 1e999;
    local v100 = 1e999;
    for v101 = 0, 1 do
        local v102 = l_rightVector_0 * ((v101 - 0.5) * v17);
        for v103 = 0, 1 do
            local v104 = l_upVector_0 * ((v103 - 0.5) * v18);
            local v105 = l_p_0 + v16 * (v102 + v104);
            local l_Origin_0 = l_CurrentCamera_0:ViewportPointToRay(l_ViewportSize_2.x * v101, l_ViewportSize_2.y * v103).Origin;
            local v107, v108 = v91(v105, v97, v93, l_Origin_0);
            if v108 < v99 then
                v99 = v108;
            end;
            if v107 < v100 then
                v100 = v107;
            end;
        end;
    end;
    debug.profileend();
    return v100, v99;
end;
local function v124(v110, v111, v112) --[[ Line: 347 ]] --[[ Name: testPromotion ]]
    -- upvalues: v50 (copy), l_min_0 (copy), v91 (copy), v47 (copy)
    debug.profilebegin("testPromotion");
    local l_p_1 = v110.p;
    local l_rightVector_1 = v110.rightVector;
    local l_upVector_1 = v110.upVector;
    local v116 = -v110.lookVector;
    debug.profilebegin("extrapolate");
    local l_Magnitude_2 = (v50(l_p_1, v112.posVelocity * 1.25) - l_p_1).Magnitude;
    local l_magnitude_0 = v112.posVelocity.magnitude;
    for v119 = 0, l_min_0(1.25, v112.rotVelocity.magnitude + l_Magnitude_2 / l_magnitude_0), 0.0625 do
        local v120 = v112.extrapolate(v119);
        if v111 <= v91(v120.p, -v120.lookVector, v111) then
            return false;
        end;
    end;
    debug.profileend();
    debug.profilebegin("testOffsets");
    for _, v122 in ipairs(v47) do
        local v123 = v50(l_p_1, l_rightVector_1 * v122.x + l_upVector_1 * v122.y);
        if v91(v123, (l_p_1 + v116 * v111 - v123).Unit, v111) == 1e999 then
            return false;
        end;
    end;
    debug.profileend();
    debug.profileend();
    return true;
end;
return function(v125, v126, v127) --[[ Line: 396 ]] --[[ Name: Popper ]]
    -- upvalues: v23 (ref), l_ViewportSize_1 (ref), v109 (copy), v124 (copy)
    debug.profilebegin("popper");
    v23 = l_ViewportSize_1 and l_ViewportSize_1:GetRootPart() or l_ViewportSize_1;
    local l_v126_0 = v126;
    local v129, v130 = v109(v125, v126);
    if v130 < l_v126_0 then
        l_v126_0 = v130;
    end;
    if v129 < l_v126_0 and v124(v125, v126, v127) then
        l_v126_0 = v129;
    end;
    v23 = nil;
    debug.profileend();
    return l_v126_0;
end;