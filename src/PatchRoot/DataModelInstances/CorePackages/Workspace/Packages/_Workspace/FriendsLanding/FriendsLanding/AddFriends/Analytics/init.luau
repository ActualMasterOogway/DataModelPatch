local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local l_createFireEvent_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.FireEvent.createFireEvent;
local v2 = require(script.EventStreamActionList);
local v3 = require(script.DiagActionList);
local v4 = require(script.TelemetryActionList);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
return {
    setupFireEvent = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else l_createFireEvent_0({
        EventStream = v2, 
        Diag = v3, 
        Telemetry = v4
    }), 
    AnalyticsSetup = if l_FFlagAddFriendsMigrateAnalytics_0 then require(script.AnalyticsSetup) else nil, 
    EventNames = require(script.EventNames), 
    Namespaces = require(script.Namespaces)
};