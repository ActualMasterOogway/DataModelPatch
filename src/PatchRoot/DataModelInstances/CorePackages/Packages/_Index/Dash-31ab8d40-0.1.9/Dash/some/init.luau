local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, v4) --[[ Line: 14 ]] --[[ Name: some ]]
    -- upvalues: v2 (copy)
    v2(typeof(v3), "table", "Attempted to call Dash.some with argument #1 of type {left:?} not {right:?}");
    v2(typeof(v4), "function", "Attempted to call Dash.some with argument #2 of type {left:?} not {right:?}");
    for v5, v6 in pairs(v3) do
        if v4(v6, v5) then
            return true;
        end;
    end;
    return false;
end;