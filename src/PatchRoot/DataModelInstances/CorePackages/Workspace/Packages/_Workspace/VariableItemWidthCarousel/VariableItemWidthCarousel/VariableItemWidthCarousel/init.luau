local l_script_FirstAncestor_0 = script:FindFirstAncestor("VariableItemWidthCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.CollectionViews);
local v3 = require(l_Parent_0.React);
local l_CarouselScrollButtons_0 = v2.CarouselScrollButtons;
local l_CollectionHeader_0 = v2.CollectionHeader;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v7 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v7.useLastInput;
local l_usePreferredInput_0 = v7.usePreferredInput;
local l_useIsSpatial_0 = v7.useIsSpatial;
local v11 = require(l_script_FirstAncestor_0.useVariableItemWidthScrollHandlers);
local l_FFlagLuaAppTopChartsFiltersEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTopChartsFiltersEnabled;
local l_FFlagLuaAppUpdateCollectionHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateCollectionHeader;
local function _(v14, v15, v16) --[[ Line: 51 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v7 (copy)
    if not v16 then
        return false;
    else
        local v17 = false;
        if v14 == v7.Input.Pointer then
            v17 = v15 ~= v7.Input.Directional;
        end;
        return v17;
    end;
end;
VariableItemWidthCarousel = function(v19, v20) --[[ Line: 63 ]] --[[ Name: VariableItemWidthCarousel ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v7 (copy), v3 (copy), v11 (copy), l_FFlagLuaAppTopChartsFiltersEnabled_0 (copy), l_CollectionHeader_0 (copy), l_FFlagLuaAppUpdateCollectionHeader_0 (copy), l_CarouselScrollButtons_0 (copy)
    local v21 = l_useDesignTokens_0();
    local v22 = l_useLastInput_0();
    local v23 = l_usePreferredInput_0();
    local v24 = l_useIsSpatial_0();
    local l_items_0 = v19.items;
    local l_renderItem_0 = v19.renderItem;
    local l_itemPadding_0 = v19.itemPadding;
    local l_itemHeight_0 = v19.itemHeight;
    local l_sideMargin_0 = v19.sideMargin;
    local l_calculateItemWidth_0 = v19.calculateItemWidth;
    local l_scrollingFrameRef_0 = v19.scrollingFrameRef;
    local v32 = v19.title and v19.title ~= "";
    local v33 = v19.scrollButtonsEnabled and not v24 and v22 == v7.Input.Pointer and v23 ~= v7.Input.Directional;
    local v37 = v3.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: l_items_0 (copy), l_renderItem_0 (copy)
        local v34 = {};
        for v35, v36 in ipairs(l_items_0) do
            v34[v35] = l_renderItem_0(v36, v35);
        end;
        return v34;
    end, {
        l_items_0, 
        l_renderItem_0
    });
    local v38, v39, v40, v41, v42 = v11(l_items_0, l_itemPadding_0, l_calculateItemWidth_0, l_scrollingFrameRef_0, v19.scrollSpeed);
    local v44 = v3.useCallback(function(v43) --[[ Line: 92 ]]
        -- upvalues: v42 (copy), v19 (copy)
        v42();
        if v19.onCanvasPositionChanged and v43 then
            v19.onCanvasPositionChanged(v43.CanvasPosition);
        end;
    end, {
        v42, 
        v19.onCanvasPositionChanged
    });
    local l_createElement_0 = v3.createElement;
    local v46 = "Frame";
    local v47 = {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v19.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v19.LayoutOrder, 
        ref = if l_FFlagLuaAppTopChartsFiltersEnabled_0 then v20 else nil
    };
    local v48 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_sideMargin_0), 
            PaddingRight = UDim.new(0, l_sideMargin_0)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if v32 then v19.headerContentPadding or v21.Global.Size_200 else 0)
        })
    };
    local l_createElement_1 = v3.createElement;
    local l_l_CollectionHeader_0_0 = l_CollectionHeader_0;
    local v51 = {
        LayoutOrder = 1, 
        title = v19.title, 
        subtitle = v19.subtitle, 
        tooltipInfoText = v19.tooltipInfoText, 
        onActivateInfoIcon = v19.onActivateInfoIcon, 
        tooltipSupportsVR = v19.tooltipSupportsVR, 
        tooltipSupportsTenFootUi = v19.tooltipSupportsTenFootUi
    };
    local v52 = true;
    if #l_items_0 >= 1 then
        v52 = v19.hideHeaderButton or not v32;
    end;
    v51.hideButton = v52;
    v51.shouldUseGridPageLayout_legacy = if l_FFlagLuaAppUpdateCollectionHeader_0 then nil else v19.shouldUseGridPageLayout_legacy;
    v51.onActivate = v19.onActivateHeader;
    v51.buttonText = v19.headerButtonText;
    v48.Header = l_createElement_1(l_l_CollectionHeader_0_0, v51);
    v48.ContentFrame = v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0, l_itemHeight_0)
    }, {
        DynamicScrollingFrame = v3.createElement("ScrollingFrame", {
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.new(0, 0, 0, l_itemHeight_0), 
            ClipsDescendants = false, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = false, 
            Size = UDim2.new(1, 0, 0, l_itemHeight_0), 
            ZIndex = 1, 
            ref = l_scrollingFrameRef_0, 
            [v3.Change.AbsoluteSize] = v42, 
            [v3.Change.CanvasPosition] = v44
        }, {
            v3.createElement(v3.Fragment, nil, {
                v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, l_itemPadding_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                v3.createElement(v3.Fragment, nil, v37)
            })
        }), 
        ScrollButtons = if v33 then v3.createElement(l_CarouselScrollButtons_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 2 * l_sideMargin_0, 0, l_itemHeight_0), 
            ZIndex = 2, 
            handleScrollLeft = v38, 
            handleScrollRight = v39, 
            leftScrollingEnabled = v40, 
            rightScrollingEnabled = v41, 
            sideMargin = v19.sideMargin
        }) else nil
    });
    return l_createElement_0(v46, v47, v48);
end;
if l_FFlagLuaAppTopChartsFiltersEnabled_0 then
    return (v3.forwardRef(VariableItemWidthCarousel));
else
    return VariableItemWidthCarousel;
end;