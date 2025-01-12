local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_SocialLuaAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics;
local v3 = require(l_Parent_1.SharedFlags);
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local v6 = require(script.Parent.TelemetryActionList);
local v7 = require(script.Parent.DiagActionList);
local v8 = require(script.Parent.EventStreamActionList);
local l_AnalyticsFactory_0 = l_SocialLuaAnalytics_0.Analytics.AnalyticsFactory;
local _ = require(script.Parent.Enums.EventNames);
if v3.FFlagSetAliasTracking then
    return function(v11) --[[ Line: 23 ]]
        -- upvalues: l_AnalyticsFactory_0 (copy), v8 (copy), v7 (copy), v6 (copy)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v8, 
                Diag = v7, 
                Telemetry = v6
            }, 
            analyticsImpl = v11.analytics
        })(v11).fireAnalyticsEvent;
    end;
else
    return function(v12) --[[ Line: 40 ]]
        -- upvalues: l_fireEventStream_0 (copy), v8 (copy), l_fireDiagCounter_0 (copy), v7 (copy)
        local v13 = l_fireEventStream_0({
            eventStreamImpl = v12.analytics.EventStream, 
            eventList = v8, 
            infoForAllEvents = v12.infoForAllEvents
        });
        local v14 = l_fireDiagCounter_0({
            diagImpl = v12.analytics.Diag, 
            eventList = v7
        });
        return function(v15, v16) --[[ Line: 55 ]]
            -- upvalues: v7 (ref), v14 (copy), v13 (copy)
            if v7[v15] then
                v14(v15);
            end;
            return v13(v15, v16);
        end;
    end;
end;