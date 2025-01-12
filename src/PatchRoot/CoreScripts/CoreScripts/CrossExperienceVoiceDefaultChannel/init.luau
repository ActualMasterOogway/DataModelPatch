local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Packages.Promise);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_PlayerAudioFocusChanged_0 = l_ReplicatedStorage_0:WaitForChild("PlayerAudioFocusChanged");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v10 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local v11 = require(l_CorePackages_0.Packages.Rodux);
local v12 = require(l_CorePackages_0.Workspace.Packages.CrossExperience);
local l_default_0 = v10.CoreVoiceManager.default;
local l_createPersistenceMiddleware_0 = v12.Middlewares.createPersistenceMiddleware;
local l_Modules_0 = l_RobloxGui_0.Modules;
local v16 = require(l_Modules_0.BlockingUtility);
local v17 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagPartyVoiceBlockSync_0 = v17.FFlagPartyVoiceBlockSync;
local l_GetFFlagVoiceChatClientRewriteMasterLua_0 = v17.GetFFlagVoiceChatClientRewriteMasterLua;
local l_FFlagCevAnalytics_0 = v17.FFlagCevAnalytics;
local v21 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v22 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v23 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local v24 = game:DefineFastFlag("DefaultChannelDontWaitOnCharacterWithAudioApi", false);
local v25 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false);
local v26 = require(v10.Flags.GetFFlagEnableLuaVoiceChatAnalytics);
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("AudioFocusManagement");
local v30 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v31 = v10.Analytics.new();
local l_observeCurrentContextId_0 = v12.Utils.observeCurrentContextId;
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_Constants_0 = v12.Constants;
local l_VOICE_STATUS_0 = l_Constants_0.VOICE_STATUS;
local v36 = l_createPersistenceMiddleware_0({
    storeKey = v12.Constants.STORAGE_CEV_STORE_KEY
});
local l_default_1 = v12.PartyAudioPlayer.default;
local function v38() --[[ Line: 57 ]]
    -- upvalues: v11 (copy), v12 (copy)
    return v11.combineReducers({
        Squad = v11.combineReducers({
            CrossExperienceVoice = v12.installReducer()
        })
    });
end;
local v39 = {
    previousGroupId = nil, 
    previousMutedState = false
};
local v40 = v12.EventManager.new(v12.Constants.EXPERIENCE_TYPE_VOICE, true);
local function _(v41, v42) --[[ Line: 72 ]] --[[ Name: notifyVoiceStatusChange ]]
    -- upvalues: v40 (copy), v12 (copy)
    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = v41, 
        detail = v42
    });
end;
local v44 = v11.Store.new(v38(), nil, {
    v11.thunkMiddleware, 
    v36.getMiddleware()
});
v40:subscribe(v44);
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
local l_RCC_CONNECTED_0 = l_Constants_0.VOICE_STATUS.RCC_CONNECTED;
v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
    status = l_RCC_CONNECTED_0, 
    detail = nil
});
v40:notify(v12.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
    jobId = if not (game.JobId ~= "") or game.JobId == nil then l_HttpService_0:GenerateGUID(true) else game.JobId, 
    placeId = game.PlaceId, 
    gameId = game.GameId
});
l_RCC_CONNECTED_0 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or -1;
l_observeCurrentContextId_0(function(v46) --[[ Line: 102 ]]
    -- upvalues: l_PlayerAudioFocusChanged_0 (copy)
    l_PlayerAudioFocusChanged_0:FireServer(v46);
end);
l_PlayerAudioFocusChanged_0.OnClientEvent:Connect(function(v47, v48, v49) --[[ Line: 106 ]]
    -- upvalues: v40 (copy), v12 (copy)
    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
        userId = v47, 
        contextId = v48, 
        contextIds = v49
    });
end);
local function _(v50) --[[ Line: 114 ]]
    -- upvalues: v40 (copy), v12 (copy), l_RCC_CONNECTED_0 (copy)
    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
        userId = v50.UserId, 
        isLocalUser = v50.UserId == l_RCC_CONNECTED_0, 
        username = v50.Name, 
        displayname = v50.DisplayName
    });
end;
local function v53(v52) --[[ Line: 123 ]]
    -- upvalues: v40 (copy), v12 (copy), l_RCC_CONNECTED_0 (copy), l_default_1 (copy)
    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, {
        userId = v52.UserId, 
        isLocalUser = v52.UserId == l_RCC_CONNECTED_0
    });
    l_default_1:playSound("leave");
end;
local function v56(v54) --[[ Line: 131 ]]
    -- upvalues: v12 (copy), v40 (copy), l_RCC_CONNECTED_0 (copy)
    local v55 = if v54.isActive then v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
    v40:notify(v55, {
        userId = l_RCC_CONNECTED_0, 
        isLocalUser = true
    });
end;
local function v59(v57) --[[ Line: 141 ]]
    -- upvalues: v39 (ref), v12 (copy), v40 (copy), l_RCC_CONNECTED_0 (copy)
    v39.previousMutedState = v57;
    local v58 = if v57 then v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
    v40:notify(v58, {
        userId = l_RCC_CONNECTED_0, 
        isLocalUser = true
    });
end;
local function v68(v60) --[[ Line: 152 ]]
    -- upvalues: v12 (copy), l_RCC_CONNECTED_0 (copy), v40 (copy)
    for v61, v62 in pairs(v60) do
        local l_isSignalActive_0 = v62.isSignalActive;
        local l_isMuted_0 = v62.isMuted;
        local v65 = if l_isSignalActive_0 then v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE;
        local v66 = if l_isMuted_0 then v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED;
        local v67 = {
            userId = v61, 
            isLocalUser = v61 == l_RCC_CONNECTED_0
        };
        v40:notify(v66, v67);
        v40:notify(v65, v67);
    end;
end;
local function v71(v69) --[[ Line: 174 ]]
    -- upvalues: l_RCC_CONNECTED_0 (copy), l_default_0 (copy)
    local v70 = tonumber(v69.userId);
    if l_RCC_CONNECTED_0 == v70 then
        l_default_0:ToggleMic("Squads");
        return;
    else
        l_default_0:ToggleMutePlayer(v70);
        return;
    end;
end;
handleParticipants = function() --[[ Line: 184 ]] --[[ Name: handleParticipants ]]
    -- upvalues: l_Players_0 (copy), v40 (copy), v12 (copy), l_RCC_CONNECTED_0 (copy), l_default_1 (copy), v53 (copy)
    l_Players_0.PlayerAdded:Connect(function(v72) --[[ Line: 185 ]]
        -- upvalues: v40 (ref), v12 (ref), l_RCC_CONNECTED_0 (ref), l_default_1 (ref)
        v40:notify(v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
            userId = v72.UserId, 
            isLocalUser = v72.UserId == l_RCC_CONNECTED_0, 
            username = v72.Name, 
            displayname = v72.DisplayName
        });
        l_default_1:playSound("join");
    end);
    l_Players_0.PlayerRemoving:Connect(v53);
    for _, v74 in pairs(l_Players_0:GetPlayers()) do
        if v74:IsA("Player") then
            v40:notify(v12.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
                userId = v74.UserId, 
                isLocalUser = v74.UserId == l_RCC_CONNECTED_0, 
                username = v74.Name, 
                displayname = v74.DisplayName
            });
            if v74.UserId == l_RCC_CONNECTED_0 then
                l_default_1:playSound("join");
            end;
        end;
    end;
end;
handleMicrophone = function() --[[ Line: 201 ]] --[[ Name: handleMicrophone ]]
    -- upvalues: l_default_0 (copy), v59 (copy), v40 (copy), v12 (copy), v71 (copy)
    l_default_0.muteChanged.Event:Connect(v59);
    v40:addObserver(v12.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, v71);
    v40:addObserver(v12.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, v71);
end;
local function v78(v75) --[[ Line: 207 ]]
    -- upvalues: l_Players_0 (copy), v16 (copy), v30 (copy)
    local v76 = tonumber(v75.userId) or 0;
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v76);
    if l_l_Players_0_PlayerByUserId_0 then
        coroutine.wrap(function() --[[ Line: 211 ]]
            -- upvalues: v16 (ref), l_l_Players_0_PlayerByUserId_0 (copy), v30 (ref)
            if v16:AddPlayerToBlockList(l_l_Players_0_PlayerByUserId_0) then
                v30:info("Participant {} was blocked from party voice", l_l_Players_0_PlayerByUserId_0.DisplayName);
            end;
        end)();
    end;
end;
local function v82(v79) --[[ Line: 220 ]]
    -- upvalues: l_Players_0 (copy), v16 (copy), v30 (copy)
    local v80 = tonumber(v79.userId) or 0;
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v80);
    if l_l_Players_0_PlayerByUserId_1 then
        coroutine.wrap(function() --[[ Line: 224 ]]
            -- upvalues: v16 (ref), l_l_Players_0_PlayerByUserId_1 (copy), v30 (ref)
            if v16:RemovePlayerFromBlockList(l_l_Players_0_PlayerByUserId_1) then
                v30:info("Participant {} was unblocked from party voice", l_l_Players_0_PlayerByUserId_1.DisplayName);
            end;
        end)();
    end;
end;
local function _() --[[ Line: 233 ]] --[[ Name: initializeParticipantBlockListener ]]
    -- upvalues: v40 (copy), v12 (copy), v78 (copy), v82 (copy)
    v40:addObserver(v12.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v78);
    v40:addObserver(v12.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v82);
end;
onCoreVoiceManagerInitialized = function() --[[ Line: 244 ]] --[[ Name: onCoreVoiceManagerInitialized ]]
    -- upvalues: l_default_0 (copy), v56 (copy), v68 (copy)
    l_default_0:getService().PlayerMicActivitySignalChange:Connect(v56);
    l_default_0.participantsUpdate.Event:Connect(v68);
end;
local function _() --[[ Line: 254 ]] --[[ Name: unmuteMicrophoneOnce ]]
    -- upvalues: l_default_0 (copy)
    l_default_0.muteChanged.Event:Once(function(v84) --[[ Line: 255 ]]
        -- upvalues: l_default_0 (ref)
        if v84 ~= nil then
            l_default_0:ToggleMic("BackgroundDM");
        end;
    end);
end;
local function v89(v86) --[[ Line: 262 ]] --[[ Name: initializeDefaultChannel ]]
    -- upvalues: l_default_0 (copy), v30 (copy), v26 (copy), v31 (copy)
    local v87 = l_default_0:getService();
    if not v87 then
        return nil;
    else
        v30:info("Joining default channel");
        local v88 = v87:JoinByGroupIdToken("default", v86);
        if v26() then
            if v88 then
                v31:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v88;
            else
                v31:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            end;
        end;
        return v88;
    end;
end;
local function v93() --[[ Line: 284 ]] --[[ Name: validateSetup ]]
    -- upvalues: l_game_EngineFeature_1 (copy), v21 (copy), l_NotificationService_0 (copy), v30 (copy), v24 (copy), l_VoiceChatService_0 (copy), l_Players_0 (copy), l_game_EngineFeature_0 (copy), v22 (copy), v23 (copy), v26 (copy), v31 (copy), l_Constants_0 (copy), v40 (copy), v12 (copy)
    if l_game_EngineFeature_1 and v21 then
        if not l_NotificationService_0.IsConnected then
            v30:debug("NotificationService is not yet connected");
            l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
        end;
        v30:debug("NotificationService connected");
    end;
    if not v24 or not l_VoiceChatService_0.UseNewAudioApi then
        if not l_Players_0.LocalPlayer.Character then
            l_Players_0.LocalPlayer.CharacterAdded:Wait();
            v30:debug("Player character loaded");
        else
            v30:debug("Player character already loaded");
        end;
    end;
    if l_game_EngineFeature_0 and v22 then
        local l_game_Service_0 = game:FindService("VoiceChatService");
        if v23 then
            if not l_game_Service_0 then
                v30:info("VoiceChatService not found. Assuming default values.");
            elseif not l_game_Service_0.EnableDefaultVoice and not l_game_Service_0.UseNewAudioApi then
                v30:debug("Default channel is disabled.");
                if v26() then
                    v31:reportVoiceChatJoinResult(false, "defaultDisabled");
                    local l_ERROR_VOICE_SETUP_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                        status = l_ERROR_VOICE_SETUP_0, 
                        detail = "Default channel disabled"
                    });
                end;
                return false;
            end;
        elseif not l_game_Service_0 then
            v30:info("VoiceChatService not found. Assuming default values.");
        elseif not l_game_Service_0.EnableDefaultVoice then
            v30:debug("Default channel is disabled.");
            if v26() then
                v31:reportVoiceChatJoinResult(false, "defaultDisabled");
                local l_ERROR_VOICE_SETUP_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_SETUP;
                v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_SETUP_1, 
                    detail = "Default channel disabled"
                });
            end;
            return false;
        end;
    end;
    return true;
end;
local function v97() --[[ Line: 332 ]] --[[ Name: getPlayerUsersIds ]]
    -- upvalues: l_Players_0 (copy)
    local v94 = {};
    for _, v96 in ipairs(l_Players_0:GetPlayers()) do
        table.insert(v94, v96.UserId);
    end;
    return table.concat(v94, ", ");
end;
local function v115() --[[ Line: 340 ]] --[[ Name: setupListeners ]]
    -- upvalues: l_default_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), v40 (copy), v12 (copy), v78 (copy), v82 (copy), v25 (copy), l_HttpService_0 (copy), v44 (copy), l_Constants_0 (copy), l_FFlagCevAnalytics_0 (copy), v97 (copy), l_RCC_CONNECTED_0 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), v39 (ref), v30 (copy)
    l_default_0:subscribe("GetPermissions", function(v98, _) --[[ Line: 341 ]]
        v98({
            hasMicPermissions = true
        });
    end);
    handleParticipants();
    handleMicrophone();
    if l_FFlagPartyVoiceBlockSync_0 then
        v40:addObserver(v12.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v78);
        v40:addObserver(v12.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v82);
    end;
    l_default_0.muteChanged.Event:Once(function(v100) --[[ Line: 255 ]]
        -- upvalues: l_default_0 (ref)
        if v100 ~= nil then
            l_default_0:ToggleMic("BackgroundDM");
        end;
    end);
    if v25 then
        v40:addObserver(v12.Constants.EVENTS.DEBUG_COMMAND, function(v101) --[[ Line: 359 ]]
            -- upvalues: l_HttpService_0 (ref), v44 (ref), l_default_0 (ref)
            if v101.name == "dump_session" then
                print("----------- CEV BACKGROUND -----------");
                print("Store State", l_HttpService_0:JSONEncode(v44:getState()));
                print("--------------------------------------");
                print("CoreVoiceManager State:");
                print("Participants", l_HttpService_0:JSONEncode(l_default_0.participants));
                print("Local Muted", l_HttpService_0:JSONEncode({
                    value = l_default_0.localMuted
                }));
                print("Mute All", l_HttpService_0:JSONEncode({
                    value = l_default_0.muteAll
                }));
                print("Muted Anyone", l_HttpService_0:JSONEncode({
                    value = l_default_0._mutedAnyone
                }));
                print("Is Talking", l_HttpService_0:JSONEncode({
                    value = l_default_0.isTalking
                }));
                print("Muted Players", l_HttpService_0:JSONEncode(l_default_0.mutedPlayers));
                for v102 in l_default_0.audioDevices do
                    if v102.Player then
                        print("Audio Device ", v102.Player.UserId, " Active:", v102.Active, " MutedByLocalPlayer:", v102.MutedByLocalUser);
                    end;
                end;
                print("Voice Enabled", l_HttpService_0:JSONEncode({
                    value = l_default_0.voiceEnabled
                }));
                print("Permissions Result", l_HttpService_0:JSONEncode(l_default_0.communicationPermissionsResult));
                print("Voice Join Progress", l_HttpService_0:JSONEncode({
                    value = l_default_0.VoiceJoinProgress
                }));
                print("-----------------------------");
            end;
        end);
    end;
    l_default_0:subscribe("OnRequestMicPermissionRejected", function() --[[ Line: 384 ]]
        -- upvalues: l_Constants_0 (ref), v40 (ref), v12 (ref)
        local l_ERROR_VOICE_MIC_REJECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED;
        v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_MIC_REJECTED_0, 
            detail = nil
        });
    end);
    l_default_0:subscribe("OnPlayerModerated", function() --[[ Line: 388 ]]
        -- upvalues: l_Constants_0 (ref), v40 (ref), v12 (ref)
        local l_ERROR_VOICE_MODERATED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_MODERATED;
        v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_MODERATED_0, 
            detail = "On Player Moderated"
        });
    end);
    l_default_0:subscribe("OnInitialJoinFailed", function() --[[ Line: 392 ]]
        -- upvalues: l_Constants_0 (ref), v40 (ref), v12 (ref)
        local l_ERROR_VOICE_JOIN_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
        v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_JOIN_0, 
            detail = "Initial Join failed"
        });
    end);
    l_default_0:subscribe("OnRetryRequested", function() --[[ Line: 396 ]]
        -- upvalues: l_Constants_0 (ref), v40 (ref), v12 (ref)
        local l_VOICE_CONNECTING_0 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
        v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_VOICE_CONNECTING_0, 
            detail = "Retry requested"
        });
    end);
    l_default_0:subscribe("OnStateChanged", function(_, v108) --[[ Line: 400 ]]
        -- upvalues: l_default_0 (ref), l_FFlagCevAnalytics_0 (ref), v97 (ref), v40 (ref), v12 (ref), l_RCC_CONNECTED_0 (ref), l_Constants_0 (ref), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref), v39 (ref)
        if v108 == Enum.VoiceChatState.Joined then
            local l_l_default_0_ChannelId_0 = l_default_0:GetChannelId();
            local l_l_default_0_SessionId_0 = l_default_0:GetSessionId();
            if l_FFlagCevAnalytics_0 then
                local v111 = v97();
                v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    userId = l_RCC_CONNECTED_0, 
                    status = l_Constants_0.VOICE_STATUS.VOICE_CONNECTED, 
                    voiceChannelId = l_l_default_0_ChannelId_0, 
                    voiceSessionId = l_l_default_0_SessionId_0, 
                    voicePlaySessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                    participants = v111, 
                    numberActive = #l_Players_0:GetPlayers()
                });
            else
                v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_Constants_0.VOICE_STATUS.VOICE_CONNECTED, 
                    voiceChannelId = l_l_default_0_ChannelId_0, 
                    voiceSessionId = l_l_default_0_SessionId_0
                });
            end;
            v39.previousGroupId = l_default_0.service:GetGroupId();
            return;
        elseif v108 == Enum.VoiceChatState.Failed then
            local l_ERROR_VOICE_FAILED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_FAILED;
            v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_FAILED_0, 
                detail = nil
            });
            return;
        else
            if v108 == Enum.VoiceChatState.Ended then
                local l_ERROR_VOICE_DISCONNECTED_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_DISCONNECTED;
                v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                    status = l_ERROR_VOICE_DISCONNECTED_0, 
                    detail = nil
                });
            end;
            return;
        end;
    end);
    l_default_0:subscribe("OnReportJoinFailed", function(v114) --[[ Line: 438 ]]
        -- upvalues: v30 (ref)
        v30:error("CEV OnReportJoinFailed " .. v114);
    end);
end;
initializeAFM = function() --[[ Line: 443 ]] --[[ Name: initializeAFM ]]
    -- upvalues: l_game_EngineFeature_2 (copy), v12 (copy), l_default_0 (copy), v30 (copy), v6 (copy)
    if l_game_EngineFeature_2 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 445 ]]
            return game:GetService("AudioFocusService");
        end);
        if l_status_0 and l_result_0 then
            local l_CONTEXT_ID_0 = v12.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
            local l_FOCUS_PRIORITY_0 = v12.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY;
            l_result_0:RegisterContextIdFromLua(l_CONTEXT_ID_0);
            local function _() --[[ Line: 453 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:MuteAll(true, "AudioFocusManagement CEV");
                if not l_default_0.localMuted then
                    l_default_0:ToggleMic();
                end;
            end;
            local function _() --[[ Line: 460 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:MuteAll(false, "AudioFocusManagement CEV");
                if l_default_0.localMuted then
                    l_default_0:ToggleMic();
                end;
            end;
            l_result_0.OnDeafenVoiceAudio:Connect(function(v122) --[[ Line: 467 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), v30 (ref), l_default_0 (ref)
                if v122 == l_CONTEXT_ID_0 then
                    v30:info("CEV OnDeafenVoiceAudio fired" .. v122);
                    l_default_0:MuteAll(true, "AudioFocusManagement CEV");
                    if not l_default_0.localMuted then
                        l_default_0:ToggleMic();
                    end;
                end;
            end);
            l_result_0.OnUndeafenVoiceAudio:Connect(function(v123) --[[ Line: 474 ]]
                -- upvalues: l_CONTEXT_ID_0 (copy), v30 (ref), l_default_0 (ref)
                if v123 == l_CONTEXT_ID_0 then
                    v30:info("CEV OnUndeafenVoiceAudio fired" .. v123);
                    l_default_0:MuteAll(false, "AudioFocusManagement CEV");
                    if l_default_0.localMuted then
                        l_default_0:ToggleMic();
                    end;
                end;
            end);
            local function _(v124, v125) --[[ Line: 481 ]]
                -- upvalues: v6 (ref), l_result_0 (copy)
                return v6.new(function(v126, v127) --[[ Line: 482 ]]
                    -- upvalues: l_result_0 (ref), v124 (copy), v125 (copy)
                    local l_status_1, l_result_1 = pcall(l_result_0.RequestFocus, l_result_0, v124, v125);
                    if l_status_1 then
                        v126(l_result_1);
                        return;
                    else
                        v127("Failed to call RequestFocus due to an error");
                        return;
                    end;
                end);
            end;
            v6.new(function(v131, v132) --[[ Line: 482 ]]
                -- upvalues: l_result_0 (copy), l_CONTEXT_ID_0 (copy), l_FOCUS_PRIORITY_0 (copy)
                local l_status_2, l_result_2 = pcall(l_result_0.RequestFocus, l_result_0, l_CONTEXT_ID_0, l_FOCUS_PRIORITY_0);
                if l_status_2 then
                    v131(l_result_2);
                    return;
                else
                    v132("Failed to call RequestFocus due to an error");
                    return;
                end;
            end):andThen(function(v135) --[[ Line: 494 ]]
                -- upvalues: v30 (ref), l_default_0 (ref)
                if v135 then
                    v30:info("CEV audio focus request granted, preparing to undeafen.");
                    l_default_0.muteChanged.Event:Once(function(v136) --[[ Line: 497 ]]
                        -- upvalues: l_default_0 (ref)
                        if v136 ~= nil then
                            l_default_0:MuteAll(false, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                else
                    v30:info("CEV audio focus request denied, preparing to deafen.");
                    l_default_0.muteChanged.Event:Once(function(v137) --[[ Line: 504 ]]
                        -- upvalues: l_default_0 (ref)
                        if v137 ~= nil then
                            l_default_0:MuteAll(true, "AudioFocusManagement CEV");
                        end;
                    end);
                    return;
                end;
            end):catch(function() --[[ Line: 511 ]]
                -- upvalues: v30 (ref)
                v30:info("[CEV] Error requesting focus inside CEV");
            end);
            return;
        else
            v30:info("AudioFocusService did not initialize");
        end;
    end;
end;
initializeVoice = function() --[[ Line: 520 ]] --[[ Name: initializeVoice ]]
    -- upvalues: l_Constants_0 (copy), v40 (copy), v12 (copy), l_default_0 (copy), v89 (copy), v30 (copy)
    local l_VOICE_CONNECTING_1 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_1, 
        detail = nil
    });
    l_default_0:asyncInit():andThen(function() --[[ Line: 523 ]]
        -- upvalues: v89 (ref), l_Constants_0 (ref), v40 (ref), v12 (ref)
        if v89(false) == false then
            local l_ERROR_VOICE_JOIN_1 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_JOIN;
            v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
                status = l_ERROR_VOICE_JOIN_1, 
                detail = "Initial Join failed"
            });
        else
            onCoreVoiceManagerInitialized();
        end;
        initializeAFM();
    end):catch(function(v140) --[[ Line: 532 ]]
        -- upvalues: v30 (ref), l_Constants_0 (ref), v40 (ref), v12 (ref)
        v30:info("CoreVoiceManager did not initialize {}", v140);
        local l_ERROR_VOICE_INIT_0 = l_Constants_0.VOICE_STATUS.ERROR_VOICE_INIT;
        v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
            status = l_ERROR_VOICE_INIT_0, 
            detail = v140
        });
    end);
end;
rejoinVoice = function() --[[ Line: 541 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_Constants_0 (copy), v40 (copy), v12 (copy), l_GetFFlagVoiceChatClientRewriteMasterLua_0 (copy), l_default_0 (copy), v39 (ref)
    local l_VOICE_CONNECTING_2 = l_Constants_0.VOICE_STATUS.VOICE_CONNECTING;
    v40:notify(v12.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
        status = l_VOICE_CONNECTING_2, 
        detail = nil
    });
    if l_GetFFlagVoiceChatClientRewriteMasterLua_0() then
        l_default_0:RejoinVoice();
    else
        l_default_0:RejoinChannel(v39.previousGroupId, v39.previousMutedState);
    end;
    v39 = {
        previousGroupId = nil, 
        previousMutedState = nil
    };
end;
startVoice = function() --[[ Line: 554 ]] --[[ Name: startVoice ]]
    -- upvalues: v93 (copy), v115 (copy)
    if v93() then
        v115();
        initializeVoice();
    end;
end;
v40:addObserver(v12.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function() --[[ Line: 561 ]]
    -- upvalues: v44 (copy), l_VOICE_STATUS_0 (copy)
    local l_voiceStatus_0 = v44:getState().Squad.CrossExperienceVoice.Experience.voiceStatus;
    if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_SETUP then
        startVoice();
        return;
    elseif l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_INIT then
        initializeVoice();
        return;
    else
        if l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_JOIN or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_MODERATED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_FAILED or l_voiceStatus_0 == l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED then
            rejoinVoice();
        end;
        return;
    end;
end);
startVoice();