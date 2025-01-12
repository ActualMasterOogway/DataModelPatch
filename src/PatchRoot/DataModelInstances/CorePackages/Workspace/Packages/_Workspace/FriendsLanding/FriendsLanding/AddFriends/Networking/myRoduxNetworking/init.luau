local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoduxNetworking);
local l_ChallengeRequestWrapper_0 = require(l_Parent_0.GenericChallenges).Middleware.ChallengeRequestWrapper;
local v5 = require(l_AddFriends_0.Redux.RODUX_KEY);
local v6 = require(script.Parent.myHttpRequest);
return (v3.config({
    keyPath = ("%*.NetworkStatus"):format(v5), 
    networkImpl = l_ChallengeRequestWrapper_0(v6)
}));