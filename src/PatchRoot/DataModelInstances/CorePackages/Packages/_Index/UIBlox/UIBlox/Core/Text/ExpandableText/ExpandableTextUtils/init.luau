local v0 = require(script.Parent.Parent.GetTextHeight);
return {
    getExpandableTextHeights = function(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: getExpandableTextHeights ]]
        -- upvalues: v0 (copy)
        local v5 = v1.BaseSize * v1.Body.RelativeSize;
        return v0(v3, v1.Body.Font, v5, v2), v4 * v5;
    end, 
    getCanExpand = function(v6, v7, v8, v9) --[[ Line: 14 ]] --[[ Name: getCanExpand ]]
        -- upvalues: v0 (copy)
        local v10 = v6.BaseSize * v6.Body.RelativeSize;
        return v0(v8, v6.Body.Font, v10, v7) > v9 * v10;
    end
};