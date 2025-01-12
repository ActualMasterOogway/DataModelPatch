local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TestingAnalytics_0 = require(l_Parent_0.SocialLuaAnalytics).TestingAnalytics;
local l_mockAnalytics_0 = l_TestingAnalytics_0.mockAnalytics;
local l_mockLogger_0 = l_TestingAnalytics_0.mockLogger;
local l_setupFireEvent_0 = require(l_script_FirstAncestor_0.Analytics).setupFireEvent;
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: l_mockAnalytics_0 (copy), l_mockLogger_0 (copy), l_setupFireEvent_0 (copy)
    local v8 = if v6 and v6.uid then v6.uid else "123";
    local v9 = l_mockAnalytics_0(v7);
    local v10 = l_mockLogger_0(v7);
    local v11 = l_setupFireEvent_0({
        analytics = v9, 
        loggerImpl = l_mockLogger_0, 
        infoForAllEvents = {
            uid = v8
        }
    });
    return {
        uid = v8, 
        value = {
            fireEvent = v11
        }, 
        mockLogger = v10, 
        analyticsMock = v9
    };
end;