local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.SelectionImageContext);
return function(v3) --[[ Line: 7 ]] --[[ Name: SelectionCursorConsumer ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Consumer, {
        render = v3
    });
end;