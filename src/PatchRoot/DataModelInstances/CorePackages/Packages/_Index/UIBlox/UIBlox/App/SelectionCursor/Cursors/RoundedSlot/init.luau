local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Parent.CursorComponent);
local v3 = UDim.new(0, 7);
return v1.forwardRef(function(v4, v5) --[[ Line: 16 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2, {
        isVisible = v4.isVisible, 
        cornerRadius = v3, 
        offset = -3, 
        borderWidth = 3, 
        ref = v5
    });
end);