local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.ImageSet.getIconSize);
local v3 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v4 = require(l_Parent_0.calcMediaGallerySizesFromWidth);
local v5 = v2(v3.Medium);
calcMediaGallerySizesFromHeight = function(v6, v7) --[[ Line: 16 ]] --[[ Name: calcMediaGallerySizesFromHeight ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v8 = math.floor((math.floor((v6 - 24) * 1.7777777777777777 * v7) + 12 * (v7 - 1) + v5 * 2 + v5 * 2 * v7) / (v7 + 1));
    return v4(v8, v7);
end;
return calcMediaGallerySizesFromHeight;