local v0 = require(script.Parent.Parent.FireEvent.fireEventStream);
local v1 = require(script.Parent.Parent.FireEvent.fireDiagCounter);
local v2 = require(script.Parent.DiagEventList);
local v3 = require(script.Parent.EventStreamEventList);
local _ = require(script.Parent.Parent.FireEvent.Types);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v0 (copy), v3 (copy), v1 (copy), v2 (copy)
    local v6 = v0({
        eventStreamImpl = v5.analytics.EventStream, 
        eventList = v3, 
        loggerImpl = v5.loggerImpl, 
        infoForAllEvents = v5.infoForAllEvents
    });
    local v7 = v1({
        diagImpl = v5.analytics.Diag, 
        eventList = v2, 
        loggerImpl = v5.loggerImpl
    });
    return function(v8, v9) --[[ Line: 21 ]]
        -- upvalues: v3 (ref), v6 (copy), v2 (ref), v7 (copy)
        if v3[v8] then
            v6(v8, v9);
        end;
        if v2[v8] then
            v7(v8);
        end;
        return DateTime.now();
    end;
end;