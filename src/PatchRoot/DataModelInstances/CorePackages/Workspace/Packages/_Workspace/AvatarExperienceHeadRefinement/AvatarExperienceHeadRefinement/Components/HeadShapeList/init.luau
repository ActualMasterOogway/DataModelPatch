local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppCommonStyle);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_useDesignTokens_0 = v3.useDesignTokens;
local v6 = require(l_script_FirstAncestor_0.Enums.HeadShapeTileSize);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v8 = require(l_script_FirstAncestor_0.Components.HeadShapeTile);
local v9 = require(l_script_FirstAncestor_0.Utils.getMappedStyleTokens);
HeadShapeListScroll = function(v10) --[[ Line: 39 ]] --[[ Name: HeadShapeListScroll ]]
    -- upvalues: l_useDesignTokens_0 (copy), v9 (copy), v6 (copy), v2 (copy)
    local v11 = l_useDesignTokens_0();
    local v12 = v9(v11);
    local l_smallTileContainerSize_0 = v12.smallTileContainerSize;
    if v10.tileSize == v6.Large then
        l_smallTileContainerSize_0 = v12.largeTileContainerSize;
    end;
    return v2.createElement("ScrollingFrame", {
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.fromScale(0, 1), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        Selectable = false, 
        Size = UDim2.new(1, 0, 0, l_smallTileContainerSize_0), 
        LayoutOrder = v10.LayoutOrder, 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListScroll"
    }, v10.children);
end;
HeadShapeListWrap = function(v14) --[[ Line: 63 ]] --[[ Name: HeadShapeListWrap ]]
    -- upvalues: v2 (copy)
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = v14.LayoutOrder, 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeListWrap"
    }, v14.children);
end;
return function(v15) --[[ Line: 72 ]] --[[ Name: HeadShapeList ]]
    -- upvalues: l_useDesignTokens_0 (copy), v9 (copy), v6 (copy), v4 (copy), v2 (copy), v8 (copy)
    local v16 = l_useDesignTokens_0();
    local v17 = v9(v16);
    local l_tileListPaddingBetweenItems_0 = v17.tileListPaddingBetweenItems;
    local l_tileListPaddingLeft_0 = v17.tileListPaddingLeft;
    local l_tileListPaddingRight_0 = v17.tileListPaddingRight;
    local l_tileListPaddingTop_0 = v17.tileListPaddingTop;
    local l_tileListPaddingBottom_0 = v17.tileListPaddingBottom;
    if v15.padding then
        l_tileListPaddingLeft_0 = v15.padding.left or l_tileListPaddingLeft_0;
        l_tileListPaddingRight_0 = v15.padding.right or l_tileListPaddingRight_0;
        l_tileListPaddingTop_0 = v15.padding.top or l_tileListPaddingTop_0;
        l_tileListPaddingBottom_0 = v15.padding.bottom or l_tileListPaddingBottom_0;
    end;
    local v23 = v15.tileSize or v6.Small;
    local v24 = v15.orientation or v4.DeviceOrientationMode.Portrait;
    local v25 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_tileListPaddingBetweenItems_0), 
            Wraps = v24 == v4.DeviceOrientationMode.Landscape, 
            HorizontalFlex = Enum.UIFlexAlignment.None, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_tileListPaddingTop_0), 
            PaddingRight = UDim.new(0, l_tileListPaddingRight_0), 
            PaddingBottom = UDim.new(0, l_tileListPaddingBottom_0), 
            PaddingLeft = UDim.new(0, l_tileListPaddingLeft_0)
        })
    };
    for v26, v27 in v15.items do
        v25[("Item-%*"):format(v27.headShapeName)] = v2.createElement(v8, {
            headShape = v27.headShapeName, 
            size = v23, 
            isSelected = v27.isSelected, 
            onActivated = v27.onActivated, 
            LayoutOrder = v26, 
            NextSelectionUp = if v26 <= 4 then v15.NextSelectionUp else nil
        });
    end;
    local v28 = if v24 == v4.DeviceOrientationMode.Landscape then HeadShapeListWrap else HeadShapeListScroll;
    return v2.createElement(v28, v15, v25);
end;