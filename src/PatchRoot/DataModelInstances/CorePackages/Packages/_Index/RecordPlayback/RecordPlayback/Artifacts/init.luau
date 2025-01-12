local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.HttpServiceMock);
local v3 = require(l_Parent_0.deepEqual);
local _ = require(l_Parent_0.RequestWriter);
local v5 = require(l_Parent_0.RequestFormatter);
local v6 = {};
local v7 = {
    __index = v6
};
v6.new = function(v8) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v7 (copy)
    return (setmetatable({
        _parent = v8, 
        _loadedContent = nil, 
        _formatter = v5.new(), 
        _require = require, 
        _useRequestsOnce = false
    }, v7));
end;
v6.useRequestsOnce = function(v9) --[[ Line: 50 ]] --[[ Name: useRequestsOnce ]]
    v9._useRequestsOnce = true;
    return v9;
end;
v6.find = function(v10, v11) --[[ Line: 55 ]] --[[ Name: find ]]
    -- upvalues: v3 (copy)
    if not v10._loadedContent then
        v10._loadedContent = v10:_loadRequests();
    end;
    local v12 = v10._formatter:formatRequest(v11);
    local l_ipairs_0 = ipairs;
    local v14 = v10._loadedContent or {};
    for _, v16 in l_ipairs_0(v14) do
        if (not v10._useRequestsOnce or v16.usage == 0) and v3(v16.object.request, v12) then
            v16.usage = v16.usage + 1;
            local l_object_0 = v16.object;
            if l_object_0.response then
                return {
                    response = v10._formatter:loadResponse(l_object_0.response)
                };
            else
                return {
                    error = l_object_0.error
                };
            end;
        end;
    end;
    return nil;
end;
v6.getUnusedRequests = function(v18) --[[ Line: 80 ]] --[[ Name: getUnusedRequests ]]
    if not v18._loadedContent then
        v18._loadedContent = v18:_loadRequests();
    end;
    local v19 = {};
    local l_ipairs_1 = ipairs;
    local v21 = v18._loadedContent or {};
    for _, v23 in l_ipairs_1(v21) do
        if v23.usage == 0 then
            table.insert(v19, v23.object.request);
        end;
    end;
    return v19;
end;
v6._loadRequests = function(v24) --[[ Line: 96 ]] --[[ Name: _loadRequests ]]
    local v25 = {};
    for _, v27 in v24._parent:GetDescendants() do
        if v27:IsA("ModuleScript") then
            table.insert(v25, v24:_deserialize(v27));
        end;
    end;
    return v25;
end;
v6._deserialize = function(v28, v29) --[[ Line: 106 ]] --[[ Name: _deserialize ]]
    return {
        object = v28._require(v29), 
        usage = 0
    };
end;
return v6;