local l_Parent_0 = script:FindFirstAncestor("CrossExperienceVoice").Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventNames);
return {
    [v5.PartyVoiceStateChanged] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceStateChanged, 
        formatRulesForAdditionalInfo = {
            userId = v1.identity, 
            partyId = v1.identity, 
            voiceSessionId = v1.identity, 
            voiceChannelId = v1.identity, 
            status = v1.identity, 
            previousStatus = v1.identity
        }
    }, 
    [v5.PartyVoiceJoinAttempt] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceJoinAttempt, 
        formatRulesForAdditionalInfo = {
            userId = v1.identity, 
            partyId = v1.identity, 
            targetPlaceId = v1.identity, 
            isConnected = v1.identity
        }
    }, 
    [v5.PartyVoiceConnectedParticipantsOnJoin] = {
        context = l_Contexts_0.PartyVoice, 
        eventType = l_EventTypes_0.PartyVoiceConnectedParticipantsOnJoin, 
        formatRulesForAdditionalInfo = {
            userId = v1.identity, 
            partyId = v1.identity, 
            status = v1.identity, 
            voiceChannelId = v1.identity, 
            voiceSessionId = v1.identity, 
            voicePlaySessionId = v1.identity, 
            participants = v1.identity, 
            numberActive = v1.identity
        }
    }
};