local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Contexts_0 = require(l_script_FirstAncestor_0.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts;
return function(v3, v4, v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), l_Contexts_0 (copy)
    local v6 = nil;
    local v7 = v5 and v5.currentRoute;
    v6 = if v5 and v5.source then v5.source else if v7 == v1.AddFriends then l_Contexts_0.AddFriends else if v7 == v1.FriendsLanding then l_Contexts_0.FriendsLanding else if v7 == v1.SearchFriends then l_Contexts_0.PlayerSearch else "Unknown";
    v3:playerSearch(v4, v5 and v5.kwd or nil, v6, v7);
end;