local l_Parent_0 = script.Parent.Parent;
local l_TestingAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics.TestingAnalytics;
local l_mockAnalytics_0 = l_TestingAnalytics_0.mockAnalytics;
local l_mockLogger_0 = l_TestingAnalytics_0.mockLogger;
local l_setupFireEvent_0 = require(l_Parent_0.Analytics).setupFireEvent;
return function(v5, v6) --[[ Line: 11 ]]
    -- upvalues: l_mockAnalytics_0 (copy), l_mockLogger_0 (copy), l_setupFireEvent_0 (copy)
    local v7 = if v5 and v5.uid then v5.uid else "123";
    local v8 = l_mockAnalytics_0(v6 or {
        fn = function() --[[ Line: 13 ]] --[[ Name: fn ]]

        end
    });
    local v9 = l_mockLogger_0(v6 or {
        fn = function() --[[ Line: 14 ]] --[[ Name: fn ]]

        end
    });
    local v10 = l_setupFireEvent_0({
        analytics = v8, 
        loggerImpl = l_mockLogger_0, 
        infoForAllEvents = {
            uid = v7
        }
    });
    return {
        uid = v7, 
        value = {
            fireEvent = v10
        }, 
        mockLogger = v9, 
        analyticsMock = v8
    };
end;