local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local l_Parent_1 = script.Parent;
local l_UserReducer_0 = require(l_Parent_0.UserLib).Reducers.UserReducer;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.LegacyFriendsRodux);
local l_ReducerDependencies_0 = require(l_Parent_0.NotificationsCommon).ReducerDependencies;
local l_FriendCount_0 = v4.Reducers.FriendCount;
local v7 = require(l_Parent_1.Invites);
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
local v9 = l_ReducerDependencies_0.RoduxNetworking.installReducer();
local v10 = l_RoduxShareLinks_0.installReducer();
return v3.combineReducers({
    FriendCount = l_FriendCount_0, 
    GameInvitesStatus = v7, 
    Users = l_UserReducer_0, 
    ShareLinks = v10, 
    NetworkStatus = v9
});