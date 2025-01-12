local l_Parent_0 = script:FindFirstAncestor("IntervalPerformanceTracker").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_RunService_0 = require(l_Parent_0.MockableProxyServices).RunService;
local v3 = require(script.Parent.IntervalPerformanceTrackerTelemetryConfig);
game:DefineFastFlag("DebugPrintIntervalPerformanceTrackerResults", false);
local l_GetFFlagFixInvertedIntervalFPSMetric_0 = require(l_Parent_0.SharedFlags).GetFFlagFixInvertedIntervalFPSMetric;
local l_GetFIntIntervalPerformanceTrackerEventStream_0 = require(l_Parent_0.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream;
local v6 = math.random(0, 1000) < l_GetFIntIntervalPerformanceTrackerEventStream_0();
local v16 = {
    averageFPS = {
        reducer = function(v7) --[[ Line: 51 ]] --[[ Name: reducer ]]
            return {
                framesCount = v7.framesCount == nil and 0 or v7.framesCount + 1, 
                startTime = v7.startTime or tick()
            };
        end, 
        getResult = function(v8) --[[ Line: 57 ]] --[[ Name: getResult ]]
            -- upvalues: l_GetFFlagFixInvertedIntervalFPSMetric_0 (copy)
            if l_GetFFlagFixInvertedIntervalFPSMetric_0() then
                local v9 = tick();
                if v8.framesCount == nil or v8.framesCount == 0 or v8.startTime == nil or v9 == v8.startTime then
                    return nil;
                else
                    return v8.framesCount / (v9 - v8.startTime);
                end;
            elseif v8.framesCount ~= nil and v8.framesCount > 0 and v8.startTime ~= nil then
                return (tick() - v8.startTime) / v8.framesCount;
            else
                return nil;
            end;
        end
    }, 
    framesCount = {
        reducer = function(v10) --[[ Line: 80 ]] --[[ Name: reducer ]]
            return {
                framesCount = v10.framesCount == nil and 0 or v10.framesCount + 1
            };
        end, 
        getResult = function(v11) --[[ Line: 85 ]] --[[ Name: getResult ]]
            return v11.framesCount;
        end
    }, 
    longestFrameTime = {
        reducer = function(v12) --[[ Line: 90 ]] --[[ Name: reducer ]]
            return {
                framesCount = v12.framesCount == nil and 0 or v12.framesCount + 1, 
                longestFrameTime = (not (v12.longestFrameTime ~= nil) or v12.previousTime == nil) and 0 or math.max(v12.longestFrameTime, tick() - v12.previousTime), 
                previousTime = tick()
            };
        end, 
        getResult = function(v13) --[[ Line: 99 ]] --[[ Name: getResult ]]
            if v13.framesCount < 1 then
                return nil;
            else
                return v13.longestFrameTime;
            end;
        end
    }, 
    duration = {
        reducer = function(v14) --[[ Line: 107 ]] --[[ Name: reducer ]]
            return {
                startTime = v14.startTime or tick()
            };
        end, 
        getResult = function(v15) --[[ Line: 112 ]] --[[ Name: getResult ]]
            return tick() - v15.startTime;
        end
    }
};
local v17 = {};
local v18 = {};
for v19, _ in v16 do
    v17[v19] = v19;
    table.insert(v18, v19);
end;
local v21 = {};
v21.__index = v21;
v21.new = function(v22, v23) --[[ Line: 138 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy)
    local v24 = {
        _metricsData = {}, 
        _timeout = v22, 
        _startTime = nil, 
        _metricsToTrack = v23
    };
    setmetatable(v24, v21);
    return v24;
end;
v21.getMetricsToTrack = function(v25) --[[ Line: 149 ]] --[[ Name: getMetricsToTrack ]]
    -- upvalues: v18 (copy)
    if v25._metricsToTrack and #v25._metricsToTrack > 0 then
        return v25._metricsToTrack;
    else
        return v18;
    end;
end;
v21.hasReachedTimeout = function(v26) --[[ Line: 157 ]] --[[ Name: hasReachedTimeout ]]
    if v26._timeout ~= nil and v26._startTime ~= nil then
        return tick() - v26._startTime > v26._timeout;
    else
        return false;
    end;
end;
v21.updateMetrics = function(v27) --[[ Line: 164 ]] --[[ Name: updateMetrics ]]
    -- upvalues: v16 (copy)
    if v27._startTime == nil then
        v27._startTime = tick();
    end;
    for _, v29 in (v27:getMetricsToTrack()) do
        local v30 = v16[v29];
        if v30 then
            if not v27._metricsData[v29] then
                v27._metricsData[v29] = {};
            end;
            v27._metricsData[v29] = v30.reducer(v27._metricsData[v29]);
        end;
    end;
end;
v21.getResult = function(v31) --[[ Line: 184 ]] --[[ Name: getResult ]]
    -- upvalues: v16 (copy)
    local v32 = {};
    for _, v34 in (v31:getMetricsToTrack()) do
        local v35 = v16[v34];
        if v35 then
            v32[v34] = v35.getResult(v31._metricsData[v34]);
        end;
    end;
    return v32;
end;
local v36 = {};
v36.__index = v36;
v36.new = function() --[[ Line: 212 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), v17 (copy), v36 (copy)
    local v37 = {
        _metricsTrackers = v16, 
        _intervals = {}, 
        _renderSteppedConnection = nil, 
        availableMetricsEnum = v17
    };
    setmetatable(v37, v36);
    return v37;
end;
v36._updateIntervals = function(v38) --[[ Line: 225 ]] --[[ Name: _updateIntervals ]]
    for v39, v40 in v38._intervals do
        v40:updateMetrics();
        if v40:hasReachedTimeout() then
            v38:stopAndLogTracking(v39);
        end;
    end;
end;
v36.startTracking = function(v41, v42, v43, v44) --[[ Line: 235 ]] --[[ Name: startTracking ]]
    -- upvalues: v6 (copy), v21 (copy), l_RunService_0 (copy)
    if not v6 then
        return;
    else
        if not v41._intervals[v42] then
            local v45 = v21.new(v43, v44);
            v41._intervals[v42] = v45;
            v45:updateMetrics();
        end;
        if not v41._renderSteppedConnection then
            v41._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 254 ]]
                -- upvalues: v41 (copy)
                v41:_updateIntervals();
            end);
        end;
        return;
    end;
end;
v36.stopAndLogTracking = function(v46, v47) --[[ Line: 264 ]] --[[ Name: stopAndLogTracking ]]
    -- upvalues: v6 (copy), l_default_0 (copy), v3 (copy)
    if not v6 then
        return;
    else
        local v48 = v46._intervals[v47];
        if v48 then
            local v49 = v48:getResult();
            local v50 = {
                intervalName = v47
            };
            local v51 = 0;
            for v52, v53 in v49 do
                if v53 ~= nil then
                    v51 = v51 + 1;
                end;
                v50[v52] = v53;
            end;
            if v51 > 0 then
                l_default_0:logRobloxTelemetryEvent(v3, nil, v50);
                if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
                    print("IntervalPerformanceTracker:" .. tostring(v47) .. " logged with results:");
                    for v54, v55 in v50 do
                        print("\t" .. tostring(v54) .. " = " .. tostring(v55));
                    end;
                end;
            end;
            v46._intervals[v47] = nil;
        end;
        v46:disconnectUnusedRenderStepped();
        return;
    end;
end;
v36.cancelTracking = function(v56, v57) --[[ Line: 306 ]] --[[ Name: cancelTracking ]]
    -- upvalues: v6 (copy)
    if not v6 then
        return;
    else
        v56._intervals[v57] = nil;
        v56:disconnectUnusedRenderStepped();
        return;
    end;
end;
v36.disconnectUnusedRenderStepped = function(v58) --[[ Line: 316 ]] --[[ Name: disconnectUnusedRenderStepped ]]
    if not next(v58._intervals) and v58._renderSteppedConnection then
        v58._renderSteppedConnection:Disconnect();
        v58._renderSteppedConnection = nil;
    end;
end;
v36.class = v36;
return v36.new();