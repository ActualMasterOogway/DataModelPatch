local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local _ = require(l_script_FirstAncestor_0.Types.ContentPost);
return function(v2) --[[ Line: 5 ]]
    local v3 = {};
    local v4 = {};
    for _, v6 in pairs(v2) do
        local v7 = tostring(v6.experienceContext.experienceId);
        if not v4[v7] then
            table.insert(v3, v7);
            v4[v7] = true;
        end;
    end;
    return v3;
end;