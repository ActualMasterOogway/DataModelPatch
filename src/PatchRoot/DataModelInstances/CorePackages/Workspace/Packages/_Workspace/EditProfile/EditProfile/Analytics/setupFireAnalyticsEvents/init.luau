local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(l_Parent_0.SharedFlags);
local l_fireDiagCounter_0 = v1.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = v1.Analytics.FireEvent.fireEventStream;
local _ = require(script.Parent.Enums.EventNames);
local l_FFlagEditProfileAddLoadingTracker_0 = v2.FFlagEditProfileAddLoadingTracker;
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local v8 = require(script.Parent.DiagActionList);
local v9 = require(script.Parent.EventStreamActionList);
local v10 = require(script.Parent.TelemetryActionList);
if l_FFlagEditProfileAddLoadingTracker_0 then
    return function(v11) --[[ Line: 22 ]]
        -- upvalues: l_AnalyticsFactory_0 (copy), v9 (copy), v8 (copy), v10 (copy)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v9, 
                Diag = v8, 
                Telemetry = v10
            }, 
            analyticsImpl = v11.analytics
        })(v11).fireAnalyticsEvent;
    end;
else
    return function(v12) --[[ Line: 39 ]]
        -- upvalues: l_fireEventStream_0 (copy), v9 (copy), l_fireDiagCounter_0 (copy), v8 (copy)
        local v13 = l_fireEventStream_0({
            eventStreamImpl = v12.analytics.EventStream, 
            eventList = v9, 
            infoForAllEvents = v12.infoForAllEvents
        });
        local v14 = l_fireDiagCounter_0({
            diagImpl = v12.analytics.Diag, 
            eventList = v8
        });
        return function(v15, v16) --[[ Line: 54 ]]
            -- upvalues: v8 (ref), v14 (copy), v13 (copy)
            if v8[v15] then
                v14(v15);
            end;
            return v13(v15, v16);
        end;
    end;
end;