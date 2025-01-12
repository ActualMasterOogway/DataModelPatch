local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialLuaAnalytics);
local v3 = require(l_Parent_1.SharedFlags);
local v4 = require(l_Parent_0.dependencies);
local l_React_0 = v4.React;
local l_useLocalUserId_0 = v4.Hooks.useLocalUserId;
local v7 = require(l_Parent_0.Analytics);
local v8 = require(l_Parent_0.Common.Constants);
local l_DefaultAnalyticsService_0 = v2.Analytics.DefaultAnalyticsService;
local l_FFlagSetAliasTracking_0 = v3.FFlagSetAliasTracking;
local v11 = require(script.Parent.SetAliasModalContainer);
return function(v12) --[[ Line: 18 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_React_0 (copy), v7 (copy), l_FFlagSetAliasTracking_0 (copy), l_DefaultAnalyticsService_0 (copy), v8 (copy), v11 (copy)
    local v13 = l_useLocalUserId_0();
    return l_React_0.createElement(v7.Context.Provider, {
        value = {
            fireAnalyticsEvent = v7.setupFireAnalyticsEvents({
                analytics = if l_FFlagSetAliasTracking_0 then l_DefaultAnalyticsService_0 else v7.AnalyticsService, 
                infoForAllEvents = {
                    uid = v13, 
                    origin = v12.navigation.getParam(v8.ORIGIN)
                }
            })
        }
    }, {
        l_React_0.createElement(v11, v12)
    });
end;