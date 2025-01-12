local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_script_FirstAncestor_0.Grid.calculateRelativeColumnGap);
local l_FFlagCollectionGridVerticalScrollingRefOptional_0 = require(l_Parent_0.SharedFlags).FFlagCollectionGridVerticalScrollingRefOptional;
local v7 = {
    maxNumRows = 1e999, 
    numColumns = 1, 
    bufferRowsBelowScreen = 4, 
    bufferRowsAboveScreen = 4, 
    columnGap = 0, 
    sideMargin = 0, 
    verticalPadding = 0
};
return v2.memo(function(v8) --[[ Line: 69 ]] --[[ Name: GridOfCollectionItems ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), l_FFlagCollectionGridVerticalScrollingRefOptional_0 (copy), v4 (copy), v5 (copy)
    local v9 = v3.Dictionary.join(v7, v8);
    local v10 = v2.useRef(nil);
    local v11 = math.min(math.ceil(#v9.items / v9.numColumns), v9.maxNumRows);
    local v13 = v9.itemSizeBinding:map(function(v12) --[[ Line: 77 ]]
        -- upvalues: v11 (copy), v9 (copy)
        return v11 * (v12.Y + v9.verticalPadding) - v9.verticalPadding;
    end);
    local v14, v15 = v2.useState(-1);
    local v16, v17 = v2.useState(-1);
    local v18, v19 = v2.useState(v9.bufferRowsBelowScreen + v9.bufferRowsAboveScreen);
    v2.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v9 (copy), v10 (copy), v13 (copy), v11 (copy), v15 (copy), v17 (copy), v19 (copy), l_FFlagCollectionGridVerticalScrollingRefOptional_0 (ref)
        local v20 = {};
        if v9.verticalScrollingFrameRef and v9.verticalScrollingFrameRef.current and v10.current then
            local l_current_0 = v10.current;
            local l_current_1 = v9.verticalScrollingFrameRef.current;
            local l_Y_0 = v9.itemSizeBinding:getValue().Y;
            local l_Y_1 = l_current_1.AbsolutePosition.Y;
            local l_Y_2 = l_current_1.AbsoluteWindowSize.Y;
            local v26 = math.ceil(l_Y_2 / math.max(1, l_Y_0 + v9.verticalPadding)) + 1;
            do
                local l_l_Y_1_0, l_l_Y_2_0, l_v26_0 = l_Y_1, l_Y_2, v26;
                local function _() --[[ Line: 107 ]] --[[ Name: calculateOffsetOfGrid ]]
                    -- upvalues: l_current_0 (copy), l_current_1 (copy), l_l_Y_1_0 (ref)
                    return l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                end;
                local v31 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                local function v42() --[[ Line: 114 ]] --[[ Name: updateRowsToRender ]]
                    -- upvalues: l_current_1 (copy), v9 (ref), v13 (ref), v31 (ref), l_l_Y_2_0 (ref), l_v26_0 (ref), v11 (ref), v15 (ref), v17 (ref)
                    local l_Y_3 = l_current_1.CanvasPosition.Y;
                    local v33 = math.max(1, v9.itemSizeBinding:getValue().Y + v9.verticalPadding);
                    local v34 = v13:getValue();
                    local v35 = v31 - l_Y_3;
                    local v36 = v9.bufferRowsAboveScreen * v33;
                    local v37 = v9.bufferRowsBelowScreen * v33;
                    local v38 = nil;
                    local v39 = nil;
                    if l_l_Y_2_0 + v37 < v35 or v35 + v34 < -v36 then
                        v38 = -1;
                        v39 = -1;
                    else
                        local v40 = math.floor(-v35 / v33);
                        v38 = math.max(1, v40 + 1 - v9.bufferRowsAboveScreen);
                        local v41 = l_v26_0 + v9.bufferRowsBelowScreen;
                        v41 = math.max(1, if v40 <= 0 then v41 + v40 else v41 + math.min(v40, v9.bufferRowsAboveScreen));
                        v39 = math.min(v11, v38 + v41 - 1);
                    end;
                    v15(v38);
                    v17(v39);
                end;
                local function v44() --[[ Line: 159 ]] --[[ Name: updateWindowParams ]]
                    -- upvalues: v9 (ref), l_l_Y_1_0 (ref), l_current_1 (copy), l_l_Y_2_0 (ref), v31 (ref), l_current_0 (copy), l_v26_0 (ref), v19 (ref), v11 (ref), v42 (copy)
                    local v43 = math.max(1, v9.itemSizeBinding:getValue().Y + v9.verticalPadding);
                    l_l_Y_1_0 = l_current_1.AbsolutePosition.Y;
                    l_l_Y_2_0 = l_current_1.AbsoluteWindowSize.Y;
                    v31 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                    l_v26_0 = math.ceil(l_l_Y_2_0 / v43) + 1;
                    v19((math.min(v11, l_v26_0 + v9.bufferRowsBelowScreen + v9.bufferRowsAboveScreen)));
                    v42();
                end;
                table.insert(v20, l_current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(v44));
                table.insert(v20, l_current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v44));
                table.insert(v20, l_current_1:GetPropertyChangedSignal("CanvasSize"):Connect(v44));
                table.insert(v20, l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(v42));
                v44();
            end;
        elseif l_FFlagCollectionGridVerticalScrollingRefOptional_0 then
            v15(1);
            v17(v11);
        end;
        return function() --[[ Line: 199 ]]
            -- upvalues: v20 (copy)
            for _, v46 in v20 do
                v46:Disconnect();
            end;
        end;
    end, {
        v10, 
        v13, 
        v11, 
        v9.itemSizeBinding, 
        v9.verticalScrollingFrameRef, 
        v9.verticalPadding, 
        v9.bufferRowsAboveScreen, 
        v9.bufferRowsBelowScreen, 
        v9.onViewableItemsChanged
    });
    v16 = math.min(v16, v11);
    local v47 = math.max(-1, (v14 - 1) * v9.numColumns + 1);
    local v48 = math.max(-1, (math.min(#v9.items, v16 * v9.numColumns)));
    v2.useEffect(function() --[[ Line: 225 ]]
        -- upvalues: v9 (copy), v47 (copy), v48 (copy)
        if v9.onViewableItemsChanged then
            v9.onViewableItemsChanged(v47, v48);
        end;
    end, {
        v47, 
        v48, 
        v9.onViewableItemsChanged
    });
    local v65 = v2.useMemo(function() --[[ Line: 232 ]]
        -- upvalues: v14 (copy), v16 (ref), v47 (copy), v48 (copy), v9 (copy), v11 (copy), v4 (ref), v2 (ref), v5 (ref), v18 (copy)
        local v49 = {};
        if v14 <= 0 or v16 < v14 then
            return nil;
        elseif v47 <= 0 or v48 < v47 then
            return nil;
        elseif v9.numColumns <= 0 or v11 - v14 < 0 then
            return nil;
        else
            v4.assert(v14 >= 1);
            local l_assert_0 = v4.assert;
            local v51 = false;
            if v14 <= v16 then
                v51 = v16 <= v11;
            end;
            l_assert_0(v51);
            if v14 > 1 then
                l_assert_0 = v14 - 1;
                local l_l_assert_0_0 = l_assert_0 --[[ copy: 1 -> 12 ]];
                v49.Padding = v2.createElement("UIPadding", {
                    PaddingTop = v9.itemSizeBinding:map(function(v53) --[[ Line: 250 ]]
                        -- upvalues: l_l_assert_0_0 (copy), v9 (ref)
                        return UDim.new(0, l_l_assert_0_0 * (v53.Y + v9.verticalPadding));
                    end)
                });
            end;
            l_assert_0 = v11 - v14 + 1;
            v51 = v9.numColumns - 1;
            local v54 = l_assert_0 - 1;
            v4.assert(l_assert_0 >= 1);
            v4.assert(v9.numColumns >= 1);
            local v55 = UDim2.new(1 / v9.numColumns, math.floor(-(v51 / v9.numColumns) * v9.columnGap), 1 / l_assert_0, (math.floor(-(v54 / l_assert_0) * v9.verticalPadding)));
            v49.Layout = v2.createElement("UIGridLayout", {
                FillDirectionMaxCells = v9.numColumns, 
                CellPadding = v9.itemSizeBinding:map(function(v56) --[[ Line: 272 ]]
                    -- upvalues: v5 (ref), v9 (ref)
                    local v57 = v5(v9.numColumns, v9.columnGap, v56.X, v9.sideMargin);
                    return UDim2.new(v57, 0, 0, v9.verticalPadding);
                end), 
                CellSize = v55, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            v4.assert(v47 >= 1);
            local l_assert_1 = v4.assert;
            local v59 = false;
            if v47 <= v48 then
                v59 = v48 <= #v9.items;
            end;
            l_assert_1(v59);
            for v60 = v47, v48 do
                if v60 <= #v9.items then
                    local v61 = math.ceil(v60 / v9.numColumns);
                    local v62 = v9.items[v60];
                    local v63, v64 = v9.renderItem(v62, v60, UDim2.fromScale(1, 1), v61);
                    v49[("%*%*"):format(v64, v60 % (v18 * v9.numColumns))] = v63;
                end;
            end;
            return v49;
        end;
    end, {
        v9.columnGap, 
        v9.numColumns, 
        v9.itemSizeBinding, 
        v14, 
        v16, 
        v9.items, 
        v9.renderItem, 
        v9.verticalPadding, 
        v18, 
        v11, 
        v9.sideMargin, 
        v47, 
        v48
    });
    return v2.createElement("Frame", {
        ref = v10, 
        Size = v13:map(function(v66) --[[ Line: 316 ]]
            return UDim2.new(1, 0, 0, v66);
        end), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        Position = v9.Position
    }, v65);
end);