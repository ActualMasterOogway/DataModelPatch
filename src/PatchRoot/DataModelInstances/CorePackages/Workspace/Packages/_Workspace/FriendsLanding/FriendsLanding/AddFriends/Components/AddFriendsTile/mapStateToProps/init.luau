local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v6 = if l_FFlagAddFriendsSeparateReducers_0 then nil else require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v7 = require(l_AddFriends_0.Redux.AddFriendsSelector);
return function(v8, v9) --[[ Line: 15 ]]
    -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (copy), v7 (copy), l_getDeepValue_0 (copy), v6 (copy)
    local v10 = if l_FFlagAddFriendsSeparateReducers_0 then v7(v8, "RequestsFromOriginSourceType") or {} else l_getDeepValue_0(v8, "FriendsLanding.RequestsFromOriginSourceType") or {};
    local l_id_0 = v9.user.id;
    local v12 = if l_FFlagAddFriendsSeparateReducers_0 then v7(v8, "Friends.recommendations.hasIncomingFriendRequest.%s", l_id_0) or false else l_getDeepValue_0(v8, string.format("%s.Friends.recommendations.hasIncomingFriendRequest.%s", v6, l_id_0)) or false;
    return {
        friendStatus = if l_FFlagAddFriendsSeparateReducers_0 then v7(v8, "Friends.friendshipStatus.%s", l_id_0) or nil else l_getDeepValue_0(v8, string.format("FriendsLanding.Friends.friendshipStatus.%s", l_id_0)) or nil, 
        localUserId = v8.LocalUserId, 
        screenSize = v8.ScreenSize, 
        originSourceType = v10[l_id_0], 
        hasIncomingFriendRequest = v12
    };
end;