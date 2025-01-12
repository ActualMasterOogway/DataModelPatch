local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialStopwatch);
local v3 = require(l_Parent_1.SharedFlags);
local v4 = require(l_Parent_1.SocialLuaAnalytics);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_0.dependencies);
local v7 = require(script.Parent.SetAliasModal);
local v8 = require(l_Parent_0.Common.Constants);
local v9 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v9.EventNames;
local l_useAnalytics_0 = v9.useAnalytics;
local l_LoadingStages_0 = v4.Analytics.Enums.LoadingStages;
local l_React_0 = v6.React;
local l_NetworkingAliases_0 = v6.NetworkingAliases;
local l_getDeepValue_0 = v6.SocialLibraries.Dictionary.getDeepValue;
local l_useSelector_0 = v6.Hooks.useSelector;
local l_useDispatch_0 = v6.Hooks.useDispatch;
local l_useEffectOnMount_0 = v6.Hooks.useEffectOnMount;
local l_useUserProfilesFetch_0 = v6.UserProfiles.Hooks.useUserProfilesFetch;
local l_userProfilesAllNamesByUserIds_0 = v6.UserProfiles.Queries.userProfilesAllNamesByUserIds;
local l_writeNamesQuery_0 = v6.UserProfiles.Mutations.writeNamesQuery;
local l_useEffectOnce_0 = v5.Hooks.useEffectOnce;
local l_FFlagSetAliasTracking_0 = v3.FFlagSetAliasTracking;
local v24 = {
    Moderated = "Moderated", 
    Success = "Success"
};
return function(v25) --[[ Line: 49 ]]
    -- upvalues: l_useDispatch_0 (copy), v8 (copy), l_React_0 (copy), l_useUserProfilesFetch_0 (copy), l_userProfilesAllNamesByUserIds_0 (copy), l_useAnalytics_0 (copy), l_FFlagSetAliasTracking_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useEffectOnMount_0 (copy), l_EventNames_0 (copy), v2 (copy), l_LoadingStages_0 (copy), l_useEffectOnce_0 (copy), l_NetworkingAliases_0 (copy), v24 (copy), l_writeNamesQuery_0 (copy), v7 (copy)
    local v26 = l_useDispatch_0();
    local v27 = v25.navigation.getParam(v8.PROFILE_USER_ID);
    local v28, v29 = l_React_0.useState(false);
    local v30 = l_useUserProfilesFetch_0({
        userIds = {
            v27
        }, 
        query = l_userProfilesAllNamesByUserIds_0
    });
    local v31 = l_useAnalytics_0();
    if l_FFlagSetAliasTracking_0 then
        v31 = l_useAnalytics_0();
    end;
    local v33 = l_useSelector_0(function(v32) --[[ Line: 62 ]]
        return v32.ScreenSize;
    end);
    local v34 = (l_getDeepValue_0(v30, "data.userProfiles") or {})[1] or {};
    local v35 = l_getDeepValue_0(v34, "names.alias");
    local v36 = l_getDeepValue_0(v34, "names.displayName");
    l_useEffectOnMount_0(function() --[[ Line: 72 ]]
        -- upvalues: v31 (ref), l_EventNames_0 (ref)
        if v31 then
            v31.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalOpened);
        end;
    end);
    if l_FFlagSetAliasTracking_0 then
        l_React_0.useEffect(function() --[[ Line: 79 ]]
            -- upvalues: v2 (ref), v31 (ref), l_EventNames_0 (ref), l_LoadingStages_0 (ref)
            local v37 = v2.Stopwatch.get(v2.Events.CustomizeNameOpened);
            v31.fireAnalyticsEvent(l_EventNames_0.CustomizeNameLoadingStage, {
                status = l_LoadingStages_0.Fetching, 
                statValue = v37 and v37.timeElapsed
            });
            return function() --[[ Line: 86 ]]
                -- upvalues: v2 (ref)
                v2.Stopwatch.stop(v2.Events.CustomizeNameOpened);
            end;
        end, {});
        l_useEffectOnce_0(function() --[[ Line: 91 ]]
            -- upvalues: v2 (ref), v31 (ref), l_EventNames_0 (ref), v30 (copy), l_LoadingStages_0 (ref)
            local v38 = v2.Stopwatch.get(v2.Events.CustomizeNameOpened);
            v31.fireAnalyticsEvent(l_EventNames_0.CustomizeNameLoadingStage, {
                status = if v30.data then l_LoadingStages_0.Done else l_LoadingStages_0.Failed, 
                statValue = v38 and v38.timeElapsed
            });
        end, v30.data or v30.error);
    end;
    local function v39() --[[ Line: 100 ]]
        -- upvalues: v25 (copy)
        v25.navigation.pop();
    end;
    local function v42(v40) --[[ Line: 104 ]]
        -- upvalues: v26 (copy), l_NetworkingAliases_0 (ref), v27 (copy), l_getDeepValue_0 (ref), v24 (ref), v29 (copy), v31 (ref), l_EventNames_0 (ref), l_writeNamesQuery_0 (ref), v30 (copy), l_userProfilesAllNamesByUserIds_0 (ref), v34 (copy), v25 (copy)
        return v26(l_NetworkingAliases_0.SetUserTag.API(v27, v40)):andThen(function(v41) --[[ Line: 105 ]]
            -- upvalues: l_getDeepValue_0 (ref), v24 (ref), v29 (ref), v31 (ref), l_EventNames_0 (ref), v40 (copy), l_writeNamesQuery_0 (ref), v30 (ref), l_userProfilesAllNamesByUserIds_0 (ref), v27 (ref), v34 (ref), v25 (ref)
            if l_getDeepValue_0(v41, "responseBody.status") == v24.Moderated then
                v29(true);
                if v31 then
                    v31.fireAnalyticsEvent(l_EventNames_0.CustomizeNameSaveAttemptInvalidInput, {
                        alias = v40
                    });
                end;
                return;
            else
                if v31 then
                    v31.fireAnalyticsEvent(l_EventNames_0.CustomizeNameSaved, {
                        alias = v40
                    });
                end;
                l_writeNamesQuery_0({
                    client = v30.client, 
                    query = l_userProfilesAllNamesByUserIds_0, 
                    userId = v27, 
                    names = {
                        alias = v40, 
                        contactName = l_getDeepValue_0(v34, "names.contactName"), 
                        displayName = l_getDeepValue_0(v34, "names.displayName"), 
                        username = l_getDeepValue_0(v34, "names.username")
                    }
                });
                v25.navigation.pop();
                return;
            end;
        end);
    end;
    return l_React_0.createElement(v7, {
        screenSize = v33, 
        alias = v35, 
        displayName = v36, 
        cancelOnActivated = v39, 
        saveOnActivated = v42, 
        hasSaveAliasError = v28, 
        onTextChanged = function() --[[ Line: 137 ]]
            -- upvalues: v28 (copy), v29 (copy)
            if v28 then
                v29(false);
            end;
        end, 
        isLoading = v30.loading
    });
end;