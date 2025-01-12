local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserProfiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_script_FirstAncestor_0.Analytics.setupFireDiag);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v7 = require(l_script_FirstAncestor_0.Analytics.UserProfilesAnalytics);
local v8 = require(l_Parent_0.SocialCommon);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useApolloAutoRetry_0 = v8.Hooks.useApolloAutoRetry;
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_useEffectOnMount_0 = v4.Hooks.useEffectOnMount;
local l_useQuery_0 = require(l_Parent_0.ApolloClient).useQuery;
local v14 = game:DefineFastFlag("UserProfilesEnableRetries", false);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfilesLogCancelledRequests);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfilesLogErrorCodes);
local v17 = game:DefineFastInt("UserProfileDefaultRetryCount", 2);
local v18 = game:DefineFastFlag("UserProfilesFilterInvalidUserIds", false);
return function(v19) --[[ Line: 29 ]]
    -- upvalues: v18 (copy), v3 (copy), v2 (copy), l_useQuery_0 (copy), v14 (copy), l_useApolloAutoRetry_0 (copy), v17 (copy), v15 (copy), v5 (copy), v7 (copy), l_useEffectOnMount_0 (copy), v6 (copy), l_useEffectOnce_0 (copy), v16 (copy), l_getDeepValue_0 (copy)
    local v20 = nil;
    if v18 then
        v20 = v3.useMemo(function() --[[ Line: 36 ]]
            -- upvalues: v2 (ref), v19 (copy)
            return v2.List.filter(v19.userIds, function(v21) --[[ Line: 37 ]]
                return tonumber(v21) ~= nil;
            end);
        end, {
            v19.userIds
        });
    end;
    local v22 = l_useQuery_0(v19.query, {
        errorPolicy = "all", 
        variables = {
            userIds = if v18 then v20 else v19.userIds
        }
    });
    local l_v22_0 = v22;
    if v14 then
        l_v22_0 = l_useApolloAutoRetry_0(v22, {
            retryCount = if v19.overrideRetryCount then v19.overrideRetryCount else v17
        });
    end;
    local v24 = v3.useRef(l_v22_0.loading or l_v22_0.isRetrying);
    if v15 then
        v24.current = l_v22_0.loading or l_v22_0.isRetrying;
    end;
    local v25 = v3.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v5 (ref), v7 (ref)
        return v5({
            analytics = {
                Diag = v7.Diag
            }
        });
    end, {});
    local v26 = v3.useRef(DateTime.now());
    l_useEffectOnMount_0(function() --[[ Line: 75 ]]
        -- upvalues: v26 (copy), v25 (copy), v6 (ref)
        v26.current = DateTime.now();
        v25(v6.UserProfilesRequestBegin);
    end);
    if v14 then
        l_useEffectOnce_0(function() --[[ Line: 81 ]]
            -- upvalues: v26 (copy), v25 (copy), v6 (ref), v7 (ref), v16 (ref), l_getDeepValue_0 (ref), l_v22_0 (ref)
            local v27 = nil;
            if v26.current then
                v27 = DateTime.now().UnixTimestampMillis - v26.current.UnixTimestampMillis;
                v25(v6.UserProfilesRequestFail);
                v7.Diag:reportStats(v6.UserProfilesRequestFailDuration, v27);
                if v16 then
                    local v28 = l_getDeepValue_0(l_v22_0, "error.graphQLErrors");
                    if v28 then
                        local v29 = v28[1] or {};
                        local v30 = l_getDeepValue_0(v29, "extensions.status");
                        v25(v6.UserProfilesErrorCode, {
                            status = v30
                        });
                    end;
                end;
            end;
        end, l_v22_0.error);
        l_useEffectOnce_0(function() --[[ Line: 102 ]]
            -- upvalues: v26 (copy), l_v22_0 (ref), v25 (copy), v6 (ref), v7 (ref), v16 (ref), l_getDeepValue_0 (ref)
            local v31 = nil;
            if v26.current then
                v31 = DateTime.now().UnixTimestampMillis - v26.current.UnixTimestampMillis;
                if l_v22_0.data and l_v22_0.retryCount == 0 then
                    v25(v6.UserProfilesRequestSuccess);
                    v7.Diag:reportStats(v6.UserProfilesRequestSuccessDuration, v31);
                    return;
                elseif l_v22_0.data then
                    v25(v6.UserProfilesRequestSuccessAfterRetry);
                    v7.Diag:reportStats(v6.UserProfilesRequestSuccessAfterRetry, v31);
                    return;
                else
                    v25(v6.UserProfilesRequestFailAfterRetry);
                    v7.Diag:reportStats(v6.UserProfilesRequestFailAfterRetryDuration, v31);
                    if v16 then
                        local v32 = l_getDeepValue_0(l_v22_0, "error.graphQLErrors");
                        if v32 then
                            local v33 = v32[1] or {};
                            local v34 = l_getDeepValue_0(v33, "extensions.status");
                            v25(v6.UserProfilesErrorCode, {
                                status = v34
                            });
                        end;
                    end;
                end;
            end;
        end, if v15 then not v24.current else l_v22_0.loading == false and l_v22_0.isRetrying == false);
    end;
    if v15 then
        v3.useEffect(function() --[[ Line: 145 ]]
            -- upvalues: v24 (copy), v25 (copy), v6 (ref)
            return function() --[[ Line: 146 ]]
                -- upvalues: v24 (ref), v25 (ref), v6 (ref)
                if v24.current then
                    v25(v6.UserProfilesUnmountEarly);
                end;
            end;
        end, {});
    end;
    return l_v22_0;
end;