local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useQuery_0 = require(l_Parent_0.ApolloClient).useQuery;
local v3 = require(l_script_FirstAncestor_0.Apollo.ProfilesInsightsQuery);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_useQuery_0 (copy)
    local v6 = v3.createPageId(v5);
    return (l_useQuery_0(v3.query, {
        errorPolicy = "all", 
        skip = not v4 or #v4 == 0, 
        variables = {
            userIds = v4, 
            pageId = v6
        }
    }));
end;