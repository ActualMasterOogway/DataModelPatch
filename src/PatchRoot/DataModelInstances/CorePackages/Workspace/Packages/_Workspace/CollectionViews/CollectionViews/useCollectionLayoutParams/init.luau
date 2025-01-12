local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_usePreferredInput_0 = require(l_Parent_0.Responsive).usePreferredInput;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local v6 = require(l_script_FirstAncestor_0.CollectionLayoutCalculators);
local v7 = require(l_script_FirstAncestor_0.calculateItemWidth);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
return function(v9, v10, v11, v12, v13) --[[ Line: 27 ]] --[[ Name: useCollectionLayoutParams ]]
    -- upvalues: l_useStore_0 (copy), v6 (copy), l_useDesignTokens_0 (copy), l_usePreferredInput_0 (copy), v2 (copy), v7 (copy)
    local v14 = l_useStore_0();
    local v15 = v13 or v6;
    local v16 = v12 and v12.sideMargin or nil;
    local v17 = v12 and v12.columnGap or nil;
    local v18 = v12 and v12.numColumns or nil;
    local v19 = v12 and v12.fractionalItemAmount or nil;
    local v20 = v12 and v12.loadMoreThreshold or nil;
    local v21 = l_useDesignTokens_0();
    local v22 = l_usePreferredInput_0();
    local v23 = v15.calculateVerticalPadding(v21, v9);
    local v24 = v15.calculateMaxTilesToShow(v22);
    local v25 = v2.useRef(nil);
    if v25.current == nil then
        v25.current = v14:getState().ScreenSize;
    end;
    local l_X_0 = v25.current.X;
    local v27, v28 = v2.useState(function() --[[ Line: 60 ]]
        -- upvalues: v16 (copy), v15 (copy), l_X_0 (copy), v21 (copy), v14 (copy)
        return v16 or v15.calculateSideMargin(l_X_0, v21, v14:getState().ScreenSize.X);
    end);
    local v29, v30 = v2.useState(function() --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v15 (copy), l_X_0 (copy), v21 (copy), v14 (copy)
        return v17 or v15.calculateColumnGap(l_X_0, v21, v14:getState().ScreenSize.X);
    end);
    local v31, v32 = v2.useState(function() --[[ Line: 68 ]]
        -- upvalues: v19 (copy), v15 (copy), v9 (copy), v22 (copy)
        return v19 or v15.calculateFractionalItemAmount(v9, v22);
    end);
    local v33, v34 = v2.useState(function() --[[ Line: 72 ]]
        -- upvalues: v18 (copy), v15 (copy), l_X_0 (copy), v27 (copy), v29 (copy), v9 (copy), v21 (copy)
        return v18 or v15.calculateNumColumns(l_X_0, v27, v29, v9, v21);
    end);
    local v35, v36 = v2.useState(function() --[[ Line: 76 ]]
        -- upvalues: v15 (copy), l_X_0 (copy)
        return v15.calculateLoadMoreThreshold(l_X_0);
    end);
    local v37, v38 = v2.useState(function() --[[ Line: 81 ]]
        -- upvalues: v11 (copy), v7 (ref), v33 (copy), v29 (copy), v27 (copy), l_X_0 (copy), v31 (copy)
        if v11 then
            return v7(v33, v29, v27, l_X_0, v31);
        else
            return 1;
        end;
    end);
    local v48 = v2.useCallback(function(v39) --[[ Line: 90 ]]
        -- upvalues: v14 (copy), v16 (copy), v15 (copy), v21 (copy), v28 (copy), v17 (copy), v30 (copy), v18 (copy), v9 (copy), v34 (copy), v19 (copy), v22 (copy), v32 (copy), v20 (copy), v36 (copy), v25 (copy), v11 (copy), v7 (ref), v38 (copy)
        local l_X_1 = v39.X;
        local l_X_2 = v14:getState().ScreenSize.X;
        local v42 = v16 or v15.calculateSideMargin(l_X_1, v21, l_X_2);
        v28(v42);
        local v43 = v17 or v15.calculateColumnGap(l_X_1, v21, l_X_2);
        v30(v43);
        local v44 = v18 or v15.calculateNumColumns(l_X_1, v42, v43, v9, v21);
        v34(v44);
        local v45 = v19 or v15.calculateFractionalItemAmount(v9, v22);
        v32(v45);
        local v46 = v20 or v15.calculateLoadMoreThreshold(l_X_1);
        v36(v46);
        v25.current = v39;
        if v11 then
            local v47 = v7(v44, v43, v42, l_X_1, v45);
            v38(v47);
        end;
    end, {
        v9, 
        v11, 
        v17, 
        v16, 
        v18, 
        v19, 
        v21, 
        v14
    });
    v2.useEffect(function() --[[ Line: 146 ]]
        -- upvalues: v10 (copy), v48 (copy)
        local v49 = nil;
        if v10 then
            v48(v10.AbsoluteSize);
            v49 = v10:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 150 ]]
                -- upvalues: v48 (ref), v10 (ref)
                v48(v10.AbsoluteSize);
            end);
        end;
        return function() --[[ Line: 154 ]]
            -- upvalues: v49 (ref)
            if v49 then
                v49:Disconnect();
            end;
        end;
    end, {
        v48, 
        v10
    });
    return {
        numColumns = v33, 
        fractionalItemAmount = v31, 
        columnGap = v29, 
        sideMargin = v27, 
        verticalPadding = v23, 
        maxTilesToShow = v24, 
        itemWidth = v37, 
        loadMoreThreshold = v35
    };
end;