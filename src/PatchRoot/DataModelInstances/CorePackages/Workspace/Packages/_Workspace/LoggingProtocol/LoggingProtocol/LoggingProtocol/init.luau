local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_MessageBus_0 = require(l_Parent_1.MessageBus).MessageBus;
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.ArgCheck);
local _ = require(l_Parent_0.LoggingProtocolTypes);
local l_callOnce_0 = require(l_Parent_1.AppCommonLib).callOnce;
game:DefineFastFlag("EnableTelemetryProtocol", false);
getDomainName = function() --[[ Line: 79 ]] --[[ Name: getDomainName ]]
    if game:GetFastFlag("EnableTelemetryProtocol") then
        return "Telemetry";
    else
        return "Logging";
    end;
end;
local v7 = {
    UNSPECIFIED = "UNSPECIFIED", 
    EventIngest = "EventIngest", 
    Points = "Points", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat", 
    Counter = "RobloxTelemetryCounter", 
    Stats = "RobloxTelemetryStat"
};
local v8 = {
    addPlaceId = "addPlaceId", 
    addUniverseId = "addUniverseId", 
    addPlaceInstanceId = "addPlaceInstanceId", 
    addSessionId = "addSessionId", 
    addOsInfo = "addOSInfo"
};
local v9 = v3.strictInterface({
    eventName = v3.string, 
    timestamp = v3.optional(v3.number), 
    metadata = v3.optional(v3.keys(v3.string))
});
local v10 = {
    TelemetryBackends = v7, 
    StandardizedFields = v8, 
    LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "logEventWithTimestamp"), 
        validateParams = v9
    }, 
    GET_TIMESTAMP_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "getTimestamp"), 
        validateParams = v3.table
    }, 
    LOG_EVENT_FROM_LUA_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "logEventFromLua"), 
        validateParams = v3.interface({
            eventType = v3.string, 
            config = v3.optional(v3.strictInterface({
                eventName = v3.string, 
                backends = v3.array(v3.valueOf(v7)), 
                throttlingPercentage = v3.optional(v3.number), 
                lastUpdated = v3.optional(v3.array(v3.integer)), 
                description = v3.optional(v3.string), 
                links = v3.optional(v3.string)
            })), 
            data = v3.optional(v3.table)
        })
    }
};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v10 (copy)
    local v12 = {
        messageBus = v11 or l_MessageBus_0, 
        durationLoggerListener = nil
    };
    setmetatable(v12, v10);
    return v12;
end;
v10.setDurationLoggerListener = function(v13, v14) --[[ Line: 156 ]] --[[ Name: setDurationLoggerListener ]]
    v13.durationLoggerListener = v14;
end;
v10.logEventWithTimestamp = function(v15, v16, v17, v18) --[[ Line: 160 ]] --[[ Name: logEventWithTimestamp ]]
    -- upvalues: v4 (copy)
    v4.isType(v16, "string", "eventName");
    v4.isType(v17, "number", "timestamp");
    local v19 = {
        eventName = v16, 
        timestamp = v17, 
        metadata = v18
    };
    v15.messageBus.call(v15.LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR, v19);
    if v15.durationLoggerListener then
        v15.durationLoggerListener(v16);
    end;
end;
v10.logEvent = function(v20, v21, v22) --[[ Line: 174 ]] --[[ Name: logEvent ]]
    -- upvalues: v4 (copy)
    v4.isType(v21, "string", "eventName");
    v20:logEventWithTimestamp(v21, 0, v22);
end;
v10.logEventOnce = function(v23, v24, v25) --[[ Line: 179 ]] --[[ Name: logEventOnce ]]
    -- upvalues: v4 (copy), l_callOnce_0 (copy)
    v4.isType(v24, "string", "eventName");
    l_callOnce_0(string.format("logging_protocol_key-%s", v24), function() --[[ Line: 182 ]]
        -- upvalues: v23 (copy), v24 (copy), v25 (copy)
        v23:logEvent(v24, v25);
    end);
end;
v10.getTimestamp = function(v26) --[[ Line: 188 ]] --[[ Name: getTimestamp ]]
    return v26.messageBus.call(v26.GET_TIMESTAMP_DESCRIPTOR, {});
end;
v10.logRobloxTelemetryCounter = function(v27, v28, v29, v30) --[[ Line: 192 ]] --[[ Name: logRobloxTelemetryCounter ]]
    local v31 = {
        eventType = "RobloxTelemetryCounter", 
        config = v28, 
        data = if v29 then {
            incrementValue = v29, 
            customFields = v30
        } else if v30 then {
            customFields = v30
        } else nil
    };
    v27.messageBus.call(v27.LOG_EVENT_FROM_LUA_DESCRIPTOR, v31);
end;
v10.logRobloxTelemetryStat = function(v32, v33, v34, v35) --[[ Line: 214 ]] --[[ Name: logRobloxTelemetryStat ]]
    local v36 = {
        eventType = "RobloxTelemetryStat", 
        config = v33, 
        data = {
            statValue = v34, 
            customFields = v35
        }
    };
    v32.messageBus.call(v32.LOG_EVENT_FROM_LUA_DESCRIPTOR, v36);
end;
v10.logRobloxTelemetryEvent = function(v37, v38, v39, v40, v41) --[[ Line: 230 ]] --[[ Name: logRobloxTelemetryEvent ]]
    local v42 = {
        eventType = "RobloxTelemetry", 
        config = v38, 
        data = {
            standardizedFields = v39, 
            customFields = v40, 
            eventContext = v41
        }
    };
    v37.messageBus.call(v37.LOG_EVENT_FROM_LUA_DESCRIPTOR, v42);
end;
v10.logEphemeralCounterEvent = function(v43, v44, v45) --[[ Line: 248 ]] --[[ Name: logEphemeralCounterEvent ]]
    local v46 = {
        eventType = "EphemeralCounter", 
        config = v44, 
        data = if v45 then {
            incrementValue = v45
        } else nil
    };
    v43.messageBus.call(v43.LOG_EVENT_FROM_LUA_DESCRIPTOR, v46);
end;
v10.logEphemeralStatEvent = function(v47, v48, v49) --[[ Line: 262 ]] --[[ Name: logEphemeralStatEvent ]]
    local v50 = {
        eventType = "EphemeralStat", 
        config = v48, 
        data = {
            statValue = v49
        }
    };
    v47.messageBus.call(v47.LOG_EVENT_FROM_LUA_DESCRIPTOR, v50);
end;
v10.default = v10.new();
return v10;