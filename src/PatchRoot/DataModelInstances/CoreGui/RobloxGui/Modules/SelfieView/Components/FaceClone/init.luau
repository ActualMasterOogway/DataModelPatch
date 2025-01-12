local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Utils.ModelUtils);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_game_EngineFeature_0 = game:GetEngineFeature("AnimatorAndADFRefactor");
local l_game_EngineFeature_1 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
local v8 = nil;
local v9 = nil;
local v10 = game:DefineFastFlag("SelfViewLookUpHumanoidByType", false);
local v11 = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false);
local l_GetFFlagSelfieViewMoreFixMigration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfieViewMoreFixMigration;
local l_SelfieView_0 = script.Parent.Parent.Parent.SelfieView;
local v14 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewDontWaitForCharacter);
local l_GetFFlagSelfViewAssertFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewAssertFix;
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local v17 = game:DefineFastFlag("FixSelfieViewErrorLoop", false);
local v18 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewGyroMigration);
local l_RunService_0 = game:GetService("RunService");
local v20 = 1.31;
local v21 = 0;
local v22 = nil;
local v23 = nil;
local v24 = {};
local v25 = {};
local v26 = nil;
local v27 = {};
local v28 = {};
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = Vector3.new(1.1720999479293823, 1.1811000108718872, 1.1577999591827393, 0);
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = false;
local v44 = 0;
local v45 = {};
local v46 = {
    AnimationPlayed = "AnimationPlayed", 
    AnimationPlayedCoreScript = "AnimationPlayedCoreScript", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    HeadSize = "HeadSize", 
    Color = "Color", 
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidStateChanged = "HumanoidStateChanged"
};
local l_Players_0 = game:GetService("Players");
if not l_Players_0.LocalPlayer then
    warn("Players.LocalPlayer does not exist");
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v49 = false;
setCloneDirty = function(v50) --[[ Line: 101 ]] --[[ Name: setCloneDirty ]]
    -- upvalues: v21 (ref)
    if v50 then
        v21 = 0.35;
        return;
    else
        v21 = 0;
        return;
    end;
end;
createCloneAnchor = function() --[[ Line: 109 ]] --[[ Name: createCloneAnchor ]]
    -- upvalues: v34 (ref), v31 (ref)
    if v34 ~= nil then
        v34:Destroy();
        v34 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v31;
    v34 = l_WorldModel_0;
end;
local function _(v52) --[[ Line: 121 ]] --[[ Name: clearObserver ]]
    -- upvalues: v45 (copy)
    if v45[v52] then
        v45[v52]:Disconnect();
        v45[v52] = nil;
    end;
end;
clearCloneCharacter = function() --[[ Line: 128 ]] --[[ Name: clearCloneCharacter ]]
    -- upvalues: v35 (ref), v34 (ref)
    if v35 then
        v35:Destroy();
        v35 = nil;
    end;
    if not v34 then
        warn("cloneAnchor is nil, this shouldn't be possible");
        return;
    else
        assert(v34 ~= nil);
        local l_SelfAvatar_0 = v34:FindFirstChild("SelfAvatar");
        if l_SelfAvatar_0 then
            l_SelfAvatar_0:Destroy();
        end;
        createCloneAnchor();
        return;
    end;
end;
local function v56() --[[ Line: 147 ]] --[[ Name: clearClone ]]
    -- upvalues: v46 (copy), v45 (copy), v26 (ref), v27 (ref)
    stopRenderStepped();
    local l_AnimationPlayed_0 = v46.AnimationPlayed;
    if v45[l_AnimationPlayed_0] then
        v45[l_AnimationPlayed_0]:Disconnect();
        v45[l_AnimationPlayed_0] = nil;
    end;
    l_AnimationPlayed_0 = v46.AnimationPlayedCoreScript;
    if v45[l_AnimationPlayed_0] then
        v45[l_AnimationPlayed_0]:Disconnect();
        v45[l_AnimationPlayed_0] = nil;
    end;
    v26 = nil;
    v27 = {};
    clearCloneCharacter();
end;
local function v60(v57, v58) --[[ Line: 159 ]] --[[ Name: syncTrack ]]
    -- upvalues: v8 (ref), v9 (ref), l_LocalPlayer_0 (copy), v24 (copy)
    if not v57 or not v58.Animation then
        return;
    else
        local v59 = nil;
        if not v58.Animation or not v58.Animation:IsA("Animation") then
            if v58.Animation and v58.Animation:IsA("TrackerStreamAnimation") then
                v8 = Instance.new("TrackerStreamAnimation");
                assert(v8 ~= nil);
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v9 = v57:LoadStreamAnimationV2(v8, l_LocalPlayer_0, false, false);
                else
                    v9 = v57:LoadStreamAnimationForSelfieView_deprecated(v8, l_LocalPlayer_0);
                end;
                v59 = v9;
            else
                warn("No animation to clone in SelfView");
            end;
        end;
        if v59 then
            v59:Play();
            v59.Priority = v58.Priority;
            v24[v58] = v58.Stopped:Connect(function() --[[ Line: 188 ]]
                -- upvalues: v59 (ref), v24 (ref), v58 (copy)
                v59:Stop(0);
                if v24[v58] then
                    v24[v58]:Disconnect();
                end;
            end);
        end;
        return;
    end;
end;
local function v86(v61) --[[ Line: 197 ]] --[[ Name: updateClone ]]
    -- upvalues: v46 (copy), v45 (copy), v26 (ref), v27 (ref), v14 (copy), v1 (copy), v35 (ref), l_GetFFlagSelfViewAssertFix_0 (copy), l_GetFFlagSelfieViewMoreFixMigration_0 (copy), v25 (copy), v34 (ref), v32 (ref), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), v33 (ref), v20 (ref), v37 (ref), v38 (ref), v39 (ref), v10 (copy), l_game_EngineFeature_0 (copy), v8 (ref), v60 (copy)
    stopRenderStepped();
    local l_AnimationPlayed_1 = v46.AnimationPlayed;
    if v45[l_AnimationPlayed_1] then
        v45[l_AnimationPlayed_1]:Disconnect();
        v45[l_AnimationPlayed_1] = nil;
    end;
    l_AnimationPlayed_1 = v46.AnimationPlayedCoreScript;
    if v45[l_AnimationPlayed_1] then
        v45[l_AnimationPlayed_1]:Disconnect();
        v45[l_AnimationPlayed_1] = nil;
    end;
    v26 = nil;
    v27 = {};
    clearCloneCharacter();
    if not v61 then
        return;
    else
        assert(v61 ~= nil);
        startRenderStepped(v61);
        l_AnimationPlayed_1 = v61.Character;
        if v14() then
            if not v61 or not v61.Character then
                return;
            else
                l_AnimationPlayed_1 = v61.Character;
                if not l_AnimationPlayed_1 then
                    return;
                end;
            end;
        elseif not v61 or not v61.Character and not v61.CharacterAdded:Wait() then
            return;
        else
            l_AnimationPlayed_1 = v61.Character or v61.CharacterAdded:Wait();
        end;
        assert(l_AnimationPlayed_1 ~= nil);
        local v63 = v1.getAnimator(l_AnimationPlayed_1, 10);
        clearCloneCharacter();
        local l_Archivable_0 = l_AnimationPlayed_1.Archivable;
        l_AnimationPlayed_1.Archivable = true;
        local v65 = v1.getHead(l_AnimationPlayed_1);
        if not v65 then
            return;
        else
            v35 = l_AnimationPlayed_1:Clone();
            if l_GetFFlagSelfViewAssertFix_0() and v35 == nil then
                return;
            else
                assert(v35 ~= nil);
                if not l_GetFFlagSelfieViewMoreFixMigration_0() then
                    v1.removeTags(v35);
                end;
                v1.resetPartOrientation(v35);
                v1.updateTransparency(v35, v25);
                if l_GetFFlagSelfieViewMoreFixMigration_0() then
                    v1.removeTags(v35);
                end;
                v35.Name = "SelfAvatar";
                v1.removeScripts(v35);
                v1.sanitizeCharacter(v35);
                l_AnimationPlayed_1.Archivable = l_Archivable_0;
                v35.Parent = v34;
                local l_HumanoidRootPart_0 = v35:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_0 then
                    l_HumanoidRootPart_0.CFrame = CFrame.new((Vector3.new(0, 0, 0, 0)));
                    assert(v32 ~= nil);
                    if v65 then
                        local v67 = v1.getHead(v35);
                        if not l_GetFFlagSelfieViewMoreFixMigration_0() or v67 then
                            assert(v67 ~= nil);
                            local v68 = l_CFrameUtility_0.CalculateTargetCFrame(v67.CFrame);
                            local v69, v70 = l_CharacterUtility_0.CalculateHeadExtents(v35, v68);
                            local v71 = Vector3.new(v69.X, v69.Y, v69.Z);
                            v33 = Vector3.new(v70.X, v70.Y, v70.Z) - v71;
                            assert(v33 ~= nil);
                            v20 = v67.Size.Y;
                            local v72 = math.min(v33.X, v33.Y);
                            v72 = math.min(v33.X, v33.Z);
                            local l_Model_0 = Instance.new("Model");
                            l_Model_0.Parent = v35;
                            v67 = v1.getHead(v35);
                            l_AnimationPlayed_1.Archivable = true;
                            v37 = v67:Clone();
                            assert(v37 ~= nil);
                            v37.CanCollide = false;
                            v37.Parent = l_Model_0;
                            v38 = v1.getNeck(v35, v37);
                            v39 = v37.CFrame;
                            v37:Destroy();
                            assert(v39 ~= nil);
                            local v74 = v39.Position + v39.LookVector * (v72 * 2);
                            v32.CFrame = CFrame.lookAt(v74 + Vector3.new(0, 0.10499999672174454, -0.25, 0), v39.Position);
                            v32.Focus = v39;
                            l_AnimationPlayed_1.Archivable = l_Archivable_0;
                            l_Model_0:Destroy();
                        end;
                    else
                        local v75 = l_HumanoidRootPart_0.Position + l_HumanoidRootPart_0.CFrame.LookVector * 2.5;
                        v32.CFrame = CFrame.lookAt(v75 + Vector3.new(0, 1.5, 0, 0), l_HumanoidRootPart_0.Position);
                        v32.CFrame = CFrame.new(v32.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                    end;
                end;
                if v35 == nil then
                    return;
                else
                    local v76 = nil;
                    v76 = if v10 then v35:FindFirstChildWhichIsA("Humanoid") else v35:FindFirstChild("Humanoid");
                    if v76 then
                        v76.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                    end;
                    v26 = v1.getAnimator(v35, 0);
                    if v26 then
                        if not l_GetFFlagSelfieViewMoreFixMigration_0() or not l_game_EngineFeature_0 then
                            local l_v26_PlayingAnimationTracks_0 = v26:GetPlayingAnimationTracks();
                            local l_v26_PlayingAnimationTracksCoreScript_0 = v26:GetPlayingAnimationTracksCoreScript();
                            for _, v80 in ipairs(l_v26_PlayingAnimationTracks_0) do
                                if v80 ~= nil then
                                    v80:Stop(0);
                                    v80:Destroy();
                                end;
                            end;
                            for _, v82 in ipairs(l_v26_PlayingAnimationTracksCoreScript_0) do
                                if v82 ~= nil then
                                    v82:Stop(0);
                                    v82:Destroy();
                                end;
                            end;
                            if v8 then
                                v8:Destroy();
                                v8 = nil;
                            end;
                        end;
                        if v63 then
                            if l_GetFFlagSelfieViewMoreFixMigration_0() and l_game_EngineFeature_0 then
                                v26:SynchronizeWith(v63);
                            else
                                for _, v84 in ipairs(v63:GetPlayingAnimationTracksCoreScript()) do
                                    v60(v26, v84);
                                end;
                                v45[v46.AnimationPlayedCoreScript] = v63.AnimationPlayedCoreScript:Connect(function(v85) --[[ Line: 407 ]]
                                    -- upvalues: v60 (ref), v26 (ref)
                                    v60(v26, v85);
                                end);
                            end;
                            setCloneDirty(false);
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
local _ = function(v87, v88) --[[ Line: 423 ]] --[[ Name: hasProperty ]]
    local _ = v87[v88];
end;
updateCachedHeadColor = function(v91) --[[ Line: 430 ]] --[[ Name: updateCachedHeadColor ]]
    -- upvalues: v29 (ref), v30 (ref)
    if v91 == nil then
        return;
    else
        assert(v91 ~= nil);
        if pcall(function() --[[ Line: 436 ]]
            -- upvalues: v91 (copy)
            local _ = v91.Color;
        end) then
            v29 = v91.Color;
            if pcall(function() --[[ Line: 442 ]]
                -- upvalues: v91 (copy)
                local _ = v91.Size;
            end) then
                v30 = v91.Size;
            end;
        end;
        return;
    end;
end;
local function _(v94) --[[ Line: 453 ]] --[[ Name: addHumanoidStateChangedObserver ]]
    -- upvalues: v45 (copy), v46 (copy)
    if not v94 then
        return;
    else
        if not v45[v46.HumanoidStateChanged] then
            v45[v46.HumanoidStateChanged] = v94.StateChanged:Connect(function(v95, v96) --[[ Line: 458 ]]
                if v95 == Enum.HumanoidStateType.PlatformStanding and v96 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v96 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return;
    end;
end;
local function v109(v98) --[[ Line: 471 ]] --[[ Name: characterAdded ]]
    -- upvalues: v17 (copy), v31 (ref), v40 (ref), v14 (copy), v36 (ref), v1 (copy), v46 (copy), v45 (copy), v10 (copy), v43 (ref)
    if v17 and (v31 == nil or v40 == nil) then
        return;
    elseif v14() and not v98 then
        return;
    else
        v36 = v1.getHead(v98);
        updateCachedHeadColor(v36);
        local l_DescendantAdded_0 = v46.DescendantAdded;
        if v45[l_DescendantAdded_0] then
            v45[l_DescendantAdded_0]:Disconnect();
            v45[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v46.DescendantRemoving;
        if v45[l_DescendantAdded_0] then
            v45[l_DescendantAdded_0]:Disconnect();
            v45[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v46.HeadSize;
        if v45[l_DescendantAdded_0] then
            v45[l_DescendantAdded_0]:Disconnect();
            v45[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v46.Color;
        if v45[l_DescendantAdded_0] then
            v45[l_DescendantAdded_0]:Disconnect();
            v45[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = nil;
        l_DescendantAdded_0 = if v10 then v98:FindFirstChildWhichIsA("Humanoid") else v98:FindFirstChild("Humanoid");
        if l_DescendantAdded_0 then
            local l_l_DescendantAdded_0_0 = l_DescendantAdded_0;
            if l_l_DescendantAdded_0_0 and not v45[v46.HumanoidStateChanged] then
                v45[v46.HumanoidStateChanged] = l_l_DescendantAdded_0_0.StateChanged:Connect(function(v101, v102) --[[ Line: 458 ]]
                    if v101 == Enum.HumanoidStateType.PlatformStanding and v102 == Enum.HumanoidStateType.Running then
                        setCloneDirty(true);
                    end;
                    if v102 == Enum.HumanoidStateType.GettingUp then
                        setCloneDirty(true);
                    end;
                end);
            end;
        end;
        v45[v46.DescendantAdded] = v98.DescendantAdded:Connect(function(v103) --[[ Line: 504 ]]
            -- upvalues: v17 (ref), v31 (ref), v40 (ref), v36 (ref), v1 (ref), v98 (copy), v10 (ref), v45 (ref), v46 (ref)
            if v17 and (v31 == nil or v40 == nil) then
                return;
            else
                if v103.Name == "Head" then
                    v36 = v1.getHead(v98);
                    updateCachedHeadColor(v36);
                end;
                if v10 then
                    if v103:IsA("Humanoid") and v103 and not v45[v46.HumanoidStateChanged] then
                        v45[v46.HumanoidStateChanged] = v103.StateChanged:Connect(function(v104, v105) --[[ Line: 458 ]]
                            if v104 == Enum.HumanoidStateType.PlatformStanding and v105 == Enum.HumanoidStateType.Running then
                                setCloneDirty(true);
                            end;
                            if v105 == Enum.HumanoidStateType.GettingUp then
                                setCloneDirty(true);
                            end;
                        end);
                    end;
                elseif (v103.Name == "Humanoid" or v103:IsA("Humanoid")) and v103 and not v45[v46.HumanoidStateChanged] then
                    v45[v46.HumanoidStateChanged] = v103.StateChanged:Connect(function(v106, v107) --[[ Line: 458 ]]
                        if v106 == Enum.HumanoidStateType.PlatformStanding and v107 == Enum.HumanoidStateType.Running then
                            setCloneDirty(true);
                        end;
                        if v107 == Enum.HumanoidStateType.GettingUp then
                            setCloneDirty(true);
                        end;
                    end);
                end;
                if v1.shouldMarkCloneDirtyForDescendant(v103) then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        v45[v46.DescendantRemoving] = v98.DescendantRemoving:Connect(function(v108) --[[ Line: 532 ]]
            -- upvalues: v17 (ref), v31 (ref), v40 (ref), v1 (ref)
            if v17 and (v31 == nil or v40 == nil) then
                return;
            else
                if v108 and (v108:IsA("MeshPart") or v108:IsA("Accessory")) then
                    if v108:IsA("MeshPart") and v108.MeshId == "" then
                        return;
                    elseif v1.shouldMarkCloneDirtyForDescendant(v108) then
                        setCloneDirty(true);
                    end;
                end;
                return;
            end;
        end);
        setCloneDirty(true);
        v43 = true;
        return;
    end;
end;
local function v111() --[[ Line: 556 ]] --[[ Name: createViewport ]]
    -- upvalues: v31 (ref), v40 (ref), l_GetFFlagSelfieViewMoreFixMigration_0 (copy), v32 (ref)
    if v31 then
        v31:Destroy();
    end;
    v31 = Instance.new("ViewportFrame");
    v31.Position = UDim2.new(0, 0, 0, 0);
    v31.Size = UDim2.new(1, 0, 1, 0);
    v31.BackgroundTransparency = 1;
    v31.Parent = v40;
    v31.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
    v31.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
    v31.LightDirection = Vector3.new(9.5, -12, 7.5, 0);
    v31.IsMirrored = true;
    local _ = Instance.new("UICorner");
    Instance.new("UICorner").Parent = v31;
    createCloneAnchor();
    if l_GetFFlagSelfieViewMoreFixMigration_0() and v40 then
        v40.Destroying:Connect(clearViewportFrame);
    end;
    v32 = Instance.new("Camera");
    assert(v32 ~= nil);
    v32.FieldOfView = 70;
    v31.CurrentCamera = v32;
    v32.Parent = v31;
end;
ReInit = function(v112) --[[ Line: 590 ]] --[[ Name: ReInit ]]
    -- upvalues: l_GetFFlagSelfViewVisibilityFix_0 (copy), v42 (ref), v49 (ref), v36 (ref), v1 (copy), v46 (copy), v45 (copy), v26 (ref), v27 (ref), v111 (copy)
    assert(v112.Character ~= nil);
    if l_GetFFlagSelfViewVisibilityFix_0() and v42 and not v42.Visible then
        v49 = false;
        return;
    else
        v36 = v1.getHead(v112.Character);
        updateCachedHeadColor(v36);
        setCloneDirty(false);
        local l_CharacterAdded_0 = v46.CharacterAdded;
        if v45[l_CharacterAdded_0] then
            v45[l_CharacterAdded_0]:Disconnect();
            v45[l_CharacterAdded_0] = nil;
        end;
        l_CharacterAdded_0 = v46.CharacterRemoving;
        if v45[l_CharacterAdded_0] then
            v45[l_CharacterAdded_0]:Disconnect();
            v45[l_CharacterAdded_0] = nil;
        end;
        stopRenderStepped();
        l_CharacterAdded_0 = v46.AnimationPlayed;
        if v45[l_CharacterAdded_0] then
            v45[l_CharacterAdded_0]:Disconnect();
            v45[l_CharacterAdded_0] = nil;
        end;
        l_CharacterAdded_0 = v46.AnimationPlayedCoreScript;
        if v45[l_CharacterAdded_0] then
            v45[l_CharacterAdded_0]:Disconnect();
            v45[l_CharacterAdded_0] = nil;
        end;
        v26 = nil;
        v27 = {};
        clearCloneCharacter();
        v111();
        playerAdded(v112);
        startRenderStepped(v112);
        return;
    end;
end;
local function v119(v114) --[[ Line: 612 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v23 (ref), v14 (copy), v43 (ref), v109 (copy), l_LocalPlayer_0 (copy), v46 (copy), v45 (copy), v10 (copy)
    if v23 then
        v23:Disconnect();
    end;
    if v14() then
        if not v43 then
            v109(v114);
        else
            ReInit(l_LocalPlayer_0);
        end;
    else
        ReInit(l_LocalPlayer_0);
    end;
    local l_HumanoidStateChanged_0 = v46.HumanoidStateChanged;
    if v45[l_HumanoidStateChanged_0] then
        v45[l_HumanoidStateChanged_0]:Disconnect();
        v45[l_HumanoidStateChanged_0] = nil;
    end;
    l_HumanoidStateChanged_0 = nil;
    l_HumanoidStateChanged_0 = if v10 then v114:FindFirstChildWhichIsA("Humanoid") else v114:FindFirstChild("Humanoid");
    if l_HumanoidStateChanged_0 then
        local l_l_HumanoidStateChanged_0_0 = l_HumanoidStateChanged_0;
        if not l_l_HumanoidStateChanged_0_0 then
            return;
        elseif not v45[v46.HumanoidStateChanged] then
            v45[v46.HumanoidStateChanged] = l_l_HumanoidStateChanged_0_0.StateChanged:Connect(function(v117, v118) --[[ Line: 458 ]]
                if v117 == Enum.HumanoidStateType.PlatformStanding and v118 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v118 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
    end;
end;
local function _(v120) --[[ Line: 637 ]] --[[ Name: FindInParents ]]
    -- upvalues: v40 (ref)
    if not v120 then
        return nil;
    elseif not v40 then
        return nil;
    else
        assert(v40 ~= nil, "Wrapper Frame cannot be nil");
        assert(v120 ~= nil, "Frame name cannot be nil ");
        return v40:FindFirstAncestor(v120);
    end;
end;
clearViewportFrame = function() --[[ Line: 652 ]] --[[ Name: clearViewportFrame ]]
    -- upvalues: v31 (ref), l_GetFFlagSelfieViewMoreFixMigration_0 (copy), v40 (ref)
    if v31 then
        v31:Destroy();
    end;
    if l_GetFFlagSelfieViewMoreFixMigration_0() then
        v40 = nil;
        stopRenderStepped();
    end;
end;
local function v122() --[[ Line: 662 ]] --[[ Name: onOuterContainerVisibilityChanged ]]
    -- upvalues: v42 (ref), v43 (ref), v49 (ref)
    if v42 then
        if v42.Visible then
            if not v43 then
                return;
            else
                v49 = true;
                return;
            end;
        else
            v49 = false;
        end;
    end;
end;
playerAdded = function(v123) --[[ Line: 681 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_LocalPlayer_0 (copy), v23 (ref), v46 (copy), v45 (copy), v14 (copy), v119 (copy), v109 (copy), v86 (copy)
    if v123 ~= nil and v123 == l_LocalPlayer_0 then
        if v23 ~= nil then
            v23:Disconnect();
            v23 = nil;
            local l_CharacterAdded_1 = v46.CharacterAdded;
            if v45[l_CharacterAdded_1] then
                v45[l_CharacterAdded_1]:Disconnect();
                v45[l_CharacterAdded_1] = nil;
            end;
        end;
        local l_Character_0 = v123.Character;
        l_Character_0 = if v14() then v123.Character else v123.Character or v123.CharacterAdded:Wait();
        v23 = v123.CharacterAdded:Connect(v119);
        if v14() then
            if l_Character_0 then
                v109(l_Character_0);
            end;
        else
            assert(l_Character_0 ~= nil);
            v109(l_Character_0);
        end;
        v45[v46.CharacterAdded] = v123.CharacterAdded:Connect(v109);
        v45[v46.CharacterRemoving] = v123.CharacterRemoving:Connect(function() --[[ Line: 711 ]]
            -- upvalues: v46 (ref), v45 (ref), v86 (ref)
            local l_DescendantAdded_1 = v46.DescendantAdded;
            if v45[l_DescendantAdded_1] then
                v45[l_DescendantAdded_1]:Disconnect();
                v45[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v46.DescendantRemoving;
            if v45[l_DescendantAdded_1] then
                v45[l_DescendantAdded_1]:Disconnect();
                v45[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v46.HeadSize;
            if v45[l_DescendantAdded_1] then
                v45[l_DescendantAdded_1]:Disconnect();
                v45[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v46.Color;
            if v45[l_DescendantAdded_1] then
                v45[l_DescendantAdded_1]:Disconnect();
                v45[l_DescendantAdded_1] = nil;
            end;
            v86(nil);
            l_DescendantAdded_1 = v46.CharacterRemoving;
            if v45[l_DescendantAdded_1] then
                v45[l_DescendantAdded_1]:Disconnect();
                v45[l_DescendantAdded_1] = nil;
            end;
        end);
    end;
end;
stopRenderStepped = function() --[[ Line: 722 ]] --[[ Name: stopRenderStepped ]]
    -- upvalues: v22 (ref)
    if v22 then
        v22:Disconnect();
        v22 = nil;
    end;
end;
updateClonePartsColor = function(v127) --[[ Line: 729 ]] --[[ Name: updateClonePartsColor ]]
    -- upvalues: v36 (ref), v29 (ref), l_LocalPlayer_0 (copy), v35 (ref)
    if pcall(function() --[[ Line: 730 ]]
        -- upvalues: v36 (ref)
        local _ = v36.Color;
    end) and v36 and v36.Color ~= v29 then
        local l_Character_1 = l_LocalPlayer_0.Character;
        if not l_Character_1 then
            return;
        else
            assert(l_Character_1 ~= nil);
            if not v35 then
                return;
            else
                assert(v35 ~= nil);
                for _, v131 in pairs(l_Character_1:GetChildren()) do
                    if v131:IsA("MeshPart") then
                        local l_v35_FirstChild_0 = v35:FindFirstChild(v131.Name);
                        if l_v35_FirstChild_0 and l_v35_FirstChild_0:IsA("MeshPart") and l_v35_FirstChild_0.Color and v131.Color then
                            l_v35_FirstChild_0.Color = v131.Color;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v29 = v127;
end;
startRenderStepped = function(v133) --[[ Line: 762 ]] --[[ Name: startRenderStepped ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy), v22 (ref), l_GetFFlagSelfViewVisibilityFix_0 (copy), v35 (ref), v42 (ref), v49 (ref), v26 (ref), l_LocalPlayer_0 (copy), v36 (ref), v1 (copy), v28 (ref), l_GetFFlagSelfViewAssertFix_0 (copy), v27 (ref), v18 (copy), l_UserInputService_0 (copy), v44 (ref), v37 (ref), v38 (ref), v39 (ref), v32 (ref), v33 (ref), l_game_Service_0 (copy), l_game_EngineFeature_1 (copy), v20 (ref), v30 (ref), v29 (ref), v21 (ref), v86 (copy)
    stopRenderStepped();
    v22 = (if v11 then l_RunService_0.Heartbeat else l_RunService_0.RenderStepped):Connect(function(v134) --[[ Line: 769 ]]
        -- upvalues: v11 (ref), l_GetFFlagSelfViewVisibilityFix_0 (ref), v35 (ref), v42 (ref), v49 (ref), v26 (ref), l_LocalPlayer_0 (ref), v36 (ref), v1 (ref), v28 (ref), l_GetFFlagSelfViewAssertFix_0 (ref), v27 (ref), v18 (ref), l_UserInputService_0 (ref), v44 (ref), v37 (ref), v38 (ref), v39 (ref), v32 (ref), v33 (ref), l_game_Service_0 (ref), l_game_EngineFeature_1 (ref), v20 (ref), v30 (ref), v29 (ref), v21 (ref), v86 (ref), v133 (copy)
        if v11 then
            debug.profilebegin("faceclone");
        end;
        if l_GetFFlagSelfViewVisibilityFix_0() and v35 and v42 and not v49 then
            if v26 ~= nil then
                local l_v26_PlayingAnimationTracks_1 = v26:GetPlayingAnimationTracks();
                for _, v137 in pairs(l_v26_PlayingAnimationTracks_1) do
                    if v137 ~= nil then
                        v137:Stop(0);
                    end;
                end;
            end;
            return;
        else
            if l_LocalPlayer_0 then
                local l_Character_2 = l_LocalPlayer_0.Character;
                if not l_Character_2 or l_Character_2.Parent == nil then
                    return;
                else
                    assert(l_Character_2 ~= nil);
                    if v36 == nil or v36.Parent ~= l_Character_2 then
                        v36 = v1.getHead(l_Character_2);
                    end;
                    if v36 then
                        local v139 = v1.getAnimator(l_Character_2, 0);
                        if v26 ~= nil and v139 ~= nil then
                            assert(v26 ~= nil);
                            local l_v26_PlayingAnimationTracks_2 = v26:GetPlayingAnimationTracks();
                            for _, v142 in pairs(l_v26_PlayingAnimationTracks_2) do
                                if v142 ~= nil then
                                    v142:Stop(0);
                                end;
                            end;
                            local l_v139_PlayingAnimationTracks_0 = v139:GetPlayingAnimationTracks();
                            local v144 = nil;
                            v28 = {};
                            for _, v146 in ipairs(l_v139_PlayingAnimationTracks_0) do
                                v144 = v146.Animation;
                                if v144 and v144:IsA("Animation") then
                                    if l_GetFFlagSelfViewAssertFix_0() then
                                        if v144.AnimationId ~= "" then
                                            v28[v144.AnimationId] = v146;
                                            if not v27[v144.AnimationId] then
                                                v27[v144.AnimationId] = v26:LoadAnimation(v144);
                                            end;
                                            local v147 = v27[v144.AnimationId];
                                            v147:Play();
                                            v147.TimePosition = v146.TimePosition;
                                            v147.Priority = v146.Priority;
                                            v147:AdjustWeight(v146.WeightCurrent, 0.1);
                                        end;
                                    else
                                        v28[v144.AnimationId] = v146;
                                        if not v27[v144.AnimationId] then
                                            v27[v144.AnimationId] = v26:LoadAnimation(v144);
                                        end;
                                        local v148 = v27[v144.AnimationId];
                                        v148:Play();
                                        v148.TimePosition = v146.TimePosition;
                                        v148.Priority = v146.Priority;
                                        v148:AdjustWeight(v146.WeightCurrent, 0.1);
                                    end;
                                end;
                            end;
                            for v149 in v27 do
                                local v150 = v27[v149];
                                if v150 then
                                    v144 = v150.Animation;
                                    if v144 and not v28[v144.AnimationId] then
                                        if v27[v144.AnimationId] ~= nil then
                                            v27[v144.AnimationId]:Stop(0);
                                        end;
                                        v27[v144.AnimationId] = nil;
                                    end;
                                end;
                            end;
                            for _, v152 in ipairs(v139:GetPlayingAnimationTracksCoreScript()) do
                                l_v26_PlayingAnimationTracks_2 = v26:GetPlayingAnimationTracksCoreScript();
                                for _, v154 in pairs(l_v26_PlayingAnimationTracks_2) do
                                    if v154.Animation:IsA("TrackerStreamAnimation") then
                                        v154.Priority = v152.Priority;
                                        v154:AdjustWeight(v152.WeightCurrent, 0);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v155 = nil;
                    local v156 = nil;
                    if v18() then
                        v155 = 0.5;
                        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
                        if (l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android) and v26 ~= nil then
                            local l_v26_PlayingAnimationTracksCoreScript_1 = v26:GetPlayingAnimationTracksCoreScript();
                            for _, v160 in pairs(l_v26_PlayingAnimationTracksCoreScript_1) do
                                if v160.Animation:IsA("TrackerStreamAnimation") then
                                    local v161 = nil;
                                    local l_v160_TrackerData_0, v163, v164 = v160:GetTrackerData();
                                    v161 = l_v160_TrackerData_0;
                                    v156 = v163;
                                    v161 = v164;
                                end;
                            end;
                        end;
                    end;
                    v44 = v44 + 1;
                    if v44 == 1 then
                        v44 = 0;
                        if v35 then
                            if not v37 then
                                v37 = v1.getHead(v35);
                                if v37 then
                                    v38 = v1.getNeck(v35, v37);
                                end;
                            end;
                            if v37 then
                                v39 = v37.CFrame;
                            end;
                        end;
                        if v32 and v37 then
                            local l_Position_0 = v37.Position;
                            local l_Position_1 = v37.Position;
                            local l_CFrame_0 = v37.CFrame;
                            if v38 then
                                local l_Part0_0 = v38.Part0;
                                local _ = v38.Part1;
                                local l_C0_0 = v38.C0;
                                local l_C1_0 = v38.C1;
                                local l_Transform_0 = v38.Transform;
                                if l_Part0_0 and l_C0_0 then
                                    l_CFrame_0 = l_Part0_0.CFrame * l_C0_0 * l_Transform_0 * l_C1_0:Inverse();
                                    l_Position_1 = Vector3.new(l_CFrame_0.Position.X * 0.25, (v37.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                    l_Position_0 = Vector3.new(l_CFrame_0.Position.X * 0.6, (v37.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                end;
                            end;
                            if not v33 then
                                warn("boundsSize is nil, this shouldn't be possible");
                            end;
                            assert(v33 ~= nil);
                            if v18() then
                                if l_game_Service_0 and l_game_Service_0.VideoAnimationEnabled and (v156 ~= nil or l_game_EngineFeature_1) then
                                    if l_game_EngineFeature_1 then
                                        local l_DeviceCameraCFrameForSelfView_0 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                        local l_Position_2 = l_DeviceCameraCFrameForSelfView_0.Position;
                                        local v175, v176, v177 = l_DeviceCameraCFrameForSelfView_0:ToEulerAnglesYXZ();
                                        local v178 = CFrame.fromEulerAnglesYXZ(v175, v176, v177);
                                        local v179 = 0;
                                        if l_Position_2.Z > 0 then
                                            v179 = math.clamp(0.5 - l_Position_2.Z * 3, -0.5, 0.5);
                                        end;
                                        local v180 = -(v33.Z + 1);
                                        local v181 = Vector3.new(0, 0.105, math.floor((v180 + v179 * v180) * 100) / 100);
                                        v32.CFrame = v32.CFrame:Lerp(CFrame.lookAt(v178 * (l_Position_0 + v181), l_Position_1), 0.5);
                                    elseif v156 then
                                        local v182 = Vector3.new(0, 0.105, -(v33.Z + 1));
                                        local v183, v184, v185 = v156:ToEulerAnglesXYZ();
                                        local v186 = CFrame.Angles(-v183 * v155, -v184 * v155, -v185 * v155);
                                        v32.CFrame = CFrame.lookAt(v186 * (l_Position_0 + v182), l_Position_1);
                                    end;
                                else
                                    local v187 = Vector3.new(0, v20 * 0.25 - 1.25, -(v33.Z + 1) + 0.125);
                                    if l_Character_2 then
                                        local l_Head_0 = l_Character_2:FindFirstChild("Head");
                                        if l_Head_0 then
                                            local l_HumanoidRootPart_1 = l_Character_2:FindFirstChild("HumanoidRootPart");
                                            if l_HumanoidRootPart_1 then
                                                local v190 = l_HumanoidRootPart_1.CFrame:Inverse() * l_Head_0.CFrame;
                                                local v191 = Vector3.new(v190.Position.X * 0.15 + 0.125, v190.Position.Y, v190.Position.Z * 0.05);
                                                v32.CFrame = CFrame.lookAt(l_Position_0 + v187 + v191, l_Position_1);
                                                v32.Focus = v37.CFrame;
                                            end;
                                        end;
                                    end;
                                end;
                            else
                                local v192 = Vector3.new(0, v20 * 0.25, -(v33.Z + 1));
                                v32.CFrame = CFrame.lookAt(l_Position_0 + v192, l_Position_1);
                                v32.Focus = v37.CFrame;
                            end;
                        end;
                    end;
                    if v36 then
                        if v36.Size ~= v30 then
                            v30 = v36.Size;
                            setCloneDirty(true);
                        end;
                        if pcall(function() --[[ Line: 1048 ]]
                            -- upvalues: v36 (ref)
                            local _ = v36.Color;
                        end) and v36.Color ~= v29 then
                            updateClonePartsColor(v36.Color);
                        end;
                    end;
                end;
            end;
            if v21 > 0 then
                v21 = v21 - v134;
                if v21 <= 0 then
                    v86(v133);
                    v21 = 0;
                end;
            end;
            if v11 then
                debug.profileend();
            end;
            return;
        end;
    end);
end;
return function(v194, v195, v196) --[[ Line: 1072 ]] --[[ Name: Initialize ]]
    -- upvalues: v40 (ref), l_GetFFlagSelfViewVisibilityFix_0 (copy), v41 (ref), v42 (ref), v122 (copy), v111 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v46 (copy), v45 (copy), v26 (ref), v27 (ref), v56 (copy)
    if v195 then
        v40 = v195;
        if l_GetFFlagSelfViewVisibilityFix_0() and v196 then
            v41 = v196;
            local l_v41_0 = v41;
            local v198;
            if not l_v41_0 then
                v198 = nil;
            elseif not v40 then
                v198 = nil;
            else
                assert(v40 ~= nil, "Wrapper Frame cannot be nil");
                assert(l_v41_0 ~= nil, "Frame name cannot be nil ");
                v198 = v40:FindFirstAncestor(l_v41_0);
            end;
            v42 = v198;
            if v42 then
                v42:GetPropertyChangedSignal("Visible"):Connect(v122);
            end;
        end;
        v111();
        playerAdded(v194);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v199) --[[ Line: 1100 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v46 (ref), v45 (ref), v26 (ref), v27 (ref)
            if v199 == l_LocalPlayer_0 then
                local l_HumanoidStateChanged_1 = v46.HumanoidStateChanged;
                if v45[l_HumanoidStateChanged_1] then
                    v45[l_HumanoidStateChanged_1]:Disconnect();
                    v45[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v46.CharacterAdded;
                if v45[l_HumanoidStateChanged_1] then
                    v45[l_HumanoidStateChanged_1]:Disconnect();
                    v45[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v46.CharacterRemoving;
                if v45[l_HumanoidStateChanged_1] then
                    v45[l_HumanoidStateChanged_1]:Disconnect();
                    v45[l_HumanoidStateChanged_1] = nil;
                end;
                stopRenderStepped();
                l_HumanoidStateChanged_1 = v46.AnimationPlayed;
                if v45[l_HumanoidStateChanged_1] then
                    v45[l_HumanoidStateChanged_1]:Disconnect();
                    v45[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v46.AnimationPlayedCoreScript;
                if v45[l_HumanoidStateChanged_1] then
                    v45[l_HumanoidStateChanged_1]:Disconnect();
                    v45[l_HumanoidStateChanged_1] = nil;
                end;
                v26 = nil;
                v27 = {};
                clearCloneCharacter();
            end;
        end);
        startRenderStepped(v194);
        return v56;
    else
        return;
    end;
end;