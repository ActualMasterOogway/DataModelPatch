local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_createFireEvent_0 = v1.Analytics.FireEvent.createFireEvent;
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local v5 = require(script.EventStreamActionList);
local v6 = require(script.DiagEventsList);
return {
    setupFireEvent = l_createFireEvent_0({
        EventStream = v5
    }), 
    EventNames = require(script.EventNames), 
    Analytics = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v5, 
            Diag = v6
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = l_DefaultAnalyticsService_0.Diag
        }
    }), 
    fireImpressionEvent = require(script.fireImpressionEvent), 
    getTileRowInSort = require(script.getTileRowInSort)
};