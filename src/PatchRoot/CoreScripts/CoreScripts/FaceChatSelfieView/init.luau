debugPrint = function(__) --[[ Line: 29 ]] --[[ Name: debugPrint ]]

end;
local v1 = nil;
local v2 = nil;
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarJointUpgradeFeature");
local l_game_EngineFeature_1 = game:GetEngineFeature("AnimatorAndADFRefactor");
local l_game_EngineFeature_2 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_VRService_0 = game:GetService("VRService");
local v9 = game:DefineFastFlag("SelfViewCameraDefaultButtonInViewPort", false);
local v10 = game:DefineFastFlag("SelfViewLookUpHumanoidByType", false);
local v11 = game:DefineFastFlag("SelfViewHumanoidNilCheck", false);
local v12 = game:DefineFastFlag("SelfViewMoreNilChecks", false);
local v13 = game:DefineFastFlag("SelfViewAvoidErrorOnWrongFaceControlsParenting", false);
local v14 = game:DefineFastFlag("SelfViewUpdatedCamFraming", false);
local v15 = game:DefineFastFlag("SelfViewGetRidOfFalselyRenderedFaceDecal", false);
local v16 = game:DefineFastFlag("SelfViewRemoveVPFWhenClosed", false);
local v17 = game:DefineFastFlag("SelfViewTweaksPass", false);
local v18 = game:DefineFastFlag("InExperienceUpsellSelfViewFix", false);
local v19 = game:DefineFastFlag("RemoveVoiceJoiceDisconnectFix", false);
local v20 = game:DefineFastFlag("FixUpdateMicIconCallBeforeReady", false);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CharacterUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CharacterUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CFrameUtility;
local l_CoreGui_0 = game:GetService("CoreGui");
local __ = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_RunService_0 = game:GetService("RunService");
local v28 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v29 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride");
local l_Players_0 = game:GetService("Players");
local __ = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_SocialService_0 = game:GetService("SocialService");
local l_UserInputService_1 = game:GetService("UserInputService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v36 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_game_Service_1 = game:FindService("VideoCaptureService");
local v39 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v40 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v41 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v42 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v43 = UDim2.fromOffset(15, 25);
local v44 = UDim2.new(0.15, 0, 0.4, 0);
local v45 = Color3.new(1, 1, 1);
local __ = l_RunService_0:IsStudio();
local v47 = require(l_RobloxGui_0.Modules.SelfView.toggleSelfViewSignal);
local v48 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local v49 = require(l_RobloxGui_0.Modules.Settings.Analytics.VoiceAnalytics);
local v50 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local l_GetFFlagIrisGyroEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisGyroEnabled;
local v53 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v55 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v57 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v58 = game:DefineFastFlag("MockOpenSelfViewForCameraUser", false);
local v59 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
local v60 = nil;
local v61 = game:DefineFastInt("SelfViewTooltipLifetime", 10);
local v62 = require(l_RobloxGui_0.Modules.SelfView.mountSelfViewOnCloseTooltip);
local v63 = require(l_RobloxGui_0.Modules.SelfView.mountSelfViewOnOpenTooltip);
local v64 = nil;
local v65 = require(l_RobloxGui_0.Modules.Settings.isCamEnabledForUserAndPlace);
local v66 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
if v59() then
    v66 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
end;
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v68 = l_Images_0["icons/controls/video"];
local v69 = l_Images_0["icons/controls/videoOff"];
local v70 = l_Images_0["icons/controls/microphoneMute"];
local v71 = l_Images_0["icons/controls/microphone_small"];
local v72 = nil;
local v73 = 1.31;
local v74 = 0;
local v75 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v76 = require(l_RobloxGui_0.Modules.Flags.GetFFlagShowMicConnectingIconAndToast);
local v77 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics);
local l_GetFFlagEnableShowVoiceUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShowVoiceUI;
local v79 = nil;
if v77() then
    v79 = v49.new(l_RbxAnalyticsService_0, "LegacySelfView");
end;
local v80 = nil;
local v81 = nil;
local v82 = {};
local v83 = nil;
local v84 = nil;
local v85 = nil;
local v86 = nil;
local v87 = nil;
local v88 = nil;
local v89 = nil;
local v90 = nil;
local v91 = {};
local v92 = {};
local v93 = nil;
local v94 = nil;
local v95 = nil;
local v96 = nil;
local v97 = nil;
local v98 = nil;
local v99 = nil;
local v100 = Vector3.new(1.1720999479293823, 1.1811000108718872, 1.1577999591827393, 0);
local v101 = nil;
local v102 = nil;
local v103 = nil;
local v104 = nil;
local v105 = nil;
local v106 = nil;
local v107 = nil;
local v108 = nil;
local v109 = nil;
local v110 = nil;
local v111 = nil;
local v112 = false;
local v113 = nil;
local v114 = false;
local v115 = nil;
local v116 = false;
local v117 = 0;
local v118 = false;
local v119 = false;
local v120 = false;
local v121 = true;
local v122 = false;
local v123 = false;
local v124 = false;
local function v126() --[[ Line: 213 ]] --[[ Name: getShouldShowMicButton ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v124 (ref), v121 (ref), v57 (copy), v123 (ref)
    if l_GetFFlagEnableShowVoiceUI_0() then
        local l_voiceUIVisible_0 = l_default_0.voiceUIVisible;
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            return l_voiceUIVisible_0 and v124 and (not l_default_0:VoiceChatEnded() or v121);
        elseif v57() then
            return l_voiceUIVisible_0 and v123;
        else
            return l_voiceUIVisible_0 and v123 and not l_default_0:VoiceChatEnded();
        end;
    elseif l_GetFFlagJoinWithoutMicPermissions_0() then
        return v124 and (not l_default_0:VoiceChatEnded() or v121);
    elseif v57() then
        return v123;
    else
        return v123 and not l_default_0:VoiceChatEnded();
    end;
end;
local v127 = false;
local v128 = false;
local v129 = false;
local v130 = nil;
local v131 = false;
local v132 = nil;
local v133 = nil;
local v134 = nil;
local v135 = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "Torso", 
    "LeftFoot", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "RightFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "LeftHand", 
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightHand", 
    "RightLowerArm", 
    "RightUpperArm"
};
local v136 = {};
local __ = {
    "Head", 
    "Left Arm", 
    "Left Leg", 
    "Right Arm", 
    "Right Leg", 
    "Torso"
};
local v138 = {
    Accessory = "Accessory", 
    Animator = "Animator", 
    Attachment = "Attachment", 
    AnimationConstraint = l_game_EngineFeature_0 and "AnimationConstraint" or nil, 
    BallSocketConstraint = l_game_EngineFeature_0 and "BallSocketConstraint" or nil, 
    BodyColors = "BodyColors", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    FaceControls = "FaceControls", 
    Humanoid = "Humanoid", 
    HumanoidDescription = "HumanoidDescription", 
    MeshPart = "MeshPart", 
    Motor6D = "Motor6D", 
    NumberValue = "NumberValue", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    StringValue = "StringValue", 
    SurfaceAppearance = "SurfaceAppearance", 
    Vector3Value = "Vector3Value", 
    WrapTarget = "WrapTarget", 
    Weld = "Weld", 
    WrapLayer = "WrapLayer", 
    WeldConstraint = "WeldConstraint", 
    AccessoryWeld = "AccessoryWeld", 
    PackageLink = "PackageLink", 
    Folder = "Folder", 
    RigidConstraint = "RigidConstraint"
};
local v139 = {
    Accessory = "Accessory", 
    CharacterMesh = "CharacterMesh", 
    Decal = "Decal", 
    MeshPart = "MeshPart", 
    Pants = "Pants", 
    Part = "Part", 
    Shirt = "Shirt", 
    ShirtGraphic = "ShirtGraphic", 
    SpecialMesh = "SpecialMesh", 
    SurfaceAppearance = "SurfaceAppearance"
};
v40:trace("Self View 08-13-2024__1!!");
local v140 = {};
local v141 = {
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
getShouldDisplaySelfieView = function() --[[ Line: 348 ]] --[[ Name: getShouldDisplaySelfieView ]]
    -- upvalues: v58 (copy), l_AppStorageService_0 (copy)
    local v142 = false;
    if v58 then
        return true;
    else
        pcall(function() --[[ Line: 356 ]]
            -- upvalues: l_AppStorageService_0 (ref), v142 (ref)
            if l_AppStorageService_0:GetItem("ShowSelfieViewForCameraUser") == "true" then
                v142 = true;
            end;
        end);
        return v142;
    end;
end;
setSelfieViewDisplayInAppStorage = function(v143) --[[ Line: 366 ]] --[[ Name: setSelfieViewDisplayInAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    pcall(function() --[[ Line: 368 ]]
        -- upvalues: l_AppStorageService_0 (ref), v143 (copy)
        l_AppStorageService_0:SetItem("ShowSelfieViewForCameraUser", v143 and "true" or "false");
    end);
end;
shouldDisplaySelfViewTooltip = function(v144) --[[ Line: 373 ]] --[[ Name: shouldDisplaySelfViewTooltip ]]
    -- upvalues: v57 (copy), v65 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v108 (ref), v58 (copy), l_AppStorageService_0 (copy)
    if not v57() or not v65() then
        return false;
    elseif l_GetFFlagEnableShowVoiceUI_0() and not v108 then
        return false;
    else
        local v145 = false;
        if v58 then
            return true;
        else
            pcall(function() --[[ Line: 390 ]]
                -- upvalues: v145 (ref), l_AppStorageService_0 (ref), v144 (copy)
                v145 = l_AppStorageService_0:GetItem(v144) == "true";
            end);
            return v145;
        end;
    end;
end;
displaySelfieViewByDefault = function() --[[ Line: 396 ]] --[[ Name: displaySelfieViewByDefault ]]
    -- upvalues: v57 (copy), v65 (copy), v60 (ref)
    if v57() and v65() and getShouldDisplaySelfieView() and v60 ~= nil then
        v60(true);
    end;
end;
getRelativePosition = function(v146) --[[ Line: 407 ]] --[[ Name: getRelativePosition ]]
    if not v146.Parent then
        return v146.Size;
    else
        local l_AbsoluteSize_0 = v146.Parent.AbsoluteSize;
        return UDim2.new(v146.AbsolutePosition.X / l_AbsoluteSize_0.X, 0, v146.AbsolutePosition.Y / l_AbsoluteSize_0.Y, 0);
    end;
end;
getRelativeSize = function(v148) --[[ Line: 415 ]] --[[ Name: getRelativeSize ]]
    if not v148.Parent then
        return v148.Size;
    else
        local l_AbsoluteSize_1 = v148.Parent.AbsoluteSize;
        debugPrint("uiObject.AbsoluteSize.X:" .. tostring(v148.AbsoluteSize.X) .. ",uiObject.AbsoluteSize.Y:" .. tostring(v148.AbsoluteSize.Y) .. ",screenSize.X:" .. tostring(l_AbsoluteSize_1.X) .. ",screenSize.Y:" .. tostring(l_AbsoluteSize_1.Y));
        return UDim2.new(v148.AbsoluteSize.X / l_AbsoluteSize_1.X, 0, v148.AbsoluteSize.Y / l_AbsoluteSize_1.Y, 0);
    end;
end;
startSelfViewSession = function() --[[ Line: 433 ]] --[[ Name: startSelfViewSession ]]
    -- upvalues: v50 (copy), v107 (ref), v39 (copy)
    v50.setSelfViewIsOpenAndVisible(true);
    local v150 = getRelativePosition(v107);
    local v151 = getRelativeSize(v107);
    v39:reportSelfViewSessionStarted(math.floor(v107.AbsolutePosition.X), math.floor(v107.AbsolutePosition.Y), math.floor(v107.AbsoluteSize.X), math.floor(v107.AbsoluteSize.Y), v150.X, v150.Y, v151.X, v151.Y);
    debugPrint("selfViewPublicApi.getSelfViewIsOpenAndVisible(): " .. tostring(v50.getSelfViewIsOpenAndVisible()));
end;
stopSelfViewSession = function() --[[ Line: 452 ]] --[[ Name: stopSelfViewSession ]]
    -- upvalues: v50 (copy), v39 (copy)
    v50.setSelfViewIsOpenAndVisible(false);
    v39:reportSelfViewSessionStopped();
    debugPrint("selfViewPublicApi.getSelfViewIsOpenAndVisible(): " .. tostring(v50.getSelfViewIsOpenAndVisible()));
end;
getShouldBeEnabledCoreGuiSetting = function() --[[ Line: 460 ]] --[[ Name: getShouldBeEnabledCoreGuiSetting ]]
    return true;
end;
updateSelfViewButtonVisibility = function() --[[ Line: 465 ]] --[[ Name: updateSelfViewButtonVisibility ]]
    -- upvalues: v55 (copy), v65 (copy), v122 (ref), v126 (copy), v107 (ref)
    local v152 = 0;
    if v55() then
        if v65() then
            v152 = v152 + 1;
        end;
    elseif v122 then
        v152 = v152 + 1;
    end;
    if v126() then
        v152 = v152 + 1;
    end;
    if v107 ~= nil then
        local l_v107_FirstChild_0 = v107:FindFirstChild("MicButton", true);
        local l_v107_FirstChild_1 = v107:FindFirstChild("CamButton", true);
        local v155 = v152 == 2 and 0.5 or 1;
        if l_v107_FirstChild_0 then
            l_v107_FirstChild_0.Size = UDim2.new(v155, -4, 1, -4);
            l_v107_FirstChild_0.Visible = v126();
        end;
        if l_v107_FirstChild_1 then
            l_v107_FirstChild_1.Size = UDim2.new(v155, -4, 1, -4);
            local l_v122_0 = v122;
            if v55() then
                l_v122_0 = v65();
            end;
            l_v107_FirstChild_1.Visible = l_v122_0;
        end;
    end;
end;
local v157 = {};
if game:GetEngineFeature("VoiceChatSupported") then
    v157 = {
        [Enum.VoiceChatState.Joining] = l_default_0.VOICE_STATE.CONNECTING, 
        [Enum.VoiceChatState.JoiningRetry] = l_default_0.VOICE_STATE.CONNECTING, 
        [Enum.VoiceChatState.Joined] = l_default_0.VOICE_STATE.MUTED, 
        [Enum.VoiceChatState.Leaving] = l_default_0.VOICE_STATE.MUTED, 
        [Enum.VoiceChatState.Failed] = l_default_0.VOICE_STATE.ERROR
    };
end;
initVoiceChatServiceManager = function() --[[ Line: 519 ]] --[[ Name: initVoiceChatServiceManager ]]
    -- upvalues: l_default_0 (copy), v57 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v109 (ref), v70 (copy), v71 (copy), l_RunService_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v124 (ref), v18 (copy), v123 (ref), v121 (ref), v157 (ref), v76 (copy), l_Players_0 (copy), v108 (ref), v75 (copy), v40 (copy)
    local l_MUTED_0 = l_default_0.VOICE_STATE.MUTED;
    if v57() then
        l_MUTED_0 = l_default_0.VOICE_STATE.CONNECTING;
    end;
    local v159 = 0;
    local function v164(v160, v161) --[[ Line: 528 ]] --[[ Name: updateMicIcon ]]
        -- upvalues: l_MUTED_0 (ref), v159 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v109 (ref), l_default_0 (ref), v70 (ref), v71 (ref)
        if v160 == l_MUTED_0 and v161 == v159 then
            return;
        else
            l_MUTED_0 = v160;
            v159 = v161;
            if l_GetFFlagEnableShowVoiceUI_0() then
                if v109 then
                    if v160 == l_default_0.VOICE_STATE.MUTED then
                        v109.Size = UDim2.fromOffset(32, 32);
                        v109.Image = v70.Image;
                        if v109.ImageRectOffset ~= v70.ImageRectOffset then
                            v109.ImageRectOffset = v70.ImageRectOffset;
                        end;
                        v109.ImageRectSize = v70.ImageRectSize;
                    else
                        local v162 = l_default_0:VoiceStateToIcon(v160, v161, "New");
                        v109.Size = UDim2.fromOffset(16, 20);
                        v109.Image = v162;
                        v109.ImageRectOffset = Vector2.new(0, 0);
                        v109.ImageRectSize = Vector2.new(0, 0);
                    end;
                    v109.Position = UDim2.new(0.5, 0, 0.5, 0);
                    if v160 == l_default_0.VOICE_STATE.INACTIVE then
                        v109.Size = UDim2.fromOffset(19, 19);
                        v109.Image = v71.Image;
                        v109.ImageRectOffset = v71.ImageRectOffset;
                        v109.ImageRectSize = v71.ImageRectSize;
                        return;
                    elseif v160 == l_default_0.VOICE_STATE.TALKING then
                        v109.Position = UDim2.new(0.5, 0, 0.5, -1);
                        return;
                    end;
                end;
            else
                if v160 == l_default_0.VOICE_STATE.MUTED then
                    v109.Size = UDim2.fromOffset(32, 32);
                    v109.Image = v70.Image;
                    if v109.ImageRectOffset ~= v70.ImageRectOffset then
                        v109.ImageRectOffset = v70.ImageRectOffset;
                    end;
                    v109.ImageRectSize = v70.ImageRectSize;
                else
                    local v163 = l_default_0:VoiceStateToIcon(v160, v161, "New");
                    v109.Size = UDim2.fromOffset(16, 20);
                    v109.Image = v163;
                    v109.ImageRectOffset = Vector2.new(0, 0);
                    v109.ImageRectSize = Vector2.new(0, 0);
                end;
                v109.Position = UDim2.new(0.5, 0, 0.5, 0);
                if v160 == l_default_0.VOICE_STATE.INACTIVE then
                    v109.Size = UDim2.fromOffset(19, 19);
                    v109.Image = v71.Image;
                    v109.ImageRectOffset = v71.ImageRectOffset;
                    v109.ImageRectSize = v71.ImageRectSize;
                    return;
                elseif v160 == l_default_0.VOICE_STATE.TALKING then
                    v109.Position = UDim2.new(0.5, 0, 0.5, -1);
                end;
            end;
            return;
        end;
    end;
    local v165 = false;
    local function v167(v166) --[[ Line: 594 ]] --[[ Name: updateVoiceIndicatorRenderStepped ]]
        -- upvalues: v165 (ref), l_RunService_0 (ref), v164 (copy), l_MUTED_0 (ref)
        if v166 then
            if v165 then
                l_RunService_0:UnbindFromRenderStep("SelfViewVoiceIndicatorRenderStepped");
                v165 = false;
                return;
            end;
        elseif not v165 then
            l_RunService_0:BindToRenderStep("SelfViewVoiceIndicatorRenderStepped", Enum.RenderPriority.First.Value + 1, function() --[[ Line: 606 ]]
                -- upvalues: v164 (ref), l_MUTED_0 (ref)
                v164(l_MUTED_0, math.random());
            end);
            v165 = true;
        end;
    end;
    l_default_0.talkingChanged.Event:Connect(function(v168) --[[ Line: 615 ]]
        -- upvalues: v164 (copy), l_default_0 (ref), v159 (ref)
        if v168 then
            v164(l_default_0.VOICE_STATE.TALKING, v159);
            return;
        else
            v164(l_default_0.VOICE_STATE.INACTIVE, v159);
            return;
        end;
    end);
    l_default_0.muteChanged.Event:Connect(function(v169) --[[ Line: 623 ]]
        -- upvalues: v167 (copy), l_default_0 (ref), v164 (copy), v159 (ref)
        v167(v169);
        debugPrint("Self View: VoiceChatServiceManager.muteChanged.Event, muted: " .. tostring(v169));
        local v170 = v169 and l_default_0.VOICE_STATE.MUTED or l_default_0.VOICE_STATE.INACTIVE;
        v164(v170, v159);
    end);
    l_default_0:asyncInit():andThen(function() --[[ Line: 632 ]]
        -- upvalues: l_default_0 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v124 (ref), v18 (ref), v123 (ref), v121 (ref), v167 (copy), v164 (copy), v159 (ref), v157 (ref), v76 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), l_Players_0 (ref), v108 (ref)
        local v171 = l_default_0:getService();
        if v171 then
            if l_GetFFlagJoinWithoutMicPermissions_0() then
                v124 = true;
            end;
            displaySelfieViewByDefault();
            if v18 then
                v123 = true;
                local l_localMuted_0 = l_default_0.localMuted;
                if l_localMuted_0 ~= nil then
                    v121 = false;
                    v167(l_localMuted_0);
                    v164(if l_localMuted_0 then l_default_0.VOICE_STATE.MUTED else l_default_0.VOICE_STATE.INACTIVE, v159);
                    updateSelfViewButtonVisibility();
                end;
            end;
            v171.StateChanged:Connect(function(__, v174) --[[ Line: 655 ]]
                -- upvalues: v157 (ref), v76 (ref), l_default_0 (ref), v121 (ref), v164 (ref), v159 (ref)
                local v175 = v157[v174];
                if v76() then
                    v175 = l_default_0:GetVoiceStateFromEnum(v174);
                end;
                if v175 then
                    if v76() and not (v175 == l_default_0.VOICE_STATE.CONNECTING) and v121 then
                        v121 = false;
                    end;
                    v164(v175, v159);
                    return;
                else
                    if v174 == Enum.VoiceChatState.Ended then
                        updateSelfViewButtonVisibility();
                    end;
                    return;
                end;
            end);
            if l_GetFFlagEnableShowVoiceUI_0() then
                l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 674 ]]
                    -- upvalues: l_Players_0 (ref)
                    updateSelfViewButtonVisibility();
                    ReInit(l_Players_0.LocalPlayer);
                end);
                l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 678 ]]
                    -- upvalues: v108 (ref), l_Players_0 (ref)
                    updateSelfViewButtonVisibility();
                    if v108 then
                        v108:Destroy();
                    end;
                    v108 = nil;
                    ReInit(l_Players_0.LocalPlayer);
                end);
            end;
        end;
    end):catch(function() --[[ Line: 689 ]]
        -- upvalues: v75 (ref), v40 (ref)
        if v75() then
            v40:warning("Failed to init VoiceChatServiceManager");
        end;
    end);
end;
local v176 = false;
getPermissions = function() --[[ Line: 699 ]] --[[ Name: getPermissions ]]
    -- upvalues: v40 (copy), v122 (ref), v123 (ref), v176 (ref), v48 (copy)
    v40:trace("Self View: getPermissions()");
    v48(function(v177) --[[ Line: 702 ]]
        -- upvalues: v122 (ref), v123 (ref), v176 (ref)
        v122 = v177.hasCameraPermissions;
        v123 = v177.hasMicPermissions;
        updateSelfViewButtonVisibility();
        if v123 and not v176 then
            initVoiceChatServiceManager();
            v176 = true;
        end;
    end, nil, nil, "FaceChatSelfieView.getPermissions");
end;
getMicPermission = function() --[[ Line: 716 ]] --[[ Name: getMicPermission ]]
    -- upvalues: v123 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v176 (ref), v48 (copy), l_default_1 (copy)
    v48(function(v178) --[[ Line: 717 ]]
        -- upvalues: v123 (ref), l_GetFFlagJoinWithoutMicPermissions_0 (ref), v176 (ref)
        v123 = v178.hasMicPermissions;
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if not v176 then
                initVoiceChatServiceManager();
                v176 = true;
                return;
            end;
        elseif v123 and not v176 then
            initVoiceChatServiceManager();
            v176 = true;
        end;
    end, {
        l_default_1.Permissions.MICROPHONE_ACCESS
    }, nil, "FaceChatSelfieView.getMicPermission");
end;
getCameraPermissionWithoutRequest = function() --[[ Line: 740 ]] --[[ Name: getCameraPermissionWithoutRequest ]]
    -- upvalues: v122 (ref), v48 (copy), l_default_1 (copy)
    v48(function(v179) --[[ Line: 741 ]]
        -- upvalues: v122 (ref)
        v122 = v179.hasCameraPermissions;
    end, {
        l_default_1.Permissions.CAMERA_ACCESS
    }, true);
end;
local function __(v180, v181) --[[ Line: 749 ]] --[[ Name: removeChild ]]
    local l_v180_FirstChild_0 = v180:FindFirstChild(v181);
    if l_v180_FirstChild_0 then
        l_v180_FirstChild_0:Destroy();
    end;
end;
setCloneDirty = function(v184) --[[ Line: 756 ]] --[[ Name: setCloneDirty ]]
    -- upvalues: v74 (ref)
    if v184 then
        v74 = 0.35;
        return;
    else
        v74 = 0;
        return;
    end;
end;
local v185 = {};
local v186 = false;
local __ = function() --[[ Line: 768 ]] --[[ Name: disconnectListeners ]]
    -- upvalues: v185 (ref)
    for __, v188 in v185 do
        v188:Disconnect();
    end;
    v185 = {};
end;
constrainTargetPositionToScreen = function(v190, v191, v192) --[[ Line: 775 ]] --[[ Name: constrainTargetPositionToScreen ]]
    if v190 == nil then
        return;
    else
        local v193 = {
            X = v192.X, 
            Y = v192.Y
        };
        v193.X = math.min(v193.X, v191.X - 3 - v190.AbsoluteSize.X);
        v193.Y = math.min(v193.Y, v191.Y - 3 - v190.AbsoluteSize.Y);
        v193.X = math.max(3, v193.X);
        v193.Y = math.max(3, v193.Y);
        return UDim2.fromOffset(v193.X, v193.Y);
    end;
end;
local function v201(v194, v195, v196, v197) --[[ Line: 793 ]] --[[ Name: processDrag ]]
    if not v194.Parent then
        return;
    else
        local v198 = v195 - v196;
        local v199 = {
            X = (v198 + v197).X, 
            Y = (v198 + v197).Y
        };
        local l_AbsoluteSize_2 = v194.Parent.AbsoluteSize;
        v194.Position = constrainTargetPositionToScreen(v194, l_AbsoluteSize_2, v199);
        return;
    end;
end;
local function __() --[[ Line: 808 ]] --[[ Name: mouseEntered ]]
    -- upvalues: l_VRService_0 (copy), v120 (ref), v28 (copy), v29 (copy)
    if not l_VRService_0.VREnabled then
        v120 = true;
        v28.push(v29, Enum.OverrideMouseIconBehavior.ForceShow);
    end;
end;
local function __() --[[ Line: 815 ]] --[[ Name: mouseLeft ]]
    -- upvalues: v120 (ref), v28 (copy), v29 (copy)
    if v120 then
        v120 = false;
        v28.pop(v29);
    end;
end;
local function v223(v204, v205) --[[ Line: 823 ]] --[[ Name: inputBegan ]]
    -- upvalues: v186 (ref), v185 (ref), l_UserInputService_1 (copy), v201 (copy), l_AppStorageService_0 (copy)
    local l_UserInputType_0 = v205.UserInputType;
    if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
        return;
    elseif v186 then
        return;
    else
        v186 = true;
        local l_Position_0 = v205.Position;
        local v208 = Vector3.new(v204.AbsolutePosition.X, v204.AbsolutePosition.Y, 0);
        for __, v210 in v185 do
            v210:Disconnect();
        end;
        v185 = {};
        local v213 = l_UserInputService_1.InputChanged:Connect(function(v211) --[[ Line: 840 ]]
            -- upvalues: v186 (ref), v204 (copy), v205 (copy), v201 (ref), l_Position_0 (copy), v208 (copy)
            if not v186 then
                return;
            else
                v204.AnchorPoint = Vector2.new(0, 0);
                local l_UserInputType_1 = v211.UserInputType;
                if l_UserInputType_1 == Enum.UserInputType.Touch and v211 ~= v205 then
                    return;
                elseif l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                    return;
                elseif v211.UserInputState ~= Enum.UserInputState.Change then
                    return;
                else
                    v201(v204, v211.Position, l_Position_0, v208);
                    return;
                end;
            end;
        end);
        table.insert(v185, v213);
        local v219 = l_UserInputService_1.InputEnded:Connect(function(v214) --[[ Line: 870 ]]
            -- upvalues: v186 (ref), v185 (ref), v204 (copy), l_AppStorageService_0 (ref)
            local l_UserInputType_2 = v214.UserInputType;
            if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                return;
            else
                v186 = false;
                for __, v217 in v185 do
                    v217:Disconnect();
                end;
                v185 = {};
                v204.Position = getRelativePosition(v204);
                local v218 = v204.AbsolutePosition.X .. "," .. v204.AbsolutePosition.Y;
                l_AppStorageService_0:SetItem("SelfViewPosition", v218);
                return;
            end;
        end);
        table.insert(v185, v219);
        local v222 = l_UserInputService_1.WindowFocusReleased:Connect(function() --[[ Line: 886 ]]
            -- upvalues: v185 (ref)
            for __, v221 in v185 do
                v221:Disconnect();
            end;
            v185 = {};
        end);
        table.insert(v185, v222);
        return;
    end;
end;
createCloneAnchor = function() --[[ Line: 893 ]] --[[ Name: createCloneAnchor ]]
    -- upvalues: v101 (ref), v97 (ref)
    if v101 ~= nil then
        v101:Destroy();
        v101 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v97;
    v101 = l_WorldModel_0;
end;
connectToScreenOrientationChange = function() --[[ Line: 905 ]] --[[ Name: connectToScreenOrientationChange ]]
    -- upvalues: l_Players_0 (copy), v88 (ref), v107 (ref)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    if not l_LocalPlayer_0 then
        return;
    else
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        while not l_PlayerGui_0 do
            l_LocalPlayer_0.ChildAdded:wait();
            l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        end;
        v88 = l_PlayerGui_0:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 923 ]]
            -- upvalues: v107 (ref)
            if v107 and v107.Parent then
                local l_AbsoluteSize_3 = v107.Parent.AbsoluteSize;
                local v228 = Vector3.new(v107.AbsolutePosition.X, v107.AbsolutePosition.Y, 0);
                v107.Position = constrainTargetPositionToScreen(v107, l_AbsoluteSize_3, v228);
                v107.Position = getRelativePosition(v107);
            end;
        end);
        return;
    end;
end;
clearObserver = function(v229) --[[ Line: 933 ]] --[[ Name: clearObserver ]]
    -- upvalues: v140 (copy)
    if v140[v229] then
        v140[v229]:Disconnect();
        v140[v229] = nil;
    end;
end;
local function __() --[[ Line: 940 ]] --[[ Name: clearAllObservers ]]
    -- upvalues: v140 (copy)
    for v230 in v140 do
        clearObserver(v230);
    end;
end;
clearCloneCharacter = function() --[[ Line: 946 ]] --[[ Name: clearCloneCharacter ]]
    -- upvalues: v102 (ref), v101 (ref)
    if v102 then
        v102:Destroy();
        v102 = nil;
    end;
    if v101 == nil then
        return;
    else
        local l_SelfAvatar_0 = v101:FindFirstChild("SelfAvatar");
        if l_SelfAvatar_0 then
            l_SelfAvatar_0:Destroy();
        end;
        createCloneAnchor();
        return;
    end;
end;
clearClone = function() --[[ Line: 964 ]] --[[ Name: clearClone ]]
    -- upvalues: v141 (copy), v83 (ref), v84 (ref), v85 (ref), v86 (ref), v87 (ref), v113 (ref), v96 (ref), v90 (ref), v91 (ref)
    debugPrint("Self View: clearClone()");
    stopRenderStepped();
    clearObserver(v141.AnimationPlayed);
    clearObserver(v141.AnimationPlayedCoreScript);
    if v83 then
        v83:Disconnect();
        v83 = nil;
    end;
    if v84 then
        v84:Disconnect();
        v84 = nil;
    end;
    if v85 then
        v85:Disconnect();
        v85 = nil;
    end;
    if v86 then
        v86:Disconnect();
        v86 = nil;
    end;
    if v87 then
        v87:Disconnect();
        v87 = nil;
    end;
    v113 = nil;
    v96 = nil;
    v90 = nil;
    v91 = {};
    clearCloneCharacter();
end;
clearViewportFrame = function() --[[ Line: 1003 ]] --[[ Name: clearViewportFrame ]]
    -- upvalues: v97 (ref), v99 (ref)
    if v97 then
        v97:Destroy();
    end;
    if v99 then
        v99:Destroy();
    end;
end;
local function v235(v233) --[[ Line: 1012 ]] --[[ Name: setIsOpen ]]
    -- upvalues: v112 (ref), l_Players_0 (copy), v103 (ref), v93 (ref), v94 (ref), v140 (copy), v141 (copy), v88 (ref), v19 (copy), v89 (ref), v111 (ref), v16 (copy)
    debugPrint("Self View: setIsOpen(): " .. tostring(v233));
    v112 = v233;
    setSelfieViewDisplayInAppStorage(v233);
    if v112 then
        ReInit(l_Players_0.LocalPlayer);
        return;
    else
        v103 = nil;
        v93 = nil;
        v94 = nil;
        for v234 in v140 do
            clearObserver(v234);
        end;
        clearObserver(v141.CharacterAdded);
        clearObserver(v141.CharacterRemoving);
        clearClone();
        if v88 then
            v88:Disconnect();
            v88 = nil;
        end;
        if not v19 and v89 then
            v89:Disconnect();
            v89 = nil;
        end;
        prepMicAndCamPropertyChangedSignalHandler();
        v111.Visible = false;
        trackSelfViewSessionAsNeeded();
        if v16 then
            clearViewportFrame();
        end;
        return;
    end;
end;
createViewportFrame = function() --[[ Line: 1049 ]] --[[ Name: createViewportFrame ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), v55 (copy), v9 (copy), v65 (copy), v122 (ref), v126 (copy), v99 (ref), v107 (ref), v97 (ref), v45 (copy), v98 (ref)
    local v236 = 0;
    local v237 = UDim2.new(1, 0, 1, -35);
    if l_GetFFlagEnableShowVoiceUI_0() then
        if v55() and v9 then
            if v65() then
                v236 = v236 + 1;
            end;
        elseif v122 then
            v236 = v236 + 1;
        end;
        if v126() then
            v236 = v236 + 1;
        end;
        v237 = if v236 == 0 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 1, -35);
    end;
    v99 = Instance.new("Frame");
    v99.Name = "SelfViewFrame";
    v99.Position = UDim2.new(0, 0, 0, 0);
    v99.Size = UDim2.new(1, 0, 1, 0);
    v99.BackgroundTransparency = 1;
    v99.Parent = v107;
    v97 = Instance.new("ViewportFrame");
    v97.Position = UDim2.new(0, 0, 0, 0);
    v97.Size = if l_GetFFlagEnableShowVoiceUI_0() then v237 else UDim2.new(1, 0, 1, -35);
    v97.BackgroundColor3 = Color3.new(0, 0, 0);
    v97.BorderColor3 = Color3.new(0.6, 0.5, 0.4);
    v97.BorderSizePixel = 2;
    v97.BackgroundTransparency = 0.65;
    v97.Parent = v99;
    v97.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
    v97.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
    v97.LightDirection = Vector3.new(9.5, -12, 7.5, 0);
    v97.BackgroundColor3 = Color3.new(0.0990616, 0.138109, 0.452827);
    v97.IsMirrored = true;
    Instance.new("UICorner").Parent = v99;
    Instance.new("UICorner").Parent = v97;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Parent = v99;
    l_UIStroke_0.Thickness = 3;
    l_UIStroke_0.Color = v45;
    l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Parent = v97;
    l_UIStroke_0.Thickness = 2.5;
    l_UIStroke_0.Color = v45;
    v98 = Instance.new("Camera");
    v98.FieldOfView = 52.5;
    v97.CurrentCamera = v98;
    v98.Parent = v97;
    return v97;
end;
getViewportFrame = function() --[[ Line: 1123 ]] --[[ Name: getViewportFrame ]]
    -- upvalues: v97 (ref)
    if v97 then
        clearViewportFrame();
    end;
    v97 = createViewportFrame();
    return v97;
end;
local function v293() --[[ Line: 1131 ]] --[[ Name: createViewport ]]
    -- upvalues: v55 (copy), v9 (copy), v65 (copy), v122 (ref), v126 (copy), v107 (ref), v72 (ref), v44 (copy), v43 (copy), v223 (copy), l_VRService_0 (copy), v120 (ref), v28 (copy), v29 (copy), l_AppStorageService_0 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v108 (ref), v45 (copy), l_default_0 (copy), v123 (ref), v76 (copy), v121 (ref), v39 (copy), v79 (ref), l_game_Service_0 (copy), v66 (ref), v48 (copy), l_default_1 (copy), v109 (ref), v70 (copy), v110 (ref), v69 (copy), v16 (copy), v112 (ref), v111 (ref), v235 (copy), v99 (ref), v64 (ref), v63 (copy), v61 (copy), v2 (ref), v1 (ref), v62 (copy), v60 (ref), v130 (ref), v47 (copy), v133 (ref), v134 (ref), l_SocialService_0 (copy), v57 (copy), v97 (ref), v98 (ref), v88 (ref)
    local v239 = 0;
    if v55() and v9 then
        if v65() then
            v239 = v239 + 1;
        end;
    elseif v122 then
        v239 = v239 + 1;
    end;
    if v126() then
        v239 = v239 + 1;
    end;
    if v107 then
        v107:Destroy();
    end;
    v107 = Instance.new("Frame");
    v107.Name = "SelfView";
    v107.Parent = v72;
    v107.Active = true;
    v107.Size = v44;
    local l_v43_0 = v43;
    v107.BackgroundTransparency = 1;
    v107.InputBegan:Connect(function(v241) --[[ Line: 1163 ]]
        -- upvalues: v223 (ref), v107 (ref)
        v223(v107, v241);
    end);
    v107.MouseEnter:Connect(function() --[[ Line: 1167 ]]
        -- upvalues: l_VRService_0 (ref), v120 (ref), v28 (ref), v29 (ref)
        if not l_VRService_0.VREnabled then
            v120 = true;
            v28.push(v29, Enum.OverrideMouseIconBehavior.ForceShow);
        end;
    end);
    v107.MouseLeave:Connect(function() --[[ Line: 1170 ]]
        -- upvalues: v120 (ref), v28 (ref), v29 (ref)
        if v120 then
            v120 = false;
            v28.pop(v29);
        end;
    end);
    v107.Visible = false;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.Parent = v107;
    l_UIAspectRatioConstraint_0.AspectRatio = 0.833;
    l_UIAspectRatioConstraint_0.AspectType = "ScaleWithParentSize";
    l_UIAspectRatioConstraint_0.DominantAxis = "Width";
    local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
    l_UISizeConstraint_0.Parent = v107;
    l_UISizeConstraint_0.MaxSize = Vector2.new(140, 140);
    l_UISizeConstraint_0.MinSize = Vector2.new(95, 95);
    pcall(function() --[[ Line: 1190 ]]
        -- upvalues: l_AppStorageService_0 (ref), v107 (ref), l_v43_0 (ref)
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("SelfViewPosition");
        if l_l_AppStorageService_0_Item_0 then
            local v245 = string.split(l_l_AppStorageService_0_Item_0, ",");
            local v246 = UDim2.fromOffset(v245[1], v245[2]);
            v246 = {
                X = v245[1], 
                Y = v245[2]
            };
            local l_AbsoluteSize_4 = v107.Parent.AbsoluteSize;
            l_v43_0 = constrainTargetPositionToScreen(v107, l_AbsoluteSize_4, v246);
        end;
    end);
    v107.Position = l_v43_0;
    v107.Position = getRelativePosition(v107);
    local v248 = nil;
    local v249 = nil;
    local v250 = nil;
    local __ = nil;
    local v252 = nil;
    if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
        v108 = Instance.new("Frame");
        v108.Name = "BottomButtonsFrame";
        v108.Position = UDim2.new(0, 0, 1, -35);
        v108.Size = UDim2.new(1, 0, 0, 36);
        v108.BackgroundColor3 = v45;
        v108.BackgroundTransparency = 0;
        v108.BorderSizePixel = 0;
        v108.Parent = v107;
        v248 = Instance.new("UIPadding");
        v248.Parent = v108;
        v248.PaddingBottom = UDim.new(0, 0);
        v248.PaddingLeft = UDim.new(0, 0);
        v248.PaddingRight = UDim.new(0, 0);
        v248.PaddingTop = UDim.new(0, 3);
        v249 = Instance.new("UIListLayout");
        v249.Parent = v108;
        v249.Padding = UDim.new(0, 5);
        v249.FillDirection = Enum.FillDirection.Horizontal;
        v249.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        v249.VerticalAlignment = Enum.VerticalAlignment.Center;
        v249.SortOrder = Enum.SortOrder.LayoutOrder;
        local v253 = v239 == 2 and 0.5 or 1;
        v250 = Instance.new("ImageButton");
        v250.Name = "MicButton";
        v250.Parent = v108;
        v250.Position = UDim2.new(0, 0, 0, 0);
        v250.Size = UDim2.new(v253, -4, 1, -4);
        v250.Image = "rbxasset://textures/SelfView/whiteRect.png";
        v250.ImageColor3 = Color3.new(0.294117, 0.294117, 0.294117);
        v250.BackgroundTransparency = 1;
        v250.LayoutOrder = 0;
        v250.ZIndex = 2;
        v250.Visible = v126();
        v250.Activated:Connect(function() --[[ Line: 1249 ]]
            -- upvalues: l_default_0 (ref), v123 (ref), v126 (ref), v76 (ref), v121 (ref), v39 (ref), v79 (ref)
            local v254 = l_default_0:getService();
            debugPrint("Self View: micButton.Activated(), voiceService:" .. tostring(v254) .. ",hasMicPermissions:" .. tostring(v123));
            if v254 and v126() then
                if v76() and v121 then
                    l_default_0:ShowVoiceChatLoadingMessage();
                    return;
                else
                    l_default_0:ToggleMic("LegacySelfView");
                    v39:setLastCtx("SelfView");
                    if v79 then
                        v79:onToggleMuteSelf(not l_default_0.localMuted);
                    end;
                end;
            end;
        end);
        Instance.new("UICorner").Parent = v250;
        v252 = Instance.new("ImageButton");
        v252.Name = "CamButton";
        v252.Parent = v108;
        v252.Position = UDim2.new(0, 0, 0, 0);
        v252.Size = UDim2.new(v253, -4, 1, -4);
        v252.Image = "rbxasset://textures/SelfView/whiteRect.png";
        v252.ImageColor3 = Color3.new(0.294117, 0.294117, 0.294117);
        v252.BackgroundTransparency = 1;
        v252.LayoutOrder = 1;
        v252.ZIndex = 3;
        local l_v122_1 = v122;
        if v55() then
            l_v122_1 = v65();
        end;
        v252.Visible = l_v122_1;
        v252.Activated:Connect(function() --[[ Line: 1291 ]]
            -- upvalues: v122 (ref), l_game_Service_0 (ref), v39 (ref), v55 (ref), v66 (ref), v48 (ref), l_default_1 (ref)
            debugPrint("Self View: camButton.Activated(), hasCameraPermissions:" .. tostring(v122));
            local function __() --[[ Line: 1293 ]]
                -- upvalues: l_game_Service_0 (ref), v39 (ref)
                if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                    updateVideoButton(false);
                    return;
                else
                    l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                    v39:setLastCtx("SelfView");
                    return;
                end;
            end;
            if v55() then
                if v122 then
                    if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                        updateVideoButton(false);
                        return;
                    else
                        l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                        v39:setLastCtx("SelfView");
                        return;
                    end;
                else
                    v48(function(v257) --[[ Line: 1308 ]]
                        -- upvalues: v122 (ref), l_game_Service_0 (ref), v39 (ref), v66 (ref)
                        v122 = v257.hasCameraPermissions;
                        if v257.hasCameraPermissions then
                            if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                                updateVideoButton(false);
                                return;
                            else
                                l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                                v39:setLastCtx("SelfView");
                                return;
                            end;
                        else
                            v66();
                            updateVideoButton(false);
                            return;
                        end;
                    end, {
                        l_default_1.Permissions.CAMERA_ACCESS
                    });
                    return;
                end;
            elseif v122 then
                if not l_game_Service_0 or not l_game_Service_0:IsStarted() then
                    updateVideoButton(false);
                    return;
                else
                    l_game_Service_0.VideoAnimationEnabled = not l_game_Service_0.VideoAnimationEnabled;
                    v39:setLastCtx("SelfView");
                    return;
                end;
            else
                updateVideoButton(false);
                return;
            end;
        end);
        Instance.new("UICorner").Parent = v252;
        v109 = Instance.new("ImageLabel");
        v109.Name = "MicIcon";
        v109.Parent = v250;
        v109.AnchorPoint = Vector2.new(0.5, 0.5);
        v109.Position = UDim2.new(0.5, 0, 0.5, 0);
        if v76() and v121 then
            v109.Size = UDim2.fromOffset(16, 20);
            v109.Image = l_default_0:GetIcon("Connecting", "New");
            v109.ImageRectOffset = Vector2.new(0, 0);
            v109.ImageRectSize = Vector2.new(0, 0);
        else
            v109.Size = UDim2.new(0, 32, 0, 32);
            v109.Image = v70.Image;
            v109.ImageRectOffset = v70.ImageRectOffset;
            v109.ImageRectSize = v70.ImageRectSize;
        end;
        v109.BackgroundTransparency = 1;
        v109.ZIndex = 2;
        v110 = Instance.new("ImageLabel");
        v110.Name = "CamIcon";
        v110.Parent = v252;
        v110.AnchorPoint = Vector2.new(0.5, 0.5);
        v110.Position = UDim2.new(0.5, 0, 0.5, 0);
        v110.Size = UDim2.new(0, 32, 0, 32);
        v110.Image = v69.Image;
        v110.ImageRectOffset = v69.ImageRectOffset;
        v110.ImageRectSize = v69.ImageRectSize;
        v110.BackgroundTransparency = 1;
        v110.ZIndex = 2;
    end;
    if v16 then
        if v112 then
            getViewportFrame();
        end;
        v111 = Instance.new("ImageLabel");
        v111.Name = "IndicatorCircle";
        v111.Parent = v107;
        v111.Position = UDim2.new(1, -25, 0, 4);
        v111.Size = UDim2.new(0, 22, 0, 22);
        v111.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        v111.BackgroundTransparency = 1;
        v111.Visible = false;
        v111.ZIndex = 4;
        local l_ImageButton_0 = Instance.new("ImageButton");
        l_ImageButton_0.Name = "CloseButton";
        l_ImageButton_0.AnchorPoint = Vector2.new(0, 0.5);
        l_ImageButton_0.Parent = v107;
        l_ImageButton_0.Position = UDim2.fromOffset(0, 16);
        l_ImageButton_0.Size = UDim2.new(0, 34, 0, 34);
        l_ImageButton_0.Image = "rbxasset://textures/SelfView/whiteRect.png";
        l_ImageButton_0.ImageTransparency = 1;
        l_ImageButton_0.BackgroundTransparency = 1;
        l_ImageButton_0.BackgroundColor3 = Color3.new(0.137254, 0.137254, 0.137254);
        l_ImageButton_0.ZIndex = 2;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Name = "CloseButtonIcon";
        l_ImageLabel_0.Parent = l_ImageButton_0;
        l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_0.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_0.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_0.Image = "rbxasset://textures/SelfView/SelfView_icon_close.png";
        l_ImageLabel_0.ImageTransparency = 0;
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.ZIndex = 2;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "FaceIcon";
        l_ImageLabel_1.Parent = v107;
        l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_1.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_1.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_1.Image = "rbxasset://textures/SelfView/SelfView_icon_faceToggle_on.png";
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.ZIndex = 2;
        l_ImageLabel_1.Visible = false;
        l_ImageLabel_1.Parent = l_ImageButton_0;
        local function v261() --[[ Line: 1417 ]] --[[ Name: setButtonButtonsVisibility ]]
            -- upvalues: v112 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v239 (ref), v250 (ref), v252 (ref), l_ImageButton_0 (copy)
            if v112 then
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Visible = true;
                    v252.Visible = true;
                end;
                l_ImageButton_0.Visible = true;
                return;
            else
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Visible = false;
                    v252.Visible = false;
                end;
                l_ImageButton_0.Visible = false;
                return;
            end;
        end;
        local function v269(v262, v263, v264) --[[ Line: 1444 ]] --[[ Name: showSelfView ]]
            -- upvalues: v235 (ref), v261 (copy), v16 (ref), v99 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v239 (ref), v108 (ref), l_ImageLabel_0 (copy), l_ImageLabel_1 (copy), l_ImageButton_0 (copy), v112 (ref), v250 (ref), v252 (ref), v111 (ref), v107 (ref), v64 (ref), v63 (ref), l_UIAspectRatioConstraint_0 (copy), l_UISizeConstraint_0 (copy), v61 (ref), l_AppStorageService_0 (ref), v2 (ref), v1 (ref), v62 (ref)
            v235(v262);
            v261();
            if not v16 then
                v99.Visible = v262;
            end;
            if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                v108.Visible = v262;
            end;
            l_ImageLabel_0.Visible = v262;
            l_ImageLabel_1.Visible = not v262;
            l_ImageButton_0.BackgroundTransparency = v262 and 1 or 0.5;
            if v112 then
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Position = UDim2.new(0, 0, 0, 0);
                    v250.Size = UDim2.new(0.5, -4, 1, -4);
                    v250.ImageTransparency = 0;
                    v252.Position = UDim2.new(0, 0, 0, 0);
                    v252.Size = UDim2.new(0.5, -4, 1, -4);
                    v252.ImageTransparency = 0;
                end;
                v111.Position = UDim2.new(1, -25, 0, 4);
                if v263 ~= nil then
                    v107.Position = v263;
                end;
                if v264 ~= nil then
                    v107.AnchorPoint = v264;
                end;
                v107.Active = true;
                v107.Visible = true;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewOpenedTooltip") then
                    v64 = v63({
                        fallbackText = "Use your camera to make your avatar smile and move just like you", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewOpenedTooltip", 
                        anchorPoint = v107.AnchorPoint, 
                        position = v107.Position, 
                        size = v107.Size, 
                        bottomButtonsFramePosition = v108.Position, 
                        bottomButtonsFrameSize = v108.Size, 
                        aspectRatio = l_UIAspectRatioConstraint_0.AspectRatio, 
                        maxSize = l_UISizeConstraint_0.MaxSize, 
                        minSize = l_UISizeConstraint_0.MinSize, 
                        tooltipLifetime = v61
                    });
                    pcall(function() --[[ Line: 1493 ]]
                        -- upvalues: l_AppStorageService_0 (ref)
                        l_AppStorageService_0:SetItem("ShowSelfieViewOpenedTooltip", "false");
                    end);
                end;
            else
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Position = UDim2.new(0, 40, 0, -1);
                    v250.Size = UDim2.new(0, 34, 0, 34);
                    v250.ImageTransparency = 0.3;
                    v252.Position = UDim2.new(0, 80, 0, -1);
                    v252.Size = UDim2.new(0, 34, 0, 34);
                    v252.ImageTransparency = 0.3;
                end;
                v111.Position = UDim2.new(0, 20, 0, -10);
                v107.Active = false;
                v107.Visible = false;
                if v2 then
                    local v265 = nil;
                    local l_v2_0 = v2;
                    local l_v1_0 = v1;
                    do
                        local l_v265_0 = v265;
                        l_v265_0 = v2.Stopped:Connect(function() --[[ Line: 1516 ]]
                            -- upvalues: l_v2_0 (copy), l_v1_0 (copy), l_v265_0 (ref)
                            l_v2_0:Destroy();
                            if l_v1_0 then
                                l_v1_0:Destroy();
                            end;
                            l_v265_0:Disconnect();
                        end);
                        v2:Stop(0);
                        v2 = nil;
                    end;
                elseif v1 then
                    v1:Destroy();
                    v1 = nil;
                end;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewClosedTooltip") then
                    v62({
                        fallbackText = "You can find your camera and self-view controls here", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewClosedTooltip", 
                        tooltipLifetime = v61
                    });
                    pcall(function() --[[ Line: 1539 ]]
                        -- upvalues: l_AppStorageService_0 (ref)
                        l_AppStorageService_0:SetItem("ShowSelfieViewClosedTooltip", "false");
                    end);
                end;
            end;
            if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                v108.Visible = v112;
            end;
        end;
        v60 = v269;
        l_ImageButton_0.Activated:Connect(function() --[[ Line: 1552 ]]
            -- upvalues: v269 (copy), v112 (ref)
            v269(not v112);
        end);
        if v130 then
            v130:disconnect();
        end;
        v130 = v47:connect(function() --[[ Line: 1559 ]]
            -- upvalues: v269 (copy), v112 (ref)
            v269(not v112);
        end);
        if v133 then
            v133:Disconnect();
            v133 = nil;
        end;
        if v134 then
            v134:Disconnect();
            v134 = nil;
        end;
        v133 = l_SocialService_0.SelfViewVisible:Connect(function(v270) --[[ Line: 1571 ]]
            -- upvalues: v112 (ref), v269 (copy), v107 (ref), l_AppStorageService_0 (ref)
            if not v112 then
                local v271 = nil;
                local v272 = nil;
                if v270 == Enum.SelfViewPosition.TopLeft then
                    v271 = UDim2.new(0, 24, 0, 24);
                    v272 = Vector2.new(0, 0);
                elseif v270 == Enum.SelfViewPosition.TopRight then
                    v271 = UDim2.new(1, -24, 0, 24);
                    v272 = Vector2.new(1, 0);
                elseif v270 == Enum.SelfViewPosition.BottomLeft then
                    v271 = UDim2.new(0, 24, 1, -24);
                    v272 = Vector2.new(0, 1);
                elseif v270 == Enum.SelfViewPosition.BottomRight then
                    v271 = UDim2.new(1, -24, 1, -24);
                    v272 = Vector2.new(1, 1);
                end;
                v269(true, v271, v272);
                if v271 ~= nil then
                    local v273 = v107.AbsolutePosition.X .. "," .. v107.AbsolutePosition.Y;
                    l_AppStorageService_0:SetItem("SelfViewPosition", v273);
                end;
            end;
        end);
        v134 = l_SocialService_0.SelfViewHidden:Connect(function() --[[ Line: 1597 ]]
            -- upvalues: v112 (ref), v57 (ref), v64 (ref), v269 (copy)
            if v112 then
                if v57() and v64 then
                    v64.unmount();
                    v64 = nil;
                end;
                v269(false);
            end;
        end);
        Instance.new("UICorner").Parent = l_ImageButton_0;
        if not v16 then
            Instance.new("UICorner").Parent = v99;
            Instance.new("UICorner").Parent = v97;
            local l_UIStroke_1 = Instance.new("UIStroke");
            l_UIStroke_1.Parent = v99;
            l_UIStroke_1.Thickness = 3;
            l_UIStroke_1.Color = v45;
            l_UIStroke_1 = Instance.new("UIStroke");
            l_UIStroke_1.Parent = v97;
            l_UIStroke_1.Thickness = 2.5;
            l_UIStroke_1.Color = v45;
        end;
        createCloneAnchor();
        if not v16 then
            v98 = Instance.new("Camera");
            v98.FieldOfView = 52.5;
            v97.CurrentCamera = v98;
            v98.Parent = v97;
        end;
        if not v88 then
            connectToScreenOrientationChange();
        end;
    else
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "SelfViewFrame";
        l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.Parent = v107;
        v97 = Instance.new("ViewportFrame");
        v97.Position = UDim2.new(0, 0, 0, 0);
        v97.Size = UDim2.new(1, 0, 1, -35);
        v97.BackgroundColor3 = Color3.new(0, 0, 0);
        v97.BorderColor3 = Color3.new(0.6, 0.5, 0.4);
        v97.BorderSizePixel = 2;
        v97.BackgroundTransparency = 0.65;
        v97.Parent = l_Frame_0;
        v97.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
        v97.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
        v97.LightDirection = Vector3.new(9.5, -12, 7.5, 0);
        v97.BackgroundColor3 = Color3.new(0.0990616, 0.138109, 0.452827);
        v97.IsMirrored = true;
        v111 = Instance.new("ImageLabel");
        v111.Name = "IndicatorCircle";
        v111.Parent = v107;
        v111.Position = UDim2.new(1, -25, 0, 4);
        v111.Size = UDim2.new(0, 22, 0, 22);
        v111.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        v111.BackgroundTransparency = 1;
        v111.Visible = false;
        v111.ZIndex = 4;
        local l_ImageButton_1 = Instance.new("ImageButton");
        l_ImageButton_1.Name = "CloseButton";
        l_ImageButton_1.AnchorPoint = Vector2.new(0, 0.5);
        l_ImageButton_1.Parent = v107;
        l_ImageButton_1.Position = UDim2.fromOffset(0, 16);
        l_ImageButton_1.Size = UDim2.new(0, 34, 0, 34);
        l_ImageButton_1.Image = "rbxasset://textures/SelfView/whiteRect.png";
        l_ImageButton_1.ImageTransparency = 1;
        l_ImageButton_1.BackgroundTransparency = 1;
        l_ImageButton_1.BackgroundColor3 = Color3.new(0.137254, 0.137254, 0.137254);
        l_ImageButton_1.ZIndex = 2;
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "CloseButtonIcon";
        l_ImageLabel_2.Parent = l_ImageButton_1;
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_2.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_2.Image = "rbxasset://textures/SelfView/SelfView_icon_close.png";
        l_ImageLabel_2.ImageTransparency = 0;
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ZIndex = 2;
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "FaceIcon";
        l_ImageLabel_3.Parent = v107;
        l_ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_3.Position = UDim2.new(0, 17, 0, 17);
        l_ImageLabel_3.Size = UDim2.new(0, 32, 0, 32);
        l_ImageLabel_3.Image = "rbxasset://textures/SelfView/SelfView_icon_faceToggle_on.png";
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.ZIndex = 2;
        l_ImageLabel_3.Visible = false;
        l_ImageLabel_3.Parent = l_ImageButton_1;
        local function v279() --[[ Line: 1712 ]] --[[ Name: setButtonButtonsVisibility ]]
            -- upvalues: v112 (ref), l_GetFFlagEnableShowVoiceUI_0 (ref), v239 (ref), v250 (ref), v252 (ref), l_ImageButton_1 (copy)
            if v112 then
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Visible = true;
                    v252.Visible = true;
                end;
                l_ImageButton_1.Visible = true;
                return;
            else
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Visible = false;
                    v252.Visible = false;
                end;
                l_ImageButton_1.Visible = false;
                return;
            end;
        end;
        local function v287(v280, v281, v282) --[[ Line: 1738 ]] --[[ Name: showSelfView ]]
            -- upvalues: v235 (ref), v279 (copy), v16 (ref), l_Frame_0 (copy), l_GetFFlagEnableShowVoiceUI_0 (ref), v239 (ref), v108 (ref), l_ImageLabel_2 (copy), l_ImageLabel_3 (copy), l_ImageButton_1 (copy), v112 (ref), v250 (ref), v252 (ref), v111 (ref), v107 (ref), v64 (ref), v63 (ref), l_UIAspectRatioConstraint_0 (copy), l_UISizeConstraint_0 (copy), v61 (ref), l_AppStorageService_0 (ref), v2 (ref), v1 (ref), v62 (ref)
            v235(v280);
            v279();
            if not v16 then
                l_Frame_0.Visible = v280;
            end;
            if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                v108.Visible = v280;
            end;
            l_ImageLabel_2.Visible = v280;
            l_ImageLabel_3.Visible = not v280;
            l_ImageButton_1.BackgroundTransparency = v280 and 1 or 0.5;
            if v112 then
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Position = UDim2.new(0, 0, 0, 0);
                    v250.Size = UDim2.new(0.5, -4, 1, -4);
                    v250.ImageTransparency = 0;
                    v252.Position = UDim2.new(0, 0, 0, 0);
                    v252.Size = UDim2.new(0.5, -4, 1, -4);
                    v252.ImageTransparency = 0;
                end;
                v111.Position = UDim2.new(1, -25, 0, 4);
                if v281 ~= nil then
                    v107.Position = v281;
                end;
                if v282 ~= nil then
                    v107.AnchorPoint = v282;
                end;
                v107.Active = true;
                v107.Visible = true;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewOpenedTooltip") then
                    v64 = v63({
                        fallbackText = "Use your camera to make your avatar smile and move just like you", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewOpenedTooltip", 
                        anchorPoint = v107.AnchorPoint, 
                        position = v107.Position, 
                        size = v107.Size, 
                        bottomButtonsFramePosition = v108.Position, 
                        bottomButtonsFrameSize = v108.Size, 
                        aspectRatio = l_UIAspectRatioConstraint_0.AspectRatio, 
                        maxSize = l_UISizeConstraint_0.MaxSize, 
                        minSize = l_UISizeConstraint_0.MinSize, 
                        tooltipLifetime = v61
                    });
                    pcall(function() --[[ Line: 1788 ]]
                        -- upvalues: l_AppStorageService_0 (ref)
                        l_AppStorageService_0:SetItem("ShowSelfieViewOpenedTooltip", "false");
                    end);
                end;
            else
                if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                    v250.Position = UDim2.new(0, 40, 0, -1);
                    v250.Size = UDim2.new(0, 34, 0, 34);
                    v250.ImageTransparency = 0.3;
                    v252.Position = UDim2.new(0, 80, 0, -1);
                    v252.Size = UDim2.new(0, 34, 0, 34);
                    v252.ImageTransparency = 0.3;
                end;
                v111.Position = UDim2.new(0, 20, 0, -10);
                v107.Active = false;
                v107.Visible = false;
                if v2 then
                    local v283 = nil;
                    local l_v2_1 = v2;
                    local l_v1_1 = v1;
                    do
                        local l_v283_0 = v283;
                        l_v283_0 = v2.Stopped:Connect(function() --[[ Line: 1811 ]]
                            -- upvalues: l_v2_1 (copy), l_v1_1 (copy), l_v283_0 (ref)
                            l_v2_1:Destroy();
                            if l_v1_1 then
                                l_v1_1:Destroy();
                            end;
                            l_v283_0:Disconnect();
                        end);
                        v2:Stop(0);
                        v2 = nil;
                    end;
                elseif v1 then
                    v1:Destroy();
                    v1 = nil;
                end;
                if shouldDisplaySelfViewTooltip("ShowSelfieViewClosedTooltip") then
                    v62({
                        fallbackText = "You can find your camera and self-view controls here", 
                        translationKey = "Feature.Avatar.Message.FTUXSelfieViewClosedTooltip", 
                        tooltipLifetime = v61
                    });
                    pcall(function() --[[ Line: 1834 ]]
                        -- upvalues: l_AppStorageService_0 (ref)
                        l_AppStorageService_0:SetItem("ShowSelfieViewClosedTooltip", "false");
                    end);
                end;
            end;
            if not l_GetFFlagEnableShowVoiceUI_0() or v239 ~= 0 then
                v108.Visible = v112;
            end;
        end;
        v60 = v287;
        l_ImageButton_1.Activated:Connect(function() --[[ Line: 1847 ]]
            -- upvalues: v287 (copy), v112 (ref)
            v287(not v112);
        end);
        if v130 then
            v130:disconnect();
        end;
        v130 = v47:connect(function() --[[ Line: 1854 ]]
            -- upvalues: v287 (copy), v112 (ref)
            v287(not v112);
        end);
        if v133 then
            v133:Disconnect();
            v133 = nil;
        end;
        if v134 then
            v134:Disconnect();
            v134 = nil;
        end;
        v133 = l_SocialService_0.SelfViewVisible:Connect(function(v288) --[[ Line: 1866 ]]
            -- upvalues: v112 (ref), v287 (copy), v107 (ref), l_AppStorageService_0 (ref)
            if not v112 then
                local v289 = nil;
                local v290 = nil;
                if v288 == Enum.SelfViewPosition.TopLeft then
                    v289 = UDim2.new(0, 24, 0, 24);
                    v290 = Vector2.new(0, 0);
                elseif v288 == Enum.SelfViewPosition.TopRight then
                    v289 = UDim2.new(1, -24, 0, 24);
                    v290 = Vector2.new(1, 0);
                elseif v288 == Enum.SelfViewPosition.BottomLeft then
                    v289 = UDim2.new(0, 24, 1, -24);
                    v290 = Vector2.new(0, 1);
                elseif v288 == Enum.SelfViewPosition.BottomRight then
                    v289 = UDim2.new(1, -24, 1, -24);
                    v290 = Vector2.new(1, 1);
                end;
                v287(true, v289, v290);
                if v289 ~= nil then
                    local v291 = v107.AbsolutePosition.X .. "," .. v107.AbsolutePosition.Y;
                    l_AppStorageService_0:SetItem("SelfViewPosition", v291);
                end;
            end;
        end);
        v134 = l_SocialService_0.SelfViewHidden:Connect(function() --[[ Line: 1892 ]]
            -- upvalues: v112 (ref), v57 (ref), v64 (ref), v287 (copy)
            if v112 then
                if v57() and v64 then
                    v64.unmount();
                    v64 = nil;
                end;
                v287(false);
            end;
        end);
        Instance.new("UICorner").Parent = l_ImageButton_1;
        if not v16 then
            Instance.new("UICorner").Parent = l_Frame_0;
            Instance.new("UICorner").Parent = v97;
            local l_UIStroke_2 = Instance.new("UIStroke");
            l_UIStroke_2.Parent = l_Frame_0;
            l_UIStroke_2.Thickness = 3;
            l_UIStroke_2.Color = v45;
            l_UIStroke_2 = Instance.new("UIStroke");
            l_UIStroke_2.Parent = v97;
            l_UIStroke_2.Thickness = 2.5;
            l_UIStroke_2.Color = v45;
        end;
        createCloneAnchor();
        if not v16 then
            v98 = Instance.new("Camera");
            v98.FieldOfView = 52.5;
            v97.CurrentCamera = v98;
            v98.Parent = v97;
        end;
        if not v88 then
            connectToScreenOrientationChange();
        end;
    end;
end;
toggleIndicator = function(v294) --[[ Line: 1942 ]] --[[ Name: toggleIndicator ]]
    -- upvalues: v123 (ref), v122 (ref), v111 (ref), v126 (copy), v108 (ref)
    debugPrint("Self View: toggleIndicator(), mode: " .. tostring(v294) .. ",hasMicPermissions:" .. tostring(v123) .. ",hasCameraPermissions:" .. tostring(v122));
    if v111 then
        v111.Visible = (not (v294 ~= Enum.TrackerMode.Audio) or v294 == Enum.TrackerMode.AudioVideo) and v126() and v108 and v108.Visible or (not (v294 ~= Enum.TrackerMode.Video) or v294 == Enum.TrackerMode.AudioVideo) and v122 and v108 and v108.Visible;
        if v294 == Enum.TrackerMode.AudioVideo or v294 == Enum.TrackerMode.Audio then
            v111.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_on.png";
            return;
        else
            v111.Image = "rbxasset://textures/SelfView/SelfView_icon_indicator_off.png";
        end;
    end;
end;
showNoDynamicHeadInfoIfNeeded = function() --[[ Line: 1970 ]] --[[ Name: showNoDynamicHeadInfoIfNeeded ]]
    -- upvalues: v131 (ref), v132 (ref), v41 (copy), v42 (copy)
    if v131 then
        return;
    else
        if v132 == false then
            v131 = true;
            v41:showPrompt(v42.NoDynamicHeadEquipped);
        end;
        return;
    end;
end;
updateVideoButton = function(v295) --[[ Line: 1981 ]] --[[ Name: updateVideoButton ]]
    -- upvalues: v110 (ref), v68 (copy), v69 (copy)
    if v295 then
        if v110 then
            v110.Image = v68.Image;
            v110.ImageRectOffset = v68.ImageRectOffset;
            v110.ImageRectSize = v68.ImageRectSize;
        end;
        showNoDynamicHeadInfoIfNeeded();
        return;
    else
        if v110 then
            v110.Image = v69.Image;
            v110.ImageRectOffset = v69.ImageRectOffset;
            v110.ImageRectSize = v69.ImageRectSize;
        end;
        return;
    end;
end;
local function v299() --[[ Line: 1998 ]]
    -- upvalues: v95 (ref), l_game_Service_0 (copy), v40 (copy), v96 (ref), v122 (ref), v113 (ref), v127 (ref), v128 (ref), v123 (ref), v129 (ref), v39 (copy)
    v95 = Enum.TrackerMode.None;
    if l_game_Service_0.AudioAnimationEnabled and not l_game_Service_0.VideoAnimationEnabled then
        v95 = Enum.TrackerMode.Audio;
    elseif not l_game_Service_0.AudioAnimationEnabled and l_game_Service_0.VideoAnimationEnabled and l_game_Service_0:IsStarted() then
        v95 = Enum.TrackerMode.Video;
    elseif l_game_Service_0.AudioAnimationEnabled and l_game_Service_0.VideoAnimationEnabled and l_game_Service_0:IsStarted() then
        v95 = Enum.TrackerMode.AudioVideo;
    end;
    v40:trace("Self View: onUpdateTrackerMode(), currentTrackerMode: " .. tostring(v95) .. ",cachedMode:" .. tostring(v96));
    updateVideoButton((not (v95 ~= Enum.TrackerMode.AudioVideo) or v95 == Enum.TrackerMode.Video) and v122);
    toggleIndicator(v95);
    local v296 = false;
    local v297 = false;
    if not v113 and v96 == Enum.TrackerMode.None and v95 ~= Enum.TrackerMode.None then
        setCloneDirty(true);
    end;
    if v127 ~= v122 or v128 ~= v123 then
        debugPrint("Self View: cachedHasCameraPermissions ~= hasCameraPermissions or cachedHasMicPermissions ~= hasMicPermissions");
        if v127 ~= v122 then
            v296 = true;
        end;
        debugPrint("Self View: permissions changed, triggering clone refresh in case we get a streamtrack");
        setCloneDirty(true);
    end;
    if v96 ~= v95 then
        v297 = true;
    end;
    if v297 or v296 then
        local v298 = false;
        if v122 and (v95 == Enum.TrackerMode.Video or v95 == Enum.TrackerMode.AudioVideo) then
            v298 = true;
        end;
        if not v122 or v95 ~= Enum.TrackerMode.Video and v95 ~= Enum.TrackerMode.AudioVideo then
            v298 = false;
        end;
        if v298 ~= v129 then
            v39:reportCamState(v298);
            v129 = v298;
        end;
    end;
    v127 = v122;
    v128 = v123;
    v96 = v95;
end;
local function v303(v300, v301) --[[ Line: 2082 ]] --[[ Name: syncTrack ]]
    -- upvalues: v17 (copy), v112 (ref), v97 (ref), v1 (ref), v2 (ref), l_Players_0 (copy), v113 (ref), v82 (copy)
    if v17 and (not v112 or v97 == nil) then
        return;
    elseif not v300 or not v301.Animation then
        return;
    else
        local v302 = nil;
        if not v301.Animation:IsA("Animation") then
            if v301.Animation:IsA("TrackerStreamAnimation") then
                v1 = Instance.new("TrackerStreamAnimation");
                if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
                    v2 = v300:LoadStreamAnimationV2(v1, l_Players_0.LocalPlayer, false, false);
                else
                    v2 = v300:LoadStreamAnimationForSelfieView_deprecated(v1, l_Players_0.LocalPlayer);
                end;
                v302 = v2;
                v113 = true;
                debugPrint("foundStreamTrack = true");
            else
                warn("No animation to clone in SelfView");
            end;
        end;
        if v302 then
            v302:Play();
            v302.Priority = v301.Priority;
            v82[v301] = v301.Stopped:Connect(function() --[[ Line: 2118 ]]
                -- upvalues: v302 (ref), v82 (ref), v301 (copy)
                v302:Stop(0);
                if v82[v301] then
                    v82[v301]:Disconnect();
                end;
            end);
        end;
        return;
    end;
end;
getFaceControls = function(v304) --[[ Line: 2128 ]] --[[ Name: getFaceControls ]]
    if v304 == nil then
        return;
    else
        return v304:FindFirstChildWhichIsA("FaceControls", true);
    end;
end;
getNeck = function(v305, v306) --[[ Line: 2135 ]] --[[ Name: getNeck ]]
    -- upvalues: v14 (copy)
    if v305 == nil or v306 == nil then
        return nil;
    else
        local l_v305_Descendants_0 = v305:GetDescendants();
        debugPrint("Self VIew: getNeck()");
        for __, v309 in l_v305_Descendants_0 do
            if v309:IsA("Motor6D") and (v309.Part1 == v306 or v309.Name == "Neck") then
                return v309;
            end;
        end;
        if v14 then
            for __, v311 in l_v305_Descendants_0 do
                if v311:IsA("AnimationConstraint") and v311.Parent == v306 and (v311.Attachment0.Name == "NeckRigAttachment" or v311.Name == "Neck") then
                    return v311;
                end;
            end;
        end;
        return nil;
    end;
end;
findObjectOfNameAndTypeName = function(v312, v313, v314) --[[ Line: 2163 ]] --[[ Name: findObjectOfNameAndTypeName ]]
    -- upvalues: v17 (copy)
    if v314 == nil then
        return nil;
    else
        for __, v316 in (v314:GetDescendants()) do
            if v17 then
                if v316:IsA(v313) and v316.Name == v312 then
                    return v316;
                end;
            elseif v316.Name == v312 and v316:IsA(v313) then
                return v316;
            end;
        end;
        return;
    end;
end;
getHead = function(v317) --[[ Line: 2181 ]] --[[ Name: getHead ]]
    -- upvalues: v13 (copy)
    if not v317 then
        return nil;
    else
        local v318 = nil;
        local v319 = getFaceControls(v317);
        if v319 ~= nil then
            if v13 then
                if v319.Parent and (v319.Parent.ClassName == "MeshPart" or v319.Parent.ClassName == "Part") then
                    v318 = v319.Parent;
                end;
            else
                v318 = v319.Parent;
            end;
        end;
        if not v318 then
            v318 = findObjectOfNameAndTypeName("Head", "MeshPart", v317) or findObjectOfNameAndTypeName("Head", "Part", v317);
        end;
        debugPrint("Self View: fn getHead(), head: " .. tostring(v318));
        return v318;
    end;
end;
getAnimator = function(v320, v321) --[[ Line: 2220 ]] --[[ Name: getAnimator ]]
    -- upvalues: v10 (copy), v11 (copy)
    if v320 == nil then
        return nil;
    else
        local v322 = nil;
        local v323 = nil;
        if v321 > 0 then
            if v10 then
                if v11 then
                    local v324 = v320:WaitForChild("Humanoid", v321);
                    v323 = if v324 then if v324:IsA("Humanoid") then v324 else v320:FindFirstChildWhichIsA("Humanoid") else v320:FindFirstChildWhichIsA("Humanoid");
                else
                    local v325 = v320:WaitForChild("Humanoid", v321);
                    v323 = if v325:IsA("Humanoid") then v325 else v320:FindFirstChildWhichIsA("Humanoid");
                end;
            else
                v323 = v320:WaitForChild("Humanoid", v321);
            end;
        else
            v323 = if v10 then v320:FindFirstChildWhichIsA("Humanoid") else v320:FindFirstChild("Humanoid");
        end;
        if v323 ~= nil then
            v322 = if v321 > 0 then v323:WaitForChild("Animator", v321) else v323:FindFirstChild("Animator");
        end;
        if v322 == nil then
            v322 = v320:FindFirstChildWhichIsA("Animator", true);
        end;
        return v322;
    end;
end;
local function v326(v327) --[[ Line: 2276 ]] --[[ Name: disableScripts ]]
    -- upvalues: v326 (copy)
    for __, v329 in v327:GetChildren() do
        if v329:IsA("Script") then
            v329.Disabled = true;
            v329.Parent = nil;
        end;
        v326(v329);
    end;
end;
local function v330(v331) --[[ Line: 2287 ]] --[[ Name: removeUI ]]
    -- upvalues: v330 (copy)
    for __, v333 in v331:GetChildren() do
        if v333:IsA("GuiObject") or v333:IsA("ScreenGui") or v333:IsA("BillboardGui") or v333:IsA("AdGui") or v333:IsA("SurfaceGui") then
            v333.Parent = nil;
        end;
        v330(v333);
    end;
end;
local function v334(v335) --[[ Line: 2303 ]] --[[ Name: removeInstancesStrict ]]
    -- upvalues: v138 (copy), v334 (copy)
    for __, v337 in v335:GetChildren() do
        if not v138[v337.ClassName] then
            v337.Parent = nil;
        end;
        v334(v337);
    end;
end;
local function __(v338) --[[ Line: 2314 ]] --[[ Name: sanitize ]]
    -- upvalues: v334 (copy)
    if not v338 then
        return;
    else
        v334(v338);
        return;
    end;
end;
removeTagsFromSelfViewClone = function(v340) --[[ Line: 2322 ]] --[[ Name: removeTagsFromSelfViewClone ]]
    -- upvalues: l_CollectionService_0 (copy), v15 (copy)
    if v340 == nil then
        return;
    else
        local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v340);
        for __, v343 in ipairs(l_l_CollectionService_0_Tags_0) do
            if v15 then
                if v343 ~= "NoFace" then
                    l_CollectionService_0:RemoveTag(v340, v343);
                end;
            else
                l_CollectionService_0:RemoveTag(v340, v343);
            end;
        end;
        for __, v345 in ipairs(v340:GetDescendants()) do
            local l_l_CollectionService_0_Tags_1 = l_CollectionService_0:GetTags(v345);
            for __, v348 in ipairs(l_l_CollectionService_0_Tags_1) do
                if v15 then
                    if v348 ~= "NoFace" then
                        l_CollectionService_0:RemoveTag(v345, v348);
                    end;
                else
                    l_CollectionService_0:RemoveTag(v345, v348);
                end;
            end;
        end;
        return;
    end;
end;
local function v378(v349) --[[ Line: 2354 ]] --[[ Name: updateClone ]]
    -- upvalues: v114 (ref), v102 (ref), v12 (copy), v17 (copy), v135 (copy), v136 (copy), l_CollectionService_0 (copy), v334 (copy), v101 (ref), l_CFrameUtility_0 (copy), l_CharacterUtility_0 (copy), v100 (ref), v73 (ref), v104 (ref), v105 (ref), v106 (ref), v98 (ref), v10 (copy), v90 (ref), l_game_EngineFeature_1 (copy), v1 (ref), v303 (copy), v140 (copy), v141 (copy)
    debugPrint("Self View: updateClone()");
    clearClone();
    v114 = false;
    if not v349 then
        return;
    else
        startRenderStepped(v349);
        if not v349 or not v349.Character then
            return;
        else
            local v350 = v349.Character or v349.CharacterAdded:Wait();
            if not v350 then
                return;
            else
                debugPrint("Self View: updateClone(): character:" .. tostring(v350));
                local v351 = getAnimator(v350, 10);
                clearCloneCharacter();
                local l_Archivable_0 = v350.Archivable;
                v350.Archivable = true;
                local v353 = getHead(v350);
                v102 = v350:Clone();
                if v12 and v102 == nil then
                    return;
                else
                    if not v17 then
                        removeTagsFromSelfViewClone(v102);
                    end;
                    for __, v355 in ipairs(v102:GetDescendants()) do
                        if v355:IsA("Motor6D") then
                            v355.C0 = CFrame.new(v355.C0.Position);
                            v355.C1 = CFrame.new(v355.C1.Position);
                        end;
                    end;
                    for __, v357 in ipairs(v102:GetDescendants()) do
                        if v357:IsA("Decal") then
                            v357.Transparency = 0;
                        elseif v357:IsA("MeshPart") then
                            if v357.Parent and v357.Parent:IsA("Accessory") or table.find(v135, v357.Name) then
                                if not table.find(v136, v357.MeshId) then
                                    v136[v357.MeshId] = v357.Transparency;
                                else
                                    v357.Transparency = v136[v357.MeshId];
                                end;
                            end;
                        elseif v357:IsA("Part") then
                            if v357.Parent and v357.Parent:IsA("Accessory") or table.find(v135, v357.Name) then
                                v357.Transparency = 0;
                            end;
                            if v17 and l_CollectionService_0:HasTag(v357, "__RBX__LOCKED_TRANSPARENT") then
                                v357.Transparency = 1;
                            end;
                        end;
                    end;
                    if v17 then
                        removeTagsFromSelfViewClone(v102);
                    end;
                    v102.Name = "SelfAvatar";
                    local l_Animate_0 = v102:FindFirstChild("Animate");
                    if l_Animate_0 then
                        l_Animate_0:Destroy();
                    end;
                    l_Animate_0 = v102:FindFirstChild("Health");
                    if l_Animate_0 then
                        l_Animate_0:Destroy();
                    end;
                    local l_v102_0 = v102;
                    if l_v102_0 then
                        v334(l_v102_0);
                    end;
                    for __, v361 in pairs(v102:GetDescendants()) do
                        if v361:IsA("BaseScript") then
                            v361:Destroy();
                        end;
                    end;
                    v350.Archivable = l_Archivable_0;
                    if v102 == nil then
                        debugPrint("Self View: updateClone: no clone could be created");
                        return;
                    else
                        v102.Parent = v101;
                        v114 = true;
                        l_v102_0 = v102:FindFirstChild("HumanoidRootPart");
                        if l_v102_0 then
                            debugPrint("Self View: cloneRootPart: " .. l_v102_0.Name);
                            l_v102_0.CFrame = CFrame.new((Vector3.new(0, 0, 0, 0)));
                            if v353 then
                                l_Animate_0 = getHead(v102);
                                if not v12 or l_Animate_0 then
                                    local v362 = l_CFrameUtility_0.CalculateTargetCFrame(l_Animate_0.CFrame);
                                    local v363, v364 = l_CharacterUtility_0.CalculateHeadExtents(v102, v362);
                                    local v365 = Vector3.new(v363.X, v363.Y, v363.Z);
                                    v100 = Vector3.new(v364.X, v364.Y, v364.Z) - v365;
                                    v73 = l_Animate_0.Size.Y;
                                    local v366 = math.min(v100.X, v100.Y);
                                    v366 = math.min(v100.X, v100.Z);
                                    local l_Model_0 = Instance.new("Model");
                                    l_Model_0.Parent = v102;
                                    v350.Archivable = true;
                                    v104 = l_Animate_0:Clone();
                                    v104.CanCollide = false;
                                    v104.Parent = l_Model_0;
                                    v105 = getNeck(v102, v104);
                                    v106 = v104.CFrame;
                                    v104:Destroy();
                                    local v368 = v106.Position + v106.LookVector * (v366 * 2);
                                    v98.CFrame = CFrame.lookAt(v368 + Vector3.new(0, 0.10499999672174454, -0.25, 0), v106.Position);
                                    v98.Focus = v106;
                                    v350.Archivable = l_Archivable_0;
                                    l_Model_0:Destroy();
                                end;
                            else
                                l_Animate_0 = l_v102_0.Position + l_v102_0.CFrame.LookVector * 2.5;
                                v98.CFrame = CFrame.lookAt(l_Animate_0 + Vector3.new(0, 1.5, 0, 0), l_v102_0.Position);
                                v98.CFrame = CFrame.new(v98.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                            end;
                        end;
                        if v102 == nil then
                            debugPrint("Self View: updateClone: no clone could be created");
                            return;
                        else
                            debugPrint("Self View: clone:" .. tostring(v102));
                            l_Animate_0 = nil;
                            l_Animate_0 = if v10 then v102:FindFirstChildWhichIsA("Humanoid") else v102:FindFirstChild("Humanoid");
                            if l_Animate_0 then
                                l_Animate_0.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                            end;
                            v90 = getAnimator(v102, 0);
                            if v90 then
                                if not l_game_EngineFeature_1 then
                                    local l_v90_PlayingAnimationTracks_0 = v90:GetPlayingAnimationTracks();
                                    local l_v90_PlayingAnimationTracksCoreScript_0 = v90:GetPlayingAnimationTracksCoreScript();
                                    for __, v372 in ipairs(l_v90_PlayingAnimationTracks_0) do
                                        if v372 ~= nil then
                                            v372:Stop(0);
                                            v372:Destroy();
                                        end;
                                    end;
                                    for __, v374 in ipairs(l_v90_PlayingAnimationTracksCoreScript_0) do
                                        if v374 ~= nil then
                                            v374:Stop(0);
                                            v374:Destroy();
                                        end;
                                    end;
                                    if v1 then
                                        v1:Destroy();
                                        v1 = nil;
                                    end;
                                end;
                                if v351 then
                                    if l_game_EngineFeature_1 then
                                        v90:SynchronizeWith(v351);
                                    else
                                        for __, v376 in ipairs(v351:GetPlayingAnimationTracksCoreScript()) do
                                            v303(v90, v376);
                                        end;
                                        v140[v141.AnimationPlayedCoreScript] = v351.AnimationPlayedCoreScript:Connect(function(v377) --[[ Line: 2587 ]]
                                            -- upvalues: v303 (ref), v90 (ref)
                                            v303(v90, v377);
                                        end);
                                    end;
                                    v114 = true;
                                    setCloneDirty(false);
                                    return;
                                else
                                    debugPrint("Self View: updateClone: no animator (original)!");
                                    return;
                                end;
                            else
                                debugPrint("Self View: updateClone: cloneAnimator is NIL");
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local __ = function(v379, v380) --[[ Line: 2607 ]] --[[ Name: hasProperty ]]
    local __ = v379[v380];
end;
updateCachedHeadColor = function(v383) --[[ Line: 2611 ]] --[[ Name: updateCachedHeadColor ]]
    -- upvalues: v93 (ref), v94 (ref)
    if v383 == nil then
        return;
    else
        if pcall(function() --[[ Line: 2616 ]]
            -- upvalues: v383 (copy)
            local __ = v383.Color;
        end) then
            v93 = v383.Color;
            if pcall(function() --[[ Line: 2622 ]]
                -- upvalues: v383 (copy)
                local __ = v383.Size;
            end) then
                v94 = v383.Size;
            end;
        end;
        return;
    end;
end;
addHumanoidStateChangedObserver = function(v386) --[[ Line: 2632 ]] --[[ Name: addHumanoidStateChangedObserver ]]
    -- upvalues: v140 (copy), v141 (copy)
    if not v386 then
        return;
    else
        if not v140[v141.HumanoidStateChanged] then
            v140[v141.HumanoidStateChanged] = v386.StateChanged:Connect(function(v387, v388) --[[ Line: 2637 ]]
                if v387 == Enum.HumanoidStateType.PlatformStanding and v388 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v388 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return;
    end;
end;
local function v393(v389) --[[ Line: 2650 ]] --[[ Name: characterAdded ]]
    -- upvalues: v17 (copy), v112 (ref), v97 (ref), v103 (ref), v141 (copy), v10 (copy), v140 (copy), v131 (ref), v132 (ref), v139 (copy)
    if v17 and (not v112 or v97 == nil) then
        return;
    else
        v103 = getHead(v389);
        updateCachedHeadColor(v103);
        clearObserver(v141.DescendantAdded);
        clearObserver(v141.DescendantRemoving);
        clearObserver(v141.HeadSize);
        clearObserver(v141.Color);
        local v390 = nil;
        v390 = if v10 then v389:FindFirstChildWhichIsA("Humanoid") else v389:FindFirstChild("Humanoid");
        if v390 then
            addHumanoidStateChangedObserver(v390);
        end;
        v140[v141.DescendantAdded] = v389.DescendantAdded:Connect(function(v391) --[[ Line: 2676 ]]
            -- upvalues: v17 (ref), v112 (ref), v97 (ref), v103 (ref), v389 (copy), v131 (ref), v132 (ref), v10 (ref), v139 (ref)
            if v17 and (not v112 or v97 == nil) then
                return;
            else
                if v391.Name == "Head" then
                    v103 = getHead(v389);
                    updateCachedHeadColor(v103);
                    if not v131 and v391:IsA("MeshPart") then
                        if v391:WaitForChild("FaceControls", 0.5) == nil then
                            v132 = false;
                        else
                            v132 = true;
                        end;
                    end;
                end;
                if v10 then
                    if v391:IsA("Humanoid") then
                        addHumanoidStateChangedObserver(v391);
                    end;
                elseif v391.Name == "Humanoid" or v391:IsA("Humanoid") then
                    addHumanoidStateChangedObserver(v391);
                end;
                if v391:IsA("MeshPart") or v391:IsA("Part") or v391:IsA("Decal") then
                    if v391.Transparency < 1 then
                        setCloneDirty(true);
                        return;
                    end;
                elseif v139[v391.ClassName] then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        v140[v141.DescendantRemoving] = v389.DescendantRemoving:Connect(function(v392) --[[ Line: 2722 ]]
            -- upvalues: v17 (ref), v112 (ref), v97 (ref), v139 (ref)
            if v17 and (not v112 or v97 == nil) then
                return;
            else
                if v392 and (v392:IsA("MeshPart") or v392:IsA("Accessory")) and v392:IsA("MeshPart") then
                    debugPrint("MeshId:" .. tostring(v392.MeshId));
                    if v392.MeshId == "" then
                        return;
                    end;
                end;
                if v392:IsA("MeshPart") or v392:IsA("Part") or v392:IsA("Decal") then
                    if v392.Transparency < 1 then
                        setCloneDirty(true);
                        return;
                    end;
                elseif v139[v392.ClassName] then
                    setCloneDirty(true);
                end;
                return;
            end;
        end);
        setCloneDirty(true);
        return;
    end;
end;
connectToVoiceJoinProgressChanged = function() --[[ Line: 2752 ]] --[[ Name: connectToVoiceJoinProgressChanged ]]
    -- upvalues: v18 (copy), v89 (ref), l_default_0 (copy), v36 (copy)
    if v18 and not v89 then
        v89 = l_default_0.VoiceJoinProgressChanged.Event:Connect(function(v394) --[[ Line: 2755 ]]
            -- upvalues: v36 (ref)
            if v394 == v36.VOICE_JOIN_PROGRESS.Joined then
                initVoiceChatServiceManager();
            end;
        end);
    end;
end;
ReInit = function(v395) --[[ Line: 2764 ]] --[[ Name: ReInit ]]
    -- upvalues: v114 (ref), v103 (ref), v141 (copy), v293 (copy)
    debugPrint("Self View: ReInit()");
    v114 = false;
    v103 = getHead(v395.Character);
    updateCachedHeadColor(v103);
    setCloneDirty(false);
    clearObserver(v141.CharacterAdded);
    clearObserver(v141.CharacterRemoving);
    clearClone();
    v293();
    playerAdded(v395);
    startRenderStepped(v395);
    connectToVoiceJoinProgressChanged();
end;
local function v398(v396) --[[ Line: 2780 ]] --[[ Name: onCharacterAdded ]]
    -- upvalues: v81 (ref), l_Players_0 (copy), v141 (copy), v10 (copy)
    v81:Disconnect();
    ReInit(l_Players_0.LocalPlayer);
    clearObserver(v141.HumanoidStateChanged);
    local v397 = nil;
    v397 = if v10 then v396:FindFirstChildWhichIsA("Humanoid") else v396:FindFirstChild("Humanoid");
    if v397 then
        addHumanoidStateChangedObserver(v397);
    end;
end;
playerAdded = function(v399) --[[ Line: 2800 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_Players_0 (copy), v81 (ref), v141 (copy), v398 (copy), v393 (copy), v140 (copy), v378 (copy)
    if v399 ~= nil and v399 == l_Players_0.LocalPlayer then
        debugPrint("Self View: playerAdded()");
        if v81 ~= nil then
            v81:Disconnect();
            v81 = nil;
            clearObserver(v141.CharacterAdded);
        end;
        local v400 = v399.Character or v399.CharacterAdded:Wait();
        v81 = v399.CharacterAdded:Connect(v398);
        v393(v400);
        v140[v141.CharacterAdded] = v399.CharacterAdded:Connect(v393);
        v140[v141.CharacterRemoving] = v399.CharacterRemoving:Connect(function() --[[ Line: 2818 ]]
            -- upvalues: v141 (ref), v378 (ref)
            clearObserver(v141.DescendantAdded);
            clearObserver(v141.DescendantRemoving);
            clearObserver(v141.HeadSize);
            clearObserver(v141.Color);
            v378(nil);
            clearObserver(v141.CharacterRemoving);
        end);
    end;
end;
stopRenderStepped = function() --[[ Line: 2829 ]] --[[ Name: stopRenderStepped ]]
    -- upvalues: v80 (ref)
    if v80 then
        v80:Disconnect();
        v80 = nil;
    end;
end;
updateClonePartsColor = function(v401) --[[ Line: 2836 ]] --[[ Name: updateClonePartsColor ]]
    -- upvalues: v103 (ref), v93 (ref), l_Players_0 (copy), v102 (ref)
    if pcall(function() --[[ Line: 2837 ]]
        -- upvalues: v103 (ref)
        local __ = v103.Color;
    end) and v103.Color ~= v93 then
        local l_Character_0 = l_Players_0.LocalPlayer.Character;
        if not l_Character_0 then
            return;
        elseif not v102 then
            return;
        else
            for __, v405 in pairs(l_Character_0:GetChildren()) do
                if v405:IsA("MeshPart") then
                    local l_v102_FirstChild_0 = v102:FindFirstChild(v405.Name);
                    if l_v102_FirstChild_0 and l_v102_FirstChild_0:IsA("MeshPart") and l_v102_FirstChild_0.Color and v405.Color then
                        l_v102_FirstChild_0.Color = v405.Color;
                    end;
                end;
            end;
        end;
    end;
    v93 = v401;
end;
prepMicAndCamPropertyChangedSignalHandler = function() --[[ Line: 2867 ]] --[[ Name: prepMicAndCamPropertyChangedSignalHandler ]]
    -- upvalues: v83 (ref), l_game_Service_0 (copy), v299 (copy), v84 (ref), v85 (ref), l_game_Service_1 (copy), v86 (ref), v87 (ref)
    debugPrint("Self View: prepMicAndCamPropertyChangedSignalHandler()");
    if not v83 then
        v83 = l_game_Service_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function() --[[ Line: 2872 ]]
            -- upvalues: v299 (ref)
            v299();
        end);
    end;
    if not v84 then
        v84 = l_game_Service_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(function() --[[ Line: 2880 ]]
            -- upvalues: v299 (ref)
            v299();
        end);
    end;
    if not v85 then
        v85 = l_game_Service_1.Started:Connect(function() --[[ Line: 2886 ]]
            -- upvalues: v299 (ref)
            debugPrint("Self View: VideoCaptureService.Started event");
            getPermissions();
            v299();
        end);
    end;
    if not v86 then
        v86 = l_game_Service_1.Stopped:Connect(function() --[[ Line: 2894 ]]
            -- upvalues: v299 (ref)
            debugPrint("Self View: VideoCaptureService.Stopped event");
            getPermissions();
            v299();
        end);
    end;
    if not v87 then
        v87 = l_game_Service_1.DevicesChanged:Connect(function() --[[ Line: 2902 ]]
            -- upvalues: v299 (ref)
            getPermissions();
            v299();
        end);
    end;
end;
trackSelfViewSessionAsNeeded = function() --[[ Line: 2909 ]] --[[ Name: trackSelfViewSessionAsNeeded ]]
    -- upvalues: v107 (ref), v118 (ref), v112 (ref), v119 (ref)
    if v107 then
        v118 = v107.Visible and v112;
        if v118 and v119 ~= v118 then
            startSelfViewSession();
        end;
        if not v118 and v119 ~= v118 then
            stopSelfViewSession();
        end;
        v119 = v118;
    end;
end;
frameShouldBeVisible = function(v407, v408) --[[ Line: 2922 ]] --[[ Name: frameShouldBeVisible ]]
    -- upvalues: v112 (ref), v115 (ref)
    if not v112 then
        return false;
    elseif not getShouldBeEnabledCoreGuiSetting() then
        return false;
    elseif v408 then
        return true;
    else
        if v115 == nil then
            v115 = 0;
        end;
        v115 = v115 + v407;
        debugPrint("Self View: noUsableCloneOffset: " .. tostring(v115));
        if v115 > 5 then
            v115 = nil;
            return false;
        else
            return true;
        end;
    end;
end;
startRenderStepped = function(v409) --[[ Line: 2956 ]] --[[ Name: startRenderStepped ]]
    -- upvalues: v299 (copy), v112 (ref), v80 (ref), l_RunService_0 (copy), v114 (ref), l_Players_0 (copy), v103 (ref), v90 (ref), l_game_EngineFeature_1 (copy), v92 (ref), v91 (ref), l_GetFFlagIrisGyroEnabled_0 (copy), l_UserInputService_1 (copy), v117 (ref), v102 (ref), v104 (ref), v105 (ref), v106 (ref), v98 (ref), v14 (copy), l_game_Service_0 (copy), l_game_EngineFeature_2 (copy), v100 (ref), v73 (ref), v94 (ref), v93 (ref), v127 (ref), v122 (ref), v128 (ref), v123 (ref), v74 (ref), v378 (copy), v107 (ref), v115 (ref)
    debugPrint("Self View: startRenderStepped()");
    stopRenderStepped();
    prepMicAndCamPropertyChangedSignalHandler();
    v299();
    if not v112 then
        return;
    else
        v80 = l_RunService_0.RenderStepped:Connect(function(v410) --[[ Line: 2969 ]]
            -- upvalues: v114 (ref), l_Players_0 (ref), v103 (ref), v90 (ref), l_game_EngineFeature_1 (ref), v92 (ref), v91 (ref), l_GetFFlagIrisGyroEnabled_0 (ref), l_UserInputService_1 (ref), v117 (ref), v102 (ref), v104 (ref), v105 (ref), v106 (ref), v98 (ref), v14 (ref), l_game_Service_0 (ref), l_game_EngineFeature_2 (ref), v100 (ref), v73 (ref), v94 (ref), v93 (ref), v127 (ref), v122 (ref), v128 (ref), v123 (ref), v299 (ref), v74 (ref), v378 (ref), v409 (copy), v107 (ref), v115 (ref)
            v114 = false;
            if l_Players_0.LocalPlayer then
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                if not l_Character_1 or l_Character_1.Parent == nil then
                    return;
                else
                    if v103 == nil or v103.Parent ~= l_Character_1 then
                        v103 = getHead(l_Character_1);
                    end;
                    if v103 then
                        local v412 = getAnimator(l_Character_1, 0);
                        if v90 ~= nil and v412 ~= nil then
                            v114 = true;
                            if not l_game_EngineFeature_1 then
                                local l_v90_PlayingAnimationTracks_1 = v90:GetPlayingAnimationTracks();
                                for __, v415 in pairs(l_v90_PlayingAnimationTracks_1) do
                                    if v415 ~= nil then
                                        v415:Stop(0);
                                    end;
                                end;
                                local l_v412_PlayingAnimationTracks_0 = v412:GetPlayingAnimationTracks();
                                local v417 = nil;
                                v92 = {};
                                for __, v419 in ipairs(l_v412_PlayingAnimationTracks_0) do
                                    v417 = v419.Animation;
                                    if v417 and v417:IsA("Animation") and v417.AnimationId ~= "" then
                                        v92[v417.AnimationId] = v419;
                                        if not v91[v417.AnimationId] then
                                            v91[v417.AnimationId] = v90:LoadAnimation(v417);
                                        end;
                                        local v420 = v91[v417.AnimationId];
                                        v420:Play();
                                        v420.TimePosition = v419.TimePosition;
                                        v420.Priority = v419.Priority;
                                        v420:AdjustWeight(v419.WeightCurrent, 0.1);
                                    end;
                                end;
                                for v421 in v91 do
                                    local v422 = v91[v421];
                                    if v422 then
                                        v417 = v422.Animation;
                                        if v417 and not v92[v417.AnimationId] then
                                            if v91[v417.AnimationId] ~= nil then
                                                v91[v417.AnimationId]:Stop(0);
                                            end;
                                            v91[v417.AnimationId] = nil;
                                        end;
                                    end;
                                end;
                                for __, v424 in ipairs(v412:GetPlayingAnimationTracksCoreScript()) do
                                    local l_v90_PlayingAnimationTracksCoreScript_1 = v90:GetPlayingAnimationTracksCoreScript();
                                    for __, v427 in pairs(l_v90_PlayingAnimationTracksCoreScript_1) do
                                        if v427.Animation:IsA("TrackerStreamAnimation") then
                                            v427.Priority = v424.Priority;
                                            v427:AdjustWeight(v424.WeightCurrent, 0);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v428 = nil;
                    local v429 = nil;
                    if l_GetFFlagIrisGyroEnabled_0() then
                        v428 = 0.5;
                        v429 = nil;
                        local l_l_UserInputService_1_Platform_0 = l_UserInputService_1:GetPlatform();
                        if (l_l_UserInputService_1_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_1_Platform_0 == Enum.Platform.Android) and v90 ~= nil then
                            local l_v90_PlayingAnimationTracksCoreScript_2 = v90:GetPlayingAnimationTracksCoreScript();
                            for __, v433 in pairs(l_v90_PlayingAnimationTracksCoreScript_2) do
                                if v433.Animation:IsA("TrackerStreamAnimation") then
                                    local l_v433_TrackerData_0, v435, v436 = v433:GetTrackerData();
                                    _ = l_v433_TrackerData_0;
                                    _ = v436;
                                    v429 = v435;
                                end;
                            end;
                        end;
                    end;
                    v117 = v117 + 1;
                    if v117 == 1 then
                        v117 = 0;
                        if v102 then
                            if not v104 then
                                v104 = getHead(v102);
                                if v104 then
                                    v105 = getNeck(v102, v104);
                                end;
                            end;
                            if v104 then
                                v106 = v104.CFrame;
                            end;
                        end;
                        if v98 and v104 then
                            local l_Position_1 = v104.Position;
                            local l_Position_2 = v104.Position;
                            local l_CFrame_0 = v104.CFrame;
                            if v105 then
                                local l_Part0_0 = v105.Part0;
                                local __ = v105.Part1;
                                local l_C0_0 = v105.C0;
                                local l_C1_0 = v105.C1;
                                local l_Transform_0 = v105.Transform;
                                if l_Part0_0 and l_C0_0 then
                                    l_CFrame_0 = l_Part0_0.CFrame * l_C0_0 * l_Transform_0 * l_C1_0:Inverse();
                                    l_Position_2 = Vector3.new(l_CFrame_0.Position.X * 0.25, (v104.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                    l_Position_1 = Vector3.new(l_CFrame_0.Position.X * 0.6, (v104.CFrame.Position.Y + l_CFrame_0.Position.Y + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                end;
                            else
                                debugPrint("Self View: no neck found");
                            end;
                            if v14 then
                                if l_game_Service_0 and l_game_Service_0.VideoAnimationEnabled and l_GetFFlagIrisGyroEnabled_0() and (v429 ~= nil or l_game_EngineFeature_2) then
                                    if l_game_EngineFeature_2 then
                                        local l_DeviceCameraCFrameForSelfView_0 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                        local l_Position_3 = l_DeviceCameraCFrameForSelfView_0.Position;
                                        local v447, v448, v449 = l_DeviceCameraCFrameForSelfView_0:ToEulerAnglesYXZ();
                                        local v450 = CFrame.fromEulerAnglesYXZ(v447, v448, v449);
                                        local v451 = 0;
                                        if l_Position_3.Z > 0 then
                                            v451 = math.clamp(0.5 - l_Position_3.Z * 3, -0.5, 0.5);
                                        end;
                                        local v452 = -(v100.Z + 1);
                                        local v453 = Vector3.new(0, 0.105, math.floor((v452 + v451 * v452) * 100) / 100);
                                        v98.CFrame = v98.CFrame:lerp(CFrame.lookAt(v450 * (l_Position_1 + v453), l_Position_2), 0.5);
                                    else
                                        local v454 = Vector3.new(0, 0.105, -(v100.Z + 1));
                                        local v455, v456, v457 = v429:ToEulerAnglesXYZ();
                                        local v458 = CFrame.Angles(-v455 * v428, -v456 * v428, -v457 * v428);
                                        v98.CFrame = CFrame.lookAt(v458 * (l_Position_1 + v454), l_Position_2);
                                    end;
                                else
                                    local v459 = Vector3.new(0, v73 * 0.25 - 1.25, -(v100.Z + 1) + 0.125);
                                    local l_Character_2 = l_Players_0.LocalPlayer.Character;
                                    if l_Character_2 then
                                        local l_Head_0 = l_Character_2:FindFirstChild("Head");
                                        if l_Head_0 then
                                            local l_HumanoidRootPart_0 = l_Character_2:FindFirstChild("HumanoidRootPart");
                                            if l_HumanoidRootPart_0 then
                                                local v463 = l_HumanoidRootPart_0.CFrame:Inverse() * l_Head_0.CFrame;
                                                local v464 = Vector3.new(v463.Position.x * 0.15 + 0.125, v463.Position.y, v463.Position.z * 0.05);
                                                v98.CFrame = CFrame.lookAt(l_Position_1 + v459 + v464, l_Position_2);
                                                v98.Focus = v104.CFrame;
                                            end;
                                        end;
                                    end;
                                end;
                            elseif l_GetFFlagIrisGyroEnabled_0() and (v429 ~= nil or l_game_EngineFeature_2) then
                                if l_game_EngineFeature_2 then
                                    local l_DeviceCameraCFrameForSelfView_1 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView();
                                    local l_Position_4 = l_DeviceCameraCFrameForSelfView_1.Position;
                                    local v467, v468, v469 = l_DeviceCameraCFrameForSelfView_1:ToEulerAnglesYXZ();
                                    local v470 = CFrame.fromEulerAnglesYXZ(v467, v468, v469);
                                    local v471 = 0;
                                    if l_Position_4.Z > 0 then
                                        v471 = math.clamp(0.5 - l_Position_4.Z * 3, -0.5, 0.5);
                                    end;
                                    local v472 = -(v100.Z + 1);
                                    local v473 = Vector3.new(0, 0.105, math.floor((v472 + v471 * v472) * 100) / 100);
                                    v98.CFrame = v98.CFrame:lerp(CFrame.lookAt(v470 * (l_Position_1 + v473), l_Position_2), 0.5);
                                else
                                    local v474 = Vector3.new(0, 0.105, -(v100.Z + 1));
                                    local v475, v476, v477 = v429:ToEulerAnglesXYZ();
                                    local v478 = CFrame.Angles(-v475 * v428, -v476 * v428, -v477 * v428);
                                    v98.CFrame = CFrame.lookAt(v478 * (l_Position_1 + v474), l_Position_2);
                                end;
                            else
                                local v479 = Vector3.new(0, v73 * 0.25, -(v100.Z + 1));
                                v98.CFrame = CFrame.lookAt(l_Position_1 + v479, l_Position_2);
                                v98.Focus = v104.CFrame;
                            end;
                        end;
                    end;
                    if v103 then
                        if v103.Size ~= v94 then
                            v94 = v103.Size;
                            setCloneDirty(true);
                        end;
                        if pcall(function() --[[ Line: 3258 ]]
                            -- upvalues: v103 (ref)
                            local __ = v103.Color;
                        end) and v103.Color ~= v93 then
                            updateClonePartsColor(v103.Color);
                        end;
                    end;
                end;
            end;
            if v127 ~= v122 or v128 ~= v123 then
                v299();
            end;
            if v74 > 0 then
                v74 = v74 - v410;
                if v74 <= 0 then
                    debugPrint("Self View: updateCloneCurrentCoolDown <= 0");
                    v378(v409);
                    v74 = 0;
                end;
            end;
            if v107 then
                if v114 then
                    v115 = nil;
                end;
                local v481 = frameShouldBeVisible(v410, v114);
                if v107.Visible ~= v481 then
                    v107.Visible = v481;
                end;
                trackSelfViewSessionAsNeeded();
            end;
        end);
        return;
    end;
end;
triggerAnalyticsReportExperienceSettings = function(v482) --[[ Line: 3298 ]] --[[ Name: triggerAnalyticsReportExperienceSettings ]]
    -- upvalues: v39 (copy), v53 (copy)
    v39:reportExperienceSettings(true, v53:IsEnabled(v482, Enum.AvatarChatServiceFeature.UniverseVideo) and v53:IsEnabled(v482, Enum.AvatarChatServiceFeature.PlaceVideo), v53:IsEnabled(v482, Enum.AvatarChatServiceFeature.UniverseAudio) and v53:IsEnabled(v482, Enum.AvatarChatServiceFeature.PlaceAudio));
    v39:reportUserAccountSettings(v53:IsEnabled(v482, Enum.AvatarChatServiceFeature.UserVideo), v53:IsEnabled(v482, Enum.AvatarChatServiceFeature.UserAudio));
end;
Initialize = function(v483) --[[ Line: 3313 ]] --[[ Name: Initialize ]]
    -- upvalues: v72 (ref), l_CoreGui_0 (copy), v39 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v20 (copy), v293 (copy), v55 (copy), l_Players_0 (copy), v141 (copy), v19 (copy), v89 (ref), v116 (ref)
    v72 = Instance.new("ScreenGui");
    v72.Name = "InExperienceCoreGui";
    v72.Parent = l_CoreGui_0;
    v72.DisplayOrder = -2;
    v72.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v484 = getShouldBeEnabledCoreGuiSetting();
    v39:reportSelfViewEnabledInCoreGuiState(v484);
    if not v484 then
        return;
    else
        if l_GetFFlagAvatarChatServiceEnabled_0() then
            if v53.ClientFeaturesInitialized then
                triggerAnalyticsReportExperienceSettings(v53.ClientFeatures);
            else
                local v485 = nil;
                do
                    local l_v485_0 = v485;
                    l_v485_0 = v53:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 3335 ]]
                        -- upvalues: v53 (ref), l_v485_0 (ref)
                        triggerAnalyticsReportExperienceSettings(v53.ClientFeatures);
                        l_v485_0:Disconnect();
                    end);
                end;
            end;
        end;
        if v20 then
            v293();
        end;
        if v55() then
            getMicPermission();
            getCameraPermissionWithoutRequest();
            updateSelfViewButtonVisibility();
        else
            getPermissions();
        end;
        if not v20 then
            v293();
        end;
        playerAdded(v483);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v487) --[[ Line: 3360 ]]
            -- upvalues: l_Players_0 (ref), v141 (ref), v19 (ref), v89 (ref)
            if v487 == l_Players_0.LocalPlayer then
                clearObserver(v141.HumanoidStateChanged);
                clearObserver(v141.CharacterAdded);
                clearObserver(v141.CharacterRemoving);
                clearClone();
                if v19 and v89 then
                    v89:Disconnect();
                    v89 = nil;
                end;
            end;
        end);
        connectToVoiceJoinProgressChanged();
        startRenderStepped(v483);
        v116 = true;
        displaySelfieViewByDefault();
        return;
    end;
end;
Initialize(l_Players_0.LocalPlayer);