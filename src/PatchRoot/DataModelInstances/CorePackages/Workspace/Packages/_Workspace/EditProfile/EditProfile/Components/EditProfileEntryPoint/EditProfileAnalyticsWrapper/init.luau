local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local l_DefaultAnalyticsService_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.DefaultAnalyticsService;
local l_FFlagEditProfileAddLoadingTracker_0 = v4.FFlagEditProfileAddLoadingTracker;
local v8 = require(script.Parent.EditProfileEntryPointContainer);
return function(v9) --[[ Line: 14 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v2 (copy), v5 (copy), l_FFlagEditProfileAddLoadingTracker_0 (copy), l_DefaultAnalyticsService_0 (copy), v8 (copy)
    local v10 = l_useLocalUserId_0();
    return v2.createElement(v5.Context.Provider, {
        value = {
            fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                analytics = if l_FFlagEditProfileAddLoadingTracker_0 then l_DefaultAnalyticsService_0 else v5.AnalyticsService, 
                infoForAllEvents = {
                    uid = v10
                }
            })
        }
    }, {
        v2.createElement(v8, v9)
    });
end;