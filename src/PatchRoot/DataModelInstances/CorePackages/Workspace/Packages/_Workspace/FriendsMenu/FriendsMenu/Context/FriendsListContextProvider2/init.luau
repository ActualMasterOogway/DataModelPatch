local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_utils_0 = l_Parent_1.utils;
local v5 = require(l_Parent_1.FriendsMenuDependencies);
local v6 = require(l_Parent_2.React);
local v7 = require(l_Parent_2.UserLib);
local v8 = require(l_Parent_2.RoactUtils);
local v9 = require(l_Parent_2.UserProfiles);
local v10 = require(l_Parent_2.FriendsCommon);
local v11 = require(l_Parent_2.Cryo);
local v12 = require(l_Parent_2.GraphQLServer);
local l_Constants_0 = v7.Utils.Constants;
local l_ThumbnailRequest_0 = v7.Utils.ThumbnailRequest;
local l_PreloadUsersThumbnail_0 = v7.Thunks.PreloadUsersThumbnail;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_sortFriendsByCorrectedPresenceAndRank_0 = v5.sortFriendsByCorrectedPresenceAndRank;
local l_networkImpl_0 = v5.networkImpl;
local l_PresenceType_0 = v12.types.PresenceType;
local v20 = require(l_Parent_1.Requests.GetFriendsSearch);
local v21 = require(l_Parent_0.FriendsListContext);
local l_useFriendsListOrderedByPresence_0 = v10.Hooks.useFriendsListOrderedByPresence;
local v23 = require(l_utils_0.generateDummyFriends);
local v24 = require(l_Parent_1.Flags.FFlagFixFriendsListFirstLoadUI);
local l_UserModel_0 = v7.Models.UserModel;
local v26 = {
    InviteAvatarThumbnailType = l_Constants_0.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
    InviteAvatarThumbnailSize = l_Constants_0.RbxThumbnailSizes.Size150x150, 
    InviteAvatarRbxthumbType = l_Constants_0.RbxthumbTypes.AvatarHeadShot
};
v26.ThumbnailRequest = {
    InviteToGame = {
        l_ThumbnailRequest_0.fromData(v26.InviteAvatarThumbnailType, v26.InviteAvatarThumbnailSize)
    }
};
return function(v27) --[[ Line: 53 ]]
    -- upvalues: l_networkImpl_0 (copy), l_Players_0 (copy), l_useDispatch_0 (copy), v6 (copy), v24 (copy), v23 (copy), l_useFriendsListOrderedByPresence_0 (copy), v9 (copy), v11 (copy), l_PreloadUsersThumbnail_0 (copy), v26 (copy), l_UserModel_0 (copy), l_PresenceType_0 (copy), l_sortFriendsByCorrectedPresenceAndRank_0 (copy), v20 (copy), v21 (copy)
    local v28 = nil;
    v28 = if v27.networkImplOverride then v27.networkImplOverride else l_networkImpl_0;
    local v29 = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "0";
    local v30 = l_useDispatch_0();
    local v31, v32 = v6.useState("");
    local v33, v34 = v6.useState(true);
    local v35 = {};
    local v36, v37 = v6.useState(if v24 then v23(10) else {});
    local v38 = l_useFriendsListOrderedByPresence_0({
        userId = v29, 
        pageSize = 50, 
        shouldListenToPresenceUpdates = false
    });
    local v39 = v9.Hooks.useUserProfilesFetch({
        userIds = {}, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local function v53(v40) --[[ Line: 80 ]]
        -- upvalues: v24 (ref), v11 (ref), v30 (copy), l_PreloadUsersThumbnail_0 (ref), v26 (ref), v39 (copy), v27 (copy), l_UserModel_0 (ref), v38 (copy), l_PresenceType_0 (ref), l_sortFriendsByCorrectedPresenceAndRank_0 (ref), v37 (copy), v34 (copy), v35 (ref)
        if v24 or not v11.isEmpty(v40) then
            v30(l_PreloadUsersThumbnail_0(v40, v26.ThumbnailRequest.InviteToGame, nil));
            v39:fetchMore({
                variables = {
                    userIds = v40
                }
            }):andThen(function(v41) --[[ Line: 89 ]]
                -- upvalues: v40 (copy), v27 (ref), l_UserModel_0 (ref), v38 (ref), l_PresenceType_0 (ref), l_sortFriendsByCorrectedPresenceAndRank_0 (ref), v37 (ref), v24 (ref), v34 (ref)
                local v42 = {};
                for _, v44 in v40 do
                    if not v27.excludedFriendsSet or not v27.excludedFriendsSet[v44] then
                        local l_OFFLINE_0 = l_UserModel_0.PresenceType.OFFLINE;
                        local v46 = nil;
                        for _, v48 in v38.onlineFriends do
                            if v44 == v48.id then
                                if v48.presence then
                                    local l_userPresenceType_0 = v48.presence.userPresenceType;
                                    if l_userPresenceType_0 == l_PresenceType_0.InGame then
                                        l_OFFLINE_0 = l_UserModel_0.PresenceType.IN_GAME;
                                    elseif l_userPresenceType_0 == l_PresenceType_0.Online then
                                        l_OFFLINE_0 = l_UserModel_0.PresenceType.ONLINE;
                                    elseif l_userPresenceType_0 == l_PresenceType_0.InStudio then
                                        l_OFFLINE_0 = l_UserModel_0.PresenceType.IN_STUDIO;
                                    end;
                                    v46 = v48.presence.lastLocation;
                                    break;
                                else
                                    break;
                                end;
                            end;
                        end;
                        for _, v51 in v41.data.userProfiles do
                            if v51.id == v44 then
                                table.insert(v42, {
                                    id = v44, 
                                    presence = l_OFFLINE_0, 
                                    lastLocation = v46, 
                                    displayName = v51.names.combinedName, 
                                    name = v51.names.username
                                });
                                break;
                            end;
                        end;
                    end;
                end;
                table.sort(v42, l_sortFriendsByCorrectedPresenceAndRank_0);
                v37(v42);
                if v24 then
                    v34(false);
                end;
            end):catch(function(v52) --[[ Line: 132 ]]
                -- upvalues: v24 (ref), v34 (ref)
                print("error", v52);
                if v24 then
                    v34(false);
                end;
            end);
        end;
        if v35 then
            return (v11.List.join(v35, v40));
        else
            return v40;
        end;
    end;
    v35 = v6.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: v31 (copy), v20 (ref), v28 (ref), v29 (copy), v11 (ref), v53 (copy), v38 (copy), v35 (ref)
        if v31 ~= "" then
            v20(v28, v29, v31, 20):andThen(function(v54) --[[ Line: 144 ]]
                -- upvalues: v11 (ref), v53 (ref)
                local v56 = v11.List.map(v54.responseBody.PageItems, function(v55) --[[ Line: 145 ]]
                    return (tostring(v55.id));
                end);
                return (v53(v56));
            end):catch(function(v57) --[[ Line: 149 ]]
                print("error", v57);
            end);
        elseif v38.onlineFriends and v38.offlineFriends then
            local v58 = {};
            for _, v60 in (v11.List.join(v38.offlineFriends, v38.onlineFriends)) do
                if not (v11.List.find(v35, v60.id) ~= nil) then
                    table.insert(v58, v60.id);
                end;
            end;
            return (v53(v58));
        end;
        return {};
    end, {
        v38.onlineFriends, 
        v38.offlineFriends, 
        v31
    });
    return v6.createElement(v21.Provider, {
        value = {
            friends = v36, 
            hasFriends = if v24 then not v11.isEmpty(v38.onlineFriends) or not v11.isEmpty(v38.offlineFriends) else not v11.isEmpty(v36), 
            isFetchingFriends = v39.loading or v27.isLoadingCustomParams or v24 and v33, 
            isFriendsListFetchFailed = false, 
            friendsNames = {
                loading = v39 and v39.loading
            }, 
            fetchMoreFriends = v38.fetchMoreFriends, 
            searchFriends = v32, 
            searchFriendsString = v31
        }
    }, v27.children);
end;