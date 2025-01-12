local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContentSharingRodux");
local v1 = require(l_script_FirstAncestor_0.Reducers.ContentSharing.getPostsByUserId);
local v2 = {
    byUserId = {}
};
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy)
        local v6 = v4 or v2;
        return v1(v3)(v6, v5);
    end;
end;