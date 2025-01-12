local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
local l_ExperienceJoined_0 = require(l_script_FirstAncestor_0.Actions).ExperienceJoined;
local l_ExperienceLeft_0 = require(l_script_FirstAncestor_0.Actions).ExperienceLeft;
local l_RestoreState_0 = require(l_script_FirstAncestor_0.Actions).RestoreState;
local l_VoiceStatusChanged_0 = require(l_script_FirstAncestor_0.Actions).VoiceStatusChanged;
local _ = require(l_script_FirstAncestor_0.Types);
local v9 = require(l_script_FirstAncestor_0.Constants);
local l_VOICE_STATUS_0 = v9.VOICE_STATUS;
local v11 = {
    jobId = nil, 
    gameId = nil, 
    placeId = nil, 
    voiceStatus = l_VOICE_STATUS_0.DISCONNECTED, 
    voiceChannelId = nil, 
    voiceSessionId = nil
};
local function _(v12, v13) --[[ Line: 28 ]] --[[ Name: isAllowedVoiceStatusTransition ]]
    return v12 ~= v13;
end;
return function(v15) --[[ Line: 36 ]]
    -- upvalues: l_Rodux_0 (copy), v11 (copy), l_ExperienceJoined_0 (copy), l_Cryo_0 (copy), l_ExperienceLeft_0 (copy), v9 (copy), l_RestoreState_0 (copy), l_VoiceStatusChanged_0 (copy), l_VOICE_STATUS_0 (copy)
    return l_Rodux_0.createReducer(v15 or v11, {
        [l_ExperienceJoined_0.name] = function(v16, v17) --[[ Line: 39 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_payload_0 = v17.payload;
            return l_Cryo_0.Dictionary.join(v16, {
                jobId = l_payload_0.jobId, 
                gameId = l_payload_0.gameId, 
                placeId = l_payload_0.placeId
            });
        end, 
        [l_ExperienceLeft_0.name] = function(v19) --[[ Line: 48 ]]
            -- upvalues: v9 (ref)
            local l_voiceStatus_0 = v19.voiceStatus;
            local l_voiceStatus_1 = v19.voiceStatus;
            if l_voiceStatus_0 ~= v9.VOICE_STATUS.ERROR_VOICE_DISCONNECTED and l_voiceStatus_0 ~= v9.VOICE_STATUS.ERROR_START_BACKGROUND_DM and l_voiceStatus_0 ~= v9.VOICE_STATUS.ERROR_RCC_CONNECTING then
                l_voiceStatus_1 = v9.VOICE_STATUS.DISCONNECTED;
            end;
            return {
                jobId = nil, 
                gameId = nil, 
                placeId = nil, 
                voiceChannelId = nil, 
                voiceSessionId = nil, 
                voiceStatus = l_voiceStatus_1
            };
        end, 
        [l_RestoreState_0.name] = function(v22, v23) --[[ Line: 71 ]]
            -- upvalues: l_Cryo_0 (ref)
            if v23.payload.Experience then
                return l_Cryo_0.Dictionary.join({}, v23.payload.Experience);
            else
                return v22;
            end;
        end, 
        [l_VoiceStatusChanged_0.name] = function(v24, v25) --[[ Line: 78 ]]
            -- upvalues: l_Cryo_0 (ref), l_VOICE_STATUS_0 (ref)
            if v24.voiceStatus ~= v25.payload.status then
                local v26 = l_Cryo_0.Dictionary.join(v24, {
                    voiceStatus = v25.payload.status
                });
                if v25.payload.status == l_VOICE_STATUS_0.VOICE_CONNECTED then
                    v26 = l_Cryo_0.Dictionary.join(v26, {
                        voiceChannelId = v25.payload.voiceChannelId, 
                        voiceSessionId = v25.payload.voiceSessionId
                    });
                end;
                return v26;
            else
                return v24;
            end;
        end
    });
end;