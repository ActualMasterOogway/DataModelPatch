local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.useProfileInsightsFetch);
local v5 = require(l_script_FirstAncestor_0.Utils.useMatchSearchPagination);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.GraphQLServer);
local function v11(v8) --[[ Line: 22 ]]
    -- upvalues: v3 (copy)
    return v3.reduce(v8, function(v9, v10) --[[ Line: 23 ]]
        v9[v10.targetUserId] = v10;
        return v9;
    end, {});
end;
return function(v12) --[[ Line: 29 ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy), v4 (copy), v11 (copy)
    local v13 = v12.users or {};
    local v14 = v5({
        users = v13
    });
    local v16 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v14 (copy)
        return v3.map(v14, function(v15) --[[ Line: 34 ]]
            return v15.id;
        end);
    end, {
        v14
    });
    local v17 = v4(v16, v12.searchKeyword);
    local v18 = if v17.data and v17.data.profilesInsights then v17.data.profilesInsights.profileInsights else {};
    return (v2.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v11 (ref), v18 (copy)
        return v11(v18);
    end, {
        v18
    }));
end;