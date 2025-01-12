local l_Players_0 = game:GetService("Players");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v2 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements");
local v3 = {
    LIMBS = 2, 
    MOVEMENT = 3, 
    CORNERS = 4, 
    CIRCLE1 = 5, 
    CIRCLE2 = 6, 
    LIMBMOVE = 7, 
    SMART_CIRCLE = 8, 
    CHAR_OUTLINE = 9
};
local v4 = {
    Head = true, 
    ["Left Arm"] = true, 
    ["Right Arm"] = true, 
    ["Left Leg"] = true, 
    ["Right Leg"] = true, 
    LeftLowerArm = true, 
    RightLowerArm = true, 
    LeftUpperLeg = true, 
    RightUpperLeg = true
};
local v5 = {
    Vector3.new(1, 1, -1, 0), 
    Vector3.new(1, -1, -1, 0), 
    Vector3.new(-1, -1, -1, 0), 
    (Vector3.new(-1, 1, -1, 0))
};
local v6 = RaycastParams.new();
v6.FilterType = Enum.RaycastFilterType.Exclude;
local v7 = RaycastParams.new();
v7.FilterType = Enum.RaycastFilterType.Include;
local function v14(v8, ...) --[[ Line: 71 ]] --[[ Name: AssertTypes ]]
    local v9 = {};
    local v10 = "";
    for _, v12 in pairs({
        ...
    }) do
        v9[v12] = true;
        v10 = v10 .. (v10 == "" and "" or " or ") .. v12;
    end;
    local v13 = type(v8);
    assert(v9[v13], v10 .. " type expected, got: " .. v13);
end;
local function _(v15, v16, v17, v18, v19, v20, v21, v22, v23) --[[ Line: 83 ]] --[[ Name: Det3x3 ]]
    return v15 * (v19 * v23 - v20 * v22) - v16 * (v18 * v23 - v20 * v21) + v17 * (v18 * v22 - v19 * v21);
end;
local function v43(v25, v26, v27, v28) --[[ Line: 91 ]] --[[ Name: RayIntersection ]]
    local v29 = v26:Cross(v28);
    local v30 = v27.X - v25.X;
    local v31 = v27.Y - v25.Y;
    local v32 = v27.Z - v25.Z;
    local l_X_0 = v26.X;
    local v34 = -v28.X;
    local l_X_1 = v29.X;
    local l_Y_0 = v26.Y;
    local v37 = -v28.Y;
    local l_Y_1 = v29.Y;
    local l_Z_0 = v26.Z;
    local v40 = -v28.Z;
    local l_Z_1 = v29.Z;
    local v42 = l_X_0 * (v37 * l_Z_1 - l_Y_1 * v40) - v34 * (l_Y_0 * l_Z_1 - l_Y_1 * l_Z_0) + l_X_1 * (l_Y_0 * v40 - v37 * l_Z_0);
    if v42 == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        l_X_1 = -v28.X;
        l_Y_0 = v29.X;
        v37 = -v28.Y;
        l_Y_1 = v29.Y;
        l_Z_0 = -v28.Z;
        v40 = v29.Z;
        l_X_0 = (v30 * (v37 * v40 - l_Y_1 * l_Z_0) - l_X_1 * (v31 * v40 - l_Y_1 * v32) + l_Y_0 * (v31 * l_Z_0 - v37 * v32)) / v42;
        l_Y_0 = v26.X;
        v37 = v29.X;
        l_Y_1 = v26.Y;
        l_Z_0 = v29.Y;
        v40 = v26.Z;
        l_Z_1 = v29.Z;
        v34 = (l_Y_0 * (v31 * l_Z_1 - l_Z_0 * v32) - v30 * (l_Y_1 * l_Z_1 - l_Z_0 * v40) + v37 * (l_Y_1 * v32 - v31 * v40)) / v42;
        l_X_1 = v25 + l_X_0 * v26;
        l_Y_0 = v27 + v34 * v28;
        v37 = l_X_1 + 0.5 * (l_Y_0 - l_X_1);
        if (l_Y_0 - l_X_1).Magnitude < 0.25 then
            return v37;
        else
            return (Vector3.new(0, 0, 0, 0));
        end;
    end;
end;
local l_BaseOcclusion_0 = require(script.Parent:WaitForChild("BaseOcclusion"));
local v45 = setmetatable({}, l_BaseOcclusion_0);
v45.__index = v45;
v45.new = function() --[[ Line: 124 ]] --[[ Name: new ]]
    -- upvalues: l_BaseOcclusion_0 (copy), v45 (copy), v3 (copy)
    local v46 = setmetatable(l_BaseOcclusion_0.new(), v45);
    v46.char = nil;
    v46.humanoidRootPart = nil;
    v46.torsoPart = nil;
    v46.headPart = nil;
    v46.childAddedConn = nil;
    v46.childRemovedConn = nil;
    v46.behaviors = {};
    v46.behaviors[v3.LIMBS] = v46.LimbBehavior;
    v46.behaviors[v3.MOVEMENT] = v46.MoveBehavior;
    v46.behaviors[v3.CORNERS] = v46.CornerBehavior;
    v46.behaviors[v3.CIRCLE1] = v46.CircleBehavior;
    v46.behaviors[v3.CIRCLE2] = v46.CircleBehavior;
    v46.behaviors[v3.LIMBMOVE] = v46.LimbMoveBehavior;
    v46.behaviors[v3.SMART_CIRCLE] = v46.SmartCircleBehavior;
    v46.behaviors[v3.CHAR_OUTLINE] = v46.CharacterOutlineBehavior;
    v46.mode = v3.SMART_CIRCLE;
    v46.behaviorFunction = v46.SmartCircleBehavior;
    v46.savedHits = {};
    v46.trackedLimbs = {};
    v46.camera = game.Workspace.CurrentCamera;
    v46.enabled = false;
    return v46;
end;
v45.Enable = function(v47, v48) --[[ Line: 157 ]] --[[ Name: Enable ]]
    v47.enabled = v48;
    if not v48 then
        v47:Cleanup();
    end;
end;
v45.GetOcclusionMode = function(_) --[[ Line: 165 ]] --[[ Name: GetOcclusionMode ]]
    return Enum.DevCameraOcclusionMode.Invisicam;
end;
v45.LimbBehavior = function(v50, v51) --[[ Line: 170 ]] --[[ Name: LimbBehavior ]]
    for v52, _ in pairs(v50.trackedLimbs) do
        v51[#v51 + 1] = v52.Position;
    end;
end;
v45.MoveBehavior = function(v54, v55) --[[ Line: 176 ]] --[[ Name: MoveBehavior ]]
    for v56 = 1, 3 do
        local l_Position_0 = v54.humanoidRootPart.Position;
        local l_Velocity_0 = v54.humanoidRootPart.Velocity;
        local v59 = Vector3.new(l_Velocity_0.X, 0, l_Velocity_0.Z).Magnitude / 2;
        local v60 = (v56 - 1) * v54.humanoidRootPart.CFrame.lookVector * v59;
        v55[#v55 + 1] = l_Position_0 + v60;
    end;
end;
v45.CornerBehavior = function(v61, v62) --[[ Line: 185 ]] --[[ Name: CornerBehavior ]]
    -- upvalues: v5 (copy)
    local l_CFrame_0 = v61.humanoidRootPart.CFrame;
    local l_Position_1 = l_CFrame_0.Position;
    local v65 = l_CFrame_0 - l_Position_1;
    local v66 = v61.char:GetExtentsSize() / 2;
    v62[#v62 + 1] = l_Position_1;
    for v67 = 1, #v5 do
        v62[#v62 + 1] = l_Position_1 + v65 * (v66 * v5[v67]);
    end;
end;
v45.CircleBehavior = function(v68, v69) --[[ Line: 196 ]] --[[ Name: CircleBehavior ]]
    -- upvalues: v3 (copy)
    local v70 = nil;
    if v68.mode == v3.CIRCLE1 then
        v70 = v68.humanoidRootPart.CFrame;
    else
        local l_CoordinateFrame_0 = v68.camera.CoordinateFrame;
        v70 = l_CoordinateFrame_0 - l_CoordinateFrame_0.Position + v68.humanoidRootPart.Position;
    end;
    v69[#v69 + 1] = v70.Position;
    for v72 = 0, 9 do
        local v73 = 0.6283185307179586 * v72;
        local v74 = 3 * Vector3.new(math.cos(v73), math.sin(v73), 0);
        v69[#v69 + 1] = v70 * v74;
    end;
end;
v45.LimbMoveBehavior = function(v75, v76) --[[ Line: 212 ]] --[[ Name: LimbMoveBehavior ]]
    v75:LimbBehavior(v76);
    v75:MoveBehavior(v76);
end;
v45.CharacterOutlineBehavior = function(v77, v78) --[[ Line: 217 ]] --[[ Name: CharacterOutlineBehavior ]]
    -- upvalues: v2 (copy), v7 (copy)
    local l_unit_0 = v77.torsoPart.CFrame.upVector.unit;
    local l_unit_1 = v77.torsoPart.CFrame.rightVector.unit;
    v78[#v78 + 1] = v77.torsoPart.CFrame.p;
    v78[#v78 + 1] = v77.torsoPart.CFrame.p + l_unit_0;
    v78[#v78 + 1] = v77.torsoPart.CFrame.p - l_unit_0;
    v78[#v78 + 1] = v77.torsoPart.CFrame.p + l_unit_1;
    v78[#v78 + 1] = v77.torsoPart.CFrame.p - l_unit_1;
    if v77.headPart then
        v78[#v78 + 1] = v77.headPart.CFrame.p;
    end;
    local v81 = CFrame.new(Vector3.new(0, 0, 0, 0), (Vector3.new(v77.camera.CoordinateFrame.lookVector.X, 0, v77.camera.CoordinateFrame.lookVector.Z)));
    local v82 = v77.torsoPart and v77.torsoPart.Position or v77.humanoidRootPart.Position;
    local v83 = {
        v77.torsoPart
    };
    if v77.headPart then
        v83[#v83 + 1] = v77.headPart;
    end;
    for v84 = 1, 24 do
        local v85 = 6.283185307179586 * v84 / 24;
        local v86 = v81 * (3 * Vector3.new(math.cos(v85), math.sin(v85), 0));
        v86 = Vector3.new(v86.X, math.max(v86.Y, -2.25), v86.Z);
        if v2 then
            v7.FilterDescendantsInstances = v83;
            local v87 = game.Workspace:Raycast(v82 + v86, -3 * v86, v7);
            if v87 then
                local l_Position_2 = v87.Position;
                v78[#v78 + 1] = l_Position_2 + 0.2 * (v82 - l_Position_2).unit;
            end;
        else
            local v89 = Ray.new(v82 + v86, -3 * v86);
            local l_PartOnRayWithWhitelist_0, v91 = game.Workspace:FindPartOnRayWithWhitelist(v89, v83, false);
            if l_PartOnRayWithWhitelist_0 then
                v78[#v78 + 1] = v91 + 0.2 * (v82 - v91).unit;
            end;
        end;
    end;
end;
v45.SmartCircleBehavior = function(v92, v93) --[[ Line: 268 ]] --[[ Name: SmartCircleBehavior ]]
    -- upvalues: v2 (copy), v6 (copy), v43 (copy)
    local l_unit_2 = v92.torsoPart.CFrame.upVector.unit;
    local l_unit_3 = v92.torsoPart.CFrame.rightVector.unit;
    v93[#v93 + 1] = v92.torsoPart.CFrame.p;
    v93[#v93 + 1] = v92.torsoPart.CFrame.p + l_unit_2;
    v93[#v93 + 1] = v92.torsoPart.CFrame.p - l_unit_2;
    v93[#v93 + 1] = v92.torsoPart.CFrame.p + l_unit_3;
    v93[#v93 + 1] = v92.torsoPart.CFrame.p - l_unit_3;
    if v92.headPart then
        v93[#v93 + 1] = v92.headPart.CFrame.p;
    end;
    local v96 = v92.camera.CFrame - v92.camera.CFrame.p;
    local v97 = Vector3.new(0, 0.5, 0, 0) + (v92.torsoPart and v92.torsoPart.Position or v92.humanoidRootPart.Position);
    for v98 = 1, 24 do
        local v99 = 0.2617993877991494 * v98 - 1.5707963267948966;
        local v100 = v97 + v96 * (2.5 * Vector3.new(math.cos(v99), math.sin(v99), 0));
        local v101 = v100 - v92.camera.CFrame.p;
        if v2 then
            v6.FilterDescendantsInstances = {
                v92.char
            };
            local v102 = game.Workspace:Raycast(v97, v100 - v97, v6);
            local l_v100_0 = v100;
            if v102 then
                local l_Position_3 = v102.Position;
                local l_Normal_0 = v102.Normal;
                local v106 = l_Position_3 + 0.1 * l_Normal_0.unit;
                local v107 = v106 - v97;
                local l_unit_4 = v107:Cross(v101).unit:Cross(l_Normal_0).unit;
                local l_unit_5 = (v106 - v92.camera.CFrame.p).unit;
                if v107.unit:Dot(-l_unit_4) < v107.unit:Dot(l_unit_5) then
                    l_v100_0 = v43(v106, l_unit_4, v100, v101);
                    if l_v100_0.Magnitude > 0 then
                        v102 = game.Workspace:Raycast(v106, l_v100_0 - v106, v6);
                        if v102 then
                            l_v100_0 = v102.Position + 0.1 * v102.Normal.Unit;
                        end;
                    else
                        l_v100_0 = v106;
                    end;
                else
                    l_v100_0 = v106;
                end;
                v102 = game.Workspace:Raycast(v97, l_v100_0 - v97, v6);
                if v102 then
                    l_v100_0 = v102.Position - 0.1 * (l_v100_0 - v97).unit;
                end;
            end;
            v93[#v93 + 1] = l_v100_0;
        else
            local v110 = Ray.new(v97, v100 - v97);
            local l_PartOnRayWithIgnoreList_0, v112, v113 = game.Workspace:FindPartOnRayWithIgnoreList(v110, {
                v92.char
            }, false, false);
            local l_v100_1 = v100;
            if l_PartOnRayWithIgnoreList_0 then
                local v115 = v112 + 0.1 * v113.unit;
                local v116 = v115 - v97;
                local l_unit_6 = v116:Cross(v101).unit:Cross(v113).unit;
                local l_unit_7 = (v115 - v92.camera.CFrame.p).unit;
                if v116.unit:Dot(-l_unit_6) < v116.unit:Dot(l_unit_7) then
                    l_v100_1 = v43(v115, l_unit_6, v100, v101);
                    if l_v100_1.Magnitude > 0 then
                        local v119 = Ray.new(v115, l_v100_1 - v115);
                        local l_PartOnRayWithIgnoreList_1, v121, v122 = game.Workspace:FindPartOnRayWithIgnoreList(v119, {
                            v92.char
                        }, false, false);
                        if l_PartOnRayWithIgnoreList_1 then
                            l_v100_1 = v121 + 0.1 * v122.unit;
                        end;
                    else
                        l_v100_1 = v115;
                    end;
                else
                    l_v100_1 = v115;
                end;
                local v123 = Ray.new(v97, l_v100_1 - v97);
                local l_PartOnRayWithIgnoreList_2, v125, _ = game.Workspace:FindPartOnRayWithIgnoreList(v123, {
                    v92.char
                }, false, false);
                if l_PartOnRayWithIgnoreList_2 then
                    l_v100_1 = v125 - 0.1 * (l_v100_1 - v97).unit;
                end;
            end;
            v93[#v93 + 1] = l_v100_1;
        end;
    end;
end;
v45.CheckTorsoReference = function(v127) --[[ Line: 403 ]] --[[ Name: CheckTorsoReference ]]
    if v127.char then
        v127.torsoPart = v127.char:FindFirstChild("Torso");
        if not v127.torsoPart then
            v127.torsoPart = v127.char:FindFirstChild("UpperTorso");
            if not v127.torsoPart then
                v127.torsoPart = v127.char:FindFirstChild("HumanoidRootPart");
            end;
        end;
        v127.headPart = v127.char:FindFirstChild("Head");
    end;
end;
v45.CharacterAdded = function(v128, v129, v130) --[[ Line: 417 ]] --[[ Name: CharacterAdded ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    if v130 ~= l_Players_0.LocalPlayer then
        return;
    else
        if v128.childAddedConn then
            v128.childAddedConn:Disconnect();
            v128.childAddedConn = nil;
        end;
        if v128.childRemovedConn then
            v128.childRemovedConn:Disconnect();
            v128.childRemovedConn = nil;
        end;
        v128.char = v129;
        v128.trackedLimbs = {};
        local function v132(v131) --[[ Line: 433 ]] --[[ Name: childAdded ]]
            -- upvalues: v4 (ref), v128 (copy)
            if v131:IsA("BasePart") then
                if v4[v131.Name] then
                    v128.trackedLimbs[v131] = true;
                end;
                if v131.Name == "Torso" or v131.Name == "UpperTorso" then
                    v128.torsoPart = v131;
                end;
                if v131.Name == "Head" then
                    v128.headPart = v131;
                end;
            end;
        end;
        local function v134(v133) --[[ Line: 449 ]] --[[ Name: childRemoved ]]
            -- upvalues: v128 (copy)
            v128.trackedLimbs[v133] = nil;
            v128:CheckTorsoReference();
        end;
        v128.childAddedConn = v129.ChildAdded:Connect(v132);
        v128.childRemovedConn = v129.ChildRemoved:Connect(v134);
        for _, v136 in pairs(v128.char:GetChildren()) do
            if v136:IsA("BasePart") then
                if v4[v136.Name] then
                    v128.trackedLimbs[v136] = true;
                end;
                if v136.Name == "Torso" or v136.Name == "UpperTorso" then
                    v128.torsoPart = v136;
                end;
                if v136.Name == "Head" then
                    v128.headPart = v136;
                end;
            end;
        end;
        return;
    end;
end;
v45.SetMode = function(v137, v138) --[[ Line: 463 ]] --[[ Name: SetMode ]]
    -- upvalues: v14 (copy), v3 (copy)
    v14(v138, "number");
    for _, v140 in pairs(v3) do
        if v140 == v138 then
            v137.mode = v138;
            v137.behaviorFunction = v137.behaviors[v137.mode];
            return;
        end;
    end;
    error("Invalid mode number");
end;
v45.GetObscuredParts = function(v141) --[[ Line: 475 ]] --[[ Name: GetObscuredParts ]]
    return v141.savedHits;
end;
v45.Cleanup = function(v142) --[[ Line: 480 ]] --[[ Name: Cleanup ]]
    for v143, v144 in pairs(v142.savedHits) do
        v143.LocalTransparencyModifier = v144;
    end;
end;
v45.Update = function(v145, _, v147, v148) --[[ Line: 486 ]] --[[ Name: Update ]]
    if not v145.enabled or not v145.char then
        return v147, v148;
    else
        v145.camera = game.Workspace.CurrentCamera;
        if not v145.humanoidRootPart then
            local l_Humanoid_0 = v145.char:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_0 and l_Humanoid_0.RootPart then
                v145.humanoidRootPart = l_Humanoid_0.RootPart;
            else
                v145.humanoidRootPart = v145.char:FindFirstChild("HumanoidRootPart");
                if not v145.humanoidRootPart then
                    return v147, v148;
                end;
            end;
            local v150 = nil;
            do
                local l_v150_0 = v150;
                l_v150_0 = v145.humanoidRootPart.AncestryChanged:Connect(function(v152, v153) --[[ Line: 511 ]]
                    -- upvalues: v145 (copy), l_v150_0 (ref)
                    if v152 == v145.humanoidRootPart and not v153 then
                        v145.humanoidRootPart = nil;
                        if l_v150_0 and l_v150_0.Connected then
                            l_v150_0:Disconnect();
                            l_v150_0 = nil;
                        end;
                    end;
                end);
            end;
        end;
        if not v145.torsoPart then
            v145:CheckTorsoReference();
            if not v145.torsoPart then
                return v147, v148;
            end;
        end;
        local v154 = {};
        v145:behaviorFunction(v154);
        local v155 = {};
        local v156 = {
            v145.char
        };
        local function _(v157) --[[ Line: 537 ]] --[[ Name: add ]]
            -- upvalues: v155 (copy), v145 (copy)
            v155[v157] = true;
            if not v145.savedHits[v157] then
                v145.savedHits[v157] = v157.LocalTransparencyModifier;
            end;
        end;
        local v159 = nil;
        local v160 = 0;
        local v161 = {};
        local v162 = 0.75;
        local v163 = 0.75;
        local v164 = v145.headPart and v145.headPart.CFrame.p or v154[1];
        local v165 = v145.torsoPart and v145.torsoPart.CFrame.p or v154[2];
        v159 = v145.camera:GetPartsObscuringTarget({
            v164, 
            v165
        }, v156);
        for v166 = 1, #v159 do
            local v167 = v159[v166];
            v160 = v160 + 1;
            v161[v167] = true;
            for _, v169 in pairs(v167:GetChildren()) do
                if v169:IsA("Decal") or v169:IsA("Texture") then
                    v160 = v160 + 1;
                    break;
                end;
            end;
        end;
        if v160 > 0 then
            v162 = math.pow(0.375 + 0.375 / v160, 1 / v160);
            v163 = math.pow(0.25 + 0.25 / v160, 1 / v160);
        end;
        v159 = v145.camera:GetPartsObscuringTarget(v154, v156);
        v164 = {};
        for v170 = 1, #v159 do
            local v171 = v159[v170];
            v164[v171] = v161[v171] and v162 or v163;
            if v171.Transparency < v164[v171] then
                v155[v171] = true;
                if not v145.savedHits[v171] then
                    v145.savedHits[v171] = v171.LocalTransparencyModifier;
                end;
            end;
            for _, v173 in pairs(v171:GetChildren()) do
                if (v173:IsA("Decal") or v173:IsA("Texture")) and v173.Transparency < v164[v171] then
                    v164[v173] = v164[v171];
                    v155[v173] = true;
                    if not v145.savedHits[v173] then
                        v145.savedHits[v173] = v173.LocalTransparencyModifier;
                    end;
                end;
            end;
        end;
        for v174, v175 in pairs(v145.savedHits) do
            if v155[v174] then
                v174.LocalTransparencyModifier = v174.Transparency < 1 and (v164[v174] - v174.Transparency) / (1 - v174.Transparency) or 0;
            else
                v174.LocalTransparencyModifier = v175;
                v145.savedHits[v174] = nil;
            end;
        end;
        return v147, v148;
    end;
end;
return v45;