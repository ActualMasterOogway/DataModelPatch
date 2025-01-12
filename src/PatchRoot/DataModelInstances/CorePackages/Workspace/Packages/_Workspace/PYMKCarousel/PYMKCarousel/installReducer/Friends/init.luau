local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_convertActions_0 = v2.convertActions;
local l_friendsActionAdaptor_0 = v2.friendsActionAdaptor;
local l_llama_0 = v2.llama;
local v7 = require(script.Parent.friendsOmniActionAdaptor);
local l_FFlagAddNewFriendRequestsNetworking_0 = require(l_Parent_0.SharedFlags).FFlagAddNewFriendRequestsNetworking;
local v9 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0, 
        newFriendRequestsCount = l_FFlagAddNewFriendRequestsNetworking_0 and 0 or nil, 
        byUserId = {}, 
        mutualFriends = {}, 
        sentAt = {}, 
        sourceUniverseIds = {}
    }, 
    recommendations = {
        byUserId = {}, 
        bySource = {}
    }, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}
};
local v10 = l_RoduxFriends_0.installReducer();
local function _(v11) --[[ Line: 33 ]]
    -- upvalues: l_llama_0 (copy), l_friendsActionAdaptor_0 (copy), l_RoduxFriends_0 (copy), v7 (copy)
    return l_llama_0.Dictionary.join(l_friendsActionAdaptor_0(l_RoduxFriends_0), v7(v11));
end;
return function(v13) --[[ Line: 37 ]]
    -- upvalues: l_convertActions_0 (copy), v10 (copy), l_llama_0 (copy), l_friendsActionAdaptor_0 (copy), l_RoduxFriends_0 (copy), v7 (copy), v9 (copy)
    return l_convertActions_0(v10, l_llama_0.Dictionary.join(l_friendsActionAdaptor_0(l_RoduxFriends_0), v7(v13)), v9);
end;