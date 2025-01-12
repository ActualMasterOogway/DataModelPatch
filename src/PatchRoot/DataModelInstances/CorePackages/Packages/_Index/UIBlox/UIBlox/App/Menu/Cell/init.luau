local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v6 = require(l_Parent_0.App.SelectionImage.withSelectionCursorProvider);
local v7 = require(l_Parent_0.App.SelectionImage.CursorKind);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v10 = require(l_Parent_1.UIBlox.Core.ImageSet.ImageSetComponent);
local v11 = require(l_Parent_1.UIBlox.App.ImageSet.Images);
local v12 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v13 = require(l_Parent_0.Utility.divideTransparency);
local v14 = require(l_Parent_1.UIBlox.Core.Style.Validator.validateFontInfo);
local v15 = require(l_Parent_1.UIBlox.Core.Control.Controllable);
local v16 = require(l_Parent_1.UIBlox.Core.Control.Enum.ControlState);
local v17 = require(script.Parent.KeyLabel.KeyLabel);
local v18 = require(script.Parent.RoundedFrame);
local v19 = require(l_Parent_0.Core.Control.Interactable);
local v20 = require(l_Parent_0.UIBloxConfig);
local v21 = v11["component_assets/circle_17"];
local v22 = v2.PureComponent:extend("Cell");
v22.validateProps = v3.strictInterface({
    icon = v3.optional(v3.union(v3.table, v3.string)), 
    text = v3.string, 
    onActivated = v3.callback, 
    keyCodeLabel = v3.optional(v3.union(v3.enum(Enum.KeyCode), v3.strictInterface({
        key = v3.enum(Enum.KeyCode), 
        axis = v3.optional(v3.string)
    }))), 
    selected = v3.optional(v3.boolean), 
    iconColorOverride = v3.optional(v3.Color3), 
    textColorOverride = v3.optional(v3.Color3), 
    elementHeight = v3.integer, 
    hasRoundTop = v3.boolean, 
    hasRoundBottom = v3.boolean, 
    hasDivider = v3.boolean, 
    disabled = v3.optional(v3.boolean), 
    stayOnActivated = v3.optional(v3.boolean), 
    renderRightSideGadget = v3.optional(v3.callback), 
    rightSideGadgetSize = v3.optional(v3.Vector2), 
    leftPaddingOffset = v3.optional(v3.number), 
    layoutOrder = v3.integer, 
    setButtonRef = v3.optional(v3.union(v3.callback, v3.table)), 
    cursorKind = if v20.migrateToNewSelectionCursor then nil else v3.optional(v7.isEnumValue), 
    isElementBackgroundVisible = v3.optional(v3.boolean), 
    dividerOffset = v3.optional(v3.number), 
    dividerSize = v3.optional(v3.number), 
    fontStyle = v3.optional(v3.union(v3.string, v14)), 
    iconSize = v3.optional(v3.integer), 
    selectedIconSize = v3.optional(v3.integer), 
    iconPaddingLeft = v3.optional(v3.integer), 
    textPadding = v3.optional(v3.strictInterface({
        left = v3.integer, 
        right = v3.integer
    })), 
    selectedIconPaddingRight = v3.optional(v3.integer), 
    keyLabelPaddingRight = v3.optional(v3.integer), 
    textOnlyPadding = v3.optional(v3.integer), 
    borderCornerRadius = v3.optional(v3.integer), 
    background = v3.optional(v5), 
    selectionOrder = v3.optional(v3.number), 
    selectionCursor = if v20.migrateToNewSelectionCursor then v3.optional(v3.any) else nil
});
v22.defaultProps = {
    selected = false, 
    disabled = false, 
    rightSideGadgetSize = nil, 
    leftPaddingOffset = 0, 
    isElementBackgroundVisible = true, 
    dividerOffset = 0, 
    dividerSize = 1, 
    iconSize = 36, 
    selectedIconSize = 16, 
    iconPaddingLeft = 12, 
    textPadding = {
        left = 12, 
        right = 12
    }, 
    selectedIconPaddingRight = 24, 
    textOnlyPadding = 24, 
    keyLabelPaddingRight = 16, 
    borderCornerRadius = 4
};
v22.init = function(v23) --[[ Line: 135 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy)
    v23.state = {
        controlState = v16.Default, 
        keyLabelWidth = 0
    };
    v23.keyLabelSizeChanged = function(v24) --[[ Line: 142 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            keyLabelWidth = v24.AbsoluteSize.X
        });
    end;
    v23.setControlState = function(v25) --[[ Line: 148 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            controlState = v25
        });
    end;
    v23.onStateChanged = function(_, v27) --[[ Line: 154 ]]
        -- upvalues: v23 (copy)
        v23.setControlState(v27);
    end;
end;
v22.getImageProperties = function(v28) --[[ Line: 159 ]] --[[ Name: getImageProperties ]]
    -- upvalues: v21 (copy), v11 (copy)
    local l_ImageRectSize_0 = v21.ImageRectSize;
    local l_ImageRectOffset_0 = v21.ImageRectOffset;
    local v31 = 8 * v11.ImagesResolutionScale;
    local v32 = 8 * v11.ImagesResolutionScale;
    local v33 = Rect.new(v31, v32, l_ImageRectSize_0.x - v31, l_ImageRectSize_0.y - v32);
    local l_X_0 = l_ImageRectSize_0.X;
    local v35 = math.floor(l_X_0 / 2);
    local _ = nil;
    local _ = nil;
    local _ = nil;
    if v28.props.hasRoundTop and v28.props.hasRoundBottom then
        return l_ImageRectSize_0, l_ImageRectOffset_0, v33;
    elseif v28.props.hasRoundTop then
        return Vector2.new(l_X_0, v35), l_ImageRectOffset_0, (Rect.new(v35 - 1, v35 - 1, v35 + 1, v35));
    elseif v28.props.hasRoundBottom then
        return Vector2.new(l_X_0, v35), l_ImageRectOffset_0 + Vector2.new(0, v35), (Rect.new(v35 - 1, 0, v35 + 1, 1));
    else
        return Vector2.new(1, 1), l_ImageRectOffset_0 + Vector2.new(v35, v35), (Rect.new(0, 0, 0, 0));
    end;
end;
v22.renderRoundedBackground = function(v39, v40, v41) --[[ Line: 193 ]] --[[ Name: renderRoundedBackground ]]
    -- upvalues: v2 (copy), v18 (copy)
    local v42 = UDim.new(0, v39.props.borderCornerRadius);
    return v2.createElement(v18, {
        zIndex = v40, 
        background = v41, 
        topCornerRadius = if v39.props.hasRoundTop then v42 else nil, 
        bottomCornerRadius = if v39.props.hasRoundBottom then v42 else nil
    });
end;
v22.renderWithSelectionCursor = function(v43, v44) --[[ Line: 203 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v4 (copy), v16 (copy), v13 (copy), l_Object_0 (copy), v2 (copy), v10 (copy), v12 (copy), v17 (copy), v11 (copy), v20 (copy), v19 (copy), v15 (copy)
    return v4(function(v45) --[[ Line: 204 ]]
        -- upvalues: v43 (copy), v16 (ref), v13 (ref), l_Object_0 (ref), v2 (ref), v10 (ref), v12 (ref), v17 (ref), v11 (ref), v20 (ref), v19 (ref), v44 (copy), v15 (ref)
        local l_Theme_0 = v45.Theme;
        local l_Font_0 = v45.Font;
        local l_Settings_0 = v45.Settings;
        local l_textOnlyPadding_0 = v43.props.textOnlyPadding;
        if v43.props.icon then
            l_textOnlyPadding_0 = v43.props.iconPaddingLeft;
        end;
        l_textOnlyPadding_0 = l_textOnlyPadding_0 + v43.props.leftPaddingOffset;
        local v50 = 0;
        if v43.props.keyCodeLabel then
            v50 = v43.props.keyLabelPaddingRight;
        elseif v43.props.selected then
            v50 = v43.props.selectedIconPaddingRight;
        end;
        local v51 = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 1
        };
        if v43.state.controlState == v16.Pressed then
            v51 = l_Theme_0.BackgroundOnPress;
        elseif v43.state.controlState == v16.Hover then
            v51 = l_Theme_0.BackgroundOnHover;
        end;
        local v52, v53, v54 = v43:getImageProperties();
        local v55 = 0;
        local v56 = true;
        if v43.props.rightSideGadgetSize ~= nil then
            v55 = v43.props.rightSideGadgetSize.X + v43.props.iconPaddingLeft + v43.props.iconSize + v43.props.textPadding.left;
        else
            if v43.props.icon then
                v56 = false;
                l_textOnlyPadding_0 = v43.props.iconPaddingLeft;
                v55 = v43.props.iconPaddingLeft + v43.props.iconSize;
            end;
            if v43.props.selected then
                v56 = false;
                v55 = v55 + v43.props.selectedIconSize + v43.props.selectedIconPaddingRight;
            end;
            if v43.props.keyCodeLabel then
                v56 = false;
                v55 = v55 + v43.props.keyLabelPaddingRight + v43.state.keyLabelWidth;
            end;
            v55 = if v56 then v55 + v43.props.textOnlyPadding * 2 else v55 + v43.props.textPadding.left + v43.props.textPadding.right;
        end;
        local l_TextEmphasis_0 = l_Theme_0.TextEmphasis;
        if v43.props.textColorOverride then
            l_TextEmphasis_0 = {
                Color = v43.props.textColorOverride, 
                Transparency = l_Theme_0.TextEmphasis.Transparency
            };
        end;
        if v43.state.controlState == v16.Pressed or v43.props.disabled then
            l_TextEmphasis_0 = {
                Color = l_TextEmphasis_0.Color, 
                Transparency = v13(l_Theme_0.TextEmphasis.Transparency, 2)
            };
        end;
        local l_BackgroundUIDefault_0 = l_Theme_0.BackgroundUIDefault;
        local v59 = l_Object_0.assign({}, {
            Color = l_BackgroundUIDefault_0.Color, 
            Transparency = l_BackgroundUIDefault_0.Transparency
        }, v43.props.background);
        v59.Transparency = v59.Transparency * l_Settings_0.PreferredTransparency;
        local v60 = {
            Background = if v43.props.isElementBackgroundVisible then v43:renderRoundedBackground(-1, v59) else nil, 
            Divider = v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -v43.props.dividerOffset, 0, v43.props.dividerSize), 
                Position = UDim2.new(0, v43.props.dividerOffset, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                Visible = v43.props.hasDivider
            }), 
            StateOverlay = v43:renderRoundedBackground(2, v51), 
            LeftAlignedContent = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v43.props.textPadding.left)
                }), 
                LeftPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_textOnlyPadding_0)
                }), 
                Icon = v43.props.icon and v2.createElement(v10.Label, {
                    Image = v43.props.icon, 
                    Size = UDim2.fromOffset(v43.props.iconSize, v43.props.iconSize), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v43.props.iconColorOverride or l_Theme_0.IconEmphasis.Color, 
                    ImageTransparency = v13(l_Theme_0.IconEmphasis.Transparency, v43.props.disabled and 2 or 1), 
                    LayoutOrder = 1
                }), 
                Text = v2.createElement(v12, {
                    fontStyle = v43.props.fontStyle or l_Font_0.Header2, 
                    colorStyle = l_TextEmphasis_0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -v55, 1, 0), 
                    Text = v43.props.text, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = false, 
                    LayoutOrder = 2
                })
            }), 
            RightAlignedContent = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v43.props.textPadding.right)
                }), 
                RightPadding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v50)
                }), 
                RightSideContent = v43.props.renderRightSideGadget and v43.props.rightSideGadgetSize and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 3, 
                    Size = UDim2.fromOffset(v43.props.rightSideGadgetSize.X, v43.props.rightSideGadgetSize.Y)
                }, v43.props.renderRightSideGadget()) or v2.createFragment({
                    KeyLabel = v43.props.keyCodeLabel and v2.createElement(v17, {
                        keyCode = v43.props.keyCodeLabel, 
                        LayoutOrder = 2, 
                        [v2.Change.AbsoluteSize] = v43.keyLabelSizeChanged
                    }), 
                    SelectedIcon = v2.createElement(v10.Label, {
                        Image = v11["icons/status/success_small"], 
                        Size = UDim2.fromOffset(v43.props.selectedIconSize, v43.props.selectedIconSize), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Visible = v43.props.selected
                    })
                })
            })
        };
        if v20.useInteractableWithTileAndCell then
            return v2.createElement(v19, {
                Size = UDim2.new(1, 0, 0, v43.props.elementHeight), 
                BackgroundTransparency = 1, 
                Image = nil, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v54, 
                ImageRectSize = v52, 
                ImageRectOffset = v53, 
                SliceScale = 1 / v11.ImagesResolutionScale, 
                ImageTransparency = 1, 
                ImageColor3 = v59.Color, 
                AutoButtonColor = false, 
                LayoutOrder = v43.props.layoutOrder, 
                BorderSizePixel = 0, 
                [v2.Ref] = v43.props.setButtonRef, 
                SelectionImageObject = if v20.migrateToNewSelectionCursor then v43.props.selectionCursor else v44(v43.props.cursorKind), 
                SelectionOrder = v43.props.selectionOrder, 
                onStateChanged = v43.onStateChanged, 
                [v2.Event.Activated] = v43.props.onActivated, 
                isDisabled = v43.props.disabled
            }, v60);
        else
            return v2.createElement(v15, {
                controlComponent = {
                    component = "ImageButton", 
                    props = {
                        Size = UDim2.new(1, 0, 0, v43.props.elementHeight), 
                        BackgroundTransparency = 1, 
                        Image = nil, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v54, 
                        ImageRectSize = v52, 
                        ImageRectOffset = v53, 
                        SliceScale = 1 / v11.ImagesResolutionScale, 
                        ImageTransparency = 1, 
                        ImageColor3 = v59.Color, 
                        AutoButtonColor = false, 
                        LayoutOrder = v43.props.layoutOrder, 
                        BorderSizePixel = 0, 
                        [v2.Ref] = v43.props.setButtonRef, 
                        [v2.Event.Activated] = v43.props.onActivated, 
                        SelectionImageObject = if v20.migrateToNewSelectionCursor then v43.props.selectionCursor else v44(v43.props.cursorKind), 
                        SelectionOrder = v43.props.selectionOrder
                    }, 
                    children = v60
                }, 
                onStateChanged = function(_, v62) --[[ Line: 446 ]] --[[ Name: onStateChanged ]]
                    -- upvalues: v43 (ref)
                    v43.setControlState(v62);
                end, 
                isDisabled = v43.props.disabled
            });
        end;
    end);
end;
v22.render = function(v63) --[[ Line: 455 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy)
    return v6(function(v64) --[[ Line: 456 ]]
        -- upvalues: v63 (copy)
        return v63:renderWithSelectionCursor(v64);
    end);
end;
return v22;