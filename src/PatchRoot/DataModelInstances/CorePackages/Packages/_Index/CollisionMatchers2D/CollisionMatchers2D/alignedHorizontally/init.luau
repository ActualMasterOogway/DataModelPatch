local v0 = require(script.Parent.toRect);
local v1 = require(script.Parent.returnValue);
return function(v2, v3, v4) --[[ Line: 28 ]] --[[ Name: alignedHorizontally ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v5 = v0(v2);
    local v6 = v0(v3);
    if v4 == Enum.HorizontalAlignment.Left then
        return v1(v5.Min.X == v6.Min.X, "", "");
    elseif v4 == Enum.HorizontalAlignment.Center then
        local v7 = (v5.Min + v5.Max) / 2;
        local v8 = (v6.Min + v6.Max) / 2;
        return v1(v7.X == v8.X, "", "");
    elseif v4 == Enum.HorizontalAlignment.Right then
        return v1(v5.Max.X == v6.Max.X, "", "");
    else
        return v1(false, "Invalid horizontal alignment!");
    end;
end;