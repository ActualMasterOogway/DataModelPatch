local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.CursorContext);
return function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: useCursor ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2).getCursor(v3, v4, v5);
end;