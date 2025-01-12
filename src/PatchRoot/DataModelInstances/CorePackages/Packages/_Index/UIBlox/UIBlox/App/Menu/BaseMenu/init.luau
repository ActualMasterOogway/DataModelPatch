local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.RoactGamepad);
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Parent_2.t);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.Core.Style.useStyle);
local v10 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v11 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v12 = require(script.Parent.validateButtonProps);
local v13 = require(l_Parent_0.Container.VerticalScrollView);
local v14 = require(l_Parent_0.ImageSet.Images);
local v15 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v16 = require(l_Parent_0.SelectionImage.CursorKind);
local v17 = require(l_Parent_0.SelectionCursor.withCursor);
local v18 = require(l_Parent_0.SelectionCursor.CursorType);
local v19 = require(l_Parent_1.Utility.setDefault);
local v20 = require(script.Parent.Cell);
local v21 = require(script.Parent.RoundedFrame);
local v22 = require(script.Parent.StyleDefaults);
local v23 = require(l_Parent_1.UIBloxConfig);
local v24 = v14["component_assets/dropshadow_17_8"];
local v25 = v4.PureComponent:extend("BaseMenu");
v25.validateProps = v7.strictInterface({
    buttonProps = v12, 
    width = v7.optional(v7.UDim), 
    position = v7.optional(v7.union(v7.UDim2, v7.table)), 
    anchorPoint = v7.optional(v7.Vector2), 
    layoutOrder = v7.optional(v7.number), 
    topElementRounded = v7.optional(v7.boolean), 
    bottomElementRounded = v7.optional(v7.boolean), 
    setFirstItemRef = v7.optional(v7.union(v7.callback, v7.table)), 
    setFrameRef = v7.optional(v7.union(v7.callback, v7.table)), 
    stayOnActivated = v7.optional(v7.boolean), 
    maxHeight = v7.optional(v7.number), 
    showDropShadow = v7.optional(v7.boolean), 
    fixedListHeight = v7.optional(v7.number), 
    isElementBackgroundVisible = v7.optional(v7.boolean), 
    isElementDividerVisible = v7.optional(v7.boolean), 
    elementHeight = v7.optional(v7.number), 
    borderCornerRadius = v7.optional(v7.integer), 
    background = v7.optional(v10), 
    enableTokenOverride = v7.optional(v7.boolean), 
    renderHeader = v7.optional(v7.callback), 
    headerHeight = v7.optional(v7.number), 
    selectionOrder = v7.optional(v7.number)
});
v25.defaultProps = {
    width = UDim.new(1, 0), 
    position = UDim2.new(0, 0, 0, 0), 
    topElementRounded = true, 
    bottomElementRounded = true, 
    showDropShadow = false, 
    fixedListHeight = nil, 
    isElementBackgroundVisible = true, 
    isElementDividerVisible = true, 
    elementHeight = 56, 
    borderCornerRadius = 4, 
    enableTokenOverride = true, 
    headerHeight = 0
};
v25.init = function(v26) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v26.gamepadRefs = v3.createRefCache();
end;
v25.renderFixedHeightMenu = function(_, v28, v29, v30) --[[ Line: 102 ]] --[[ Name: renderFixedHeightMenu ]]
    -- upvalues: v19 (copy), v4 (copy), v11 (copy), v24 (copy), v13 (copy)
    local l_fixedListHeight_0 = v28.fixedListHeight;
    local v32 = v19(v28.borderCornerRadius, 8);
    local l_BackgroundUIDefault_0 = v29.Theme.BackgroundUIDefault;
    local v34 = v19(v28.background, {
        Color = l_BackgroundUIDefault_0.Color, 
        Transparency = l_BackgroundUIDefault_0.Transparency
    });
    return v4.createElement("Frame", {
        AnchorPoint = v28.anchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v28.layoutOrder, 
        Size = UDim2.new(v28.width.Scale, v28.width.Offset, 0, l_fixedListHeight_0), 
        Position = v28.position
    }, {
        DropShadow = v28.showDropShadow and v4.createElement(v11.Label, {
            ZIndex = 2, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 16, 1, 16), 
            Image = v24, 
            ImageColor3 = v29.Theme.DropShadow.Color, 
            ImageTransparency = v29.Theme.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(16, 16, 16, 16)
        }) or nil, 
        ContentFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundColor3 = v34.Color, 
            BackgroundTransparency = v34.Transparency, 
            ZIndex = 3
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v32)
            }), 
            ClippingFrame = v4.createElement("Frame", {
                ZIndex = 4, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -v32 * 2), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                ClipsDescendants = true
            }, {
                ScrollingFrame = v4.createElement(v13, {
                    canvasSizeY = UDim.new(0, #v28.buttonProps * v28.elementHeight), 
                    selectable = false
                }, v30)
            })
        })
    });
end;
v25.render = function(v35) --[[ Line: 157 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v23 (copy), v18 (copy), v17 (copy), v4 (copy), v3 (copy), v20 (copy), v16 (copy), v15 (copy), v8 (copy), v19 (copy), v11 (copy), v24 (copy), v21 (copy)
    local l_headerHeight_0 = v35.props.headerHeight;
    local v37 = v35.props.elementHeight * 7.5 + l_headerHeight_0;
    local v38 = #v35.props.buttonProps * v35.props.elementHeight + l_headerHeight_0;
    local v39 = false;
    if v37 <= v38 then
        v38 = v37;
        v39 = true;
    end;
    local l_maxHeight_0 = v35.props.maxHeight;
    if l_maxHeight_0 and l_maxHeight_0 > 0 and l_maxHeight_0 < v38 then
        v38 = (math.max(math.floor((l_maxHeight_0 - v35.props.elementHeight * 0.5 - l_headerHeight_0) / v35.props.elementHeight), 1) + 0.5) * v35.props.elementHeight + l_headerHeight_0;
        v39 = true;
    end;
    local v41 = {};
    for v42, v43 in ipairs(v35.props.buttonProps) do
        local v44 = v6.Dictionary.join(v43, {
            elementHeight = v35.props.elementHeight, 
            hasRoundTop = v35.props.topElementRounded and v42 == 1 and not v39, 
            hasRoundBottom = v35.props.bottomElementRounded and v42 == #v35.props.buttonProps and not v39, 
            hasDivider = if v35.props.isElementDividerVisible then v42 < #v35.props.buttonProps else false, 
            layoutOrder = v42, 
            inputBindingKey = v6.None, 
            setButtonRef = v42 == 1 and v35.props.setFirstItemRef or nil, 
            isElementBackgroundVisible = v35.props.isElementBackgroundVisible, 
            borderCornerRadius = v35.props.borderCornerRadius, 
            background = v35.props.background
        });
        do
            local l_v44_0 = v44;
            if v23.migrateToNewSelectionCursor then
                local v46 = nil;
                v46 = if l_v44_0.hasRoundBottom and l_v44_0.hasRoundTop then v18.RoundedRectNoInset else if l_v44_0.hasRoundBottom then v18.BulletDown else if l_v44_0.hasRoundTop then v18.BulletUp else v18.Square;
                do
                    local l_v46_0 = v46;
                    v41["cell " .. v42] = v17(function(v48) --[[ Line: 205 ]]
                        -- upvalues: l_v46_0 (ref), l_v44_0 (ref), v6 (ref), v35 (copy), v4 (ref), v3 (ref), v42 (copy), v43 (copy), v20 (ref)
                        local v49 = v48.getCursorByType(l_v46_0);
                        l_v44_0 = v6.Dictionary.join(l_v44_0, {
                            selectionCursor = v49, 
                            selectionOrder = v35.props.selectionOrder
                        });
                        return v4.createElement(v3.Focusable.Frame, {
                            Size = UDim2.new(v35.props.width, UDim.new(0, v35.props.elementHeight)), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = v42, 
                            [v4.Ref] = v35.gamepadRefs[v42], 
                            NextSelectionUp = v42 > 1 and v35.gamepadRefs[v42 - 1] or nil, 
                            NextSelectionDown = v42 < #v35.props.buttonProps and v35.gamepadRefs[v42 + 1] or nil, 
                            inputBindings = {
                                Activated = v3.Input.onBegin(Enum.KeyCode.ButtonA, v43.onActivated, {
                                    key = v43.inputBindingKey
                                })
                            }, 
                            SelectionImageObject = v49
                        }, {
                            Cell = v4.createElement(v20, l_v44_0)
                        });
                    end);
                end;
            else
                local v50 = nil;
                v50 = if l_v44_0.hasRoundBottom and l_v44_0.hasRoundTop then v16.RoundedRectNoInset else if l_v44_0.hasRoundBottom then v16.BulletDown else if l_v44_0.hasRoundTop then v16.BulletUp else v16.Square;
                l_v44_0 = v6.Dictionary.join(l_v44_0, {
                    cursorKind = v50, 
                    selectionOrder = v35.props.selectionOrder
                });
                do
                    local l_v50_0 = v50;
                    v41["cell " .. v42] = v15(function(v52) --[[ Line: 245 ]]
                        -- upvalues: v4 (ref), v3 (ref), v35 (copy), v42 (copy), v43 (copy), l_v50_0 (ref), v20 (ref), l_v44_0 (ref)
                        return v4.createElement(v3.Focusable.Frame, {
                            Size = UDim2.new(v35.props.width, UDim.new(0, v35.props.elementHeight)), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = v42, 
                            [v4.Ref] = v35.gamepadRefs[v42], 
                            NextSelectionUp = v42 > 1 and v35.gamepadRefs[v42 - 1] or nil, 
                            NextSelectionDown = v42 < #v35.props.buttonProps and v35.gamepadRefs[v42 + 1] or nil, 
                            inputBindings = {
                                Activated = v3.Input.onBegin(Enum.KeyCode.ButtonA, v43.onActivated, {
                                    key = v43.inputBindingKey
                                })
                            }, 
                            SelectionImageObject = v52(l_v50_0)
                        }, {
                            Cell = v4.createElement(v20, l_v44_0)
                        });
                    end);
                end;
            end;
        end;
    end;
    v41.layout = v4.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v8(function(v53) --[[ Line: 273 ]]
        -- upvalues: v19 (ref), v35 (copy), v39 (ref), v41 (copy), v4 (ref), v38 (ref), v11 (ref), v24 (ref), v21 (ref), l_headerHeight_0 (copy)
        local l_Theme_0 = v53.Theme;
        local l_BackgroundUIDefault_1 = l_Theme_0.BackgroundUIDefault;
        local v56 = v19(v35.props.background, {
            Color = l_BackgroundUIDefault_1.Color, 
            Transparency = l_BackgroundUIDefault_1.Transparency
        });
        local l_isElementBackgroundVisible_0 = v35.props.isElementBackgroundVisible;
        local v58 = v39 and v35.props.topElementRounded and l_isElementBackgroundVisible_0;
        local v59 = v39 and v35.props.bottomElementRounded and l_isElementBackgroundVisible_0;
        local v60 = (v58 and 1 or 0) + (v59 and 1 or 0);
        local l_renderHeader_0 = v35.props.renderHeader;
        local v62 = not v58 and (l_renderHeader_0 and true or false);
        if v35.props.fixedListHeight then
            return v35:renderFixedHeightMenu(v35.props, v53, v41);
        else
            return v4.createElement("Frame", {
                AnchorPoint = v35.props.anchorPoint, 
                BackgroundTransparency = 1, 
                LayoutOrder = v35.props.layoutOrder, 
                Size = UDim2.new(v35.props.width.Scale, v35.props.width.Offset, 0, v38), 
                Position = v35.props.position
            }, {
                DropShadow = v35.props.showDropShadow and v4.createElement(v11.Label, {
                    ZIndex = 2, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 16, 1, 16), 
                    Image = v24, 
                    ImageColor3 = v53.Theme.DropShadow.Color, 
                    ImageTransparency = v53.Theme.DropShadow.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(16, 16, 16, 16)
                }) or nil, 
                Background = if not not v58 or v59 then v4.createElement(v21, {
                    zIndex = -1, 
                    background = v56, 
                    topCornerRadius = if v58 then UDim.new(0, v35.props.borderCornerRadius) else nil, 
                    bottomCornerRadius = if v59 then UDim.new(0, v35.props.borderCornerRadius) else nil
                }) else nil, 
                ClippingFrame = v4.createElement("Frame", {
                    ZIndex = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -(v35.props.borderCornerRadius * v60)), 
                    Position = UDim2.fromScale(0, v58 and 0.5 or 0), 
                    AnchorPoint = Vector2.new(0, v58 and 0.5 or 0), 
                    ClipsDescendants = true
                }, {
                    HeaderFrame = if v62 then v4.createElement("Frame", {
                        Selectable = false, 
                        Size = UDim2.new(1, 0, 0, l_headerHeight_0), 
                        Position = UDim2.fromOffset(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        Header = l_renderHeader_0()
                    }) else nil, 
                    ScrollingFrame = v4.createElement("ScrollingFrame", {
                        [v4.Ref] = v35.props.setFrameRef, 
                        Selectable = false, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, v58 and -4 or 0, 1, if v62 then -l_headerHeight_0 else 0), 
                        Position = if v62 then UDim2.fromOffset(0, l_headerHeight_0) else nil, 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = v39 and 4 or 0, 
                        ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                        ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        CanvasSize = UDim2.new(1, 0, 0, #v35.props.buttonProps * v35.props.elementHeight), 
                        ClipsDescendants = v62
                    }, v41)
                })
            });
        end;
    end);
end;
return function(v63) --[[ Line: 369 ]] --[[ Name: BaseMenuFn ]]
    -- upvalues: v9 (copy), v6 (copy), v22 (copy), v5 (copy), v25 (copy)
    local l_v63_0 = v63;
    if v63.enableTokenOverride then
        local v65 = v9();
        local v66 = {};
        for v67, v68 in ipairs(v63.buttonProps) do
            v66[v67] = v6.Dictionary.join(v68, v22.getCellDefaultTokens(v65));
        end;
        l_v63_0 = v6.Dictionary.join(l_v63_0, v22.getBaseMenuDefaultTokens(v65), {
            buttonProps = v66
        });
    end;
    return v5.createElement(v25, l_v63_0);
end;