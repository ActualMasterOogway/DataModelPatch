local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Navigation);
local v4 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v5 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.useMapJsonToProfileActions);
local v6 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBar);
local l_useNavigation_0 = v3.useNavigation;
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local v9 = require(l_script_FirstAncestor_0.Common.Constants);
local v10 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v11 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v13 = require(l_Parent_0.SocialStopwatch);
local v14 = require(l_script_FirstAncestor_0.Analytics.LoadingStagesExtension);
local l_FFlagProfilePlatformFixTelemetryEvents_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformFixTelemetryEvents;
return function(v16) --[[ Line: 24 ]] --[[ Name: ProfileActionBarContainer ]]
    -- upvalues: v4 (copy), l_useNavigation_0 (copy), v10 (copy), v2 (copy), v11 (copy), v8 (copy), v9 (copy), v5 (copy), l_useEffectOnMount_0 (copy), v13 (copy), v14 (copy), l_FFlagProfilePlatformFixTelemetryEvents_0 (copy), v6 (copy)
    local l_profileUserId_0 = v4().profileUserId;
    local v18 = l_useNavigation_0();
    local v19 = v10();
    local v20, v21 = v2.useState(false);
    local v22 = v2.useRef(nil);
    local v23 = v2.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v19 (copy), v11 (ref), v18 (copy), v8 (ref), v9 (ref), v21 (copy), v22 (copy)
        v19.fireAnalyticsEvent(v11.ContextualMenuButton);
        v18.navigate(v8.Screens.ContextualMenu, {
            [v9.Navigation.ON_CLOSE] = function() --[[ Line: 36 ]]
                -- upvalues: v21 (ref)
                v21(false);
            end, 
            [v9.Navigation.GET_ROOT_ELEMENT_REF] = function() --[[ Line: 39 ]]
                -- upvalues: v22 (ref)
                return v22.current;
            end
        });
        v21(true);
    end, {
        v18
    });
    local v24, v25 = v5(l_profileUserId_0);
    l_useEffectOnMount_0(function() --[[ Line: 49 ]]
        -- upvalues: v13 (ref), v19 (copy), v11 (ref), v14 (ref), l_FFlagProfilePlatformFixTelemetryEvents_0 (ref)
        local v26 = v13.Stopwatch.get(v13.Events.ProfileOpened);
        v19.fireAnalyticsEvent(v11.ProfileLoadingStage, {
            statValue = if v26 then v26.timeElapsed else nil, 
            status = v14.CTALoaded, 
            isProfilePlatform = l_FFlagProfilePlatformFixTelemetryEvents_0 and true or nil
        });
    end);
    return v2.createElement(v6, {
        isContextualMenuOpen = v20, 
        layoutOrder = v16.layoutOrder, 
        openContextualMenu = if v25 then v23 else nil, 
        profileActions = v24, 
        moreButtonRef = v22
    });
end;