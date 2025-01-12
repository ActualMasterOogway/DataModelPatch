local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: getSafeAreaSize ]]
    -- upvalues: v1 (copy)
    assert(typeof(v2) == "Vector2", "getSafeAreaSize expects screenSize to be a Vector2");
    assert(type(v3) == "table", "getSafeAreaSize expects guiInset to be a table");
    v1.isNonNegativeNumber(v3.left, "getSafeAreaSize: guiInset.left");
    v1.isNonNegativeNumber(v3.right, "getSafeAreaSize: guiInset.right");
    v1.isNonNegativeNumber(v3.top, "getSafeAreaSize: guiInset.top");
    v1.isNonNegativeNumber(v3.bottom, "getSafeAreaSize: guiInset.bottom");
    local v4 = v2.X - v3.left - v3.right;
    local v5 = v2.Y - v3.top - v3.bottom;
    v1.isNonNegativeNumber(v4, "getSafeAreaSize: safeAreaWidth");
    v1.isNonNegativeNumber(v5, "getSafeAreaSize: safeAreaHeight");
    return UDim2.new(0, v4, 0, v5);
end;