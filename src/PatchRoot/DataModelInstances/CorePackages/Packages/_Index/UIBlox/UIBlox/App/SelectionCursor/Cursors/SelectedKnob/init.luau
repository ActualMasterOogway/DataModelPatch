local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(script.Parent.AnimatedGradient);
return (v2.forwardRef(function(v6, v7) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v2.createElement(v3.Label, {
        Image = v4["component_assets/circle_42_stroke_3"], 
        ImageColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(42, 42), 
        Position = UDim2.new(0.5, -21, 0.5, -21), 
        ref = v7
    }, {
        AnimatedGradient = v6.isVisible and v2.createElement(v5) or nil
    });
end));