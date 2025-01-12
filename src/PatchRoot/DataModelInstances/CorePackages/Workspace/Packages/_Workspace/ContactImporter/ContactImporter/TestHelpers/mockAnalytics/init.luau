local l_Parent_0 = script.Parent.Parent;
local l_TestingAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics.TestingAnalytics;
local l_mockAnalytics_0 = l_TestingAnalytics_0.mockAnalytics;
local l_mockLogger_0 = l_TestingAnalytics_0.mockLogger;
local l_setupFireAnalyticsEvents_0 = require(l_Parent_0.Analytics).setupFireAnalyticsEvents;
return function(v5, v6) --[[ Line: 11 ]]
    -- upvalues: l_mockAnalytics_0 (copy), l_mockLogger_0 (copy), l_setupFireAnalyticsEvents_0 (copy)
    local v7 = if v5 and v5.uid then v5.uid else "123";
    local v8 = l_mockAnalytics_0(v6);
    local v9 = l_mockLogger_0(v6);
    local v10 = l_setupFireAnalyticsEvents_0({
        diag = v8.Diag, 
        eventStreamImpl = v8.EventStream, 
        loggerImpl = l_mockLogger_0, 
        infoForAllEvents = {
            uid = v7
        }
    });
    return {
        uid = v7, 
        value = {
            fireAnalyticsEvent = v10, 
            entryPoint = nil
        }, 
        mockLogger = v9, 
        analyticsMock = v8
    };
end;