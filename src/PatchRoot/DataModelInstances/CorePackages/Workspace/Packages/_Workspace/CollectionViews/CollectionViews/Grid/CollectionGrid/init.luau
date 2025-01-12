local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v6 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v8 = require(l_script_FirstAncestor_0.useCollectionSizeBindings);
local v9 = require(l_script_FirstAncestor_0.CollectionHeader);
local v10 = require(l_script_FirstAncestor_0.Grid.GridOfCollectionItems);
local l_FFlagLuaAppUpdateCollectionHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateCollectionHeader;
local v12 = v6.strictInterface({
    Position = v6.optional(v6.UDim2), 
    LayoutOrder = v6.optional(v6.number), 
    containerRef = v6.optional(v6.union(v6.table, v6.callback)), 
    verticalPadding = v6.optional(v6.number), 
    maxNumRows = v6.optional(v6.number), 
    verticalScrollingFrameRef = v6.optional(v6.table), 
    numColumns = v6.number, 
    items = v6.table, 
    renderItem = v6.callback, 
    getItemHeight = v6.callback, 
    columnGap = v6.optional(v6.number), 
    sideMargin = v6.optional(v6.number), 
    title = v6.optional(v6.union(v6.string, v6.callback)), 
    subtitle = v6.optional(v6.string), 
    tooltipInfoText = v6.optional(v6.string), 
    onActivateInfoIcon = v6.optional(v6.callback), 
    tooltipSupportsVR = v6.optional(v6.boolean), 
    tooltipSupportsTenFootUi = v6.optional(v6.boolean), 
    onActivateHeader = v6.optional(v6.callback), 
    headerButtonText = v6.optional(v6.string), 
    onViewableItemsChanged = v6.optional(v6.callback), 
    onContainerSizeChanged = v6.optional(v6.callback), 
    shouldUseGridPageLayout_legacy = v6.optional(v6.boolean), 
    hideHeaderButton = v6.optional(v6.boolean), 
    bufferRowsBelowScreen = v6.optional(v6.number), 
    bufferRowsAboveScreen = v6.optional(v6.number)
});
local v13 = {
    numColumns = 0, 
    columnGap = 0, 
    sideMargin = 0, 
    verticalPadding = 0
};
return (v2.memo(function(v14) --[[ Line: 145 ]] --[[ Name: CollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v12 (copy), v3 (copy), v13 (copy), v4 (copy), l_useDesignTokens_0 (copy), v8 (copy), v2 (copy), v9 (copy), l_FFlagLuaAppUpdateCollectionHeader_0 (copy), v10 (copy)
    l_validateProps_0(v12, v14);
    local v15 = v3.Dictionary.join(v13, v14);
    v4.assert(v15.numColumns >= 1);
    v4.assert(v15.sideMargin >= 0);
    v4.assert(v15.verticalPadding >= 0);
    v4.assert(v15.columnGap >= 0);
    local l_Size_200_0 = l_useDesignTokens_0().Global.Size_200;
    local v17, _, v19, v20 = v8(v15.numColumns, v15.columnGap, v15.sideMargin, 0, v15.getItemHeight, v15.onContainerSizeChanged);
    local v21 = v15.title and v15.title ~= "";
    local l_createElement_0 = v2.createElement;
    local v23 = "Frame";
    local v24 = {
        ref = v15.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v15.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v15.LayoutOrder
    };
    local v25 = {};
    local l_createElement_1 = v2.createElement;
    local v27 = "Frame";
    local v28 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v19, 
        ref = v20
    };
    local v29 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v15.sideMargin), 
            PaddingRight = UDim.new(0, v15.sideMargin)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if v21 then l_Size_200_0 else nil)
        })
    };
    local l_createElement_2 = v2.createElement;
    local l_v9_0 = v9;
    local v32 = {
        LayoutOrder = 1, 
        title = v15.title, 
        subtitle = v15.subtitle, 
        tooltipInfoText = v15.tooltipInfoText, 
        onActivateInfoIcon = v15.onActivateInfoIcon, 
        tooltipSupportsVR = v15.tooltipSupportsVR, 
        tooltipSupportsTenFootUi = v15.tooltipSupportsTenFootUi
    };
    local v33 = true;
    if #v15.items >= 1 then
        v33 = v15.hideHeaderButton or not v21;
    end;
    v32.hideButton = v33;
    v32.shouldUseGridPageLayout_legacy = if l_FFlagLuaAppUpdateCollectionHeader_0 then nil else v15.shouldUseGridPageLayout_legacy;
    v32.onActivate = v15.onActivateHeader;
    v32.buttonText = v15.headerButtonText;
    v29.Header = l_createElement_2(l_v9_0, v32);
    v29.GridOfItems = v2.createElement(v10, {
        verticalScrollingFrameRef = v15.verticalScrollingFrameRef, 
        onViewableItemsChanged = v15.onViewableItemsChanged, 
        itemSizeBinding = v17, 
        maxNumRows = v15.maxNumRows, 
        numColumns = v15.numColumns, 
        items = v15.items, 
        renderItem = v15.renderItem, 
        columnGap = v15.columnGap, 
        sideMargin = v15.sideMargin, 
        verticalPadding = v15.verticalPadding, 
        bufferRowsBelowScreen = v15.bufferRowsBelowScreen, 
        bufferRowsAboveScreen = v15.bufferRowsAboveScreen, 
        LayoutOrder = 2
    });
    v25.CollectionContent = l_createElement_1(v27, v28, v29);
    return l_createElement_0(v23, v24, v25);
end));