local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.HttpServiceMock);
local _ = require(l_Parent_0.Location);
local v4 = require(l_Parent_0.File);
local v5 = require(l_Parent_0.PathUtils);
local v6 = require(l_Parent_0.RequestFormatter);
local v7 = require(l_Parent_0.LuauModuleSerializer);
local v8 = require(l_Parent_0.UrlUtils);
local v9 = {};
local v10 = {
    __index = v9
};
v9.new = function(v11) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v6 (copy), v7 (copy), v10 (copy)
    return (setmetatable({
        _location = v11, 
        _createFile = v4.new, 
        _formatter = v6.new(), 
        _serializer = v7.new(), 
        _requestCounter = 0
    }, v10));
end;
v9.writeResponse = function(v12, v13, v14) --[[ Line: 64 ]] --[[ Name: writeResponse ]]
    v12:_writeObject(v12:_getRequestLocation(v13), {
        request = v12._formatter:formatRequest(v13), 
        response = v12._formatter:formatResponse(v14)
    });
end;
v9.writeError = function(v15, v16, v17) --[[ Line: 71 ]] --[[ Name: writeError ]]
    v15:_writeObject(v15:_getRequestLocation(v16), {
        request = v15._formatter:formatRequest(v16), 
        error = v17
    });
end;
v9._writeObject = function(v18, v19, v20) --[[ Line: 78 ]] --[[ Name: _writeObject ]]
    v18._createFile(v19):write((v18._serializer:serialize(v20)));
end;
v9._getRequestLocation = function(v21, v22) --[[ Line: 86 ]] --[[ Name: _getRequestLocation ]]
    -- upvalues: v8 (copy), v5 (copy)
    v21._requestCounter = v21._requestCounter + 1;
    local v23 = v8.parse(v22.Url);
    local l_host_0 = v23.host;
    local l_path_0 = v23.path;
    if l_host_0 == nil then
        local v26 = v23.path:find("/");
        if v26 then
            l_host_0 = v23.path:sub(1, v26 - 1);
            l_path_0 = v23.path:sub(v26 + 1);
        else
            l_host_0 = v23.path;
            l_path_0 = "";
        end;
    end;
    local v27 = "";
    if l_path_0 ~= "/" and l_path_0 ~= "" then
        v27 = if l_path_0:sub(1, 1) == "/" then v27 .. l_path_0:sub(2) .. "-" else v27 .. l_path_0 .. "-";
    end;
    v27 = v27 .. v22.Method;
    if next(v23.query) ~= nil then
        v27 = v27 .. "-" .. v8.formatQuery(v23.query);
    end;
    v27 = v5.sanitizeFileName(v27) .. ("-%d.lua"):format(v21._requestCounter);
    return v21._location:join(v5.sanitizeFileName(l_host_0), v27);
end;
return v9;