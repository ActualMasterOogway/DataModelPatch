local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local _ = require(l_script_FirstAncestor_0.Analytics.Enums.SupportedTelemetryBackends);
return function(v2) --[[ Line: 21 ]] --[[ Name: telemetryConfig ]]
    return {
        name = v2.name, 
        description = v2.description, 
        lastUpdated = v2.lastUpdated, 
        backendsList = v2.backendsList, 
        throttlingThousandths = v2.throttlingThousandths
    };
end;