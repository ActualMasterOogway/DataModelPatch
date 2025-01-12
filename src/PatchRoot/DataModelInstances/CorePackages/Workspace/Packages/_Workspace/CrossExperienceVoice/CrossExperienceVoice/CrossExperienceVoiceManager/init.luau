local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v4.Promise;
local l_CrossExperience_0 = v4.CrossExperience;
local l_Communication_0 = l_CrossExperience_0.Communication;
local l_SharedFlags_0 = v4.SharedFlags;
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = require(l_script_FirstAncestor_0.CrossExperienceVoiceAnalytics);
local v11 = require(l_script_FirstAncestor_0.Logger);
local l_createPersistenceMiddleware_0 = l_CrossExperience_0.Middlewares.createPersistenceMiddleware;
local v13 = {};
v13.__index = v13;
local l_getFFlagJoinCrossExpVoiceWithPartyId_0 = l_SharedFlags_0.getFFlagJoinCrossExpVoiceWithPartyId;
local l_FFlagCevAnalytics_0 = l_SharedFlags_0.FFlagCevAnalytics;
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceMemoryCheck;
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local l_BACKGROUND_DM_STATUS_0 = l_CrossExperience_0.Constants.BACKGROUND_DM_STATUS;
local l_AUDIO_FOCUS_MANAGEMENT_0 = l_CrossExperience_0.Constants.AUDIO_FOCUS_MANAGEMENT;
local v20 = l_createPersistenceMiddleware_0({
    storeKey = l_CrossExperience_0.Constants.STORAGE_CEV_STORE_KEY
});
local v21 = game:DefineFastString("CrossExpVoicePlaceId", (tostring(v9.DEFAULT_EXPERIENCE_PLACE_ID)));
local function v22() --[[ Line: 41 ]]

end;
local function _() --[[ Line: 96 ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if game.PlaceId == 0 then
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP;
    else
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
    end;
end;
v13.new = function() --[[ Line: 102 ]] --[[ Name: new ]]
    -- upvalues: l_CrossExperience_0 (copy), l_FFlagCevAnalytics_0 (copy), v10 (copy), v13 (copy)
    local v24 = {
        connections = {}, 
        isInitialized = false, 
        isConnected = false, 
        shouldIgnoreMemoryWarning = false, 
        hasExperienceStarted = false, 
        ExperienceJoined = Instance.new("BindableEvent"), 
        ExperienceJoinFailed = Instance.new("BindableEvent"), 
        ExperienceLeft = Instance.new("BindableEvent"), 
        JoinFeasibilityCheckPerformed = Instance.new("BindableEvent"), 
        JoinRequested = Instance.new("BindableEvent"), 
        JoinRequestSubmitted = Instance.new("BindableEvent"), 
        MemoryLow = Instance.new("BindableEvent"), 
        cevEventManager = l_CrossExperience_0.EventManager.new(if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC, false), 
        voiceAnalytics = if l_FFlagCevAnalytics_0 then v10.default else nil
    };
    setmetatable(v24, v13);
    return v24;
end;
v13.initialize = function(v25) --[[ Line: 123 ]] --[[ Name: initialize ]]
    -- upvalues: l_FFlagCevAnalytics_0 (copy), l_ExperienceService_0 (copy), l_CrossExperience_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_NotificationService_0 (copy)
    if l_FFlagCevAnalytics_0 then
        v25.voiceAnalytics:initialize(v25.cevEventManager);
    end;
    table.insert(v25.connections, l_ExperienceService_0.OnCrossExperienceStarted:Connect(function(_, _) --[[ Line: 130 ]]
        -- upvalues: v25 (copy), l_CrossExperience_0 (ref), l_FFlagCevAnalytics_0 (ref), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref)
        v25.hasExperienceStarted = true;
        v25.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(v28) --[[ Line: 134 ]]
            -- upvalues: l_FFlagCevAnalytics_0 (ref), l_CrossExperience_0 (ref), v25 (ref)
            if l_FFlagCevAnalytics_0 then
                if v28.status == l_CrossExperience_0.Constants.VOICE_STATUS.VOICE_CONNECTED then
                    v25.voiceAnalytics:logPartyVoiceConnectedState(v28, v25.currentPartyId);
                end;
                v25.voiceAnalytics:logPartyVoiceStatusChanged(v28, v25.currentPartyId);
            end;
            if v28.status == l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED then
                v25:leave();
            end;
        end);
        v25.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function() --[[ Line: 148 ]]
            -- upvalues: v25 (ref)
            v25.ExperienceJoinFailed:Fire();
        end);
        if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
            v25.cevEventManager:addObserver(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_MEMORY_LOW, function() --[[ Line: 152 ]]
                -- upvalues: v25 (ref)
                v25:ignoreMemoryWarning();
                if not v25.shouldIgnoreMemoryWarning then
                    v25.MemoryLow:Fire();
                    v25.shouldIgnoreMemoryWarning = true;
                end;
            end);
        end;
        v25.ExperienceJoined:Fire();
    end));
    table.insert(v25.connections, l_ExperienceService_0.OnCrossExperienceStopped:Connect(function(_, _) --[[ Line: 166 ]]
        -- upvalues: v25 (copy)
        v25:disconnect();
        v25.ExperienceLeft:Fire();
    end));
    table.insert(v25.connections, l_NotificationService_0.RobloxEventReceived:Connect(function(v31) --[[ Line: 177 ]]
        -- upvalues: v25 (copy)
        if v31.detailType == "SignOut" then
            v25:onUserLogout();
        end;
    end));
    v25.isInitialized = true;
end;
v13.onUserLogout = function(v32) --[[ Line: 186 ]] --[[ Name: onUserLogout ]]
    if v32.hasExperienceStarted then
        v32:leave();
    end;
    if v32.isConnected then
        v32:disconnect();
        v32.ExperienceLeft:Fire();
    end;
end;
v13.getIsConnected = function(v33) --[[ Line: 196 ]] --[[ Name: getIsConnected ]]
    return v33.isConnected;
end;
v13.setAsConnected = function(v34) --[[ Line: 200 ]] --[[ Name: setAsConnected ]]
    if not v34.isInitialized then
        v34:initialize();
    end;
    v34.isConnected = true;
    v34.hasExperienceStarted = true;
    v34.ExperienceJoined:Fire();
end;
v13.getIsBackgroundDMActive = function(_) --[[ Line: 209 ]] --[[ Name: getIsBackgroundDMActive ]]
    -- upvalues: l_Promise_0 (copy), l_Communication_0 (copy), l_CrossExperience_0 (copy), l_BACKGROUND_DM_STATUS_0 (copy)
    return l_Promise_0.new(function(v36, v37) --[[ Line: 210 ]]
        -- upvalues: l_Communication_0 (ref), l_CrossExperience_0 (ref), l_BACKGROUND_DM_STATUS_0 (ref)
        l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_GET_BACKGROUND_DM_STATE, {}, function(v38) --[[ Line: 214 ]]
            -- upvalues: v36 (copy), l_BACKGROUND_DM_STATUS_0 (ref)
            local l_v36_0 = v36;
            local v40 = true;
            if v38.status ~= l_BACKGROUND_DM_STATUS_0.ACTIVE then
                v40 = v38.status == l_BACKGROUND_DM_STATUS_0.BACKGROUND;
            end;
            l_v36_0(v40);
        end, function() --[[ Line: 217 ]]
            -- upvalues: v37 (copy)
            v37();
        end);
    end);
end;
v13.performJoinFeasibilityCheck = function(v41) --[[ Line: 225 ]] --[[ Name: performJoinFeasibilityCheck ]]
    -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_CrossExperience_0 (copy), v11 (copy)
    if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
        return true;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 229 ]]
            return game:GetService("PerformanceControlService");
        end);
        if not l_status_0 or not l_result_0 then
            v41.JoinFeasibilityCheckPerformed:Fire(false);
            return false;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 238 ]]
                -- upvalues: l_result_0 (copy), l_CrossExperience_0 (ref)
                return l_result_0:IsCrossExperienceLaunchFeasible(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE);
            end);
            if not l_status_1 then
                v11:warn("performJoinFeasibilityCheck() - failed to check feasibility", l_result_1);
                v41.JoinFeasibilityCheckPerformed:Fire(false);
                return false;
            else
                v41.JoinFeasibilityCheckPerformed:Fire(l_result_1);
                return l_result_1;
            end;
        end;
    end;
end;
v13.ignoreMemoryWarning = function(_) --[[ Line: 254 ]] --[[ Name: ignoreMemoryWarning ]]
    -- upvalues: l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_Communication_0 (copy), l_CrossExperience_0 (copy), v22 (copy)
    if not l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
        return;
    else
        l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY, {}, v22, v22);
        return;
    end;
end;
v13.join = function(v47, v48) --[[ Line: 267 ]] --[[ Name: join ]]
    -- upvalues: v21 (copy), l_FFlagCevAnalytics_0 (copy), l_Players_0 (copy), l_getFFlagJoinCrossExpVoiceWithPartyId_0 (copy), v11 (copy), l_ExperienceService_0 (copy), l_CrossExperience_0 (copy)
    if v48.shouldIgnoreMemoryWarning then
        v47.shouldIgnoreMemoryWarning = true;
    end;
    if not v47.isInitialized then
        v47:initialize();
    end;
    local v49 = tonumber(v21);
    if v47.isConnected and not v48.force then
        print("CrossExperienceVoiceManager:join() - already connected, returning early.");
        v47.JoinRequestSubmitted:Fire(true);
        return;
    else
        if game:GetEngineFeature("CEVGetBackgroundState") then
            local v50, v51 = v47:getIsBackgroundDMActive():await();
            if v50 and v51 and not v48.force then
                v47:setAsConnected();
                v47.JoinRequestSubmitted:Fire(true);
                return;
            end;
        end;
        if l_FFlagCevAnalytics_0 then
            v47.voiceAnalytics:logPartyVoiceJoinAttempt({
                isConnected = v47.isConnected, 
                targetPlaceId = v49, 
                partyId = v48.partyId, 
                userId = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer.UserId else 0
            });
        end;
        v47.JoinRequested:Fire();
        v47.isConnected = true;
        if l_getFFlagJoinCrossExpVoiceWithPartyId_0() then
            if not v48 or not v48.partyId then
                v11:warn("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice");
                v47.isConnected = false;
                v47.currentPartyId = nil;
                v47.JoinRequestSubmitted:Fire(v47.isConnected);
                return;
            else
                v47.currentPartyId = v48.partyId;
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 318 ]]
                    -- upvalues: v11 (ref), v48 (copy), l_ExperienceService_0 (ref), l_CrossExperience_0 (ref), v49 (copy)
                    v11:info("CrossExperienceVoiceManager:join() - starting cross experience voice with partyId " .. v48.partyId);
                    l_ExperienceService_0:StartCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {
                        partyId = v48.partyId, 
                        placeId = v49
                    });
                end);
                if not l_status_2 then
                    v11:warn("Failed to join cross experience voice with partyId " .. v48.partyId, l_result_2);
                    v47.currentPartyId = nil;
                end;
            end;
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 334 ]]
                -- upvalues: v11 (ref), l_ExperienceService_0 (ref), l_CrossExperience_0 (ref), v49 (copy)
                v11:info("CrossExperienceVoiceManager:join() - starting cross experience voice");
                l_ExperienceService_0:StartCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {
                    placeId = v49
                });
            end);
            if not l_status_3 then
                v11:warn("Failed to join cross experience voice: ", l_result_3);
                v47.isConnected = false;
                v47.currentPartyId = nil;
            end;
        end;
        v47.JoinRequestSubmitted:Fire(v47.isConnected);
        return;
    end;
end;
v13.changeInputDevice = function(_, v57, v58) --[[ Line: 351 ]] --[[ Name: changeInputDevice ]]
    -- upvalues: l_Communication_0 (copy), l_CrossExperience_0 (copy), v22 (copy)
    l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE, {
        deviceName = v57, 
        deviceGuid = v58
    }, v22, v22);
end;
v13.changeOutputDevice = function(_, v60, v61) --[[ Line: 358 ]] --[[ Name: changeOutputDevice ]]
    -- upvalues: l_Communication_0 (copy), l_CrossExperience_0 (copy), v22 (copy)
    l_Communication_0.execute(l_CrossExperience_0.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE, {
        deviceName = v60, 
        deviceGuid = v61
    }, v22, v22);
end;
v13.muteVoiceParticipant = function(v62, v63) --[[ Line: 365 ]] --[[ Name: muteVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy)
    v62.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, {
        userId = v63
    });
end;
v13.unmuteVoiceParticipant = function(v64, v65) --[[ Line: 371 ]] --[[ Name: unmuteVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy)
    v64.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, {
        userId = v65
    });
end;
v13.blockVoiceParticipant = function(v66, v67) --[[ Line: 377 ]] --[[ Name: blockVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if v66.isConnected then
        v66.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, {
            userId = v67
        });
    end;
end;
v13.unblockVoiceParticipant = function(v68, v69) --[[ Line: 385 ]] --[[ Name: unblockVoiceParticipant ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if v68.isConnected then
        v68.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, {
            userId = v69
        });
    end;
end;
v13.dumpDebugData = function(v70) --[[ Line: 393 ]] --[[ Name: dumpDebugData ]]
    -- upvalues: l_CrossExperience_0 (copy)
    v70.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.DEBUG_COMMAND, {
        name = "dump_session"
    });
end;
v13.leave = function(v71) --[[ Line: 399 ]] --[[ Name: leave ]]
    -- upvalues: l_ExperienceService_0 (copy), l_CrossExperience_0 (copy), l_FFlagCevAnalytics_0 (copy)
    l_ExperienceService_0:StopCrossExperience(l_CrossExperience_0.Constants.EXPERIENCE_TYPE_VOICE, {});
    if l_FFlagCevAnalytics_0 and v71.voiceAnalytics then
        v71.voiceAnalytics:reset();
    end;
end;
v13.rejoinVoice = function(v72) --[[ Line: 407 ]] --[[ Name: rejoinVoice ]]
    -- upvalues: l_CrossExperience_0 (copy)
    v72.cevEventManager:notify(l_CrossExperience_0.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, {});
end;
v13.disconnect = function(v73) --[[ Line: 411 ]] --[[ Name: disconnect ]]
    -- upvalues: v20 (copy)
    v73.isConnected = false;
    v73.currentPartyId = nil;
    v73.hasExperienceStarted = false;
    v73.shouldIgnoreMemoryWarning = false;
    v20.clean();
end;
v13.getAudioFocusService = function(_) --[[ Line: 420 ]] --[[ Name: getAudioFocusService ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if not l_game_EngineFeature_0 then
        return nil;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 426 ]]
            return game:GetService("AudioFocusService");
        end);
        if not l_status_4 or not l_result_4 then
            return nil;
        else
            return l_result_4;
        end;
    end;
end;
v13.getCurrentAudioContext = function(v77) --[[ Line: 436 ]] --[[ Name: getCurrentAudioContext ]]
    local v78 = v77:getAudioFocusService();
    if v78 == nil then
        return -1;
    else
        return v78:GetFocusedContextId();
    end;
end;
v13.toggleAudioFocus = function(v79) --[[ Line: 445 ]] --[[ Name: toggleAudioFocus ]]
    -- upvalues: l_AUDIO_FOCUS_MANAGEMENT_0 (copy)
    local v80 = v79:getAudioFocusService();
    if v80 == nil then
        return;
    else
        local l_v80_RegisteredContexts_0 = v80:GetRegisteredContexts();
        local v82 = false;
        local v83 = false;
        for v84, _ in pairs(l_v80_RegisteredContexts_0) do
            if v84 == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID then
                v82 = true;
            end;
            if v84 == l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID then
                v83 = true;
            end;
        end;
        if not v82 or not v83 then
            return;
        else
            v80:AcquireFocus(v80:GetFocusedContextId() == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID and l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID or l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID);
            return;
        end;
    end;
end;
v13.default = v13.new();
return v13;