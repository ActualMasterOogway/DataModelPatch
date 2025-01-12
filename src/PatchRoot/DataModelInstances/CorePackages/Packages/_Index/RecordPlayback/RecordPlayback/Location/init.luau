local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.PathUtils);
local v2 = {};
local v3 = {
    __index = v2
};
v2.new = function(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    return (setmetatable({
        _relativePath = v1.trimEndSeparator(v4), 
        _rootPath = v5, 
        _rootInstance = v6
    }, v3));
end;
v2.join = function(v7, ...) --[[ Line: 24 ]] --[[ Name: join ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.new(v1.join(v7._relativePath, ...), v7._rootPath, v7._rootInstance);
end;
v2.resolvePath = function(v8) --[[ Line: 28 ]] --[[ Name: resolvePath ]]
    -- upvalues: v1 (copy)
    return v1.join(v8._rootPath, v8._relativePath);
end;
v2.getInstance = function(v9) --[[ Line: 32 ]] --[[ Name: getInstance ]]
    -- upvalues: v1 (copy)
    local l__rootInstance_0 = v9._rootInstance;
    for _, v12 in ipairs(v1.getComponents(v9._relativePath)) do
        if v12 == "" then
            error(("invalid path location provided `%s`"):format(v9._relativePath), 2);
        end;
        l__rootInstance_0 = l__rootInstance_0:FindFirstChild(v12);
        if l__rootInstance_0 == nil then
            return nil;
        end;
    end;
    return l__rootInstance_0;
end;
v2.getOrCreateInstance = function(v13, v14) --[[ Line: 50 ]] --[[ Name: getOrCreateInstance ]]
    -- upvalues: v1 (copy)
    local v15 = v13:_ensureParentInstance();
    local v16 = v1.fileStem(v13._relativePath);
    local l_v15_FirstChild_0 = v15:FindFirstChild(v16);
    if l_v15_FirstChild_0 and l_v15_FirstChild_0:IsA(v14) then
        return l_v15_FirstChild_0;
    else
        local v18 = Instance.new(v14);
        v18.Name = v16;
        v18.Parent = v15;
        return v18;
    end;
end;
v2._ensureParentInstance = function(v19) --[[ Line: 64 ]] --[[ Name: _ensureParentInstance ]]
    -- upvalues: v1 (copy)
    local v20 = v1.parent(v19._relativePath);
    if v20 == nil then
        error(("invalid path location provided `%s` (unable to obtain parent path)"):format(v19._relativePath), 2);
    end;
    if v20 == "" then
        return v19._rootInstance;
    else
        local l__rootInstance_1 = v19._rootInstance;
        for _, v23 in ipairs(v1.getComponents(v20)) do
            if v23 == "" then
                error(("invalid path location provided `%s`"):format(v19._relativePath), 2);
            end;
            local l_l__rootInstance_1_FirstChild_0 = l__rootInstance_1:FindFirstChild(v23);
            if l_l__rootInstance_1_FirstChild_0 == nil then
                l_l__rootInstance_1_FirstChild_0 = Instance.new("Folder");
                l_l__rootInstance_1_FirstChild_0.Name = v23;
                l_l__rootInstance_1_FirstChild_0.Parent = l__rootInstance_1;
            end;
            l__rootInstance_1 = l_l__rootInstance_1_FirstChild_0;
        end;
        return l__rootInstance_1;
    end;
end;
return v2;