local _ = require(script.Parent.AppLaunchTrackerTypes);
local v1 = game:DefineFastFlag("RoduxPerfTrackerFixStopTracking", false);
local v2 = {
    __className = "Devtools"
};
v2.__index = v2;
local function _() --[[ Line: 45 ]] --[[ Name: createTable ]]
    return (table.create(100));
end;
v2.new = function(v4, v5, v6) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        reportTopAction = v4, 
        reportTopThunk = v5, 
        startImmediately = v6, 
        shouldTrack = false, 
        flushCount = 0, 
        totalFlushTimeMs = 0, 
        reduceCount = 0, 
        totalReduceTimeMs = 0, 
        maxListenerCount = 0, 
        totalThunkTimeMs = 0, 
        thunkCount = 0, 
        actionCounts = if v4 then table.create(100) else nil, 
        actionTotalTimes = if v4 then table.create(100) else nil, 
        thunkCounts = if v5 then table.create(100) else nil, 
        thunkTotalTimes = if v5 then table.create(100) else nil
    }, v2));
end;
v2._hookIntoStore = function(v7, v8) --[[ Line: 82 ]] --[[ Name: _hookIntoStore ]]
    v7.store = v8;
    v7.originalReducer = v8._reducer;
    v7.originalFlushHandler = v8._flushHandler;
    if v7.startImmediately then
        v7:startTracking();
    end;
end;
v2.trackingReducer = function(v9, v10, v11) --[[ Line: 92 ]] --[[ Name: trackingReducer ]]
    assert(v9.originalReducer, "self.originalReducer must exist");
    local v12 = os.clock();
    local v13 = v9.originalReducer(v10, v11);
    local v14 = (os.clock() - v12) * 1000;
    v9.totalReduceTimeMs = v9.totalReduceTimeMs + v14;
    v9.reduceCount = v9.reduceCount + 1;
    if v9.reportTopAction and v9.actionCounts and v9.actionTotalTimes then
        local v15 = v11.type or tostring(v11);
        if v15 then
            local v16 = (v9.actionCounts[v15] or 0) + 1;
            v9.actionCounts[v15] = v16;
            local v17 = (v9.actionTotalTimes[v15] or 0) + v14;
            v9.actionTotalTimes[v15] = v17;
        end;
    end;
    return v13;
end;
v2.trackingFlush = function(v18, ...) --[[ Line: 117 ]] --[[ Name: trackingFlush ]]
    local v19 = os.clock();
    v18.originalFlushHandler(...);
    local v20 = (os.clock() - v19) * 1000;
    v18.totalFlushTimeMs = v18.totalFlushTimeMs + v20;
    v18.flushCount = v18.flushCount + 1;
    local v21 = #v18.store.changed._listeners;
    if v18.maxListenerCount < v21 then
        v18.maxListenerCount = v21;
    end;
end;
v2.startTracking = function(v22) --[[ Line: 132 ]] --[[ Name: startTracking ]]
    v22.store._flushHandler = function(...) --[[ Line: 133 ]]
        -- upvalues: v22 (copy)
        return v22:trackingFlush(...);
    end;
    v22.store._reducer = function(...) --[[ Line: 136 ]]
        -- upvalues: v22 (copy)
        return v22:trackingReducer(...);
    end;
    v22.shouldTrack = true;
end;
v2.stopTracking = function(v23) --[[ Line: 142 ]] --[[ Name: stopTracking ]]
    -- upvalues: v1 (copy)
    if not v1 or v23.shouldTrack then
        v23.shouldTrack = false;
        v23.store._flushHandler = v23.originalFlushHandler;
        v23.store._reducer = v23.originalReducer;
    end;
end;
v2.clear = function(v24) --[[ Line: 150 ]] --[[ Name: clear ]]
    v24.flushCount = 0;
    v24.totalFlushTimeMs = 0;
    v24.reduceCount = 0;
    v24.totalReduceTimeMs = 0;
    v24.maxListenerCount = 0;
    v24.totalThunkTimeMs = 0;
    v24.thunkCount = 0;
    if v24.reportTopAction then
        v24.actionCounts = table.create(100);
        v24.actionTotalTimes = table.create(100);
    end;
    if v24.reportTopThunk then
        v24.thunkCounts = table.create(100);
        v24.thunkTotalTimes = table.create(100);
    end;
end;
local function v29(v25) --[[ Line: 169 ]] --[[ Name: getRelevantLineFromTrace ]]
    local v26 = string.split(v25, "\n");
    for v27 = 3, #v26 do
        local v28 = v26[v27];
        if not string.find(v28, "AppLaunchTracker") and not string.find(v28, "_Index.Rodux") and not string.find(v28, "_Index.RoactRodux") and not string.find(v28, "_Index.Promise") and not string.find(v28, ".RoactRodux") then
            return v28;
        end;
    end;
    return nil;
end;
local function _(v30) --[[ Line: 186 ]] --[[ Name: getThunkName ]]
    -- upvalues: v29 (copy)
    local v31 = v29(debug.traceback());
    if v31 then
        return v31;
    else
        return debug.info(v30, "slf");
    end;
end;
v2.makeThunkMiddleware = function(v33, v34) --[[ Line: 194 ]] --[[ Name: makeThunkMiddleware ]]
    -- upvalues: v29 (copy)
    local function v36(v35) --[[ Line: 195 ]] --[[ Name: tracebackReporter ]]
        return debug.traceback(v35);
    end;
    return function(v37, v38) --[[ Line: 198 ]] --[[ Name: thunkMiddleware ]]
        -- upvalues: v33 (copy), v34 (copy), v29 (ref), v36 (copy)
        return function(v39) --[[ Line: 199 ]]
            -- upvalues: v33 (ref), v38 (copy), v34 (ref), v29 (ref), v36 (ref), v37 (copy)
            if typeof(v39) == "function" then
                local v46, v47 = xpcall(function() --[[ Line: 201 ]]
                    -- upvalues: v33 (ref), v39 (copy), v38 (ref), v34 (ref), v29 (ref)
                    if v33.shouldTrack then
                        local v40 = os.clock();
                        local v41 = v39(v38, v34);
                        local v42 = (os.clock() - v40) * 1000;
                        local l_v33_0 = v33;
                        l_v33_0.totalThunkTimeMs = l_v33_0.totalThunkTimeMs + v42;
                        l_v33_0 = v33;
                        l_v33_0.thunkCount = l_v33_0.thunkCount + 1;
                        if v33.reportTopThunk and v33.thunkCounts and v33.thunkTotalTimes then
                            local l_v39_0 = v39;
                            l_v33_0 = v29(debug.traceback()) or debug.info(l_v39_0, "slf");
                            l_v39_0 = (v33.thunkCounts[l_v33_0] or 0) + 1;
                            v33.thunkCounts[l_v33_0] = l_v39_0;
                            local v45 = (v33.thunkTotalTimes[l_v33_0] or 0) + v42;
                            v33.thunkTotalTimes[l_v33_0] = v45;
                        end;
                        return v41;
                    else
                        return v39(v38, v34);
                    end;
                end, v36);
                if not v46 then
                    v38._errorReporter.reportReducerError(v38:getState(), v39, {
                        message = "Caught error in thunk", 
                        thrownValue = v47
                    });
                    return nil;
                else
                    return v47;
                end;
            else
                return v37(v39);
            end;
        end;
    end;
end;
local function _(v48) --[[ Line: 245 ]] --[[ Name: getTopValue ]]
    local v49 = nil;
    local v50 = nil;
    for v51, v52 in v48 do
        if (v49 or -1) < v52 then
            v49 = v52;
            v50 = v51;
        end;
    end;
    return v50, v49;
end;
local function _(v54) --[[ Line: 257 ]] --[[ Name: fixThunkName ]]
    return v54:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "");
end;
v2.getStats = function(v56) --[[ Line: 261 ]] --[[ Name: getStats ]]
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    if v56.reportTopAction and v56.actionCounts and v56.actionTotalTimes then
        local l_actionTotalTimes_0 = v56.actionTotalTimes;
        local v64 = nil;
        local v65 = nil;
        for v66, v67 in l_actionTotalTimes_0 do
            if (v64 or -1) < v67 then
                v64 = v67;
                v65 = v66;
            end;
        end;
        local l_v65_0 = v65;
        local l_v64_0 = v64;
        v57 = l_v65_0;
        v58 = l_v64_0;
        if v57 then
            v59 = v56.actionCounts[v57];
        end;
    end;
    if v56.reportTopThunk and v56.thunkCounts and v56.thunkTotalTimes then
        local l_thunkTotalTimes_0 = v56.thunkTotalTimes;
        local v71 = nil;
        local v72 = nil;
        for v73, v74 in l_thunkTotalTimes_0 do
            if (v71 or -1) < v74 then
                v71 = v74;
                v72 = v73;
            end;
        end;
        local l_v72_0 = v72;
        local l_v71_0 = v71;
        v60 = l_v72_0;
        v61 = l_v71_0;
        if v60 then
            v62 = v56.thunkCounts[v60];
            v60 = v60:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "");
        end;
    end;
    return {
        flushCount = v56.flushCount, 
        totalFlushTimeMs = v56.totalFlushTimeMs, 
        reduceCount = v56.reduceCount, 
        totalReduceTimeMs = v56.totalReduceTimeMs, 
        maxListenerCount = v56.maxListenerCount, 
        totalThunkTimeMs = v56.totalThunkTimeMs, 
        thunkCount = v56.thunkCount, 
        topActionName = v57, 
        topActionDurationMs = v58, 
        topActionCount = v59, 
        topThunkName = v60, 
        topThunkDurationMs = v61, 
        topThunkCount = v62
    };
end;
return v2;