local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_utils_0 = l_Parent_1.utils;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_1.FriendsMenuDependencies);
local v6 = require(l_Parent_1.Constants);
local _ = require(l_Parent_1.friendsMenuModalType);
local v8 = require(l_Parent_2.React);
local l_Requests_0 = require(l_Parent_2.Http).Requests;
local v10 = require(l_Parent_2.UserLib);
local v11 = require(l_Parent_2.RoactUtils);
local v12 = require(l_Parent_2.UserProfiles);
local v13 = require(l_Parent_2.SharedFlags);
local l_FFlagFixPreloadingThumbsNilEntries_0 = v13.FFlagFixPreloadingThumbsNilEntries;
local l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 = v13.GetFFlagEnableFriendsListSearchNormalizationErrorFix;
local v16 = game:DefineFastFlag("InviteListDeprecateNames", false);
local l_UserModel_0 = v10.Models.UserModel;
local l_Constants_0 = v10.Utils.Constants;
local l_ApiFetchUsersPresences_0 = v10.Thunks.ApiFetchUsersPresences;
local l_UpdateUsers_0 = v10.Thunks.UpdateUsers;
local l_ThumbnailRequest_0 = v10.Utils.ThumbnailRequest;
local l_PreloadUsersThumbnail_0 = v10.Thunks.PreloadUsersThumbnail;
local l_networkImpl_0 = v5.networkImpl;
local l_sortFriendsByCorrectedPresenceAndRank_0 = v5.sortFriendsByCorrectedPresenceAndRank;
local l_useSelector_0 = v11.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local v27 = require(l_Parent_0.FriendsListContext);
local v28 = require(l_utils_0.generateDummyFriends);
local l_DEPRECATED_UsersGetFriends_0 = l_Requests_0.DEPRECATED_UsersGetFriends;
local l_UserSorts_0 = v6.UserSorts;
local v31 = {
    InviteAvatarThumbnailType = l_Constants_0.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
    InviteAvatarThumbnailSize = l_Constants_0.RbxThumbnailSizes.Size150x150, 
    InviteAvatarRbxthumbType = l_Constants_0.RbxthumbTypes.AvatarHeadShot
};
v31.ThumbnailRequest = {
    InviteToGame = {
        l_ThumbnailRequest_0.fromData(v31.InviteAvatarThumbnailType, v31.InviteAvatarThumbnailSize)
    }
};
return function(v32) --[[ Line: 64 ]]
    -- upvalues: l_networkImpl_0 (copy), v8 (copy), v28 (copy), l_useDispatch_0 (copy), v12 (copy), l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 (copy), l_Players_0 (copy), l_FFlagFixPreloadingThumbsNilEntries_0 (copy), l_DEPRECATED_UsersGetFriends_0 (copy), l_UserSorts_0 (copy), v16 (copy), l_UserModel_0 (copy), l_UpdateUsers_0 (copy), l_PreloadUsersThumbnail_0 (copy), v31 (copy), l_ApiFetchUsersPresences_0 (copy), l_useSelector_0 (copy), l_sortFriendsByCorrectedPresenceAndRank_0 (copy), v27 (copy)
    local v33 = nil;
    v33 = if v32.networkImplOverride then v32.networkImplOverride else l_networkImpl_0;
    local v34, v35 = v8.useState(false);
    local v36, v37 = v8.useState(false);
    local v38, v39 = v8.useState({});
    local v40, v41 = v8.useState("");
    local v42, v43 = v8.useState((v28(7)));
    local v44 = l_useDispatch_0();
    local v45 = nil;
    v45 = v12.Hooks.useUserProfilesFetch({
        userIds = v38, 
        query = v12.Queries.userProfilesAllNamesByUserIds
    });
    local function v59(v46) --[[ Line: 91 ]]
        -- upvalues: v32 (copy), v40 (copy), v45 (ref), v12 (ref), l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 (ref)
        if not v46 or not v46.isFriend then
            return false;
        elseif v32.excludedFriendsSet and v32.excludedFriendsSet[v46.id] then
            return false;
        elseif v40 == nil or v40 == "" then
            return true;
        else
            local v47 = v46.displayName or "";
            local v48 = v46.name or "";
            local v49 = "";
            local v50 = "";
            local v51 = "";
            if v45 and v45.data then
                local l_names_0 = v12.Selectors.getUserProfileFromId(v45.data, v46.id).names;
                if l_names_0 then
                    v49 = l_names_0.alias or "";
                    v47 = l_names_0.displayName or "";
                    v48 = l_names_0.username or "";
                    v50 = l_names_0.contactName or "";
                    v51 = l_names_0.platformName or "";
                end;
            end;
            local v53 = utf8.nfdnormalize(v47);
            local v54 = utf8.nfdnormalize(v49);
            local v55 = utf8.nfdnormalize(v50);
            local v56 = utf8.nfdnormalize(v51);
            local v57 = nil;
            if l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then
                pcall(function() --[[ Line: 128 ]]
                    -- upvalues: v57 (ref), v40 (ref)
                    v57 = utf8.nfdnormalize(v40);
                end);
            else
                v57 = utf8.nfdnormalize(v40);
            end;
            if l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() then
                return v57 and (string.find(v54:lower(), v57:lower(), 1, true) ~= nil or string.find(v55:lower(), v57:lower(), 1, true) ~= nil or string.find(v56:lower(), v57:lower(), 1, true) ~= nil or string.find(v53:lower(), v57:lower(), 1, true) ~= nil) or string.find(v48:lower(), v40:lower(), 1, true) ~= nil;
            else
                local v58 = true;
                if string.find(v54:lower(), v57:lower(), 1, true) == nil then
                    v58 = true;
                    if string.find(v55:lower(), v57:lower(), 1, true) == nil then
                        v58 = true;
                        if string.find(v56:lower(), v57:lower(), 1, true) == nil then
                            v58 = true;
                            if string.find(v53:lower(), v57:lower(), 1, true) == nil then
                                v58 = string.find(v48:lower(), v40:lower(), 1, true) ~= nil;
                            end;
                        end;
                    end;
                end;
                return v58;
            end;
        end;
    end;
    local function _(v60) --[[ Line: 158 ]]
        -- upvalues: v45 (ref), v12 (ref)
        local v61 = nil;
        if v45 and v45.data then
            v61 = v12.Selectors.getCombinedNameFromId(v45.data, v60.id);
        end;
        if v61 == nil then
            return v60.displayName;
        else
            return v61;
        end;
    end;
    local function _(v63) --[[ Line: 170 ]]
        -- upvalues: v45 (ref), v12 (ref)
        local v64 = nil;
        if v45 and v45.data then
            v64 = v12.Selectors.getUsernameFromId(v45.data, v63.id);
        end;
        if v64 == nil then
            return v63.name;
        else
            return v64;
        end;
    end;
    v8.useEffect(function() --[[ Line: 182 ]]
        -- upvalues: l_Players_0 (ref), v34 (copy), v35 (copy), v37 (copy), l_FFlagFixPreloadingThumbsNilEntries_0 (ref), l_DEPRECATED_UsersGetFriends_0 (ref), v33 (ref), l_UserSorts_0 (ref), v16 (ref), l_UserModel_0 (ref), v44 (copy), l_UpdateUsers_0 (ref), v39 (copy), l_PreloadUsersThumbnail_0 (ref), v31 (ref), l_ApiFetchUsersPresences_0 (ref)
        local v66 = nil;
        if l_Players_0 and l_Players_0.LocalPlayer then
            v66 = tostring(l_Players_0.LocalPlayer.UserId);
        end;
        if not v34 and v66 then
            v35(true);
            v37(false);
            if l_FFlagFixPreloadingThumbsNilEntries_0 then
                l_DEPRECATED_UsersGetFriends_0(v33, v66, l_UserSorts_0.StatusFrequents):andThen(function(v67) --[[ Line: 193 ]]
                    -- upvalues: v16 (ref), l_UserModel_0 (ref), v44 (ref), l_UpdateUsers_0 (ref), v39 (ref)
                    local l_responseBody_0 = v67.responseBody;
                    local v69 = {};
                    local v70 = {};
                    for v71, v72 in pairs(l_responseBody_0.data) do
                        local v73 = tostring(v72.id);
                        v72.isFriend = true;
                        v72.friendRank = v71;
                        if v16 then
                            v72.name = "";
                            v72.displayName = "";
                        end;
                        local v74 = l_UserModel_0.fromDataTable(v72);
                        table.insert(v69, v73);
                        v70[v74.id] = v74;
                    end;
                    v44(l_UpdateUsers_0(v70));
                    v39(v69);
                    return v69;
                end):andThen(function(v75) --[[ Line: 215 ]]
                    -- upvalues: v44 (ref), l_PreloadUsersThumbnail_0 (ref), v31 (ref), l_ApiFetchUsersPresences_0 (ref), v33 (ref)
                    v44(l_PreloadUsersThumbnail_0(v75, v31.ThumbnailRequest.InviteToGame, nil));
                    return v44(l_ApiFetchUsersPresences_0(v33, v75));
                end):andThen(function() --[[ Line: 223 ]]
                    -- upvalues: v35 (ref)
                    v35(false);
                end):catch(function() --[[ Line: 226 ]]
                    -- upvalues: v35 (ref), v37 (ref)
                    v35(false);
                    v37(true);
                    return {};
                end);
                return;
            else
                l_DEPRECATED_UsersGetFriends_0(v33, v66, l_UserSorts_0.StatusFrequents):andThen(function(v76) --[[ Line: 233 ]]
                    -- upvalues: v16 (ref), l_UserModel_0 (ref), v44 (ref), l_UpdateUsers_0 (ref), v39 (ref)
                    local l_responseBody_1 = v76.responseBody;
                    local v78 = {};
                    local v79 = {};
                    for v80, v81 in pairs(l_responseBody_1.data) do
                        local v82 = tostring(v81.id);
                        v81.isFriend = true;
                        v81.friendRank = v80;
                        if v16 then
                            v81.name = "";
                            v81.displayName = "";
                        end;
                        local v83 = l_UserModel_0.fromDataTable(v81);
                        table.insert(v78, v82);
                        v79[v83.id] = v83;
                    end;
                    v44(l_UpdateUsers_0(v79));
                    v39(v78);
                    return v78;
                end, function(_) --[[ Line: 255 ]]
                    -- upvalues: v35 (ref), v37 (ref)
                    v35(false);
                    v37(true);
                    return {};
                end):andThen(function(v85) --[[ Line: 261 ]]
                    -- upvalues: v44 (ref), l_PreloadUsersThumbnail_0 (ref), v31 (ref), l_ApiFetchUsersPresences_0 (ref), v33 (ref)
                    v44(l_PreloadUsersThumbnail_0(v85, v31.ThumbnailRequest.InviteToGame, nil));
                    return v44(l_ApiFetchUsersPresences_0(v33, v85));
                end):andThen(function(_) --[[ Line: 269 ]]
                    -- upvalues: v35 (ref)
                    v35(false);
                end, function(_) --[[ Line: 271 ]]
                    -- upvalues: v35 (ref), v37 (ref)
                    v35(false);
                    v37(true);
                end);
            end;
        end;
    end, {});
    local v89 = l_useSelector_0(function(v88) --[[ Line: 279 ]]
        return v88.Users;
    end);
    v8.useEffect(function() --[[ Line: 283 ]]
        -- upvalues: v34 (copy), v43 (copy), v28 (ref), v89 (copy), v59 (copy), v45 (ref), v12 (ref), v16 (ref), l_sortFriendsByCorrectedPresenceAndRank_0 (ref)
        if v34 then
            v43(v28(7));
            return;
        else
            local v90 = {};
            for _, v92 in pairs(v89) do
                if v59(v92) then
                    v90[#v90 + 1] = v92;
                    local v93 = nil;
                    if v45 and v45.data then
                        v93 = v12.Selectors.getCombinedNameFromId(v45.data, v92.id);
                    end;
                    v92.displayName = if v93 == nil then v92.displayName else v93;
                    if v16 then
                        v93 = nil;
                        if v45 and v45.data then
                            v93 = v12.Selectors.getUsernameFromId(v45.data, v92.id);
                        end;
                        v92.name = if v93 == nil then v92.name else v93;
                    end;
                end;
            end;
            table.sort(v90, l_sortFriendsByCorrectedPresenceAndRank_0);
            v43(v90);
            return;
        end;
    end, {
        v89, 
        v40, 
        tostring(v34), 
        (tostring(v45 and v45.loading))
    });
    return v8.createElement(v27.Provider, {
        value = {
            friends = v42, 
            hasFriends = #v38 > 0, 
            isFetchingFriends = v34 or v32.isLoadingCustomParams, 
            isFriendsListFetchFailed = v36, 
            friendsNames = {
                loading = v45 and v45.loading
            }, 
            searchFriends = v41, 
            searchFriendsString = v40
        }
    }, v32.children);
end;