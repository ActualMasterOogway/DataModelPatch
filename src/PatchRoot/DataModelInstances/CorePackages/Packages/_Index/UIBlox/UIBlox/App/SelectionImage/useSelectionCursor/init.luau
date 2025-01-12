local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_0.SelectionImageContext);
local v3 = require(l_Parent_1.React);
return function(v4) --[[ Line: 12 ]] --[[ Name: useSelectionCursor ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3.useContext(v2)(v4);
end;