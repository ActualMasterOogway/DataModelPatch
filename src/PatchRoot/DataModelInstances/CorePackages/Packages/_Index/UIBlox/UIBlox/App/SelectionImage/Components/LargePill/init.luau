local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Core.Style.withStyle);
local v4 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(script.Parent.AnimatedGradient);
return function(v7) --[[ Line: 19 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v5 (copy), v6 (copy)
    return v3(function(v8) --[[ Line: 20 ]]
        -- upvalues: v2 (ref), v4 (ref), v5 (ref), v7 (copy), v6 (ref)
        return v2.createElement(v4.Label, {
            Image = v5["component_assets/circle_52_stroke_3"], 
            ImageColor3 = v8.Theme.SelectionCursor.AnimatedColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(26, 26, 27, 27), 
            [v2.Ref] = v7.cursorRef
        }, {
            AnimatedGradient = v7.isVisible and v2.createElement(v6) or nil
        });
    end);
end;