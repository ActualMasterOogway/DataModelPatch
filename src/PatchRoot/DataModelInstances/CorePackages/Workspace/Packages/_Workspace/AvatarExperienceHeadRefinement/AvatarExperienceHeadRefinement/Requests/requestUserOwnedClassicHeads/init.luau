local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Http);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXFixFetchOwnedHeadsPaging);
return function(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: requestUserOwnedClassicHeads ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v7 = string.format("%sv2/users/%s/inventory?limit=100&sortOrder=Desc&assetTypes=Head&cursor=", v2.Url.INVENTORY_URL, v5);
    if v3() then
        v7 = string.format("%sv2/users/%s/inventory?limit=100&sortOrder=Desc&assetTypes=Head&cursor=%s", v2.Url.INVENTORY_URL, v5, v6 or "");
    end;
    return v4(v7, "GET");
end;