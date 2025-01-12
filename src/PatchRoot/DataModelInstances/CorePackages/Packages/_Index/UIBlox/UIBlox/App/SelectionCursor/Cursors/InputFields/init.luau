local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(script.Parent.AnimatedGradient);
local v6 = Rect.new(11, 11, 12, 12);
return (v2.forwardRef(function(v7, v8) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v5 (copy)
    return v2.createElement(v3.Label, {
        Image = v4["component_assets/circle_22_stroke_3"], 
        ImageColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 14, 1, 0), 
        Position = UDim2.new(0, -7, 0, 0), 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v6, 
        ref = v8
    }, {
        AnimatedGradient = v7.isVisible and v2.createElement(v5) or nil
    });
end));