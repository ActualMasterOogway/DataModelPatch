local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {
        StandardizedFields = {}, 
        sentEvents = {}, 
        sentCounters = {}, 
        sentStats = {}, 
        loggedEvents = {}
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.logEvent = function(v2, v3) --[[ Line: 16 ]] --[[ Name: logEvent ]]
    if v2.loggedEvents[v3] == nil then
        v2.loggedEvents[v3] = 0;
    end;
    local l_loggedEvents_0 = v2.loggedEvents;
    l_loggedEvents_0[v3] = l_loggedEvents_0[v3] + 1;
end;
v0.logEventOnce = function(v5, v6) --[[ Line: 23 ]] --[[ Name: logEventOnce ]]
    v5.loggedEvents[v6] = 1;
end;
v0.logRobloxTelemetryEvent = function(v7, v8, _, v10) --[[ Line: 27 ]] --[[ Name: logRobloxTelemetryEvent ]]
    table.insert(v7.sentEvents, {
        eventConfig = v8, 
        customFields = v10
    });
end;
v0.logRobloxTelemetryStat = function(v11, v12, v13, v14) --[[ Line: 31 ]] --[[ Name: logRobloxTelemetryStat ]]
    table.insert(v11.sentStats, {
        eventConfig = v12, 
        statValue = v13, 
        customFields = v14
    });
end;
v0.logRobloxTelemetryCounter = function(v15, v16, v17, v18) --[[ Line: 35 ]] --[[ Name: logRobloxTelemetryCounter ]]
    table.insert(v15.setCounters, {
        eventConfig = v16, 
        increment = v17, 
        customFields = v18
    });
end;
v0.mockGetSentEvents = function(v19) --[[ Line: 39 ]] --[[ Name: mockGetSentEvents ]]
    return v19.sentEvents;
end;
v0.mockGetSentCounters = function(v20) --[[ Line: 42 ]] --[[ Name: mockGetSentCounters ]]
    return v20.sentCounters;
end;
v0.mockGetSentStats = function(v21) --[[ Line: 45 ]] --[[ Name: mockGetSentStats ]]
    return v21.sentStats;
end;
v0.mockClearSentEvents = function(v22) --[[ Line: 48 ]] --[[ Name: mockClearSentEvents ]]
    v22.sentEvents = {};
end;
v0.mockClearSentCounters = function(v23) --[[ Line: 51 ]] --[[ Name: mockClearSentCounters ]]
    v23.sentCounters = {};
end;
v0.mockClearSentStats = function(v24) --[[ Line: 54 ]] --[[ Name: mockClearSentStats ]]
    v24.sentStats = {};
end;
return v0;