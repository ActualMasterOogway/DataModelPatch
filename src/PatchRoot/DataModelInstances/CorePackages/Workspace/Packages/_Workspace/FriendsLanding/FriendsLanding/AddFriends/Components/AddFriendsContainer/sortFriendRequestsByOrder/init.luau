local l_AddFriends_0 = script:FindFirstAncestor("FriendsLanding").AddFriends;
local v1 = require(l_AddFriends_0.dependencies);
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
return function(v4) --[[ Line: 16 ]]
    -- upvalues: l_t_0 (copy), l_llama_0 (copy)
    assert(l_t_0.table(v4));
    return l_llama_0.List.sort(v4, function(v5, v6) --[[ Line: 19 ]]
        return (v5.order or 9999999) < (v6.order or 9999999);
    end);
end;