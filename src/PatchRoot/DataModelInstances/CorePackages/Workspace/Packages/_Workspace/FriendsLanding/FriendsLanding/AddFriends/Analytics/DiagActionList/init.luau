local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(script.Parent.EventNames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.SocialLuaAnalytics);
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local v5 = {
    [v1.OpenUserSearch] = {
        name = game:DefineFastString("AddFriendsPageOpenUserSearch", "AddFriendsPageOpenUserSearch")
    }
};
if l_FFlagAddFriendsMigrateAnalytics_0 then
    return nil;
else
    return v5;
end;