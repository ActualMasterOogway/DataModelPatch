local v0 = {
    __className = "Devtools"
};
v0.__index = v0;
v0.new = function() --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({
        _events = table.create(100), 
        _eventsIndex = 0, 
        _pluginBridge = nil, 
        _pluginBridgeListener = nil, 
        _pluginBridgeBatchPackets = {}, 
        _pluginBridgeBatchProcess = nil, 
        _source = debug.traceback()
    }, v0);
    v1:_findPluginBridge(function(v2) --[[ Line: 39 ]]
        -- upvalues: v1 (copy)
        v1:_connectPluginBridge(v2);
    end);
    return v1;
end;
v0._findPluginBridge = function(v3, v4) --[[ Line: 50 ]] --[[ Name: _findPluginBridge ]]
    if v3._pluginBridge then
        v4(v3._pluginBridge);
        return;
    else
        local v5 = workspace.CurrentCamera or workspace;
        local l___RoduxDevtoolsPluginBridge_0 = v5:FindFirstChild("__RoduxDevtoolsPluginBridge");
        if l___RoduxDevtoolsPluginBridge_0 and l___RoduxDevtoolsPluginBridge_0:IsA("BindableEvent") then
            v3._pluginBridge = l___RoduxDevtoolsPluginBridge_0;
            v4(l___RoduxDevtoolsPluginBridge_0);
            return;
        else
            task.defer(function() --[[ Line: 70 ]]
                -- upvalues: v5 (copy), v3 (copy), v4 (copy)
                local v7 = v5:WaitForChild("__RoduxDevtoolsPluginBridge", 10);
                if v3._events == nil then
                    return;
                elseif v7 and v7:IsA("BindableEvent") then
                    v3._pluginBridge = v7;
                    v4(v7);
                    return;
                else
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v0._connectPluginBridge = function(v8, v9) --[[ Line: 88 ]] --[[ Name: _connectPluginBridge ]]
    if not v9 then
        return;
    else
        if v8._pluginBridgeListener then
            v8._pluginBridgeListener:Disconnect();
            v8._pluginBridgeListener = nil;
        end;
        if v8._pluginBridgeBatchProcess then
            v8._pluginBridgeBatchProcess:Disconnect();
            v8._pluginBridgeBatchProcess = nil;
        end;
        v8._pluginBridgeListener = v9.Event:Connect(function(v10, ...) --[[ Line: 103 ]]
            -- upvalues: v8 (copy)
            if v10 == "DevtoolsCall" then
                local v11 = {
                    ...
                };
                local v12 = v8[v11[1]];
                if not v12 then
                    return;
                else
                    table.remove(v11, 1);
                    pcall(v12, v8, table.unpack(v11));
                end;
            end;
        end);
        v8._pluginBridgeBatchProcess = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 115 ]]
            -- upvalues: v8 (copy), v9 (copy)
            if next(v8._pluginBridgeBatchPackets) == nil then
                return;
            else
                v9:Fire("PluginBatchPackets", v8._pluginBridgeBatchPackets);
                table.clear(v8._pluginBridgeBatchPackets);
                return;
            end;
        end);
        if #v8._events > 0 then
            local v13 = {};
            for v14, v15 in v8._events do
                v13[v14] = {
                    isStub = true, 
                    eventType = v15.eventType, 
                    props = {
                        elapsedMs = v15.props.elapsedMs, 
                        name = v15.props.name
                    }
                };
            end;
            v8:_firePluginBridge("updateEvents", v13);
        end;
        return;
    end;
end;
v0._firePluginBridge = function(v16, v17, v18) --[[ Line: 145 ]] --[[ Name: _firePluginBridge ]]
    if not v16._pluginBridge then
        return;
    else
        table.insert(v16._pluginBridgeBatchPackets, {
            type = v17, 
            props = v18
        });
        return;
    end;
end;
v0._hookIntoStore = function(v19, v20) --[[ Line: 161 ]] --[[ Name: _hookIntoStore ]]
    v19._store = v20;
    local v21 = string.split(debug.traceback(), "\n");
    v19._source = v21[1];
    for _, v23 in v21 do
        if not string.find(v23, "RoduxDevtools.-hookIntoStore") and not string.find(v23, "Store.-new") then
            v19._source = v23;
            break;
        end;
    end;
    v19._originalReducer = v20._reducer;
    v20._reducer = function(v24, v25) --[[ Line: 176 ]]
        -- upvalues: v19 (copy)
        local v26 = os.clock();
        local v27 = v19._originalReducer(v24, v25);
        local v28 = os.clock();
        v19:_addEvent("Reduce", {
            name = v25.type or tostring(v25), 
            elapsedMs = (v28 - v26) * 1000, 
            action = v25, 
            state = v27
        });
        return v27;
    end;
    v19._originalFlushHandler = v20._flushHandler;
    v20._flushHandler = function(...) --[[ Line: 191 ]]
        -- upvalues: v19 (copy), v20 (copy)
        local v29 = os.clock();
        v19._originalFlushHandler(...);
        local v30 = os.clock();
        v19:_addEvent("Flush", {
            name = "@@FLUSH", 
            elapsedMs = (v30 - v29) * 1000, 
            listenerCount = #v20.changed._listeners, 
            listeners = table.clone(v20.changed._listeners)
        });
    end;
end;
v0._addEvent = function(v31, v32, v33) --[[ Line: 209 ]] --[[ Name: _addEvent ]]
    local v34 = {
        eventType = v32, 
        source = v31._source, 
        timestamp = DateTime.now().UnixTimestampMillis, 
        props = v33
    };
    local v35 = nil;
    for v36 = v31._eventsIndex or 0, 1, -1 do
        local v37 = v31._events[v36];
        if v37.props.state then
            v35 = v37.props.state;
            break;
        end;
    end;
    v34.props.lastState = v35;
    v31._eventsIndex = (v31._eventsIndex or 0) + 1;
    v31._events[v31._eventsIndex] = v34;
    v31:_firePluginBridge("updateEvent", {
        index = v31._eventsIndex, 
        event = {
            isStub = true, 
            eventType = v32, 
            props = {
                elapsedMs = v34.props.elapsedMs, 
                name = v34.props.name
            }
        }
    });
end;
v0._fillPluginStubAtIndex = function(v38, v39) --[[ Line: 249 ]] --[[ Name: _fillPluginStubAtIndex ]]
    local v40 = v38._events[v39];
    if not v40 then
        return;
    else
        v38:_firePluginBridge("updateEvent", {
            index = v39, 
            event = v40
        });
        return;
    end;
end;
v0._setState = function(v41, v42, v43) --[[ Line: 264 ]] --[[ Name: _setState ]]
    if not v43 then
        v43 = v41._store._state;
    end;
    v41._store._state = v42;
    v41._store._lastState = v43;
    v41._store._mutatedSinceFlush = true;
end;
v0.Clear = function(v44) --[[ Line: 277 ]] --[[ Name: Clear ]]
    v44._eventsIndex = 0;
    v44._events = table.create(100);
end;
v0.Destroy = function(v45) --[[ Line: 285 ]] --[[ Name: Destroy ]]
    if v45._pluginBridgeListener then
        v45._pluginBridgeListener:Disconnect();
    end;
    if v45._pluginBridgeBatchProcess then
        v45._pluginBridgeBatchProcess:Disconnect();
    end;
    v45:Clear();
    table.clear(v45);
    setmetatable(v45, nil);
end;
v0.GetLoggedEvents = function(v46) --[[ Line: 300 ]] --[[ Name: GetLoggedEvents ]]
    return table.clone(v46._events);
end;
v0.GetLoggedEventsOfType = function(v47, v48) --[[ Line: 307 ]] --[[ Name: GetLoggedEventsOfType ]]
    local v49 = {};
    local v50 = 0;
    for _, v52 in v47._events do
        if v52.eventType == v48 then
            v50 = v50 + 1;
            v49[v50] = v52;
        end;
    end;
    return v49;
end;
v0.GetReducedActionsOfType = function(v53, v54) --[[ Line: 321 ]] --[[ Name: GetReducedActionsOfType ]]
    local v55 = {};
    local v56 = 0;
    for _, v58 in v53._events do
        if type(v58.props.action) == "table" and v58.props.action.type == v54 then
            v56 = v56 + 1;
            v55[v56] = v58;
        end;
    end;
    return v55;
end;
v0.RevertToStateAtIndex = function(v59, v60) --[[ Line: 336 ]] --[[ Name: RevertToStateAtIndex ]]
    if type(v60) ~= "number" then
        return;
    else
        local v61 = os.clock();
        local v62 = nil;
        local v63 = nil;
        local v64 = nil;
        for v65 = v60, 1, -1 do
            v62 = v59._events[v65];
            if v62.props.state then
                v63 = v62.props.state;
                v64 = v65;
                break;
            end;
        end;
        if not v63 then
            return;
        else
            local v66 = nil;
            for v67 = v64 - 1, 1, -1 do
                local v68 = v59._events[v67];
                if v68.props.state then
                    v66 = v68.props.state;
                    break;
                end;
            end;
            v59:_setState(v63, v66);
            local v69 = os.clock();
            v59:_addEvent("Reduce", {
                isDevtools = true, 
                name = "@@REVERT_TO_STATE", 
                elapsedMs = (v69 - v61) * 1000, 
                action = {
                    type = "@@REVERT_TO_STATE", 
                    revertTarget = {
                        name = v62.props.name, 
                        action = v62.props.action, 
                        eventIndex = v64
                    }
                }, 
                state = v63
            });
            return;
        end;
    end;
end;
v0.ReplaceActionAtIndex = function(v70, v71, v72) --[[ Line: 390 ]] --[[ Name: ReplaceActionAtIndex ]]
    if type(v71) ~= "number" then
        return;
    elseif v72 ~= nil and type(v72) ~= "table" then
        return;
    else
        local v73 = v70._events[v71];
        if v73 == nil or v73.props.action == nil then
            return;
        else
            v73.altered = v73.altered or {};
            v73.altered.replaceAction = v72;
            v70:_firePluginBridge("updateEvent", {
                index = v71, 
                event = v73
            });
            v70:_recomputeStateWithAlterations();
            return;
        end;
    end;
end;
v0.UndoActionAtIndex = function(v74, v75) --[[ Line: 415 ]] --[[ Name: UndoActionAtIndex ]]
    if type(v75) ~= "number" then
        return;
    else
        local v76 = v74._events[v75];
        if v76 == nil or v76.props.action == nil then
            return;
        else
            v76.altered = v76.altered or {};
            if v76.altered.skipped then
                return;
            else
                v76.altered.skipped = true;
                v74:_firePluginBridge("updateEvent", {
                    index = v75, 
                    event = v76
                });
                v74:_recomputeStateWithAlterations();
                return;
            end;
        end;
    end;
end;
v0.RedoActionAtIndex = function(v77, v78) --[[ Line: 442 ]] --[[ Name: RedoActionAtIndex ]]
    if type(v78) ~= "number" then
        return;
    else
        local v79 = v77._events[v78];
        if v79 == nil or v79.props.action == nil then
            return;
        else
            v79.altered = v79.altered or {};
            if v79.altered.skipped == false then
                return;
            else
                v79.altered.skipped = false;
                v77:_firePluginBridge("updateEvent", {
                    index = v78, 
                    event = v79
                });
                v77:_recomputeStateWithAlterations();
                return;
            end;
        end;
    end;
end;
v0._recomputeStateWithAlterations = function(v80) --[[ Line: 469 ]] --[[ Name: _recomputeStateWithAlterations ]]
    if #v80._events == 0 then
        return;
    else
        local v81 = os.clock();
        local v82 = nil;
        local v83 = nil;
        for v84, v85 in v80._events do
            if v85.altered and next(v85.altered) then
                v82 = v84;
                break;
            elseif v85.props.state then
                v83 = v85.props.state;
            end;
        end;
        if not v82 or not v83 then
            return;
        else
            local l_v82_0 = v82;
            local v87 = #v80._events;
            local v88 = nil;
            local v89 = {};
            local v90 = {};
            for v91 = l_v82_0, v87 do
                local v92 = v80._events[v91];
                if v92 then
                    local l_action_0 = v92.props.action;
                    if l_action_0 ~= nil and not v92.props.isDevtools then
                        if v92.altered and v92.altered.skipped then
                            table.insert(v89, {
                                name = v92.props.name, 
                                action = v92.props.action, 
                                eventIndex = v91
                            });
                        else
                            if v92.altered and v92.altered.replaceAction then
                                table.insert(v90, {
                                    name = v92.props.name, 
                                    originalAction = v92.props.action, 
                                    replacedAction = v92.altered.replaceAction, 
                                    eventIndex = v91
                                });
                                l_action_0 = v92.altered.replaceAction;
                            end;
                            v88 = table.clone(v83);
                            v83 = v80._originalReducer(v83, l_action_0);
                        end;
                    end;
                end;
            end;
            v80:_setState(v83, v88);
            local v94 = os.clock();
            v80:_addEvent("Reduce", {
                isDevtools = true, 
                name = "@@RECOMPUTE_STATE_WITH_ALTERATIONS", 
                elapsedMs = (v94 - v81) * 1000, 
                action = {
                    type = "@@RECOMPUTE_STATE_WITH_ALTERATIONS", 
                    skippedActions = v89, 
                    replacedActions = v90
                }, 
                state = v83
            });
            return;
        end;
    end;
end;
return v0;