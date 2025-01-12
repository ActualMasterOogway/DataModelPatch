local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local l_getDeepValue_0 = v2.SocialLibraries.config({}).Dictionary.getDeepValue;
return v3.createReducer({}, {
    [v5.Succeeded.name] = function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: l_getDeepValue_0 (copy), v4 (copy)
        local l_responseBody_0 = v8.responseBody;
        if l_responseBody_0.profileType ~= "User" then
            return v7;
        else
            local v10 = l_getDeepValue_0(v7, (("%*"):format(l_responseBody_0.profileId))) or {};
            local v11 = if l_responseBody_0.componentOrdering then l_responseBody_0.componentOrdering else v10.componentOrdering;
            local v12 = v10.components or {};
            local v13 = v4.Dictionary.join(v12, l_responseBody_0.components);
            local v14 = {
                profileType = l_responseBody_0.profileType, 
                profileId = l_responseBody_0.profileId, 
                componentOrdering = v11, 
                components = v13
            };
            return v4.Dictionary.join(v7, {
                [l_responseBody_0.profileId] = v14
            });
        end;
    end
});