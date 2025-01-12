local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local v1 = require(l_script_FirstAncestor_0.Utils.getEquippedAssetIdsByAssetTypeId);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v3 = require(l_script_FirstAncestor_0.Enums.HeadShapePropertiesByAssetId);
return function(v4, v5) --[[ Line: 7 ]] --[[ Name: getEquippedHeadShapeName ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v6 = v1(v4, v5)[1];
    if not v6 then
        return nil;
    else
        return (v3[tostring(v6)] or {
            name = nil
        }).name;
    end;
end;