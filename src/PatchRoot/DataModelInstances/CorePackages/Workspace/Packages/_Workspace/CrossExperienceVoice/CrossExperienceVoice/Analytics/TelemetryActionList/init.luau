local l_Parent_0 = script:FindFirstAncestor("CrossExperienceVoice").Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("PartyVoiceTelemetryThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.PartyVoiceStateChanged] = {
        lastUpdated = {
            24, 
            12, 
            8
        }, 
        description = "Event when a user transitions state during a party voice session", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    partyId = function(v3) --[[ Line: 21 ]] --[[ Name: partyId ]]
                        return v3;
                    end, 
                    voiceSessionId = function(v4) --[[ Line: 24 ]] --[[ Name: voiceSessionId ]]
                        return v4;
                    end, 
                    status = function(v5) --[[ Line: 27 ]] --[[ Name: status ]]
                        return v5;
                    end, 
                    previousStatus = function(v6) --[[ Line: 30 ]] --[[ Name: previousStatus ]]
                        return v6;
                    end
                }
            }
        }
    }, 
    [v2.PartyVoiceConnectedParticipantsOnJoin] = {
        lastUpdated = {
            24, 
            11, 
            30
        }, 
        description = "Event when a user successfully connects to a party voice channel", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    numberActive = function(v7) --[[ Line: 44 ]] --[[ Name: numberActive ]]
                        return v7;
                    end, 
                    partyId = function(v8) --[[ Line: 47 ]] --[[ Name: partyId ]]
                        return v8;
                    end
                }
            }
        }
    }, 
    [v2.PartyVoiceJoinAttempt] = {
        lastUpdated = {
            24, 
            12, 
            8
        }, 
        description = "Event when a user attempts to connect to party voice", 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    partyId = function(v9) --[[ Line: 61 ]] --[[ Name: partyId ]]
                        return v9;
                    end
                }
            }
        }
    }
};