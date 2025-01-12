local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = nil;
local v3 = require(script.Parent.Flags);
if v3.GetEnableAdGuiUiBloxImages() then
    v2 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
end;
local v4 = v1.Component:extend("CircularButton");
v4.render = function(v5) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (ref)
    local v6 = nil;
    v6 = if typeof(v5.props.Transparency) == "table" then v5.props.Transparency:map(function(v7) --[[ Line: 18 ]]
        -- upvalues: v5 (copy)
        local v8 = false;
        if v7 < 1 then
            v8 = v5.props.Visible;
        end;
        return v8;
    end) else v5.props.Visible and v5.props.Transparency < 1;
    return v1.createElement("TextButton", {
        Size = UDim2.fromScale(v5.props.HorizontalScale, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v5.props.Position, 
        AnchorPoint = v5.props.AnchorPoint, 
        BackgroundColor3 = Color3.fromRGB(17, 18, 19), 
        Transparency = v5.props.Transparency, 
        Text = "", 
        Visible = v6, 
        AutoButtonColor = v5.props.AutoButtonColor, 
        [v1.Event.Activated] = v5.props.onActivated
    }, {
        UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.ScaleWithParentSize
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        ImageLabel = v1.createElement(if v3.GetEnableAdGuiUiBloxImages() then v2 else "ImageLabel", {
            BackgroundTransparency = 1, 
            Size = v5.props.ImageSize, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v5.props.Image, 
            ImageTransparency = v5.props.Transparency
        })
    });
end;
return v4;