local l_Modules_0 = script:FindFirstAncestor("DiscoveryMonolith").Modules;
local v1 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v2 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
return function(v3) --[[ Line: 6 ]] --[[ Name: mapContentTypeToTreatmentType ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = nil;
    if v3 == v2.ContentGroupType.Game then
        return v1.SearchGameGrid;
    elseif v3 == v2.ContentGroupType.Text then
        return v1.SearchText;
    else
        if v3 == v2.ContentGroupType.User then
            v4 = v1.UserSearchGrid;
        end;
        return v4;
    end;
end;