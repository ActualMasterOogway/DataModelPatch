local _ = game:GetService("VRService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("RobloxReplicatedStorage");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v10 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local l_game_EngineFeature_0 = game:GetEngineFeature("LoadStreamAnimationReplaceErrorsWithTelemetryFeature");
local l_game_EngineFeature_1 = game:GetEngineFeature("FaceAnimatorNotifyLODRecommendCameraInputDisable");
local v15 = game:DefineFastFlag("FacialAnimationStreamingClearTrackImprovementsV2", false);
game:DefineFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving", false);
game:DefineFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator", false);
game:DefineFastFlag("StopStreamTrackOnDeath", false);
game:DefineFastFlag("FacialAnimationStreamingClearAllConnectionsFix2", false);
game:DefineFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C", false);
local v16 = game:DefineFastFlag("FacialAnimationStreamingCheckPauseStateAfterEmote2", false);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v18 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v20 = game:DefineFastFlag("UXForCameraPerformanceEnabled", false);
local v21 = game:DefineFastFlag("DisableCameraOnLowspecAndroidCalls", false);
local v22 = game:DefineFastInt("UXForCameraPerformanceSessionDelay", 300);
local v23 = game:DefineFastInt("UXForCameraPerformanceDeviceDelay", 43200);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFStringUXForCameraPerformanceIXPLayerName);
local function v26() --[[ Line: 41 ]]
    return true;
end;
if v21 then
    v26 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
end;
local v27 = require(l_RobloxGui_0.Modules.FacialAnimationStreaming.FacialAnimationStreamingHeartbeatStats);
if not l_FaceAnimatorService_0 or not v18 then
    return;
else
    l_FaceAnimatorService_0.FlipHeadOrientation = true;
    local v28 = require(l_RobloxGui_0.Modules.Emote.EmoteHelper);
    local v29 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
    local v30 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
    local l_default_1 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
    local v32 = {
        CharacterAdded = "CharacterAdded", 
        CharacterRemoving = "CharacterRemoving", 
        CharacterDescendantAdded = "CharacterDescendantAdded", 
        CharacterDescendantRemoving = "CharacterDescendantRemoving", 
        AnimatorDataModelReady = "AnimatorDataModelReady", 
        PlayerEmoted = "PlayerEmoted", 
        PlayerChatted = "PlayerChatted", 
        EmoteFinished = "EmoteFinished", 
        PlayerDied = "PlayerDied"
    };
    local _ = v8:FormatByKey("Feature.FaceChat.Message.PlaceUnavailable");
    local v34 = false;
    local v35 = os.time();
    local v36 = {};
    local v37 = {};
    local v38 = {};
    local v39 = {};
    local v40 = {};
    local v41 = {};
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local function _(v47, v48) --[[ Line: 98 ]] --[[ Name: playerTrace ]]
        -- upvalues: v10 (copy)
        local v49 = "";
        local v50 = "";
        if v48 then
            if v48.UserId then
                v49 = tostring(v48.UserId);
            end;
            if v48.Name then
                v50 = v48.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", v47, v49, v50));
    end;
    local function _(v52, v53) --[[ Line: 112 ]] --[[ Name: clearConnection ]]
        -- upvalues: v39 (copy)
        if v39[v52.UserId] and v39[v52.UserId][v53] then
            v39[v52.UserId][v53]:Disconnect();
            v39[v52.UserId][v53] = nil;
        end;
    end;
    local function v60(v55) --[[ Line: 119 ]] --[[ Name: clearAllConnections ]]
        -- upvalues: v32 (copy), v39 (copy)
        if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
            for _, v57 in pairs(v32) do
                if v39[v55.UserId] and v39[v55.UserId][v57] then
                    v39[v55.UserId][v57]:Disconnect();
                    v39[v55.UserId][v57] = nil;
                end;
            end;
        else
            for _, v59 in ipairs(v32) do
                if v39[v55.UserId] and v39[v55.UserId][v59] then
                    v39[v55.UserId][v59]:Disconnect();
                    v39[v55.UserId][v59] = nil;
                end;
            end;
        end;
        v39[v55.UserId] = {};
    end;
    local function v64(v61) --[[ Line: 133 ]] --[[ Name: clearCharacterAnimations ]]
        -- upvalues: v10 (copy), v38 (copy), v15 (copy)
        local v62 = "";
        local v63 = "";
        if v61 then
            if v61.UserId then
                v62 = tostring(v61.UserId);
            end;
            if v61.Name then
                v63 = v61.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "clearCharacterAnimations", v62, v63));
        if v38[v61.UserId] then
            if v15 then
                if v38[v61.UserId].animationTrack then
                    v38[v61.UserId].animationTrack:Stop(0);
                    v38[v61.UserId].animationTrack = nil;
                end;
                if v38[v61.UserId].animation then
                    v38[v61.UserId].animation = nil;
                end;
            else
                if v38[v61.UserId].animation then
                    v38[v61.UserId].animation:Destroy();
                    v38[v61.UserId].animation = nil;
                end;
                if v38[v61.UserId].animationTrack then
                    v38[v61.UserId].animationTrack:Stop(0);
                    v38[v61.UserId].animationTrack:Destroy();
                    v38[v61.UserId].animationTrack = nil;
                end;
            end;
            v38[v61.UserId] = nil;
        end;
    end;
    local function v66(v65) --[[ Line: 160 ]] --[[ Name: getPlayerFaceControls ]]
        if v65 and v65.Character then
            return v65.Character:FindFirstChildWhichIsA("FaceControls", true);
        else
            return nil;
        end;
    end;
    local function v68(v67) --[[ Line: 168 ]] --[[ Name: getPlayerHumanoid ]]
        if v67.Character then
            return v67.Character:FindFirstChildOfClass("Humanoid");
        else
            return nil;
        end;
    end;
    local function v71(v69) --[[ Line: 176 ]] --[[ Name: getPlayerAnimator ]]
        local v70 = if v69.Character then v69.Character:FindFirstChildOfClass("Humanoid") else nil;
        if v70 then
            return v70:FindFirstChildOfClass("Animator");
        else
            return nil;
        end;
    end;
    local function _(v72) --[[ Line: 185 ]] --[[ Name: pauseStreamingAnimationForPlayer ]]
        -- upvalues: v38 (copy), v10 (copy)
        if v38[v72.UserId] and v38[v72.UserId].animationTrack then
            local v73 = "";
            local v74 = "";
            if v72 then
                if v72.UserId then
                    v73 = tostring(v72.UserId);
                end;
                if v72.Name then
                    v74 = v72.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v73, v74));
            v38[v72.UserId].animationTrack:AdjustWeight(0.1, 0.5);
        end;
    end;
    local function _(v76) --[[ Line: 196 ]] --[[ Name: resumeStreamingAnimationForPlayer ]]
        -- upvalues: v38 (copy), v10 (copy)
        if v38[v76.UserId] and v38[v76.UserId].animationTrack then
            local v77 = "";
            local v78 = "";
            if v76 then
                if v76.UserId then
                    v77 = tostring(v76.UserId);
                end;
                if v76.Name then
                    v78 = v76.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v77, v78));
            v38[v76.UserId].animationTrack:AdjustWeight(1, 0.5);
        end;
    end;
    local function _() --[[ Line: 203 ]] --[[ Name: updateStreamTrackStatus ]]
        -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy), v38 (copy), v10 (copy)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return;
        else
            if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                if v38[l_LocalPlayer_0.UserId] and v38[l_LocalPlayer_0.UserId].animationTrack then
                    local v81 = "";
                    local v82 = "";
                    if l_LocalPlayer_0 then
                        if l_LocalPlayer_0.UserId then
                            v81 = tostring(l_LocalPlayer_0.UserId);
                        end;
                        if l_LocalPlayer_0.Name then
                            v82 = l_LocalPlayer_0.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v81, v82));
                    v38[l_LocalPlayer_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                    return;
                end;
            elseif v38[l_LocalPlayer_0.UserId] and v38[l_LocalPlayer_0.UserId].animationTrack then
                local v83 = "";
                local v84 = "";
                if l_LocalPlayer_0 then
                    if l_LocalPlayer_0.UserId then
                        v83 = tostring(l_LocalPlayer_0.UserId);
                    end;
                    if l_LocalPlayer_0.Name then
                        v84 = l_LocalPlayer_0.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v83, v84));
                v38[l_LocalPlayer_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            return;
        end;
    end;
    local function v99(v86, v87, v88) --[[ Line: 217 ]] --[[ Name: handleEmote ]]
        -- upvalues: v10 (copy), v32 (copy), v39 (copy), v38 (copy), v28 (copy), v16 (copy), l_FaceAnimatorService_0 (copy)
        local v89 = string.format("handleEmote {isChatTriggered:%s}", (tostring(v88)));
        local v90 = "";
        local v91 = "";
        if v86 then
            if v86.UserId then
                v90 = tostring(v86.UserId);
            end;
            if v86.Name then
                v91 = v86.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", v89, v90, v91));
        if v87 then
            v89 = v32.EmoteFinished;
            if v39[v86.UserId] and v39[v86.UserId][v89] then
                v39[v86.UserId][v89]:Disconnect();
                v39[v86.UserId][v89] = nil;
            end;
            if v38[v86.UserId] and v38[v86.UserId].animationTrack then
                v89 = "";
                v90 = "";
                if v86 then
                    if v86.UserId then
                        v89 = tostring(v86.UserId);
                    end;
                    if v86.Name then
                        v90 = v86.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v89, v90));
                v38[v86.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            v39[v86.UserId][v32.EmoteFinished] = v28.createEmoteFinishEvent(v86, v87, v88):Connect(function() --[[ Line: 227 ]]
                -- upvalues: v86 (copy), v32 (ref), v39 (ref), v16 (ref), l_FaceAnimatorService_0 (ref), v38 (ref), v10 (ref)
                local l_v86_0 = v86;
                local l_EmoteFinished_0 = v32.EmoteFinished;
                if v39[l_v86_0.UserId] and v39[l_v86_0.UserId][l_EmoteFinished_0] then
                    v39[l_v86_0.UserId][l_EmoteFinished_0]:Disconnect();
                    v39[l_v86_0.UserId][l_EmoteFinished_0] = nil;
                end;
                if v16 then
                    if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                        l_EmoteFinished_0 = v86;
                        if v38[l_EmoteFinished_0.UserId] and v38[l_EmoteFinished_0.UserId].animationTrack then
                            local v94 = "";
                            local v95 = "";
                            if l_EmoteFinished_0 then
                                if l_EmoteFinished_0.UserId then
                                    v94 = tostring(l_EmoteFinished_0.UserId);
                                end;
                                if l_EmoteFinished_0.Name then
                                    v95 = l_EmoteFinished_0.Name;
                                end;
                            end;
                            v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v94, v95));
                            v38[l_EmoteFinished_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                            return;
                        end;
                    else
                        l_EmoteFinished_0 = v86;
                        if v38[l_EmoteFinished_0.UserId] and v38[l_EmoteFinished_0.UserId].animationTrack then
                            local v96 = "";
                            local v97 = "";
                            if l_EmoteFinished_0 then
                                if l_EmoteFinished_0.UserId then
                                    v96 = tostring(l_EmoteFinished_0.UserId);
                                end;
                                if l_EmoteFinished_0.Name then
                                    v97 = l_EmoteFinished_0.Name;
                                end;
                            end;
                            v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v96, v97));
                            v38[l_EmoteFinished_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                            return;
                        end;
                    end;
                else
                    l_v86_0 = v86;
                    if v38[l_v86_0.UserId] and v38[l_v86_0.UserId].animationTrack then
                        l_EmoteFinished_0 = "";
                        local v98 = "";
                        if l_v86_0 then
                            if l_v86_0.UserId then
                                l_EmoteFinished_0 = tostring(l_v86_0.UserId);
                            end;
                            if l_v86_0.Name then
                                v98 = l_v86_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", l_EmoteFinished_0, v98));
                        v38[l_v86_0.UserId].animationTrack:AdjustWeight(1, 0.5);
                    end;
                end;
            end);
        end;
    end;
    local function v104(v100, v101) --[[ Line: 246 ]] --[[ Name: onPlayerChatted ]]
        -- upvalues: v28 (copy), v99 (copy)
        if if v100.Character then v100.Character:FindFirstChildOfClass("Humanoid") else nil then
            local v102 = nil;
            if string.sub(v101, 1, 3) == "/e " then
                v102 = string.sub(v101, 4);
            elseif string.sub(v101, 1, 7) == "/emote " then
                v102 = string.sub(v101, 8);
            end;
            if v102 and v28.LegacyDefaultEmotes[v102] then
                wait(v28.EMOTE_LOOP_TRANSITION_WAIT_TIME);
                local v103 = v28.getAnyActiveDefaultChatTriggeredEmoteTrack(v100);
                if v103 then
                    v99(v100, v103, true);
                end;
            end;
        end;
    end;
    local function v119(v105, v106) --[[ Line: 269 ]] --[[ Name: onAnimatorAdded ]]
        -- upvalues: v38 (copy), v10 (copy), v32 (copy), v39 (copy), l_game_EngineFeature_0 (copy), l_FaceAnimatorService_0 (copy), l_Players_0 (copy), v40 (copy)
        if not v106 then
            return;
        elseif not v106.Parent or not v106.Parent:IsA("Humanoid") then
            return;
        elseif v38[v105.UserId] then
            local v107 = "";
            local v108 = "";
            if v105 then
                if v105.UserId then
                    v107 = tostring(v105.UserId);
                end;
                if v105.Name then
                    v108 = v105.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "onAnimatorAdded already done; skipping", v107, v108));
            return;
        else
            local l_AnimatorDataModelReady_0 = v32.AnimatorDataModelReady;
            if v39[v105.UserId] and v39[v105.UserId][l_AnimatorDataModelReady_0] then
                v39[v105.UserId][l_AnimatorDataModelReady_0]:Disconnect();
                v39[v105.UserId][l_AnimatorDataModelReady_0] = nil;
            end;
            l_AnimatorDataModelReady_0 = function() --[[ Line: 287 ]]
                -- upvalues: v106 (copy), v105 (copy), l_game_EngineFeature_0 (ref), v38 (ref), l_FaceAnimatorService_0 (ref), l_Players_0 (ref), v10 (ref), v40 (ref)
                local v110 = {
                    animation = Instance.new("TrackerStreamAnimation")
                };
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v110.animationTrack = v106:LoadStreamAnimationV2(v110.animation, v105);
                else
                    v110.animationTrack = v106:LoadStreamAnimation(v110.animation);
                end;
                if l_game_EngineFeature_0 and not v110.animationTrack then
                    return;
                else
                    v110.animationTrack.Priority = Enum.AnimationPriority.Idle;
                    v110.animationTrack:Play(0.1, 1);
                    v38[v105.UserId] = v110;
                    local v111 = l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled;
                    if v105 == l_Players_0.LocalPlayer and not v111 then
                        local l_v105_0 = v105;
                        if v38[l_v105_0.UserId] and v38[l_v105_0.UserId].animationTrack then
                            local v113 = "";
                            local v114 = "";
                            if l_v105_0 then
                                if l_v105_0.UserId then
                                    v113 = tostring(l_v105_0.UserId);
                                end;
                                if l_v105_0.Name then
                                    v114 = l_v105_0.Name;
                                end;
                            end;
                            v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v113, v114));
                            v38[l_v105_0.UserId].animationTrack:AdjustWeight(0.1, 0.5);
                        end;
                    end;
                    if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
                        v40[v105.UserId] = v106;
                    end;
                    return;
                end;
            end;
            if v106:IsDescendantOf(game) then
                l_AnimatorDataModelReady_0();
                return;
            else
                v39[v105.UserId][v32.AnimatorDataModelReady] = v106.AncestryChanged:Connect(function(_, _) --[[ Line: 323 ]]
                    -- upvalues: v106 (copy), v105 (copy), v32 (ref), v39 (ref), l_AnimatorDataModelReady_0 (copy)
                    if v106:IsDescendantOf(game) then
                        local l_v105_1 = v105;
                        local l_AnimatorDataModelReady_1 = v32.AnimatorDataModelReady;
                        if v39[l_v105_1.UserId] and v39[l_v105_1.UserId][l_AnimatorDataModelReady_1] then
                            v39[l_v105_1.UserId][l_AnimatorDataModelReady_1]:Disconnect();
                            v39[l_v105_1.UserId][l_AnimatorDataModelReady_1] = nil;
                        end;
                        l_AnimatorDataModelReady_0();
                    end;
                end);
                return;
            end;
        end;
    end;
    local function v125(v120, v121) --[[ Line: 334 ]] --[[ Name: onHumanoidAdded ]]
        -- upvalues: v32 (copy), v39 (copy), v99 (copy), v64 (copy)
        if not v121 then
            return;
        else
            local l_PlayerEmoted_0 = v32.PlayerEmoted;
            if v39[v120.UserId] and v39[v120.UserId][l_PlayerEmoted_0] then
                v39[v120.UserId][l_PlayerEmoted_0]:Disconnect();
                v39[v120.UserId][l_PlayerEmoted_0] = nil;
            end;
            v39[v120.UserId][v32.PlayerEmoted] = v121.EmoteTriggered:Connect(function(v123, v124) --[[ Line: 341 ]]
                -- upvalues: v99 (ref), v120 (copy)
                if v123 then
                    v99(v120, v124, false);
                end;
            end);
            if game:GetFastFlag("StopStreamTrackOnDeath") then
                l_PlayerEmoted_0 = v32.PlayerDied;
                if v39[v120.UserId] and v39[v120.UserId][l_PlayerEmoted_0] then
                    v39[v120.UserId][l_PlayerEmoted_0]:Disconnect();
                    v39[v120.UserId][l_PlayerEmoted_0] = nil;
                end;
                v39[v120.UserId][v32.PlayerDied] = v121.Died:Connect(function() --[[ Line: 350 ]]
                    -- upvalues: v64 (ref), v120 (copy)
                    v64(v120);
                end);
            end;
            return;
        end;
    end;
    local function v136(v126, v127) --[[ Line: 356 ]] --[[ Name: onFaceControlsAdded ]]
        -- upvalues: l_Players_0 (copy), v41 (copy), l_default_1 (copy), v10 (copy), l_FaceAnimatorService_0 (copy)
        assert(game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C"));
        if v126 ~= l_Players_0.LocalPlayer then
            return;
        elseif v41[v126.UserId] ~= nil and v127 == v41[v126.UserId] then
            return;
        else
            v41[v126.UserId] = v127;
            if v41[v126.UserId] then
                if l_default_1 and not l_default_1.localMuted then
                    local v128 = "";
                    local v129 = "";
                    if v126 then
                        if v126.UserId then
                            v128 = tostring(v126.UserId);
                        end;
                        if v126.Name then
                            v129 = v126.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> enabling A2C (Mic is ON)...", v128, v129));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = true;
                    return;
                else
                    local v130 = "";
                    local v131 = "";
                    if v126 then
                        if v126.UserId then
                            v130 = tostring(v126.UserId);
                        end;
                        if v126.Name then
                            v131 = v126.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls found -> won't enable A2C (Mic is MUTED)...", v130, v131));
                    return;
                end;
            elseif l_FaceAnimatorService_0.AudioAnimationEnabled then
                local v132 = "";
                local v133 = "";
                if v126 then
                    if v126.UserId then
                        v132 = tostring(v126.UserId);
                    end;
                    if v126.Name then
                        v133 = v126.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> disabling A2C...", v132, v133));
                l_FaceAnimatorService_0.AudioAnimationEnabled = false;
                return;
            else
                local v134 = "";
                local v135 = "";
                if v126 then
                    if v126.UserId then
                        v134 = tostring(v126.UserId);
                    end;
                    if v126.Name then
                        v135 = v126.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "FaceControls NOT found -> won't disable A2C (already is disabled)...", v134, v135));
                return;
            end;
        end;
    end;
    local function v139(v137, v138) --[[ Line: 391 ]] --[[ Name: onCharacterDescendantAdded ]]
        -- upvalues: v119 (copy), v125 (copy), v136 (copy), v66 (copy)
        if v138:IsDescendantOf(game) then
            if v138:IsA("Animator") then
                v119(v137, v138);
                return;
            elseif v138:IsA("Humanoid") then
                v125(v137, v138);
                return;
            elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and v138:IsA("MeshPart") and v138.Name == "Head" then
                v136(v137, v66(v137));
                return;
            elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and v138:IsA("FaceControls") then
                v136(v137, v138);
            end;
        end;
    end;
    local function v146(v140, v141) --[[ Line: 405 ]] --[[ Name: onCharacterDescendantRemoving ]]
        -- upvalues: v40 (copy), v32 (copy), v39 (copy), v64 (copy), v119 (copy), v136 (copy), v66 (copy)
        if v141:IsA("Animator") then
            if game:GetFastFlag("FacialAnimationStreamingValidateAnimatorBeforeRemoving") then
                if v141 == v40[v140.UserId] then
                    local l_AnimatorDataModelReady_2 = v32.AnimatorDataModelReady;
                    if v39[v140.UserId] and v39[v140.UserId][l_AnimatorDataModelReady_2] then
                        v39[v140.UserId][l_AnimatorDataModelReady_2]:Disconnect();
                        v39[v140.UserId][l_AnimatorDataModelReady_2] = nil;
                    end;
                    v64(v140);
                    v40[v140.UserId] = nil;
                    if game:GetFastFlag("FacialAnimationStreamingSearchForReplacementWhenRemovingAnimator") then
                        local v143 = if v140.Character then v140.Character:FindFirstChildOfClass("Humanoid") else nil;
                        l_AnimatorDataModelReady_2 = if v143 then v143:FindFirstChildOfClass("Animator") else nil;
                        if l_AnimatorDataModelReady_2 then
                            v119(v140, l_AnimatorDataModelReady_2);
                            return;
                        end;
                    end;
                end;
            else
                local l_AnimatorDataModelReady_3 = v32.AnimatorDataModelReady;
                if v39[v140.UserId] and v39[v140.UserId][l_AnimatorDataModelReady_3] then
                    v39[v140.UserId][l_AnimatorDataModelReady_3]:Disconnect();
                    v39[v140.UserId][l_AnimatorDataModelReady_3] = nil;
                end;
                v64(v140);
                return;
            end;
        elseif v141:IsA("Humanoid") then
            local l_PlayerEmoted_1 = v32.PlayerEmoted;
            if v39[v140.UserId] and v39[v140.UserId][l_PlayerEmoted_1] then
                v39[v140.UserId][l_PlayerEmoted_1]:Disconnect();
                v39[v140.UserId][l_PlayerEmoted_1] = nil;
            end;
            if game:GetFastFlag("StopStreamTrackOnDeath") then
                l_PlayerEmoted_1 = v32.PlayerDied;
                if v39[v140.UserId] and v39[v140.UserId][l_PlayerEmoted_1] then
                    v39[v140.UserId][l_PlayerEmoted_1]:Disconnect();
                    v39[v140.UserId][l_PlayerEmoted_1] = nil;
                    return;
                end;
            end;
        elseif game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") and (v141:IsA("MeshPart") and v141.Name == "Head" or v141:IsA("FaceControls")) then
            v136(v140, v66(v140));
        end;
    end;
    local function v153(v147, v148) --[[ Line: 436 ]] --[[ Name: onCharacterAdded ]]
        -- upvalues: v10 (copy), v32 (copy), v39 (copy), v139 (copy), v146 (copy), v136 (copy), v66 (copy), v125 (copy), v68 (copy), v119 (copy), v71 (copy)
        local v149 = "";
        local v150 = "";
        if v147 then
            if v147.UserId then
                v149 = tostring(v147.UserId);
            end;
            if v147.Name then
                v150 = v147.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player character added", v149, v150));
        v149 = v32.CharacterDescendantAdded;
        if v39[v147.UserId] and v39[v147.UserId][v149] then
            v39[v147.UserId][v149]:Disconnect();
            v39[v147.UserId][v149] = nil;
        end;
        v149 = v32.CharacterDescendantRemoving;
        if v39[v147.UserId] and v39[v147.UserId][v149] then
            v39[v147.UserId][v149]:Disconnect();
            v39[v147.UserId][v149] = nil;
        end;
        v39[v147.UserId][v32.CharacterDescendantAdded] = v148.DescendantAdded:Connect(function(v151) --[[ Line: 444 ]]
            -- upvalues: v139 (ref), v147 (copy)
            v139(v147, v151);
        end);
        v39[v147.UserId][v32.CharacterDescendantRemoving] = v148.DescendantRemoving:Connect(function(v152) --[[ Line: 447 ]]
            -- upvalues: v146 (ref), v147 (copy)
            v146(v147, v152);
        end);
        if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
            v136(v147, v66(v147));
        end;
        v125(v147, v68(v147));
        v119(v147, v71(v147));
    end;
    local function v158(v154, _) --[[ Line: 460 ]] --[[ Name: onCharacterRemoving ]]
        -- upvalues: v10 (copy), v32 (copy), v39 (copy), v60 (copy), v64 (copy)
        local v156 = "";
        local v157 = "";
        if v154 then
            if v154.UserId then
                v156 = tostring(v154.UserId);
            end;
            if v154.Name then
                v157 = v154.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player character removing", v156, v157));
        if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") then
            v156 = v32.CharacterDescendantAdded;
            if v39[v154.UserId] and v39[v154.UserId][v156] then
                v39[v154.UserId][v156]:Disconnect();
                v39[v154.UserId][v156] = nil;
            end;
            v156 = v32.CharacterDescendantRemoving;
            if v39[v154.UserId] and v39[v154.UserId][v156] then
                v39[v154.UserId][v156]:Disconnect();
                v39[v154.UserId][v156] = nil;
            end;
        else
            v60(v154);
        end;
        v64(v154);
    end;
    local function v169(v159) --[[ Line: 474 ]] --[[ Name: playerUpdate ]]
        -- upvalues: v10 (copy), v37 (copy), v38 (copy), v60 (copy), v153 (copy), v39 (copy), v32 (copy), v158 (copy), v104 (copy), v64 (copy)
        local v160 = "";
        local v161 = "";
        if v159 then
            if v159.UserId then
                v160 = tostring(v159.UserId);
            end;
            if v159.Name then
                v161 = v159.Name;
            end;
        end;
        v10:trace(string.format("%s {id: %s, name: %s}.", "Player update", v160, v161));
        v160 = v37[v159.UserId];
        if game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and v160 and v38[v159.UserId] then
            v161 = "";
            local v162 = "";
            if v159 then
                if v159.UserId then
                    v161 = tostring(v159.UserId);
                end;
                if v159.Name then
                    v162 = v159.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v161, v162));
            return;
        else
            v60(v159);
            if v160 then
                if not game:GetFastFlag("FacialAnimationStreamingClearAllConnectionsFix2") and v38[v159.UserId] then
                    v161 = "";
                    local v163 = "";
                    if v159 then
                        if v159.UserId then
                            v161 = tostring(v159.UserId);
                        end;
                        if v159.Name then
                            v163 = v159.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Player already setup", v161, v163));
                    return;
                else
                    v161 = "";
                    local v164 = "";
                    if v159 then
                        if v159.UserId then
                            v161 = tostring(v159.UserId);
                        end;
                        if v159.Name then
                            v164 = v159.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Player update - joined", v161, v164));
                    if v159.Character then
                        v153(v159, v159.Character);
                    end;
                    v39[v159.UserId][v32.CharacterAdded] = v159.CharacterAdded:Connect(function(v165) --[[ Line: 502 ]]
                        -- upvalues: v153 (ref), v159 (copy)
                        v153(v159, v165);
                    end);
                    v39[v159.UserId][v32.CharacterRemoving] = v159.CharacterRemoving:Connect(function(v166) --[[ Line: 505 ]]
                        -- upvalues: v158 (ref), v159 (copy)
                        v158(v159, v166);
                    end);
                    v39[v159.UserId][v32.PlayerChatted] = v159.Chatted:Connect(function(v167) --[[ Line: 508 ]]
                        -- upvalues: v104 (ref), v159 (copy)
                        v104(v159, v167);
                    end);
                    return;
                end;
            else
                v161 = "";
                local v168 = "";
                if v159 then
                    if v159.UserId then
                        v161 = tostring(v159.UserId);
                    end;
                    if v159.Name then
                        v168 = v159.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Player update - left", v161, v168));
                v64(v159);
                return;
            end;
        end;
    end;
    local function _(v170, v171) --[[ Line: 517 ]] --[[ Name: toggleMute ]]
        -- upvalues: v38 (copy)
        if v38[v170] and v38[v170].animationTrack then
            v38[v170].animationTrack:TogglePause(v171);
        end;
    end;
    local function v175() --[[ Line: 523 ]] --[[ Name: JoinAllExistingPlayers ]]
        -- upvalues: l_Players_0 (copy), v37 (copy), v169 (copy)
        for _, v174 in ipairs(l_Players_0:GetPlayers()) do
            v37[v174.UserId] = true;
            v169(v174);
        end;
    end;
    local function v202() --[[ Line: 530 ]] --[[ Name: ConnectStateChangeCallback ]]
        -- upvalues: l_default_1 (copy), l_Players_0 (copy), v38 (copy), v10 (copy), v36 (copy), v169 (copy), v37 (copy)
        local v176 = l_default_1:getService();
        local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
        l_default_1.participantsUpdate.Event:Connect(function(v178) --[[ Line: 534 ]]
            -- upvalues: l_UserId_0 (copy), v38 (ref)
            for v179, v180 in pairs(v178) do
                local v181 = tonumber(v179);
                if v181 ~= l_UserId_0 then
                    local l_isMutedLocally_0 = v180.isMutedLocally;
                    if v38[v181] and v38[v181].animationTrack then
                        v38[v181].animationTrack:TogglePause(l_isMutedLocally_0);
                    end;
                end;
            end;
        end);
        if v176 then
            v176.ParticipantsStateChanged:Connect(function(v183, v184, _) --[[ Line: 544 ]]
                -- upvalues: l_Players_0 (ref), v10 (ref), v36 (ref), v169 (ref)
                for _, v187 in ipairs(v183) do
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v187);
                    if l_l_Players_0_PlayerByUserId_0 then
                        local v189 = "";
                        local v190 = "";
                        if l_l_Players_0_PlayerByUserId_0 then
                            if l_l_Players_0_PlayerByUserId_0.UserId then
                                v189 = tostring(l_l_Players_0_PlayerByUserId_0.UserId);
                            end;
                            if l_l_Players_0_PlayerByUserId_0.Name then
                                v190 = l_l_Players_0_PlayerByUserId_0.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Player leaving chat", v189, v190));
                        v36[l_l_Players_0_PlayerByUserId_0.UserId] = nil;
                        v169(l_l_Players_0_PlayerByUserId_0);
                    end;
                end;
                for _, v192 in ipairs(v184) do
                    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v192);
                    if l_l_Players_0_PlayerByUserId_1 then
                        local v194 = "";
                        local v195 = "";
                        if l_l_Players_0_PlayerByUserId_1 then
                            if l_l_Players_0_PlayerByUserId_1.UserId then
                                v194 = tostring(l_l_Players_0_PlayerByUserId_1.UserId);
                            end;
                            if l_l_Players_0_PlayerByUserId_1.Name then
                                v195 = l_l_Players_0_PlayerByUserId_1.Name;
                            end;
                        end;
                        v10:trace(string.format("%s {id: %s, name: %s}.", "Player joining chat", v194, v195));
                        v36[l_l_Players_0_PlayerByUserId_1.UserId] = true;
                        v169(l_l_Players_0_PlayerByUserId_1);
                    end;
                end;
            end);
        else
            v10:trace("Could not find VoiceChatService");
        end;
        l_Players_0.PlayerRemoving:Connect(function(v196) --[[ Line: 568 ]]
            -- upvalues: v10 (ref), v37 (ref), v169 (ref)
            local v197 = "";
            local v198 = "";
            if v196 then
                if v196.UserId then
                    v197 = tostring(v196.UserId);
                end;
                if v196.Name then
                    v198 = v196.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player leaving game", v197, v198));
            v37[v196.UserId] = nil;
            v169(v196);
        end);
        l_Players_0.PlayerAdded:Connect(function(v199) --[[ Line: 574 ]]
            -- upvalues: v10 (ref), v37 (ref), v169 (ref)
            local v200 = "";
            local v201 = "";
            if v199 then
                if v199.UserId then
                    v200 = tostring(v199.UserId);
                end;
                if v199.Name then
                    v201 = v199.Name;
                end;
            end;
            v10:trace(string.format("%s {id: %s, name: %s}.", "Player joining game", v200, v201));
            v37[v199.UserId] = true;
            v169(v199);
        end);
    end;
    local function v203(v204) --[[ Line: 582 ]] --[[ Name: AttemptToShowCameraPerformanceToast ]]
        -- upvalues: v24 (copy), v9 (copy), v25 (copy), v35 (copy), v22 (copy), v203 (copy), l_AppStorageService_0 (copy), v23 (copy), v29 (copy), v30 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy)
        if v24() then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 585 ]]
                -- upvalues: v9 (ref), v25 (ref)
                return v9:GetLayerData(v25());
            end);
            if not l_status_0 then
                return;
            elseif not l_result_0 then
                return;
            elseif not l_result_0.UXForCameraPerformanceEnabled then
                return;
            end;
        end;
        local v207 = os.time() - v35;
        if not v204 and v207 < v22 then
            task.delay(v22 - v207, function() --[[ Line: 606 ]]
                -- upvalues: v203 (ref)
                v203(true);
            end);
            return;
        else
            local v208 = 0;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 614 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("CameraPerformanceUXUnixTimestamp");
            end);
            if l_status_1 then
                v208 = tonumber(l_result_1);
                if os.time() - v208 < v23 then
                    return;
                else
                    pcall(function() --[[ Line: 626 ]]
                        -- upvalues: l_AppStorageService_0 (ref), v208 (ref), v29 (ref), v30 (ref), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref)
                        l_AppStorageService_0:SetItem("CameraPerformanceUXUnixTimestamp", (tostring(v208)));
                        l_AppStorageService_0:Flush();
                        v29:showPrompt(v30.LODCameraRecommendDisable);
                        l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "UXForCameraPerformanceShown", {
                            userId = l_Players_0.LocalPlayer.UserId, 
                            pid = tostring(game.PlaceId)
                        });
                    end);
                    return;
                end;
            else
                return;
            end;
        end;
    end;
    InitializeVoiceChat = function() --[[ Line: 648 ]] --[[ Name: InitializeVoiceChat ]]
        -- upvalues: v175 (copy), v202 (copy), l_default_1 (copy), v10 (copy), v44 (ref), l_Players_0 (copy), l_FaceAnimatorService_0 (copy)
        local function v211() --[[ Line: 649 ]]
            -- upvalues: v175 (ref), v202 (ref)
            v175();
            v202();
        end;
        if l_default_1 then
            l_default_1:asyncInit():catch(function(_) --[[ Line: 655 ]]
                -- upvalues: v10 (ref)
                v10:trace("VoiceChat:asyncInit failed (possibly denied mic permission)");
            end):finally(v211);
            v44 = l_default_1.muteChanged.Event:connect(function(v213) --[[ Line: 660 ]]
                -- upvalues: l_Players_0 (ref), v10 (ref), l_FaceAnimatorService_0 (ref)
                if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
                    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                    local v215 = if l_LocalPlayer_1 and l_LocalPlayer_1.Character then l_LocalPlayer_1.Character:FindFirstChildWhichIsA("FaceControls", true) else nil;
                    v10:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(v213) .. " hasFaceControls=" .. tostring(v215 ~= nil));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = not v213 and v215 ~= nil;
                    return;
                else
                    v10:trace("Syncing audio processing with VoiceChat mute changed: muted=" .. tostring(v213));
                    l_FaceAnimatorService_0.AudioAnimationEnabled = not v213;
                    return;
                end;
            end);
            local v216 = false;
            if l_default_1.localMuted ~= nil then
                v10:trace("Syncing audio processing with VoiceChat mute status: muted=" .. tostring(l_default_1.localMuted));
                v216 = not l_default_1.localMuted;
            end;
            if game:GetFastFlag("FacialAnimationStreamingIfNoDynamicHeadDisableA2C") then
                local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                local v218 = if l_LocalPlayer_2 and l_LocalPlayer_2.Character then l_LocalPlayer_2.Character:FindFirstChildWhichIsA("FaceControls", true) else nil;
                v10:trace("Syncing audio processing with Dynamic Head status: hasFaceControls=" .. tostring(v218 ~= nil));
                v216 = v216 and v218 ~= nil;
            end;
            l_FaceAnimatorService_0.AudioAnimationEnabled = v216;
            return;
        else
            v175();
            v202();
            return;
        end;
    end;
    CleanupVoiceChat = function() --[[ Line: 689 ]] --[[ Name: CleanupVoiceChat ]]
        -- upvalues: v44 (ref)
        if v44 then
            v44:Disconnect();
            v44 = nil;
        end;
    end;
    InitializeFacialAnimationStreaming = function(v219) --[[ Line: 696 ]] --[[ Name: InitializeFacialAnimationStreaming ]]
        -- upvalues: v34 (ref), v42 (ref), l_FaceAnimatorService_0 (copy), v10 (copy), v29 (copy), v30 (copy), v21 (copy), v26 (ref), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v18 (copy), l_game_EngineFeature_1 (copy), v43 (ref), v20 (copy), v203 (copy), l_default_0 (copy), l_Enums_0 (copy), v27 (copy)
        if v34 then
            return;
        else
            v34 = true;
            v42 = l_FaceAnimatorService_0.TrackerError:Connect(function(v220) --[[ Line: 704 ]]
                -- upvalues: v10 (ref), v29 (ref), v30 (ref)
                local v221 = string.format("TrackerError: %s", (tostring(v220)));
                v10:trace(string.format("%s {id: %s, name: %s}.", v221, "", ""));
                if v220 == Enum.TrackerError.VideoNoPermission then
                    v29:showPrompt(v30.VideoNoPermission);
                    return;
                elseif v220 == Enum.TrackerError.VideoUnsupported then
                    v29:showPrompt(v30.VideoUnsupported);
                    return;
                elseif v220 == Enum.TrackerError.UnsupportedDevice then
                    v29:showPrompt(v30.UnsupportedDevice);
                    return;
                else
                    v29:showPrompt(v30.NotAvailable);
                    return;
                end;
            end);
            if v21 and not v26() then
                v10:trace("Camera is disabled for user and place");
                return;
            else
                if l_GetFFlagAvatarChatServiceEnabled_0() then
                    l_FaceAnimatorService_0:Init(v18:IsEnabled(v219, Enum.AvatarChatServiceFeature.UserVideo), v18:IsEnabled(v219, Enum.AvatarChatServiceFeature.UserAudio));
                end;
                if l_game_EngineFeature_1 then
                    v43 = l_FaceAnimatorService_0.TrackerPrompt:Connect(function(v222) --[[ Line: 730 ]]
                        -- upvalues: v10 (ref), v20 (ref), v203 (ref), v29 (ref), v30 (ref)
                        local v223 = string.format("TrackerPrompt: %s", (tostring(v222)));
                        v10:trace(string.format("%s {id: %s, name: %s}.", v223, "", ""));
                        if v222 == Enum.TrackerPromptEvent.LODCameraRecommendDisable then
                            if v20 then
                                v203();
                                return;
                            else
                                v29:showPrompt(v30.LODCameraRecommendDisable);
                            end;
                        end;
                    end);
                end;
                l_default_0:getCallState():andThen(function(v224) --[[ Line: 743 ]]
                    -- upvalues: v34 (ref), l_Enums_0 (ref), l_FaceAnimatorService_0 (ref), v27 (ref)
                    if not v34 then
                        return;
                    else
                        if v224.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v224.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                            l_FaceAnimatorService_0.VideoAnimationEnabled = v224.camEnabled;
                        else
                            l_FaceAnimatorService_0.VideoAnimationEnabled = false;
                        end;
                        InitializeVoiceChat();
                        v27.Initialize();
                        return;
                    end;
                end);
                return;
            end;
        end;
    end;
    CleanupFacialAnimationStreaming = function() --[[ Line: 765 ]] --[[ Name: CleanupFacialAnimationStreaming ]]
        -- upvalues: v34 (ref), v27 (copy), l_Players_0 (copy), v37 (copy), v169 (copy), v42 (ref), v45 (ref), v46 (ref), l_game_EngineFeature_1 (copy), v43 (ref)
        if not v34 then
            return;
        else
            v34 = false;
            CleanupVoiceChat();
            v27.Cleanup();
            for _, v226 in ipairs(l_Players_0:GetPlayers()) do
                v37[v226.UserId] = nil;
                v169(v226);
            end;
            if v42 then
                v42:Disconnect();
                v42 = nil;
            end;
            if v45 then
                v45:Disconnect();
                v45 = nil;
            end;
            if v46 then
                v46:Disconnect();
                v46 = nil;
            end;
            if l_game_EngineFeature_1 and v43 then
                v43:Disconnect();
                v43 = nil;
            end;
            return;
        end;
    end;
    local function v228(v227) --[[ Line: 803 ]] --[[ Name: updateWithServiceState ]]
        -- upvalues: v10 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v18 (copy)
        v10:trace(string.format("[updateWithServiceState] state: %s", (tostring(v227))));
        if l_GetFFlagAvatarChatServiceEnabled_0() then
            if (v18:IsEnabled(v227, Enum.AvatarChatServiceFeature.UserAudioEligible) or v18:IsEnabled(v227, Enum.AvatarChatServiceFeature.UserVideoEligible)) and v18:IsPlaceEnabled() then
                InitializeFacialAnimationStreaming(v227);
                return;
            else
                CleanupFacialAnimationStreaming();
                return;
            end;
        else
            CleanupFacialAnimationStreaming();
            return;
        end;
    end;
    v45 = l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ Line: 821 ]]
        -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy), v38 (copy), v10 (copy)
        local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_3 then
            return;
        else
            if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                if v38[l_LocalPlayer_3.UserId] and v38[l_LocalPlayer_3.UserId].animationTrack then
                    local v230 = "";
                    local v231 = "";
                    if l_LocalPlayer_3 then
                        if l_LocalPlayer_3.UserId then
                            v230 = tostring(l_LocalPlayer_3.UserId);
                        end;
                        if l_LocalPlayer_3.Name then
                            v231 = l_LocalPlayer_3.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v230, v231));
                    v38[l_LocalPlayer_3.UserId].animationTrack:AdjustWeight(1, 0.5);
                    return;
                end;
            elseif v38[l_LocalPlayer_3.UserId] and v38[l_LocalPlayer_3.UserId].animationTrack then
                local v232 = "";
                local v233 = "";
                if l_LocalPlayer_3 then
                    if l_LocalPlayer_3.UserId then
                        v232 = tostring(l_LocalPlayer_3.UserId);
                    end;
                    if l_LocalPlayer_3.Name then
                        v233 = l_LocalPlayer_3.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v232, v233));
                v38[l_LocalPlayer_3.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            return;
        end;
    end);
    v46 = l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 824 ]]
        -- upvalues: l_Players_0 (copy), l_FaceAnimatorService_0 (copy), v38 (copy), v10 (copy)
        local l_LocalPlayer_4 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_4 then
            return;
        else
            if l_FaceAnimatorService_0.AudioAnimationEnabled or l_FaceAnimatorService_0.VideoAnimationEnabled then
                if v38[l_LocalPlayer_4.UserId] and v38[l_LocalPlayer_4.UserId].animationTrack then
                    local v235 = "";
                    local v236 = "";
                    if l_LocalPlayer_4 then
                        if l_LocalPlayer_4.UserId then
                            v235 = tostring(l_LocalPlayer_4.UserId);
                        end;
                        if l_LocalPlayer_4.Name then
                            v236 = l_LocalPlayer_4.Name;
                        end;
                    end;
                    v10:trace(string.format("%s {id: %s, name: %s}.", "Resuming facial streaming animations...", v235, v236));
                    v38[l_LocalPlayer_4.UserId].animationTrack:AdjustWeight(1, 0.5);
                    return;
                end;
            elseif v38[l_LocalPlayer_4.UserId] and v38[l_LocalPlayer_4.UserId].animationTrack then
                local v237 = "";
                local v238 = "";
                if l_LocalPlayer_4 then
                    if l_LocalPlayer_4.UserId then
                        v237 = tostring(l_LocalPlayer_4.UserId);
                    end;
                    if l_LocalPlayer_4.Name then
                        v238 = l_LocalPlayer_4.Name;
                    end;
                end;
                v10:trace(string.format("%s {id: %s, name: %s}.", "Pausing facial streaming animations...", v237, v238));
                v38[l_LocalPlayer_4.UserId].animationTrack:AdjustWeight(0.1, 0.5);
            end;
            return;
        end;
    end);
    if l_GetFFlagAvatarChatServiceEnabled_0() then
        if v18.ClientFeaturesInitialized then
            v228(v18.ClientFeatures);
        else
            local v239 = nil;
            do
                local l_v239_0 = v239;
                l_v239_0 = v18:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 834 ]]
                    -- upvalues: v228 (copy), v18 (copy), l_v239_0 (ref)
                    v228(v18.ClientFeatures);
                    l_v239_0:Disconnect();
                end);
            end;
        end;
    end;
    return;
end;