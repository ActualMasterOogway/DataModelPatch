local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Core.Style.withStyle);
local v4 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(script.Parent.AnimatedGradient);
local v7 = v5["component_assets/circle_22_stroke_3"];
return function(v8) --[[ Line: 23 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v7 (copy), v6 (copy)
    return v3(function(v9) --[[ Line: 24 ]]
        -- upvalues: v2 (ref), v4 (ref), v7 (ref), v8 (copy), v6 (ref)
        return v2.createElement(v4.Label, {
            Image = v7, 
            ImageColor3 = v9.Theme.SelectionCursor.AnimatedColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 22, 1, 22), 
            Position = UDim2.new(0, -11, 0, -11), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(11, 11, 12, 12), 
            [v2.Ref] = v8.cursorRef
        }, {
            AnimatedGradient = v8.isVisible and v2.createElement(v6) or nil
        });
    end);
end;