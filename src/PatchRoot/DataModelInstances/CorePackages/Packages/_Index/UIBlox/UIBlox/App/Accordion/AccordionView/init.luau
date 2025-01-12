local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.UIBloxConfig);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Utility.SpringAnimatedItem);
local v6 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v7 = v3.PureComponent:extend("AccordionView");
v7.validateProps = v4.strictInterface({
    items = v4.table, 
    itemWidth = v4.number, 
    itemHeight = v4.number, 
    renderItem = v4.callback, 
    placeholderColor = v4.Color3, 
    placeholderBaseTransparency = v4.number, 
    collapseButtonSize = v4.number, 
    renderCollapseButton = v4.callback, 
    LayoutOrder = v4.optional(v4.integer), 
    maxItemsInCompactView = v4.numberPositive, 
    onExpand = v4.optional(v4.callback), 
    onCollapse = v4.optional(v4.callback)
});
v7.defaultProps = {
    maxItemsInCompactView = 3
};
v7.init = function(v8) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v3 (copy)
    v8.state = {
        expanded = false, 
        isExpandButtonPressed = false
    };
    v8.onExpandButtonActivated = function() --[[ Line: 55 ]]
        -- upvalues: v2 (ref), v8 (copy)
        if v2.addCallbacksToAccordionView and v8.props.onExpand then
            v8.props.onExpand();
        end;
        v8:setState({
            expanded = true, 
            isExpandButtonPressed = false
        });
    end;
    v8.onCollapseButtonActivated = function() --[[ Line: 65 ]]
        -- upvalues: v2 (ref), v8 (copy)
        if v2.addCallbacksToAccordionView and v8.props.onCollapse then
            v8.props.onCollapse();
        end;
        v8:setState({
            expanded = false
        });
    end;
    v8.onExpandButtonInputBegan = function(_, v10) --[[ Line: 74 ]]
        -- upvalues: v8 (copy)
        if v10.UserInputState == Enum.UserInputState.Begin and (v10.UserInputType == Enum.UserInputType.Touch or v10.UserInputType == Enum.UserInputType.MouseButton1) then
            v8:setState({
                isExpandButtonPressed = true
            });
        end;
    end;
    v8.onExpandButtonInputEnded = function() --[[ Line: 88 ]]
        -- upvalues: v8 (copy)
        if v8.state.isExpandButtonPressed then
            v8:setState({
                isExpandButtonPressed = false
            });
        end;
    end;
    v8.rootFrameRef = v3.createRef();
    v8.onListLayoutAbsoluteContentSizeChanged = function(v11) --[[ Line: 98 ]]
        -- upvalues: v8 (copy)
        if v8.rootFrameRef.current then
            local l_itemWidth_0 = v8.props.itemWidth;
            local v13 = v8:getCompactTotalHeight();
            v8.rootFrameRef.current.Size = UDim2.new(0, l_itemWidth_0, 0, (math.max(v11.AbsoluteContentSize.Y, v13)));
        end;
    end;
end;
v7.getCompactTotalHeight = function(v14) --[[ Line: 109 ]] --[[ Name: getCompactTotalHeight ]]
    local l_items_0 = v14.props.items;
    local l_itemHeight_0 = v14.props.itemHeight;
    local l_maxItemsInCompactView_0 = v14.props.maxItemsInCompactView;
    local v18 = #l_items_0;
    if v18 == 0 then
        return 0;
    else
        return l_itemHeight_0 + (math.min(l_maxItemsInCompactView_0, v18) - 1) * 10;
    end;
end;
v7.getLayoutInfo = function(v19) --[[ Line: 122 ]] --[[ Name: getLayoutInfo ]]
    local l_items_1 = v19.props.items;
    local l_itemWidth_1 = v19.props.itemWidth;
    local l_itemHeight_1 = v19.props.itemHeight;
    local l_placeholderBaseTransparency_0 = v19.props.placeholderBaseTransparency;
    local l_maxItemsInCompactView_1 = v19.props.maxItemsInCompactView;
    local l_expanded_0 = v19.state.expanded;
    local v26 = {};
    local v27 = #l_items_1;
    local v28 = math.min(l_maxItemsInCompactView_1, v27);
    local v29 = 0;
    if v28 > 1 then
        v29 = (1 - l_placeholderBaseTransparency_0) / (v28 - 1);
    end;
    for v30 = 1, v27 do
        if l_expanded_0 then
            v26[v30] = {
                width = l_itemWidth_1, 
                height = l_itemHeight_1, 
                placeholderTransparency = 1, 
                itemTransparency = 0
            };
        elseif v30 == 1 then
            v26[v30] = {
                width = l_itemWidth_1, 
                height = l_itemHeight_1, 
                placeholderTransparency = 1, 
                itemTransparency = 0
            };
        elseif v30 <= l_maxItemsInCompactView_1 then
            v26[v30] = {
                width = l_itemWidth_1 - 20 * (v30 - 1), 
                height = 10, 
                placeholderTransparency = l_placeholderBaseTransparency_0 + v29 * (v30 - 2), 
                itemTransparency = 1
            };
        else
            v26[v30] = {
                width = l_itemWidth_1 - 20 * (v30 - 1), 
                height = 0, 
                placeholderTransparency = 1, 
                itemTransparency = 1
            };
        end;
    end;
    return v26;
end;
v7.render = function(v31) --[[ Line: 176 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy)
    local l_items_2 = v31.props.items;
    local v33 = #l_items_2;
    if v33 == 0 then
        return nil;
    else
        local l_LayoutOrder_0 = v31.props.LayoutOrder;
        local l_itemWidth_2 = v31.props.itemWidth;
        local l_renderItem_0 = v31.props.renderItem;
        local l_placeholderColor_0 = v31.props.placeholderColor;
        local l_collapseButtonSize_0 = v31.props.collapseButtonSize;
        local l_renderCollapseButton_0 = v31.props.renderCollapseButton;
        local l_expanded_1 = v31.state.expanded;
        local l_isExpandButtonPressed_0 = v31.state.isExpandButtonPressed;
        local v42 = v31:getLayoutInfo();
        local v46 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_expanded_1 and 10 or 0), 
                [v3.Change.AbsoluteContentSize] = v31.onListLayoutAbsoluteContentSizeChanged
            }), 
            Scaler = v3.createElement(v5.AnimatedUIScale, {
                springOptions = v6, 
                animatedValues = {
                    scale = l_isExpandButtonPressed_0 and 0.9 or 1
                }, 
                mapValuesToProps = function(v43) --[[ Line: 209 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Scale = v43.scale
                    };
                end
            }), 
            CollapseButton = v3.createElement(v5.AnimatedFrame, {
                springOptions = v6, 
                animatedValues = {
                    sizeOffsetY = l_expanded_1 and l_collapseButtonSize_0 + 1 or 0
                }, 
                mapValuesToProps = function(v44) --[[ Line: 222 ]] --[[ Name: mapValuesToProps ]]
                    -- upvalues: l_collapseButtonSize_0 (copy)
                    return {
                        Size = UDim2.new(0, l_collapseButtonSize_0, 0, v44.sizeOffsetY)
                    };
                end, 
                regularProps = {
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v3.Children] = {
                        ButtonMoveContainer = v3.createElement(v5.AnimatedFrame, {
                            springOptions = v6, 
                            animatedValues = {
                                positionOffsetY = l_expanded_1 and 0 or l_collapseButtonSize_0 / 2
                            }, 
                            mapValuesToProps = function(v45) --[[ Line: 236 ]] --[[ Name: mapValuesToProps ]]
                                return {
                                    Position = UDim2.new(0, 0, 0, v45.positionOffsetY)
                                };
                            end, 
                            regularProps = {
                                Size = UDim2.new(0, l_collapseButtonSize_0, 0, l_collapseButtonSize_0), 
                                BackgroundTransparency = 1, 
                                [v3.Children] = {
                                    Button = l_renderCollapseButton_0(v31.onCollapseButtonActivated)
                                }
                            }
                        })
                    }
                }
            })
        };
        for v47, _ in ipairs(l_items_2) do
            local v49 = v42[v47];
            v46["Item" .. tostring(v47)] = v3.createElement(v5.AnimatedFrame, {
                springOptions = v6, 
                animatedValues = {
                    width = v49.width, 
                    height = v49.height
                }, 
                mapValuesToProps = function(v50) --[[ Line: 263 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Size = UDim2.new(0, v50.width, 0, v50.height)
                    };
                end, 
                regularProps = {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = v47 + 1, 
                    ZIndex = v33 + 1 - v47, 
                    ClipsDescendants = true, 
                    [v3.Children] = {
                        Item = l_renderItem_0(l_items_2[v47], v49.itemTransparency, v6), 
                        Placeholder = v3.createElement(v5.AnimatedFrame, {
                            key = "Placeholder", 
                            springOptions = v6, 
                            animatedValues = {
                                transparency = v49.placeholderTransparency
                            }, 
                            mapValuesToProps = function(v51) --[[ Line: 283 ]] --[[ Name: mapValuesToProps ]]
                                return {
                                    BackgroundTransparency = v51.transparency
                                };
                            end, 
                            regularProps = {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundColor3 = l_placeholderColor_0, 
                                BorderSizePixel = 0
                            }
                        })
                    }
                }
            });
        end;
        local v52 = v33 > 1 and not l_expanded_1;
        return v3.createElement("Frame", {
            Size = UDim2.new(0, l_itemWidth_2, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            [v3.Ref] = v31.rootFrameRef
        }, {
            ContentFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, v46), 
            ClickToExpandButton = v52 and v3.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = v33 + 1, 
                Text = "", 
                [v3.Event.Activated] = v31.onExpandButtonActivated, 
                [v3.Event.InputBegan] = v31.onExpandButtonInputBegan, 
                [v3.Event.InputEnded] = v31.onExpandButtonInputEnded
            })
        });
    end;
end;
return v7;