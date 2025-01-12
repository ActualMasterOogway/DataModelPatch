local l_Parent_0 = script.Parent.Parent;
local l_jest_0 = require(l_Parent_0.JestGlobals).jest;
return {
    new = function(v2, v3) --[[ Line: 13 ]] --[[ Name: new ]]
        -- upvalues: l_jest_0 (copy)
        local v4 = v2.new();
        local v5 = {};
        for v6, v7 in v4 do
            if type(v7) == "function" then
                v5[v6] = l_jest_0.fn();
            else
                v5[v6] = v7;
            end;
        end;
        setmetatable(v5, {
            __tostring = function() --[[ Line: 27 ]] --[[ Name: __tostring ]]
                -- upvalues: v3 (copy)
                return string.format("Service(%s)", v3);
            end
        });
        return {
            mockService = v5
        };
    end
};