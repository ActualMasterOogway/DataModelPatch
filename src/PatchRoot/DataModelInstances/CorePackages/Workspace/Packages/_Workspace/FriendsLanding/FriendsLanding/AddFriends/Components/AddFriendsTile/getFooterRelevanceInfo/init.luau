local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_AddFriends_0.dependencies);
local l_t_0 = v3.t;
local l_Images_0 = v3.UIBlox.App.ImageSet.Images;
local l_PresenceType_0 = v3.RoduxPresence.Enums.PresenceType;
local l_ContactImporterConstants_0 = v3.ContactImporterConstants;
local l_FriendshipOriginSourceType_0 = v3.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v9 = require(l_Parent_0.SocialCommon);
local l_getRecommendationContextualInfoDisplay_0 = v9.Utils.getRecommendationContextualInfoDisplay;
local l_getRecommendationContextualInfoType_0 = v9.Utils.getRecommendationContextualInfoType;
local l_ContextualInfoTypes_0 = v9.Enums.ContextualInfoTypes;
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local v14 = l_t_0.strictInterface({
    mutualFriends = l_t_0.optional(l_t_0.table), 
    amIFollowingUser = l_t_0.optional(l_t_0.boolean), 
    isUserFollowingMe = l_t_0.optional(l_t_0.boolean), 
    sentFromExperienceName = l_t_0.optional(l_t_0.string), 
    isFriendRequest = l_t_0.boolean, 
    isRecommendation = l_t_0.optional(l_t_0.boolean), 
    userPresenceType = l_t_0.optional(l_t_0.userdata), 
    friendStatus = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    lastLocation = l_t_0.optional(l_t_0.string), 
    originSourceType = l_t_0.optional(l_t_0.string), 
    contextType = l_t_0.optional(l_t_0.userdata), 
    mutualFriendsCount = l_t_0.optional(l_t_0.number), 
    hasIncomingFriendRequest = l_t_0.optional(l_t_0.boolean)
});
local function _(v15) --[[ Line: 43 ]]
    local v16 = false;
    if v15 ~= nil then
        v16 = #v15 > 0;
    end;
    return v16;
end;
return function(v18, v19, v20) --[[ Line: 47 ]]
    -- upvalues: v14 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_ContactImporterConstants_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_Images_0 (copy), l_ContextualInfoTypes_0 (copy), l_PresenceType_0 (copy), l_getRecommendationContextualInfoDisplay_0 (copy), l_getRecommendationContextualInfoType_0 (copy)
    assert(v14(v18));
    if v18.isFriendRequest then
        if v20.contactNameText then
            local v21 = {
                text = v20.contactNameText, 
                fontStyle = v19.Font.CaptionBody
            };
            if l_FFlagAddFriendsMigrateAnalytics_0 then
                return v21, "HaveContact";
            else
                return v21, nil;
            end;
        elseif v18.originSourceType == l_ContactImporterConstants_0.PHONE_CONTACT_IMPORTER then
            local v22 = {
                text = v20.fromContactsText, 
                fontStyle = v19.Font.CaptionBody
            };
            if l_FFlagAddFriendsMigrateAnalytics_0 then
                return v22, "FromCI";
            else
                return v22, nil;
            end;
        elseif v18.originSourceType == l_FriendshipOriginSourceType_0.QrCode.rawValue() then
            local v23 = {
                text = v20.foundThroughQRCode, 
                fontStyle = v19.Font.CaptionBody
            };
            if l_FFlagAddFriendsMigrateAnalytics_0 then
                return v23, "FRomQR";
            else
                return v23, nil;
            end;
        else
            local l_mutualFriends_0 = v18.mutualFriends;
            local v25 = false;
            if l_mutualFriends_0 ~= nil then
                v25 = #l_mutualFriends_0 > 0;
            end;
            if v25 then
                return {
                    text = ("%d %s"):format(#v18.mutualFriends, string.lower(v20.mutualFriendsText)), 
                    fontStyle = v19.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/friend"]
                }, l_ContextualInfoTypes_0.MutualFriends;
            elseif v18.sentFromExperienceName ~= nil then
                v25 = {
                    text = v20.sentFromWithContextText, 
                    fontStyle = v19.Font.CaptionBody
                };
                if l_FFlagAddFriendsMigrateAnalytics_0 then
                    return v25, "FromExperience";
                else
                    return v25, nil;
                end;
            elseif v18.amIFollowingUser then
                v25 = {
                    text = v20.youAreFollowingText, 
                    fontStyle = v19.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/following"]
                };
                if l_FFlagAddFriendsMigrateAnalytics_0 then
                    return v25, "FollowingUser";
                else
                    return v25, nil;
                end;
            elseif v18.isUserFollowingMe then
                v25 = {
                    text = v20.followsYouText, 
                    fontStyle = v19.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/following"]
                };
                if l_FFlagAddFriendsMigrateAnalytics_0 then
                    return v25, "FollowingMe";
                else
                    return v25, nil;
                end;
            else
                return nil;
            end;
        end;
    elseif v18.userPresenceType == l_PresenceType_0.InGame then
        local v26 = v18.lastLocation and {
            text = v18.lastLocation, 
            fontStyle = v19.Font.CaptionBody, 
            icon = l_Images_0["icons/actions/friends/friendsplaying"], 
            iconTransparency = v19.Theme.BackgroundUIDefault.Transparency, 
            iconSize = UDim2.new(0, 24, 0, 24)
        };
        if l_FFlagAddFriendsMigrateAnalytics_0 then
            return v26, "LastLocation";
        else
            return v26, nil;
        end;
    elseif v18.isRecommendation then
        local v27 = {
            contextType = v18.contextType, 
            mutualFriendsCount = v18.mutualFriendsCount, 
            hasIncomingFriendRequest = v18.hasIncomingFriendRequest
        };
        local v28 = {
            mutualFriends = v20.mutualFriends, 
            singularMutualFriend = v20.singularMutualFriend, 
            frequents = v20.frequents, 
            friendRequests = v20.friendRequests, 
            contacts = v20.fromContacts
        };
        local v29 = l_getRecommendationContextualInfoDisplay_0({
            recommendation = v27, 
            localized = v28
        });
        return {
            text = v29.text, 
            fontStyle = v19.Font.CaptionBody, 
            icon = v29.icon
        }, l_getRecommendationContextualInfoType_0(v27);
    else
        return nil;
    end;
end;