local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Cryo_0 = v3.Cryo;
local l_Http_0 = v3.Http;
local l_LocalStorageKey_0 = v3.LocalStorage.Enums.LocalStorageKey;
local l_NetworkingSquads_0 = v3.NetworkingSquads;
local l_Promise_0 = v3.Promise;
local l_RoduxSquads_0 = v3.RoduxSquads;
local l_EventNames_0 = v3.SquadsCore.Analytics.EventNames;
local l_SquadPromptType_0 = v3.SquadsCore.Enums.SquadPromptType;
local v12 = nil;
return function(v13, v14) --[[ Line: 19 ]]
    -- upvalues: l_Cryo_0 (copy), l_HttpService_0 (copy), l_Promise_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_RoduxSquads_0 (copy), v12 (ref), l_NetworkingSquads_0 (copy), l_EventNames_0 (copy), l_Http_0 (copy), l_SquadPromptType_0 (copy)
    return function(v15) --[[ Line: 20 ]]
        -- upvalues: l_Cryo_0 (ref), l_HttpService_0 (ref), l_Promise_0 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_RoduxSquads_0 (ref), v12 (ref), l_NetworkingSquads_0 (ref), v13 (copy), v14 (copy), l_EventNames_0 (ref), l_Http_0 (ref), l_SquadPromptType_0 (ref)
        local v16 = v15:getState();
        local v17 = v16.Squad and v16.Squad.Squad and v16.Squad.Squad.currentSquad;
        local v18 = v17 and v17.squadId;
        local v19 = v17 and v17.parentChannelId;
        local v20 = if v17 and v17.members then v17.members else {};
        local v25 = (function(v21) --[[ Line: 29 ]] --[[ Name: encodeSquadMembers ]]
            -- upvalues: l_Cryo_0 (ref), v20 (copy), l_HttpService_0 (ref)
            v21 = l_Cryo_0.List.map(v20, function(v22) --[[ Line: 30 ]]
                return v22.userId;
            end);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
                -- upvalues: l_HttpService_0 (ref), v21 (ref)
                return l_HttpService_0:JSONEncode(v21);
            end);
            if l_status_0 then
                return l_result_0;
            else
                return "[]";
            end;
        end)(v20);
        if not v18 then
            return l_Promise_0.resolve();
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 51 ]]
                -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
                return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
            end);
            local v28 = if l_status_1 then l_result_1 else "";
            local function _(v29) --[[ Line: 56 ]] --[[ Name: updateCurrentExperienceInviteStatus ]]
                -- upvalues: v15 (copy), l_RoduxSquads_0 (ref)
                v15:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                    isExperienceInvitePending = v29
                }));
            end;
            local function v39(v31) --[[ Line: 62 ]] --[[ Name: CreateExperienceInvite ]]
                -- upvalues: v12 (ref), v15 (copy), l_RoduxSquads_0 (ref), l_NetworkingSquads_0 (ref), v18 (copy), v13 (ref), v28 (copy), v14 (ref), l_EventNames_0 (ref), v19 (copy), v25 (copy), v20 (copy), l_HttpService_0 (ref), l_Http_0 (ref), l_SquadPromptType_0 (ref)
                if v12 then
                    task.cancel(v12);
                    v12 = nil;
                end;
                v15:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                    isExperienceInvitePending = true
                }));
                return v15:dispatch(l_NetworkingSquads_0.CreateExperienceInvite.API({
                    membershipEntityId = v18, 
                    placeId = v13, 
                    voteIdentifier = v28
                })):andThen(function(v32) --[[ Line: 76 ]]
                    -- upvalues: v14 (ref), l_EventNames_0 (ref), v19 (ref), v13 (ref), v25 (ref), v20 (ref), v12 (ref), v15 (ref), l_RoduxSquads_0 (ref)
                    local l_experienceInviteId_0 = v32.responseBody.experienceInviteId;
                    v14.fireSquadAnalytics(l_EventNames_0.SquadExperienceInviteApiCall, {
                        parentChannelId = v19, 
                        experienceInviteId = l_experienceInviteId_0, 
                        isSuccess = true, 
                        invitationPlaceId = tonumber(v13), 
                        squadMembers = v25, 
                        squadMembersCount = #v20
                    });
                    v12 = task.delay(2, function() --[[ Line: 87 ]]
                        -- upvalues: v15 (ref), l_RoduxSquads_0 (ref), v12 (ref)
                        v15:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                            isExperienceInvitePending = false
                        }));
                        v12 = nil;
                    end);
                end):catch(function(v34) --[[ Line: 92 ]]
                    -- upvalues: v15 (ref), l_RoduxSquads_0 (ref), l_HttpService_0 (ref), v14 (ref), l_EventNames_0 (ref), v19 (ref), v13 (ref), v25 (ref), v20 (ref), l_Http_0 (ref), v31 (copy), l_SquadPromptType_0 (ref)
                    v15:dispatch(l_RoduxSquads_0.Actions.CurrentExperienceInviteStatusUpdated({
                        isExperienceInvitePending = false
                    }));
                    local l_Body_0 = v34.Body;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 96 ]]
                        -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                        return l_HttpService_0:JSONDecode(l_Body_0);
                    end);
                    local v38 = if l_status_2 then l_result_2.errorType else nil;
                    v14.fireSquadAnalytics(l_EventNames_0.SquadExperienceInviteApiCall, {
                        parentChannelId = v19, 
                        isSuccess = false, 
                        errorMessage = v38, 
                        errorType = if v34.StatusCode then tostring(v34.StatusCode) else nil, 
                        invitationPlaceId = tonumber(v13), 
                        squadMembers = v25, 
                        squadMembersCount = #v20
                    });
                    if v34.StatusCode == l_Http_0.StatusCodes.CONFLICT then
                        v14.setSquadPrompt(v15, {
                            onConfirm = function() --[[ Line: 114 ]] --[[ Name: onConfirm ]]
                                -- upvalues: v31 (ref)
                                v31(v31);
                            end, 
                            promptType = l_SquadPromptType_0.InvitedToExperience
                        });
                        return;
                    else
                        v14.setSquadPrompt(v15, {
                            promptType = l_SquadPromptType_0.Error
                        });
                        return;
                    end;
                end);
            end;
            return v39(v39);
        end;
    end;
end;