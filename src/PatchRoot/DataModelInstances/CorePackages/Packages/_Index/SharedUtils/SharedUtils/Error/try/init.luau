local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Error);
local function v5(v2) --[[ Line: 6 ]] --[[ Name: describeError ]]
    -- upvalues: v1 (copy)
    if typeof(v2) == "string" then
        local _, v4 = v2:find(":[%d]+: ");
        return v1.new(if v4 then v2:sub(v4 + 1) else v2, 1);
    else
        return v2;
    end;
end;
return function(v6, ...) --[[ Line: 18 ]] --[[ Name: try ]]
    -- upvalues: v5 (copy)
    return xpcall(v6, v5, ...);
end;