local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_SharedFlags_0 = v1.SharedFlags;
local l_ExperimentCacheManager_0 = v1.ExperimentCacheManager.ExperimentCacheManager;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local v5 = game:DefineFastString("CrossExpVoiceIXPLayer", "Social.PartyVoice");
local v6 = game:DefineFastString("DebugCrossExpVoiceIXPLayer", "");
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local v8 = {};
v8.__index = v8;
local v9 = {
    CrossExpVoiceDebugVariant_0 = {
        partyVoiceExp = false
    }, 
    CrossExpVoiceDebugVariant_1 = {
        partyVoiceExp = true
    }
};
v8.new = function() --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v10 = {
        initialized = false, 
        variant = {}
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.initialize = function(v11) --[[ Line: 58 ]] --[[ Name: initialize ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v5 (copy), v6 (copy), v9 (copy)
    local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(v5);
    if v12 ~= nil then
        v11.initialized = true;
        v11.variant = table.clone(v12);
    end;
    if v6 ~= "None" then
        v11.initialized = true;
        v11.variant = v9[v6] or v11.variant;
    end;
    if v11.initialized then
        v11:logLayerExposure();
    end;
end;
v8.logLayerExposure = function(_) --[[ Line: 78 ]] --[[ Name: logLayerExposure ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v5 (copy)
    l_ExperimentCacheManager_0.default:logLayerExposure(v5);
end;
v8.getHasPartyVoiceVolume = function() --[[ Line: 82 ]] --[[ Name: getHasPartyVoiceVolume ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v8 (copy)
    return l_game_EngineFeature_0 and v8.default.variant.partyVoiceExp;
end;
v8.default = if l_GetFFlagEnableCrossExpVoice_0() then v8.new() else nil;
return v8;