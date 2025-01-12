local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getMutualFriendsText);
local v3 = require(l_script_FirstAncestor_0.Enums.RecommendationContextType);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
return function(v5) --[[ Line: 43 ]]
    -- upvalues: v3 (copy), v2 (copy), l_Images_0 (copy)
    local v6 = nil;
    local v7 = nil;
    local v8 = v5.recommendation.contextType and v5.recommendation.contextType.rawValue();
    local v9 = v5.recommendation.mutualFriendsCount or 0;
    if v8 == v3.Contacts.rawValue() then
        v6 = v5.localized.contacts;
    elseif v8 == v3.MutualFriends.rawValue() and v9 > 0 then
        v6 = v2({
            mutualFriendsCount = v9, 
            localized = {
                mutualFriends = v5.localized.mutualFriends, 
                singularMutualFriend = v5.localized.singularMutualFriend
            }
        });
        v7 = l_Images_0["icons/status/player/friend"];
    elseif v8 == v3.Frequents.rawValue() then
        v6 = v5.localized.frequents;
    end;
    if v5.recommendation.hasIncomingFriendRequest then
        v6 = v5.localized.friendRequests;
        v7 = nil;
    end;
    return {
        text = v6, 
        icon = v7
    };
end;