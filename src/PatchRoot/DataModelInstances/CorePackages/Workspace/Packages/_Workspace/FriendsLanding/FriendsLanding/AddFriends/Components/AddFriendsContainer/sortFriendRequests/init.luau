local l_AddFriends_0 = script:FindFirstAncestor("FriendsLanding").AddFriends;
local v1 = require(l_AddFriends_0.dependencies);
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
return function(v4) --[[ Line: 13 ]]
    -- upvalues: l_t_0 (copy), l_llama_0 (copy)
    assert(l_t_0.table(v4));
    return l_llama_0.List.sort(v4, function(v5, v6) --[[ Line: 19 ]]
        local v7 = v5.sentAt and v5.sentAt.UnixTimestampMillis or 0;
        local v8 = v6.sentAt and v6.sentAt.UnixTimestampMillis or 0;
        if v7 ~= v8 then
            return v8 < v7;
        elseif v5.displayName and not v6.displayName then
            return true;
        elseif not v5.displayName and v6.displayName then
            return false;
        elseif v5.displayName and v6.displayName and string.lower(v5.displayName) ~= string.lower(v6.displayName) then
            return string.lower(v5.displayName) < string.lower(v6.displayName);
        elseif v5.username and v6.username then
            return string.lower(v5.username) < string.lower(v6.username);
        elseif v5.username and not v6.username then
            return true;
        else
            return false;
        end;
    end);
end;