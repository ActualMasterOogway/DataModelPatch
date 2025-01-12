local v0 = {};
local v2 = {
    __index = v0, 
    __tostring = function(v1) --[[ Line: 10 ]] --[[ Name: __tostring ]]
        return v1:toString();
    end
};
v0.new = function(v3, v4) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        message = v3, 
        stack = debug.traceback(nil, 2 + (v4 == nil and 0 or v4))
    }, v2));
end;
v0.toString = function(v5) --[[ Line: 22 ]] --[[ Name: toString ]]
    return v5.message;
end;
return v0;