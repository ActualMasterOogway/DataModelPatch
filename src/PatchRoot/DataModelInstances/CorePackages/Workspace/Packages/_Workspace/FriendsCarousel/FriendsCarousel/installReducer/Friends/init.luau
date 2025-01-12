local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_convertActions_0 = v1.convertActions;
local l_friendsActionAdaptor_0 = v1.friendsActionAdaptor;
local l_FFlagEnableNewFriendRequestsBadge_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewFriendRequestsBadge;
local v7 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0, 
        newFriendRequestsCount = l_FFlagEnableNewFriendRequestsBadge_0 and 0 or nil
    }, 
    recommendations = {}, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}
};
return l_convertActions_0(l_RoduxFriends_0.installReducer(), l_friendsActionAdaptor_0(l_RoduxFriends_0), v7);