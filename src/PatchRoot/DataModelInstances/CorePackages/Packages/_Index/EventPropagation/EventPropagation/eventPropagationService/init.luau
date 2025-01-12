local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.FocusNavigationUtils);
local l_getAncestors_0 = v1.getAncestors;
local l_mockableWarn_0 = v1.mockableWarn;
local v4 = require(script.Parent.eventPropagationEvent);
local l___DEBUG_EVENT_PROPAGATION___0 = _G.__DEBUG_EVENT_PROPAGATION__;
local function v7(v6) --[[ Line: 108 ]] --[[ Name: describeFunction ]]
    return table.concat(table.pack(debug.info(v6, "sln")), " ");
end;
local function _(v8, v9) --[[ Line: 112 ]] --[[ Name: getEventsFromRegistry ]]
    return v8[v9];
end;
local function _(v11, v12, v13) --[[ Line: 116 ]] --[[ Name: getEventPhasesFromRegistry ]]
    local v14 = v11[v12];
    if v14 then
        return v14[v13];
    else
        return nil;
    end;
end;
local function _(v16, v17, v18, v19) --[[ Line: 125 ]] --[[ Name: getEventHandler ]]
    local v20 = v16[v17];
    local v21 = if v20 then v20[v18] else nil;
    if v21 ~= nil then
        return v21[v19];
    else
        return nil;
    end;
end;
local v23 = {};
v23.__index = v23;
v23.registerEventHandler = function(v24, v25, v26, v27, v28) --[[ Line: 138 ]] --[[ Name: registerEventHandler ]]
    -- upvalues: l___DEBUG_EVENT_PROPAGATION___0 (copy), l_mockableWarn_0 (copy), v7 (copy)
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print("+++ register handler", v26, tostring(v25), v28 or "Bubble");
    end;
    local v29 = v28 or "Bubble";
    v24.eventHandlerRegistry[v25] = v24.eventHandlerRegistry[v25] or {};
    v24.eventHandlerRegistry[v25][v26] = v24.eventHandlerRegistry[v25][v26] or {};
    if _G.__DEV__ then
        local v30 = v24.eventHandlerRegistry[v25][v26][v29];
        if v30 then
            l_mockableWarn_0(string.format("New handler bound to the %s phase of '%s' will override an existing handler:" .. "\n\tprevious handler: %s\n\t     new handler: %s", v29, v26, table.concat(table.pack(debug.info(v27, "sln")), " "), v7(v30)));
        end;
    end;
    v24.eventHandlerRegistry[v25][v26][v29] = v27;
end;
v23.registerEventHandlers = function(v31, v32, v33) --[[ Line: 169 ]] --[[ Name: registerEventHandlers ]]
    if not v31.eventHandlerRegistry[v32] then
        v31.eventHandlerRegistry[v32] = {};
    end;
    for v34, v35 in v33 do
        v31:registerEventHandler(v32, v34, v35.handler, v35.phase);
    end;
end;
v23.deregisterEventHandlers = function(v36, v37, v38) --[[ Line: 178 ]] --[[ Name: deregisterEventHandlers ]]
    if not v36.eventHandlerRegistry[v37] then
        return;
    else
        for v39, v40 in v38 do
            v36:deregisterEventHandler(v37, v39, v40.handler, v40.phase);
        end;
        return;
    end;
end;
v23.deregisterEventHandler = function(v41, v42, v43, v44, v45) --[[ Line: 187 ]] --[[ Name: deregisterEventHandler ]]
    -- upvalues: l___DEBUG_EVENT_PROPAGATION___0 (copy), l_mockableWarn_0 (copy)
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print("--- deregister handler", v43, tostring(v42), v45 or "Bubble");
    end;
    local v46 = v45 or "Bubble";
    local v47 = v41.eventHandlerRegistry[v42];
    local v48 = if v47 then v47[v43] else nil;
    if v48 and v48[v46] then
        if _G.__DEV__ then
            local v49 = v48[v46];
            if v49 ~= v44 then
                l_mockableWarn_0(string.format("Deregistering non-matching event handler bound to the %s phase of '%s':" .. "\n\tprevious handler: %s\n\t     new handler: %s", v46, v43, if type(v44) == "function" then table.concat(table.pack(debug.info(v44, "sln")), " ") else tostring(v44), if type(v49) == "function" then table.concat(table.pack(debug.info(v49, "sln")), " ") else tostring(v49)));
            end;
        end;
        v48[v46] = nil;
        return;
    else
        if _G.__DEV__ then
            l_mockableWarn_0(string.format("Cannot deregister unregistered event handler bound to the %s phase of '%s'", v46, v43));
        end;
        return;
    end;
end;
v23.getRegisteredEventHandlers = function(v50, v51) --[[ Line: 228 ]] --[[ Name: getRegisteredEventHandlers ]]
    local v52 = v50.eventHandlerRegistry[v51];
    if v52 then
        local v53 = {};
        for v54, v55 in v52 do
            v53[v54] = next(v55) ~= nil;
        end;
        return v53;
    else
        return nil;
    end;
end;
v23.propagateEvent = function(v56, v57, v58, v59, v60) --[[ Line: 242 ]] --[[ Name: propagateEvent ]]
    -- upvalues: v4 (copy), l_getAncestors_0 (copy), l___DEBUG_EVENT_PROPAGATION___0 (copy)
    local function _(v61, v62) --[[ Line: 243 ]] --[[ Name: runEventHandler ]]
        -- upvalues: v56 (copy), v58 (copy), v4 (ref), v57 (copy), v59 (copy)
        local l_eventHandlerRegistry_0 = v56.eventHandlerRegistry;
        local l_v58_0 = v58;
        local v65 = l_eventHandlerRegistry_0[v61];
        local v66 = if v65 then v65[l_v58_0] else nil;
        local v67 = if v66 ~= nil then v66[v62] else nil;
        if v67 then
            l_eventHandlerRegistry_0 = v4.new(v57, v61, v58, v62, v59);
            v67(l_eventHandlerRegistry_0);
            return l_eventHandlerRegistry_0.cancelled;
        else
            return false;
        end;
    end;
    local v69 = false;
    local v70 = if v60 then {
        v57
    } else l_getAncestors_0(v57);
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print(">>> capture event", v58, "for", (tostring(v57)));
    end;
    for v71 = #v70, 1, -1 do
        local v72 = v70[v71];
        local v73 = v56.eventHandlerRegistry[v72];
        local v74 = if v73 then v73[v58] else nil;
        local v75 = if v74 ~= nil then v74.Capture else nil;
        if v75 then
            local v76 = v4.new(v57, v72, v58, "Capture", v59);
            v75(v76);
            v69 = v76.cancelled;
        else
            v69 = false;
        end;
        if v69 then
            return;
        end;
    end;
    local v77 = v56.eventHandlerRegistry[v57];
    local v78 = if v77 then v77[v58] else nil;
    local v79 = if v78 ~= nil then v78.Target else nil;
    if v79 then
        local v80 = v4.new(v57, v57, v58, "Target", v59);
        v79(v80);
        v69 = v80.cancelled;
    else
        v69 = false;
    end;
    if v69 then
        return;
    else
        if l___DEBUG_EVENT_PROPAGATION___0 then
            print("<<< bubble event", v58, "from", (tostring(v57)));
        end;
        for v81 = 1, #v70 do
            v77 = v70[v81];
            local v82 = v56.eventHandlerRegistry[v77];
            local v83 = if v82 then v82[v58] else nil;
            local v84 = if v83 ~= nil then v83.Bubble else nil;
            if v84 then
                local v85 = v4.new(v57, v77, v58, "Bubble", v59);
                v84(v85);
                v69 = v85.cancelled;
            else
                v69 = false;
            end;
            if v69 then
                return;
            end;
        end;
        return;
    end;
end;
v23.new = function() --[[ Line: 280 ]] --[[ Name: new ]]
    -- upvalues: v23 (copy)
    local v86 = {
        eventHandlerRegistry = setmetatable({}, {
            __mode = "k"
        })
    };
    setmetatable(v86, v23);
    return v86;
end;
return v23;