local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Style);
local v3 = require(l_Parent_0.Responsive);
local l_hasExtraPlatformInset_0 = v3.HardwareSafeAreaInsets.hasExtraPlatformInset;
local v5 = require(l_Parent_0.ArgCheck);
local v6 = require(l_script_FirstAncestor_0.calculateNumColumns);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v8 = game:DefineFastInt("XSmallCollectionItemMinItemCount", 3);
local v9 = game:DefineFastInt("XSmallCollectionItemMaxItemCount", 20);
local v10 = game:DefineFastInt("XSmallCollectionItemMinItemWidth", 100);
local v11 = game:DefineFastInt("XSmallCollectionItemVerticalGap", 16);
local v12 = game:DefineFastInt("XSmallCollectionItemFractionalPercent", 15);
local v13 = game:DefineFastInt("SmallCollectionItemMinItemCount", 3);
local v14 = game:DefineFastInt("SmallCollectionItemMaxItemCount", 12);
local v15 = game:DefineFastInt("SmallCollectionItemMinItemWidth", 150);
local v16 = game:DefineFastInt("SmallCollectionItemVerticalGap", 16);
local v17 = game:DefineFastInt("SmallCollectionItemFractionalPercent", 15);
local v18 = game:DefineFastInt("MediumCollectionItemMinItemCount", 2);
local v19 = game:DefineFastInt("MediumCollectionItemMaxItemCount", 6);
local v20 = game:DefineFastInt("MediumCollectionItemMinItemWidth", 233);
local v21 = game:DefineFastInt("MediumCollectionItemVerticalGap", 16);
local v22 = game:DefineFastInt("MediumCollectionItemFractionalPercent", 15);
local v23 = game:DefineFastInt("LargeCollectionItemMinItemCount", 1);
local v24 = game:DefineFastInt("LargeCollectionItemMaxItemCount", 4);
local v25 = game:DefineFastInt("LargeCollectionItemMinItemWidth", 300);
local v26 = game:DefineFastInt("LargeCollectionItemVerticalGap", 16);
local v27 = game:DefineFastInt("LargeCollectionItemFractionalPercent", 30) / 100;
local v28 = v22 / 100;
local v29 = v17 / 100;
local v30 = v12 / 100;
local function _(v31, v32) --[[ Line: 45 ]] --[[ Name: getLegacySideMargin ]]
    if v31 < 1024 then
        return v32.Global.Space_150;
    elseif v31 < 1280 then
        return 18;
    elseif v31 < 1440 then
        return v32.Global.Space_300;
    elseif v31 < 1920 then
        return 34;
    elseif v31 < 2260 then
        return 38;
    else
        return v32.Global.Space_600;
    end;
end;
local function _(v34, v35) --[[ Line: 63 ]] --[[ Name: getLegacyColumnGap ]]
    if v34 < 1024 then
        return v35.Global.Space_150;
    elseif v34 < 1280 then
        return 18;
    else
        return v35.Global.Space_300;
    end;
end;
local function v40(_, v38, v39) --[[ Line: 74 ]] --[[ Name: calculateSideMargin ]]
    -- upvalues: l_hasExtraPlatformInset_0 (copy)
    if l_hasExtraPlatformInset_0() then
        return v38.Global.Space_800;
    elseif v39 < 1024 then
        return v38.Global.Space_150;
    elseif v39 < 1280 then
        return 18;
    elseif v39 < 1440 then
        return v38.Global.Space_300;
    elseif v39 < 1920 then
        return 34;
    elseif v39 < 2260 then
        return 38;
    else
        return v38.Global.Space_600;
    end;
end;
local function v44(_, v42, v43) --[[ Line: 93 ]] --[[ Name: calculateColumnGap ]]
    if v43 < 1024 then
        return v42.Global.Space_150;
    elseif v43 < 1280 then
        return 18;
    else
        return v42.Global.Space_300;
    end;
end;
local function _(v45, v46) --[[ Line: 106 ]] --[[ Name: scaleSizeForPlatform ]]
    return v45 * v46.Global.Stroke_100;
end;
return {
    calculateNumColumns = function(v48, v49, v50, v51, v52) --[[ Line: 111 ]] --[[ Name: calculateNumColumnsForCollection ]]
        -- upvalues: l_CollectionItemSize_0 (copy), v25 (copy), v23 (copy), v24 (copy), v20 (copy), v18 (copy), v19 (copy), v5 (copy), v15 (copy), v13 (copy), v14 (copy), v10 (copy), v8 (copy), v9 (copy), v6 (copy)
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        if v51 == l_CollectionItemSize_0.Large then
            v53 = v25 * v52.Global.Stroke_100;
            v54 = v23;
            v55 = v24;
        elseif v51 == l_CollectionItemSize_0.Medium then
            v53 = v20 * v52.Global.Stroke_100;
            v54 = v18;
            v55 = v19;
        elseif v51 == l_CollectionItemSize_0.Small then
            v5.assert(v51 == l_CollectionItemSize_0.Small);
            v53 = v15 * v52.Global.Stroke_100;
            v54 = v13;
            v55 = v14;
        else
            v5.assert(v51 == l_CollectionItemSize_0.XSmall);
            v53 = v10 * v52.Global.Stroke_100;
            v54 = v8;
            v55 = v9;
        end;
        local v56 = v48 - 2 * v49;
        return v6(v53, v50, v54, v55, v56);
    end, 
    calculateSideMargin = v40, 
    calculateColumnGap = v44, 
    calculateVerticalPadding = function(v57, v58) --[[ Line: 145 ]] --[[ Name: calculateVerticalPadding ]]
        -- upvalues: l_CollectionItemSize_0 (copy), v26 (copy), v21 (copy), v16 (copy), v11 (copy)
        if v58 == l_CollectionItemSize_0.Large then
            return v26 * v57.Global.Stroke_100;
        elseif v58 == l_CollectionItemSize_0.Medium then
            return v21 * v57.Global.Stroke_100;
        elseif v58 == l_CollectionItemSize_0.Small then
            return v16 * v57.Global.Stroke_100;
        else
            return v11 * v57.Global.Stroke_100;
        end;
    end, 
    calculateFractionalItemAmount = function(v59, v60) --[[ Line: 168 ]] --[[ Name: calculateFractionalItemAmount ]]
        -- upvalues: l_CollectionItemSize_0 (copy), v3 (copy), v27 (copy), v28 (copy), v29 (copy), v30 (copy)
        if v59 == l_CollectionItemSize_0.Large then
            if v60 == v3.Input.Directional then
                return 0;
            else
                return v27;
            end;
        elseif v59 == l_CollectionItemSize_0.Medium then
            if v60 == v3.Input.Directional then
                return 0;
            else
                return v28;
            end;
        elseif v59 == l_CollectionItemSize_0.Small then
            if v60 == v3.Input.Directional then
                return 0;
            else
                return v29;
            end;
        elseif v60 == v3.Input.Directional then
            return 0;
        else
            return v30;
        end;
    end, 
    calculateMaxTilesToShow = function(v61) --[[ Line: 159 ]] --[[ Name: calculateMaxTilesToShow ]]
        -- upvalues: v3 (copy)
        if v61 == v3.Input.Directional then
            return 20;
        else
            return nil;
        end;
    end, 
    calculateLoadMoreThreshold = function(v62) --[[ Line: 180 ]] --[[ Name: calculateLoadMoreThreshold ]]
        return (math.max(1000, v62));
    end
};