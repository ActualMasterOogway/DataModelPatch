local function v3(v0) --[[ Line: 4 ]] --[[ Name: parsePath ]]
    local v1 = string.split(v0, "/");
    for v2 = #v1, 1, -1 do
        if v1[v2] == "" then
            table.remove(v1, v2);
        end;
    end;
    return v1;
end;
local _ = function(v4, v5) --[[ Line: 14 ]] --[[ Name: isManifestResolved ]]
    local v6 = 0;
    for _ in pairs(v4) do
        v6 = v6 + 1;
    end;
    assert(v6 <= v5, v6);
    return v6 == v5;
end;
local function v9(v10, v11) --[[ Line: 24 ]] --[[ Name: unbindNodeDescend ]]
    -- upvalues: v9 (copy)
    if v10.instance == nil then
        return;
    else
        v10.instance = nil;
        local l_connections_0 = v10.connections;
        if l_connections_0 then
            for _, v14 in ipairs(l_connections_0) do
                v14:Disconnect();
            end;
            table.clear(l_connections_0);
        end;
        if v11 and v10.alias then
            v11[v10.alias] = nil;
        end;
        local l_children_0 = v10.children;
        if l_children_0 then
            for _, v17 in pairs(l_children_0) do
                v9(v17, v11);
            end;
        end;
        return;
    end;
end;
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v18 (copy)
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = 1;
    for v27, v28 in pairs(v19) do
        v25[v27] = v3(v28);
        v26 = v26 + 1;
    end;
    return (setmetatable({
        _boundFn = v20, 
        _parsedManifest = v25, 
        _manifestSizeTarget = v26, 
        _dtorMap = v21, 
        _connections = v22, 
        _rootInstToRootNode = v23, 
        _rootInstToManifest = v24
    }, v18));
end;
v18._startBoundFn = function(v29, v30, v31) --[[ Line: 80 ]] --[[ Name: _startBoundFn ]]
    local l__boundFn_0 = v29._boundFn;
    local l__dtorMap_0 = v29._dtorMap;
    local v34 = l__dtorMap_0[v30];
    if v34 then
        v34();
        l__dtorMap_0[v30] = nil;
    end;
    local v35 = l__boundFn_0(v31);
    if v35 then
        l__dtorMap_0[v30] = v35;
    end;
end;
v18._stopBoundFn = function(v36, v37) --[[ Line: 96 ]] --[[ Name: _stopBoundFn ]]
    local l__dtorMap_1 = v36._dtorMap;
    local v39 = l__dtorMap_1[v37];
    if v39 then
        v39();
        l__dtorMap_1[v37] = nil;
    end;
end;
v18.bindRoot = function(v40, v41) --[[ Line: 106 ]] --[[ Name: bindRoot ]]
    -- upvalues: v9 (copy)
    debug.profilebegin("AtomicBinding:BindRoot");
    local l__parsedManifest_0 = v40._parsedManifest;
    local l__rootInstToRootNode_0 = v40._rootInstToRootNode;
    local l__rootInstToManifest_0 = v40._rootInstToManifest;
    local l__manifestSizeTarget_0 = v40._manifestSizeTarget;
    assert(l__rootInstToManifest_0[v41] == nil);
    local v46 = {};
    l__rootInstToManifest_0[v41] = v46;
    debug.profilebegin("BuildTree");
    local v47 = {
        alias = "root", 
        instance = v41
    };
    if next(l__parsedManifest_0) then
        v47.children = {};
        v47.connections = {};
    end;
    l__rootInstToRootNode_0[v41] = v47;
    for v48, v49 in pairs(l__parsedManifest_0) do
        local l_v47_0 = v47;
        for v51, v52 in ipairs(v49) do
            local v53 = v51 == #v49;
            local v54 = l_v47_0.children[v52] or {};
            if v53 then
                if v54.alias ~= nil then
                    error("Multiple aliases assigned to one instance");
                end;
                v54.alias = v48;
            else
                v54.children = v54.children or {};
                v54.connections = v54.connections or {};
            end;
            l_v47_0.children[v52] = v54;
            l_v47_0 = v54;
        end;
    end;
    debug.profileend();
    local function v55(v56) --[[ Line: 160 ]] --[[ Name: processNode ]]
        -- upvalues: v46 (copy), v55 (copy), v40 (copy), v41 (copy), v9 (ref), l__manifestSizeTarget_0 (copy)
        local v57 = assert(v56.instance);
        local l_children_1 = v56.children;
        local l_alias_0 = v56.alias;
        local v60 = not l_children_1;
        if l_alias_0 then
            v46[l_alias_0] = v57;
        end;
        if not v60 then
            local function v63(v61) --[[ Line: 172 ]] --[[ Name: processAddChild ]]
                -- upvalues: l_children_1 (copy), v55 (ref)
                local v62 = l_children_1[v61.Name];
                if not v62 or v62.instance ~= nil then
                    return;
                else
                    v62.instance = v61;
                    v55(v62);
                    return;
                end;
            end;
            local function v69(v64) --[[ Line: 183 ]] --[[ Name: processDeleteChild ]]
                -- upvalues: l_children_1 (copy), v40 (ref), v41 (ref), v9 (ref), v46 (ref), v57 (copy), v55 (ref)
                local l_Name_0 = v64.Name;
                local v66 = l_children_1[l_Name_0];
                if not v66 then
                    return;
                elseif v66.instance ~= v64 then
                    return;
                else
                    v40:_stopBoundFn(v41);
                    v9(v66, v46);
                    assert(v66.instance == nil);
                    local l_v57_FirstChild_0 = v57:FindFirstChild(l_Name_0);
                    if l_v57_FirstChild_0 then
                        local v68 = l_children_1[l_v57_FirstChild_0.Name];
                        if v68 then
                            if v68.instance ~= nil then
                                return;
                            else
                                v68.instance = l_v57_FirstChild_0;
                                v55(v68);
                            end;
                        end;
                    end;
                    return;
                end;
            end;
            for _, v71 in ipairs(v57:GetChildren()) do
                local v72 = l_children_1[v71.Name];
                if v72 and v72.instance == nil then
                    v72.instance = v71;
                    v55(v72);
                end;
            end;
            table.insert(v56.connections, v57.ChildAdded:Connect(v63));
            table.insert(v56.connections, v57.ChildRemoved:Connect(v69));
        end;
        if v60 then
            local l_v46_0 = v46;
            local l_l__manifestSizeTarget_0_0 = l__manifestSizeTarget_0;
            local v75 = 0;
            for _ in pairs(l_v46_0) do
                v75 = v75 + 1;
            end;
            assert(v75 <= l_l__manifestSizeTarget_0_0, v75);
            if v75 == l_l__manifestSizeTarget_0_0 then
                v40:_startBoundFn(v41, v46);
            end;
        end;
    end;
    debug.profilebegin("ResolveTree");
    v55(v47);
    debug.profileend();
    debug.profileend();
end;
v18.unbindRoot = function(v77, v78) --[[ Line: 236 ]] --[[ Name: unbindRoot ]]
    -- upvalues: v9 (copy)
    local l__rootInstToRootNode_1 = v77._rootInstToRootNode;
    local l__rootInstToManifest_1 = v77._rootInstToManifest;
    v77:_stopBoundFn(v78);
    local v81 = l__rootInstToRootNode_1[v78];
    if v81 then
        local v82 = assert(l__rootInstToManifest_1[v78]);
        v9(v81, v82);
        l__rootInstToRootNode_1[v78] = nil;
    end;
    l__rootInstToManifest_1[v78] = nil;
end;
v18.destroy = function(v83) --[[ Line: 252 ]] --[[ Name: destroy ]]
    -- upvalues: v9 (copy)
    debug.profilebegin("AtomicBinding:destroy");
    for _, v85 in pairs(v83._dtorMap) do
        v85:destroy();
    end;
    table.clear(v83._dtorMap);
    for _, v87 in ipairs(v83._connections) do
        v87:Disconnect();
    end;
    table.clear(v83._connections);
    local l__rootInstToManifest_2 = v83._rootInstToManifest;
    for v89, v90 in pairs(v83._rootInstToRootNode) do
        local v91 = assert(l__rootInstToManifest_2[v89]);
        v9(v90, v91);
    end;
    table.clear(v83._rootInstToManifest);
    table.clear(v83._rootInstToRootNode);
    debug.profileend();
end;
return v18;