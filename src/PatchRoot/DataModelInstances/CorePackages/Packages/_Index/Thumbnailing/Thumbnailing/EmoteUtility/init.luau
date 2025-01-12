local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_InsertService_0 = game:GetService("InsertService");
local v2 = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = {
    FallbackKeyframeSequenceAssetId = v2, 
    debugLoadAssetsFromFiles = false, 
    mapAssetIdToFileName = nil, 
    FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. v2
};
local v5 = {};
local function _() --[[ Line: 68 ]] --[[ Name: clearJointBlacklist ]]
    -- upvalues: v5 (ref)
    v5 = {};
end;
local function _(v7) --[[ Line: 72 ]] --[[ Name: blacklistJoint ]]
    -- upvalues: v5 (ref)
    v5[v7] = true;
end;
local function _(v9) --[[ Line: 76 ]] --[[ Name: jointIsBlacklisted ]]
    -- upvalues: v5 (ref)
    if not v5[v9] then
        return false;
    else
        return true;
    end;
end;
local function _(v11, v12) --[[ Line: 83 ]] --[[ Name: getCameraOffset ]]
    local l_X_0 = v12.X;
    local l_Y_0 = v12.Y;
    local l_Z_0 = v12.Z;
    local v16 = math.sqrt(l_X_0 ^ 2 + l_Y_0 ^ 2 + l_Z_0 ^ 2);
    local v17 = 1 / math.tan(math.rad(v11) / 2);
    return v16 / 2 * v17;
end;
local function _() --[[ Line: 93 ]] --[[ Name: isOnRCC ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 99 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    return l_status_0 and l_result_0;
end;
local _ = function(v22, v23) --[[ Line: 109 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local _ = nil;
    local _ = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 99 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v28 = (l_status_1 and l_result_1 and "RCC" or "Client") .. "_" .. v22 .. "_" .. (v23 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v28);
end;
local function v47(v30) --[[ Line: 132 ]] --[[ Name: getAnimationAndIsIdle ]]
    -- upvalues: v4 (copy), l_RbxAnalyticsService_0 (copy)
    local v31 = true;
    if typeof(v30) ~= "number" then
        v31 = typeof(v30) == "string";
    end;
    assert(v31, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string");
    local v32 = nil;
    v31 = nil;
    local v33 = nil;
    if typeof(v30) == "number" then
        local v34 = nil;
        local v35, v36 = v4.LoadAsset(v30);
        v31 = v35;
        v34 = v36;
        if v31 and v34 then
            v32 = v34:GetChildren()[1];
        end;
        v33 = "EmoteUtility_LoadAsset";
    else
        local v37 = nil;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 151 ]]
            -- upvalues: v30 (copy)
            return game:GetObjects(v30)[1];
        end);
        v31 = l_status_2;
        v37 = l_result_2;
        if v31 and v37 then
            v32 = v37;
        end;
        v33 = "EmoteUtility_GetObjects";
    end;
    local l_v33_0 = v33;
    local l_v31_0 = v31;
    local v42 = nil;
    local v43 = nil;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 99 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v46 = (l_status_3 and l_result_3 and "RCC" or "Client") .. "_" .. l_v33_0 .. "_" .. (l_v31_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v46);
    if not v31 or not v32 then
        l_v33_0 = nil;
        v42, v43 = pcall(function() --[[ Line: 99 ]]
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_v33_0 = v42 and v43 and "RCC" or "Client";
        l_v31_0 = v33 .. "_Failed";
        l_RbxAnalyticsService_0:SendEventDeferred(l_v33_0, "EmoteUtility_getPoseAsset", l_v31_0, {
            animationAssetIdOrUrl = v30
        });
        return nil, nil;
    else
        assert(v32, "animation is non-nil. Silence type checker.");
        l_v33_0 = false;
        if v32.ClassName == "Folder" then
            l_v33_0 = true;
            l_v31_0 = v32:FindFirstChild("Pose", true) or v32:FindFirstChild("pose", true);
            if l_v31_0 == nil then
                l_v31_0 = v32:FindFirstChild("Idle", true) or v32:FindFirstChild("idle", true);
            end;
            v32 = if l_v31_0 then l_v31_0:FindFirstChildWhichIsA("Animation", true) else v32:FindFirstChildWhichIsA("Animation", true);
        end;
        return v32, l_v33_0;
    end;
end;
local function v65(v48) --[[ Line: 204 ]] --[[ Name: getAnimationClipByAssetId ]]
    -- upvalues: v4 (copy), l_AnimationClipProvider_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v49 = nil;
    local v50 = nil;
    if v4.debugLoadAssetsFromFiles then
        local v51 = nil;
        for v52 in string.gmatch(v48, ".*id=([0-9]+)") do
            v51 = v52;
        end;
        assert(v51, "assetId should be non-nil");
        local v53 = tonumber(v51);
        assert(v53, "assetIdAsNumber should be non-nil");
        local v54 = nil;
        local v55, v56 = v4.LoadAsset(v53);
        v49 = v55;
        v54 = v56;
        if v49 and v54 then
            v50 = v54;
        end;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 221 ]]
            -- upvalues: l_AnimationClipProvider_0 (ref), v48 (copy)
            return l_AnimationClipProvider_0:GetAnimationClipAsync(v48);
        end);
        v49 = l_status_4;
        v50 = l_result_4;
    end;
    local l_v49_0 = v49;
    local _ = nil;
    local v61 = nil;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 99 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v64 = (l_status_5 and l_result_5 and "RCC" or "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (l_v49_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v64);
    if not v49 then
        l_v49_0 = nil;
        v61, v64 = pcall(function() --[[ Line: 99 ]]
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_v49_0 = v61 and v64 and "RCC" or "Client";
        l_RbxAnalyticsService_0:SendEventDeferred(l_v49_0, "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", {
            keyframeSequenceId = v48
        });
        return nil;
    else
        return v50;
    end;
end;
local function _(v66, v67, v68) --[[ Line: 248 ]] --[[ Name: trySetProperty ]]
    pcall(function() --[[ Line: 249 ]]
        -- upvalues: v66 (copy), v67 (copy), v68 (copy)
        v66[v67] = v68;
    end);
end;
local function v79(v70, v71, v72) --[[ Line: 257 ]] --[[ Name: applyControlsFolder ]]
    if not v71 then
        return;
    else
        assert(v71, "parentPose is non-nil. Silence type checker.");
        local l_v70_FirstChild_0 = v70:FindFirstChild(v71.Name);
        if not l_v70_FirstChild_0 then
            return;
        else
            local l_l_v70_FirstChild_0_FirstChild_0 = l_v70_FirstChild_0:FindFirstChild(v72.Name);
            if not l_l_v70_FirstChild_0_FirstChild_0 then
                return;
            else
                for _, v76 in v72:GetChildren() do
                    if v76:IsA("NumberPose") then
                        local l_Name_0 = v76.Name;
                        local l_Value_0 = v76.Value;
                        pcall(function() --[[ Line: 249 ]]
                            -- upvalues: l_l_v70_FirstChild_0_FirstChild_0 (copy), l_Name_0 (copy), l_Value_0 (copy)
                            l_l_v70_FirstChild_0_FirstChild_0[l_Name_0] = l_Value_0;
                        end);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v92(v80, v81) --[[ Line: 286 ]] --[[ Name: applyKeyframeInner ]]
    -- upvalues: v4 (copy), v5 (ref), v79 (copy)
    local function v82(v83, v84) --[[ Line: 287 ]] --[[ Name: recurApplyPoses ]]
        -- upvalues: v80 (copy), v4 (ref), v5 (ref), v79 (ref), v82 (copy)
        if v83 and v84:IsA("Pose") then
            local l_v80_FirstChild_0 = v80:FindFirstChild(v83.Name);
            local l_v80_FirstChild_1 = v80:FindFirstChild(v84.Name);
            local v87 = v4.GetMotor6DBetween(l_v80_FirstChild_0, l_v80_FirstChild_1);
            if v87 and not not not v5[v87] then
                assert(v87, "motor6d is non-nil. Silence type checker.");
                v87.Transform = v84.CFrame;
                v5[v87] = true;
            end;
        end;
        if v84:IsA("Folder") then
            v79(v80, v83, v84);
            return;
        else
            for _, v89 in v84:GetChildren() do
                v82(v84, v89);
            end;
            return;
        end;
    end;
    if v81 then
        for _, v91 in pairs(v81:GetPoses()) do
            v82(nil, v91);
        end;
    end;
end;
local function v98(v93, v94) --[[ Line: 322 ]] --[[ Name: getRotatedKeyframe ]]
    if not v94 or v94 == 0 then
        return v93;
    else
        assert(v94, "rotationDegrees is non-nil. Silence type checker.");
        local v95 = v93:Clone();
        local v96 = v95:GetPoses()[1];
        if v96 then
            local v97 = v96:GetSubPoses()[1];
            if v97 then
                v97.CFrame = v97.CFrame * CFrame.Angles(0, math.rad(v94), 0);
            end;
        end;
        return v95;
    end;
end;
local function v101(v99, v100) --[[ Line: 343 ]] --[[ Name: getRotationCFrame ]]
    if v99:IsA("EulerRotationCurve") then
        return v99:GetRotationAtTime(v100);
    elseif v99:IsA("RotationCurve") then
        return v99:GetValueAtTime(v100);
    else
        error("Unsupported rotation type:" .. v99.ClassName);
        return nil;
    end;
end;
local function v102(v103, v104) --[[ Line: 354 ]] --[[ Name: findAttachmentsRecur ]]
    -- upvalues: v102 (copy)
    for _, v106 in pairs(v103:GetChildren()) do
        if v106:IsA("Attachment") then
            v104[v106.Name] = v106;
        elseif not v106:IsA("Tool") and not v106:IsA("Accoutrement") then
            v102(v106, v104);
        end;
    end;
end;
local function _(v107) --[[ Line: 365 ]] --[[ Name: findAttachmentsInTool ]]
    -- upvalues: v102 (copy)
    local v108 = {};
    v102(v107, v108);
    return v108;
end;
local function _(v110) --[[ Line: 371 ]] --[[ Name: findAttachmentsInCharacter ]]
    -- upvalues: v102 (copy)
    local v111 = {};
    v102(v110, v111);
    return v111;
end;
local function _(v113, v114) --[[ Line: 377 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v113.Parent;
    l_Weld_0.Part1 = v114.Parent;
    l_Weld_0.C0 = v113.CFrame;
    l_Weld_0.C1 = v114.CFrame;
    l_Weld_0.Parent = v113.Parent;
    return l_Weld_0;
end;
local function v130(v117, v118, v119) --[[ Line: 387 ]] --[[ Name: attachToolToCharacter ]]
    -- upvalues: v102 (copy)
    local v120 = {};
    v102(v117, v120);
    local l_v120_0 = v120;
    local v122 = {};
    v102(v119, v122);
    v120 = v122;
    v122 = false;
    for _, v124 in pairs(v120) do
        local v125 = l_v120_0[v124.Name];
        if v125 then
            v122 = true;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Part0 = v125.Parent;
            l_Weld_1.Part1 = v124.Parent;
            l_Weld_1.C0 = v125.CFrame;
            l_Weld_1.C1 = v124.CFrame;
            l_Weld_1.Parent = v125.Parent;
        end;
    end;
    if v122 then
        v119.Parent = v117;
        return;
    else
        v119.Parent = nil;
        local l_Handle_0 = v119:FindFirstChild("Handle");
        local l_Grip_0 = v119.Grip;
        if l_Handle_0 and l_Grip_0 then
            local l_RightGripAttachment_0 = l_v120_0.RightGripAttachment;
            if l_RightGripAttachment_0 then
                l_Handle_0.CFrame = l_RightGripAttachment_0.Parent.CFrame * l_RightGripAttachment_0.CFrame * l_Grip_0:Inverse();
            end;
        end;
        v118:EquipTool(v119);
        return;
    end;
end;
local function v138(v131, v132, v133, v134, v135, v136, v137) --[[ Line: 419 ]] --[[ Name: applyR15KeyframeWithTool ]]
    -- upvalues: v92 (copy), v130 (copy)
    if v137 then
        v92(v131, v137);
        v92(v131, v135);
    else
        v92(v131, v136);
        if v134 ~= nil then
            v92(v131, v135);
        end;
    end;
    v130(v131, v132, v133);
end;
local function v157(v139, v140, v141, v142) --[[ Line: 473 ]] --[[ Name: getMainThumbnailKeyframe ]]
    -- upvalues: v47 (copy), v4 (copy), v65 (copy)
    local v143 = nil;
    local v144 = false;
    local v145 = nil;
    if v140 then
        v145 = v140;
        local v146, v147 = v47(v140);
        if v146 == nil then
            return nil, v144, v145;
        else
            assert(v146, "animation is non-nil. Silence type checker.");
            if not v147 then
                v144 = true;
            end;
            local v148 = v4.GetNumberValueWithDefault(v146, "ThumbnailKeyframe", nil);
            local v149 = v4.GetNumberValueWithDefault(v146, "ThumbnailTime", nil);
            local v150 = 0;
            if v141 then
                v150 = v4.GetNumberValueWithDefault(v146, "ThumbnailCharacterRotation", 0);
            end;
            local v151 = v4.GetAnimationClip(v146);
            if v151 then
                if v151:IsA("KeyframeSequence") then
                    return v4.GetThumbnailKeyframe(v148, v151, v150), v144, v145;
                elseif v151:IsA("CurveAnimation") then
                    return v4.GetThumbnailKeyframeFromCurve(v149, v151, v150), v144, v145;
                else
                    error("Unsupported Animation type:" .. v151.ClassName);
                    return v143, v144, v145;
                end;
            end;
        end;
    elseif v142 then
        local l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = v4.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL;
        local l_Animate_0 = v139:FindFirstChild("Animate");
        if l_Animate_0 then
            local v154 = l_Animate_0:FindFirstChild("Pose") or l_Animate_0:FindFirstChild("pose");
            if v154 then
                local l_Animation_0 = v154:FindFirstChildOfClass("Animation");
                if l_Animation_0 then
                    l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = l_Animation_0.AnimationId;
                end;
            end;
        end;
        v145 = l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0;
        local v156 = v65(l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0);
        if v156 then
            if not v156:IsA("KeyframeSequence") then
                return nil, false, v145;
            else
                v143 = v156:GetKeyframes()[1];
            end;
        end;
    end;
    return v143, v144, v145;
end;
local function v165(v158) --[[ Line: 557 ]] --[[ Name: getMoodThumbnailKeyframe ]]
    -- upvalues: v47 (copy), v4 (copy)
    local v159 = nil;
    if not v158 then
        return nil;
    else
        assert(v158, "moodAssetId is non-nil. Silence type checker.");
        local v160, _ = v47(v158);
        if v160 == nil then
            return nil;
        else
            assert(v160, "animation is non-nil. Silence type checker.");
            local v162 = v4.GetNumberValueWithDefault(v160, "ThumbnailKeyframe", nil);
            local v163 = v4.GetNumberValueWithDefault(v160, "ThumbnailTime", nil);
            local v164 = v4.GetAnimationClip(v160);
            if v164 then
                if v164:IsA("KeyframeSequence") then
                    return (v4.GetThumbnailKeyframe(v162, v164, 0));
                elseif v164:IsA("CurveAnimation") then
                    return (v4.GetThumbnailKeyframeFromCurve(v163, v164, 0));
                else
                    error("Unsupported Animation type:" .. v164.ClassName);
                end;
            end;
            return v159;
        end;
    end;
end;
local function v176(v166, v167) --[[ Line: 605 ]] --[[ Name: getToolKeyframes ]]
    -- upvalues: v4 (copy)
    local v168 = nil;
    local v169 = nil;
    local l_Tool_0 = v166:FindFirstChildOfClass("Tool");
    if not l_Tool_0 then
        return nil, nil;
    else
        assert(l_Tool_0, "tool is non-nil. Silence type checker.");
        local v171 = false;
        if not v167 then
            v168 = l_Tool_0:FindFirstChild("ThumbnailPose");
            if v168 and v168:IsA("Keyframe") then
                v171 = true;
            end;
        end;
        if not v171 then
            v168 = nil;
            local l_Animate_1 = v166:FindFirstChild("Animate");
            if not l_Animate_1 then
                return nil, nil;
            else
                assert(l_Animate_1, "animateScript is non-nil. Silence type checker.");
                local l_toolnone_0 = l_Animate_1:FindFirstChild("toolnone");
                if not l_toolnone_0 then
                    return nil, nil;
                else
                    assert(l_toolnone_0, "toolNoneStringValue is non-nil. Silence type checker.");
                    local l_ToolNoneAnim_0 = l_toolnone_0:FindFirstChild("ToolNoneAnim");
                    if l_ToolNoneAnim_0 then
                        local v175 = v4.GetAnimationClip(l_ToolNoneAnim_0);
                        if not v175 then
                            return nil, nil;
                        else
                            assert(v175, "toolAnimationClip is non-nil. Silence type checker.");
                            assert(v175:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence");
                            v169 = v4.GetThumbnailKeyframe(nil, v175, 0);
                            if not l_Tool_0:IsDescendantOf(v166) then
                                return nil, nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v168, v169;
    end;
end;
v4.ForceAnimationToStep = function(v177) --[[ Line: 668 ]]
    local l_Humanoid_0 = v177:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
        if l_Animator_0 then
            l_Animator_0:StepAnimations(0.1);
        end;
    end;
end;
v4.LoadAsset = function(v180) --[[ Line: 682 ]]
    -- upvalues: v4 (copy), l_InsertService_0 (copy)
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 683 ]]
        -- upvalues: v4 (ref), v180 (copy), l_InsertService_0 (ref)
        if v4.debugLoadAssetsFromFiles and v4.mapAssetIdToFileName then
            local v181 = "rbxasset://" .. v4.mapAssetIdToFileName(v180);
            return l_InsertService_0:LoadLocalAsset(v181);
        else
            return l_InsertService_0:LoadAsset(v180);
        end;
    end);
    return l_status_6, l_result_6;
end;
v4.SetDebugLoadAssetsFromFiles = function(v184, v185) --[[ Line: 704 ]]
    -- upvalues: v4 (copy)
    v4.debugLoadAssetsFromFiles = v184;
    v4.mapAssetIdToFileName = v185;
end;
v4.GetMotor6DBetween = function(v186, v187) --[[ Line: 712 ]]
    if not v186 or not v187 then
        return nil;
    else
        assert(v186, "part0 is non-nil. Silence type checker.");
        assert(v187, "part1 is non-nil. Silence type checker.");
        for _, v189 in pairs(v187:GetChildren()) do
            if v189:IsA("Motor6D") and v189.Part0 == v186 then
                return v189;
            end;
        end;
        return nil;
    end;
end;
v4.PoseKeyframeHasFaceAnimation = function(v190) --[[ Line: 731 ]]
    if not v190 then
        return false;
    else
        assert(v190, "poseKeyframe is non-nil. Silence type checker.");
        local function v191(v192) --[[ Line: 737 ]] --[[ Name: recurHasFaceAnimation ]]
            -- upvalues: v191 (copy)
            if v192:IsA("Folder") then
                return true;
            else
                for _, v194 in v192:GetChildren() do
                    if v191(v194) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        for _, v196 in pairs(v190:GetPoses()) do
            if v191(v196) then
                return true;
            end;
        end;
        return false;
    end;
end;
v4.ApplyKeyframe = function(v197, v198) --[[ Line: 762 ]]
    -- upvalues: v5 (ref), v92 (copy), v4 (copy)
    v5 = {};
    v92(v197, v198);
    v5 = {};
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 99 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    if l_status_7 and l_result_7 then
        v4.ForceAnimationToStep(v197);
    end;
end;
v4.GetNumberValueWithDefault = function(v201, v202, v203) --[[ Line: 771 ]]
    local l_v203_0 = v203;
    local l_v201_FirstChild_0 = v201:FindFirstChild(v202);
    if l_v201_FirstChild_0 and l_v201_FirstChild_0:IsA("NumberValue") then
        l_v203_0 = l_v201_FirstChild_0.Value;
    end;
    return l_v203_0;
end;
v4.GetAnimationClip = function(v206) --[[ Line: 784 ]]
    -- upvalues: v65 (copy)
    if v206:IsA("KeyframeSequence") then
        return v206;
    elseif v206:IsA("Animation") then
        return (v65(v206.AnimationId));
    else
        error("Unknown keyframeSequenceOrAnimation type:" .. v206.ClassName);
        return nil;
    end;
end;
v4.GetThumbnailKeyframe = function(v207, v208, v209) --[[ Line: 798 ]]
    -- upvalues: v98 (copy)
    local l_v208_Keyframes_0 = v208:GetKeyframes();
    local v211 = nil;
    v211 = if v207 and v207 > 0 and v207 <= #l_v208_Keyframes_0 then l_v208_Keyframes_0[v207] else l_v208_Keyframes_0[math.ceil(#l_v208_Keyframes_0 / 2)];
    return (v98(v211, v209));
end;
v4.GetCurveAnimationTimeLength = function(v212) --[[ Line: 816 ]]
    local v213 = 0;
    for _, v215 in v212:GetDescendants() do
        if v215:IsA("FloatCurve") then
            v213 = math.max(v213, v215:GetKeyAtIndex(v215.Length).Time);
        end;
    end;
    return v213;
end;
v4.GetThumbnailKeyframeFromCurve = function(v216, v217, v218) --[[ Line: 831 ]]
    -- upvalues: v4 (copy), v101 (copy), v98 (copy)
    local v219 = v4.GetCurveAnimationTimeLength(v217);
    if not v216 or v216 < 0 or v219 < v216 then
        v216 = v219 / 2;
    end;
    assert(v216, "thumbnailTime should be non-nil. Silence type checker");
    local v220 = {
        Position = true, 
        Rotation = true
    };
    local function v221(v222, v223) --[[ Line: 849 ]] --[[ Name: recurGenerateKeyframe ]]
        -- upvalues: v101 (ref), v216 (ref), v220 (copy), v221 (copy)
        local v224 = nil;
        local l_Position_0 = v223:FindFirstChild("Position");
        local l_Rotation_0 = v223:FindFirstChild("Rotation");
        if l_Position_0 and l_Rotation_0 then
            local v227 = v101(l_Rotation_0, v216);
            if v227 then
                v227 = v227 + Vector3.new(table.unpack(l_Position_0:GetValueAtTime(v216)));
                local l_Pose_0 = Instance.new("Pose");
                l_Pose_0.CFrame = v227;
                l_Pose_0.Name = v223.Name;
                l_Pose_0.Parent = v222;
                v224 = l_Pose_0;
            end;
        else
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = v223.Name;
            l_Folder_0.Parent = v222;
            v224 = l_Folder_0;
        end;
        for _, v231 in v223:GetChildren() do
            if v231:IsA("FloatCurve") and not v220[v231] then
                local l_NumberPose_0 = Instance.new("NumberPose");
                l_NumberPose_0.Name = v231.Name;
                local v233 = v231:GetValueAtTime(v216) or 0;
                assert(v233, "valueAtTime should be non-nil. Silence type checker.");
                l_NumberPose_0.Value = v233;
                l_NumberPose_0.Parent = v224;
            elseif v231:IsA("Folder") then
                v221(v224, v231);
            end;
        end;
    end;
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Name = v217.Name;
    l_Keyframe_0.Time = v216;
    for _, v236 in v217:GetChildren() do
        if v236:IsA("Folder") then
            v221(l_Keyframe_0, v236);
        end;
    end;
    return (v98(l_Keyframe_0, v218));
end;
v4.ClearPlayerCharacterFace = function(v237) --[[ Line: 907 ]]
    local l_v237_FirstChildWhichIsA_0 = v237:FindFirstChildWhichIsA("FaceControls", true);
    if l_v237_FirstChildWhichIsA_0 then
        local l_Parent_0 = l_v237_FirstChildWhichIsA_0.Parent;
        local l_l_v237_FirstChildWhichIsA_0_Children_0 = l_v237_FirstChildWhichIsA_0:GetChildren();
        local l_FaceControls_0 = Instance.new("FaceControls");
        l_FaceControls_0.Parent = l_Parent_0;
        for _, v243 in l_l_v237_FirstChildWhichIsA_0_Children_0 do
            v243.Parent = l_FaceControls_0;
        end;
        l_v237_FirstChildWhichIsA_0:Destroy();
    end;
end;
v4.AdjustArmOnR6ForTool = function(v244) --[[ Line: 924 ]]
    local l_Tool_1 = v244:FindFirstChildOfClass("Tool");
    local l_Torso_0 = v244:FindFirstChild("Torso");
    if l_Torso_0 then
        local l_l_Torso_0_FirstChild_0 = l_Torso_0:FindFirstChild("Right Shoulder");
        if l_l_Torso_0_FirstChild_0 then
            if l_Tool_1 then
                l_l_Torso_0_FirstChild_0.CurrentAngle = 1.5707963267948966;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 1.5707963267948966;
                return;
            else
                l_l_Torso_0_FirstChild_0.CurrentAngle = 0;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 0;
            end;
        end;
    end;
end;
v4.SetPlayerCharacterFace = function(v248, v249) --[[ Line: 946 ]]
    -- upvalues: v165 (copy), v4 (copy)
    if not v249 then
        return;
    elseif v249 == "" then
        return;
    elseif v249 == 0 then
        return;
    else
        local v250 = true;
        if typeof(v249) ~= "number" then
            v250 = typeof(v249) == "string";
        end;
        assert(v250, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string");
        if not v248:FindFirstChildOfClass("Humanoid") then
            return;
        else
            v250 = v165(v249);
            if not v250 then
                return;
            else
                v4.ClearPlayerCharacterFace(v248);
                v4.ApplyKeyframe(v248, v250);
                return;
            end;
        end;
    end;
end;
v4.SetPlayerCharacterNeutralPose = function(v251) --[[ Line: 987 ]]
    -- upvalues: v4 (copy)
    local l_Humanoid_1 = v251:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_1 then
        return;
    else
        assert(l_Humanoid_1, "humanoid should be non-nil. Silence type checker.");
        l_Humanoid_1:BuildRigFromAttachments();
        if l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
            return;
        else
            v4.ClearPlayerCharacterFace(v251);
            local function v253(v254) --[[ Line: 1002 ]] --[[ Name: recurResetJoint ]]
                -- upvalues: v253 (copy)
                if v254:IsA("Motor6D") then
                    v254.Transform = CFrame.new();
                end;
                for _, v256 in (v254:GetChildren()) do
                    v253(v256);
                end;
            end;
            v253(v251);
            return;
        end;
    end;
end;
local function v273(v257, v258, v259, v260, v261) --[[ Line: 1017 ]] --[[ Name: loadKeyframesForPoseR15 ]]
    -- upvalues: v157 (copy), v176 (copy), v4 (copy), v165 (copy)
    local v262 = {
        originalAnimationAssetId = v258
    };
    local v263 = nil;
    v263 = not v261 or false;
    local v264, v265, v266 = v157(v257, v258, not v260, v263);
    local v267 = nil;
    local v268 = nil;
    if not v261 and v264 then
        local v269, v270 = v176(v257, v265);
        v267 = v269;
        v268 = v270;
    end;
    local v271 = nil;
    local v272 = false;
    if v259 and v259 ~= 0 then
        if v258 == nil then
            v272 = true;
        elseif not v4.PoseKeyframeHasFaceAnimation(v264) then
            v272 = true;
        end;
    end;
    if v272 then
        v271 = v165(v259);
    end;
    v262.poseKeyframe = v264;
    v262.moodKeyframe = v271;
    v262.defaultToolKeyframe = v268;
    v262.suggestedKeyframeFromTool = v267;
    v262.finalAnimationAssetIdOrUrl = v266;
    return v262;
end;
v4.LoadKeyframesForPose = function(v274, v275, v276, v277, v278) --[[ Line: 1101 ]]
    -- upvalues: v273 (copy)
    assert(v274, "character should be non-nil");
    if v275 ~= nil then
        assert(typeof(v275) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v275 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v276 ~= nil then
        assert(typeof(v276) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_2 = v274:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_2 then
        return nil;
    else
        assert(l_Humanoid_2, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_2.RigType == Enum.HumanoidRigType.R15 then
            return (v273(v274, v275, v276, v277, v278));
        else
            return {
                originalAnimationAssetId = v275
            };
        end;
    end;
end;
v4.ApplyKeyframesForPose = function(v280, v281) --[[ Line: 1149 ]]
    -- upvalues: v4 (copy), v5 (ref), v138 (copy), v92 (copy)
    assert(v280, "character should be non-nil");
    if not v281 then
        return;
    else
        assert(v281, "keyframesForPose should be non-nil. Silence type checker.");
        local l_Humanoid_3 = v280:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_3 then
            return;
        else
            assert(l_Humanoid_3, "humanoid should be non-nil. Silence type checker.");
            v4.SetPlayerCharacterNeutralPose(v280);
            v5 = {};
            local l_Tool_2 = v280:FindFirstChildOfClass("Tool");
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                if l_Tool_2 then
                    local l_originalAnimationAssetId_0 = v281.originalAnimationAssetId;
                    v138(v280, l_Humanoid_3, l_Tool_2, l_originalAnimationAssetId_0, v281.poseKeyframe, v281.defaultToolKeyframe, v281.suggestedKeyframeFromTool);
                else
                    v92(v280, v281.poseKeyframe);
                end;
            else
                v4.AdjustArmOnR6ForTool(v280);
            end;
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                v92(v280, v281.moodKeyframe);
            end;
            v5 = {};
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 99 ]]
                return game.GetService(game, "ThumbnailGenerator") ~= nil;
            end);
            if l_status_8 and l_result_8 then
                v4.ForceAnimationToStep(v280);
            end;
            return;
        end;
    end;
end;
v4.SetPlayerCharacterPoseWithMoodFallback = function(v287, v288, v289, v290, v291) --[[ Line: 1215 ]]
    -- upvalues: v4 (copy)
    local l_Humanoid_4 = v287:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_4 then
        return;
    else
        assert(l_Humanoid_4, "humanoid should be non-nil.  Silence type checker.");
        local v293 = v4.LoadKeyframesForPose(v287, v288, v289, v290, v291);
        v4.ApplyKeyframesForPose(v287, v293);
        return;
    end;
end;
v4.ThumbnailZoomExtents = function(v294, v295, v296, v297, v298) --[[ Line: 1239 ]]
    local l_v294_ModelCFrame_0 = v294:GetModelCFrame();
    local l_LookVector_0 = l_v294_ModelCFrame_0.LookVector;
    local l_HumanoidRootPart_0 = v294:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
    end;
    local v302 = CFrame.new(l_v294_ModelCFrame_0.Position + l_LookVector_0 * 5, l_v294_ModelCFrame_0.Position);
    local v303 = l_v294_ModelCFrame_0.Position + Vector3.new(v296, -v297, 0);
    local l_v294_ExtentsSize_0 = v294:GetExtentsSize();
    local l_X_1 = l_v294_ExtentsSize_0.X;
    local l_Y_1 = l_v294_ExtentsSize_0.Y;
    local l_Z_1 = l_v294_ExtentsSize_0.Z;
    local v308 = math.sqrt(l_X_1 ^ 2 + l_Y_1 ^ 2 + l_Z_1 ^ 2);
    local v309 = 1 / math.tan(math.rad(v295) / 2);
    local v310 = v308 / 2 * v309 * (1 / v298);
    return v302 - v302.Position + v303 + l_LookVector_0 * v310;
end;
return v4;