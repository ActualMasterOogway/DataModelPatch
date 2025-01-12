local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_SoundService_0 = game:GetService("SoundService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_Players_1 = game:GetService("Players");
local v12 = require(script.Parent.Constants);
local v13 = require(script.Parent.Utils);
local l_Flags_0 = script.Parent.Flags;
local v15 = require(script.Parent.Analytics);
local l_Requests_0 = script.Parent.Requests;
local v17 = require(l_Parent_0.Promise);
local v18 = require(l_Parent_0.Cryo);
local l_default_0 = require(l_Parent_0.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_Parent_0.CallProtocol).Enums;
local l_PermissionsProtocol_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol;
local v22 = require(l_Parent_0.BlockingUtility);
local v23 = require(l_Parent_0.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v24 = require(l_Flags_0.GetFFlagAlwaysSetupVoiceListeners)();
local v25 = require(l_Flags_0.GetFFlagFixNewAudioAPIEcho)();
local v26 = require(l_Flags_0.GetFFlagHideVoiceUIUntilInputExists)();
local v27 = require(l_Flags_0.GetFFlagOverwriteIsMutedLocally)();
local v28 = require(l_Flags_0.GetFFlagReverseLocalMuteOverwrite);
local v29 = require(l_Flags_0.GetFFlagReceiveLikelySpeakingUsers)();
local v30 = require(l_Flags_0.GetFFlagUseAudioInstanceAdded)();
local v31 = require(l_Flags_0.GetFFlagSetActiveWhenConnecting)();
local v32 = require(l_Flags_0.GetFFlagUpdateDeviceInputPlayerChanged)();
local v33 = require(l_Flags_0.GetFFlagHideUIWhenVoiceDefaultDisabled)();
local v34 = require(l_Flags_0.GetFFlagEmitCorrectEventForVoiceBans)();
local v35 = game:DefineFastFlag("StringKeyFixForParticipantsTable", false);
local v36 = require(l_Flags_0.GetFFlagVoiceChatTeamTestMuteIconOutOfSyncFixLua)();
local v37 = game:DefineFastFlag("IsSeamlessVoiceCheckBugfix", false);
local v38 = require(l_Flags_0.GetFFlagEnableVoiceRccCheck);
local v39 = require(l_Flags_0.GetFFlagLuaConsumePlayerModerated);
local v40 = require(l_Flags_0.GetFFlagEnableNudgeAnalytics);
local v41 = require(l_Flags_0.GetFFlagEnableErrorIconFix);
local l_GetFFlagPlayerListAnimateMic_0 = require(l_Parent_0.SharedFlags).GetFFlagPlayerListAnimateMic;
local v43 = require(l_Flags_0.GetFFlagEnableLuaVoiceChatAnalytics);
local v44 = require(l_Flags_0.GetFFlagUseLuaSignalrConsumer);
local v45 = require(l_Flags_0.GetFFlagClearVoiceStateOnRejoin);
local l_GetFFlagLocalMutedNilFix_0 = require(l_Parent_0.SharedFlags).GetFFlagLocalMutedNilFix;
local v47 = require(l_Flags_0.GetFFlagEnableVoiceNudge);
local v48 = require(l_Flags_0.GetFFlagEnableVoiceReverseNudge);
local v49 = require(l_Flags_0.GetFFlagClearUserFromRecentVoiceDataOnLeave);
local v50 = require(l_Flags_0.GetFFlagVoiceUseAudioRoutingAPI);
local v51 = require(l_Flags_0.GetFIntVoiceUsersInteractionExpiryTimeSeconds);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v53 = require(l_Flags_0.GetFFlagVoiceChatServiceManagerUseAvatarChat);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_Parent_0.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v55 = require(l_Parent_0.SharedFlags).GetFFlagAvatarChatCoreScriptSupport();
local v56 = require(l_Flags_0.GetFFlagBatchVoiceParticipantsUpdates);
local v57 = require(l_Flags_0.GetFIntThrottleParticipantsUpdateMs);
local l_GetFFlagSeamlessVoiceFTUX_0 = require(l_Parent_0.SharedFlags).GetFFlagSeamlessVoiceFTUX;
local l_GetFFlagNonVoiceFTUX_0 = require(l_Parent_0.SharedFlags).GetFFlagNonVoiceFTUX;
local l_GetFFlagGetRawMicrophonePermissions_0 = require(l_Parent_0.SharedFlags).GetFFlagGetRawMicrophonePermissions;
local v61 = require(l_Flags_0.GetFFlagEnableFtuxExitOnMuteToggle);
local v62 = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance");
local v63 = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate");
local v64 = game:DefineFastFlag("PollLikelySpeakingV2", false);
local v65 = game:DefineFastFlag("PromisifyVoiceRequests", false);
local v66 = game:DefineFastFlag("PollVoiceState", false);
local v67 = game:DefineFastFlag("EnsureVoicePermissionsFetched", false);
local v68 = game:DefineFastFlag("PersistentVoiceDisconnectV2", false);
local l_GetFFlagShowLikelySpeakingBubbles_0 = require(l_Parent_0.SharedFlags).GetFFlagShowLikelySpeakingBubbles;
local v70 = game:DefineFastFlag("VoiceSetInitPromiseFirst", false);
local v71 = game:DefineFastFlag("SeamlessJoinWithoutVoice", false);
local v72 = game:DefineFastFlag("VoiceUnhandledPromiseRejectionFix", false);
local v73 = game:DefineFastFlag("EnableCoreVoiceManagerEmitOnReportJoinFailed", false);
local v74 = game:DefineFastFlag("UseAudioAnalyzerForLocalMetering", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableMutedByLocalUser");
local l_GetFFlagEnableVoiceSignal_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableVoiceSignal;
local l_GetFFlagEnqueueVoiceClientJoinOperationLua_0 = require(l_Parent_0.SharedFlags).GetFFlagEnqueueVoiceClientJoinOperationLua;
local l_GetFFlagUseMicPermForEnrollment_0 = require(l_Parent_0.SharedFlags).GetFFlagUseMicPermForEnrollment;
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_FFlagFixTopBarSlowLoad_0 = require(l_Parent_0.SharedFlags).FFlagFixTopBarSlowLoad;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = require(l_Parent_0.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua;
local l_WATCHED_NAMESPACES_0 = v12.WATCHED_NAMESPACES;
local l_WATCHED_MESSAGE_TYPES_0 = v12.WATCHED_MESSAGE_TYPES;
local l_VOICE_CHAT_AVAILABILITY_0 = v12.VOICE_CHAT_AVAILABILITY;
local l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 = v12.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED;
local l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 = v12.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY;
local l_PERMISSION_STATE_0 = v12.PERMISSION_STATE;
local l_VOICE_JOIN_PROGRESS_0 = v12.VOICE_JOIN_PROGRESS;
local v89 = require(l_Requests_0.GetShowAgeVerificationOverlay);
local v90 = require(l_Requests_0.GetShowPhoneVerificationUpsell);
local v91 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v92 = {
    available = nil, 
    canUseServicePromise = nil, 
    userEligible = false, 
    participants = nil, 
    localMuted = nil, 
    isTalking = false, 
    previousGroupId = nil, 
    muteAll = false, 
    previousMutedState = nil, 
    permissionPromise = nil, 
    permissionState = if l_GetFFlagJoinWithoutMicPermissions_0() then l_PERMISSION_STATE_0.IDLE else nil, 
    recentUsersInteractionData = nil, 
    NotificationService = l_NotificationService_0, 
    PermissionsService = l_PermissionsProtocol_0.default, 
    voiceEnabled = false, 
    LikelySpeakingUsersEvent = nil, 
    ReceiveLikelySpeakingUsersEvent = nil, 
    service = nil, 
    SignalREventTable = {}, 
    isInCall = false, 
    callMutedState = false, 
    audioDeviceInputAdded = if v26 then Instance.new("BindableEvent") else nil, 
    muteChanged = Instance.new("BindableEvent"), 
    muteAllChanged = Instance.new("BindableEvent"), 
    participantLeft = Instance.new("BindableEvent"), 
    participantJoined = Instance.new("BindableEvent"), 
    participantsUpdate = Instance.new("BindableEvent"), 
    talkingChanged = Instance.new("BindableEvent"), 
    attemptVoiceRejoin = Instance.new("BindableEvent"), 
    onPlayerMuteToggled = Instance.new("BindableEvent"), 
    communicationPermissionsResult = nil, 
    VoiceJoinProgress = l_VOICE_JOIN_PROGRESS_0.Idle, 
    VoiceJoinProgressChanged = Instance.new("BindableEvent"), 
    mutedPlayers = {}, 
    BlockStatusChanged = nil, 
    AvatarChatService = v91, 
    HttpRbxApiService = l_HttpRbxApiService_0, 
    SendMuteEvent = nil, 
    _mutedAnyone = false
};
v92.__index = v92;
v92.new = function(v93, v94, v95, v96, v97, v98, v99, v100) --[[ Line: 223 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v15 (copy), l_AppStorageService_0 (copy), v92 (copy), v44 (copy), l_WATCHED_MESSAGE_TYPES_0 (copy), v57 (copy), l_Players_1 (copy), v23 (copy), l_IXPServiceWrapper_0 (copy), v62 (copy), v63 (copy)
    local v101 = setmetatable({
        previousSessionId = nil, 
        HttpRbxApiService = v95, 
        eventEmitter = v13.EventEmitter.new(), 
        service = v96, 
        PermissionsService = v94, 
        NotificationService = v98, 
        AvatarChatService = v99, 
        Analytics = v15.new(v97), 
        SequenceNumbers = {}, 
        SignalREventTable = {}, 
        audioDevices = {}, 
        BlockStatusChanged = v93, 
        AppStorageService = v100 or l_AppStorageService_0
    }, v92);
    if v44() then
        for _, v103 in l_WATCHED_MESSAGE_TYPES_0 do
            v101.SignalREventTable[v103] = Instance.new("BindableEvent");
        end;
    end;
    v101.shouldThrottleParticipantUpdate = false;
    v101.participantsStateThrottleTime = 0;
    v101.lastParticipantsStateUpdate = 0;
    v101.lastStateUpdateCounter = 0;
    if v57() > 0 then
        task.spawn(function() --[[ Line: 261 ]]
            -- upvalues: l_Players_1 (ref), v96 (copy), v23 (ref), l_IXPServiceWrapper_0 (ref), v62 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 262 ]]
                -- upvalues: l_Players_1 (ref), v96 (ref)
                if l_Players_1.LocalPlayer then
                    return v96:IsVoiceEnabledForUserIdAsync(l_Players_1.LocalPlayer.UserId);
                else
                    return false;
                end;
            end);
            if not l_status_0 then
                v23:debug("Unable to get voice enabled status: ", l_result_0);
                return;
            else
                if l_result_0 then
                    l_IXPServiceWrapper_0:LogUserLayerExposure(v62);
                end;
                return;
            end;
        end);
        v101.participantsStateThrottleTime = v57() / 1000;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 278 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), v62 (ref)
            return l_IXPServiceWrapper_0:GetLayerData(v62);
        end);
        if l_status_1 and l_result_1 and l_result_1[v63] then
            v101.shouldThrottleParticipantUpdate = true;
        end;
    end;
    return v101;
end;
v92.emit = function(v108, v109, ...) --[[ Line: 289 ]] --[[ Name: emit ]]
    v108.eventEmitter:emit(v109, ...);
end;
v92.subscribe = function(v110, v111, v112) --[[ Line: 293 ]] --[[ Name: subscribe ]]
    v110.eventEmitter:addListener(v111, v112);
end;
v92.unsubscribeAll = function(v113) --[[ Line: 297 ]] --[[ Name: unsubscribeAll ]]
    v113.eventEmitter:removeAllListeners();
end;
v92.CheckCallStateWithPromise = function(v114) --[[ Line: 301 ]] --[[ Name: CheckCallStateWithPromise ]]
    -- upvalues: l_default_0 (copy), v23 (copy), l_Enums_0 (copy)
    return l_default_0:getCallState():andThen(function(v115) --[[ Line: 303 ]]
        -- upvalues: v23 (ref), l_Enums_0 (ref), v114 (copy)
        v23:trace("Got user call state");
        if v115.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v115.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
            v114.isInCall = true;
            v114.callMutedState = v115.muted;
            v23:trace("Changing call muted state to {}", v115.muted);
        end;
    end):catch(function(v116) --[[ Line: 315 ]]
        -- upvalues: v23 (ref)
        v23:trace("User not in call {}", v116);
    end);
end;
v92.CheckCallState = function(v117) --[[ Line: 321 ]] --[[ Name: CheckCallState ]]
    -- upvalues: v23 (copy), l_default_0 (copy), l_Enums_0 (copy)
    v23:trace("Checking user call state");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 323 ]]
        -- upvalues: l_default_0 (ref), v23 (ref), l_Enums_0 (ref), v117 (copy)
        l_default_0:getCallState():andThen(function(v118) --[[ Line: 325 ]]
            -- upvalues: v23 (ref), l_Enums_0 (ref), v117 (ref)
            v23:trace("Got user call state");
            if v118.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v118.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then
                v117.isInCall = true;
                v117.callMutedState = v118.muted;
                v23:trace("Changing call muted state to {}", v118.muted);
            end;
        end):catch(function(v119) --[[ Line: 337 ]]
            -- upvalues: v23 (ref)
            v23:trace("User not in call {}", v119);
        end);
    end);
    if not l_status_2 then
        v23:debug("Error checking user call state {}", l_result_2);
    end;
end;
v92._GetShowAgeVerificationOverlay = function(v122, v123) --[[ Line: 355 ]] --[[ Name: _GetShowAgeVerificationOverlay ]]
    -- upvalues: v89 (copy), v13 (copy), l_GetFFlagUseMicPermForEnrollment_0 (copy)
    return v89(v13.bind(v122, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), if l_GetFFlagUseMicPermForEnrollment_0() then v123 else nil);
end;
v92.FetchAgeVerificationOverlay = function(v124, v125) --[[ Line: 364 ]] --[[ Name: FetchAgeVerificationOverlay ]]
    -- upvalues: v65 (copy), v17 (copy), l_GetFFlagUseMicPermForEnrollment_0 (copy)
    if not v124._getShowAgeVerificationOverlayResult then
        if v65 then
            if not v124._getShowAgeVerificationOverlayPromise then
                v124._getShowAgeVerificationOverlayPromise = v17.new(function(v126, _) --[[ Line: 368 ]]
                    -- upvalues: v124 (copy), l_GetFFlagUseMicPermForEnrollment_0 (ref), v125 (copy)
                    v124._getShowAgeVerificationOverlayResult = v124:_GetShowAgeVerificationOverlay(if l_GetFFlagUseMicPermForEnrollment_0() then v125 else nil);
                    v126(v124._getShowAgeVerificationOverlayResult);
                end);
            end;
            v124._getShowAgeVerificationOverlayPromise:await();
        else
            v124._getShowAgeVerificationOverlayResult = v124:_GetShowAgeVerificationOverlay(if l_GetFFlagUseMicPermForEnrollment_0() then v125 else nil);
        end;
    end;
    return v124._getShowAgeVerificationOverlayResult;
end;
v92._GetShowPhoneVerificationUpsell = function(v128, v129, v130) --[[ Line: 391 ]] --[[ Name: _GetShowPhoneVerificationUpsell ]]
    -- upvalues: v90 (copy), v13 (copy)
    return (v90(v13.bind(v128, "GetRequest"), tostring(game.GameId), v129, v130));
end;
v92.FetchPhoneVerificationUpsell = function(v131, v132, v133, v134) --[[ Line: 404 ]] --[[ Name: FetchPhoneVerificationUpsell ]]
    -- upvalues: v17 (copy), v12 (copy)
    if not v131._getShowPhoneVerificationUpsellResult then
        v131._getShowPhoneVerificationUpsellResult = {};
        v131._getShowPhoneVerificationUpsellPromise = {};
    end;
    if not v131._getShowPhoneVerificationUpsellResult[v132] or v134 then
        if not v131._getShowPhoneVerificationUpsellPromise[v132] or v134 then
            v131._getShowPhoneVerificationUpsellPromise[v132] = v17.new(function(v135, _) --[[ Line: 415 ]]
                -- upvalues: v131 (copy), v132 (copy), v133 (copy), v12 (ref)
                local v137 = v131:_GetShowPhoneVerificationUpsell(v132, v133);
                v131._getShowPhoneVerificationUpsellResult[v132] = if type(v137) == "table" and v137.valueProp ~= nil then v137.valueProp else v12.PHONE_UPSELL_VOICE_CHAT_PROP.None;
                v135();
            end);
        end;
        v131._getShowPhoneVerificationUpsellPromise[v132]:await();
    end;
    return v131._getShowPhoneVerificationUpsellResult[v132];
end;
v92.DisablePhoneVerificationUpsell = function(v138) --[[ Line: 429 ]] --[[ Name: DisablePhoneVerificationUpsell ]]
    -- upvalues: v18 (copy), v12 (copy)
    v138._getShowPhoneVerificationUpsellResult = v18.Dictionary.map(v138._getShowPhoneVerificationUpsellResult, function() --[[ Line: 432 ]]
        -- upvalues: v12 (ref)
        return v12.PHONE_UPSELL_VOICE_CHAT_PROP.None;
    end);
end;
v92.GetNudgeAnalyticsData = function(v139) --[[ Line: 438 ]] --[[ Name: GetNudgeAnalyticsData ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0.LocalPlayer.UserId, v139:GetSessionId();
end;
v92.avatarChatUserAndPlaceSettingsValueOfClientFeatures = function(v140, v141) --[[ Line: 443 ]] --[[ Name: avatarChatUserAndPlaceSettingsValueOfClientFeatures ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v142 = {
        isUniverseEnabledForVoice = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UniverseAudio), 
        isPlaceEnabledForVoice = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.PlaceAudio), 
        isUniverseEnabledForAvatarVideo = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UniverseVideo), 
        isPlaceEnabledForAvatarVideo = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.PlaceVideo)
    };
    local v143 = {
        isUserEligible = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UserAudioEligible), 
        isVoiceEnabled = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UserAudio), 
        isAvatarVideoEligible = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UserVideoEligible), 
        isAvatarVideoEnabled = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UserVideo), 
        isUserVerifiedForVoice = if l_GetFFlagEnableVoiceSignal_0() then v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil, 
        isBanned = v140.AvatarChatService:IsEnabled(v141, Enum.AvatarChatServiceFeature.UserBanned), 
        bannedUntil = nil
    };
    return {
        universePlaceVoiceEnabledSettings = v142, 
        voiceSettings = v143
    };
end;
v92.resolveAvatarChatUserAndPlaceSettings = function(v144) --[[ Line: 490 ]] --[[ Name: resolveAvatarChatUserAndPlaceSettings ]]
    local l_status_3, l_result_3 = pcall(v144.AvatarChatService.GetClientFeaturesAsync, v144.AvatarChatService);
    if not l_status_3 then
        return nil;
    else
        return v144:avatarChatUserAndPlaceSettingsValueOfClientFeatures(l_result_3);
    end;
end;
v92.GetRequest = function(v147, v148, _) --[[ Line: 500 ]] --[[ Name: GetRequest ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 501 ]]
        -- upvalues: v147 (copy), v148 (copy), l_HttpService_0 (ref)
        local l_AsyncFullUrl_0 = v147.HttpRbxApiService:GetAsyncFullUrl(v148, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_AsyncFullUrl_0);
    end);
    return l_status_4 and l_result_4;
end;
v92.ToggleMuteSome = function(v153, v154, v155, v156, v157) --[[ Line: 509 ]] --[[ Name: ToggleMuteSome ]]
    -- upvalues: v50 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v153:ensureInitialized("mute some players");
    v153._mutedAnyone = true;
    local v158 = {};
    for _, v160 in v154 do
        if v50() then
            v158[v160] = true;
            v153.mutedPlayers[v160] = v155;
        else
            v153.service:SubscribePause(v160, v155);
        end;
        local v161 = v153.participants[tostring(v160)];
        if v161 then
            v161.isMutedLocally = v155;
            v153.participantsUpdate:Fire(v153.participants);
        end;
    end;
    if v50() then
        for v162 in v153.audioDevices do
            if v162.Player and v158[v162.Player.UserId] then
                if l_game_EngineFeature_0 and v162.Player ~= l_Players_0.LocalPlayer then
                    v162.MutedByLocalUser = v155;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    v162.Active = not v155;
                end;
            end;
        end;
    end;
    if v156 and v157 then
        v153.Analytics:reportVoiceMuteGroup((v153:JoinWithVoiceMuteData({
            groupType = v156, 
            context = v157, 
            muted = v155
        })));
    end;
end;
v92.GetMutedAnyone = function(v163) --[[ Line: 553 ]] --[[ Name: GetMutedAnyone ]]
    return v163._mutedAnyone;
end;
v92.ToggleMutePlayer = function(v164, v165, v166) --[[ Line: 557 ]] --[[ Name: ToggleMutePlayer ]]
    -- upvalues: v50 (copy), v27 (copy), v23 (copy), v13 (copy), v61 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy)
    v164:ensureInitialized("mute player " .. v165);
    v164._mutedAnyone = true;
    local v167 = if v50() and v27 then not v164.mutedPlayers[v165] else not v164.service:IsSubscribePaused(v165);
    v23:trace("Setting mute for {} to {}", v13.shorten(v165), v167);
    if v61() then
        v164.onPlayerMuteToggled:Fire();
    end;
    if v50() then
        v164.mutedPlayers[v165] = v167;
        for v168 in v164.audioDevices do
            if v168.Player and v168.Player.UserId == v165 then
                if l_game_EngineFeature_0 and v168.Player ~= l_Players_0.LocalPlayer then
                    v168.MutedByLocalUser = v167;
                else
                    if l_game_EngineFeature_0 then

                    end;
                    local v169 = v164.participants[tostring(v165)];
                    local v170 = v169 and not v169.isMuted;
                    v168.Active = not v167 and v170;
                end;
            end;
        end;
        v164:emit("OnPlayerMuted");
    else
        v164.service:SubscribePause(v165, v167);
    end;
    for _, v172 in pairs(v164.participants) do
        if v172.userId == v165 then
            v172.isMutedLocally = v167;
            v164.participantsUpdate:Fire(v164.participants);
        end;
    end;
    if v166 then
        v164.Analytics:reportVoiceMuteIndividual((v164:JoinWithVoiceMuteData({
            targetUserId = tonumber(v165), 
            context = v166, 
            muted = v167
        })));
    end;
end;
v92.MuteAll = function(v173, v174, v175) --[[ Line: 610 ]] --[[ Name: MuteAll ]]
    -- upvalues: v50 (copy), v23 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v12 (copy)
    v173:ensureInitialized("mute all");
    v173._mutedAnyone = true;
    if v50() then
        v173.muteAll = v174;
        v23:debug("Setting self mute all to {}", v174);
        for v176 in v173.audioDevices do
            if v176.Player and v176.Player ~= l_Players_0.LocalPlayer then
                v23:debug("Local muting {} to '{} = {}'", v176.Player.Name, v176.Active, v174);
                if l_game_EngineFeature_0 then
                    v176.MutedByLocalUser = v174;
                else
                    local l_UserId_0 = v176.Player.UserId;
                    v173.mutedPlayers[l_UserId_0] = v174;
                    local v178 = v173.participants[tostring(l_UserId_0)];
                    local v179 = v178 and not v178.isMuted;
                    v176.Active = not v174 and v179;
                end;
            end;
        end;
    else
        v173.service:SubscribePauseAll(v174);
    end;
    for _, v181 in pairs(v173.participants) do
        v181.isMutedLocally = v174;
        v173.participantsUpdate:Fire(v173.participants);
    end;
    v173.muteAllChanged:Fire(v174);
    if v175 then
        v173.Analytics:reportVoiceMuteGroup((v173:JoinWithVoiceMuteData({
            groupType = v12.VOICE_GROUP_TYPE.ALL, 
            context = v175, 
            muted = v174
        })));
    end;
end;
v92.FetchVoicePermissions = function(v182) --[[ Line: 652 ]] --[[ Name: FetchVoicePermissions ]]
    if not v182.communicationPermissionsResult then
        v182.communicationPermissionsResult = v182:resolveAvatarChatUserAndPlaceSettings();
    end;
    return v182.communicationPermissionsResult;
end;
v92.verifyUniverseAndPlaceCanUseVoice = function(v183) --[[ Line: 660 ]] --[[ Name: verifyUniverseAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v15 (copy)
    local v184 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v183:resolveAvatarChatUserAndPlaceSettings() else v183:FetchAgeVerificationOverlay();
    if not v184 then
        v183:_reportJoinFailed("invalidResponse", v15.ERROR);
        return false;
    else
        local l_universePlaceVoiceEnabledSettings_0 = v184.universePlaceVoiceEnabledSettings;
        return l_universePlaceVoiceEnabledSettings_0 and l_universePlaceVoiceEnabledSettings_0.isPlaceEnabledForVoice and l_universePlaceVoiceEnabledSettings_0.isUniverseEnabledForVoice;
    end;
end;
v92.IsUserInFTUX = function(v186) --[[ Line: 680 ]] --[[ Name: IsUserInFTUX ]]
    -- upvalues: l_GetFFlagSeamlessVoiceFTUX_0 (copy), v23 (copy)
    if not l_GetFFlagSeamlessVoiceFTUX_0() then
        return false;
    else
        local l_AppStorageService_1 = game:GetService("AppStorageService");
        local v188 = nil;
        if not pcall(function() --[[ Line: 686 ]]
            -- upvalues: l_AppStorageService_1 (copy), v188 (ref)
            v188 = l_AppStorageService_1:GetItem("SeamlessVoiceFTUX") == "true";
        end) then
            v23:warning("Failed to read FTUX/STUX from AppStorage");
            return false;
        else
            local v189 = v186:FetchAgeVerificationOverlay();
            if type(v189) == "table" and v189.voiceSettings and v189.voiceSettings.seamlessVoiceStatus ~= 3 then
                v23:debug("User not eligible for FTUX/STUX");
                return false;
            else
                return not v188;
            end;
        end;
    end;
end;
v92.userAndPlaceCanUseVoice = function(v190) --[[ Line: 709 ]] --[[ Name: userAndPlaceCanUseVoice ]]
    -- upvalues: l_GetFFlagAvatarChatServiceEnabled_0 (copy), v53 (copy), v89 (copy), v13 (copy), v15 (copy), v23 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v12 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_GetFFlagNonVoiceFTUX_0 (copy), v68 (copy), v71 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy)
    local v191 = if l_GetFFlagAvatarChatServiceEnabled_0() and v53() then v190:resolveAvatarChatUserAndPlaceSettings() else v89(v13.bind(v190, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)));
    if not v191 then
        v190:_reportJoinFailed("invalidResponse", v15.ERROR);
        return false;
    else
        local l_universePlaceVoiceEnabledSettings_1 = v191.universePlaceVoiceEnabledSettings;
        local l_voiceSettings_0 = v191.voiceSettings;
        v23:trace("Voice settings endpoint returned {}", v191);
        if l_GetFFlagEnableVoiceSignal_0() then
            v190.communicationPermissionsResult = v191;
            local v194 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and os.time();
            local v195 = l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v190:UserVoiceEnabled() and not l_voiceSettings_0.isUserVerifiedForVoice and (v190:FetchPhoneVerificationUpsell(v12.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v12.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or v194 and v190:FetchPhoneVerificationUpsell(v12.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v194) == v12.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat);
            if v190:UserEligibleForInExperienceUpsell() or v195 then
                v190:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
            end;
            if l_GetFFlagNonVoiceFTUX_0() and v190:IsUserInFTUX() then
                v190:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
            end;
            if v68 and v190:IsSeamlessVoice() and not v190:GetVoiceConnectCookieValue() then
                v23:debug("Suspending voice join due to voice connect cookie");
                v190:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
            elseif v68 and v190:IsSeamlessVoice() and v190:UserOnlyEligibleForVoice() then
                v23:debug("Suspending voice join for opt-out user");
                v190:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Suspended);
            end;
            if v71 then
                task.spawn(function() --[[ Line: 766 ]]
                    -- upvalues: v190 (copy)
                    v190:FetchAgeVerificationOverlay();
                end);
            end;
            if l_GetFFlagShowLikelySpeakingBubbles_0() and v190:UserEligibleForLikelySpeakingBubbles() then
                v190:emit("OnShowLikelySpeakingBubblesChanged", true);
            end;
        end;
        if l_universePlaceVoiceEnabledSettings_1 and not l_universePlaceVoiceEnabledSettings_1.isUniverseEnabledForVoice then
            v190:_reportJoinFailed("universeNotEnabled");
            return false;
        else
            v190:emit("OnUserAndPlaceCanUseVoiceResolved", l_voiceSettings_0, l_universePlaceVoiceEnabledSettings_1);
            if not l_universePlaceVoiceEnabledSettings_1 or not l_voiceSettings_0 then
                v190:_reportJoinFailed("invalidResponse", v15.ERROR);
            elseif not l_universePlaceVoiceEnabledSettings_1.isPlaceEnabledForVoice then
                v190:_reportJoinFailed("placeNotEnabled");
            elseif not l_voiceSettings_0.isVoiceEnabled then
                v190:_reportJoinFailed("userNotEnabled");
            end;
            return l_universePlaceVoiceEnabledSettings_1 and l_voiceSettings_0 and l_voiceSettings_0.isVoiceEnabled and l_universePlaceVoiceEnabledSettings_1.isPlaceEnabledForVoice;
        end;
    end;
end;
v92.voicePermissionGranted = function(_, v197) --[[ Line: 802 ]] --[[ Name: voicePermissionGranted ]]
    -- upvalues: l_PermissionsProtocol_0 (copy), v18 (copy)
    local _ = false;
    if typeof(v197) == "table" then
        local v199 = true;
        if v197.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
            v199 = not v18.List.find(v197.missingPermissions, l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS);
        end;
        return v199;
    else
        return v197 == l_PermissionsProtocol_0.Status.AUTHORIZED;
    end;
end;
v92.RawGetPermissions = function(v200, v201) --[[ Line: 822 ]] --[[ Name: RawGetPermissions ]]
    -- upvalues: v17 (copy)
    return v17.new(function(v202, _) --[[ Line: 823 ]]
        -- upvalues: v200 (copy), v201 (copy)
        v200:emit("GetPermissions", function(v204) --[[ Line: 824 ]]
            -- upvalues: v202 (copy)
            v202(v204);
        end, v201, true, true);
    end);
end;
v92.requestMicPermission = function(v205) --[[ Line: 831 ]] --[[ Name: requestMicPermission ]]
    -- upvalues: v23 (copy), l_PermissionsProtocol_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v71 (copy), l_GetFFlagGetRawMicrophonePermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v17 (copy), v55 (copy), v15 (copy)
    if v205.permissionPromise then
        v23:trace("PermissionProtocol already invoked");
        return v205.permissionPromise;
    else
        local v206 = {
            l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
        };
        local v207 = nil;
        if l_GetFFlagJoinWithoutMicPermissions_0(if v71 then v205:IsSeamlessVoice() else nil) then
            v23:debug("Requesting device permission");
            local v208 = nil;
            local v209 = nil;
            if l_GetFFlagGetRawMicrophonePermissions_0() then
                local v210, v211, v212 = pcall(function() --[[ Line: 846 ]]
                    -- upvalues: v205 (copy), v206 (copy)
                    return v205:RawGetPermissions(v206):await();
                end);
                v208 = v210 and v211;
                v209 = v212;
            else
                local v213, v214 = v205.PermissionsService:hasPermissions(v206):await();
                v208 = v213;
                v209 = v214;
            end;
            if v208 then
                if v209.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v205.permissionState = l_PERMISSION_STATE_0.LISTEN_AND_TALK;
                elseif v209.missingPermissions then
                    v205.permissionState = l_PERMISSION_STATE_0.PENDING_MIC;
                elseif v209.deniedPermissions then
                    v205.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                else
                    v23:error("PermissionsService returned unknown permission state. Defaulting to listen only.");
                    v205.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
                end;
            else
                v23:error("PermissionsService call failed.");
                v205.permissionState = l_PERMISSION_STATE_0.LISTEN_ONLY;
            end;
            v23:debug("Joining without mic permissions. Permission State: {}", v205.permissionState);
            v207 = v17.resolve();
        else
            v207 = if v55 then v17.new(function(v215, _) --[[ Line: 878 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v205 (copy), v206 (copy)
                v205:emit("GetPermissions", function(v217) --[[ Line: 879 ]]
                    -- upvalues: l_PermissionsProtocol_0 (ref), v215 (copy)
                    local v218 = {
                        status = v217.hasMicPermissions and l_PermissionsProtocol_0.Status.AUTHORIZED or l_PermissionsProtocol_0.Status.DENIED
                    };
                    v215(v218);
                end, v206);
            end) else v205.PermissionsService:requestPermissions(v206);
        end;
        v205.permissionPromise = v207:andThen(function(v219) --[[ Line: 893 ]]
            -- upvalues: l_GetFFlagJoinWithoutMicPermissions_0 (ref), v17 (ref), v23 (ref), v205 (copy), v15 (ref), v55 (ref), l_PermissionsProtocol_0 (ref)
            if l_GetFFlagJoinWithoutMicPermissions_0() then
                return v17.resolve();
            elseif not v219 and not v219.status then
                v23:debug("No permission response, rejecting access");
                v205:_reportJoinFailed("noPermissionResponse", v15.ERROR);
                return v17.reject();
            else
                v23:debug("Permission status {}", v219.status);
                local _ = nil;
                return (if v55 then v205:voicePermissionGranted(v219) else v219.status == l_PermissionsProtocol_0.Status.AUTHORIZED) and v17.resolve() or v17.reject();
            end;
        end):andThen(function() --[[ Line: 912 ]]
            -- upvalues: v205 (copy), v17 (ref)
            v205:emit("OnRequestMicPermissionResolved");
            return v17.resolve();
        end):catch(function() --[[ Line: 917 ]]
            -- upvalues: v205 (copy), v17 (ref)
            v205:emit("OnRequestMicPermissionRejected");
            return v17.reject();
        end);
        return v205.permissionPromise;
    end;
end;
v92.JoinByGroupIdToken = function(v221, v222, v223) --[[ Line: 924 ]] --[[ Name: JoinByGroupIdToken ]]
    v221.previousGroupId = v222;
    v221.previousMutedState = v223;
    return v221.service:JoinByGroupIdToken(v222, v223);
end;
v92.EnableVoice = function(v224) --[[ Line: 930 ]] --[[ Name: EnableVoice ]]
    -- upvalues: v23 (copy)
    v23:trace("Enabling voice");
    v224.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ Line: 933 ]]
        -- upvalues: v224 (copy)
        v224.attemptVoiceRejoin:Fire();
    end);
    v224.AvatarChatService:EnableVoice();
end;
v92.ChangeVoiceJoinProgress = function(v225, v226) --[[ Line: 939 ]] --[[ Name: ChangeVoiceJoinProgress ]]
    v225.VoiceJoinProgress = v226;
    v225.VoiceJoinProgressChanged:Fire(v225.VoiceJoinProgress);
end;
v92.IsSeamlessVoice = function(v227) --[[ Line: 944 ]] --[[ Name: IsSeamlessVoice ]]
    -- upvalues: v37 (copy), v12 (copy)
    local v228 = v227:FetchAgeVerificationOverlay();
    if v37 and (type(v228) ~= "table" or not v228 or not v228.voiceSettings) then
        return false;
    else
        local l_seamlessVoiceStatus_0 = v228.voiceSettings.seamlessVoiceStatus;
        local v230 = true;
        if l_seamlessVoiceStatus_0 ~= v12.SeamlessVoiceStatus.EnabledExistingUser then
            v230 = l_seamlessVoiceStatus_0 == v12.SeamlessVoiceStatus.EnabledNewUser;
        end;
        return v230;
    end;
end;
v92.UserInInExperienceUpsellTreatment = function(v231) --[[ Line: 962 ]] --[[ Name: UserInInExperienceUpsellTreatment ]]
    -- upvalues: v12 (copy)
    local v232 = v231:FetchAgeVerificationOverlay();
    if not v232 then
        return false;
    else
        local l_showVoiceInExperienceUpsellVariant_0 = v232.showVoiceInExperienceUpsellVariant;
        local v234 = true;
        if l_showVoiceInExperienceUpsellVariant_0 ~= v12.IN_EXP_UPSELL_VARIANT.VARIANT1 then
            v234 = true;
            if l_showVoiceInExperienceUpsellVariant_0 ~= v12.IN_EXP_UPSELL_VARIANT.VARIANT2 then
                v234 = l_showVoiceInExperienceUpsellVariant_0 == v12.IN_EXP_UPSELL_VARIANT.VARIANT3;
            end;
        end;
        return v234;
    end;
end;
v92.UserOnlyEligibleForVoice = function(v235) --[[ Line: 974 ]] --[[ Name: UserOnlyEligibleForVoice ]]
    local l_communicationPermissionsResult_0 = v235.communicationPermissionsResult;
    if not l_communicationPermissionsResult_0 or not l_communicationPermissionsResult_0.voiceSettings or not l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings then
        return false;
    else
        return l_communicationPermissionsResult_0.voiceSettings.isUserVerifiedForVoice and not l_communicationPermissionsResult_0.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v92.UserVoiceEnabled = function(v237) --[[ Line: 985 ]] --[[ Name: UserVoiceEnabled ]]
    local l_communicationPermissionsResult_1 = v237.communicationPermissionsResult;
    if not l_communicationPermissionsResult_1 or not l_communicationPermissionsResult_1.voiceSettings or not l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings then
        return false;
    else
        return l_communicationPermissionsResult_1.voiceSettings.isVoiceEnabled and l_communicationPermissionsResult_1.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice;
    end;
end;
v92.UserEligibleForInExperienceUpsell = function(v239) --[[ Line: 995 ]] --[[ Name: UserEligibleForInExperienceUpsell ]]
    -- upvalues: l_GetFFlagEnableVoiceSignal_0 (copy)
    local v240 = v239:UserOnlyEligibleForVoice();
    if not v240 then
        return false;
    elseif l_GetFFlagEnableVoiceSignal_0() then
        local v241 = v239:UserInInExperienceUpsellTreatment();
        return v240 and v241;
    else
        local v242 = v239:FetchAgeVerificationOverlay();
        return v240 and v242 and v242.showVoiceInExperienceUpsell;
    end;
end;
v92.UserEligibleForLikelySpeakingBubbles = function(v243) --[[ Line: 1016 ]] --[[ Name: UserEligibleForLikelySpeakingBubbles ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), v12 (copy)
    local v244 = v243:UserOnlyEligibleForVoice();
    if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and not v244 and not v243:UserVoiceEnabled() and v243:FetchPhoneVerificationUpsell(v12.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v12.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then
        return true;
    elseif not v244 then
        return false;
    else
        local v245 = v243:FetchAgeVerificationOverlay();
        return v244 and v245 and v245.showVoiceInExperienceUpsell;
    end;
end;
v92.canUseServiceAsync = function(v246) --[[ Line: 1041 ]] --[[ Name: canUseServiceAsync ]]
    -- upvalues: v23 (copy), v17 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), l_VOICE_CHAT_AVAILABILITY_0 (copy), v38 (copy), v33 (copy), l_VoiceChatService_0 (copy)
    if v246.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
        v23:debug("Voice Chat is not Available, rejecting canUseService promise");
        return v17.reject();
    else
        if not v246.canUseServicePromise then
            v246.canUseServicePromise = v17.defer(function(v247, v248) --[[ Line: 1048 ]]
                -- upvalues: v246 (copy), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref), v23 (ref), l_VOICE_CHAT_AVAILABILITY_0 (ref), v38 (ref), v33 (ref), l_VoiceChatService_0 (ref)
                local v249 = v246:userAndPlaceCanUseVoice();
                if l_GetFFlagEnableVoiceSignal_0() and v246.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Suspended then
                    v23:debug("Place is voice enabled but user is not, delaying voice rejection");
                    v246.attemptVoiceRejoin.Event:Wait();
                    v23:debug("Attempting voice rejoin");
                    v246.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true;
                    v246.userEligible = true;
                    v247();
                    v246:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joining);
                    return;
                elseif not v249 then
                    v23:info("Voice access denied");
                    v246.available = l_VOICE_CHAT_AVAILABILITY_0.UserNotAvailable;
                    v248();
                    return;
                else
                    if game:GetEngineFeature("VoiceChatEnabledRccProperties") and v38() then
                        if not game:IsLoaded() then
                            game.Loaded:Wait();
                        end;
                        if v33 and not l_VoiceChatService_0.UseNewAudioApi and not l_VoiceChatService_0.EnableDefaultVoice then
                            v248();
                            return;
                        elseif not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc or not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                            v23:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc, l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc);
                            if not l_VoiceChatService_0.VoiceChatEnabledForUniverseOnRcc then
                                v246:_reportJoinFailed("universeNotEnabled");
                            elseif not l_VoiceChatService_0.VoiceChatEnabledForPlaceOnRcc then
                                v246:_reportJoinFailed("placeNotEnabled");
                            end;
                            v246.available = l_VOICE_CHAT_AVAILABILITY_0.PlaceNotAvailable;
                            v248();
                            return;
                        end;
                    end;
                    v246.userEligible = true;
                    v247();
                    return;
                end;
            end):andThen(function() --[[ Line: 1104 ]]
                -- upvalues: v246 (copy)
                return v246:requestMicPermission();
            end);
        end;
        return v246.canUseServicePromise;
    end;
end;
v92._setRecentUserState = function(v250, v251, v252) --[[ Line: 1111 ]] --[[ Name: _setRecentUserState ]]
    -- upvalues: v18 (copy)
    local v253 = v250.recentUsersInteractionData[tostring(v251)] or {};
    local v254 = v18.Dictionary.join(v253, v252);
    v250.recentUsersInteractionData = v18.Dictionary.join(v250.recentUsersInteractionData, {
        [tostring(v251)] = v254
    });
end;
v92.getRecentUsersInteractionData = function(v255) --[[ Line: 1121 ]] --[[ Name: getRecentUsersInteractionData ]]
    v255:_updateRecentUsersInteractionData();
    return v255.recentUsersInteractionData;
end;
v92.GetSignalREvent = function(v256, v257) --[[ Line: 1126 ]] --[[ Name: GetSignalREvent ]]
    return v256.SignalREventTable[v257].Event;
end;
v92._updateRecentUsersInteractionData = function(v258) --[[ Line: 1131 ]] --[[ Name: _updateRecentUsersInteractionData ]]
    -- upvalues: v35 (copy), v49 (copy), l_Players_0 (copy), v51 (copy), v18 (copy)
    local v259 = os.time();
    local v260 = {};
    if v258.recentUsersInteractionData then
        for v261, v262 in pairs(v258.recentUsersInteractionData) do
            local v263 = if v35 then v258.participants[tostring(v261)] else v258.participants[v261];
            local v264 = v49() and not l_Players_0:GetPlayerByUserId((tonumber(v261)));
            local v265 = v259 - v262.lastHeardTime >= v51();
            local v266 = not v263 or v263.isMuted;
            if v265 and v266 or v264 then
                v260[v261] = v18.None;
            end;
        end;
        v258.recentUsersInteractionData = v18.Dictionary.join(v258.recentUsersInteractionData, v260);
    end;
end;
v92.SetupParticipantListeners = function(v267) --[[ Line: 1155 ]] --[[ Name: SetupParticipantListeners ]]
    -- upvalues: v23 (copy), v49 (copy), l_GetFFlagPlayerListAnimateMic_0 (copy), v35 (copy), l_Players_0 (copy), v50 (copy), v27 (copy), v28 (copy), v56 (copy), v66 (copy), v41 (copy), l_GetFFlagEnableVoiceSignal_0 (copy), l_VOICE_JOIN_PROGRESS_0 (copy), v74 (copy), l_VoiceChatService_0 (copy), l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), v39 (copy), v34 (copy), v47 (copy), v40 (copy), v48 (copy), v13 (copy), v36 (copy)
    v267:ensureInitialized("setup participant listeners");
    if not v267.participants then
        v267.participants = {};
        v267.recentUsersInteractionData = {};
        v267.updatedParticipants = {};
        v267.participantConnection = v267.service.ParticipantsStateChanged:Connect(function(v268, v269, v270) --[[ Line: 1164 ]]
            -- upvalues: v23 (ref), v49 (ref), v267 (copy), l_GetFFlagPlayerListAnimateMic_0 (ref), v35 (ref), l_Players_0 (ref), v50 (ref), v27 (ref), v28 (ref), v56 (ref)
            v23:trace("Participants state changed");
            for _, v272 in ipairs(v268) do
                if not v49() and not v267.participants[tostring(v272)].isMuted then
                    v267:_setRecentUserState(v272, {
                        lastHeardTime = os.time()
                    });
                end;
                v267.participants[tostring(v272)] = nil;
                v267.participantLeft:Fire(v267.participants, l_GetFFlagPlayerListAnimateMic_0() and v272 or nil);
                v267:emit("OnVoiceParticipantRemoved", v272);
            end;
            for _, v274 in ipairs(v269) do
                v267.participantJoined:Fire(v267.participants, v274);
                v267:emit("OnVoiceParticipantAdded", v274);
            end;
            for _, v276 in pairs(v270) do
                local l_userId_0 = v276.userId;
                local v278 = if v35 then v267.participants[tostring(l_userId_0)] else v267.participants[l_userId_0];
                if not v276.isMuted or v278 and not v278.isMuted then
                    v267:_setRecentUserState(l_userId_0, {
                        lastHeardTime = os.time(), 
                        player = l_Players_0:GetPlayerByUserId(l_userId_0)
                    });
                end;
                if not v278 or v278.isMuted ~= v276.isMuted then
                    v267:emit("OnVoiceParticipantToggleMuted", l_userId_0, v276.isMuted);
                end;
                if v50() and v27 then
                    v276.isMutedLocally = not not v267.mutedPlayers[l_userId_0];
                end;
                if v28() then
                    if v50() then
                        v276.isMutedLocally = if v267.mutedPlayers[l_userId_0] then not not v267.mutedPlayers[l_userId_0] else v276.isMutedLocally;
                    end;
                    if v267.muteAll then
                        v276.isMutedLocally = true;
                    end;
                end;
                v267.participants[tostring(l_userId_0)] = v276;
                if v56() then
                    v267.updatedParticipants[tostring(l_userId_0)] = v276;
                end;
            end;
            v267:_updateRecentUsersInteractionData();
            if v267.shouldThrottleParticipantUpdate then
                local v279 = tick();
                if v279 - v267.lastParticipantsStateUpdate >= v267.participantsStateThrottleTime and #v270 > 0 then
                    v267.lastParticipantsStateUpdate = v279;
                    v267.participantsUpdate:Fire(if v56() then v267.updatedParticipants else v267.participants);
                    v267.updatedParticipants = {};
                    return;
                elseif #v270 > 0 then
                    local v280 = v267.participantsStateThrottleTime - (v279 - v267.lastParticipantsStateUpdate);
                    v267.lastStateUpdateCounter = (v267.lastStateUpdateCounter + 1) % 100;
                    local l_lastStateUpdateCounter_0 = v267.lastStateUpdateCounter;
                    task.wait(v280);
                    if l_lastStateUpdateCounter_0 == v267.lastStateUpdateCounter then
                        v267.participantsUpdate:Fire(if v56() then v267.updatedParticipants else v267.participants);
                        v267.updatedParticipants = {};
                        return;
                    end;
                end;
            elseif #v270 > 0 then
                v267.participantsUpdate:Fire(if v56() then v267.updatedParticipants else v267.participants);
                v267.updatedParticipants = {};
            end;
        end);
        if v66 then
            local function v289(v282, v283) --[[ Line: 1270 ]] --[[ Name: onStateChanged ]]
                -- upvalues: v267 (copy), v41 (ref), v23 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref)
                v267:emit("OnStateChanged", v282, v283);
                local v284 = v283 == Enum.VoiceChatState.Failed;
                local v285 = v283 == Enum.VoiceChatState.Joining;
                local v286 = v283 == Enum.VoiceChatState.Leaving;
                local v287 = v283 == Enum.VoiceChatState.Ended;
                local v288 = v267.service:IsPublishPaused();
                if v41() then
                    if v288 ~= v267.localMuted and not v284 and not v285 and not v286 and not v287 then
                        v267.localMuted = v288;
                        v267.muteChanged:Fire(v288);
                    elseif v285 or v286 or v287 then
                        v267.localMuted = nil;
                    end;
                elseif v288 ~= v267.localMuted then
                    v267.localMuted = v288;
                    v267.muteChanged:Fire(v288);
                end;
                if v283 == Enum.VoiceChatState.Leaving then
                    v267.previousGroupId = v267.service:GetGroupId();
                    v267.previousMutedState = v267.service:IsPublishPaused();
                end;
                if v283 == Enum.VoiceChatState.Ended or v284 then
                    v267.participants = {};
                    v267.localMuted = nil;
                    v267.participantsUpdate:Fire(v267.participants);
                    if v284 then
                        v23:debug("State Changed to Failed. Reason: {}", v267.service:GetAndClearCallFailureMessage());
                    end;
                    if v282 == Enum.VoiceChatState.Joining or v282 == Enum.VoiceChatState.JoiningRetry or v282 == Enum.VoiceChatState.Joined then
                        if v283 == Enum.VoiceChatState.Ended then
                            v23:debug("State Changed to Ended from {}", v282);
                        end;
                        v267:emit("OnRetryRequested");
                    end;
                end;
                if l_GetFFlagEnableVoiceSignal_0() and v267.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Joining and v283 == Enum.VoiceChatState.Joined then
                    v267:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joined);
                    v267:emit("OnVoiceJoin");
                end;
            end;
            if v267.service.VoiceChatState and v267.service.VoiceChatState == Enum.VoiceChatState.Joined then
                v23:debug("Joined voice chat {}", v267.service.VoiceChatState);
                v289(nil, Enum.VoiceChatState.Joined);
            end;
            v267.stateConnection = v267.service.StateChanged:Connect(v289);
        else
            v267.stateConnection = v267.service.StateChanged:Connect(function(v290, v291) --[[ Line: 1337 ]]
                -- upvalues: v267 (copy), v41 (ref), v23 (ref), l_GetFFlagEnableVoiceSignal_0 (ref), l_VOICE_JOIN_PROGRESS_0 (ref)
                v267:emit("OnStateChanged", v290, v291);
                local v292 = v291 == Enum.VoiceChatState.Failed;
                local v293 = v291 == Enum.VoiceChatState.Joining;
                local v294 = v291 == Enum.VoiceChatState.Leaving;
                local v295 = v291 == Enum.VoiceChatState.Ended;
                local v296 = v267.service:IsPublishPaused();
                if v41() then
                    if v296 ~= v267.localMuted and not v292 and not v293 and not v294 and not v295 then
                        v267.localMuted = v296;
                        v267.muteChanged:Fire(v296);
                    elseif v293 or v294 or v295 then
                        v267.localMuted = nil;
                    end;
                elseif v296 ~= v267.localMuted then
                    v267.localMuted = v296;
                    v267.muteChanged:Fire(v296);
                end;
                if v291 == Enum.VoiceChatState.Leaving then
                    v267.previousGroupId = v267.service:GetGroupId();
                    v267.previousMutedState = v267.service:IsPublishPaused();
                end;
                if v291 == Enum.VoiceChatState.Ended or v292 then
                    v267.participants = {};
                    v267.localMuted = nil;
                    v267.participantsUpdate:Fire(v267.participants);
                    if v292 then
                        v23:debug("State Changed to Failed. Reason: {}", v267.service:GetAndClearCallFailureMessage());
                    end;
                    if v290 == Enum.VoiceChatState.Joining or v290 == Enum.VoiceChatState.JoiningRetry or v290 == Enum.VoiceChatState.Joined then
                        if v291 == Enum.VoiceChatState.Ended then
                            v23:debug("State Changed to Ended from {}", v290);
                        end;
                        v267:emit("OnRetryRequested");
                    end;
                end;
                if l_GetFFlagEnableVoiceSignal_0() and v267.VoiceJoinProgress == l_VOICE_JOIN_PROGRESS_0.Joining and v291 == Enum.VoiceChatState.Joined then
                    v267:ChangeVoiceJoinProgress(l_VOICE_JOIN_PROGRESS_0.Joined);
                    v267:emit("OnVoiceJoin");
                end;
            end);
        end;
        if v74 and l_VoiceChatService_0.UseNewAudioApi then
            if not v267.localMeteringTask then
                v267.localMeteringTask = task.spawn(function() --[[ Line: 1401 ]]
                    -- upvalues: v267 (copy)
                    while true do
                        v267:UpdateLocalMetering();
                        task.wait();
                    end;
                end);
            end;
        elseif v267.service:GetVoiceChatApiVersion() >= l_MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY_0 then
            v267.micConnection = v267.service.PlayerMicActivitySignalChange:Connect(function(v297) --[[ Line: 1410 ]]
                -- upvalues: v267 (copy), l_GetFFlagLocalMutedNilFix_0 (ref)
                v267.isTalking = v297.isActive;
                if l_GetFFlagLocalMutedNilFix_0() then
                    if v267.localMuted == false then
                        v267.talkingChanged:Fire(v267.isTalking);
                        return;
                    end;
                elseif not v267.localMuted then
                    v267.talkingChanged:Fire(v267.isTalking);
                end;
            end);
        end;
        if v39() then
            v267.playerModeratedConnection = v267:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ Line: 1427 ]]
                -- upvalues: v23 (ref), v267 (copy)
                v23:debug("User Moderated");
                v267.previousSessionId = v267.service:GetSessionId();
                v267:emit("OnPlayerModerated");
                v267.service:Leave();
            end);
        elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
            v267.playerModeratedConnection = v267.service.LocalPlayerModerated:connect(function() --[[ Line: 1435 ]]
                -- upvalues: v23 (ref), v267 (copy), v34 (ref)
                v23:debug("User Moderated old");
                v267.previousSessionId = v267.service:GetSessionId();
                v267:emit(v34 and "OnPlayerModerated" or "ShowPlayerModeratedMessage");
                v267.service:Leave();
            end);
        end;
        if v47() then
            v23:trace("Setting up voice nudge handlers");
            v267.voiceToxicityModalConnection = v267:GetSignalREvent("VoiceToxicityModal"):Connect(function(v298) --[[ Line: 1447 ]]
                -- upvalues: v40 (ref), v267 (copy)
                if v40() then
                    v267.Analytics:reportReceivedNudge(v298, v267:GetNudgeAnalyticsData());
                end;
                v267:emit("OnVoiceToxicityModal");
            end);
            v267.VoiceToxicityToastConnection = v267:GetSignalREvent("VoiceToxicityToast"):Connect(function(v299) --[[ Line: 1455 ]]
                -- upvalues: v40 (ref), v267 (copy)
                if v40() then
                    v267.Analytics:reportReceivedNudge(v299, v267:GetNudgeAnalyticsData());
                end;
                v267:emit("OnVoiceToxicityToast");
            end);
        end;
        if v48() then
            v23:trace("Setting up voice reverse nudge handlers");
            v267.voiceReverseNudgeConnection = v267:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(v300) --[[ Line: 1465 ]]
                -- upvalues: v267 (copy)
                v267:emit("OnVoiceReverseNudgeIconColorChange", v300);
            end);
        end;
        v267.blockConnection = v267.BlockStatusChanged:Connect(function(v301, v302) --[[ Line: 1470 ]]
            -- upvalues: v267 (copy), v23 (ref), v13 (ref)
            if v302 then
                if v267.participants[tostring(v301)] then
                    v23:debug("Blocking {}", v13.shorten(v301));
                    v267.service:SubscribeBlock(v301);
                    return;
                end;
            else
                v23:debug("UnBlocking {}", v13.shorten(v301));
                v267.service:SubscribeUnblock(v301);
            end;
        end);
        if v50() then
            v267:hookupAudioDeviceInputListener();
        end;
        if v36 and v267.service.TempSetMicMutedToggleMic then
            v267.tempSetMicMutedToggleMicConnection = v267.service.TempSetMicMutedToggleMic:connect(function() --[[ Line: 1488 ]]
                -- upvalues: v267 (copy)
                v267:ToggleMic("TempSetMicMutedToggleMic");
            end);
        end;
    end;
end;
local v303 = nil;
v92.CheckAudioInputExists = function(v304) --[[ Line: 1496 ]] --[[ Name: CheckAudioInputExists ]]
    -- upvalues: v23 (copy), v303 (ref), v17 (copy), v18 (copy)
    v23:trace("Checking for AudioDeviceInput");
    if not v303 then
        v303 = v17.new(function(v305, _) --[[ Line: 1499 ]]
            -- upvalues: v18 (ref), v304 (copy), v23 (ref)
            if #v18.Dictionary.keys(v304.audioDevices) > 0 then
                v23:trace("Found existing AudioDeviceInput");
                v305();
                return;
            else
                v304.audioDeviceInputAdded.Event:Connect(function() --[[ Line: 1504 ]]
                    -- upvalues: v23 (ref), v305 (copy)
                    v23:trace("Found new AudioDeviceInput");
                    v305();
                end);
                return;
            end;
        end);
    end;
    return v303;
end;
v92.checkAndUpdateSequence = function(v307, v308, v309) --[[ Line: 1514 ]] --[[ Name: checkAndUpdateSequence ]]
    if not v309 then
        return 0;
    elseif not v307.SequenceNumbers[v308] then
        v307.SequenceNumbers[v308] = v309;
        return 0;
    else
        local v310 = v309 - v307.SequenceNumbers[v308];
        if v310 > 0 then
            v307.SequenceNumbers[v308] = v309;
        end;
        return v310 - 1;
    end;
end;
v92.onInstanceAdded = function(v311, v312) --[[ Line: 1537 ]] --[[ Name: onInstanceAdded ]]
    -- upvalues: v26 (copy), v23 (copy)
    if v312:IsA("AudioDeviceInput") then
        if v26 then
            v311.audioDeviceInputAdded:Fire(v312);
        end;
        v23:debug("Found new audio device instance for {}", v312.Player and v312.Player.Name);
        v311.audioDevices[v312] = v311:CreateAudioDeviceData(v312);
        v311:emit("OnAudioDeviceInputAdded");
        v311:StartAnalysis(v312);
    end;
end;
v92.GetSendMuteEvent = function(v313) --[[ Line: 1550 ]] --[[ Name: GetSendMuteEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v313.SendMuteEvent then
        v313.SendMuteEvent = l_RobloxReplicatedStorage_0:WaitForChild("SetUserActive", 10);
    end;
    return v313.SendMuteEvent;
end;
local function _(v314, v315) --[[ Line: 1557 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v314;
    l_Wire_0.TargetInstance = v315;
    l_Wire_0.Parent = v315;
    return l_Wire_0;
end;
local function _() --[[ Line: 1566 ]] --[[ Name: GetAnalysisHost ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    return l_RobloxReplicatedStorage_0;
end;
v92.GetAnalyzer = function(_, v320) --[[ Line: 1570 ]] --[[ Name: GetAnalyzer ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    local v321 = v320.Name .. "_Analyzer";
    local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
    local l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = l_l_RobloxReplicatedStorage_0_0:FindFirstChild(v321);
    if not l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 then
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0 = Instance.new("AudioAnalyzer");
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Name = v321;
        l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0.Parent = l_l_RobloxReplicatedStorage_0_0;
    end;
    return l_l_l_RobloxReplicatedStorage_0_0_FirstChild_0;
end;
local function _(v324) --[[ Line: 1582 ]] --[[ Name: toDecibels ]]
    return 20 * math.log10(v324);
end;
v92.IsSignalActive = function(v326, v327) --[[ Line: 1586 ]] --[[ Name: IsSignalActive ]]
    -- upvalues: v74 (copy), l_Players_0 (copy)
    if not v74 then
        return false;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v327);
        if not l_l_Players_0_PlayerByUserId_0 then
            return false;
        else
            return 20 * math.log10(v326:GetAnalyzer(l_l_Players_0_PlayerByUserId_0).PeakLevel) > -36;
        end;
    end;
end;
v92.StopAnalysis = function(_, v330) --[[ Line: 1600 ]] --[[ Name: StopAnalysis ]]
    -- upvalues: v74 (copy), l_RobloxReplicatedStorage_0 (copy)
    if not v74 then
        return;
    else
        for _, v332 in v330:GetConnectedWires("Output") do
            local l_TargetInstance_0 = v332.TargetInstance;
            if l_TargetInstance_0 and l_TargetInstance_0:IsDescendantOf(l_RobloxReplicatedStorage_0) then
                v332:Destroy();
            end;
        end;
        return;
    end;
end;
v92.StartAnalysis = function(v334, v335) --[[ Line: 1616 ]] --[[ Name: StartAnalysis ]]
    -- upvalues: v74 (copy)
    if not v74 then
        return;
    else
        local l_Player_0 = v335.Player;
        if not l_Player_0 then
            return;
        else
            local l_v334_Analyzer_0 = v334:GetAnalyzer(l_Player_0);
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = v335;
            l_Wire_1.TargetInstance = l_v334_Analyzer_0;
            l_Wire_1.Parent = l_v334_Analyzer_0;
            return;
        end;
    end;
end;
v92.GetVoiceConnectCookieValue = function(v339) --[[ Line: 1628 ]] --[[ Name: GetVoiceConnectCookieValue ]]
    -- upvalues: v12 (copy)
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 1629 ]]
        -- upvalues: v339 (copy), v12 (ref)
        return v339.AppStorageService:GetItem(v12.VOICE_CONNECT_DISCONNECT_KEY);
    end);
    if l_status_5 then
        return l_result_5 == "true";
    else
        return true;
    end;
end;
v92.SetVoiceConnectCookieValue = function(v342, v343) --[[ Line: 1636 ]] --[[ Name: SetVoiceConnectCookieValue ]]
    -- upvalues: v12 (copy)
    return (pcall(function() --[[ Line: 1637 ]]
        -- upvalues: v342 (copy), v12 (ref), v343 (copy)
        v342.AppStorageService:SetItem(v12.VOICE_CONNECT_DISCONNECT_KEY, (tostring(v343)));
        v342.AppStorageService:Flush();
    end));
end;
v92.SetAndSyncActive = function(v344, v345, v346) --[[ Line: 1644 ]] --[[ Name: SetAndSyncActive ]]
    -- upvalues: l_Players_0 (copy)
    v345.Active = v346;
    local l_v344_SendMuteEvent_0 = v344:GetSendMuteEvent();
    if l_v344_SendMuteEvent_0 and v345.Player == l_Players_0.LocalPlayer then
        l_v344_SendMuteEvent_0:FireServer(v346);
    end;
end;
v92.CreateAudioDeviceData = function(v348, v349) --[[ Line: 1653 ]] --[[ Name: CreateAudioDeviceData ]]
    -- upvalues: l_Players_0 (copy), l_game_EngineFeature_0 (copy), v31 (copy), v23 (copy), v32 (copy)
    local v350 = {};
    local v351 = v349.Player == l_Players_0.LocalPlayer;
    if l_game_EngineFeature_0 then
        if not v349.MutedByLocalUser then
            if v348.muteAll and not v351 then
                v349.MutedByLocalUser = true;
            end;
            if v349.Player and v348.mutedPlayers[v349.Player.UserId] then
                v349.MutedByLocalUser = true;
            end;
        end;
    elseif v349.Active then
        if v348.muteAll and not v351 then
            v349.Active = false;
        end;
        if v349.Player and v348.mutedPlayers[v349.Player.UserId] then
            v349.Active = false;
        end;
    end;
    if v31 and v349.Active and v351 and v348.localMuted == nil then
        v348:SetAndSyncActive(v349, false);
    end;
    if v351 and v348.localMuted ~= nil and v348.localMuted ~= not v349.Active and not v348.isInCall then
        v23:debug("Mismatch between LocalMuted and device.Active");
        local v352 = not v348.localMuted;
        v349.Active = v352;
        local l_v348_SendMuteEvent_0 = v348:GetSendMuteEvent();
        if l_v348_SendMuteEvent_0 then
            l_v348_SendMuteEvent_0:FireServer(v352);
        end;
    elseif v348.isInCall and v351 then
        local v354 = not v348.callMutedState;
        v23:debug("Overwriting Active State to match Iris call. .Active = {}", v354);
        v349.Active = v354;
        local l_v348_SendMuteEvent_1 = v348:GetSendMuteEvent();
        if l_v348_SendMuteEvent_1 then
            l_v348_SendMuteEvent_1:FireServer(v354);
        end;
    end;
    v350.onPlayerChanged = v349:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 1705 ]]
        -- upvalues: v348 (copy), v349 (copy), v32 (ref), v351 (ref), l_Players_0 (ref), v31 (ref), v23 (ref), l_game_EngineFeature_0 (ref)
        v348:StopAnalysis(v349);
        if v32 then
            v351 = v349.Player == l_Players_0.LocalPlayer;
            if v351 then
                if v31 and v349.Active and v348.localMuted == nil then
                    v348:SetAndSyncActive(v349, false);
                elseif v348.localMuted ~= nil and v348.localMuted ~= not v349.Active then
                    v23:debug("Mismatch between LocalMuted and device.Active");
                    v348:SetAndSyncActive(v349, not v348.localMuted);
                end;
            elseif v348.muteAll or v349.Player and v348.mutedPlayers[v349.Player.UserId] then
                if l_game_EngineFeature_0 then
                    v349.MutedByLocalUser = true;
                else
                    v349.Active = false;
                end;
            end;
        end;
        v348:emit("OnDevicePlayerChanged");
        v348:StartAnalysis(v349);
    end);
    v350.onMutedChanged = v349:GetPropertyChangedSignal("Muted"):Connect(function() --[[ Line: 1731 ]]
        -- upvalues: v348 (copy)
        v348:emit("OnDeviceMuteChanged");
    end);
    if not l_game_EngineFeature_0 then
        v350.onActiveChanged = v349:GetPropertyChangedSignal("Active"):Connect(function() --[[ Line: 1736 ]]
            -- upvalues: v348 (copy), v351 (ref), v349 (copy)
            v348:emit("OnDeviceActiveChanged");
            if v348.muteAll and not v351 then
                v349.Active = false;
            end;
            if v349.Player and v348.mutedPlayers[v349.Player.UserId] then
                v349.Active = false;
            end;
        end);
    end;
    return v350;
end;
v92.onInstanceRemove = function(v356, v357) --[[ Line: 1750 ]] --[[ Name: onInstanceRemove ]]
    -- upvalues: v23 (copy), l_game_EngineFeature_0 (copy), v74 (copy)
    if v357:IsA("AudioDeviceInput") then
        v356:StopAnalysis(v357);
        v23:trace("Removing AudioDeviceInput {} {} {}", v357, "for user", v357.Player and v357.Player.UserId);
        local v358 = v356.audioDevices[v357];
        if v358 then
            if not l_game_EngineFeature_0 then
                v358.onActiveChanged:Disconnect();
            end;
            v358.onMutedChanged:Disconnect();
            v358.onPlayerChanged:Disconnect();
        end;
        v356.audioDevices[v357] = nil;
        v356:emit("OnAudioDeviceInputRemoved");
        if v74 and v357.Player then
            v356:GetAnalyzer(v357.Player):Destroy();
        end;
    end;
end;
v92.hookupAudioDeviceInputListener = function(v359) --[[ Line: 1771 ]] --[[ Name: hookupAudioDeviceInputListener ]]
    -- upvalues: v23 (copy), l_Players_0 (copy), v30 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy), v25 (copy), l_CollectionService_0 (copy), v13 (copy)
    v23:debug("Hooking up audio device listeners");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v30 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v361) --[[ Line: 1775 ]]
            -- upvalues: v359 (copy)
            v359:onInstanceAdded(v361);
        end);
    else
        game.DescendantAdded:Connect(function(v362) --[[ Line: 1779 ]]
            -- upvalues: v359 (copy)
            v359:onInstanceAdded(v362);
        end);
    end;
    local l_AudioDeviceInput_0 = l_LocalPlayer_0:FindFirstChildOfClass("AudioDeviceInput");
    v23:debug("Found local user audio device {}", l_AudioDeviceInput_0);
    if l_AudioDeviceInput_0 then
        v359:onInstanceAdded(l_AudioDeviceInput_0);
    end;
    if l_VoiceChatService_0.EnableDefaultVoice then
        v23:debug("Creating default voice listener");
        if not game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
            local l_AudioListener_0 = Instance.new("AudioListener");
            l_AudioListener_0.Parent = workspace.CurrentCamera;
            local l_Wire_2 = Instance.new("Wire");
            l_Wire_2.Parent = l_AudioListener_0;
            local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
            l_AudioDeviceOutput_0.Parent = l_Wire_2;
            l_Wire_2.SourceInstance = l_AudioListener_0;
            l_Wire_2.TargetInstance = l_AudioDeviceOutput_0;
        end;
        if v25 then
            for _, v368 in l_CollectionService_0:GetTagged("RbxDefaultVoiceEmitter") do
                v13.destroyDefaultEmitter(v368);
            end;
            l_CollectionService_0:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(v13.destroyDefaultEmitter);
        end;
        l_LocalPlayer_0.CharacterAdded:Connect(v13.avoidEmitting);
        if l_LocalPlayer_0.Character then
            v13.avoidEmitting(l_LocalPlayer_0.Character);
        end;
    end;
    game.DescendantRemoving:Connect(function(v369) --[[ Line: 1817 ]]
        -- upvalues: v359 (copy)
        v359:onInstanceRemove(v369);
    end);
    for _, v371 in game:GetDescendants() do
        v359:onInstanceAdded(v371);
    end;
    l_Players_0.PlayerRemoving:Connect(function(v372) --[[ Line: 1826 ]]
        -- upvalues: v359 (copy)
        for v373 in v359.audioDevices do
            if v373.Player and v373.Player == v372 then
                v359:onInstanceRemove(v373);
            end;
        end;
    end);
end;
v92.RejoinCurrentChannel = function(v374) --[[ Line: 1836 ]] --[[ Name: RejoinCurrentChannel ]]
    -- upvalues: v45 (copy), v23 (copy)
    pcall(function() --[[ Line: 1837 ]]
        -- upvalues: v374 (copy), v45 (ref), v23 (ref)
        local l_GroupId_0 = v374.service:GetGroupId();
        if l_GroupId_0 and l_GroupId_0 ~= "" then
            local v376 = v374.service:IsPublishPaused();
            v374.service:Leave();
            if v45() then
                v23:debug("Rejoining current channel {}", l_GroupId_0);
                v374.participants = {};
                v374.participantsUpdate:Fire(v374.participants);
            end;
            if not v374.service:JoinByGroupIdToken(l_GroupId_0, v376, true) then
                v374:emit("OnInitialJoinFailed");
            end;
        end;
    end);
end;
v92.RejoinChannel = function(v377, v378, v379) --[[ Line: 1856 ]] --[[ Name: RejoinChannel ]]
    -- upvalues: v23 (copy)
    v23:debug("Rejoining previous channel {} with mute status {}", v378, v379);
    if v378 and v378 ~= "" then
        pcall(function() --[[ Line: 1860 ]]
            -- upvalues: v377 (copy), v378 (copy), v379 (copy)
            v377.service:Leave();
            v377.participants = {};
            v377.participantsUpdate:Fire(v377.participants);
            if not v377.service:JoinByGroupIdToken(v378, v379, true) then
                v377:emit("OnInitialJoinFailed");
            end;
        end);
    end;
end;
v92.RejoinVoice = function(v380) --[[ Line: 1872 ]] --[[ Name: RejoinVoice ]]
    -- upvalues: l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), v23 (copy)
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        v23:debug("Rejoining voice");
        v380.service:Leave();
        v380.participants = {};
        v380.participantsUpdate:Fire(v380.participants);
        local l_VoiceChatService_1 = game:GetService("VoiceChatService");
        if l_VoiceChatService_1 then
            l_VoiceChatService_1:rejoinVoice();
        end;
    end;
end;
v92.watchSignalR = function(v382) --[[ Line: 1888 ]] --[[ Name: watchSignalR ]]
    -- upvalues: l_WATCHED_NAMESPACES_0 (copy), v13 (copy), v44 (copy), v23 (copy)
    v382.NotificationService.RobloxEventReceived:Connect(function(v383) --[[ Line: 1889 ]]
        -- upvalues: l_WATCHED_NAMESPACES_0 (ref), v13 (ref), v44 (ref), v382 (copy), v23 (ref)
        local l_namespace_0 = v383.namespace;
        if not l_WATCHED_NAMESPACES_0[l_namespace_0] then
            return;
        else
            local v385 = v13.jsonDecode(v383.detail);
            if v44() then
                local v386 = v382.SignalREventTable[v385.type];
                if v386 then
                    v386:Fire(v385);
                end;
            end;
            local l_SequenceNumber_0 = v385.SequenceNumber;
            v23:trace("SignalR message {}: {}", l_namespace_0, l_SequenceNumber_0);
            local v388 = v382:checkAndUpdateSequence(l_namespace_0, l_SequenceNumber_0);
            if v388 > 0 then
                v382.Analytics:reportReconnectDueToMissedSequence();
                return;
            else
                if v388 < -1 then
                    v382.Analytics:reportOutOfOrderSequence();
                end;
                return;
            end;
        end;
    end);
    v382.NotificationService.RobloxConnectionChanged:Connect(function(v389, v390, _, v392) --[[ Line: 1915 ]]
        -- upvalues: v23 (ref), v13 (ref), l_WATCHED_NAMESPACES_0 (ref), v382 (copy)
        if v389 == "signalR" then
            if v390 ~= Enum.ConnectionState.Connected then
                v23:info("SignalR disconnected");
                return;
            else
                for v393, v394 in pairs(v13.jsonDecode(v392)) do
                    if l_WATCHED_NAMESPACES_0[v393] then
                        v23:trace("SignalR message {}: {}", v393, v394);
                        local v395 = v382:checkAndUpdateSequence(v393, v394);
                        if v395 > 0 then
                            v382.Analytics:reportReconnectDueToMissedSequence();
                        elseif v395 < -1 then
                            v382.Analytics:reportOutOfOrderSequence();
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v92.getService = function(v396) --[[ Line: 1940 ]] --[[ Name: getService ]]
    return v396.service;
end;
v92.ToggleMic = function(v397, v398) --[[ Line: 1944 ]] --[[ Name: ToggleMic ]]
    -- upvalues: l_GetFFlagJoinWithoutMicPermissions_0 (copy), l_PERMISSION_STATE_0 (copy), v23 (copy), l_PermissionsProtocol_0 (copy), v50 (copy), l_Players_0 (copy)
    v397:ensureInitialized("toggle mic");
    if v397.localMuted == nil then
        return;
    else
        if l_GetFFlagJoinWithoutMicPermissions_0() then
            if v397.permissionState == l_PERMISSION_STATE_0.PENDING_MIC then
                v23:debug("In pending mic mode, requesting permission");
                v397:emit("GetPermissions", function(v399) --[[ Line: 1954 ]]
                    -- upvalues: v397 (copy), l_PERMISSION_STATE_0 (ref), v23 (ref), v398 (copy)
                    v397.permissionState = if v399.hasMicPermissions then l_PERMISSION_STATE_0.LISTEN_AND_TALK else l_PERMISSION_STATE_0.LISTEN_ONLY;
                    v23:debug("Got permissions, setting state to {}", v397.permissionState);
                    v397:ToggleMic(v398);
                end, {
                    l_PermissionsProtocol_0.Permissions.MICROPHONE_ACCESS
                }, false);
                return;
            elseif v397.permissionState == l_PERMISSION_STATE_0.LISTEN_ONLY then
                v23:debug("User tried to unmute despite being in listen only mode");
                v397:emit("OnPermissionRequested");
                return;
            end;
        end;
        if v50() then
            v397.localMuted = not v397.localMuted;
            local v400 = not v397.localMuted;
            v23:trace("Setting self mute to {}", v400);
            local l_v397_SendMuteEvent_0 = v397:GetSendMuteEvent();
            if l_v397_SendMuteEvent_0 then
                l_v397_SendMuteEvent_0:FireServer(v400);
                for v402 in v397.audioDevices do
                    if v402.Player and v402.Player == l_Players_0.LocalPlayer then
                        v402.Active = v400;
                    end;
                end;
                v397.muteChanged:Fire(v397.localMuted);
            else
                v23:error("Could not find SendMuteEvent");
            end;
        else
            local v403 = not v397.service:IsPublishPaused();
            v23:trace("Setting self mute to {}", v403);
            v397.service:PublishPause(v403);
            v397.localMuted = v403;
            v397.muteChanged:Fire(v403);
        end;
        if not v397.localMuted then
            v397.talkingChanged:Fire(v397.isTalking);
            v397:emit("OnShowDataConsentToast");
        end;
        if v398 then
            v397.Analytics:reportVoiceMuteSelf((v397:JoinWithVoiceMuteData({
                context = v398, 
                muted = v397.localMuted
            })));
        end;
        return;
    end;
end;
v92.JoinWithVoiceMuteData = function(v404, v405) --[[ Line: 2007 ]] --[[ Name: JoinWithVoiceMuteData ]]
    -- upvalues: l_Players_0 (copy), v18 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    return v18.Dictionary.join({
        userId = l_LocalPlayer_1.UserId, 
        clientSessionId = v404:GetSessionId(), 
        channelId = v404:GetChannelId()
    }, v405);
end;
v92._reportJoinFailed = function(v407, v408, v409) --[[ Line: 2016 ]] --[[ Name: _reportJoinFailed ]]
    -- upvalues: v43 (copy), v73 (copy)
    if v43() then
        v407.Analytics:reportVoiceChatJoinResult(false, v408, v409);
    end;
    if v73 then
        v407:emit("OnReportJoinFailed", v408);
    end;
end;
v92._asyncInit = function(v410) --[[ Line: 2025 ]] --[[ Name: _asyncInit ]]
    -- upvalues: v72 (copy), v70 (copy), v23 (copy), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (copy), v24 (copy), l_GetFFlagEnqueueVoiceClientJoinOperationLua_0 (copy), v15 (copy), v17 (copy), v26 (copy)
    if v72 then
        v410:CheckCallState();
    elseif not v70 then
        v410:CheckCallState();
    end;
    return v410:canUseServiceAsync():andThen(function(_) --[[ Line: 2033 ]]
        -- upvalues: v23 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v410 (copy), v24 (ref), l_GetFFlagEnqueueVoiceClientJoinOperationLua_0 (ref), v15 (ref), v17 (ref), v26 (ref)
        local v412 = "VoiceChatService";
        if game:GetEngineFeature("UseNewVoiceChatService") then
            v412 = "VoiceChatInternal";
            v23:debug("Using VoiceChatInternal");
        end;
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 2039 ]]
            -- upvalues: v412 (ref), l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 (ref), v410 (ref), v24 (ref)
            local l_game_Service_0 = game:GetService(v412);
            if l_game_Service_0 and (l_game_Service_0:GetVoiceChatApiVersion() < l_MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED_0 or l_game_Service_0:IsContextVoiceEnabled()) then
                v410.voiceEnabled = true;
                v410.service = l_game_Service_0;
                if v24 then
                    v410:SetupParticipantListeners();
                end;
            end;
        end);
        if l_GetFFlagEnqueueVoiceClientJoinOperationLua_0() then
            local l_VoiceChatService_2 = game:GetService("VoiceChatService");
            if l_VoiceChatService_2 then
                l_VoiceChatService_2:joinVoice();
                v23:debug("Starting Voice Chat Client Join Operation");
            end;
        end;
        if not l_status_6 then
            v23:warning("EnableVoiceChat flag is enabled but GetService panicked {}", l_result_6);
            v410:_reportJoinFailed("getServiceFailed", v15.ERROR);
            return v17.reject();
        elseif not v410.service then
            v23:debug("VoiceChatService is not set after init");
            v410:_reportJoinFailed("contextNotEnabled");
            return v17.reject();
        else
            v410:emit("OnVoiceChatServiceInitialized");
            v410:watchSignalR();
            return if v26 then v410:CheckAudioInputExists() else v17.resolve();
        end;
    end);
end;
v92.UpdateLocalMetering = function(v417) --[[ Line: 2082 ]] --[[ Name: UpdateLocalMetering ]]
    -- upvalues: l_Players_0 (copy)
    v417.isTalking = v417:IsSignalActive(l_Players_0.LocalPlayer.UserId);
    if v417.localMuted == false then
        v417.talkingChanged:Fire(v417.isTalking);
    end;
end;
v92.asyncInit = function(v418) --[[ Line: 2089 ]] --[[ Name: asyncInit ]]
    -- upvalues: v23 (copy), v17 (copy), v72 (copy), v70 (copy), v29 (copy), l_FFlagFixTopBarSlowLoad_0 (copy), l_HttpService_0 (copy), l_GetFFlagShowLikelySpeakingBubbles_0 (copy), v67 (copy), v64 (copy)
    if v418.service then
        v23:trace("Manager already initialized");
        return v17.resolve();
    else
        if not v418.initPromise then
            if v72 then
                v418.initPromise = v418:_asyncInit();
            elseif v70 then
                local v419 = {
                    v418.CheckCallStateWithPromise(), 
                    v418:_asyncInit()
                };
                v418.initPromise = v17.all(v419);
            end;
            if v29 then
                if l_FFlagFixTopBarSlowLoad_0 then
                    if not v418.LikelySpeakingUsersEvent then
                        task.spawn(function() --[[ Line: 2113 ]]
                            -- upvalues: v418 (copy), v23 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref)
                            local l_v418_LikelySpeakingUsersEvent_0 = v418:GetLikelySpeakingUsersEvent();
                            if l_v418_LikelySpeakingUsersEvent_0 then
                                v23:trace("Connecting to likely speaking users");
                                l_v418_LikelySpeakingUsersEvent_0.OnClientEvent:Connect(function(v421) --[[ Line: 2117 ]]
                                    -- upvalues: v23 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v418 (ref)
                                    v23:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v421));
                                    if l_GetFFlagShowLikelySpeakingBubbles_0() and v418:UserEligibleForLikelySpeakingBubbles() then
                                        v418:emit("OnLikelySpeakingUsersUpdated", v421);
                                    end;
                                end);
                            end;
                        end);
                    end;
                elseif not v418.LikelySpeakingUsersEvent then
                    local l_v418_LikelySpeakingUsersEvent_1 = v418:GetLikelySpeakingUsersEvent();
                    if l_v418_LikelySpeakingUsersEvent_1 then
                        v23:trace("Connecting to likely speaking users");
                        l_v418_LikelySpeakingUsersEvent_1.OnClientEvent:Connect(function(v423) --[[ Line: 2134 ]]
                            -- upvalues: v23 (ref), l_HttpService_0 (ref), l_GetFFlagShowLikelySpeakingBubbles_0 (ref), v418 (copy)
                            v23:trace("New Likely Speaking Users: {}", l_HttpService_0:JSONEncode(v423));
                            if l_GetFFlagShowLikelySpeakingBubbles_0() and v418:UserEligibleForLikelySpeakingBubbles() then
                                v418:emit("OnLikelySpeakingUsersUpdated", v423);
                            end;
                        end);
                    end;
                end;
            end;
            if v67 then
                if v64 then
                    v23:trace("Polling for likely speaking users");
                    task.spawn(function() --[[ Line: 2150 ]]
                        -- upvalues: v418 (copy)
                        v418:SendLikelySpeakingPing();
                    end);
                end;
            elseif v64 and v418:UserEligibleForLikelySpeakingBubbles() then
                v23:trace("Polling for likely speaking users");
                task.spawn(function() --[[ Line: 2158 ]]
                    -- upvalues: v418 (copy)
                    v418:SendLikelySpeakingPing();
                end);
            end;
            if not v72 and not v70 then
                v418.initPromise = v418:_asyncInit();
            end;
        end;
        return v418.initPromise;
    end;
end;
v92.GetLikelySpeakingUsersEvent = function(v424) --[[ Line: 2174 ]] --[[ Name: GetLikelySpeakingUsersEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v424.LikelySpeakingUsersEvent then
        v424.LikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("SendLikelySpeakingUsers", 3);
    end;
    return v424.LikelySpeakingUsersEvent;
end;
v92.GetReceiveLikelySpeakingEvent = function(v425) --[[ Line: 2182 ]] --[[ Name: GetReceiveLikelySpeakingEvent ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    if not v425.ReceiveLikelySpeakingUsersEvent then
        v425.ReceiveLikelySpeakingUsersEvent = l_RobloxReplicatedStorage_0:WaitForChild("ReceiveLikelySpeakingUsers", 3);
    end;
    return v425.ReceiveLikelySpeakingUsersEvent;
end;
v92.SendLikelySpeakingPing = function(v426) --[[ Line: 2190 ]] --[[ Name: SendLikelySpeakingPing ]]
    -- upvalues: v23 (copy)
    v426:FetchVoicePermissions();
    local l_v426_ReceiveLikelySpeakingEvent_0 = v426:GetReceiveLikelySpeakingEvent();
    if not l_v426_ReceiveLikelySpeakingEvent_0 or not v426:UserEligibleForLikelySpeakingBubbles() then
        v23:debug("Could not find likely speaking users event.");
        return;
    else
        v23:trace("Sending likely speaking user event");
        l_v426_ReceiveLikelySpeakingEvent_0:FireServer();
        return;
    end;
end;
v92.ensureInitialized = function(v428, v429) --[[ Line: 2201 ]] --[[ Name: ensureInitialized ]]
    if not v428.service then
        error("[corescripts VCS Manager] " .. "Attempting to " .. v429 .. " before calling init");
    end;
end;
v92.GetSessionId = function(v430) --[[ Line: 2208 ]] --[[ Name: GetSessionId ]]
    v430:ensureInitialized("get session id");
    return v430.service:GetSessionId();
end;
v92.GetChannelId = function(v431) --[[ Line: 2213 ]] --[[ Name: GetChannelId ]]
    v431:ensureInitialized("get channel id");
    return v431.service:GetChannelId();
end;
v92.Disconnect = function(v432) --[[ Line: 2218 ]] --[[ Name: Disconnect ]]
    -- upvalues: v36 (copy)
    if v432.participantConnection then
        v432.participantConnection:Disconnect();
        v432.participantConnection = nil;
    end;
    if v432.stateConnection then
        v432.stateConnection:Disconnect();
        v432.stateConnection = nil;
    end;
    if v432.micConnection then
        v432.micConnection:Disconnect();
        v432.micConnection = nil;
    end;
    if v432.blockConnection then
        v432.blockConnection:Disconnect();
        v432.blockConnection = nil;
    end;
    if v432.playerModeratedConnection then
        v432.playerModeratedConnection:Disconnect();
        v432.playerModeratedConnection = nil;
    end;
    if v432.voiceToxicityModalConnection then
        v432.voiceToxicityModalConnection:Disconnect();
        v432.voiceToxicityModalConnection = nil;
    end;
    if v432.VoiceToxicityToastConnection then
        v432.VoiceToxicityToastConnection:Disconnect();
        v432.VoiceToxicityToastConnection = nil;
    end;
    if v432.voiceReverseNudgeConnection then
        v432.voiceReverseNudgeConnection:Disconnect();
        v432.voiceReverseNudgeConnection = nil;
    end;
    if v36 and v432.tempSetMicMutedToggleMicConnection then
        v432.tempSetMicMutedToggleMicConnection:Disconnect();
        v432.tempSetMicMutedToggleMicConnection = nil;
    end;
end;
v92.default = v92.new(v22:GetAfterBlockedStatusChangedEvent(), l_PermissionsProtocol_0.default, l_HttpRbxApiService_0);
return v92;