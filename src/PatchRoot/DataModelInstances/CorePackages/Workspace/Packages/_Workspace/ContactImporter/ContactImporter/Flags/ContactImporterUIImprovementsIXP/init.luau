local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_useUserExperiment_0 = require(l_script_FirstAncestor_0.dependencies).useUserExperiment;
local v2 = game:DefineFastString("ThumbnailsInCILayer", "Social.ContactList");
local v3 = game:DefineFastString("ThumbnailsInCIVariable", "show_new_ci_ui");
local function _(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    local v5 = nil;
    if v4 then
        v5 = v4[v3];
    end;
    return v5;
end;
local function v10(v7) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8 = if v7 then v7[v2] else nil;
    local v9 = nil;
    if v8 then
        v9 = v8[v3];
    end;
    return v9 or false;
end;
return {
    useShouldDisplayUIImprovements = function() --[[ Line: 21 ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy), v10 (copy)
        return l_useUserExperiment_0({
            v2
        }, v10);
    end
};