local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_script_FirstAncestor_0.Communication);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Actions);
local v7 = require(l_script_FirstAncestor_0.Models);
local v8 = require(l_script_FirstAncestor_0.Utils);
local v9 = require(l_script_FirstAncestor_0.Utils.EventQueue);
local v10 = require(l_script_FirstAncestor_0.Middlewares.createPersistenceMiddleware);
local v11 = game:DefineFastFlag("EnableCrossDMEventSequencing", false);
local v12 = game:DefineFastFlag("EnableCrossExpEventLogging", false);
local l_FFlagPartyVoiceBlockSync_0 = v2.SharedFlags.FFlagPartyVoiceBlockSync;
local l_Cryo_0 = v2.Cryo;
local v15 = 0;
local v16 = l_HttpService_0:GenerateGUID(false);
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19) --[[ Line: 99 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v17 (copy)
    local v20 = {
        observers = {}, 
        experienceType = v18, 
        isSubscribed = false, 
        eventQueue = v9.new(v19)
    };
    setmetatable(v20, v17);
    return v20;
end;
local function _(v21) --[[ Line: 110 ]]
    return {
        userId = tonumber(v21.userId) or -1, 
        isLocalUser = v21.isLocalUser
    };
end;
v17.notify = function(_, v24, v25) --[[ Line: 117 ]] --[[ Name: notify ]]
    -- upvalues: v11 (copy), v15 (ref), v16 (copy), v4 (copy)
    if v11 then
        if not v25 then
            v25 = {};
        end;
        v15 = v15 + 1;
        v25._seq = v15;
        v25._origin = v16;
    end;
    v4.notify(v24, v25);
end;
v17.removeObserver = function(v26, v27, v28) --[[ Line: 130 ]] --[[ Name: removeObserver ]]
    -- upvalues: v4 (copy)
    v4.removeObserver(v26.experienceType, v28, v27);
end;
v17.addObserver = function(v29, v30, v31) --[[ Line: 134 ]] --[[ Name: addObserver ]]
    -- upvalues: v11 (copy), v4 (copy)
    local v32 = nil;
    v32 = if v11 then v4.addObserver(v29.experienceType, v30, function(v33) --[[ Line: 137 ]]
        -- upvalues: v29 (copy), v30 (copy), v31 (copy)
        v29.eventQueue:process(v30, v33, v31);
    end) else v4.addObserver(v29.experienceType, v30, v31);
    table.insert(v29.observers, {
        id = v32, 
        event = v30
    });
end;
local v34 = v10({
    storeKey = v5.STORAGE_CEV_STORE_KEY
});
v17.subscribe = function(v35, v36, v37) --[[ Line: 155 ]] --[[ Name: subscribe ]]
    -- upvalues: v12 (copy), v5 (copy), v6 (copy), l_Cryo_0 (copy), v7 (copy), l_FFlagPartyVoiceBlockSync_0 (copy)
    if v35.isSubscribed then
        return;
    else
        v35.isSubscribed = true;
        if v37 and v12 then
            v37:info("{}: Subscribing to the CEV Store", v35.experienceType);
        end;
        v35:addObserver(v5.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(v38) --[[ Line: 168 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref), v5 (ref)
            if v37 and v12 then
                v37:info("{}: Experience Party Voice Game Join Failed: {}", v35.experienceType, v38.state);
            end;
            v36:dispatch(v6.VoiceStatusChanged({
                status = v5.VOICE_STATUS.ERROR_RCC_CONNECTING
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(v39) --[[ Line: 181 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v5 (ref), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Experience Voice Status Changed: {}, {}, {}, {}", v35.experienceType, v39.status, v39.detail, v39.voiceChannelId, v39.voiceSessionId);
            end;
            if v39.status == v5.VOICE_STATUS.VOICE_CONNECTED then
                if not v39.voiceChannelId and v37 then
                    v37:warning("Voice channel id is expected");
                end;
                if not v39.voiceSessionId then
                    v37:warning("Voice session id is expected");
                end;
            end;
            v36:dispatch(v6.VoiceStatusChanged({
                status = v39.status, 
                voiceChannelId = v39.voiceChannelId, 
                voiceSessionId = v39.voiceSessionId
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, function(v40) --[[ Line: 213 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), l_Cryo_0 (ref), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Experience joined JobID: {}, GameID: {}, PlaceId: {}", v35.experienceType, v40.jobId, v40.gameId, v40.placeId);
            end;
            local v41 = v35:getBackgroundStateSnapshot();
            local l_v40_0 = v40;
            if v41 and v41.Participants then
                l_v40_0 = l_Cryo_0.Dictionary.join(l_v40_0, v41.Participants);
            end;
            v36:dispatch(v6.ExperienceJoined(l_v40_0));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, function(v43) --[[ Line: 235 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant Audio Focus Changed {} = {}", v35.experienceType, v43.userId, v43.contextId);
            end;
            v36:dispatch(v6.ParticipantAudioFocusChanged({
                userId = v43.userId, 
                contextId = v43.contextId, 
                contextIds = v43.contextIds
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, function(v44) --[[ Line: 255 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v7 (ref), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant added {}", v35.experienceType, v44.userId);
            end;
            local v45 = v7.ParticipantModel.format({
                userId = v44.userId, 
                isLocalUser = v44.isLocalUser, 
                username = v44.username, 
                displayname = v44.displayname, 
                isActive = false, 
                isMuted = false
            });
            v36:dispatch(v6.ParticipantAdded(v45));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, function(v46) --[[ Line: 273 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant removed {}", v35.experienceType, v46.userId);
            end;
            v36:dispatch(v6.ParticipantRemoved({
                userId = tonumber(v46.userId) or -1, 
                isLocalUser = v46.isLocalUser
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE, function(v47) --[[ Line: 283 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant is active {}", v35.experienceType, v47.userId);
            end;
            v36:dispatch(v6.ParticipantIsActive({
                userId = tonumber(v47.userId) or -1, 
                isLocalUser = v47.isLocalUser
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, function(v48) --[[ Line: 293 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant is inactive {}", v35.experienceType, v48.userId);
            end;
            v36:dispatch(v6.ParticipantIsInactive({
                userId = tonumber(v48.userId) or -1, 
                isLocalUser = v48.isLocalUser
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED, function(v49) --[[ Line: 303 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant is was muted {}", v35.experienceType, v49.userId);
            end;
            v36:dispatch(v6.ParticipantWasMuted({
                userId = tonumber(v49.userId) or -1, 
                isLocalUser = v49.isLocalUser
            }));
        end);
        v35:addObserver(v5.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED, function(v50) --[[ Line: 313 ]]
            -- upvalues: v37 (copy), v12 (ref), v35 (copy), v36 (copy), v6 (ref)
            if v37 and v12 then
                v37:info("{}: Participant is was unmuted {}", v35.experienceType, v50.userId);
            end;
            v36:dispatch(v6.ParticipantWasUnmuted({
                userId = tonumber(v50.userId) or -1, 
                isLocalUser = v50.isLocalUser
            }));
        end);
        if l_FFlagPartyVoiceBlockSync_0 then
            v35:addObserver(v5.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, function(v51) --[[ Line: 324 ]]
                -- upvalues: v37 (copy), v12 (ref), v35 (copy)
                if v37 and v12 then
                    v37:info("{}: Participant was blocked {} from party voice", v35.experienceType, v51.userId);
                end;
            end);
            v35:addObserver(v5.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, function(v52) --[[ Line: 333 ]]
                -- upvalues: v37 (copy), v12 (ref), v35 (copy)
                if v37 and v12 then
                    v37:info("{}: Participant was unblocked {} from party voice", v35.experienceType, v52.userId);
                end;
            end);
        end;
        return;
    end;
end;
v17.getBackgroundStateSnapshot = function(_) --[[ Line: 342 ]] --[[ Name: getBackgroundStateSnapshot ]]
    -- upvalues: v34 (copy), v8 (copy)
    local v54 = v34.restore();
    if v54 and v54.Squad and v54.Squad.CrossExperienceVoice then
        return {
            Experience = v54.Squad.CrossExperienceVoice.Experience, 
            Participants = {
                participants = v8.stringMapToNumberMap(v54.Squad.CrossExperienceVoice.Participants.participants), 
                activeUserIds = v54.Squad.CrossExperienceVoice.Participants.activeUserIds, 
                publicVoiceFocusedUserIds = v8.stringMapToNumberMap(v54.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds)
            }
        };
    else
        return nil;
    end;
end;
v17.restoreStateFromBackground = function(v55, v56, v57) --[[ Line: 360 ]] --[[ Name: restoreStateFromBackground ]]
    -- upvalues: v12 (copy), l_HttpService_0 (copy), v6 (copy)
    local v58 = v55:getBackgroundStateSnapshot();
    if v58 then
        if v57 and v12 then
            v57:info("{}: Restoring state from background {}", v55.experienceType, l_HttpService_0:JSONEncode(v58));
        end;
        v56:dispatch(v6.RestoreState(v58));
    end;
end;
v17.unsubscribe = function(v59, v60, v61) --[[ Line: 370 ]] --[[ Name: unsubscribe ]]
    -- upvalues: v12 (copy), v6 (copy)
    if v61 and v12 then
        v61:info("{}: Unsubscribing from the CEV Store", v59.experienceType);
    end;
    v60:dispatch(v6.ExperienceLeft());
    for _, v63 in ipairs(v59.observers) do
        v59:removeObserver(v63.id, v63.event);
    end;
    v59.isSubscribed = false;
    v59.observers = {};
    v59.eventQueue:reset();
end;
return v17;