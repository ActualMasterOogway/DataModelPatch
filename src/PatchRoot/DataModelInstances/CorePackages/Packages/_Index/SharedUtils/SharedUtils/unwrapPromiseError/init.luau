local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
return function(v2) --[[ Line: 6 ]] --[[ Name: unwrapPromiseError ]]
    -- upvalues: v1 (copy)
    while v1.Error.is(v2) do
        v2 = v2.error;
    end;
    return v2;
end;