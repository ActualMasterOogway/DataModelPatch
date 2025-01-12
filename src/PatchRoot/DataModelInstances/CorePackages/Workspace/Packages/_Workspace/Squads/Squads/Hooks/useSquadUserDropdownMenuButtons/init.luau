local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_SquadsCore_0 = v1.SquadsCore;
local l_React_0 = v1.React;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_SharedFlags_0 = v1.SharedFlags;
local l_CrossExperienceVoice_0 = v1.CrossExperienceVoice;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_Constants_0 = l_SquadsCore_0.Common.Constants;
local l_useIsLocalPlayerPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsUserPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsUserPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local l_useBackgroundExperience_0 = l_CrossExperienceVoice_0.Hooks.useBackgroundExperience;
local l_useCurrentSquadParentChannelId_0 = l_SquadsCore_0.Hooks.useCurrentSquadParentChannelId;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
return function(v18, v19) --[[ Line: 23 ]] --[[ Name: useSquadUserDropdownMenuButtons ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useBackgroundExperience_0 (copy), l_React_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_Constants_0 (copy), l_dependencyArray_0 (copy)
    local v20 = l_useLocalUserId_0();
    local v21 = tostring(v20) == tostring(v18);
    local v22 = nil;
    local v23 = nil;
    local v24 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v25 = if v18 then tonumber(v18) else nil;
        v22 = l_useBackgroundExperience_0();
        v23 = l_React_0.useMemo(function() --[[ Line: 35 ]]
            -- upvalues: v22 (ref)
            if v22 then
                return v22.voiceChannelId;
            else
                return nil;
            end;
        end, {
            v22
        });
        if v25 then
            local v26 = l_useIsLocalPlayerPartyVoiceEligible_0();
            local v27 = l_useIsUserPartyVoiceEligible_0(v25);
            v24 = l_useIsCurrentSquadPartyVoiceEligible_0() == true and v26 and not v27;
        end;
    end;
    local v28 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v29 = l_useCurrentSquadParentChannelId_0();
    local v30 = v28.useGetConversationFromId(v29 or "");
    local v32 = l_React_0.useCallback(function(v31) --[[ Line: 53 ]]
        -- upvalues: v18 (copy)
        return v31.Squad.Presence.byUserId[tostring(v18)];
    end, {
        v18
    });
    local v33 = l_useSelector_0(v32);
    return l_React_0.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v24 (ref), v33 (copy), l_PresenceType_0 (ref), v30 (copy), l_Constants_0 (ref), v20 (copy), v19 (copy), v23 (ref), v21 (copy)
        local v34 = {
            VoiceIneligibleButton = v24, 
            JoinButton = v33 and v33.userPresenceType == l_PresenceType_0.InGame and v33.placeId, 
            RemoveUserButton = v30 and v30.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v30.initiator == v20, 
            ViewProfileButton = not v19, 
            ReportButton = v23 and not v21
        };
        local v35 = {};
        for v36, v37 in v34 do
            if v37 then
                table.insert(v35, v36);
            end;
        end;
        return v35;
    end, l_dependencyArray_0(v24, v19, v23, v21, v33, v30, v20));
end;