local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.HttpServiceMock);
local v2 = require(l_Parent_0.Promise);
local function _(v3) --[[ Line: 9 ]] --[[ Name: needInternalRequest ]]
    return v3.Type == "internal";
end;
return function(v5) --[[ Line: 13 ]] --[[ Name: createPassthrough ]]
    -- upvalues: v2 (copy)
    return function(v6) --[[ Line: 14 ]] --[[ Name: makeRequest ]]
        -- upvalues: v2 (ref), v5 (copy)
        if v6.Type == "internal" then
            return v2.new(function(v7, _) --[[ Line: 16 ]]
                -- upvalues: v5 (ref), v6 (copy)
                v5:RequestInternal({
                    Url = v6.Url, 
                    Method = v6.Method, 
                    Headers = v6.Headers, 
                    Body = v6.Body, 
                    Timeout = v6.Timeout, 
                    Priority = v6.Priority, 
                    CachePolicy = v6.CachePolicy, 
                    RequestType = v6.RequestType
                }):Start(function(_, v10) --[[ Line: 28 ]]
                    -- upvalues: v7 (copy)
                    v7({
                        type = "response", 
                        response = v10
                    });
                end);
            end):catch(function(v11) --[[ Line: 34 ]]
                return {
                    type = "error", 
                    error = v11
                };
            end);
        else
            return v2.try(function() --[[ Line: 41 ]]
                -- upvalues: v5 (ref), v6 (copy)
                local v12 = v5:RequestAsync({
                    Url = v6.Url, 
                    Method = v6.Method, 
                    Headers = v6.Headers, 
                    Body = v6.Body
                });
                return {
                    type = "response", 
                    response = v12
                };
            end):catch(function(v13) --[[ Line: 52 ]]
                return {
                    type = "error", 
                    error = v13
                };
            end);
        end;
    end;
end;