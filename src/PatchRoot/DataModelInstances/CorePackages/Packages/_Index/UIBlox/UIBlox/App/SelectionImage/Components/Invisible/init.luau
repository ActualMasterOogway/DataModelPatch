local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v1.Ref] = v2.cursorRef
    });
end;