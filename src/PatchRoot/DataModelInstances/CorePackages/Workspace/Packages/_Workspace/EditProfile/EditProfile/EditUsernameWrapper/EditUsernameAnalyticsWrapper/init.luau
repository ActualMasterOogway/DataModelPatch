local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_script_FirstAncestor_0.Analytics);
local l_DefaultAnalyticsService_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.DefaultAnalyticsService;
local l_FFlagEditProfileAddLoadingTracker_0 = v5.FFlagEditProfileAddLoadingTracker;
local v9 = require(script.Parent.EditUsernameWrapper);
return function(v10) --[[ Line: 16 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v4 (copy), v2 (copy), v6 (copy), l_FFlagEditProfileAddLoadingTracker_0 (copy), l_DefaultAnalyticsService_0 (copy), v9 (copy)
    local v11 = l_useLocalUserId_0();
    if v4.useIsExperimentEnabled() then
        return v2.createElement(v6.Context.Provider, {
            value = {
                fireAnalyticsEvent = v6.setupFireAnalyticsEvents({
                    analytics = if l_FFlagEditProfileAddLoadingTracker_0 then l_DefaultAnalyticsService_0 else v6.AnalyticsService, 
                    infoForAllEvents = {
                        uid = v11
                    }
                })
            }
        }, {
            v2.createElement(v9, v10)
        });
    else
        return v2.createElement(v9, v10);
    end;
end;