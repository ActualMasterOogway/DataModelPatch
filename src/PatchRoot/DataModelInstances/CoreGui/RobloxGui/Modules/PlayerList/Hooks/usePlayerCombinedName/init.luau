local l_CorePackages_0 = game:GetService("CorePackages");
local l_useQuery_0 = require(l_CorePackages_0.Packages.ApolloClient).useQuery;
local v2 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: usePlayerCombinedName ]]
    -- upvalues: l_useQuery_0 (copy), v2 (copy)
    local v5 = l_useQuery_0(v2.Queries.userProfilesInExperienceNamesByUserIds, {
        variables = {
            userIds = {
                v3
            }
        }
    });
    return (if v5.data then v2.Selectors.getInExperienceCombinedNameFromId(v5.data, v3) else nil) or v4;
end;