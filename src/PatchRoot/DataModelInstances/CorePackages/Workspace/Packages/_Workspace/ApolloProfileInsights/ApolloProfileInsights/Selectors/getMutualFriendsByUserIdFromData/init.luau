local l_Parent_0 = script:FindFirstAncestor("ApolloProfileInsights").Parent;
local v1 = require(script.Parent.getProfileInsightsByUserIdFromData);
local _ = require(l_Parent_0.GraphQLServer);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    local v5 = v1(v3, v4);
    local v6;
    if v5 then
        v6 = v5.mutualFriends;
        if not v6 then
            return {};
        end;
    else
        v6 = {};
    end;
    return v6;
end;