local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.ImageSet.Validator.validateImage);
local v6 = require(l_Parent_0.Style.withStyle);
local v7 = require(l_Parent_1.UIBlox.UIBloxConfig);
local v8 = v2.PureComponent:extend("HoverButtonBackground");
v8.validateProps = v3.strictInterface({
    sidePadding = v3.optional(v3.number), 
    image = v3.optional(v5), 
    sliceCenter = v3.optional(v3.Rect)
});
v8.render = function(v9) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v6 (copy), v2 (copy), v4 (copy)
    local v10 = if v7.fixGenericButtonHoverBackgroundPadding and v9.props.sidePadding then UDim2.new(v9.props.sidePadding, UDim.new()) + UDim2.new(v9.props.sidePadding, UDim.new()) else UDim2.new();
    return v6(function(v11) --[[ Line: 39 ]]
        -- upvalues: v7 (ref), v2 (ref), v4 (ref), v10 (copy), v9 (copy)
        local l_BackgroundOnHover_0 = v11.Theme.BackgroundOnHover;
        if v7.enableGenericButtonHoverImage then
            return v2.createElement(v4.Label, {
                Size = if v7.fixGenericButtonHoverBackgroundPadding then UDim2.fromScale(1, 1) + v10 else UDim2.fromScale(1, 1), 
                AnchorPoint = if v7.fixGenericButtonHoverBackgroundPadding then Vector2.new(0.5, 0.5) else nil, 
                Position = if v7.fixGenericButtonHoverBackgroundPadding then UDim2.fromScale(0.5, 0.5) else nil, 
                BackgroundColor3 = if v9.props.image then nil else l_BackgroundOnHover_0.Color, 
                BackgroundTransparency = v9.props.image and 1 or l_BackgroundOnHover_0.Transparency, 
                Image = v9.props.image, 
                ImageColor3 = l_BackgroundOnHover_0.Color, 
                ImageTransparency = l_BackgroundOnHover_0.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v9.props.sliceCenter
            }, {
                corner = if v9.props.image then nil else v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            });
        else
            return v2.createElement("Frame", {
                Size = if v7.fixGenericButtonHoverBackgroundPadding then UDim2.fromScale(1, 1) + v10 else UDim2.fromScale(1, 1), 
                AnchorPoint = if v7.fixGenericButtonHoverBackgroundPadding then Vector2.new(0.5, 0.5) else nil, 
                Position = if v7.fixGenericButtonHoverBackgroundPadding then UDim2.fromScale(0.5, 0.5) else nil, 
                BackgroundColor3 = l_BackgroundOnHover_0.Color, 
                BackgroundTransparency = l_BackgroundOnHover_0.Transparency
            }, {
                corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            });
        end;
    end);
end;
return v8;