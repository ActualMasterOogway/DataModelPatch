local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = if require(l_Parent_1.Flags.FFlagUpdateInvitesToUsePaginatedFriends) then require(l_Parent_0.FriendsListContextProvider2) else require(l_Parent_0.FriendsListContextProvider);
local v4 = require(l_Parent_0.InviteCallbackProvider);
local v5 = require(l_Parent_0.SelectedUsersContextProvider);
local v6 = require(l_Parent_2.React);
local l_GetFFlagEnableFriendMenuMultiSelect_0 = require(l_Parent_2.SharedFlags).GetFFlagEnableFriendMenuMultiSelect;
return function(v8) --[[ Line: 26 ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy), l_GetFFlagEnableFriendMenuMultiSelect_0 (copy), v5 (copy)
    return v6.createElement(v3, {
        excludedFriendsSet = v8.excludedFriendsSet, 
        isLoadingCustomParams = v8.isLoadingCustomParams
    }, v6.createElement(v4, {
        inviteSingleFriend = v8.inviteSingleFriend, 
        inviteMultiFriends = v8.inviteMultiFriends
    }, if l_GetFFlagEnableFriendMenuMultiSelect_0() then v6.createElement(v5, {
        selectionLimit = v8.selectionLimit
    }, v8.children) else v8.children));
end;