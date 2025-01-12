local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Analytics);
local l_LoggingProtocol_0 = v1.LoggingProtocol;
local v4 = game:DefineFastFlag("PartyVoiceLaunchFlowTelemetry", false);
local v5 = {};
v5.__index = v5;
v5.new = function() --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v5 (copy)
    local v6 = {
        previousStatus = nil, 
        connections = {}, 
        isInitialized = false, 
        eventManager = nil, 
        analytics = v2.Analytics()
    };
    setmetatable(v6, v5);
    return v6;
end;
v5.initialize = function(v7, v8) --[[ Line: 64 ]] --[[ Name: initialize ]]
    v7.eventManager = v8;
    v7.isInitialized = true;
end;
v5.logPartyVoiceStatusChanged = function(v9, v10, v11) --[[ Line: 69 ]] --[[ Name: logPartyVoiceStatusChanged ]]
    -- upvalues: v2 (copy)
    if not v9.isInitialized then
        return;
    else
        if v9.previousStatus ~= v10.status then
            v9.analytics.fireAnalyticsEvent(v2.EventNames.PartyVoiceStateChanged, {
                partyId = v11 or "", 
                status = v10.status, 
                previousStatus = v9.previousStatus or "", 
                voiceChannelId = v10.voiceChannelId, 
                voiceSessionId = v10.voiceSessionId, 
                userId = v10.userId
            });
        end;
        v9.previousStatus = v10.status;
        return;
    end;
end;
v5.logPartyVoiceConnectedState = function(v12, v13, v14) --[[ Line: 91 ]] --[[ Name: logPartyVoiceConnectedState ]]
    -- upvalues: v2 (copy), v4 (copy)
    if not v12.isInitialized then
        return;
    else
        v12.analytics.fireAnalyticsEvent(v2.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
            userId = if v13.userId then v13.userId else 0, 
            partyId = v14 or "", 
            status = if v13.status then v13.status else "", 
            voiceChannelId = if v13.voiceChannelId then v13.voiceChannelId else "", 
            voiceSessionId = if v13.voiceSessionId then v13.voiceSessionId else "", 
            voicePlaySessionId = if v13.voicePlaySessionId then v13.voicePlaySessionId else "", 
            participants = if v13.participants then v13.participants else "", 
            numberActive = v13.numberActive or 0
        });
        if v4 then
            v12:logLaunchFlowEndEvent();
        end;
        return;
    end;
end;
v5.logPartyVoiceJoinAttempt = function(v15, v16) --[[ Line: 112 ]] --[[ Name: logPartyVoiceJoinAttempt ]]
    -- upvalues: v2 (copy), v4 (copy)
    if not v15.isInitialized then
        return;
    else
        v15.analytics.fireAnalyticsEvent(v2.EventNames.PartyVoiceJoinAttempt, {
            userId = if v16.userId then v16.userId else 0, 
            partyId = if v16.partyId then v16.partyId else "", 
            targetPlaceId = if v16.targetPlaceId then v16.targetPlaceId else 0, 
            isConnected = if v16.isConnected then v16.isConnected else false
        });
        if v4 then
            v15:logLaunchFlowBeginEvent();
        end;
        return;
    end;
end;
v5.logLaunchFlowBeginEvent = function(_) --[[ Line: 129 ]] --[[ Name: logLaunchFlowBeginEvent ]]
    -- upvalues: l_LoggingProtocol_0 (copy)
    l_LoggingProtocol_0.default:logEvent("party_voice_launch_flow_begin");
end;
v5.logLaunchFlowEndEvent = function(_) --[[ Line: 133 ]] --[[ Name: logLaunchFlowEndEvent ]]
    -- upvalues: l_LoggingProtocol_0 (copy)
    l_LoggingProtocol_0.default:logEvent("party_voice_launch_flow_end");
end;
v5.reset = function(v19) --[[ Line: 137 ]] --[[ Name: reset ]]
    v19.previousStatus = nil;
end;
v5.default = v5.new();
return v5;