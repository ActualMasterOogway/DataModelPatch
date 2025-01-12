local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local v1 = require(l_script_FirstAncestor_0.Utils.getEquippedAssetIdsByAssetTypeId);
local v2 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local function _(v3) --[[ Line: 7 ]] --[[ Name: isClassicFaceEquipped ]]
    -- upvalues: v1 (copy)
    return #v1(v3, (tostring(Enum.AssetType.Face.Value))) > 0;
end;
return function(v5) --[[ Line: 13 ]] --[[ Name: getDefaultSelectedHeadShapeName ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_isTryingOnItems_0 = v5.isTryingOnItems;
    local l_equippedAssets_0 = v5.equippedAssets;
    local v8 = if #v1(l_equippedAssets_0, (tostring(Enum.AssetType.Face.Value))) > 0 then v5.defaultHeadShapeName else nil;
    if l_isTryingOnItems_0 then
        return v5.lastTryOnHeadShapeName or v5.equippedHeadShapeName or v8;
    else
        return v5.equippedHeadShapeName or v2.Default;
    end;
end;