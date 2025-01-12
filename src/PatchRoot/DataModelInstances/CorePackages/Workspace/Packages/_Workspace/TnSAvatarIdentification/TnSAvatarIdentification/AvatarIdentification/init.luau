local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAvatarIdentification");
local v1 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportAnythingFixConvexHullCalculation);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportAnythingAvatarIdentificationEdgeCaseFix);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationCloseDiscardDistanceHundredths);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationDiscardFractionSkipThresholdPercent);
local v5 = require(l_script_FirstAncestor_0.Flags.GetFIntReportAnythingAvatarIdentificationOffScreenDiscardDistancePercent);
local l_Players_0 = game:GetService("Players");
local v7 = v3() / 100;
local v8 = v5() / 100;
local v9 = v4() / 100;
local v10 = {};
shouldIgnoreLocalCharacter = function(v11) --[[ Line: 22 ]] --[[ Name: shouldIgnoreLocalCharacter ]]
    local l_Head_0 = v11:FindFirstChild("Head");
    if l_Head_0 and l_Head_0:IsA("BasePart") then
        return l_Head_0.LocalTransparencyModifier >= 0.95;
    else
        return false;
    end;
end;
getLocalCharacterPosition = function(v13) --[[ Line: 30 ]] --[[ Name: getLocalCharacterPosition ]]
    local l_HumanoidRootPart_0 = v13:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return nil;
    else
        return l_HumanoidRootPart_0.Position;
    end;
end;
getBBCorners = function(v15, v16) --[[ Line: 38 ]] --[[ Name: getBBCorners ]]
    local v17 = table.create(8);
    local l_XVector_0 = v15.XVector;
    local l_YVector_0 = v15.YVector;
    local l_ZVector_0 = v15.ZVector;
    local v21 = 1;
    for v22 = -0.5, 0.5 do
        local v23 = l_XVector_0 * v22 * v16.X;
        for v24 = -0.5, 0.5 do
            local v25 = l_YVector_0 * v24 * v16.Y;
            for v26 = -0.5, 0.5 do
                local v27 = l_ZVector_0 * v26 * v16.Z;
                v17[v21] = v15.Position + v23 + v25 + v27;
                v21 = v21 + 1;
            end;
        end;
    end;
    return v17;
end;
local v28 = Vector2.new(0, 0);
local v29 = Vector2.new(1e999, 1e999);
getCoveringPolygon = function(v30, v31, _) --[[ Line: 62 ]] --[[ Name: getCoveringPolygon ]]
    local l_ViewportSize_0 = v31.ViewportSize;
    local v34 = {};
    for _, v36 in ipairs(v30) do
        local l_target_0 = v36.target;
        local l_ExtentsCFrame_0 = l_target_0.ExtentsCFrame;
        local l_ExtentsSize_0 = l_target_0.ExtentsSize;
        for _, v41 in (getBBCorners(l_ExtentsCFrame_0, l_ExtentsSize_0)) do
            table.insert(v34, v41);
        end;
    end;
    local v42 = table.create(#v34);
    for v43, v44 in ipairs(v34) do
        local v45, _ = v31:WorldToViewportPoint(v44);
        v42[v43] = Vector2.new(v45.X, v45.Y) / l_ViewportSize_0;
    end;
    return getConvexHull(v42);
end;
local v47 = v8 + 1;
local v48 = -v8;
local function _(v49) --[[ Line: 94 ]]
    -- upvalues: v47 (copy), v48 (copy)
    local v50 = true;
    if v49.Y <= v47 then
        v50 = true;
        if v49.Y >= v48 then
            v50 = true;
            if v49.X <= v47 then
                v50 = v49.X < v48;
            end;
        end;
    end;
    return v50;
end;
local v52 = {
    total = 0, 
    offScreenDiscardCount = 0, 
    tooCloseDiscardCount = 0, 
    wasSkipped = false
};
getCoveringPolygon2 = function(v53, v54) --[[ Line: 114 ]] --[[ Name: getCoveringPolygon2 ]]
    -- upvalues: v52 (copy), v7 (copy), v47 (copy), v48 (copy), v9 (copy)
    if #v53 == 0 then
        return {}, v52;
    else
        local l_ViewportSize_1 = v54.ViewportSize;
        local v56 = {};
        for _, v58 in ipairs(v53) do
            local l_target_1 = v58.target;
            local l_ExtentsCFrame_1 = l_target_1.ExtentsCFrame;
            local l_ExtentsSize_1 = l_target_1.ExtentsSize;
            for _, v63 in (getBBCorners(l_ExtentsCFrame_1, l_ExtentsSize_1)) do
                table.insert(v56, v63);
            end;
        end;
        local v64 = {};
        local v65 = 0;
        local v66 = 0;
        for _, v68 in ipairs(v56) do
            local v69, _ = v54:WorldToViewportPoint(v68);
            local v71 = Vector2.new(v69.X, v69.Y) / l_ViewportSize_1;
            if v69.Z < v7 then
                v65 = v65 + 1;
            else
                local v72 = true;
                if v71.Y <= v47 then
                    v72 = true;
                    if v71.Y >= v48 then
                        v72 = true;
                        if v71.X <= v47 then
                            v72 = v71.X < v48;
                        end;
                    end;
                end;
                if v72 then
                    v66 = v66 + 1;
                else
                    v64[#v64 + 1] = v71;
                end;
            end;
        end;
        local v73 = {
            total = #v56, 
            offScreenDiscardCount = v66, 
            tooCloseDiscardCount = v65, 
            wasSkipped = false
        };
        if (v65 + v66) / #v56 > v9 then
            v73.wasSkipped = true;
            return {}, v73;
        else
            return getConvexHull(v64), v73;
        end;
    end;
end;
getViewportCorners = function(v74, v75) --[[ Line: 165 ]] --[[ Name: getViewportCorners ]]
    -- upvalues: v29 (copy), v28 (copy), v1 (copy)
    local l_v29_0 = v29;
    local l_v28_0 = v28;
    local l_ViewportSize_2 = v75.ViewportSize;
    local v79 = 0;
    for _, v81 in ipairs(v74) do
        local v82, v83 = v75:WorldToViewportPoint(v81);
        local v84 = Vector2.new(v82.X / l_ViewportSize_2.X, v82.Y / l_ViewportSize_2.Y);
        if not v83 then
            v84 = Vector2.new(math.clamp(v84.X, 0, 1), (math.clamp(v84.Y, 0, 1)));
        end;
        if v1() then
            if v83 then
                v79 = v79 + 1;
            end;
        else
            v79 = v79 + 1;
        end;
        l_v29_0 = l_v29_0:Min(v84);
        l_v28_0 = l_v28_0:Max(v84);
    end;
    if v79 <= 2 then
        return v29, v28;
    else
        return l_v29_0, l_v28_0;
    end;
end;
getDistanceAlongCamLookVector = function(v85, v86) --[[ Line: 198 ]] --[[ Name: getDistanceAlongCamLookVector ]]
    local l_CFrame_0 = v86.CFrame;
    return ((v85.Position - l_CFrame_0.Position):Dot(l_CFrame_0.LookVector));
end;
getVisibleParts = function(v88, v89, v90) --[[ Line: 211 ]] --[[ Name: getVisibleParts ]]
    local l_Position_0 = v88.CFrame.Position;
    local l_Character_0 = v89.Character;
    if not l_Character_0 or not l_Character_0.Parent then
        return 0, {};
    else
        local l_l_Character_0_Children_0 = l_Character_0:GetChildren();
        local v94 = RaycastParams.new();
        v94.FilterType = Enum.RaycastFilterType.Exclude;
        v94.FilterDescendantsInstances = v90;
        v94.IgnoreWater = true;
        local v95 = 0;
        local v96 = {};
        for _, v98 in ipairs(l_l_Character_0_Children_0) do
            if v98:IsA("BasePart") then
                local v99 = v98.CFrame.Position - l_Position_0;
                v95 = v95 + 1;
                local v100 = workspace:Raycast(l_Position_0, v99, v94);
                if v100 and v100.Instance:IsDescendantOf(l_Character_0) then
                    table.insert(v96, {
                        result = v100, 
                        target = v98
                    });
                end;
            end;
        end;
        return v95, v96;
    end;
end;
local function _(v101, v102, v103) --[[ Line: 252 ]] --[[ Name: counterclockwise ]]
    return (v102 - v101):Cross(v103 - v102);
end;
getConvexHull = function(v105) --[[ Line: 256 ]] --[[ Name: getConvexHull ]]
    if #v105 <= 2 then
        return {};
    else
        local v106 = {};
        local v107 = v105[1];
        local v108 = {};
        for v109 = 2, #v105 do
            local v110 = v105[v109];
            if v110.Y < v107.Y or v110.Y == v107.Y and v110.X < v107.X then
                v107 = v110;
            end;
        end;
        table.insert(v106, v107);
        local function _(v111) --[[ Line: 273 ]] --[[ Name: angleFromLowest ]]
            -- upvalues: v107 (ref)
            local v112 = v111 - v107;
            return (math.atan2(v112.Y, v112.X));
        end;
        for _, v115 in ipairs(v105) do
            if v115 ~= v107 then
                local l_X_0 = v115.X;
                local l_Y_0 = v115.Y;
                local v118 = v115 - v107;
                table.insert(v108, (Vector3.new(l_X_0, l_Y_0, (math.atan2(v118.Y, v118.X)))));
            end;
        end;
        local function v121(v119, v120) --[[ Line: 285 ]] --[[ Name: compareByAngle ]]
            -- upvalues: v107 (ref)
            if v119.Z ~= v120.Z then
                return v119.Z < v120.Z;
            else
                return (Vector2.new(v119.X, v119.Y) - v107).Magnitude < (Vector2.new(v120.X, v120.Y) - v107).Magnitude;
            end;
        end;
        table.sort(v108, v121);
        local v122 = {};
        local v123 = v108[1];
        for v124 = 2, #v108 do
            local v125 = v108[v124];
            if v123.Z == v125.Z then
                v123 = v125;
            else
                table.insert(v122, Vector2.new(v123.X, v123.Y));
                v123 = v125;
            end;
        end;
        table.insert(v122, Vector2.new(v123.X, v123.Y));
        if #v122 == 1 then
            return {};
        else
            table.insert(v106, v122[1]);
            table.insert(v106, v122[2]);
            for v126 = 3, #v122 do
                local v127 = v122[v126];
                while #v106 > 1 do
                    local v128 = v106[#v106 - 1];
                    local v129 = v106[#v106];
                    if (v129 - v128):Cross(v127 - v129) <= 0 then
                        table.remove(v106);
                    else
                        break;
                    end;
                end;
                table.insert(v106, v127);
            end;
            return v106;
        end;
    end;
end;
projectVertices = function(v130, v131, v132) --[[ Line: 352 ]] --[[ Name: projectVertices ]]
    local v133 = 1e999;
    local v134 = -1e999;
    for _, v136 in ipairs(v130) do
        local v137 = (v136 * v132):Dot(v131);
        if v137 < v133 then
            v133 = v137;
        end;
        if v134 < v137 then
            v134 = v137;
        end;
    end;
    return v133, v134;
end;
projectCircle = function(v138, v139, v140) --[[ Line: 372 ]] --[[ Name: projectCircle ]]
    local v141 = v140.Unit * v139;
    local v142 = v138 + v141;
    local v143 = v138 - v141;
    local v144 = v142:Dot(v140);
    local v145 = v143:Dot(v140);
    if v145 < v144 then
        local l_v144_0 = v144;
        v144 = v145;
        v145 = l_v144_0;
    end;
    return v144, v145;
end;
getClosestPoint = function(v147, v148, v149) --[[ Line: 391 ]] --[[ Name: getClosestPoint ]]
    local v150 = -1;
    local v151 = 1e999;
    for v152, v153 in ipairs(v148) do
        v153 = v153 * v149;
        local v154 = math.sqrt(math.pow(v153.X - v147.X, 2) + math.pow(v153.Y - v147.Y, 2));
        if v154 < v151 then
            v151 = v154;
            v150 = v152;
        end;
    end;
    return v150;
end;
intersectCirclePolygon = function(v155, v156, v157, v158) --[[ Line: 405 ]] --[[ Name: intersectCirclePolygon ]]
    for v159, _ in ipairs(v157) do
        local v161 = v157[v159] * v158;
        local v162 = v157[v159 % #v157 + 1] * v158 - v161;
        local l_Unit_0 = Vector2.new(v162.Y, -v162.X).Unit;
        local v164, v165 = projectVertices(v157, l_Unit_0, v158);
        local v166, v167 = projectCircle(v155, v156, l_Unit_0);
        if v167 <= v164 or v165 <= v166 then
            return false;
        end;
    end;
    local v168 = getClosestPoint(v155, v157, v158);
    if v168 == -1 then
        return false;
    else
        local l_Unit_1 = (v157[v168] - v155).Unit;
        local v170, v171 = projectVertices(v157, l_Unit_1, v158);
        local v172, v173 = projectCircle(v155, v156, l_Unit_1);
        if v173 <= v170 or v171 <= v172 then
            return false;
        else
            return true;
        end;
    end;
end;
intersectCircleBox = function(v174, v175, v176, v177, _) --[[ Line: 436 ]] --[[ Name: intersectCircleBox ]]
    local l_X_1 = v174.X;
    local l_Y_1 = v174.Y;
    local l_l_X_1_0 = l_X_1;
    local l_l_Y_1_0 = l_Y_1;
    local l_X_2 = v176.X;
    local l_Y_2 = v176.Y;
    local v185 = v177.X - v176.X;
    local v186 = v177.Y - v176.Y;
    if l_X_1 < l_X_2 then
        l_l_X_1_0 = l_X_2;
    elseif l_X_2 + v185 < l_X_1 then
        l_l_X_1_0 = l_X_2 + v185;
    end;
    if l_Y_1 < l_Y_2 then
        l_l_Y_1_0 = l_Y_2;
    elseif l_Y_2 + v186 < l_Y_1 then
        l_l_Y_1_0 = l_Y_2 + v186;
    end;
    local v187 = l_X_1 - l_l_X_1_0;
    local v188 = l_Y_1 - l_l_Y_1_0;
    if math.sqrt(v187 * v187 + v188 * v188) <= v175 then
        return true;
    else
        return false;
    end;
end;
v10.getAvatarsForRegion = function(v189, v190, v191, v192, v193) --[[ Line: 475 ]]
    local v194 = {};
    local v195 = v193 < v192;
    local v196 = if v195 then v192 / v193 else v193 / v192;
    local v197 = nil;
    v197 = if v195 then Vector2.new(v196, 1) else Vector2.new(1, v196);
    for _, v199 in pairs(v189) do
        if intersectCircleBox(v190 * v197, v191 * v196, v199.boundingBox.min * v197, v199.boundingBox.max * v197, v197) and #v199.convexHull >= 3 and intersectCirclePolygon(v190 * v197, v191 * v196, v199.convexHull, v197) then
            v194[v199.player.UserId] = v199.player;
        end;
    end;
    return v194;
end;
v10.getAvatarsForPoint = function(v200, v201) --[[ Line: 522 ]]
    local v202 = {};
    for _, v204 in pairs(v200) do
        local l_boundingBox_0 = v204.boundingBox;
        if v201.X >= l_boundingBox_0.min.X and v201.Y >= l_boundingBox_0.min.Y and v201.X <= l_boundingBox_0.max.X and v201.Y <= l_boundingBox_0.max.Y then
            local l_convexHull_0 = v204.convexHull;
            if #l_convexHull_0 >= 3 then
                local v207 = l_convexHull_0[#l_convexHull_0];
                local v208 = true;
                local v209 = true;
                for _, v211 in ipairs(l_convexHull_0) do
                    local v212 = (v211 - v207):Cross(v201 - v207);
                    v209 = v209 and v212 <= 0;
                    v208 = v208 and v212 >= 0;
                    v207 = v211;
                end;
                if v208 or v209 then
                    v202[v204.player.UserId] = v204.player;
                end;
            end;
        end;
    end;
    return v202;
end;
v10.getVisibleAvatars = function(v213, v214) --[[ Line: 559 ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    local v216 = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    };
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return {}, v216;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return {}, v216;
        else
            local l_Character_1 = l_LocalPlayer_0.Character;
            local v220 = nil;
            local v221 = nil;
            local v222 = {};
            if l_Character_1 then
                v220 = getLocalCharacterPosition(l_Character_1) or l_CurrentCamera_0.CFrame.Position;
                if shouldIgnoreLocalCharacter(l_Character_1) then
                    v222[#v222 + 1] = l_Character_1;
                end;
            else
                v220 = l_CurrentCamera_0.CFrame.Position;
                v221 = false;
            end;
            local v223 = {};
            local v224 = os.clock();
            v216.totalPlayers = #l_l_Players_0_Players_0 - 1;
            local function _() --[[ Line: 597 ]]
                -- upvalues: v216 (copy), v224 (copy)
                v216.duration = os.clock() - v224;
                return v216;
            end;
            local function _() --[[ Line: 601 ]]
                -- upvalues: v214 (copy), v224 (copy)
                return (if v214 then v214 else 0.5) < os.clock() - v224;
            end;
            if v220 then
                table.sort(l_l_Players_0_Players_0, function(v227, v228) --[[ Line: 608 ]]
                    -- upvalues: v220 (ref)
                    return v227:DistanceFromCharacter(v220) < v228:DistanceFromCharacter(v220);
                end);
            end;
            for _, v230 in ipairs(l_l_Players_0_Players_0) do
                if (v230 ~= l_LocalPlayer_0 or v213) and v230.Character then
                    if (v214 or 0.5) < os.clock() - v224 then
                        local l_v223_0 = v223;
                        v216.duration = os.clock() - v224;
                        return l_v223_0, v216;
                    else
                        local l_BoundingBox_0, v233 = v230.Character:GetBoundingBox();
                        local l_Magnitude_0 = (l_BoundingBox_0.Position - v220).Magnitude;
                        if getDistanceAlongCamLookVector(l_BoundingBox_0, l_CurrentCamera_0) < 0 then
                            v216.checkedPlayers = v216.checkedPlayers + 1;
                        else
                            local v235 = getBBCorners(l_BoundingBox_0, v233);
                            local v236, v237 = getViewportCorners(v235, l_CurrentCamera_0);
                            if v237.X == 0 or v237.Y == 0 then
                                v216.checkedPlayers = v216.checkedPlayers + 1;
                            else
                                local v238, v239 = getVisibleParts(l_CurrentCamera_0, v230, v222);
                                if (v214 or 0.5) < os.clock() - v224 then
                                    local l_v223_1 = v223;
                                    v216.duration = os.clock() - v224;
                                    return l_v223_1, v216;
                                else
                                    local v241 = #v239 / v238;
                                    if v2() then
                                        local v242, v243 = getCoveringPolygon2(v239, l_CurrentCamera_0);
                                        v223[v230.UserId] = {
                                            player = v230, 
                                            distance = l_Magnitude_0, 
                                            boundingBox = {
                                                min = v236, 
                                                max = v237
                                            }, 
                                            hitRate = v241, 
                                            convexHull = v242, 
                                            pointProcessingStats = v243
                                        };
                                    else
                                        local v244 = getCoveringPolygon(v239, l_CurrentCamera_0, l_Character_1);
                                        v223[v230.UserId] = {
                                            player = v230, 
                                            distance = l_Magnitude_0, 
                                            boundingBox = {
                                                min = v236, 
                                                max = v237
                                            }, 
                                            hitRate = v241, 
                                            convexHull = v244
                                        };
                                    end;
                                    v216.checkedPlayers = v216.checkedPlayers + 1;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local l_v223_2 = v223;
            v216.duration = os.clock() - v224;
            return l_v223_2, v216;
        end;
    end;
end;
return v10;