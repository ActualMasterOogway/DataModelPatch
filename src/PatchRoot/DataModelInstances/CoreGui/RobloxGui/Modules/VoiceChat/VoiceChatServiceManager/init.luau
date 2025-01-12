local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v15 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local v17 = require(l_Modules_0.Common.IXPServiceWrapper);
local v18 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local v19 = require(script.Parent.Flags.GetFFlagDisableConsentModalForExistingUsers);
local v20 = require(script.Parent.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses);
local v21 = require(script.Parent.Flags.GetFFlagEnableConnectDisconnectPersistenceForReconnects);
local v22 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableUniveralVoiceToasts);
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoicePromptReasonText);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOldMenuUseSpeakerIcons);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v26 = require(v18.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat);
local v27 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v28 = require(v18.Flags.GetFFlagUseLuaSignalrConsumer);
local v29 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysMountVoicePrompt);
local l_GetFFlagNonVoiceFTUX_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX;
local v31 = require(v18.Flags.GetFFlagEnableNudgeAnalytics);
local v32 = require(v18.Flags.GetFFlagVoiceUseAudioRoutingAPI);
local v33 = require(l_RobloxGui_0.Modules.Flags.FFlagMuteNonFriendsEvent);
local v34 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShowMuteToggles);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local l_GetFFlagEnableShowVoiceUI_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShowVoiceUI;
local v37 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceConnectDisconnectButton);
local v38 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_GetFFlagUseMicPermForEnrollment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseMicPermForEnrollment;
local v41 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast);
local l_GetFFlagSeamlessVoiceConsentToastPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy;
local v43 = require(v18.Flags.GetFFlagEnableFtuxExitOnMuteToggle);
local v44 = game:DefineFastFlag("FixNudgeDeniedEvents", false);
local v45 = game:DefineFastFlag("DebugShowAudioDeviceInputDebugger", false);
local v46 = game:DefineFastFlag("FixMissingPermissionsAnalytics", false);
local v47 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v48 = game:DefineFastFlag("DebugSimulateConnectDisconnect", false);
local v49 = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false);
local v50 = game:DefineFastInt("DebugConnectDisconnectInterval", 15);
local v51 = require(v18.Flags.GetFFlagHideVoiceUIUntilInputExists)();
local v52 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
local v53 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceBanShowToastOnSubsequentJoins);
local v54 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUpdateNudgeV3VoiceBanUI);
local v55 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceUpsell);
local v56 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceConsentAnalytics);
local v57 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpMicPermissionsAnalytics);
local v58 = require(v18.Flags.GetFIntThrottleParticipantsUpdateMs);
local v59 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpJoinVoiceAnalytics);
local v60 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectAnalytics);
local v61 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSendDevicePermissionsModalAnalytics);
local v62 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local v63 = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure");
local v64 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v65 = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagShowDevicePermissionsModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal;
local v69 = game:DefineFastFlag("EnableRetryForLinkingProtocolFetch", false);
local v70 = game:DefineFastFlag("SeamlessVoiceBugfixesV1", false);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local v72 = game:DefineFastInt("LinkingProtocolFetchRetries", 1);
local v73 = game:DefineFastInt("LinkingProtocolFetchTimeoutMS", 1);
local v74 = game:DefineFastFlag("FixOutputDeviceChange", false);
local v75 = require(l_CorePackages_0.Workspace.Packages.VoiceChat);
local l_Constants_0 = v75.Constants;
local l_PostRecordUserSeenGeneralModal_0 = v75.AgeVerificationOverlay.PostRecordUserSeenGeneralModal;
local l_Flags_0 = v75.Flags;
local v79 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v80 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.Components.VoiceChatPrompt);
local v81 = require(l_RobloxGui_0.Modules.VoiceChat.Components.AudioDeviceInputDebugger);
local v82 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_GetUserSettings_0 = v75.GetUserSettings;
local l_GetInformedOfBan_0 = v75.GetInformedOfBan;
local l_PostInformedOfBan_0 = v75.PostInformedOfBan;
local v86 = require(l_RobloxGui_0.Modules.Settings.getCamMicPermissions);
local l_BAN_REASON_0 = v79.BAN_REASON;
local v88 = require(l_RobloxGui_0.Modules.Settings.Enum.SeamlessVoiceStatus);
local v89 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_Analytics_0 = v18.Analytics;
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v94 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v95 = require(l_RobloxGui_0.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v96 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v97 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local l_GetFFlagUsePostRecordUserSeenGeneralModal_0 = l_Flags_0.GetFFlagUsePostRecordUserSeenGeneralModal;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol.default;
local l_SettingsRoute_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute;
local v101 = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil;
local v102 = if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() then require(l_CorePackages_0.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil;
local l_CoreVoiceManager_0 = v18.CoreVoiceManager;
local l_Constants_1 = v18.Constants;
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_VOICE_STATE_0 = l_Constants_0.VOICE_STATE;
local l_VOICE_CHAT_DEVICE_TYPE_0 = l_Constants_0.VOICE_CHAT_DEVICE_TYPE;
local l_VOICE_CHAT_AVAILABILITY_0 = l_Constants_0.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_0 = l_Constants_0.MIN_VOICE_CHAT_API_VERSION;
local l_WATCHED_MESSAGE_TYPES_0 = l_Constants_0.WATCHED_MESSAGE_TYPES;
local l_PERMISSION_STATE_0 = l_Constants_0.PERMISSION_STATE;
local l_VOICE_JOIN_PROGRESS_0 = l_Constants_1.VOICE_JOIN_PROGRESS;
local v113 = {
    available = nil, 
    version = nil, 
    participants = nil, 
    recentUsersInteractionData = nil, 
    permissionPromise = nil, 
    canUseServicePromise = nil, 
    localMuted = nil, 
    isTalking = false, 
    previousGroupId = nil, 
    previousMutedState = nil, 
    userEligible = false, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    NotificationService = l_NotificationService_0, 
    runService = l_RunService_0, 
    PermissionsService = l_PermissionsProtocol_0.default, 
    communicationPermissionsResult = nil, 
    VoiceJoinProgress = l_VOICE_JOIN_PROGRESS_0.Idle, 
    VoiceJoinProgressChanged = Instance.new("BindableEvent"), 
    participantJoined = Instance.new("BindableEvent"), 
    participantLeft = Instance.new("BindableEvent"), 
    participantsUpdate = Instance.new("BindableEvent"), 
    muteChanged = Instance.new("BindableEvent"), 
    muteAllChanged = Instance.new("BindableEvent"), 
    attemptVoiceRejoin = Instance.new("BindableEvent"), 
    showVoiceUI = Instance.new("BindableEvent"), 
    hideVoiceUI = Instance.new("BindableEvent"), 
    voiceUIVisible = false, 
    mutedNonFriends = if v33 then Instance.new("BindableEvent") else nil, 
    userAgencySelected = if v34() then Instance.new("BindableEvent") else nil, 
    audioDeviceInputAdded = if v51 then Instance.new("BindableEvent") else nil, 
    sendMuteEvent = nil, 
    LikelySpeakingUsersEvent = nil, 
    muteAll = false, 
    mutedPlayers = {}, 
    talkingChanged = Instance.new("BindableEvent"), 
    SignalREventTable = {}, 
    audioDevices = {}, 
    service = nil, 
    previousSessionId = nil, 
    voiceEnabled = false, 
    VOICE_STATE = l_VOICE_STATE_0, 
    permissionState = if l_GetFFlagJoinWithoutMicPermissions_0() then l_PERMISSION_STATE_0.IDLE else nil, 
    isBanned = false, 
    bannedUntil = nil, 
    errorText = nil, 
    BlockStatusChanged = nil, 
    isInCall = false, 
    callMutedState = false, 
    banReason = nil, 
    _mutedAnyone = false, 
    VOICE_CHAT_DEVICE_TYPE = l_VOICE_CHAT_DEVICE_TYPE_0, 
    getPermissionsFunction = v86, 
    AvatarChatService = v96, 
    inExpUpsellEntrypoint = nil, 
    seamlessVoiceStatus = nil, 
    isShowingFTUX = false, 
    hideFTUXSignal = Instance.new("BindableEvent"), 
    settingsAppAvailable = nil, 
    hasLeftFTUX = false
};
local v114 = v4.Set.new({
    "available", 
    "participants", 
    "recentUsersInteractionData", 
    "permissionPromise", 
    "canUseServicePromise", 
    "localMuted", 
    "isTalking", 
    "previousGroupId", 
    "previousMutedState", 
    "userEligible", 
    "sendMuteEvent", 
    "LikelySpeakingUsersEvent", 
    "mutedPlayers", 
    "SignalREventTable", 
    "audioDevices", 
    "service", 
    "previousSessionId", 
    "voiceEnabled", 
    "permissionState", 
    "BlockStatusChanged", 
    "isInCall", 
    "callMutedState", 
    "attemptVoiceRejoin", 
    "VoiceJoinProgressChanged", 
    "participantJoined", 
    "participantLeft", 
    "participantsUpdate", 
    "muteChanged", 
    "audioDeviceInputAdded", 
    "talkingChanged"
});
v114:add("_mutedAnyone");
v114:add("muteAllChanged");
local v115 = {};
local v116 = {
    [v79.IN_EXP_UPSELL_VARIANT.VARIANT1] = v82.VoiceConsentModalV1, 
    [v79.IN_EXP_UPSELL_VARIANT.VARIANT2] = v82.VoiceConsentModalV2, 
    [v79.IN_EXP_UPSELL_VARIANT.VARIANT3] = v82.VoiceConsentModalV3
};
getIconSrc = function(v117, v118) --[[ Line: 312 ]] --[[ Name: getIconSrc ]]
    return "rbxasset://textures/ui/VoiceChat/" .. (v118 and v118 .. "/" or "") .. v117 .. ".png";
end;
getIcon = function(v119, v120, v121) --[[ Line: 317 ]] --[[ Name: getIcon ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    if v119 == l_VOICE_STATE_0.MUTED then
        return getIconSrc("Muted", v121);
    elseif v119 == l_VOICE_STATE_0.CONNECTING then
        return getIconSrc("Connecting", v121);
    elseif v119 == l_VOICE_STATE_0.INACTIVE then
        return getIconSrc("Blank", v121);
    elseif v119 == l_VOICE_STATE_0.TALKING then
        local v122 = 20 * math.floor(0.5 + 5 * (v120 or math.random()));
        return v120 and getIconSrc("Unmuted" .. tostring(v122), v121) or getIconSrc("Blank", v121);
    else
        return getIconSrc("Error", v121);
    end;
end;
v113.__index = v113;
v113.__index = function(v123, v124) --[[ Line: 335 ]] --[[ Name: __index ]]
    -- upvalues: v114 (copy), v113 (copy)
    if v114:has(v124) then
        return v123.coreVoiceManager[v124];
    else
        return (rawget(v113, v124));
    end;
end;
v113.__newindex = function(v125, v126, v127) --[[ Line: 342 ]] --[[ Name: __newindex ]]
    -- upvalues: v114 (copy), v113 (copy)
    if v114:has(v126) then
        v125.coreVoiceManager[v126] = v127;
        return;
    else
        rawset(v113, v126, v127);
        return;
    end;
end;
v113.new = function(v128, v129, v130, v131, v132, v133, v134, v135, v136) --[[ Line: 350 ]] --[[ Name: new ]]
    -- upvalues: l_Analytics_0 (copy), v86 (copy), v113 (copy), v28 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), v58 (copy), v17 (copy), v63 (copy), v64 (copy), v24 (copy), v57 (copy), v97 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v22 (copy), v47 (copy), v2 (copy), v52 (copy), v95 (copy), l_GetFFlagEnableShowVoiceUI_0 (copy), v62 (copy), v82 (copy), v48 (copy), v15 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), v41 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v60 (copy), v37 (copy)
    local v137 = setmetatable({
        service = v129, 
        HttpRbxApiService = v130, 
        NotificationService = v134, 
        PermissionsService = v131, 
        BlockStatusChanged = v132, 
        Analytics = l_Analytics_0.new(v133), 
        getPermissionsFunction = v135 or v86, 
        AvatarChatService = v136, 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        coreVoiceManager = v128, 
        _mutedAnyone = false
    }, v113);
    if v28() then
        for _, v139 in l_WATCHED_MESSAGE_TYPES_0 do
            v137.SignalREventTable[v139] = Instance.new("BindableEvent");
        end;
    end;
    v137.shouldThrottleParticipantUpdate = false;
    v137.participantsStateThrottleTime = 0;
    v137.lastParticipantsStateUpdate = 0;
    v137.lastStateUpdateCounter = 0;
    v137.reverseNudgeToxicUserRemovalCallbacks = {};
    if v58() > 0 then
        v137.participantsStateThrottleTime = v58() / 1000;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 390 ]]
            -- upvalues: v17 (ref), v63 (ref)
            return v17:GetLayerData(v63);
        end);
        if l_status_0 and l_result_0 and l_result_0[v64] then
            v137.shouldThrottleParticipantUpdate = true;
        end;
    end;
    local v142 = v24() and "SpeakerLight" or "MicLight";
    v137.MuteStatusIcons = {
        MicOn = v137:GetIcon("Unmuted0", v142), 
        MicOff = v137:GetIcon("Muted", v142), 
        MicDisabled = v137:GetIcon("Muted", v142), 
        Loading = v137:GetIcon("Connecting", v142), 
        Error = v137:GetIcon("Error", v142)
    };
    v137.PlayerMuteStatusIcons = {
        MicOn = v137:GetIcon("Unmuted0", "MicLight"), 
        MicOff = v137:GetIcon("Muted", "MicLight"), 
        MicDisabled = v137:GetIcon("Muted", "MicLight"), 
        Loading = v137:GetIcon("Connecting", "MicLight"), 
        Error = v137:GetIcon("Error", "MicLight")
    };
    local v143 = false;
    local v144 = v137.attemptVoiceRejoin.Event:Connect(function() --[[ Line: 416 ]]
        -- upvalues: v143 (ref)
        v143 = true;
    end);
    v137.coreVoiceManager:subscribe("GetPermissions", function(v145, v146, v147, v148) --[[ Line: 420 ]]
        -- upvalues: v57 (ref), v137 (copy)
        local v149 = "VoiceChatServiceManager.requestMicPermission";
        if v57() and v137.inExpUpsellEntrypoint ~= nil then
            v149 = v137.inExpUpsellEntrypoint;
        end;
        v137.getPermissionsFunction(v145, v146, v147, v149, v148);
    end);
    v137.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(v150) --[[ Line: 427 ]]
        -- upvalues: v97 (ref)
        if v97.Events.VoiceParticipantRemoved then
            v97.Events.VoiceParticipantRemoved((tostring(v150)));
        end;
    end);
    v137.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(v151) --[[ Line: 432 ]]
        -- upvalues: v97 (ref)
        if v97.Events.VoiceParticipantAdded then
            v97.Events.VoiceParticipantAdded((tostring(v151)));
        end;
    end);
    v137.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(v152, v153) --[[ Line: 437 ]]
        -- upvalues: v97 (ref)
        if v97.Events.VoiceParticipantToggleMuted then
            v97.Events.VoiceParticipantToggleMuted(tostring(v152), v153);
        end;
    end);
    if l_GetFFlagShowLikelySpeakingBubbles_0() then
        v137.coreVoiceManager:subscribe("OnLikelySpeakingUsersUpdated", function(v154) --[[ Line: 445 ]]
            -- upvalues: v97 (ref)
            if v97.Events.LikelySpeakingUsersUpdated then
                v97.Events.LikelySpeakingUsersUpdated(v154);
            end;
        end);
        v137.coreVoiceManager:subscribe("OnShowLikelySpeakingBubblesChanged", function(v155) --[[ Line: 453 ]]
            -- upvalues: v97 (ref)
            if v97.Events.ShowLikelySpeakingBubblesChanged then
                v97.Events.ShowLikelySpeakingBubblesChanged(v155);
            end;
        end);
    end;
    v137.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(v156, v157) --[[ Line: 459 ]]
        -- upvalues: v137 (copy)
        v137:_onUserAndPlaceCanUseVoiceResolved(v156, v157);
    end);
    v137.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function() --[[ Line: 462 ]]
        -- upvalues: v22 (ref), v137 (copy)
        if v22() then
            return v137:CheckAndShowNotAudiblePrompt();
        else
            return;
        end;
    end);
    v137.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 467 ]]
        -- upvalues: v22 (ref), v47 (ref), v137 (copy), v2 (ref)
        if v22() and not v47 then
            return v137:CheckAndShowPermissionPrompt():finallyReturn(v2.reject());
        else
            return;
        end;
    end);
    v137.coreVoiceManager:subscribe("OnDevicePlayerChanged", function() --[[ Line: 473 ]]
        -- upvalues: v137 (copy)
        v137:UpdateAudioDeviceInputDebugger();
    end);
    v137.coreVoiceManager:subscribe("OnDeviceActiveChanged", function() --[[ Line: 476 ]]
        -- upvalues: v137 (copy)
        v137:UpdateAudioDeviceInputDebugger();
    end);
    v137.coreVoiceManager:subscribe("OnDeviceMuteChanged", function() --[[ Line: 479 ]]
        -- upvalues: v137 (copy)
        v137:UpdateAudioDeviceInputDebugger();
    end);
    v137.coreVoiceManager:subscribe("OnStateChanged", function(_, v159) --[[ Line: 482 ]]
        -- upvalues: v52 (ref), v95 (ref), v137 (copy), l_GetFFlagEnableShowVoiceUI_0 (ref), v62 (ref), v82 (ref)
        if v52() then
            v95:setClientSessionId(v137.coreVoiceManager:GetSessionId());
        end;
        if l_GetFFlagEnableShowVoiceUI_0() and v159 == Enum.VoiceChatState.Ended and v137.bannedUntil == nil then
            if not v62() then
                v137:HideVoiceUI();
            end;
            v137:showPrompt(v82.LeaveVoice);
        end;
    end);
    v137.coreVoiceManager:subscribe("OnPlayerMuted", function() --[[ Line: 496 ]]
        -- upvalues: v137 (copy)
        v137:UpdateAudioDeviceInputDebugger();
    end);
    v137.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function() --[[ Line: 499 ]]
        -- upvalues: v137 (copy)
        v137:UpdateAudioDeviceInputDebugger();
    end);
    if l_GetFFlagEnableShowVoiceUI_0() then
        v137.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function() --[[ Line: 504 ]]
            -- upvalues: v137 (copy), v48 (ref), v15 (ref)
            v137:ShowVoiceUI();
            if v48 then
                v15:debug("Simulating join voice");
                v137:simulateVoiceConnectDisconnect();
            end;
        end);
    end;
    v137.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function() --[[ Line: 513 ]]
        -- upvalues: v137 (copy)
        v137:UpdateAudioDeviceInputDebugger();
    end);
    v137.coreVoiceManager:subscribe("OnInitialJoinFailed", function() --[[ Line: 516 ]]
        -- upvalues: v137 (copy)
        v137:InitialJoinFailedPrompt();
    end);
    v137.coreVoiceManager:subscribe("OnPlayerModerated", function() --[[ Line: 519 ]]
        -- upvalues: v137 (copy)
        v137:ShowPlayerModeratedMessage();
    end);
    v137.coreVoiceManager:subscribe("OnRetryRequested", function() --[[ Line: 523 ]]
        -- upvalues: v137 (copy), v82 (ref)
        v137:showPrompt(v82.Retry);
    end);
    v137.coreVoiceManager:subscribe("OnVoiceToxicityModal", function() --[[ Line: 526 ]]
        -- upvalues: v15 (ref), v137 (copy), v82 (ref)
        v15:debug("Showing Voice Toxicity Modal");
        v137:showPrompt(v82.VoiceToxicityModal);
    end);
    v137.coreVoiceManager:subscribe("OnVoiceToxicityToast", function() --[[ Line: 530 ]]
        -- upvalues: v15 (ref), v137 (copy), v82 (ref)
        v15:debug("Showing Voice Toxicity Toast");
        v137:showPrompt(v82.VoiceToxicityToast);
    end);
    v137.coreVoiceManager:subscribe("OnPermissionRequested", function() --[[ Line: 534 ]]
        -- upvalues: l_GetFFlagShowDevicePermissionsModal_0 (ref), v137 (copy), v82 (ref)
        if l_GetFFlagShowDevicePermissionsModal_0() then
            v137:showPrompt(v82.DevicePermissionsModal);
            return;
        else
            v137:showPrompt(v82.Permission);
            return;
        end;
    end);
    v137.coreVoiceManager:subscribe("OnShowDataConsentToast", function() --[[ Line: 541 ]]
        -- upvalues: v41 (ref), v137 (copy)
        if v41() then
            v137:showDataConsentToast();
        end;
    end);
    v137.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(v160) --[[ Line: 546 ]]
        -- upvalues: v15 (ref), v97 (ref), v137 (copy)
        v15:debug("Showing Reverse Nudge Icon Color Change");
        if v97.Events.AddReverseNudgeToxicUser and v97.Events.RemoveReverseNudgeToxicUser then
            v137:AddReverseNudgeToxicUser(v160.toxicUserId, v97.Events.AddReverseNudgeToxicUser, v97.Events.RemoveReverseNudgeToxicUser);
        end;
    end);
    v137.coreVoiceManager:subscribe("OnVoiceJoin", function() --[[ Line: 556 ]]
        -- upvalues: l_GetFFlagNonVoiceFTUX_0 (ref), v137 (copy), v82 (ref), v60 (ref), v37 (ref), v143 (ref), v144 (copy)
        if l_GetFFlagNonVoiceFTUX_0() and v137.hasLeftFTUX then
            v137.hasLeftFTUX = false;
            v137:showPrompt(v82.JoinedVoiceToast);
            if v60() then
                v137.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v137:GetConnectDisconnectAnalyticsData());
            end;
        elseif v37() and v137:IsSeamlessVoice() then
            v137:showPrompt(v82.JoinVoice);
            v137:SetVoiceConnectCookieValue(true);
        else
            v137:showPrompt(v82.VoiceConsentAcceptedToast);
        end;
        if v60() and v143 then
            v137.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v137:GetConnectDisconnectAnalyticsData());
            v144:Disconnect();
        end;
    end);
    return v137;
end;
local function _(v161) --[[ Line: 581 ]] --[[ Name: shorten ]]
    return "..." .. string.sub(tostring(v161), -4);
end;
local function _(v163, v164) --[[ Line: 585 ]] --[[ Name: bind ]]
    return function(...) --[[ Line: 586 ]]
        -- upvalues: v163 (copy), v164 (copy)
        return v163[v164](v163, ...);
    end;
end;
v113._reportJoinFailed = function(v166, v167, v168) --[[ Line: 591 ]] --[[ Name: _reportJoinFailed ]]
    return v166.coreVoiceManager:_reportJoinFailed(v167, v168);
end;
v113._asyncInit = function(v169) --[[ Line: 595 ]] --[[ Name: _asyncInit ]]
    return v169.coreVoiceManager:_asyncInit();
end;
v113.asyncInit = function(v170) --[[ Line: 599 ]] --[[ Name: asyncInit ]]
    return v170.coreVoiceManager:asyncInit();
end;
v113.CheckAudioInputExists = function(v171) --[[ Line: 603 ]] --[[ Name: CheckAudioInputExists ]]
    return v171.coreVoiceManager:CheckAudioInputExists();
end;
v113.getService = function(v172) --[[ Line: 607 ]] --[[ Name: getService ]]
    return v172.service;
end;
v113.GetMutedAnyone = function(v173) --[[ Line: 611 ]] --[[ Name: GetMutedAnyone ]]
    return v173.coreVoiceManager:GetMutedAnyone();
end;
v113.GetRequest = function(v174, v175, v176) --[[ Line: 615 ]] --[[ Name: GetRequest ]]
    return v174.coreVoiceManager:GetRequest(v175, v176);
end;
v113.PostRequest = function(v177, v178, _, v180) --[[ Line: 619 ]] --[[ Name: PostRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 620 ]]
        -- upvalues: v177 (copy), v178 (copy), v180 (copy), l_HttpService_0 (ref)
        local v181 = v177.HttpRbxApiService:PostAsyncFullUrl(v178, v180, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(v181);
    end);
    return l_status_1 and l_result_1;
end;
v113._GetShowAgeVerificationOverlay = function(v184, v185) --[[ Line: 641 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    -- upvalues: l_GetFFlagUseMicPermForEnrollment_0 (copy)
    return v184.coreVoiceManager:_GetShowAgeVerificationOverlay(if l_GetFFlagUseMicPermForEnrollment_0() then v185 else nil);
end;
v113.simulateVoiceConnectDisconnect = function(v186) --[[ Line: 647 ]] --[[ Name: simulateVoiceConnectDisconnect ]]
    -- upvalues: v50 (copy), v15 (copy)
    task.spawn(function() --[[ Line: 648 ]]
        -- upvalues: v50 (ref), v186 (copy), v15 (ref)
        while true do
            task.wait(v50);
            if v186.voiceUIVisible then
                v15:debug("Hiding Voice");
                v186:HideVoiceUI();
            else
                v15:debug("Showing Voice");
                v186:ShowVoiceUI();
            end;
        end;
    end);
end;
v113.FetchAgeVerificationOverlay = function(v187, v188) --[[ Line: 662 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    -- upvalues: l_GetFFlagUseMicPermForEnrollment_0 (copy)
    return v187.coreVoiceManager:FetchAgeVerificationOverlay(if l_GetFFlagUseMicPermForEnrollment_0() then v188 else nil);
end;
v113.FetchPhoneVerificationUpsell = function(v189, v190, v191, v192) --[[ Line: 668 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    return v189.coreVoiceManager:FetchPhoneVerificationUpsell(v190, v191, v192);
end;
v113.RecordUserSeenModal = function(v193, v194) --[[ Line: 676 ]] --[[ Name: RecordUserSeenModal ]]
    -- upvalues: l_GetFFlagUsePostRecordUserSeenGeneralModal_0 (copy), l_PostRecordUserSeenGeneralModal_0 (copy)
    if l_GetFFlagUsePostRecordUserSeenGeneralModal_0() then
        local l_l_PostRecordUserSeenGeneralModal_0_0 = l_PostRecordUserSeenGeneralModal_0;
        local v196 = "PostRequest";
        return l_l_PostRecordUserSeenGeneralModal_0_0(function(...) --[[ Line: 586 ]]
            -- upvalues: v193 (copy), v196 (copy)
            return v193[v196](v193, ...);
        end, v194);
    else
        return nil;
    end;
end;
v113.checkAndUpdateSequence = function(v197, v198, v199) --[[ Line: 683 ]] --[[ Name: checkAndUpdateSequence ]]
    return v197.coreVoiceManager:checkAndUpdateSequence(v198, v199);
end;
v113.onMissedSequence = function(v200, v201) --[[ Line: 687 ]] --[[ Name: onMissedSequence ]]
    return v200.coreVoiceManager:onMissedSequence(v201);
end;
v113.watchSignalR = function(v202) --[[ Line: 691 ]] --[[ Name: watchSignalR ]]
    return v202.coreVoiceManager:watchSignalR();
end;
v113.voicePermissionGranted = function(v203, v204) --[[ Line: 699 ]] --[[ Name: voicePermissionGranted ]]
    return v203.coreVoiceManager:voicePermissionGranted(v204);
end;
v113.GetSignalREvent = function(v205, v206) --[[ Line: 703 ]] --[[ Name: GetSignalREvent ]]
    return v205.coreVoiceManager:GetSignalREvent(v206);
end;
v113.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v207, v208) --[[ Line: 708 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    return v207.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(v208);
end;
v113.resolveAvatarChatUserAndPlaceSettings = function(v209) --[[ Line: 712 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    return v209.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings();
end;
v113.EnableVoice = function(v210) --[[ Line: 716 ]] --[[ Name: EnableVoice ]]
    return v210.coreVoiceManager:EnableVoice();
end;
v113._VoiceChatFirstTimeUX = function(v211, v212) --[[ Line: 720 ]] --[[ Name: _VoiceChatFirstTimeUX ]]
    -- upvalues: v79 (copy), v15 (copy), v60 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v97 (copy), v43 (copy), v65 (copy), v82 (copy)
    local v213 = nil;
    local v214 = nil;
    if not pcall(function() --[[ Line: 722 ]]
        -- upvalues: v212 (copy), v79 (ref), v213 (ref), v214 (ref)
        local l_v212_Item_0 = v212:GetItem(v79.SEAMLESS_VOICE_FTUX_KEY);
        local l_v212_Item_1 = v212:GetItem(v79.SEAMLESS_VOICE_STUX_KEY);
        v213 = l_v212_Item_0 == "true";
        v214 = l_v212_Item_1 == nil and 0 or tonumber(l_v212_Item_1);
    end) then
        v15:warning("Failed to read FTUX/STUX from AppStorage");
        return;
    else
        v15:trace("hasShownFTUX: {}. STUXCount: {}", v213, v214);
        if not v213 then
            v15:debug("Showing FTUX");
            v211.isShowingFTUX = true;
            if v60() then
                v211.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", v211:GetConnectDisconnectAnalyticsData());
            end;
            if l_GetFFlagNonVoiceFTUX_0() then
                v97.Events.VoiceUIVisibilityChanged(true);
            else
                v211:MuteAll(true, "FTUX");
                if v97.Events.ShowLikelySpeakingBubblesChanged and v97.Events.LikelySpeakingUsersUpdated then
                    v15:debug("Showing likely speaking bubbles");
                    local v217 = {};
                    v97.Events.ShowLikelySpeakingBubblesChanged(true);
                    local v218 = v211.participants or {};
                    for v219 in v218 do
                        v217[v219] = true;
                    end;
                    v97.Events.LikelySpeakingUsersUpdated(v217);
                    v218 = v211.participantJoined.Event:Connect(function(v220) --[[ Line: 759 ]]
                        -- upvalues: v217 (copy), v97 (ref)
                        v217[v220] = true;
                        v97.Events.LikelySpeakingUsersUpdated(v217);
                    end);
                    v211.hideFTUXSignal.Event:Connect(function() --[[ Line: 763 ]]
                        -- upvalues: v218 (copy), v97 (ref)
                        v218:Disconnect();
                        v97.Events.ShowLikelySpeakingBubblesChanged(false);
                        v97.Events.LikelySpeakingUsersUpdated({});
                    end);
                    v211.hideVoiceUI.Event:Once(function() --[[ Line: 768 ]]
                        -- upvalues: v97 (ref)
                        v97.Events.ShowLikelySpeakingBubblesChanged(false);
                        v97.Events.LikelySpeakingUsersUpdated({});
                    end);
                    v211.muteAllChanged.Event:Once(function() --[[ Line: 772 ]]
                        -- upvalues: v211 (copy), v212 (copy), v60 (ref)
                        v211:HideFTUX(v212);
                        if v60() then
                            v211.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", v211:GetConnectDisconnectAnalyticsData());
                        end;
                    end);
                    v211.talkingChanged.Event:Once(function() --[[ Line: 781 ]]
                        -- upvalues: v211 (copy), v212 (copy)
                        v211:HideFTUX(v212);
                    end);
                    if v43() then
                        v211.coreVoiceManager.onPlayerMuteToggled.Event:Once(function() --[[ Line: 785 ]]
                            -- upvalues: v211 (copy), v212 (copy)
                            v211:HideFTUX(v212);
                        end);
                    end;
                end;
            end;
        elseif v214 < v65 then
            v15:debug("Showing STUX");
            v211:showPrompt(v82.JoinVoiceSTUX);
            pcall(function() --[[ Line: 794 ]]
                -- upvalues: v212 (copy), v79 (ref), v214 (ref)
                v212:SetItem(v79.SEAMLESS_VOICE_STUX_KEY, (tostring(v214 + 1)));
                v212:Flush();
            end);
        end;
        return;
    end;
end;
v113.VoiceChatFirstTimeUX = function(v221, v222) --[[ Line: 801 ]] --[[ Name: VoiceChatFirstTimeUX ]]
    -- upvalues: v49 (copy), v70 (copy), v79 (copy), v15 (copy), l_GetFFlagNonVoiceFTUX_0 (copy)
    if not v49 then
        local v223 = v221:FetchAgeVerificationOverlay();
        if v70 then
            if type(v223) == "table" and v223.voiceSettings and v223.voiceSettings.seamlessVoiceStatus ~= v79.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
                v15:debug("User not eligible for FTUX/STUX");
                return;
            end;
        elseif v223.voiceSettings and v223.voiceSettings.seamlessVoiceStatus ~= v79.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
            v15:debug("User not eligible for FTUX/STUX");
            return;
        end;
    end;
    local function _() --[[ Line: 826 ]] --[[ Name: startFTUX ]]
        -- upvalues: v15 (ref), v221 (copy), v222 (copy)
        v15:debug("Starting FTUX");
        v221:_VoiceChatFirstTimeUX(v222);
    end;
    if l_GetFFlagNonVoiceFTUX_0() then
        v15:debug("Starting FTUX");
        v221:_VoiceChatFirstTimeUX(v222);
        return;
    else
        v221:asyncInit():andThen(function() --[[ Line: 834 ]]
            -- upvalues: v221 (copy), v15 (ref), v222 (copy)
            local v225 = nil;
            if v221.service.VoiceChatState and v221.service.VoiceChatState == Enum.VoiceChatState.Joined then
                v15:debug("Starting FTUX");
                v221:_VoiceChatFirstTimeUX(v222);
            end;
            v225 = v221.service.StateChanged:Connect(function(_, v227) --[[ Line: 839 ]]
                -- upvalues: v15 (ref), v221 (ref), v222 (ref), v225 (ref)
                if v227 == Enum.VoiceChatState.Joined then
                    v15:debug("Starting FTUX");
                    v221:_VoiceChatFirstTimeUX(v222);
                    v225:Disconnect();
                end;
            end);
        end):catch(function(v228) --[[ Line: 846 ]]
            -- upvalues: v15 (ref)
            v15:trace("Failed to start FTUX: {}", v228);
        end);
        return;
    end;
end;
v113.HideFTUX = function(v229, v230) --[[ Line: 852 ]] --[[ Name: HideFTUX ]]
    -- upvalues: v79 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v82 (copy)
    v229.isShowingFTUX = false;
    v229.hideFTUXSignal:Fire();
    pcall(function() --[[ Line: 855 ]]
        -- upvalues: v230 (copy), v79 (ref)
        v230:SetItem(v79.SEAMLESS_VOICE_FTUX_KEY, "true");
        v230:Flush();
    end);
    if l_GetFFlagNonVoiceFTUX_0() then
        v229.hasLeftFTUX = true;
        v229.attemptVoiceRejoin:Fire();
    end;
    if not l_GetFFlagNonVoiceFTUX_0() then
        v229:MuteAll(false, "FTUX");
        v229:showPrompt(v82.JoinedVoiceToast);
    end;
end;
v113._onUserAndPlaceCanUseVoiceResolved = function(v231, v232, v233) --[[ Line: 869 ]] --[[ Name: _onUserAndPlaceCanUseVoiceResolved ]]
    -- upvalues: l_GetInformedOfBan_0 (copy), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v26 (copy), v82 (copy), v54 (copy), l_BAN_REASON_0 (copy), v53 (copy), v23 (copy)
    v231.bannedUntil = nil;
    if v232 and v232.isBanned then
        local l_l_GetInformedOfBan_0_0 = l_GetInformedOfBan_0;
        local v235 = "GetRequest";
        l_l_GetInformedOfBan_0_0 = l_l_GetInformedOfBan_0_0(function(...) --[[ Line: 586 ]]
            -- upvalues: v231 (copy), v235 (copy)
            return v231[v235](v231, ...);
        end);
        if l_l_GetInformedOfBan_0_0 and not l_l_GetInformedOfBan_0_0.informedOfBan then
            if l_GetFFlagAvatarChatServiceEnabled_0() and v26() and v232.bannedUntil == nil then
                v231:ShowPlayerModeratedMessage();
            elseif v232.bannedUntil == nil then
                v231:showPrompt(v82.VoiceChatSuspendedPermanent);
            else
                v231.bannedUntil = v232.bannedUntil;
                if v54() and v232.banReason == l_BAN_REASON_0.NUDGE_V3 then
                    v231:showPrompt(v82.VoiceChatSuspendedTemporaryB);
                else
                    v231:showPrompt(v82.VoiceChatSuspendedTemporary);
                end;
            end;
        end;
        if v53() and l_l_GetInformedOfBan_0_0 and l_l_GetInformedOfBan_0_0.informedOfBan then
            v231:ShowPlayerModeratedMessage(true);
            return;
        end;
    elseif v231.runService:IsStudio() and v232 and not v232.isVoiceEnabled then
        v231:showPrompt(v82.User);
        return;
    elseif v231.runService:IsStudio() and v233 and not v233.isPlaceEnabledForVoice then
        v231:showPrompt(v82.Place, v23() and table.concat(v233.reasons or {}, "") or nil);
    end;
end;
v113.ChangeVoiceJoinProgress = function(v236, v237) --[[ Line: 917 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    return v236.coreVoiceManager:ChangeVoiceJoinProgress(v237);
end;
v113.UserOnlyEligibleForVoice = function(v238) --[[ Line: 921 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    return v238.coreVoiceManager:UserOnlyEligibleForVoice();
end;
v113.UserVoiceEnabled = function(v239) --[[ Line: 925 ]] --[[ Name: UserVoiceEnabled ]]
    return v239.coreVoiceManager:UserVoiceEnabled();
end;
v113.UserInInExperienceUpsellTreatment = function(v240) --[[ Line: 929 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    return v240.coreVoiceManager:UserInInExperienceUpsellTreatment();
end;
v113.UserEligibleForInExperienceUpsell = function(v241) --[[ Line: 933 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    return v241.coreVoiceManager:UserEligibleForInExperienceUpsell();
end;
v113.UserEligibleForLikelySpeakingBubbles = function(v242) --[[ Line: 937 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    return v242.coreVoiceManager:UserEligibleForLikelySpeakingBubbles();
end;
v113.ShowInExperienceVoiceUpsell = function(v243, v244) --[[ Line: 941 ]] --[[ Name: ShowInExperienceVoiceUpsell ]]
    local l_showVoiceInExperienceUpsellVariant_0 = v243:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant;
    v243:SetInExpUpsellEntrypoint(v244);
    v243:showPrompt((v243:GetInExpUpsellPromptFromEnum(l_showVoiceInExperienceUpsellVariant_0)));
end;
v113.ShowInExperiencePhoneVoiceUpsell = function(v246, v247, v248) --[[ Line: 951 ]] --[[ Name: ShowInExperiencePhoneVoiceUpsell ]]
    -- upvalues: v101 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v97 (copy), v102 (copy), v79 (copy), v82 (copy)
    v246:SetInExpUpsellEntrypoint(v247);
    v101.openPhoneUpsell({
        origin = "inExperience", 
        eventContext = "verificationUpsell", 
        entryConfig = {
            titleKey = "Feature.VerificationUpsell.Heading.UnlockVoiceChat", 
            descriptionKey = "Feature.VerificationUpsell.Description.UnlockVoiceChatBody", 
            buttonKey = "Feature.VerificationUpsell.Action.AddPhoneNumber", 
            extraButtonConfig = {
                extraButtonKey = "Feature.VerificationUpsell.Action.NotNow"
            }, 
            legalTextKey = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2"
        }, 
        onSuccessBeforeToast = function() --[[ Line: 966 ]] --[[ Name: onSuccessBeforeToast ]]
            -- upvalues: v246 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v97 (ref), v102 (ref), v248 (copy)
            v246.coreVoiceManager:DisablePhoneVerificationUpsell();
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v97.Events.ShowLikelySpeakingBubblesChanged then
                v97.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
            local l_v102_0 = v102;
            local l_v246_0 = v246;
            local v251 = "PostRequest";
            l_v102_0(function(...) --[[ Line: 586 ]]
                -- upvalues: l_v246_0 (copy), v251 (copy)
                return l_v246_0[v251](l_v246_0, ...);
            end, v248, os.time(), false);
        end, 
        onSuccess = function() --[[ Line: 973 ]] --[[ Name: onSuccess ]]
            -- upvalues: v246 (copy)
            v246:EnableVoice();
        end, 
        closeUpsell = function() --[[ Line: 976 ]] --[[ Name: closeUpsell ]]
            -- upvalues: l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v97 (ref), v247 (copy), v79 (ref), v246 (copy), v82 (ref), v102 (ref), v248 (copy)
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v97.Events.ShowLikelySpeakingBubblesChanged then
                v97.Events.ShowLikelySpeakingBubblesChanged(false);
            end;
            if v247 ~= v79.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                v246:showPrompt(v82.VoiceConsentDeclinedToast);
            end;
            local l_v102_1 = v102;
            local l_v246_1 = v246;
            local v254 = "PostRequest";
            l_v102_1(function(...) --[[ Line: 586 ]]
                -- upvalues: l_v246_1 (copy), v254 (copy)
                return l_v246_1[v254](l_v246_1, ...);
            end, v248, os.time(), true);
        end
    });
end;
v113.DisablePhoneVerificationUpsell = function(v255) --[[ Line: 988 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    v255.coreVoiceManager:DisablePhoneVerificationUpsell();
end;
v113.SetInExpUpsellEntrypoint = function(v256, v257) --[[ Line: 992 ]] --[[ Name: SetInExpUpsellEntrypoint ]]
    v256.inExpUpsellEntrypoint = v257;
end;
v113.userAndPlaceCanUseVoice = function(v258) --[[ Line: 996 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    return v258.coreVoiceManager:userAndPlaceCanUseVoice();
end;
v113.verifyUniverseAndPlaceCanUseVoice = function(v259) --[[ Line: 1000 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    return v259.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice();
end;
v113.GetVoiceConnectCookieValue = function(v260) --[[ Line: 1004 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    return v260.coreVoiceManager:GetVoiceConnectCookieValue();
end;
v113.SetVoiceConnectCookieValue = function(v261, v262) --[[ Line: 1008 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    return v261.coreVoiceManager:SetVoiceConnectCookieValue(v262);
end;
v113.ShowPlayerModeratedMessage = function(v263, v264) --[[ Line: 1012 ]] --[[ Name: ShowPlayerModeratedMessage ]]
    -- upvalues: l_GetUserSettings_0 (copy), l_Analytics_0 (copy), v82 (copy), v53 (copy), v54 (copy), l_BAN_REASON_0 (copy)
    local l_l_GetUserSettings_0_0 = l_GetUserSettings_0;
    local v266 = "GetRequest";
    l_l_GetUserSettings_0_0 = l_l_GetUserSettings_0_0(function(...) --[[ Line: 586 ]]
        -- upvalues: v263 (copy), v266 (copy)
        return v263[v266](v263, ...);
    end);
    if not l_l_GetUserSettings_0_0 or not l_l_GetUserSettings_0_0.isBanned then
        v263:_reportJoinFailed("PlayerModeratedBadState", l_Analytics_0.ERROR);
        return;
    else
        v263.banReason = l_l_GetUserSettings_0_0.banReason;
        if l_l_GetUserSettings_0_0.bannedUntil == nil then
            v263:showPrompt(v82.VoiceChatSuspendedPermanent);
            return;
        else
            v263.bannedUntil = l_l_GetUserSettings_0_0.bannedUntil;
            if not v53() then
                v263:showPrompt(v82.VoiceChatSuspendedTemporary);
                return;
            elseif v264 then
                v263:showPrompt(v82.VoiceChatSuspendedTemporaryToast);
                return;
            elseif v54() and v263.banReason == l_BAN_REASON_0.NUDGE_V3 then
                v263:showPrompt(v82.VoiceChatSuspendedTemporaryB);
                return;
            else
                v263:showPrompt(v82.VoiceChatSuspendedTemporary);
                return;
            end;
        end;
    end;
end;
v113.CheckCallState = function(v267) --[[ Line: 1041 ]] --[[ Name: CheckCallState ]]
    return v267.coreVoiceManager:CheckCallState();
end;
v113.ShowVoiceChatLoadingMessage = function(v268) --[[ Line: 1045 ]] --[[ Name: ShowVoiceChatLoadingMessage ]]
    -- upvalues: v82 (copy)
    v268:showPrompt(v82.VoiceLoading);
end;
v113.requestMicPermission = function(v269) --[[ Line: 1049 ]] --[[ Name: requestMicPermission ]]
    return v269.coreVoiceManager:requestMicPermission();
end;
v113.canUseServiceAsync = function(v270) --[[ Line: 1053 ]] --[[ Name: canUseServiceAsync ]]
    return v270.coreVoiceManager:canUseServiceAsync();
end;
v113.canUseService = function(v271) --[[ Line: 1058 ]] --[[ Name: canUseService ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy)
    if v271.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        return false;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 1062 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
            local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
            return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
        end);
        local v275 = l_status_2 and l_result_2.isVoiceEnabled;
        if not v275 then
            v271.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
        end;
        return v275;
    end;
end;
v113.ensureInitialized = function(v276, v277) --[[ Line: 1078 ]] --[[ Name: ensureInitialized ]]
    return v276.coreVoiceManager:ensureInitialized(v277);
end;
v113.GetSessionId = function(v278) --[[ Line: 1083 ]] --[[ Name: GetSessionId ]]
    return v278.coreVoiceManager:GetSessionId();
end;
v113.GetChannelId = function(v279) --[[ Line: 1087 ]] --[[ Name: GetChannelId ]]
    return v279.coreVoiceManager:GetChannelId();
end;
v113.JoinWithVoiceMuteData = function(v280, v281) --[[ Line: 1091 ]] --[[ Name: JoinWithVoiceMuteData ]]
    return v280.coreVoiceManager:JoinWithVoiceMuteData(v281);
end;
v113.calculateBanDuration = function(_, v283, v284) --[[ Line: 1095 ]] --[[ Name: calculateBanDuration ]]
    return (math.ceil((v284 - v283) / 60));
end;
v113.ShowVoiceUI = function(v285) --[[ Line: 1099 ]] --[[ Name: ShowVoiceUI ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), v97 (copy)
    if not l_GetFFlagEnableShowVoiceUI_0() then
        return;
    else
        v285.voiceUIVisible = true;
        v285.showVoiceUI:Fire();
        if v97.Events.VoiceUIVisibilityChanged then
            v97.Events.VoiceUIVisibilityChanged(true);
        end;
        return;
    end;
end;
v113.HideVoiceUI = function(v286) --[[ Line: 1111 ]] --[[ Name: HideVoiceUI ]]
    -- upvalues: l_GetFFlagEnableShowVoiceUI_0 (copy), v97 (copy)
    if not l_GetFFlagEnableShowVoiceUI_0() then
        return;
    else
        v286.voiceUIVisible = false;
        v286.hideVoiceUI:Fire();
        if v97.Events.VoiceUIVisibilityChanged then
            v97.Events.VoiceUIVisibilityChanged(false);
        end;
        return;
    end;
end;
v113.createPromptInstance = function(v287, v288, v289) --[[ Line: 1123 ]] --[[ Name: createPromptInstance ]]
    -- upvalues: v29 (copy), v23 (copy), v54 (copy), v82 (copy), l_LocalizationService_0 (copy), v31 (copy), v55 (copy), l_GetFFlagShowDevicePermissionsModal_0 (copy), v69 (copy), v72 (copy), l_default_1 (copy), l_SettingsRoute_0 (copy), v73 (copy), v3 (copy), v80 (copy), l_Analytics_0 (copy), l_PostInformedOfBan_0 (copy), l_GetFFlagUsePostRecordUserSeenGeneralModal_0 (copy), v79 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v97 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v15 (copy), v61 (copy), v56 (copy), v44 (copy), l_CoreGui_0 (copy)
    if not v287.voiceChatPromptInstance or v29() then
        if v287.promptSignal then
            v287.promptSignal:Destroy();
            v287.promptSignal = nil;
        end;
        v287.promptSignal = Instance.new("BindableEvent");
        local v290 = nil;
        if v23() then
            v290 = v287.errorText;
        end;
        local v291 = v54() and v289 == v82.VoiceChatSuspendedTemporaryB;
        local v292 = "";
        if v287.bannedUntil ~= nil then
            v292 = if v291 then tostring((v287:calculateBanDuration(DateTime.now().UnixTimestamp, v287.bannedUntil.Seconds))) else DateTime.fromUnixTimestamp(v287.bannedUntil.Seconds):FormatLocalTime("l LT", l_LocalizationService_0.RobloxLocaleId);
        end;
        local v293 = v31() and (v289 == v82.VoiceToxicityModal or v289 == v82.VoiceToxicityToast);
        local v294 = v55() and (v289 == v82.VoiceConsentModalV1 or v289 == v82.VoiceConsentModalV2 or v289 == v82.VoiceConsentModalV3);
        local v295 = false;
        local v296 = nil;
        do
            local l_v295_0, l_v296_0 = v295, v296;
            if l_GetFFlagShowDevicePermissionsModal_0() and v289 == v82.DevicePermissionsModal and v287.settingsAppAvailable == nil then
                if v69 then
                    for _ = 0, v72 do
                        local v302 = task.spawn(function() --[[ Line: 1173 ]]
                            -- upvalues: l_v295_0 (ref), l_v296_0 (ref), l_default_1 (ref), l_SettingsRoute_0 (ref)
                            local v300, v301 = l_default_1:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
                            l_v295_0 = v300;
                            l_v296_0 = v301;
                        end);
                        task.wait(v73 / 1000);
                        task.cancel(v302);
                        if l_v296_0 ~= nil then
                            break;
                        end;
                    end;
                else
                    local v303, v304 = l_default_1:supportsSwitchToSettingsApp(l_SettingsRoute_0.Microphone):await();
                    l_v295_0 = v303;
                    l_v296_0 = v304;
                end;
                v287.settingsAppAvailable = l_v295_0 and l_v296_0;
            end;
            v287.voiceChatPromptInstance = v3.mount(v3.createElement(v80, {
                Analytics = l_Analytics_0.new(), 
                promptSignal = v287.promptSignal.Event, 
                bannedUntil = v292, 
                policyMapper = v287.policyMapper, 
                errorText = v290, 
                onReadyForSignal = v288, 
                VoiceChatServiceManager = v287, 
                settingsAppAvailable = v287.settingsAppAvailable ~= nil and v287.settingsAppAvailable, 
                onContinueFunc = (not (v289 ~= v82.VoiceChatSuspendedTemporary) or v291) and function() --[[ Line: 1206 ]]
                    -- upvalues: l_PostInformedOfBan_0 (ref), v287 (copy)
                    local l_l_PostInformedOfBan_0_0 = l_PostInformedOfBan_0;
                    local l_v287_0 = v287;
                    local v307 = "PostRequest";
                    l_l_PostInformedOfBan_0_0(function(...) --[[ Line: 586 ]]
                        -- upvalues: l_v287_0 (copy), v307 (copy)
                        return l_v287_0[v307](l_v287_0, ...);
                    end, true);
                end or v293 and function() --[[ Line: 1209 ]]
                    -- upvalues: v287 (copy)
                    v287.Analytics:reportClosedNudge(v287:GetNudgeAnalyticsData());
                end or v294 and function() --[[ Line: 1212 ]]
                    -- upvalues: l_GetFFlagUsePostRecordUserSeenGeneralModal_0 (ref), v287 (copy), v79 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v97 (ref)
                    if l_GetFFlagUsePostRecordUserSeenGeneralModal_0() then
                        v287:RecordUserSeenModal(v79.MODAL_IDS.IN_EXP_UPSELL);
                    end;
                    if l_GetFFlagShowLikelySpeakingBubbles_0() and v97.Events.ShowLikelySpeakingBubblesChanged then
                        v97.Events.ShowLikelySpeakingBubblesChanged(false);
                    end;
                end or nil, 
                onPrimaryActivated = v293 and function() --[[ Line: 1225 ]]
                    -- upvalues: v287 (copy)
                    v287.Analytics:reportAcknowledgedNudge(v287:GetNudgeAnalyticsData());
                end or l_GetFFlagJoinWithoutMicPermissions_0() and v289 == v82.Permission and function() --[[ Line: 1230 ]]
                    -- upvalues: l_default_1 (ref), v15 (ref)
                    local v308 = l_default_1:supportsSwitchToSettingsApp():await();
                    v15:debug("Settings app available: {}", v308);
                    if v308 then
                        v15:debug("Switching to settings app");
                        l_default_1:switchToSettingsApp():andThen(function() --[[ Line: 1236 ]]
                            -- upvalues: v15 (ref)
                            v15:debug("Successfully switched to settings app");
                        end):catch(function() --[[ Line: 1239 ]]
                            -- upvalues: v15 (ref)
                            v15:error("Error switching to settings app");
                        end);
                        return;
                    else
                        v15:debug("Current platform does not support switching to settings app");
                        return;
                    end;
                end or l_GetFFlagJoinWithoutMicPermissions_0() and l_GetFFlagShowDevicePermissionsModal_0() and v289 == v82.DevicePermissionsModal and function() --[[ Line: 1250 ]]
                    -- upvalues: v15 (ref), v287 (copy), v61 (ref), l_default_1 (ref), l_SettingsRoute_0 (ref)
                    v15:debug("Settings app available: {}", v287.settingsAppAvailable);
                    if v61() then
                        v287.Analytics:reportDevicePermissionsModalEvent(v287.settingsAppAvailable and "OpenedSettings" or "Acknowledged", v287:GetSessionId(), v287:GetInExpUpsellAnalyticsData());
                    end;
                    if v287.settingsAppAvailable then
                        v15:debug("Switching to settings app");
                        l_default_1:switchToSettingsApp(l_SettingsRoute_0.Microphone):andThen(function() --[[ Line: 1263 ]]
                            -- upvalues: v15 (ref)
                            v15:debug("Successfully switched to settings app");
                        end):catch(function() --[[ Line: 1266 ]]
                            -- upvalues: v15 (ref)
                            v15:error("Error switching to settings app");
                        end);
                        return;
                    else
                        v15:debug("Current platform does not support switching to settings app");
                        return;
                    end;
                end or v291 and function() --[[ Line: 1273 ]]
                    -- upvalues: v287 (copy)
                    v287:reportBanMessage("Understood");
                    v287.Analytics:reportBanMessageEvent("Understood");
                end or v294 and function() --[[ Line: 1277 ]]
                    -- upvalues: v56 (ref), v287 (copy)
                    if v56() then
                        v287.Analytics:reportInExpConsent("accepted", v287.inExpUpsellEntrypoint, v287:GetInExpUpsellAnalyticsData());
                    end;
                    v287:EnableVoice();
                end or nil, 
                onSecondaryActivated = v289 == v82.VoiceToxicityModal and function() --[[ Line: 1289 ]]
                    -- upvalues: v287 (copy), v44 (ref)
                    v287:ShowVoiceToxicityFeedbackToast();
                    if v44 then
                        v287.Analytics:reportDeniedNudge(v287:GetNudgeAnalyticsData());
                    end;
                end or v293 and function() --[[ Line: 1295 ]]
                    -- upvalues: v287 (copy)
                    v287.Analytics:reportDeniedNudge(v287:GetNudgeAnalyticsData());
                end or v291 and function() --[[ Line: 1298 ]]
                    -- upvalues: v287 (copy)
                    v287:ShowVoiceToxicityFeedbackToast();
                    v287:reportBanMessage("Denied");
                    v287.Analytics:reportBanMessageEvent("Denied");
                end or v294 and function() --[[ Line: 1303 ]]
                    -- upvalues: v56 (ref), v287 (copy), v79 (ref), v82 (ref)
                    if v56() then
                        v287.Analytics:reportInExpConsent("denied", v287.inExpUpsellEntrypoint, v287:GetInExpUpsellAnalyticsData());
                    end;
                    if v287.inExpUpsellEntrypoint ~= v79.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                        v287:showPrompt(v82.VoiceConsentDeclinedToast);
                    end;
                end or v61() and v289 == v82.DevicePermissionsModal and function() --[[ Line: 1318 ]]
                    -- upvalues: v287 (copy)
                    v287.Analytics:reportDevicePermissionsModalEvent("Denied", v287:GetSessionId(), v287:GetInExpUpsellAnalyticsData());
                end or nil
            }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
        end;
    end;
end;
v113.showPrompt = function(v309, v310, v311) --[[ Line: 1333 ]] --[[ Name: showPrompt ]]
    -- upvalues: v23 (copy), v29 (copy), v15 (copy)
    if v23() then
        v309.errorText = v311 or nil;
    end;
    if not v309.voiceChatPromptInstance or v29() then
        v309:createPromptInstance(function() --[[ Line: 1338 ]]
            -- upvalues: v15 (ref), v310 (copy), v309 (copy)
            v15:debug("Show Prompt: {}", v310);
            v309.promptSignal:fire(v310);
        end, v310);
        return;
    else
        v15:debug("Show Prompt: {}", v310);
        v309.promptSignal:fire(v310);
        return;
    end;
end;
v113.CheckAndShowPermissionPrompt = function(v312) --[[ Line: 1348 ]] --[[ Name: CheckAndShowPermissionPrompt ]]
    -- upvalues: l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v82 (copy), v27 (copy), v46 (copy), l_PermissionsProtocol_0 (copy), v2 (copy), v22 (copy)
    local function v315() --[[ Line: 1349 ]] --[[ Name: showPrompt ]]
        -- upvalues: v312 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (ref), l_PERMISSION_STATE_0 (ref), v82 (ref), v27 (ref), v46 (ref), l_PermissionsProtocol_0 (ref), v2 (ref)
        local l_userEligible_0 = v312.userEligible;
        if v312.voiceEnabled or l_userEligible_0 then
            if l_GetFFlagJoinWithoutMicPermissions_0() then
                if v312.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                    v312:showPrompt(v82.Permission);
                end;
            elseif v27 then
                if v46 then
                    v312:_reportJoinFailed("missingPermissions");
                end;
                v312:showPrompt(v82.Permission);
            else
                return v312.PermissionsService:hasPermissions({
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }):andThen(function(v314) --[[ Line: 1367 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v312 (ref), v82 (ref)
                    if v314 and v314.status == l_PermissionsProtocol_0.Status.DENIED then
                        v312:showPrompt(v82.Permission);
                    end;
                end);
            end;
        end;
        return v2.resolve();
    end;
    if v22() then
        return v315();
    else
        return v312:asyncInit():andThen(function() --[[ Line: 1380 ]]

        end):catch(function() --[[ Line: 1380 ]]
            -- upvalues: v315 (copy)
            return v315();
        end);
    end;
end;
v113.showDataConsentToast = function(v316) --[[ Line: 1386 ]] --[[ Name: showDataConsentToast ]]
    -- upvalues: l_GetFFlagSeamlessVoiceConsentToastPolicy_0 (copy), v89 (copy), v88 (copy), v79 (copy), v82 (copy)
    local v317 = v316:FetchAgeVerificationOverlay();
    local v318 = nil;
    local v319 = nil;
    local v320 = false;
    if l_GetFFlagSeamlessVoiceConsentToastPolicy_0() then
        v320 = v89.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false;
    end;
    if type(v317) == "table" then
        v318 = if v317.voiceSettings then v317.voiceSettings.seamlessVoiceStatus else v88.Invalid;
        v319 = v317.showDataConsentToast;
    else
        v319 = false;
        v318 = v88.Invalid;
    end;
    if v319 and v320 then
        v319 = type(v316:_GetShowAgeVerificationOverlay()) == "table" and v316:_GetShowAgeVerificationOverlay().showDataConsentToast;
    end;
    if v318 == v88.EnabledExistingUser and v319 and v320 then
        v316:RecordUserSeenModal(v79.MODAL_IDS.DATA_CONSENT_TOAST);
        return v316:showPrompt(v82.VoiceDataConsentOptOutToast);
    else
        return;
    end;
end;
v113.CheckAndShowNotAudiblePrompt = function(v321) --[[ Line: 1420 ]] --[[ Name: CheckAndShowNotAudiblePrompt ]]
    -- upvalues: v82 (copy), v2 (copy)
    if game:GetEngineFeature("VoiceChatSupported") then
        return v321:asyncInit():andThen(function() --[[ Line: 1423 ]]
            -- upvalues: v321 (copy), v82 (ref)
            if UserSettings().GameSettings.MasterVolume == 0 then
                v321:showPrompt(v82.NotAudible);
            end;
        end):catch(function() --[[ Line: 1429 ]]

        end);
    else
        return v2.resolve();
    end;
end;
v113.InitialJoinFailedPrompt = function(v322) --[[ Line: 1434 ]] --[[ Name: InitialJoinFailedPrompt ]]
    -- upvalues: v15 (copy), v82 (copy)
    v15:debug("JoinByGroupIdToken returns false");
    v322:showPrompt(v82.Retry);
end;
v113.ShowVoiceToxicityFeedbackToast = function(v323) --[[ Line: 1440 ]] --[[ Name: ShowVoiceToxicityFeedbackToast ]]
    -- upvalues: v15 (copy), v82 (copy)
    v15:debug("Sending feedback toast");
    v323:showPrompt(v82.VoiceToxicityFeedbackToast);
end;
v113.GetNudgeAnalyticsData = function(v324) --[[ Line: 1445 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v324:GetSessionId();
end;
v113.GetInExpUpsellAnalyticsData = function(_) --[[ Line: 1449 ]] --[[ Name: GetInExpUpsellAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v326 = "";
    if l_game_EngineFeature_0 then
        v326 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return game.GameId, game.PlaceId, v326;
end;
v113.reportBanMessage = function(v327, v328) --[[ Line: 1457 ]] --[[ Name: reportBanMessage ]]
    -- upvalues: l_Players_0 (copy)
    v327.Analytics:reportBanMessageEventV2(v328, v327.banReason, l_Players_0.LocalPlayer.UserId, if v327.service then v327.previousSessionId else "");
end;
v113.SetAndSyncActive = function(v329, v330, v331) --[[ Line: 1466 ]] --[[ Name: SetAndSyncActive ]]
    v329.coreVoiceManager:SetAndSyncActive(v330, v331);
end;
v113.CreateAudioDeviceData = function(v332, v333) --[[ Line: 1470 ]] --[[ Name: CreateAudioDeviceData ]]
    return v332.coreVoiceManager:CreateAudioDeviceData(v333);
end;
v113.onInstanceAdded = function(v334, v335) --[[ Line: 1474 ]] --[[ Name: onInstanceAdded ]]
    return v334.coreVoiceManager:onInstanceAdded(v335);
end;
v113.UpdateAudioDeviceInputDebugger = function(v336) --[[ Line: 1478 ]] --[[ Name: UpdateAudioDeviceInputDebugger ]]
    -- upvalues: v45 (copy), v15 (copy), v3 (copy), v81 (copy), l_CoreGui_0 (copy)
    if v45 then
        if not v336.voiceDebuggerInstance then
            v15:debug("Mounting AudioDeviceInput Debugger");
            v336.voiceDebuggerInstance = v3.mount(v3.createElement(v81, {
                instances = v336.audioDevices, 
                mutedPlayers = v336.mutedPlayers
            }), l_CoreGui_0, "RobloxVoiceChatPromptGui");
            return;
        else
            v3.update(v336.voiceDebuggerInstance, v3.createElement(v81, {
                instances = v336.audioDevices, 
                mutedPlayers = v336.mutedPlayers
            }));
        end;
    end;
end;
v113.AddReverseNudgeToxicUser = function(v337, v338, v339, v340) --[[ Line: 1502 ]] --[[ Name: AddReverseNudgeToxicUser ]]
    -- upvalues: v38 (copy)
    v339(v338, "iconColorChange");
    local v341 = v337.reverseNudgeToxicUserRemovalCallbacks[v338];
    if v341 ~= nil then
        task.cancel(v341);
    end;
    local v342 = task.delay(v38(), function() --[[ Line: 1516 ]]
        -- upvalues: v340 (copy), v338 (copy), v337 (copy)
        v340(v338);
        v337.reverseNudgeToxicUserRemovalCallbacks[v338] = nil;
    end);
    v337.reverseNudgeToxicUserRemovalCallbacks[v338] = v342;
end;
v113.onInstanceRemove = function(v343, v344) --[[ Line: 1523 ]] --[[ Name: onInstanceRemove ]]
    return v343.coreVoiceManager:onInstanceRemove(v344);
end;
v113.hookupAudioDeviceInputListener = function(v345) --[[ Line: 1527 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    return v345.coreVoiceManager:hookupAudioDeviceInputListener();
end;
v113.ToggleMutePlayer = function(v346, v347, v348) --[[ Line: 1531 ]] --[[ Name: ToggleMutePlayer ]]
    return v346.coreVoiceManager:ToggleMutePlayer(v347, v348);
end;
v113.MuteAll = function(v349, v350, v351) --[[ Line: 1535 ]] --[[ Name: MuteAll ]]
    return v349.coreVoiceManager:MuteAll(v350, v351);
end;
v113.ToggleMuteSome = function(v352, v353, v354, v355, v356) --[[ Line: 1539 ]] --[[ Name: ToggleMuteSome ]]
    return v352.coreVoiceManager:ToggleMuteSome(v353, v354, v355, v356);
end;
v113.FireMuteNonFriendsEvent = function(v357) --[[ Line: 1548 ]] --[[ Name: FireMuteNonFriendsEvent ]]
    -- upvalues: v33 (copy)
    if v33 then
        v357.mutedNonFriends:Fire();
    end;
end;
v113.EnsureCorrectMuteState = function(v358, v359, v360) --[[ Line: 1554 ]] --[[ Name: EnsureCorrectMuteState ]]
    -- upvalues: v32 (copy), l_game_EngineFeature_1 (copy), l_Players_0 (copy)
    local v361 = {};
    for _, v363 in v359 do
        local v364 = v358.participants[tostring(v363)];
        if v364 and v364.isMutedLocally ~= v360 then
            if v32() then
                v361[v363] = true;
                v358.mutedPlayers[v363] = v360;
            else
                v358.service:SubscribePause(v363, v360);
            end;
            v364.isMutedLocally = v360;
            v358.participantsUpdate:Fire(v358.participants);
        end;
    end;
    if v32() then
        for v365 in v358.audioDevices do
            if v365.Player and v361[v365.Player.UserId] then
                if l_game_EngineFeature_1 and v365.Player ~= l_Players_0.LocalPlayer then
                    v365.MutedByLocalUser = v360;
                else
                    if l_game_EngineFeature_1 then

                    end;
                    v365.Active = not v360;
                end;
            end;
        end;
    end;
end;
v113.FireUserAgencySelectedEvent = function(v366, v367) --[[ Line: 1589 ]] --[[ Name: FireUserAgencySelectedEvent ]]
    -- upvalues: v34 (copy)
    if v34() then
        v366.userAgencySelected:Fire(v367);
    end;
end;
v113.ParticipantStateToIcon = function(_, v369, v370) --[[ Line: 1595 ]] --[[ Name: ParticipantStateToIcon ]]
    -- upvalues: l_VOICE_STATE_0 (copy)
    local l_INACTIVE_0 = l_VOICE_STATE_0.INACTIVE;
    if not v369.subscriptionCompleted then
        l_INACTIVE_0 = l_VOICE_STATE_0.CONNECTING;
    elseif v369.isMutedLocally then
        l_INACTIVE_0 = l_VOICE_STATE_0.LOCAL_MUTED;
    elseif v369.isMuted then
        l_INACTIVE_0 = l_VOICE_STATE_0.MUTED;
    elseif v369.isSignalActive then
        l_INACTIVE_0 = l_VOICE_STATE_0.TALKING;
    end;
    return getIcon(l_INACTIVE_0, v370);
end;
v113.VoiceStateToIcon = function(_, v373, v374, v375) --[[ Line: 1610 ]] --[[ Name: VoiceStateToIcon ]]
    return getIcon(v373, v374, v375);
end;
v113.GetIcon = function(_, v377, v378) --[[ Line: 1614 ]] --[[ Name: GetIcon ]]
    return getIconSrc(v377, v378);
end;
v113.JoinVoice = function(v379, v380) --[[ Line: 1618 ]] --[[ Name: JoinVoice ]]
    -- upvalues: v79 (copy), v59 (copy), v62 (copy), v82 (copy), v21 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_AppStorageService_0 (copy), v19 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy)
    local v381 = v379:FetchAgeVerificationOverlay().showVoiceInExperienceUpsellVariant or v79.IN_EXP_UPSELL_VARIANT.VARIANT3;
    if v59() then
        v379.Analytics:reportJoinVoiceButtonEvent("clicked", v379:GetInExpUpsellAnalyticsData());
    end;
    if v62() and v379.previousGroupId then
        v379:RejoinPreviousChannel();
        v379:showPrompt(v82.JoinVoice);
        v379:ShowVoiceUI();
        if v21() then
            v379:SetVoiceConnectCookieValue(true);
            return;
        end;
    elseif l_GetFFlagNonVoiceFTUX_0() and v379.isShowingFTUX then
        v379:HideFTUX(l_AppStorageService_0);
        return;
    elseif v62() and v379:UserVoiceEnabled() then
        v379.attemptVoiceRejoin:Fire();
        return;
    elseif v379:UserOnlyEligibleForVoice() then
        if v19() and v379:IsSeamlessVoice() then
            v379:EnableVoice();
            return;
        else
            v379:SetInExpUpsellEntrypoint(v79.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE);
            v379:showPrompt((v379:GetInExpUpsellPromptFromEnum(v381)));
            return;
        end;
    elseif l_GetFFlagIntegratePhoneUpsellJoinVoice_0() and l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v379:UserVoiceEnabled() and v379:FetchPhoneVerificationUpsell(v79.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v79.PHONE_UPSELL_VALUE_PROP.VoiceChat then
        if v380 then
            v380:SetVisibility(false, true);
        end;
        v379:ShowInExperiencePhoneVoiceUpsell(v79.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, v79.IN_EXP_PHONE_UPSELL_IXP_LAYER);
    end;
end;
v113.ShouldShowJoinVoice = function(v382) --[[ Line: 1670 ]] --[[ Name: ShouldShowJoinVoice ]]
    -- upvalues: v20 (copy), v62 (copy), l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v79 (copy)
    if v20() then
        if v62() and v382:IsSeamlessVoice() and v382:verifyUniverseAndPlaceCanUseVoice() then
            return not v382.voiceUIVisible;
        end;
    elseif v62() and v382:IsSeamlessVoice() then
        return not v382.voiceUIVisible;
    end;
    local v383 = v382:UserInInExperienceUpsellTreatment();
    local v384 = v382:UserOnlyEligibleForVoice() or v382:UserVoiceEnabled();
    if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() and l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v384 and not v382:UserVoiceEnabled() and v382:FetchPhoneVerificationUpsell(v79.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v79.PHONE_UPSELL_VALUE_PROP.VoiceChat then
        return true;
    else
        return v383 and v384;
    end;
end;
v113.IsSeamlessVoice = function(v385) --[[ Line: 1701 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: v15 (copy), v88 (copy)
    local v386 = v385:FetchAgeVerificationOverlay();
    if not v386 or not v386.voiceSettings then
        v15:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil");
        return false;
    else
        local l_seamlessVoiceStatus_0 = v386.voiceSettings.seamlessVoiceStatus;
        local v388 = true;
        if l_seamlessVoiceStatus_0 ~= v88.EnabledExistingUser then
            v388 = l_seamlessVoiceStatus_0 == v88.EnabledNewUser;
        end;
        return v388;
    end;
end;
v113.GetConnectDisconnectButtonAnalyticsData = function(v389, v390) --[[ Line: 1712 ]] --[[ Name: GetConnectDisconnectButtonAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v391 = "";
    if l_game_EngineFeature_0 then
        v391 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v392 = {
        game.GameId, 
        game.PlaceId, 
        v391
    };
    if v390 and v389:getService() then
        table.insert(v392, v389:GetSessionId());
    end;
    return unpack(v392);
end;
v113.GetConnectDisconnectAnalyticsData = function(v393) --[[ Line: 1724 ]] --[[ Name: GetConnectDisconnectAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), l_default_0 (copy)
    local v394 = {};
    local v395 = "";
    if l_game_EngineFeature_0 then
        v395 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v394.universeId = game.GameId;
    v394.placeId = game.PlaceId;
    v394.playSessionId = v395;
    if l_GetFFlagNonVoiceFTUX_0() then
        v394.voiceSessionId = if v393.service then v393:GetSessionId() else "";
    else
        v394.voiceSessionId = v393:GetSessionId();
    end;
    v394.durationTimestamp = l_default_0:getTimestamp();
    return v394;
end;
v113.Leave = function(v396) --[[ Line: 1744 ]] --[[ Name: Leave ]]
    -- upvalues: v60 (copy), v62 (copy)
    v396:ensureInitialized("leave");
    if v60() then
        v396.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", v396:GetConnectDisconnectAnalyticsData());
    end;
    local l_GroupId_0 = v396.service:GetGroupId();
    local v398 = v396.service:IsPublishPaused();
    v396.service:Leave();
    v396:HideVoiceUI();
    v396.previousGroupId = l_GroupId_0;
    v396.previousMutedState = v398;
    if v62() then
        v396:SetVoiceConnectCookieValue(false);
    end;
end;
v113.GetVoiceStateFromEnum = function(_, v400) --[[ Line: 1760 ]] --[[ Name: GetVoiceStateFromEnum ]]
    -- upvalues: v115 (ref), l_VOICE_STATE_0 (copy)
    if not v115[v400] then
        v115 = {
            [Enum.VoiceChatState.Idle] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Joining] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.JoiningRetry] = l_VOICE_STATE_0.CONNECTING, 
            [Enum.VoiceChatState.Joined] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Leaving] = l_VOICE_STATE_0.MUTED, 
            [Enum.VoiceChatState.Ended] = l_VOICE_STATE_0.HIDDEN, 
            [Enum.VoiceChatState.Failed] = l_VOICE_STATE_0.ERROR
        };
    end;
    return v115[v400];
end;
v113.GetInExpUpsellPromptFromEnum = function(_, v402) --[[ Line: 1780 ]] --[[ Name: GetInExpUpsellPromptFromEnum ]]
    -- upvalues: v116 (copy)
    return v116[v402];
end;
v113.getRecentUsersInteractionData = function(v403) --[[ Line: 1785 ]] --[[ Name: getRecentUsersInteractionData ]]
    return v403.coreVoiceManager:getRecentUsersInteractionData();
end;
v113._setRecentUserState = function(v404, v405, v406) --[[ Line: 1789 ]] --[[ Name: _setRecentUserState ]]
    return v404.coreVoiceManager:_setRecentUserState(v405, v406);
end;
v113._updateRecentUsersInteractionData = function(v407) --[[ Line: 1793 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    return v407.coreVoiceManager:_updateRecentUsersInteractionData();
end;
v113.SetupParticipantListeners = function(v408) --[[ Line: 1797 ]] --[[ Name: SetupParticipantListeners ]]
    return v408.coreVoiceManager:SetupParticipantListeners();
end;
v113.Disconnect = function(v409) --[[ Line: 1801 ]] --[[ Name: Disconnect ]]
    v409.coreVoiceManager:Disconnect();
    v409.coreVoiceManager:unsubscribeAll();
end;
v113.GetSendMuteEvent = function(v410) --[[ Line: 1806 ]] --[[ Name: GetSendMuteEvent ]]
    return v410.coreVoiceManager:GetSendMuteEvent();
end;
v113.GetLikelySpeakingUsersEvent = function(v411) --[[ Line: 1810 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    return v411.coreVoiceManager:GetLikelySpeakingUsersEvent();
end;
v113.ToggleMic = function(v412, v413) --[[ Line: 1815 ]] --[[ Name: ToggleMic ]]
    return v412.coreVoiceManager:ToggleMic(v413);
end;
v113.SubscribeRetry = function(v414, v415) --[[ Line: 1819 ]] --[[ Name: SubscribeRetry ]]
    -- upvalues: v15 (copy)
    v414:ensureInitialized("subscribe retry");
    v15:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(v415), -4));
    v414.service:SubscribeRetry(v415);
end;
v113.JoinByGroupIdToken = function(v416, v417, v418) --[[ Line: 1825 ]] --[[ Name: JoinByGroupIdToken ]]
    return v416.coreVoiceManager:JoinByGroupIdToken(v417, v418);
end;
v113.RejoinPreviousChannel = function(v419) --[[ Line: 1829 ]] --[[ Name: RejoinPreviousChannel ]]
    -- upvalues: v15 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v60 (copy)
    local l_previousGroupId_0 = v419.previousGroupId;
    local l_previousMutedState_0 = v419.previousMutedState;
    v15:debug("Rejoining previous channel {} with mute status {}", l_previousGroupId_0, l_previousMutedState_0);
    pcall(function() --[[ Line: 1834 ]]
        -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (ref), v419 (copy), v60 (ref), l_previousGroupId_0 (copy), l_previousMutedState_0 (copy)
        if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
            v419.service:Leave();
            v419.coreVoiceManager:RejoinVoice();
            if v60() then
                v419.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v419:GetConnectDisconnectAnalyticsData());
                return;
            end;
        elseif l_previousGroupId_0 and l_previousGroupId_0 ~= "" then
            v419.service:Leave();
            if not v419.service:JoinByGroupIdToken(l_previousGroupId_0, l_previousMutedState_0, true) then
                v419:InitialJoinFailedPrompt();
                return;
            elseif v60() then
                v419.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", v419:GetConnectDisconnectAnalyticsData());
            end;
        end;
    end);
end;
local function _(v422, v423, v424) --[[ Line: 1861 ]] --[[ Name: isValidDeviceList ]]
    return v422 and v423 and v424 and #v422 > 0 and v424 > 0 and v424 <= #v422 and #v422 == #v423;
end;
local function v435(v426, v427) --[[ Line: 1871 ]] --[[ Name: setVCSOutput ]]
    -- upvalues: v15 (copy)
    local v428, v429, v430, v431 = pcall(function() --[[ Line: 1872 ]]
        -- upvalues: v427 (copy)
        return v427:GetSpeakerDevices();
    end);
    if v428 and v429 and v430 and v431 and #v429 > 0 and v431 > 0 and v431 <= #v429 and #v429 == #v430 then
        local v432 = 0;
        for v433, v434 in ipairs(v429) do
            if v434 == v426 then
                v432 = v433;
            end;
        end;
        if v432 > 0 then
            v15:info("[OutputDeviceSelection] Setting VCS Speaker Device To {} {}", v429[v432], v430[v432]);
            v427:SetSpeakerDevice(v429[v432], v430[v432]);
            return;
        else
            v15:warning("Could not find equivalent VoiceChatService Device");
            return;
        end;
    else
        v15:warning("Could not connect to Voice Chat Service to change Output Device");
        return;
    end;
end;
v113.SwitchDevice = function(v436, v437, v438, v439) --[[ Line: 1900 ]] --[[ Name: SwitchDevice ]]
    -- upvalues: l_VOICE_CHAT_DEVICE_TYPE_0 (copy), l_SoundService_0 (copy), v15 (copy), v435 (copy), v74 (copy)
    if v437 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
        l_SoundService_0:SetInputDevice(v438, v439);
        v15:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", v438, v439);
        return;
    else
        l_SoundService_0:SetOutputDevice(v438, v439);
        v15:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", v438, v439);
        v435(v438, if v74 then v436.service else nil);
        return;
    end;
end;
v113.GetDevices = function(_, v441) --[[ Line: 1911 ]] --[[ Name: GetDevices ]]
    -- upvalues: l_VOICE_CHAT_DEVICE_TYPE_0 (copy), l_SoundService_0 (copy)
    local v442, v443, v444, v445 = pcall(function() --[[ Line: 1912 ]]
        -- upvalues: v441 (copy), l_VOICE_CHAT_DEVICE_TYPE_0 (ref), l_SoundService_0 (ref)
        if v441 == l_VOICE_CHAT_DEVICE_TYPE_0.Input then
            return l_SoundService_0:GetInputDevices();
        else
            return l_SoundService_0:GetOutputDevices();
        end;
    end);
    return v442, v443, v444, v445;
end;
v113.VoiceChatAvailable = function(v446) --[[ Line: 1923 ]] --[[ Name: VoiceChatAvailable ]]
    -- upvalues: l_MIN_VOICE_CHAT_API_VERSION_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy)
    local l_service_0 = v446.service;
    if v446.available == nil and l_service_0 then
        v446.version = l_service_0:GetVoiceChatApiVersion();
        if v446.version >= l_MIN_VOICE_CHAT_API_VERSION_0 then
            v446.available = l_service_0:GetVoiceChatAvailable();
            while v446.available == l_VOICE_CHAT_AVAILABILITY_0.Checking do
                wait(1);
                v446.available = l_service_0:GetVoiceChatAvailable();
            end;
        end;
    end;
    if l_service_0 then
        local v448 = false;
        if v446.version >= l_MIN_VOICE_CHAT_API_VERSION_0 then
            v448 = v446.available == l_VOICE_CHAT_AVAILABILITY_0.Available;
        end;
        return v448;
    else
        return false;
    end;
end;
v113.VoiceChatEnded = function(v449) --[[ Line: 1943 ]] --[[ Name: VoiceChatEnded ]]
    if v449.service then
        local l_VoiceChatState_0 = v449.service.VoiceChatState;
        local v451 = true;
        if l_VoiceChatState_0 ~= Enum.VoiceChatState.Ended then
            v451 = l_VoiceChatState_0 == Enum.VoiceChatState.Idle;
        end;
        return v451;
    else
        return true;
    end;
end;
v113.UnmountPrompt = function(v452) --[[ Line: 1952 ]] --[[ Name: UnmountPrompt ]]
    -- upvalues: v3 (copy)
    if v452.voiceChatPromptInstance ~= nil then
        v3.unmount(v452.voiceChatPromptInstance);
        v452.voiceChatPromptInstance = nil;
    end;
end;
v113.default = v113.new(l_CoreVoiceManager_0.default, nil, l_HttpRbxApiService_0, l_PermissionsProtocol_0.default, v94:GetAfterBlockedStatusChangedEvent());
return v113;