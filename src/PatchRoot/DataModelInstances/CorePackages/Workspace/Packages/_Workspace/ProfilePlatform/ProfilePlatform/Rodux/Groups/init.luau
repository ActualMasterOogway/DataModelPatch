local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
return v2.createReducer({}, {
    [v4.Succeeded.name] = function(v5, v6) --[[ Line: 15 ]]
        -- upvalues: v3 (copy)
        local l_responseBody_0 = v6.responseBody;
        if l_responseBody_0.profileType ~= "Group" then
            return v5;
        else
            return v3.Dictionary.join(v5, {
                [l_responseBody_0.profileId] = l_responseBody_0
            });
        end;
    end
});