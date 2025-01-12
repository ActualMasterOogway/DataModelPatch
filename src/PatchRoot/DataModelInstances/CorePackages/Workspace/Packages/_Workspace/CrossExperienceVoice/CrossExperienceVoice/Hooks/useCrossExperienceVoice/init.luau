local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_ExperienceService_0 = v1.ExperienceService.ExperienceService;
local l_CrossExperience_0 = v1.CrossExperience;
local l_React_0 = v1.React;
local l_RoactUtils_0 = v1.RoactUtils;
local l_useStore_0 = l_RoactUtils_0.Hooks.RoactRodux.useStore;
local l_useDispatch_0 = l_RoactUtils_0.Hooks.RoactRodux.useDispatch;
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = v1.SharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck;
local l_VoiceStatusChanged_0 = l_CrossExperience_0.Actions.VoiceStatusChanged;
local l_useEffect_0 = l_React_0.useEffect;
local v11 = require(l_script_FirstAncestor_0.Logger);
local l_default_0 = require(l_script_FirstAncestor_0.CrossExperienceVoiceManager).default;
local function _() --[[ Line: 23 ]]
    -- upvalues: l_CrossExperience_0 (copy)
    if game.PlaceId == 0 then
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP;
    else
        return l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC;
    end;
end;
return function() --[[ Line: 29 ]] --[[ Name: useCrossExperienceVoice ]]
    -- upvalues: l_useStore_0 (copy), l_useDispatch_0 (copy), l_React_0 (copy), l_CrossExperience_0 (copy), v11 (copy), l_default_0 (copy), l_VoiceStatusChanged_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_ExperienceService_0 (copy), l_useEffect_0 (copy)
    local v14 = l_useStore_0();
    local v15 = l_useDispatch_0();
    local v16 = l_React_0.useRef(nil);
    local v17 = l_React_0.useRef(nil);
    local v18 = l_React_0.useRef(nil);
    local v19 = l_React_0.useRef(nil);
    local v20 = l_React_0.useRef(nil);
    local v21 = l_React_0.useRef(nil);
    local v22 = l_React_0.useRef(nil);
    local v23 = l_React_0.useRef(nil);
    local v24 = l_React_0.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: l_CrossExperience_0 (ref)
        return l_CrossExperience_0.EventManager.new(if game.PlaceId == 0 then l_CrossExperience_0.Constants.EXPERIENCE_TYPE_LUAAPP else l_CrossExperience_0.Constants.EXPERIENCE_TYPE_UGC, true);
    end, {});
    local function _() --[[ Line: 45 ]]
        -- upvalues: v24 (copy), v14 (copy), v11 (ref)
        v24:subscribe(v14, v11);
    end;
    local function _() --[[ Line: 49 ]]
        -- upvalues: v24 (copy), v14 (copy), v11 (ref)
        v24:unsubscribe(v14, v11);
    end;
    local function v27() --[[ Line: 53 ]]
        -- upvalues: v24 (copy), v14 (copy), v11 (ref), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy)
        v24:unsubscribe(v14, v11);
        if v16.current then
            v16.current:Disconnect();
            v16.current = nil;
        end;
        if v17.current then
            v17.current:Disconnect();
            v17.current = nil;
        end;
        if v18.current then
            v18.current:Disconnect();
            v18.current = nil;
        end;
        if v19.current then
            v19.current:Disconnect();
            v19.current = nil;
        end;
        if v20.current then
            v20.current:Disconnect();
            v20.current = nil;
        end;
        if v21.current then
            v21.current:Disconnect();
            v21.current = nil;
        end;
        if v22.current then
            v22.current:Disconnect();
            v22.current = nil;
        end;
        if v23.current then
            v23.current:Disconnect();
            v23.current = nil;
        end;
    end;
    local function v30() --[[ Line: 89 ]]
        -- upvalues: v21 (copy), l_default_0 (ref), v15 (copy), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref), v22 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v23 (copy), v16 (copy), v24 (copy), v14 (copy), v11 (ref), v17 (copy), v18 (copy), l_ExperienceService_0 (ref), v19 (copy), v20 (copy)
        v21.current = l_default_0.JoinRequested.Event:Connect(function() --[[ Line: 90 ]]
            -- upvalues: v15 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref)
            v15(l_VoiceStatusChanged_0({
                status = l_CrossExperience_0.Constants.VOICE_STATUS.RCC_CONNECTING
            }));
        end);
        v22.current = l_default_0.JoinRequestSubmitted.Event:Connect(function(v28) --[[ Line: 96 ]]
            -- upvalues: v15 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref)
            if not v28 then
                v15(l_VoiceStatusChanged_0({
                    status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_START_BACKGROUND_DM
                }));
            end;
        end);
        if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
            v23.current = l_default_0.JoinFeasibilityCheckPerformed.Event:Connect(function(v29) --[[ Line: 106 ]]
                -- upvalues: v15 (ref), l_VoiceStatusChanged_0 (ref), l_CrossExperience_0 (ref)
                if not v29 then
                    v15(l_VoiceStatusChanged_0({
                        status = l_CrossExperience_0.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED
                    }));
                end;
            end);
        end;
        v16.current = l_default_0.ExperienceJoined.Event:Connect(function() --[[ Line: 115 ]]
            -- upvalues: v24 (ref), v14 (ref), v11 (ref)
            v24:subscribe(v14, v11);
        end);
        v17.current = l_default_0.ExperienceJoinFailed.Event:Connect(function() --[[ Line: 119 ]]
            -- upvalues: v24 (ref), v14 (ref), v11 (ref)
            v24:unsubscribe(v14, v11);
        end);
        v18.current = l_default_0.ExperienceLeft.Event:Connect(function() --[[ Line: 123 ]]
            -- upvalues: v24 (ref), v14 (ref), v11 (ref)
            v24:unsubscribe(v14, v11);
        end);
        if l_ExperienceService_0 then
            v19.current = l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 129 ]]
                -- upvalues: v24 (ref), v14 (ref), v11 (ref)
                if game.PlaceId == 0 then
                    v24:unsubscribe(v14, v11);
                end;
            end);
            v20.current = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 135 ]]
                -- upvalues: v24 (ref), v14 (ref), v11 (ref)
                if game.PlaceId == 0 then
                    v24:restoreStateFromBackground(v14, v11);
                end;
            end);
        end;
    end;
    l_useEffect_0(function() --[[ Line: 144 ]]
        -- upvalues: v30 (copy), v27 (copy)
        v30();
        return function() --[[ Line: 146 ]]
            -- upvalues: v27 (ref)
            v27();
        end;
    end, {});
    return nil;
end;