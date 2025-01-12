local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getDefaultValue_0 = require(l_Parent_1.SharedUtils).getDefaultValue;
local v3 = require(l_Parent_0.Artifacts);
local v4 = require(l_Parent_0.RequestWriter);
local _ = require(l_Parent_0.Resolver);
local v6 = require(l_Parent_0.tryGetService);
local v7 = {
    useRequestsOnce = false
};
local v8 = {};
local v9 = {
    __index = v8
};
v8.new = function(v10) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v9 (copy)
    return (setmetatable({
        _resolver = v10, 
        _fileSystemService = v6("FileSystemService")
    }, v9));
end;
v8.load = function(v11, v12, v13) --[[ Line: 46 ]] --[[ Name: load ]]
    -- upvalues: l_getDefaultValue_0 (copy), v7 (copy), v3 (copy)
    local v14 = v11._resolver:getInstance(v12);
    if v14 == nil then
        return nil;
    else
        local v15 = l_getDefaultValue_0(v13, v7);
        local v16 = v3.new(v14);
        if l_getDefaultValue_0(v15.useRequestsOnce, v7.useRequestsOnce) then
            v16:useRequestsOnce();
        end;
        return v16;
    end;
end;
v8.getWriter = function(v17, v18) --[[ Line: 66 ]] --[[ Name: getWriter ]]
    -- upvalues: v4 (copy)
    return v4.new(v17._resolver:getLocation(v18));
end;
v8.delete = function(v19, v20) --[[ Line: 70 ]] --[[ Name: delete ]]
    local v21 = v19._resolver:getLocation(v20);
    if v19._fileSystemService then
        local v22 = v21:resolvePath();
        if v19._fileSystemService:Exists(v22) then
            v19._fileSystemService:RemoveAll(v22);
            return;
        end;
    else
        local v23 = v19._resolver:getInstance(v20);
        if v23 ~= nil then
            v23:ClearAllChildren();
        end;
    end;
end;
return v8;