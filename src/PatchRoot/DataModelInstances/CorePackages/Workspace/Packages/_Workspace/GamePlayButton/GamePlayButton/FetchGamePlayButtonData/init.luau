local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v3 = require(l_Parent_0.GameDetailRodux);
local l_ApiFetchGameDetails_0 = v3.GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = v3.FetchGamePlayabilityAndProductInfo;
local l_FetchUserGameVotes_0 = require(l_Parent_0.GameVotesRodux).UserGameVotes.FetchUserGameVotes;
local v7 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_SetNextDataExpirationTime_0 = v7.SetNextDataExpirationTime;
local l_NextDataExpirationTimeReducer_0 = v7.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v7.ExpirationTimeNamespace;
local l_ApiFetchShowAgeVerificationOverlay_0 = require(l_Parent_0.VoiceChat).AgeVerificationOverlay.ApiFetchShowAgeVerificationOverlay;
local l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 = require(l_Parent_0.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds;
local l_FFlagLuaAppVpcUpsell_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppVpcUpsell;
local l_RunService_0 = game:GetService("RunService");
local v15 = {};
local function v23(v16, v17, v18, v19, v20) --[[ Line: 26 ]] --[[ Name: playButtonDataFetchPromises ]]
    -- upvalues: l_ApiFetchGameDetails_0 (copy), l_RetrievalStatus_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_FFlagLuaAppVpcUpsell_0 (copy), l_ApiFetchShowAgeVerificationOverlay_0 (copy), l_FetchUserGameVotes_0 (copy)
    local v21 = {};
    if l_ApiFetchGameDetails_0.GetFetchingStatus(v17:getState(), v18) ~= l_RetrievalStatus_0.Fetching and (v19 or v17:getState().GameDetails[v18] == nil) then
        table.insert(v21, v17:dispatch(l_ApiFetchGameDetails_0.Fetch(v16, {
            v18
        })));
    end;
    local v22 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v17:getState(), v18);
    if v19 or l_FFlagLuaAppVpcUpsell_0 and v20 or v22 == l_RetrievalStatus_0.NotStarted or v22 == l_RetrievalStatus_0.Failed then
        table.insert(v21, v17:dispatch(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v16, v18)));
    end;
    if game:GetEngineFeature("VoiceChatSupported") and l_ApiFetchShowAgeVerificationOverlay_0.GetFetchingStatus(v17:getState(), v18) ~= l_RetrievalStatus_0.Fetching and (v19 or v17:getState().ShowAgeVerificationOverlay[v18] == nil) then
        table.insert(v21, v17:dispatch(l_ApiFetchShowAgeVerificationOverlay_0.Fetch(v16, v18)));
    end;
    if l_FetchUserGameVotes_0.GetFetchingStatus(v17:getState(), v18) ~= l_RetrievalStatus_0.Fetching and (v19 or v17:getState().UserGameVotes[v18] == nil) then
        v17:dispatch(l_FetchUserGameVotes_0.Fetch(v16, v18));
    end;
    return v21;
end;
v15.IsLoading = function(v24, v25) --[[ Line: 81 ]] --[[ Name: IsLoading ]]
    -- upvalues: l_ApiFetchGameDetails_0 (copy), l_RetrievalStatus_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_ApiFetchShowAgeVerificationOverlay_0 (copy)
    local v26 = l_ApiFetchGameDetails_0.GetFetchingStatus(v24, v25);
    if v26 == l_RetrievalStatus_0.NotStarted or v26 == l_RetrievalStatus_0.Fetching then
        return true;
    else
        local v27 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v24, v25);
        if v27 == l_RetrievalStatus_0.NotStarted or v27 == l_RetrievalStatus_0.Fetching then
            return true;
        else
            if game:GetEngineFeature("VoiceChatSupported") then
                local v28 = l_ApiFetchShowAgeVerificationOverlay_0.GetFetchingStatus(v24, v25);
                if v28 == l_RetrievalStatus_0.NotStarted or v28 == l_RetrievalStatus_0.Fetching then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v15.Fetch = function(v29, v30, v31) --[[ Line: 116 ]] --[[ Name: Fetch ]]
    -- upvalues: l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), v23 (copy), l_FFlagLuaAppVpcUpsell_0 (copy), l_RunService_0 (copy), l_PromiseUtilities_0 (copy), l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 (copy), l_SetNextDataExpirationTime_0 (copy)
    return function(v32) --[[ Line: 117 ]]
        -- upvalues: l_NextDataExpirationTimeReducer_0 (ref), l_ExpirationTimeNamespace_0 (ref), v30 (copy), v23 (ref), v29 (copy), l_FFlagLuaAppVpcUpsell_0 (ref), v31 (copy), l_RunService_0 (ref), l_PromiseUtilities_0 (ref), l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 (ref), l_SetNextDataExpirationTime_0 (ref)
        local v33 = tick();
        local v34 = nil;
        local v35 = v32:getState().Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameDetailPlayability];
        if v35 then
            v34 = v35[v30];
        end;
        local v36 = false;
        if v34 == nil or v34 < v33 then
            v36 = true;
        end;
        local v37 = v23(v29, v32, v30, v36, if l_FFlagLuaAppVpcUpsell_0 then v31 else nil);
        if #v37 > 0 then
            local v38 = nil;
            if _G.__TESTEZ_RUNNING_TEST__ or l_RunService_0:IsStudio() then
                v38 = warn;
            end;
            return l_PromiseUtilities_0.Batch(v37, v38):andThen(function(v39) --[[ Line: 145 ]]
                -- upvalues: l_PromiseUtilities_0 (ref), v33 (ref), v34 (ref), l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 (ref), v32 (copy), l_SetNextDataExpirationTime_0 (ref), v30 (ref), l_ExpirationTimeNamespace_0 (ref)
                if l_PromiseUtilities_0.CountResults(v39).failureCount == 0 then
                    v33 = tick();
                    v34 = math.floor(v33 + l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0());
                    v32:dispatch(l_SetNextDataExpirationTime_0(v30, v34, l_ExpirationTimeNamespace_0.GameDetailPlayability));
                end;
            end);
        else
            return;
        end;
    end;
end;
return v15;