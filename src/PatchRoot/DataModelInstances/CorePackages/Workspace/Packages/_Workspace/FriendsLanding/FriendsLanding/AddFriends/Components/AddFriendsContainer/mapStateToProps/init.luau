local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v4 = require(l_AddFriends_0.dependencies);
local l_llama_0 = v4.llama;
local l_getDeepValue_0 = v4.SocialLibraries.Dictionary.getDeepValue;
local v7 = require(l_AddFriends_0.Utils.contactImporterTooltip);
local v8 = require(script.Parent.getFriendRecommendationsFromState);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_FFlagAddFriendsSeparateReducers_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers;
local v11 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxAnalytics).Selectors.getSessionIdByKey else v4.RoduxAnalytics.Selectors.getSessionIdByKey;
local v12 = if l_FFlagAddFriendsSeparateReducers_0 then require(l_AddFriends_0.Redux.RoduxPresence) else v4.RoduxPresence;
local v13 = require(l_AddFriends_0.Redux.AddFriendsSelector);
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local v15 = require(script.Parent.sortFriendRequests);
local v16 = require(script.Parent.sortFriendRequestsByOrder);
local function v25(v17, v18) --[[ Line: 32 ]]
    -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (copy), v13 (copy), l_getDeepValue_0 (copy), l_llama_0 (copy), v12 (copy), l_FFlagFriendRequestNicknames_0 (copy), v16 (copy), v15 (copy)
    local v19 = if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, "Friends.requests.byUserId") else l_getDeepValue_0(v17, "FriendsLanding.Friends.requests.byUserId");
    if not v19 then
        return {};
    else
        local v20 = l_llama_0.Dictionary.keys(v19);
        local v23 = l_llama_0.List.map(v20, function(v21) --[[ Line: 41 ]]
            -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (ref), v13 (ref), v17 (copy), l_getDeepValue_0 (ref), l_llama_0 (ref), v12 (ref), l_FFlagFriendRequestNicknames_0 (ref)
            local v22 = if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, "Friends.requests.order.requestsById.%s", v21) else l_getDeepValue_0(v17, string.format("FriendsLanding.Friends.requests.order.requestsById.%s", v21));
            return l_llama_0.Dictionary.join(if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, "Users.byUserId.%s", v21) else l_getDeepValue_0(v17, string.format("FriendsLanding.Users.byUserId.%s", v21)), v12.Selectors.getUserPresenceByUserId(v17, v21), {
                sentAt = if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, "Friends.requests.sentAt.%s", v21) else l_getDeepValue_0(v17, string.format("FriendsLanding.Friends.requests.sentAt.%s", v21))
            }, {
                mutualFriends = if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, "Friends.requests.mutualFriends.%s", v21) else l_getDeepValue_0(v17, string.format("FriendsLanding.Friends.requests.mutualFriends.%s", v21))
            }, {
                contactName = if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, "Friends.contactNamesByUserId.%s", v21) else l_getDeepValue_0(v17, string.format("FriendsLanding.Friends.contactNamesByUserId.%s", v21))
            }, {
                order = v22
            }, {
                senderNickname = if l_FFlagFriendRequestNicknames_0 then if l_FFlagAddFriendsSeparateReducers_0 then v13(v17, (("Friends.requests.senderNickname.%*"):format(v21))) else l_getDeepValue_0(v17, (("FriendsLanding.Friends.requests.senderNickname.%*"):format(v21))) else nil
            });
        end);
        local v24 = true;
        if v18 ~= "largerWindow" then
            v24 = v18 == "sortByOrder";
        end;
        if v24 then
            return v16(v23);
        else
            return v15(v23);
        end;
    end;
end;
local function _(v26) --[[ Line: 97 ]]
    -- upvalues: v11 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy)
    return v11(v26)(l_RECOMMENDATION_SESSION_ID_KEY_0);
end;
return function(v28, v29) --[[ Line: 101 ]]
    -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (copy), v13 (copy), l_getDeepValue_0 (copy), l_llama_0 (copy), v7 (copy), l_AppStorageService_0 (copy), v8 (copy), v11 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v25 (copy)
    local v30 = nil;
    local v31 = nil;
    local v32 = if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "ShowContactImporterParams") or {} else l_getDeepValue_0(v28, "FriendsLanding.ShowContactImporterParams") or {};
    v30 = v32.shouldShowContactImporterFeature;
    v31 = v32.shouldShowContactImporterUpsellModal;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    v34 = v32.isPhoneVerified;
    v35 = v32.hasOSPermissions;
    v33 = v32.canUploadContacts;
    v36 = v32.isDiscoverabilityUnset;
    local v37 = if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "ContactImporterWarning.contactImporterFriendRequests") or {} else l_getDeepValue_0(v28, "FriendsLanding.ContactImporterWarning.contactImporterFriendRequests") or {};
    local v38 = not l_llama_0.isEmpty(v37);
    local v39 = v7.getKey(l_AppStorageService_0);
    local v40 = v38 and not v39;
    return {
        screenSize = v28.ScreenSize, 
        localUserId = v28.LocalUserId, 
        globalGuiInset = v28.GlobalGuiInset, 
        friendRecommendations = v8(v28) or {}, 
        friendRecommendationsSessionId = v11(v28)(l_RECOMMENDATION_SESSION_ID_KEY_0), 
        friendRequests = v25(v28, v29.friendRequestScoringVariant), 
        receivedCount = if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "Friends.requests.receivedCount") or 0 else l_getDeepValue_0(v28, "FriendsLanding.Friends.requests.receivedCount") or 0, 
        nextPageCursor = if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "Friends.requests.nextPageCursor") else l_getDeepValue_0(v28, "FriendsLanding.Friends.requests.nextPageCursor"), 
        amIFollowingUser = function(v41) --[[ Line: 137 ]] --[[ Name: amIFollowingUser ]]
            -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (ref), v13 (ref), v28 (copy), l_getDeepValue_0 (ref)
            local v42 = if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "IsUserFollowing") or {} else l_getDeepValue_0(v28, "FriendsLanding.IsUserFollowing") or {};
            return v42[v41.id] and v42[v41.id].isFollowing or false;
        end, 
        isUserFollowingMe = function(v43) --[[ Line: 143 ]] --[[ Name: isUserFollowingMe ]]
            -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (ref), v13 (ref), v28 (copy), l_getDeepValue_0 (ref)
            local v44 = if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "IsUserFollowing") or {} else l_getDeepValue_0(v28, "FriendsLanding.IsUserFollowing") or {};
            return v44[v43.id] and v44[v43.id].isFollowed or false;
        end, 
        getFriendshipRequestSentFromExperience = function(v45) --[[ Line: 149 ]] --[[ Name: getFriendshipRequestSentFromExperience ]]
            -- upvalues: l_FFlagAddFriendsSeparateReducers_0 (ref), v13 (ref), v28 (copy), l_getDeepValue_0 (ref)
            local v46 = (if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "Friends.requests.sourceUniverseIds") else l_getDeepValue_0(v28, "FriendsLanding.Friends.requests.sourceUniverseIds"))[v45.id];
            if v46 ~= nil and v46 ~= 0 then
                return (if l_FFlagAddFriendsSeparateReducers_0 then v13(v28, "Games.byGameId.%s", (tostring(v46))) or {} else l_getDeepValue_0(v28, string.format("FriendsLanding.Games.byGameId.%s", (tostring(v46)))) or {}).name;
            else
                return nil;
            end;
        end, 
        shouldShowContactImporterFeature = v30, 
        shouldShowContactImporterUpsellModal = v31, 
        isPhoneVerified = v34, 
        hasOSPermissions = v35, 
        canUploadContacts = v33, 
        isDiscoverabilityUnset = v36, 
        showTooltip = v40
    };
end;