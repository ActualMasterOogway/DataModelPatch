local l_Parent_0 = script.Parent.Parent;
local l_SocialLuaAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics;
local v2 = require(script.Parent.DiagEvents);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v5 = require(script.Parent.AnalyticsEvents);
local v6 = require(l_Parent_0.Flags.SelfViewProfileDiscoverabilityUpsellIXP);
return function(v7) --[[ Line: 12 ]]
    -- upvalues: l_fireEventStream_0 (copy), v6 (copy), v5 (copy), l_fireDiagCounter_0 (copy), v2 (copy)
    local v8 = l_fireEventStream_0({
        eventStreamImpl = if v6.SetupEnabled() and v7.analytics then v7.analytics.EventStream else v7.eventStreamImpl, 
        eventList = v5, 
        infoForAllEvents = v7.defaultAnalyticsInfo
    });
    local v9 = l_fireDiagCounter_0({
        diagImpl = if v6.SetupEnabled() and v7.analytics then v7.analytics.Diag else v7.diag, 
        eventList = v2
    });
    return function(v10, v11) --[[ Line: 34 ]]
        -- upvalues: v9 (copy), v8 (copy)
        v9(v10);
        v8(v10, v11);
    end;
end;