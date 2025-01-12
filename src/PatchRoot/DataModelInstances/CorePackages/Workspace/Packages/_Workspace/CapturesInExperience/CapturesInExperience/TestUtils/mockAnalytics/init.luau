local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_mockAnalytics_0 = require(l_Parent_1.SocialLuaAnalytics).TestingAnalytics.mockAnalytics;
local v3 = require(l_Parent_0.Analytics.setupFireEvent);
return function(v4, v5) --[[ Line: 17 ]]
    -- upvalues: l_mockAnalytics_0 (copy), v3 (copy)
    local v6 = l_mockAnalytics_0(v5);
    local v7 = if v4 and v4.pid then v4.pid else "1818";
    local v8 = if v4 and v4.source then v4.source else "mock";
    local v9 = if v4 and v4.uid then v4.uid else "101";
    local v10 = v3({
        analytics = v6, 
        infoForAllEvents = {
            isUnder13 = false, 
            pid = v7, 
            source = v8, 
            uid = v9
        }
    });
    return {
        analyticsMock = v6, 
        fireAnalyticsEvent = v10, 
        uid = v9
    };
end;