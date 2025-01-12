local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_script_FirstAncestor_0.Utils.getRecommendationContextualInfoDisplay);
return function(v4) --[[ Line: 29 ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy)
    local v5 = l_useLocalization_0({
        singularMutualFriend = "Feature.Friends.Label.SingularMutualFriend", 
        mutualFriends = "Feature.Friends.Label.MutualFriends", 
        frequents = "Feature.Friends.Label.Frequent", 
        friendRequests = "Feature.Friends.Label.FriendRequest", 
        contacts = "Feature.Friends.Description.FromContacts"
    });
    return v3({
        recommendation = v4, 
        localized = v5
    });
end;