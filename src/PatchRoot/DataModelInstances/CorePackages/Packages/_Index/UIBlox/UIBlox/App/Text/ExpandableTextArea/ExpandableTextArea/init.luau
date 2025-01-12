local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_1.Core.Style.withStyle);
local v8 = require(l_Parent_1.Utility.SpringAnimatedItem);
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.App.ImageSet.Images);
local v11 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Parent_1.Core.Text.ExpandableText.ExpandableTextUtils);
local v13 = require(l_Parent_0.SelectionImage.CursorKind);
local v14 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v15 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v16 = require(l_Parent_0.SelectionCursor.CursorType);
local v17 = require(l_Parent_1.UIBloxConfig);
local v18 = 30;
local v19 = 5;
local v20 = UDim2.new(0, 36, 0, 36);
local v21 = UDim2.new(1, 0, 0, 36);
local v22 = v10["gradient/gradient_0_100"];
local v23 = v10["truncate_arrows/actions_truncationExpand"];
local v24 = v10["truncate_arrows/actions_truncationCollapse"];
local v25 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v26 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v27 = v8.wrap(v9.Label);
local v28 = v3.PureComponent:extend("ExpandableTextArea");
v28.validateProps = v6.strictInterface({
    Text = v6.optional(v6.string), 
    Position = v6.optional(v6.UDim2), 
    compactNumberOfLines = v6.optional(v6.number), 
    LayoutOrder = v6.optional(v6.number), 
    width = v6.optional(v6.UDim), 
    padding = v6.optional(v6.Vector2), 
    onClick = v6.optional(v6.callback), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    selectionCursor = if v17.migrateToNewSelectionCursor then v6.optional(v6.any) else nil, 
    gradientColor = if v17.enableExpandableTextAreaGradientFix then v6.optional(v6.Color3) else nil
});
v28.defaultProps = {
    compactNumberOfLines = 2, 
    Text = ""
};
v28.init = function(v29) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v29.state = {
        isExpanded = false, 
        frameWidth = 0
    };
    v29.onClick = function() --[[ Line: 80 ]]
        -- upvalues: v29 (copy)
        v29:setState(function(v30) --[[ Line: 81 ]]
            return {
                isExpanded = not v30.isExpanded
            };
        end);
        if v29.props.onClick then
            v29.props.onClick(v29.state.isExpanded);
        end;
    end;
    v29.ref = v3.createRef();
    v29.layoutRef = v3.createRef();
end;
v28.getRef = function(v31) --[[ Line: 95 ]] --[[ Name: getRef ]]
    return v31.props.frameRef or v31.ref;
end;
v28.applyFit = function(v32, v33) --[[ Line: 99 ]] --[[ Name: applyFit ]]
    -- upvalues: v18 (ref), v19 (ref)
    local v34 = v32:getRef();
    if not v34.current then
        return;
    else
        local l_current_0 = v34.current;
        local v36 = v33 + v18 + v19;
        local l_width_0 = v32.props.width;
        if l_width_0 then
            l_current_0.Size = UDim2.new(l_width_0.Scale, l_width_0.Offset, 0, v36);
            return;
        else
            l_current_0.Size = UDim2.new(1, 0, 0, v36);
            return;
        end;
    end;
end;
v28.didMount = function(v38) --[[ Line: 114 ]] --[[ Name: didMount ]]
    v38.isMounted = true;
    local l_current_1 = v38.layoutRef.current;
    if l_current_1 then
        v38:applyFit(l_current_1.AbsoluteContentSize.y);
    end;
end;
v28.willUnmount = function(v40) --[[ Line: 123 ]] --[[ Name: willUnmount ]]
    v40.isMounted = false;
end;
v28.render = function(v41) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: v18 (ref), v19 (ref), v7 (copy), v14 (copy), v12 (copy), v5 (copy), v3 (copy), v17 (copy), v13 (copy), v8 (copy), v25 (copy), v11 (copy), v27 (copy), v22 (copy), v26 (copy), v21 (copy), v9 (copy), v24 (copy), v23 (copy), v20 (copy)
    local l_Text_0 = v41.props.Text;
    local l_Position_0 = v41.props.Position;
    local l_compactNumberOfLines_0 = v41.props.compactNumberOfLines;
    local l_LayoutOrder_0 = v41.props.LayoutOrder;
    local l_width_1 = v41.props.width;
    local l_padding_0 = v41.props.padding;
    local l_gradientColor_0 = v41.props.gradientColor;
    local v49 = v41:getRef();
    v18 = l_padding_0 and l_padding_0.Y or 30;
    v19 = l_padding_0 and l_padding_0.X or 5;
    return v7(function(v50) --[[ Line: 140 ]]
        -- upvalues: v14 (ref), v12 (ref), v41 (copy), l_Text_0 (copy), l_compactNumberOfLines_0 (copy), v19 (ref), v5 (ref), v3 (ref), l_LayoutOrder_0 (copy), l_Position_0 (copy), l_width_1 (copy), v17 (ref), v13 (ref), v49 (copy), v18 (ref), v8 (ref), v25 (ref), v11 (ref), v27 (ref), v22 (ref), l_gradientColor_0 (copy), v26 (ref), v21 (ref), v9 (ref), v24 (ref), v23 (ref), v20 (ref)
        return v14(function(v51) --[[ Line: 141 ]]
            -- upvalues: v50 (copy), v12 (ref), v41 (ref), l_Text_0 (ref), l_compactNumberOfLines_0 (ref), v19 (ref), v5 (ref), v3 (ref), l_LayoutOrder_0 (ref), l_Position_0 (ref), l_width_1 (ref), v17 (ref), v13 (ref), v49 (ref), v18 (ref), v8 (ref), v25 (ref), v11 (ref), v27 (ref), v22 (ref), l_gradientColor_0 (ref), v26 (ref), v21 (ref), v9 (ref), v24 (ref), v23 (ref), v20 (ref)
            local l_Theme_0 = v50.Theme;
            local l_Font_0 = v50.Font;
            local v54 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v55, v56 = v12.getExpandableTextHeights(l_Font_0, v41.state.frameWidth, l_Text_0, l_compactNumberOfLines_0);
            local v57 = UDim2.new(1, 0, 0, v56 + v19);
            local v58 = UDim2.new(1, 0, 0, v55 + v19);
            local v59 = v56 < v55;
            local v60 = not v59 or v41.state.isExpanded;
            local v61 = v60 and v58 or v57;
            local v62 = v60 and 0 or 30;
            local v63 = v59 and v5.Focusable.Frame or "Frame";
            return v3.createElement(v63, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                Size = l_width_1 and UDim2.new(l_width_1.Scale, l_width_1.Offset, 0, 0) or UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                SelectionImageObject = if v17.migrateToNewSelectionCursor then v41.props.selectionCursor else v51(v13.RoundedRect), 
                [v3.Ref] = v49, 
                [v3.Change.AbsoluteSize] = function(v64) --[[ Line: 174 ]]
                    -- upvalues: v41 (ref)
                    if v41.state.frameWidth ~= v64.AbsoluteSize.X then
                        v41:setState({
                            frameWidth = v64.AbsoluteSize.X
                        });
                    end;
                end, 
                NextSelectionUp = v41.props.NextSelectionUp, 
                NextSelectionDown = v41.props.NextSelectionDown, 
                NextSelectionLeft = v41.props.NextSelectionLeft, 
                NextSelectionRight = v41.props.NextSelectionRight, 
                inputBindings = v59 and {
                    Activated = v5.Input.onBegin(Enum.KeyCode.ButtonA, v41.onClick)
                } or nil
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10), 
                    [v3.Change.AbsoluteContentSize] = function(v65) --[[ Line: 197 ]]
                        -- upvalues: v41 (ref)
                        v41:applyFit(v65.AbsoluteContentSize.y);
                    end, 
                    [v3.Ref] = v41.layoutRef
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v18)
                }), 
                ExpandableContainer = v3.createElement(v8.AnimatedFrame, {
                    animatedValues = {
                        height = v61.Y.Offset
                    }, 
                    mapValuesToProps = function(v66) --[[ Line: 210 ]] --[[ Name: mapValuesToProps ]]
                        -- upvalues: v61 (copy)
                        return {
                            Size = UDim2.new(1, 0, v61.Y.Scale, v66.height)
                        };
                    end, 
                    regularProps = {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        ClipsDescendants = true, 
                        Size = v61, 
                        LayoutOrder = 0
                    }, 
                    springOptions = v25
                }, {
                    DescriptionText = v3.createElement(v11, {
                        colorStyle = l_Theme_0.TextDefault, 
                        fontStyle = l_Font_0.Body, 
                        Size = v61, 
                        Text = l_Text_0, 
                        TextSize = v54, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    Gradient = v59 and v3.createElement(v27, {
                        animatedValues = {
                            height = v62
                        }, 
                        mapValuesToProps = function(v67) --[[ Line: 238 ]] --[[ Name: mapValuesToProps ]]
                            return {
                                Size = UDim2.new(1, 0, 0, v67.height)
                            };
                        end, 
                        regularProps = {
                            Size = UDim2.new(1, 0, 0, 30), 
                            Position = UDim2.new(0, 0, 1, 0), 
                            AnchorPoint = Vector2.new(0, 1), 
                            BackgroundTransparency = 1, 
                            Image = v22, 
                            ImageColor3 = if v17.enableExpandableTextAreaGradientFix then l_gradientColor_0 or l_Theme_0.BackgroundDefault.Color else l_Theme_0.BackgroundDefault.Color
                        }, 
                        springOptions = v26
                    })
                }), 
                ButtonContainer = v59 and v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 10), 
                    LayoutOrder = 1
                }, {
                    PressableButton = v3.createElement("TextButton", {
                        Position = UDim2.new(0, 0, 0, -24), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = v21, 
                        Text = "", 
                        [v3.Event.Activated] = v41.onClick
                    }, {
                        DownArrow = v3.createElement(v9.Label, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            Image = v61 == v58 and v24 or v23, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            Size = v20
                        })
                    })
                })
            });
        end);
    end);
end;
return v3.forwardRef(function(v68, v69) --[[ Line: 287 ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy), v4 (copy), v3 (copy), v28 (copy)
    local v70 = v15(v16.RoundedRect);
    if v17.migrateToNewSelectionCursor then
        v68 = v4.Dictionary.join({
            selectionCursor = v70
        }, v68);
    end;
    return v3.createElement(v28, v4.Dictionary.join(v68, {
        frameRef = v69
    }));
end);