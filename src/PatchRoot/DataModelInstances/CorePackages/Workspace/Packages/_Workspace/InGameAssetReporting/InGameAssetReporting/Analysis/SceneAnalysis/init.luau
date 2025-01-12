local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.Analysis.Types);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntIGARRaycastTargetCount);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntIGARSubtreeDivergenceThresholdPerMille);
local v5 = require(l_script_FirstAncestor_0.Analysis.extractAssetIdsFromInstance);
local v6 = Random.new();
getRandomSampleUniformDisk = function(v7, v8, v9) --[[ Line: 69 ]] --[[ Name: getRandomSampleUniformDisk ]]
    -- upvalues: v6 (ref)
    local v10 = nil;
    local v11 = nil;
    local v12 = 0;
    while true do
        local v13 = v6:NextNumber() * 2 * 3.141592653589793;
        local v14 = math.sqrt((v6:NextNumber())) * v8;
        local v15 = math.cos(v13) * v14;
        local v16 = math.sin(v13) * v14;
        v10 = v7.X + v15;
        v11 = v7.Y + v16;
        v12 = v12 + 1;
        if v12 > 6 then
            return v7;
        elseif v10 >= 0 and v10 <= v9.X and v11 >= 0 and v11 <= v9.Y then
            return Vector2.new(v10, v11);
        end;
    end;
end;
interpretAnnotation = function(v17, v18, v19) --[[ Line: 88 ]] --[[ Name: interpretAnnotation ]]
    -- upvalues: v3 (copy), l_Players_0 (copy)
    local v20 = false;
    local v21 = {
        hitCountMap = {}, 
        stats = {
            targetCount = v3(), 
            completedCount = 0, 
            hitCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0
        }, 
        highlights = {}, 
        topLevelObjects = {}, 
        errorReason = nil, 
        cancel = function() --[[ Line: 109 ]] --[[ Name: cancel ]]
            -- upvalues: v20 (ref)
            v20 = true;
        end
    };
    v21.raycastComputation = coroutine.create(function() --[[ Line: 115 ]]
        -- upvalues: v19 (copy), v21 (copy)
        v19(v21);
    end);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 == nil then
        v21.errorReason = "No camera";
        return v21;
    else
        local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
        if v17.X < 0 or v17.X > l_ViewportSize_0.X or v17.Y < 0 or v17.Y > l_ViewportSize_0.Y then
            v21.errorReason = "Coordinates out of bounds";
            return v21;
        elseif v18 <= 0 or math.max(l_ViewportSize_0.X, l_ViewportSize_0.Y) < v18 then
            v21.errorReason = "Invalid radius";
            return v21;
        else
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 == nil then
                v21.errorReason = "No local player";
                return v21;
            else
                local v25 = {
                    l_LocalPlayer_0.Character
                };
                v21.raycastComputation = coroutine.create(function() --[[ Line: 146 ]]
                    -- upvalues: v25 (copy), v21 (copy), v20 (ref), v17 (copy), v18 (copy), l_ViewportSize_0 (copy), l_CurrentCamera_0 (copy), v19 (copy)
                    local v26 = RaycastParams.new();
                    v26.FilterType = Enum.RaycastFilterType.Exclude;
                    v26.FilterDescendantsInstances = v25;
                    v26.IgnoreWater = true;
                    local v27 = os.clock();
                    local v28 = os.clock();
                    for _ = 1, v21.stats.targetCount do
                        if not v20 then
                            if v28 + 0.011111111111111112 < os.clock() then
                                local l_stats_0 = v21.stats;
                                l_stats_0.computeTime = l_stats_0.computeTime + (os.clock() - v28);
                                task.wait();
                                v28 = os.clock();
                                l_stats_0 = v21.stats;
                                l_stats_0.resumptionCount = l_stats_0.resumptionCount + 1;
                                if v20 then
                                    break;
                                end;
                            end;
                            local v31 = getRandomSampleUniformDisk(v17, v18, l_ViewportSize_0);
                            local v32 = l_CurrentCamera_0:ViewportPointToRay(v31.X, v31.Y);
                            local v33 = nil;
                            for _ = 1, 5 do
                                v33 = workspace:Raycast(v32.Origin, v32.Direction * 5000, v26);
                                if v33 ~= nil then
                                    local l_Instance_0 = v33.Instance;
                                    if (1 - l_Instance_0.Transparency) * (1 - l_Instance_0.LocalTransparencyModifier) <= 0.05 then
                                        table.insert(v25, l_Instance_0);
                                        v26.FilterDescendantsInstances = v25;
                                        v33 = nil;
                                    else
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            end;
                            if v33 then
                                local l_Instance_1 = v33.Instance;
                                if l_Instance_1 ~= nil then
                                    local l_stats_1 = v21.stats;
                                    l_stats_1.hitCount = l_stats_1.hitCount + 1;
                                end;
                                local v38 = nil;
                                while l_Instance_1 ~= nil and (l_Instance_1:IsA("PVInstance") or l_Instance_1:IsA("Accessory")) and l_Instance_1 ~= workspace do
                                    if not v21.hitCountMap[l_Instance_1] then
                                        v21.hitCountMap[l_Instance_1] = {
                                            raycastHits = 0, 
                                            children = {}
                                        };
                                    end;
                                    local v39 = v21.hitCountMap[l_Instance_1];
                                    v39.raycastHits = v39.raycastHits + 1;
                                    if v38 then
                                        v21.hitCountMap[l_Instance_1].children[v38] = true;
                                    end;
                                    v38 = l_Instance_1;
                                    l_Instance_1 = l_Instance_1.Parent;
                                end;
                                if v38 then
                                    v21.topLevelObjects[v38] = (v21.topLevelObjects[v38] or 0) + 1;
                                end;
                            end;
                            local l_stats_2 = v21.stats;
                            l_stats_2.completedCount = l_stats_2.completedCount + 1;
                        else
                            break;
                        end;
                    end;
                    v21.stats.wallTime = os.clock() - v27;
                    local l_stats_3 = v21.stats;
                    l_stats_3.computeTime = l_stats_3.computeTime + (os.clock() - v28);
                    v19(v21);
                end);
                return v21;
            end;
        end;
    end;
end;
createPlayerCharacterReferenceToPlayerMap = function(v42) --[[ Line: 237 ]] --[[ Name: createPlayerCharacterReferenceToPlayerMap ]]
    local v43 = {};
    for _, v45 in ipairs(v42) do
        local l_Character_0 = v45.Character;
        if l_Character_0 then
            v43[l_Character_0] = v45;
        end;
    end;
    return v43;
end;
descendingOrderBySecondElement = function(v47, v48) --[[ Line: 248 ]] --[[ Name: descendingOrderBySecondElement ]]
    return v47[2] > v48[2];
end;
createTraversalTaskList = function(v49, v50) --[[ Line: 255 ]] --[[ Name: createTraversalTaskList ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    local v51 = {};
    local v52 = {};
    local v53 = createPlayerCharacterReferenceToPlayerMap(l_Players_0:GetPlayers());
    local v54 = {};
    for v55, v56 in pairs(v50) do
        table.insert(v54, {
            v55, 
            v56
        });
    end;
    table.sort(v54, descendingOrderBySecondElement);
    local v57 = v4() / 1000;
    for _, v59 in ipairs(v54) do
        local v60 = v59[1];
        local v61 = v59[2];
        if v53[v60] ~= nil then
            table.insert(v52, {
                player = v53[v60], 
                count = v61
            });
        else
            local v62 = 0;
            local l_v60_0 = v60;
            while v49[l_v60_0] do
                local v64 = v49[l_v60_0];
                local l_raycastHits_0 = v64.raycastHits;
                local l_children_0 = v64.children;
                local v67 = 0;
                for v68, _ in pairs(l_children_0) do
                    if v49[v68] then
                        v67 = v67 + 1;
                    end;
                end;
                if v67 ~= 0 then
                    local v70 = 0;
                    for v71, _ in pairs(l_children_0) do
                        if v49[v71] then
                            v70 = math.max(v70, v49[v71].raycastHits);
                        end;
                    end;
                    if v70 / l_raycastHits_0 >= v57 then
                        local v73 = nil;
                        local v74 = 0;
                        for v75, _ in pairs(l_children_0) do
                            if v49[v75] and v74 < v49[v75].raycastHits then
                                v73 = v75;
                                v74 = v49[v75].raycastHits;
                            end;
                        end;
                        l_v60_0 = v73;
                        v62 = v62 + 1;
                    else
                        break;
                    end;
                else
                    break;
                end;
            end;
            table.insert(v51, {
                instance = l_v60_0, 
                count = v61
            });
            if l_v60_0 ~= v60 then
                table.insert(v51, {
                    instance = v60, 
                    count = v61
                });
            end;
        end;
    end;
    return v51, v52;
end;
mutateMergeExtractedAssets = function(v77, v78, v79) --[[ Line: 343 ]] --[[ Name: mutateMergeExtractedAssets ]]
    for _, v81 in ipairs(v79.Image) do
        if not v77[v81] then
            v77[v81] = true;
            table.insert(v78.Image, v81);
        end;
    end;
    for _, v83 in ipairs(v79.Mesh) do
        if not v77[v83] then
            v77[v83] = true;
            table.insert(v78.Mesh, v83);
        end;
    end;
    for _, v85 in ipairs(v79.Model) do
        if not v77[v85] then
            v77[v85] = true;
            table.insert(v78.Model, v85);
        end;
    end;
    for _, v87 in ipairs(v79.Package) do
        if not v77[v87.id] then
            v77[v87.id] = true;
            table.insert(v78.Package, v87);
        end;
    end;
end;
interpretInstanceListForGUIObjects = function(v88) --[[ Line: 378 ]] --[[ Name: interpretInstanceListForGUIObjects ]]
    local v89 = {
        hitCountMap = {}, 
        stats = {
            targetCount = 0, 
            completedCount = 0, 
            hitCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0
        }, 
        highlights = {}, 
        topLevelObjects = {}, 
        errorReason = nil, 
        cancel = function() --[[ Line: 392 ]] --[[ Name: cancel ]]

        end
    };
    for _, v91 in ipairs(v88) do
        local v92 = nil;
        while v91 ~= nil and v91:IsA("GuiObject") do
            if not v89.hitCountMap[v91] then
                v89.hitCountMap[v91] = {
                    raycastHits = 0, 
                    children = {}
                };
            end;
            local v93 = v89.hitCountMap[v91];
            v93.raycastHits = v93.raycastHits + 1;
            if v92 then
                v89.hitCountMap[v91].children[v92] = true;
            end;
            v92 = v91;
            v91 = v91.Parent;
        end;
        if v92 then
            v89.topLevelObjects[v92] = (v89.topLevelObjects[v92] or 0) + 1;
        end;
    end;
    return v89;
end;
extractItemsFromInterpretations = function(v94, v95) --[[ Line: 421 ]] --[[ Name: extractItemsFromInterpretations ]]
    -- upvalues: v5 (copy)
    local v96 = false;
    local v97 = {
        extractedAssets = {
            Package = {}, 
            Model = {}, 
            Image = {}, 
            Mesh = {}
        }, 
        extractedPlayers = {}, 
        cancel = function() --[[ Line: 435 ]] --[[ Name: cancel ]]
            -- upvalues: v96 (ref)
            v96 = true;
        end, 
        stats = {
            hitCountMapSize = 0, 
            topLevelObjectsSize = 0, 
            instancesTraversed = 0, 
            traversalTaskListSize = 0, 
            traversalTasksCompleted = 0, 
            playersCount = 0, 
            resumptionCount = 0, 
            wallTime = 0, 
            computeTime = 0, 
            raycastTargetCount = 0, 
            raycastCompletedCount = 0, 
            raycastResumptionCount = 0, 
            raycastComputeTime = 0
        }
    };
    v97.computation = coroutine.create(function() --[[ Line: 454 ]]
        -- upvalues: v95 (copy), v97 (copy)
        v95(v97);
    end);
    for _, v99 in ipairs(v94) do
        v99.cancel();
        local l_stats_4 = v97.stats;
        l_stats_4.raycastTargetCount = l_stats_4.raycastTargetCount + v99.stats.targetCount;
        l_stats_4 = v97.stats;
        l_stats_4.raycastCompletedCount = l_stats_4.raycastCompletedCount + v99.stats.completedCount;
        l_stats_4 = v97.stats;
        l_stats_4.raycastResumptionCount = l_stats_4.raycastResumptionCount + v99.stats.resumptionCount;
        l_stats_4 = v97.stats;
        l_stats_4.raycastComputeTime = l_stats_4.raycastComputeTime + v99.stats.computeTime;
    end;
    local v101 = os.clock();
    local v102 = {};
    local v103 = {};
    for _, v105 in ipairs(v94) do
        for v106, v107 in pairs(v105.hitCountMap) do
            if not v102[v106] then
                v102[v106] = {
                    raycastHits = 0, 
                    children = {}
                };
                local l_stats_5 = v97.stats;
                l_stats_5.hitCountMapSize = l_stats_5.hitCountMapSize + 1;
            end;
            local v109 = v102[v106];
            v109.raycastHits = v109.raycastHits + v107.raycastHits;
            for v110, _ in pairs(v107.children) do
                v102[v106].children[v110] = true;
            end;
        end;
        for v112, v113 in pairs(v105.topLevelObjects) do
            local v114 = v103[v112];
            if not v114 then
                local l_stats_6 = v97.stats;
                l_stats_6.topLevelObjectsSize = l_stats_6.topLevelObjectsSize + 1;
            end;
            v103[v112] = (v114 or 0) + v113;
        end;
    end;
    local v116, v117 = createTraversalTaskList(v102, v103);
    v97.extractedPlayers = v117;
    v97.stats.playersCount = #v117;
    v97.stats.wallTime = os.clock() - v101;
    v97.stats.traversalTaskListSize = #v116;
    v97.computation = coroutine.create(function() --[[ Line: 502 ]]
        -- upvalues: v97 (copy), v116 (copy), v96 (ref), v95 (copy), v102 (copy), v5 (ref)
        local v118 = false;
        local v119 = os.clock();
        local v120 = os.clock();
        local function _() --[[ Line: 505 ]]
            -- upvalues: v120 (ref)
            return v120 + 0.011111111111111112 < os.clock();
        end;
        local function _() --[[ Line: 508 ]]
            -- upvalues: v97 (ref), v120 (ref)
            local l_stats_7 = v97.stats;
            l_stats_7.computeTime = l_stats_7.computeTime + (os.clock() - v120);
            task.wait();
            v120 = os.clock();
            l_stats_7 = v97.stats;
            l_stats_7.resumptionCount = l_stats_7.resumptionCount + 1;
        end;
        local v124 = {};
        local v125 = {};
        for _, v127 in ipairs(v116) do
            local v128 = {};
            local v129 = {};
            table.insert(v128, v127.instance);
            repeat
                if #v128 > 0 then
                    if v120 + 0.011111111111111112 < os.clock() then
                        local l_stats_8 = v97.stats;
                        l_stats_8.computeTime = l_stats_8.computeTime + (os.clock() - v120);
                        task.wait();
                        v120 = os.clock();
                        l_stats_8 = v97.stats;
                        l_stats_8.resumptionCount = l_stats_8.resumptionCount + 1;
                        if v96 then
                            l_stats_8 = v97.stats;
                            l_stats_8.wallTime = l_stats_8.wallTime + (os.clock() - v119);
                            v95(v97);
                            return;
                        end;
                    end;
                    local v131 = table.remove(v128);
                    if not v125[v131] then
                        table.insert(v129, v131);
                        local l_v131_Children_0 = v131:GetChildren();
                        local v133 = {};
                        for _, v135 in pairs(l_v131_Children_0) do
                            table.insert(v133, {
                                v135, 
                                if v102[v135] then v102[v135].raycastHits else 0
                            });
                        end;
                        table.sort(v133, descendingOrderBySecondElement);
                        for _, v137 in ipairs(v133) do
                            table.insert(v128, v137[1]);
                        end;
                        v125[v131] = true;
                    end;
                else
                    repeat
                        if #v129 > 0 then
                            if v120 + 0.011111111111111112 < os.clock() then
                                local l_stats_9 = v97.stats;
                                l_stats_9.computeTime = l_stats_9.computeTime + (os.clock() - v120);
                                task.wait();
                                v120 = os.clock();
                                l_stats_9 = v97.stats;
                                l_stats_9.resumptionCount = l_stats_9.resumptionCount + 1;
                                if v96 then
                                    l_stats_9 = v97.stats;
                                    l_stats_9.wallTime = l_stats_9.wallTime + (os.clock() - v119);
                                    v95(v97);
                                    return;
                                end;
                            end;
                            local v139 = table.remove(v129);
                            local v140 = v5(v139);
                            if v140 then
                                mutateMergeExtractedAssets(v124, v97.extractedAssets, v140);
                            end;
                            local l_stats_10 = v97.stats;
                            l_stats_10.instancesTraversed = l_stats_10.instancesTraversed + 1;
                        else
                            local l_stats_11 = v97.stats;
                            l_stats_11.traversalTasksCompleted = l_stats_11.traversalTasksCompleted + 1;
                            v118 = true;
                        end;
                    until v118;
                end;
            until v118;
            v118 = false;
        end;
        local l_stats_12 = v97.stats;
        l_stats_12.wallTime = l_stats_12.wallTime + (os.clock() - v119);
        l_stats_12 = v97.stats;
        l_stats_12.computeTime = l_stats_12.computeTime + (os.clock() - v120);
        v95(v97);
    end);
    return v97;
end;
return {
    interpretAnnotation = interpretAnnotation, 
    extractItemsFromInterpretations = extractItemsFromInterpretations, 
    interpretInstanceListForGUIObjects = interpretInstanceListForGUIObjects, 
    __setRandomGenerator = function(v144) --[[ Line: 600 ]] --[[ Name: __setRandomGenerator ]]
        -- upvalues: v6 (ref)
        v6 = v144;
    end
};