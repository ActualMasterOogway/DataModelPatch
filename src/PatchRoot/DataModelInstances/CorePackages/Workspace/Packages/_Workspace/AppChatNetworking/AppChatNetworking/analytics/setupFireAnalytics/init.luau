local l_Parent_0 = script:FindFirstAncestor("AppChatNetworking").Parent;
local l_fireTelemetry_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.FireEvent.fireTelemetry;
local v2 = require(script.Parent.TelemetryActionList);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: l_fireTelemetry_0 (copy), v2 (copy)
    local v4 = l_fireTelemetry_0({
        telemetryImpl = v3.analytics.Telemetry, 
        eventList = v2
    });
    return function(v5, v6) --[[ Line: 19 ]]
        -- upvalues: v4 (copy)
        v4(v5, v6);
    end;
end;