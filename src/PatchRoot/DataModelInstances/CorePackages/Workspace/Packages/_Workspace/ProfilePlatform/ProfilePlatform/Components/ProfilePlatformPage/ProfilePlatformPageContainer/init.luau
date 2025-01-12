local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_Parent_0.SocialLuaAnalytics);
local v8 = require(l_Parent_0.SocialStopwatch);
local v9 = require(l_Parent_0.Cryo);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v5.Hooks.useEffectOnMount;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local v14 = require(l_script_FirstAncestor_0.Components.ProfilePlatformPage.parseComponentsFromJson);
local v15 = require(l_script_FirstAncestor_0.Common.getInitialComponents);
local v16 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v17 = require(script.Parent.ProfilePlatformEventReceiver);
local v18 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v19 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v20 = require(l_script_FirstAncestor_0.Common.Enums);
local v21 = require(script.Parent.getFriendStatusFromProfileResponse);
local _ = require(l_Parent_0.SocialCommon);
local l_LoadingStages_0 = v7.Analytics.Enums.LoadingStages;
local l_FFlagProfilePlatformRemainingLogging_0 = v6.FFlagProfilePlatformRemainingLogging;
local l_FFlagProfilePlatformFixTelemetryEvents_0 = v6.FFlagProfilePlatformFixTelemetryEvents;
local l_FFlagContactInvitesInProfilePlatform_0 = v6.FFlagContactInvitesInProfilePlatform;
local v27 = require(script.Parent.ProfilePlatformPage);
local v28 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
return function() --[[ Line: 35 ]]
    -- upvalues: v16 (copy), v18 (copy), v2 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v4 (copy), l_useEffectOnMount_0 (copy), v15 (copy), v8 (copy), v19 (copy), l_LoadingStages_0 (copy), l_FFlagProfilePlatformFixTelemetryEvents_0 (copy), v28 (copy), v21 (copy), v20 (copy), l_FFlagProfilePlatformRemainingLogging_0 (copy), l_FFlagContactInvitesInProfilePlatform_0 (copy), v3 (copy), v9 (copy), v14 (copy), v17 (copy), l_dependencyArray_0 (copy), v27 (copy)
    local v29 = v16();
    local v30 = v18();
    local l_profileUserId_0 = v29.profileUserId;
    local l_profileType_0 = v29.profileType;
    local v33 = v2(v29, "sourceInfo.contextualInfoType");
    local v34 = l_useDispatch_0();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 44 ]]
        -- upvalues: v2 (ref), v4 (ref), l_profileUserId_0 (copy)
        return v2(v35, (("%*.Users.%*"):format(v4.RODUX_KEY, l_profileUserId_0))) or {};
    end);
    l_useEffectOnMount_0(function() --[[ Line: 48 ]]
        -- upvalues: v15 (ref), v33 (copy), v8 (ref), v30 (copy), v19 (ref), l_LoadingStages_0 (ref), l_FFlagProfilePlatformFixTelemetryEvents_0 (ref), v34 (copy), v28 (ref), l_profileUserId_0 (copy), l_profileType_0 (copy), v21 (ref), v29 (copy), v20 (ref), l_FFlagProfilePlatformRemainingLogging_0 (ref), l_FFlagContactInvitesInProfilePlatform_0 (ref)
        local v37 = v15(v33);
        local v38 = v8.Stopwatch.get(v8.Events.ProfileOpened);
        v30.fireAnalyticsEvent(v19.ProfileLoadingStage, {
            statValue = if v38 then v38.timeElapsed else nil, 
            status = l_LoadingStages_0.Fetching, 
            isProfilePlatform = l_FFlagProfilePlatformFixTelemetryEvents_0 and true or nil
        });
        v34(v28.API({
            profileId = l_profileUserId_0, 
            profileType = l_profileType_0, 
            components = v37, 
            includeComponentOrdering = true
        })):andThen(function(v39) --[[ Line: 64 ]]
            -- upvalues: v30 (ref), v19 (ref), v21 (ref), v29 (ref), v20 (ref), l_FFlagProfilePlatformRemainingLogging_0 (ref), l_FFlagContactInvitesInProfilePlatform_0 (ref)
            v30.fireAnalyticsEvent(v19.ProfilePageLoadedWithData, {
                friendStatus = v21(v39), 
                absolutePosition = v29.sourceInfo.homepageCarouselAbsolutePosition, 
                isHomePageCarousel = v29.sourceInfo.source == v20.Sources.HomepageFriendsCarousel, 
                source = v29.sourceInfo.source, 
                isRecommendation = if l_FFlagProfilePlatformRemainingLogging_0 then v29.sourceInfo.isRecommendation else nil, 
                recommendationContextType = if l_FFlagProfilePlatformRemainingLogging_0 then v29.sourceInfo.recommendationContextType else nil, 
                recommendationRank = if l_FFlagProfilePlatformRemainingLogging_0 then v29.sourceInfo.recommendationRank else nil, 
                recommendationSessionId = if l_FFlagProfilePlatformRemainingLogging_0 then v29.sourceInfo.recommendationSessionId else nil, 
                shareLinkId = if l_FFlagContactInvitesInProfilePlatform_0 then v29.sourceInfo.shareLinkId else nil
            });
        end):catch(function(_) --[[ Line: 88 ]]

        end);
    end);
    v3.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v8 (ref), v30 (copy), v19 (ref)
        return function() --[[ Line: 95 ]]
            -- upvalues: v8 (ref), v30 (ref), v19 (ref)
            v8.Stopwatch.stop(v8.Events.ProfileOpened);
            v30.fireAnalyticsEvent(v19.ProfileClosed);
        end;
    end, {});
    local v41 = v3.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: v9 (ref), v14 (ref), v36 (copy), v3 (ref), v17 (ref)
        return v9.Dictionary.union(v14(v36.components, v36.componentOrdering), {
            ProfilePlatformEventReceiver = v3.createElement(v17)
        });
    end, l_dependencyArray_0(v36.components, v36.componentOrdering));
    return v3.createElement(v27, {
        children = v41
    });
end;