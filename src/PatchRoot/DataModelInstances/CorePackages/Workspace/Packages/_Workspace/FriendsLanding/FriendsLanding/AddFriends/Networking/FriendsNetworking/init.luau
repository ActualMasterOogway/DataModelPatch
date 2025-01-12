local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_AddFriends_0.Networking.myRoduxNetworking);
return require(l_Parent_0.FriendsNetworking).config({
    roduxNetworking = v3
});