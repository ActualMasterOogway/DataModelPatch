local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_MockUser_0 = require(l_Parent_0.UserLib).Models.MockUser;
return function(v2) --[[ Line: 13 ]]
    -- upvalues: l_MockUser_0 (copy)
    local v3 = l_MockUser_0.new();
    v3.name = v2.name;
    v3.displayName = v2.displayName;
    v3.id = v2.id;
    v3.isFriend = v2.isFriend or true;
    return v3;
end;