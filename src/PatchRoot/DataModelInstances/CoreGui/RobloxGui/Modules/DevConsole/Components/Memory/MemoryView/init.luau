local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.HeaderButton);
local v5 = require(script.Parent.MemoryViewEntry);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v6.MemoryFormatting.ChartHeaderNames;
local l_HeaderFrameHeight_0 = v6.GeneralFormatting.HeaderFrameHeight;
local l_ValueCellWidth_0 = v6.MemoryFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.MemoryFormatting.CellPadding;
local l_ValuePadding_0 = v6.MemoryFormatting.ValuePadding;
local l_EntryFrameHeight_0 = v6.GeneralFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v6.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v6.GeneralFormatting.NoResultSearchStr;
local v17 = game:DefineFastFlag("DevConsoleMemorySort", false);
local v18 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0);
local v19 = v2.Component:extend("MemoryView");
local function v21(v20) --[[ Line: 38 ]] --[[ Name: getX ]]
    return v20.time;
end;
local function v23(v22) --[[ Line: 42 ]] --[[ Name: getY ]]
    return v22.data;
end;
local function v25(v24) --[[ Line: 46 ]] --[[ Name: formatValueStr ]]
    return string.format("%.3f", v24);
end;
v19.init = function(v26, v27) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_TweenService_0 (copy), v18 (copy), v17 (copy), v2 (copy)
    v26.getOnButtonPress = function(v28, v29) --[[ Line: 51 ]]
        -- upvalues: v26 (copy), l_EntryFrameHeight_0 (ref), l_TweenService_0 (ref), v18 (ref)
        return function(_, _) --[[ Line: 52 ]]
            -- upvalues: v26 (ref), v28 (copy), v29 (copy), l_EntryFrameHeight_0 (ref), l_TweenService_0 (ref), v18 (ref)
            if v26.state.expandIndex ~= v28 and v28 then
                local l_current_0 = v26.scrollingRef.current;
                if l_current_0 then
                    local v33 = (v29 - 2.4) * l_EntryFrameHeight_0;
                    l_TweenService_0:Create(l_current_0, v18, {
                        CanvasPosition = Vector2.new(0, v33)
                    }):Play();
                end;
            end;
            local l_v26_0 = v26;
            local v35 = {};
            local v36 = false;
            if v26.state.expandIndex ~= v28 then
                v36 = v28;
            end;
            v35.expandIndex = v36;
            l_v26_0:setState(v35);
        end;
    end;
    v26.onSortChanged = function(v37) --[[ Line: 72 ]]
        -- upvalues: v27 (copy), v17 (ref), v26 (copy)
        if v37 == v27.targetMemoryData:getSortType() then
            if v17 then
                v27.targetMemoryData:setSortType(v37);
            end;
            v26:setState({
                reverseSort = not v26.state.reverseSort
            });
            return;
        else
            v27.targetMemoryData:setSortType(v37);
            v26:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v26.onCanvasPosChanged = function() --[[ Line: 90 ]]
        -- upvalues: v26 (copy)
        local l_CanvasPosition_0 = v26.scrollingRef.current.CanvasPosition;
        if v26.state.canvasPos ~= l_CanvasPosition_0 then
            v26:setState({
                absScrollSize = v26.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v26.scrollingRef = v2.createRef();
    v26.state = {
        memoryData = v27.targetMemoryData:getMemoryData(), 
        reverseSort = false, 
        expandIndex = false
    };
end;
v19.willUpdate = function(v39) --[[ Line: 109 ]] --[[ Name: willUpdate ]]
    if v39.canvasPosConnector then
        v39.canvasPosConnector:Disconnect();
    end;
end;
v19.didUpdate = function(v40) --[[ Line: 115 ]] --[[ Name: didUpdate ]]
    if v40.scrollingRef.current then
        v40.canvasPosConnector = v40.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v40.onCanvasPosChanged);
    end;
end;
v19.didMount = function(v41) --[[ Line: 122 ]] --[[ Name: didMount ]]
    v41.treeViewItemConnector = v41.props.targetMemoryData:treeUpdatedSignal():Connect(function(v42) --[[ Line: 124 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            memoryData = v42
        });
    end);
    if v41.scrollingRef.current then
        v41.canvasPosConnector = v41.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v41.onCanvasPosChanged);
        v41:setState({
            absScrollSize = v41.scrollingRef.current.AbsoluteSize, 
            canvasPos = v41.scrollingRef.current.CanvasPosition
        });
    end;
end;
v19.willUnmount = function(v43) --[[ Line: 141 ]] --[[ Name: willUnmount ]]
    v43.treeViewItemConnector:Disconnect();
end;
v19.appendAdditionTabInformation = function(v44, v45, v46, v47, v48, v49) --[[ Line: 145 ]] --[[ Name: appendAdditionTabInformation ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), v2 (copy), v5 (copy), v25 (copy)
    local l_CanvasPosition_1 = v44.scrollingRef.current.CanvasPosition;
    local l_AbsoluteSize_0 = v44.scrollingRef.current.AbsoluteSize;
    for _, v53 in ipairs(v46) do
        local l_name_0 = v53.name;
        local l_value_0 = v53.value;
        local v56 = v47 .. l_name_0;
        v49.layoutOrder = v49.layoutOrder + 1;
        if v49.scrollingFrameHeight + l_EntryFrameHeight_0 >= l_CanvasPosition_1.Y and v49.usedFrameSpace < l_AbsoluteSize_0.Y then
            v45[v47 .. l_name_0] = v2.createElement(v5, {
                size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                depth = v48, 
                name = l_name_0, 
                showGraph = false, 
                value = l_value_0, 
                formatValueStr = v25, 
                layoutOrder = v49.layoutOrder
            });
            if v49.paddingHeight < 0 then
                v49.paddingHeight = v49.scrollingFrameHeight;
            else
                v49.usedFrameSpace = v49.usedFrameSpace + l_EntryFrameHeight_0;
            end;
        end;
        v49.scrollingFrameHeight = v49.scrollingFrameHeight + l_EntryFrameHeight_0;
        if v53.moreInfo and type(v53.moreInfo) == "table" then
            v44:appendAdditionTabInformation(v45, v53.moreInfo, v56, v48 + 1, v49);
        end;
    end;
end;
v19.recursiveConstructEntries = function(v57, v58, v59, v60, v61) --[[ Line: 186 ]] --[[ Name: recursiveConstructEntries ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_LineGraphHeight_0 (copy), v2 (copy), v5 (copy), v25 (copy), v21 (copy), v23 (copy)
    assert(v57.scrollingRef.current, "ScrollingFrame not initialized yet");
    local l_expandIndex_0 = v57.state.expandIndex;
    local v63 = v57.props.searchTerm or "";
    local l_reverseSort_0 = v57.state.reverseSort;
    local l_CanvasPosition_2 = v57.scrollingRef.current.CanvasPosition;
    local l_AbsoluteSize_1 = v57.scrollingRef.current.AbsoluteSize;
    local l_name_1 = v59.name;
    if string.find(l_name_1:lower(), v63:lower()) then
        local v68 = l_expandIndex_0 == l_name_1;
        local v69 = v68 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0;
        v61.layoutOrder = v61.layoutOrder + 1;
        if v61.scrollingFrameHeight + v69 >= l_CanvasPosition_2.Y and v61.usedFrameSpace < l_AbsoluteSize_1.Y then
            v58[l_name_1] = v2.createElement(v5, {
                size = UDim2.new(1, 0, 0, v69), 
                depth = v60, 
                name = v59.name, 
                showGraph = v68, 
                dataStats = v59.dataStats, 
                onButtonPress = v57.getOnButtonPress(l_name_1, v61.layoutOrder), 
                formatValueStr = v25, 
                getX = v21, 
                getY = v23, 
                layoutOrder = v61.layoutOrder
            });
            if v61.paddingHeight < 0 then
                v61.paddingHeight = v61.scrollingFrameHeight;
            else
                v61.usedFrameSpace = v61.usedFrameSpace + v69;
            end;
        end;
        v61.scrollingFrameHeight = v61.scrollingFrameHeight + v69;
        if v68 and v59.dataStats.additionalInfoFunc then
            v57:appendAdditionTabInformation(v58, v59.dataStats.additionalInfoFunc(), v59.name, v60 + 1, v61);
        end;
    end;
    local l_sortedChildren_0 = v59.dataStats.sortedChildren;
    if l_sortedChildren_0 then
        if l_reverseSort_0 then
            local v71 = #l_sortedChildren_0;
            for v72 = 1, v71 do
                v57:recursiveConstructEntries(v58, l_sortedChildren_0[v71 - v72 + 1], v60 + 1, v61);
            end;
            return;
        else
            for _, v74 in ipairs(l_sortedChildren_0) do
                v57:recursiveConstructEntries(v58, v74, v60 + 1, v61);
            end;
        end;
    end;
end;
v19.render = function(v75) --[[ Line: 254 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), l_NoResultSearchStr_0 (copy), l_HeaderFrameHeight_0 (copy), v4 (copy), l_ChartHeaderNames_0 (copy), l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_CellPadding_0 (copy), l_LineColor_0 (copy), l_LineWidth_0 (copy)
    local v76 = {};
    local l_layoutOrder_0 = v75.props.layoutOrder;
    local l_size_0 = v75.props.size;
    local v79 = v75.props.searchTerm or "";
    local v80 = {
        scrollingFrameHeight = 0, 
        paddingHeight = -1, 
        usedFrameSpace = 0, 
        layoutOrder = 1
    };
    if v75.scrollingRef.current then
        for _, v82 in ipairs(v75.state.memoryData) do
            v75:recursiveConstructEntries(v76, v82, 0, v80);
        end;
        v76.UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        v76.WindowingPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v80.paddingHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
    end;
    if v80.layoutOrder == 1 then
        if v79 == "" then
            v76.noDataMessage = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Awaiting Memory Stats", 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            local v83 = string.format(l_NoResultSearchStr_0, v79);
            v76.noDataMessage = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v83, 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        end;
    end;
    return v2.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Name = v2.createElement(v4, {
                text = l_ChartHeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v75.onSortChanged
            }), 
            ValueMB = v2.createElement(v4, {
                text = l_ChartHeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
                sortfunction = v75.onSortChanged
            }), 
            TopHorizontal = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            LowerHorizontal = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            vertical = v2.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Entries = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = 1, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.new(1, 0, 0, v80.scrollingFrameHeight), 
            [v2.Ref] = v75.scrollingRef
        }, v76)
    });
end;
return v19;