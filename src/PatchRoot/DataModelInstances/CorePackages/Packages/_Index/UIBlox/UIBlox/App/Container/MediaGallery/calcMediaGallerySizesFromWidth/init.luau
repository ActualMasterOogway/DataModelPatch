local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.ImageSet.getIconSize)(require(l_Parent_0.ImageSet.Enum.IconSize).Medium);
calcMediaGallerySizesFromWidth = function(v2, v3) --[[ Line: 14 ]] --[[ Name: calcMediaGallerySizesFromWidth ]]
    -- upvalues: v1 (copy)
    local v4 = v2 - v1 * 2;
    local v5 = math.floor(v4 / 1.7777777777777777);
    local v6 = math.floor((v2 - 12 * (v3 - 1) - v1 * 2) / v3);
    local v7 = math.floor(v6 / 1.7777777777777777);
    local v8 = v5 + v7 + 24;
    return {
        contentSize = UDim2.fromOffset(v2, v8), 
        previewSize = UDim2.fromOffset(v4, v5), 
        paginationSize = UDim2.fromOffset(v2, v7), 
        thumbnailSize = UDim2.fromOffset(v6, v7)
    };
end;
return calcMediaGallerySizesFromWidth;