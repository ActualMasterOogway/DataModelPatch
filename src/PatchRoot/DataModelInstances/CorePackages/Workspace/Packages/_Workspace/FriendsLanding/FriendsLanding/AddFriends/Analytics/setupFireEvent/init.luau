local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local l_createFireEvent_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.FireEvent.createFireEvent;
local v2 = require(script.Parent.EventStreamActionList);
local v3 = require(script.Parent.DiagActionList);
local v4 = require(script.Parent.TelemetryActionList);
return (l_createFireEvent_0({
    EventStream = v2, 
    Diag = v3, 
    Telemetry = v4
}));