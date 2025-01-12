local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.CollectionViews);
local l_CollectionGrid_0 = v2.CollectionGrid;
local l_useCollectionLayoutParams_0 = v2.useCollectionLayoutParams;
local l_CollectionItemSize_0 = v2.CollectionViewTypes.CollectionItemSize;
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v7 = require(script.Parent.ProfileCollectionGridConfig);
return function(v8) --[[ Line: 20 ]] --[[ Name: SquareCollectionsGridView ]]
    -- upvalues: v1 (copy), v7 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_HorizontalPageMargin_0 (copy), l_CollectionGrid_0 (copy)
    local v9, v10 = v1.useState(nil);
    v1.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v8 (copy), v9 (copy)
        if v8.config.setForwardRef then
            v8.config.setForwardRef(v9);
        end;
    end, {
        v9
    });
    local v11 = v8.config.maxNumRows or v7.Constants.DEFAULT_MAX_NUM_ROWS;
    local v12 = {
        sideMargin = 0
    };
    local v13 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.Small, v9, false, v12);
    return v1.createElement(l_HorizontalPageMargin_0, {
        layoutOrder = v8.config.layoutOrder, 
        backgroundTransparency = 1, 
        size = UDim2.new(1, 0, 0, 0), 
        useAutomaticSizing = true
    }, {
        v1.createElement(l_CollectionGrid_0, {
            LayoutOrder = v8.config.layoutOrder, 
            verticalScrollingFrameRef = v8.config.verticalScrollingFrameRef, 
            containerRef = v10, 
            maxNumRows = v11, 
            numColumns = v13.numColumns, 
            items = v8.config.items, 
            renderItem = v8.config.renderItem, 
            getItemHeight = v8.config.getItemHeight, 
            columnGap = v13.columnGap, 
            sideMargin = v13.sideMargin, 
            verticalPadding = v13.verticalPadding, 
            title = v8.config.title, 
            subtitle = v8.config.subtitle, 
            tooltipInfoText = v8.config.tooltipInfoText, 
            onActivateInfoIcon = v8.config.onActivateInfoIcon, 
            onActivateHeader = v8.config.onActivateHeader, 
            headerButtonText = v8.config.headerButtonText, 
            onViewableItemsChanged = v8.config.onViewableItemsChanged, 
            onContainerSizeChanged = v8.config.onContainerSizeChanged, 
            hideHeaderButton = v8.config.hideHeaderButton
        })
    });
end;