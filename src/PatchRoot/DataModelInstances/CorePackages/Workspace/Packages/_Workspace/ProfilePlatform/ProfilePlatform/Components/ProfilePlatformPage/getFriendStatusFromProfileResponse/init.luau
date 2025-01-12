local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = game:DefineFastFlag("ProfilePlatformFixFriendsAttribution", false);
local v4 = {
    Self = "self", 
    NotFriends = "nonfriend", 
    Friends = "friend", 
    RequestSent = "requestSent", 
    RequestReceived = "requestReceived", 
    Ineligible = "ineligible", 
    Unknown = "unknown"
};
return function(v5) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v6 = v1(v5, (("responseBody.components.%*.primary"):format(v2.Components.Actions)));
    if not v6 then
        return v4.Unknown;
    elseif v6 == v2.ProfileActions.PendingFriendRequest then
        return v4.RequestSent;
    elseif v6 == v2.ProfileActions.AcceptFriendRequest then
        return v4.RequestReceived;
    elseif v6 == v2.ProfileActions.Chat or v6 == v2.ProfileActions.JoinExperience or v3 and v2.ProfileActions.EditAlias then
        return v4.Friends;
    elseif v6 == v2.ProfileActions.EditProfile then
        return v4.Self;
    elseif v6 == v2.ProfileActions.Unfriend then
        return v4.Ineligible;
    else
        return v4.NotFriends;
    end;
end;