local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.enumerate);
local v8 = require(l_Core_0.Control.Interactable);
local v9 = require(l_Core_0.Control.Enum.ControlState);
local v10 = require(l_Core_0.Button.getContentStyle);
local v11 = require(l_Core_0.Text.GetTextSize);
local v12 = require(l_Core_0.Text.CleanRichTextTags);
local v13 = require(l_Parent_0.Utility.isReactTagProp);
local v14 = require(l_script_FirstAncestor_0.SelectionImage.withSelectionCursorProvider);
local v15 = require(l_script_FirstAncestor_0.SelectionImage.CursorKind);
local v16 = require(l_Core_0.Style.Validator.validateColorInfo);
local v17 = require(l_Core_0.Style.withStyle);
local v18 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v19 = require(l_Parent_1.UIBlox.UIBloxConfig);
local v20 = require(l_Parent_0.App.SelectionCursor.withCursor);
local v21 = UDim.new(0, 8);
local v22 = v5.PureComponent:extend("TextButton");
v22.debugProps = v7("debugProps", {
    "getTextSize", 
    "controlState"
});
v22.validateProps = v4.strictInterface({
    [v6.Tag] = v13, 
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.string), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    hoverBackgroundEnabled = v4.optional(v4.boolean), 
    richText = v4.optional(v4.boolean), 
    showBackground = v4.optional(v4.boolean), 
    backgroundColor = v4.optional(v16), 
    horizontalPadding = v4.optional(v4.number), 
    verticalPadding = v4.optional(v4.number), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    text = v4.optional(v4.string), 
    [v22.debugProps.getTextSize] = v4.optional(v4.callback), 
    [v22.debugProps.controlState] = v4.optional(v9.isEnumValue)
});
v22.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.fromScale(0, 0), 
    text = "", 
    verticalPadding = 11, 
    horizontalPadding = 8, 
    showBackground = false, 
    fontStyle = "Header2", 
    colorStyleDefault = v19.useFoundationColors and "TextEmphasis" or "SystemPrimaryDefault", 
    colorStyleHover = v19.useFoundationColors and "TextEmphasis" or "SystemPrimaryDefault", 
    hoverBackgroundEnabled = true, 
    richText = false, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    [v22.debugProps.getTextSize] = v11, 
    [v22.debugProps.controlState] = nil
};
v22.init = function(v23) --[[ Line: 111 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    v23:setState({
        controlState = v9.Initialize
    });
    v23.onStateChanged = function(v24, v25) --[[ Line: 116 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            controlState = v25
        });
        if v23.props.onStateChanged then
            v23.props.onStateChanged(v24, v25);
        end;
    end;
end;
v22.render = function(v26) --[[ Line: 126 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v14 (copy), v19 (copy), v20 (copy)
    return v17(function(v27) --[[ Line: 127 ]]
        -- upvalues: v14 (ref), v19 (ref), v20 (ref), v26 (copy)
        return v14(function(v28) --[[ Line: 128 ]]
            -- upvalues: v19 (ref), v20 (ref), v26 (ref), v27 (copy)
            if v19.useNewSelectionCursor then
                return v20(function(v29) --[[ Line: 130 ]]
                    -- upvalues: v26 (ref), v27 (ref), v28 (copy)
                    return v26:renderWithProviders(v27, v28, v29.getCursor);
                end);
            else
                return v26:renderWithProviders(v27, v28);
            end;
        end);
    end);
end;
v22.renderWithProviders = function(v30, v31, v32, v33) --[[ Line: 140 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v22 (copy), v9 (copy), v10 (copy), v12 (copy), v5 (copy), v8 (copy), v6 (copy), v21 (copy), v15 (copy), v18 (copy)
    local v34 = v30.props[v22.debugProps.controlState] or v30.state.controlState;
    local v35 = {
        [v9.Default] = v30.props.colorStyleDefault, 
        [v9.Hover] = v30.props.colorStyleHover
    };
    local v36 = v10(v35, v34, v31);
    local v37 = v31.Font[v30.props.fontStyle];
    local v38 = v37.RelativeSize * v31.Font.BaseSize;
    local l_X_0 = v30.props[v22.debugProps.getTextSize](v30.props.richText and v12(v30.props.text) or v30.props.text, v38, v37.Font, Vector2.new(10000, 0)).X;
    local v40 = if v30.props.showBackground then v30.props.backgroundColor or v31.Theme.UIMuted else {
        Color = nil, 
        Transparency = 1
    };
    local l_verticalPadding_0 = v30.props.verticalPadding;
    local l_horizontalPadding_0 = v30.props.horizontalPadding;
    local l_BackgroundOnHover_0 = v31.Theme.BackgroundOnHover;
    if v30.props.hoverBackgroundEnabled and v34 == v9.Hover then
        v40 = if v40.Color then {
            Color = v40.Color:Lerp(l_BackgroundOnHover_0.Color, 1 - l_BackgroundOnHover_0.Transparency), 
            Transparency = v40.Transparency
        } else l_BackgroundOnHover_0;
    end;
    return v5.createElement(v8, {
        [v6.Tag] = v30.props[v6.Tag], 
        AnchorPoint = v30.props.anchorPoint, 
        LayoutOrder = v30.props.layoutOrder, 
        Position = v30.props.position, 
        Size = v30.props.size, 
        isDisabled = v30.props.isDisabled, 
        onStateChanged = v30.onStateChanged, 
        userInteractionEnabled = v30.props.userInteractionEnabled, 
        BackgroundColor3 = v40.Color, 
        BackgroundTransparency = v40.Transparency, 
        AutoButtonColor = false, 
        SelectionImageObject = if v33 then v33(v21) else v32 and v32(v15.RoundedRectNoInset), 
        [v5.Event.Activated] = v30.props.onActivated
    }, {
        corner = v5.createElement("UICorner", {
            CornerRadius = v21
        }), 
        sizeConstraint = v5.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_X_0 + l_horizontalPadding_0 * 2, v38 + l_verticalPadding_0 * 2)
        }), 
        textLabel = v5.createElement(v18, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = v30.props.text, 
            fontStyle = v37, 
            colorStyle = v36, 
            RichText = v30.props.richText
        })
    });
end;
return v22;