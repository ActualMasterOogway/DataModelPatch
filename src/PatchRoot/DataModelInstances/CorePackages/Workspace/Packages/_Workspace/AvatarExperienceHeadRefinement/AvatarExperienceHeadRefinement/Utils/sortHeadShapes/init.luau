local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local v1 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v2 = {
    v1.Default, 
    v1.WomanHead, 
    v1.ManHead, 
    v1.Blockhead, 
    v1.Cheeks, 
    v1.Chiseled, 
    v1.Narrow, 
    v1.Paragon, 
    v1.Roundy, 
    v1.StrongJaw, 
    v1.Trim
};
local v3 = {};
for v4, v5 in v2 do
    v3[v5] = v4;
end;
return function(v6, v7) --[[ Line: 26 ]] --[[ Name: sortHeadShapes ]]
    -- upvalues: v3 (copy)
    local v8 = table.clone(v6);
    table.sort(v8, function(v9, v10) --[[ Line: 28 ]]
        -- upvalues: v7 (copy), v3 (ref)
        local v11 = v7(v9);
        local v12 = v7(v10);
        return v3[v11] < v3[v12];
    end);
    return v8;
end;