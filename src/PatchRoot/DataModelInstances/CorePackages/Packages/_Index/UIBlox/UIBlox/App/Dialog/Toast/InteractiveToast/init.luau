local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_2.App.ImageSet.Images);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_2.Utility.SpringAnimatedItem);
local v10 = require(l_Parent_1.Button.Enum.ButtonType);
local v11 = require(l_Parent_0.ToastFrame);
local v12 = require(l_Parent_0.ToastIcon);
local v13 = require(l_Parent_0.ToastText);
local v14 = require(l_Parent_2.UIBloxConfig);
local v15 = {
    dampingRatio = 1, 
    frequency = 4
};
local v16 = v7["component_assets/circle_21"];
local v17 = Rect.new(10, 10, 11, 11);
local v18 = v4.PureComponent:extend("InteractiveToast");
v18.validateProps = v5.strictInterface({
    anchorPoint = v5.optional(v5.Vector2), 
    buttonProps = v5.optional(v5.strictInterface({
        buttonDimensions = v5.Vector2, 
        buttonText = v5.string, 
        onActivated = v5.callback, 
        buttonType = v5.optional(v10.isEnumValue)
    })), 
    iconProps = v5.optional(v12.validateProps), 
    iconChildren = v5.optional(v5.table), 
    isCompact = v5.optional(v5.boolean), 
    layoutOrder = v5.optional(v5.integer), 
    padding = v5.optional(v5.numberMin(0)), 
    position = v5.optional(v5.UDim2), 
    pressed = v5.optional(v5.boolean), 
    pressedScale = v5.number, 
    size = v5.UDim2, 
    subtitleTextProps = v5.optional(v13.validateProps), 
    textFrameSize = v5.optional(v5.UDim2), 
    titleTextProps = v13.validateProps
});
v18.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    layoutOrder = 1, 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    pressedScale = 0.95, 
    size = UDim2.new(1, 0, 1, 0)
};
v18.render = function(v19) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy), v6 (copy), v16 (copy), v14 (copy), v17 (copy), v9 (copy), v15 (copy), v11 (copy)
    return v8(function(v20) --[[ Line: 75 ]]
        -- upvalues: v4 (ref), v6 (ref), v19 (copy), v16 (ref), v14 (ref), v17 (ref), v9 (ref), v15 (ref), v11 (ref)
        local l_Theme_0 = v20.Theme;
        return v4.createElement(v6.Label, {
            AnchorPoint = v19.props.anchorPoint, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v16, 
            ImageColor3 = if v14.useFoundationColors then l_Theme_0.BackgroundUIDefault.Color else l_Theme_0.SystemPrimaryContent.Color, 
            ImageTransparency = if v14.useFoundationColors then l_Theme_0.BackgroundUIDefault.Transparency else l_Theme_0.SystemPrimaryContent.Transparency, 
            LayoutOrder = v19.props.layoutOrder, 
            Position = v19.props.position, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = v19.props.size, 
            SliceCenter = v17
        }, {
            Scaler = v4.createElement(v9.AnimatedUIScale, {
                springOptions = v15, 
                animatedValues = {
                    scale = v19.props.pressed and v19.props.pressedScale or 1
                }, 
                mapValuesToProps = function(v22) --[[ Line: 100 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Scale = v22.scale
                    };
                end
            }), 
            ToastFrame = v4.createElement(v11, {
                buttonProps = v19.props.buttonProps, 
                iconProps = v19.props.iconProps, 
                iconChildren = v19.props.iconChildren, 
                isCompact = v19.props.isCompact, 
                padding = v19.props.padding, 
                subtitleTextProps = v19.props.subtitleTextProps, 
                textFrameSize = v19.props.textFrameSize, 
                titleTextProps = v19.props.titleTextProps
            })
        });
    end);
end;
return v18;