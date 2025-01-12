local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.enumerate);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Core_0.Button.getContentStyle);
local v10 = require(l_Core_0.Text.GetTextSize);
local v11 = require(l_Core_0.Text.CleanRichTextTags);
local v12 = require(l_Core_0.Style.withStyle);
local v13 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v14 = require(l_Core_0.Button.HoverButtonBackground);
local v15 = require(l_script_FirstAncestor_0.SelectionImage.withSelectionCursorProvider);
local v16 = require(l_script_FirstAncestor_0.SelectionCursor.withCursor);
local v17 = require(l_script_FirstAncestor_0.SelectionCursor.CursorType);
local l_Focusable_0 = require(l_Parent_1.RoactGamepad).Focusable;
local v19 = require(l_Parent_0.UIBloxConfig);
local v20 = v5.PureComponent:extend("LinkButton");
v20.debugProps = v6("debugProps", {
    "getTextSize", 
    "controlState"
});
v20.validateProps = v4.strictInterface({
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.string), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    hoverBackgroundEnabled = v4.optional(v4.boolean), 
    underlineAlwaysEnabled = v4.optional(v4.boolean), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    text = v4.optional(v4.string), 
    minPaddingX = v4.optional(v4.number), 
    minPaddingY = v4.optional(v4.number), 
    selectionCursorKind = v4.optional(v4.userdata), 
    [v20.debugProps.getTextSize] = v4.optional(v4.callback), 
    [v20.debugProps.controlState] = v4.optional(v8.isEnumValue), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    buttonRef = v4.optional(v4.union(v4.callback, v4.table))
});
v20.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.fromScale(0, 0), 
    text = "", 
    fontStyle = "Header2", 
    colorStyleDefault = "TextLink", 
    colorStyleHover = "TextLink", 
    hoverBackgroundEnabled = false, 
    underlineAlwaysEnabled = false, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    minPaddingX = 8, 
    minPaddingY = 11, 
    [v20.debugProps.getTextSize] = v10, 
    [v20.debugProps.controlState] = nil
};
v20.init = function(v21) --[[ Line: 113 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v21:setState({
        controlState = v8.Initialize
    });
    v21.applyRichTextUnderline = function(v22) --[[ Line: 118 ]]
        return "<u>" .. v22 .. "</u>";
    end;
    v21.onStateChanged = function(v23, v24) --[[ Line: 122 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            controlState = v24
        });
        if v21.props.onStateChanged then
            v21.props.onStateChanged(v23, v24);
        end;
    end;
end;
v20.render = function(v25) --[[ Line: 132 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v16 (copy), v17 (copy), v15 (copy)
    if v19.migrateToNewSelectionCursor then
        return v16(function(v26) --[[ Line: 134 ]]
            -- upvalues: v17 (ref), v25 (copy)
            local v27 = v26.getCursorByType(v17.RoundedRectNoInset);
            return v25:renderWithSelectionCursorProvider(nil, v27);
        end);
    else
        return v15(function(v28) --[[ Line: 139 ]]
            -- upvalues: v25 (copy)
            return v25:renderWithSelectionCursorProvider(v28);
        end);
    end;
end;
v20.renderWithSelectionCursorProvider = function(v29, v30, v31) --[[ Line: 145 ]] --[[ Name: renderWithSelectionCursorProvider ]]
    -- upvalues: v12 (copy), v20 (copy), v8 (copy), v9 (copy), v11 (copy), v19 (copy), v5 (copy), l_Focusable_0 (copy), v7 (copy), v13 (copy), v14 (copy)
    return v12(function(v32) --[[ Line: 146 ]]
        -- upvalues: v29 (copy), v20 (ref), v8 (ref), v9 (ref), v11 (ref), v19 (ref), v31 (copy), v30 (copy), v5 (ref), l_Focusable_0 (ref), v7 (ref), v13 (ref), v14 (ref)
        local v33 = v29.props[v20.debugProps.controlState] or v29.state.controlState;
        local v34 = {
            [v8.Default] = v29.props.colorStyleDefault, 
            [v8.Hover] = v29.props.colorStyleHover
        };
        local v35 = v9(v34, v33, v32);
        local v36 = v32.Font[v29.props.fontStyle];
        if v29.props.underlineAlwaysEnabled == true and v33 == v8.Hover then
            v35.Transparency = 0.3;
        end;
        local v37 = v36.RelativeSize * v32.Font.BaseSize;
        local l_X_0 = v29.props[v20.debugProps.getTextSize](v11(v29.props.text), v37, v36.Font, Vector2.new(10000, 0)).X;
        local l_text_0 = v29.props.text;
        if v29.props.underlineAlwaysEnabled or v33 == v8.Hover or v33 == v8.Pressed then
            l_text_0 = v29.applyRichTextUnderline(v29.props.text);
        end;
        local l_minPaddingX_0 = v29.props.minPaddingX;
        local l_minPaddingY_0 = v29.props.minPaddingY;
        local v42 = Vector2.new(l_X_0 + l_minPaddingX_0 * 2, v37 + l_minPaddingY_0 * 2);
        local v43 = nil;
        if v19.migrateToNewSelectionCursor then
            v43 = v31;
        elseif v29.props.selectionCursorKind ~= nil then
            v43 = v30(v29.props.selectionCursorKind);
        end;
        return v5.createElement(if v19.enableLinkButtonGamepadSupport then l_Focusable_0[v7] else v7, {
            AnchorPoint = v29.props.anchorPoint, 
            LayoutOrder = v29.props.layoutOrder, 
            Position = v29.props.position, 
            Size = v29.props.size, 
            isDisabled = v29.props.isDisabled, 
            onStateChanged = v29.onStateChanged, 
            userInteractionEnabled = v29.props.userInteractionEnabled, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            SelectionImageObject = v43, 
            [v5.Event.Activated] = v29.props.onActivated, 
            [v5.Ref] = if v19.enableLinkButtonGamepadSupport then v29.props.buttonRef else nil, 
            NextSelectionLeft = if v19.enableLinkButtonGamepadSupport then v29.props.NextSelectionLeft else nil, 
            NextSelectionRight = if v19.enableLinkButtonGamepadSupport then v29.props.NextSelectionRight else nil, 
            NextSelectionUp = if v19.enableLinkButtonGamepadSupport then v29.props.NextSelectionUp else nil, 
            NextSelectionDown = if v19.enableLinkButtonGamepadSupport then v29.props.NextSelectionDown else nil
        }, {
            sizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = v42
            }), 
            textLabel = v5.createElement(v13, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                fontStyle = v36, 
                colorStyle = v35, 
                RichText = true
            }), 
            background = v29.props.hoverBackgroundEnabled and v33 == v8.Hover and v5.createElement(v14)
        });
    end);
end;
return v20;