local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Core.Style.withStyle);
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3(function(v5) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v4 (copy)
        return v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, -3), 
            Size = UDim2.new(1, 0, 0, 3), 
            BorderSizePixel = 1, 
            BackgroundColor3 = v5.Theme.SelectionCursor.Color, 
            BorderColor3 = v5.Theme.SelectionCursor.Color, 
            BackgroundTransparency = v5.Theme.SelectionCursor.Transparency, 
            [v2.Ref] = v4.cursorRef
        });
    end);
end;