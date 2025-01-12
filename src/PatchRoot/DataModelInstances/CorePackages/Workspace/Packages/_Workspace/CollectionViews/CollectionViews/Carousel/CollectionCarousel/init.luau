local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v6 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v6.useLastInput;
local l_usePreferredInput_0 = v6.usePreferredInput;
local l_useIsSpatial_0 = v6.useIsSpatial;
local v10 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v12 = require(l_script_FirstAncestor_0.useCollectionSizeBindings);
local v13 = require(l_script_FirstAncestor_0.Carousel.useScrollButtonHandlers);
local v14 = require(l_script_FirstAncestor_0.Carousel.CollectionBackgroundMural);
local v15 = require(l_script_FirstAncestor_0.CollectionHeader);
local v16 = require(l_script_FirstAncestor_0.Carousel.CarouselScrollButtons);
local v17 = require(l_script_FirstAncestor_0.Carousel.ScrollingRowOfCollectionItems);
local v18 = require(l_script_FirstAncestor_0.maybeForceDarkTheme);
local v19 = require(l_script_FirstAncestor_0.CarouselUpdatesExperimentation);
local l_FFlagLuaAppScrollableDesktopCarousels_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppScrollableDesktopCarousels;
local l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppScrollableDesktopCarouselsIXP;
local l_FFlagLuaAppUpdateCollectionHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateCollectionHeader;
local v23 = game:DefineFastFlag("LuaAppFixCollectionCarouselHeight", false);
local v24 = v10.strictInterface({
    Position = v10.optional(v10.UDim2), 
    LayoutOrder = v10.optional(v10.number), 
    containerRef = v10.optional(v10.union(v10.table, v10.callback)), 
    scrollingFrameRef = v10.optional(v10.table), 
    onScrollingFrameRefCallback = v10.optional(v10.callback), 
    numColumns = v10.number, 
    fractionalItemAmount = v10.optional(v10.number), 
    items = v10.table, 
    renderItem = v10.callback, 
    getItemHeight = v10.callback, 
    columnGap = v10.optional(v10.number), 
    sideMargin = v10.optional(v10.number), 
    backgroundMuralUrl = v10.optional(v10.string), 
    title = v10.optional(v10.union(v10.string, v10.callback)), 
    subtitle = v10.optional(v10.string), 
    tooltipInfoText = v10.optional(v10.string), 
    onActivateInfoIcon = v10.optional(v10.callback), 
    tooltipSupportsVR = v10.optional(v10.boolean), 
    tooltipSupportsTenFootUi = v10.optional(v10.boolean), 
    onActivateHeader = v10.optional(v10.callback), 
    onActivateSubtitle = v10.optional(v10.callback), 
    headerButtonText = v10.optional(v10.string), 
    onViewableItemsChanged = v10.optional(v10.callback), 
    onContainerSizeChanged = v10.optional(v10.callback), 
    onChangeCanvasPosition = v10.optional(v10.callback), 
    onReachedThresholdFromEnd = v10.optional(v10.callback), 
    thresholdFromEnd = v10.optional(v10.number), 
    scrollingEnabledOverride = v10.optional(v10.boolean), 
    shouldShowScrollButtonsOverride = v10.optional(v10.boolean), 
    shouldUseGridPageLayout_legacy = v10.optional(v10.boolean), 
    hideHeaderButton = v10.optional(v10.boolean), 
    maxItemsToShow = v10.optional(v10.number), 
    numItemsToRenderOffScreen = v10.optional(v10.number), 
    onScrollButtonEnter = v10.optional(v10.callback), 
    onScrollButtonLeave = v10.optional(v10.callback), 
    forceScrollable = v10.optional(v10.boolean)
});
local v25 = {
    numColumns = 0, 
    fractionalItemAmount = 0, 
    columnGap = 0, 
    sideMargin = 0
};
local function _(v26, v27, v28, v29) --[[ Line: 194 ]] --[[ Name: isScrollingEnabled ]]
    -- upvalues: l_FFlagLuaAppScrollableDesktopCarousels_0 (copy), v6 (copy)
    if v26 ~= nil then
        return v26;
    elseif not l_FFlagLuaAppScrollableDesktopCarousels_0 and v28 then
        return v29 ~= v6.Input.Pointer;
    else
        return not v27;
    end;
end;
local function _(v31, v32, v33, v34) --[[ Line: 213 ]] --[[ Name: areScrollButtonsEnabled ]]
    -- upvalues: v6 (copy)
    if not v33 then
        return false;
    elseif v34 ~= nil then
        return v34;
    else
        local v35 = false;
        if v31 == v6.Input.Pointer then
            v35 = v32 ~= v6.Input.Directional;
        end;
        return v35;
    end;
end;
return (v2.memo(function(v37) --[[ Line: 232 ]] --[[ Name: CollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v24 (copy), v3 (copy), v25 (copy), v4 (copy), l_FFlagLuaAppScrollableDesktopCarousels_0 (copy), l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 (copy), v19 (copy), v2 (copy), l_useLastInput_0 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v6 (copy), v23 (copy), v12 (copy), v13 (copy), l_useDesignTokens_0 (copy), v14 (copy), v18 (copy), v15 (copy), l_FFlagLuaAppUpdateCollectionHeader_0 (copy), v17 (copy), v16 (copy)
    l_validateProps_0(v24, v37);
    local v38 = v3.Dictionary.join(v25, v37);
    v4.assert(v38.numColumns >= 1);
    v4.assert(v38.sideMargin >= 0);
    v4.assert(v38.fractionalItemAmount >= 0);
    v4.assert(v38.columnGap >= 0);
    local v39 = l_FFlagLuaAppScrollableDesktopCarousels_0 or l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 and v19.getIsDesktopScrollable() or v38.forceScrollable;
    local v40 = v2.useRef(nil);
    local v42 = v2.useCallback(function(v41) --[[ Line: 246 ]]
        -- upvalues: v40 (copy), v38 (copy)
        v40.current = v41;
        if v38.onScrollingFrameRefCallback then
            v38.onScrollingFrameRefCallback(v41);
        end;
        if v38.scrollingFrameRef then
            v38.scrollingFrameRef.current = v41;
        end;
    end, {
        v38.onScrollingFrameRefCallback, 
        v38.scrollingFrameRef
    });
    local v43 = l_useLastInput_0();
    local v44 = l_usePreferredInput_0();
    local v45 = l_useIsSpatial_0();
    local v46 = v38.hideHeaderButton or v44 == v6.Input.Directional;
    local l_scrollingEnabledOverride_0 = v38.scrollingEnabledOverride;
    local v48 = if v39 then nil else v38.shouldUseGridPageLayout_legacy;
    local v49 = if l_scrollingEnabledOverride_0 ~= nil then l_scrollingEnabledOverride_0 else if not l_FFlagLuaAppScrollableDesktopCarousels_0 and v48 then v44 ~= v6.Input.Pointer else not v45;
    l_scrollingEnabledOverride_0 = math.min(v38.maxItemsToShow or #v38.items, #v38.items);
    if not v49 then
        l_scrollingEnabledOverride_0 = math.min(v38.numColumns, l_scrollingEnabledOverride_0);
    end;
    v4.assert(l_scrollingEnabledOverride_0 >= 0);
    v48 = nil;
    v48 = if not not v23 or v39 then if v49 and v38.numColumns < l_scrollingEnabledOverride_0 then v38.fractionalItemAmount else 0 else if v49 then v38.fractionalItemAmount else 0;
    local v50, v51, v52, v53 = v12(v38.numColumns, v38.columnGap, v38.sideMargin, v48, v38.getItemHeight, v38.onContainerSizeChanged);
    local l_shouldShowScrollButtonsOverride_0 = v38.shouldShowScrollButtonsOverride;
    local v55 = not not v49 and if l_shouldShowScrollButtonsOverride_0 ~= nil then l_shouldShowScrollButtonsOverride_0 else v43 == v6.Input.Pointer and v44 ~= v6.Input.Directional;
    local v56, v57, v58;
    l_shouldShowScrollButtonsOverride_0, v56, v57, v58 = v13(v40, l_scrollingEnabledOverride_0, v55, v38.numColumns, v50, v38.columnGap);
    local v59 = l_useDesignTokens_0();
    local l_Size_200_0 = v59.Global.Size_200;
    local l_Size_250_0 = v59.Global.Size_250;
    local l_White_0 = v59.Global.Color.White;
    local v63 = v38.backgroundMuralUrl ~= nil;
    local v64 = v38.title and v38.title ~= "";
    local l_createElement_0 = v2.createElement;
    local v66 = "Frame";
    local v67 = {
        ref = v38.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v38.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v38.LayoutOrder
    };
    local v68 = {
        BackgroundMural = v38.backgroundMuralUrl and v2.createElement(v14, {
            backgroundMuralUrl = v38.backgroundMuralUrl, 
            containerSizeBinding = v51, 
            ZIndex = -1
        }) or nil
    };
    local l_createElement_1 = v2.createElement;
    local v70 = "Frame";
    local v71 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v52, 
        ref = v53
    };
    local v72 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = if v38.backgroundMuralUrl ~= nil then UDim.new(0, l_Size_250_0) else nil, 
            PaddingLeft = UDim.new(0, v38.sideMargin), 
            PaddingRight = UDim.new(0, v38.sideMargin)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if v64 then l_Size_200_0 else 0)
        })
    };
    local l_v18_0 = v18;
    local l_createElement_2 = v2.createElement;
    local l_v15_0 = v15;
    local v76 = {
        LayoutOrder = 1, 
        title = v38.title, 
        subtitle = v38.subtitle, 
        tooltipInfoText = v38.tooltipInfoText, 
        onActivateInfoIcon = v38.onActivateInfoIcon, 
        tooltipSupportsVR = v38.tooltipSupportsVR, 
        tooltipSupportsTenFootUi = v38.tooltipSupportsTenFootUi
    };
    local v77 = true;
    if #v38.items >= 1 then
        v77 = v46 or not v64;
    end;
    v76.hideButton = v77;
    v76.shouldUseGridPageLayout_legacy = if l_FFlagLuaAppUpdateCollectionHeader_0 then nil else v38.shouldUseGridPageLayout_legacy;
    v76.onActivate = v38.onActivateHeader;
    v76.onActivateSubtitle = v38.onActivateSubtitle;
    v76.buttonText = v38.headerButtonText;
    v76.titleColor = if v63 then l_White_0 else nil;
    v76.subtitleColor = if v63 then l_White_0 else nil;
    v72.CollectionHeader = l_v18_0(l_createElement_2(l_v15_0, v76), v63);
    v72.Items = v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    }, {
        ScrollingItems = v2.createElement(v17, {
            ScrollingEnabled = v49, 
            onChangeCanvasPosition = v38.onChangeCanvasPosition, 
            onScrollingFrameRefCallback = v42, 
            itemSizeBinding = v50, 
            items = v38.items, 
            totalItemsOnCanvas = l_scrollingEnabledOverride_0, 
            numColumns = v38.numColumns, 
            columnGap = v38.columnGap, 
            renderItem = v38.renderItem, 
            sideMargin = v38.sideMargin, 
            numItemsToRenderOffScreen = v38.numItemsToRenderOffScreen, 
            onReachedThresholdFromEnd = v38.onReachedThresholdFromEnd, 
            thresholdFromEnd = v38.thresholdFromEnd, 
            onViewableItemsChanged = v38.onViewableItemsChanged
        }), 
        ScrollButtons = if v55 then v2.createElement(v16, {
            handleScrollLeft = l_shouldShowScrollButtonsOverride_0, 
            handleScrollRight = v56, 
            leftScrollingEnabled = v57, 
            rightScrollingEnabled = v58, 
            sideMargin = v38.sideMargin, 
            ZIndex = 10, 
            Size = v50:map(function(v78) --[[ Line: 411 ]]
                -- upvalues: v38 (copy)
                return UDim2.new(1, 2 * v38.sideMargin, 0, v78.Y);
            end), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            onScrollButtonEnter = v38.onScrollButtonEnter, 
            onScrollButtonLeave = v38.onScrollButtonLeave
        }) else nil
    });
    v68.CollectionContent = l_createElement_1(v70, v71, v72);
    return l_createElement_0(v66, v67, v68);
end));