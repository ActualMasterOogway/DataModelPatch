local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.SharedUtils);
local _ = require(l_Parent_1.HttpServiceMock);
local v5 = require(l_Parent_1.PrettyFormat);
local v6 = require(l_Parent_0.ImmediateSignal);
local v7 = {};
local v8 = {
    __index = v7
};
v7.new = function(v9, v10) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v8 (copy)
    return (setmetatable({
        _makeRequest = v9, 
        _running = true, 
        _source = v10, 
        _rejections = {}, 
        _promises = {}, 
        _warn = warn, 
        _onClose = v6.new()
    }, v8));
end;
v7.makeRequest = function(v11, v12, v13) --[[ Line: 70 ]] --[[ Name: makeRequest ]]
    -- upvalues: v5 (copy), v2 (copy)
    if not v11._running then
        local v14 = string.format("Attempt to create request after test was done. Test location: %s\nRequest: %s\n\nRequest was made at: %s", v11._source, v5.format(v12), v13);
        v11._warn(v14);
        return v2.resolve({
            type = "error", 
            error = v14
        });
    else
        local function v16(v15) --[[ Line: 85 ]] --[[ Name: processError ]]
            -- upvalues: v11 (copy)
            table.insert(v11._rejections, v15);
            return {
                type = "error", 
                error = v15
            };
        end;
        local function v21(v17) --[[ Line: 93 ]] --[[ Name: filterInternalErrors ]]
            -- upvalues: v11 (copy), v2 (ref)
            if v17.type == "internal-error" then
                local v18 = tostring(v17.error);
                table.insert(v11._rejections, v18);
                return {
                    type = "error", 
                    error = v18
                };
            elseif v17.type == "suspend" then
                return v2.new(function(v19, _) --[[ Line: 102 ]]
                    -- upvalues: v11 (ref)
                    v11._onClose:connect(function() --[[ Line: 103 ]]
                        -- upvalues: v19 (copy)
                        v19({
                            type = "error", 
                            error = "request was delayed until the record-playback logic ended"
                        });
                    end);
                end);
            else
                return v17;
            end;
        end;
        local v22 = v2.try(v11._makeRequest, v12):andThen(v21, v16);
        v11._promises[v22] = true;
        return v22;
    end;
end;
v7.getRejections = function(v23) --[[ Line: 122 ]] --[[ Name: getRejections ]]
    return v23._rejections;
end;
v7.getRunningPromises = function(v24) --[[ Line: 126 ]] --[[ Name: getRunningPromises ]]
    -- upvalues: v2 (copy)
    local v25 = {};
    for v26 in pairs(v24._promises) do
        if v26:getStatus() == v2.Status.Started then
            table.insert(v25, v26);
        end;
    end;
    return v25;
end;
v7.close = function(v27) --[[ Line: 138 ]] --[[ Name: close ]]
    if not v27._running then
        error("Attempt to close an already closed promise tracker");
    end;
    v27._running = false;
    v27._onClose:fire();
end;
return v7;