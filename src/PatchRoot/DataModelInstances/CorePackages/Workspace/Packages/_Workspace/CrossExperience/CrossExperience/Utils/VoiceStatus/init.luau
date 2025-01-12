local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Types);
local l_VOICE_STATUS_0 = v1.VOICE_STATUS;
local v4 = {
    [l_VOICE_STATUS_0.ERROR_VOICE_INIT] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_SETUP] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_JOIN] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_MIC_REJECTED] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_MODERATED] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_FAILED] = true
};
local v5 = {
    [l_VOICE_STATUS_0.ERROR_START_BACKGROUND_DM] = true, 
    [l_VOICE_STATUS_0.ERROR_RCC_CONNECTING] = true, 
    [l_VOICE_STATUS_0.ERROR_VOICE_DISCONNECTED] = true
};
isVoiceRetriableErrorByGameJoin = function(v6) --[[ Line: 26 ]] --[[ Name: isVoiceRetriableErrorByGameJoin ]]
    -- upvalues: v5 (copy)
    if v6 == nil then
        return false;
    else
        return v5[v6] == true;
    end;
end;
isVoiceRetriableErrorByVoiceJoin = function(v7) --[[ Line: 33 ]] --[[ Name: isVoiceRetriableErrorByVoiceJoin ]]
    -- upvalues: v4 (copy)
    if v7 == nil then
        return false;
    else
        return v4[v7] == true;
    end;
end;
isVoiceRetriableError = function(v8) --[[ Line: 41 ]] --[[ Name: isVoiceRetriableError ]]
    return isVoiceRetriableErrorByGameJoin(v8) or isVoiceRetriableErrorByVoiceJoin(v8);
end;
return {
    isVoiceRetriableError = isVoiceRetriableError, 
    isVoiceRetriableErrorByGameJoin = isVoiceRetriableErrorByGameJoin, 
    isVoiceRetriableErrorByVoiceJoin = isVoiceRetriableErrorByVoiceJoin
};