local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_getDeepValue_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Dictionary.getDeepValue;
local v3 = require(l_AddFriends_0.Redux.RODUX_KEY);
return function(v4, v5, ...) --[[ Line: 10 ]]
    -- upvalues: l_getDeepValue_0 (copy), v3 (copy)
    local v6 = {
        ...
    };
    local v7 = if v5 then "%s." .. v5 else "%s";
    return l_getDeepValue_0(v4, string.format(v7, v3, unpack(v6)));
end;