local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v8 = require(l_Parent_1.UserProfiles);
local _ = require(l_Parent_0.Common.LocalTypes);
local v10 = require(l_Parent_0.Utils.isUserInGame);
local v11 = require(l_Parent_0.Common.TextKeys);
local v12 = require(l_Parent_0.Analytics.UILoadingEvents);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local l_PresenceType_1 = require(l_Parent_1.GraphQLServer).types.PresenceType;
local v16 = require(l_Parent_0.Components.UserTileCircular);
local l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 = require(l_Parent_1.SharedFlags).FFlagFriendsCarouselPaginatedFriendsEnabled;
local v18 = require(l_Parent_0.Flags.FFlagFriendsCarouselSmallerUIExperiment);
local v19 = require(l_Parent_0.Flags.FFlagFriendsCarouselNewPresenceUIEnabledForAll);
local v20 = {
    tileSize = 100, 
    tileInfoHeight = 0
};
local _ = function(v21) --[[ Line: 60 ]]
    -- upvalues: l_PresenceType_1 (copy), l_PresenceType_0 (copy)
    local _ = nil;
    local _ = nil;
    local _ = nil;
    if v21.__typename == "Friend" then
        local v25 = v21.presence or {};
        return v25.userPresenceType, l_PresenceType_1, v25.lastLocation;
    else
        return v21.userPresenceType, l_PresenceType_0, v21.lastLocation;
    end;
end;
local function _(v27) --[[ Line: 76 ]]
    -- upvalues: l_PresenceType_1 (copy), l_PresenceType_0 (copy)
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    if v27.__typename == "Friend" then
        local v31 = v27.presence or {};
        v28 = v31.userPresenceType;
        v29 = l_PresenceType_1;
        v30 = v31.lastLocation;
    else
        v28 = v27.userPresenceType;
        v29 = l_PresenceType_0;
        v30 = v27.lastLocation;
    end;
    local l_v28_0 = v28;
    local l_v29_0 = v29;
    local l_v30_0 = v30;
    return if l_v30_0 then l_v30_0 ~= "" and if v27.isFriendWithUser then not (l_v28_0 ~= l_v29_0.InStudio) or l_v28_0 == l_v29_0.InGame else false else false, l_v30_0;
end;
local function _(v36) --[[ Line: 87 ]]
    -- upvalues: l_PresenceType_0 (copy)
    local v37 = false;
    if v36.userPresenceType == l_PresenceType_0.InStudio then
        v37 = v36.lastLocation and v36.lastLocation ~= "";
    end;
    return v37;
end;
local function v46(v39) --[[ Line: 91 ]]
    -- upvalues: l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 (copy), l_PresenceType_1 (copy), l_PresenceType_0 (copy)
    if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then
        local v40 = nil;
        local v41 = nil;
        local v42 = nil;
        if v39.__typename == "Friend" then
            local v43 = v39.presence or {};
            v40 = v43.userPresenceType;
            v41 = l_PresenceType_1;
            v42 = v43.lastLocation;
        else
            v40 = v39.userPresenceType;
            v41 = l_PresenceType_0;
            v42 = v39.lastLocation;
        end;
        local l_v40_0 = v40;
        local l_v41_0 = v41;
        return v39.isFriendWithUser and (l_v40_0 == l_v41_0.Online or l_v40_0 == l_v41_0.InStudio or l_v40_0 == l_v41_0.InGame) or false;
    else
        return v39.isFriendWithUser and v39.userPresenceType and (v39.userPresenceType == l_PresenceType_0.Online or v39.userPresenceType == l_PresenceType_0.InStudio or v39.userPresenceType == l_PresenceType_0.InGame) or false;
    end;
end;
local function v62(v47) --[[ Line: 105 ]]
    -- upvalues: v11 (copy), l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 (copy), l_PresenceType_1 (copy), l_PresenceType_0 (copy), v10 (copy), l_useLocalization_0 (copy)
    local v48 = false;
    local v49 = nil;
    local v50 = nil;
    if v47.hasIncomingFriendRequest and not v47.isFriendWithUser then
        v50 = v11.FriendRequestContext;
    elseif not v47.isFriendWithUser then
        v50 = v11.SuggestedContext;
    elseif l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        if v47.__typename == "Friend" then
            local v54 = v47.presence or {};
            v51 = v54.userPresenceType;
            v52 = l_PresenceType_1;
            v53 = v54.lastLocation;
        else
            v51 = v47.userPresenceType;
            v52 = l_PresenceType_0;
            v53 = v47.lastLocation;
        end;
        local l_v51_0 = v51;
        local l_v52_0 = v52;
        local l_v53_0 = v53;
        local v58 = if l_v53_0 then l_v53_0 ~= "" and if v47.isFriendWithUser then not (l_v51_0 ~= l_v52_0.InStudio) or l_v51_0 == l_v52_0.InGame else false else false;
        local l_l_v53_0_0 = l_v53_0;
        v49 = if v58 then l_l_v53_0_0 else nil;
    else
        if not v10(v47) then
            local v60 = false;
            if v47.userPresenceType == l_PresenceType_0.InStudio then
                v60 = v47.lastLocation and v47.lastLocation ~= "";
            end;
            if not v60 then
                v49 = nil;
                v48 = true;
            end;
        end;
        if not v48 then
            v49 = v47.lastLocation;
        end;
    end;
    v48 = false;
    local v61 = l_useLocalization_0({
        text = v50
    });
    return v49 or v61.text;
end;
return function(v63) --[[ Line: 128 ]]
    -- upvalues: l_llama_0 (copy), v20 (copy), v3 (copy), v12 (copy), v8 (copy), l_RecommendationContextType_0 (copy), v46 (copy), v62 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Roact_0 (copy), v16 (copy), v18 (copy), v19 (copy)
    local v64 = l_llama_0.Dictionary.join(v20, v63 or {});
    v3.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v64 (copy), v12 (ref)
        if v64.reportRender then
            v64.reportRender((("%*%*"):format(v12.CarouselFriend, if v64.user.__typename == "Friend" then v12.ExperimentSuffix else "")));
            if v64.user.userPresenceType then
                v64.reportRender((("%*"):format(v12.CarouselPresence)));
                return;
            elseif v64.user.presence and v64.user.presence.userPresenceType then
                v64.reportRender((("%*%*"):format(v12.CarouselPresence, v12.ExperimentSuffix)));
            end;
        end;
    end, {
        v64.user.__typename, 
        v64.user.userPresenceType, 
        v64.user.presence
    });
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    v65 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            v64.user.id
        }, 
        query = v8.Queries.userProfilesCombinedAndPlatformByUserIds
    });
    v67 = false;
    local v69 = v64.user.contextType == l_RecommendationContextType_0.Contacts;
    if not v69 or v64.user.entityDisplayName == nil then
        v67 = v65.loading or v65.error;
    end;
    v66 = if v65.data then v8.Selectors.getCombinedNameFromId(v65.data, v64.user.id) else nil;
    v68 = if v65.data then v8.Selectors.getPlatformNameFromId(v65.data, v64.user.id) else nil;
    local v70 = v46(v64.user);
    local v71 = v62(v64.user);
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    if v69 then
        v72 = if v64.user.thumbnailEntities then v64.user.thumbnailEntities.headshotImageUrl else nil;
        v73 = v64.user.entityDisplayName;
    else
        v72 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v64.user.id);
        v73 = v66;
        v74 = ("@%*"):format(v64.user.username);
    end;
    local function v76(v75) --[[ Line: 183 ]]
        -- upvalues: v64 (copy), v73 (ref), v74 (ref), v71 (copy)
        v64.onActivated(v64.user, {
            headerTitle = v73, 
            headerSubtitle = v74, 
            contextText = v71, 
            absolutePosition = v64.absoluteIndex, 
            positionIndex = v64.layoutOrder, 
            anchorSpaceSize = Vector2.new(v64.tileSize, v64.tileSize + v64.tileInfoHeight), 
            anchorSpacePosition = v75.current.AbsolutePosition, 
            onOpen = function() --[[ Line: 192 ]] --[[ Name: onOpen ]]
                -- upvalues: v64 (ref)
                v64.setListFrozen(true);
            end, 
            onClose = function() --[[ Line: 195 ]] --[[ Name: onClose ]]
                -- upvalues: v64 (ref)
                v64.setListFrozen(false);
            end
        });
    end;
    local v77 = v68 and v68 ~= "" and v64.user.isFriendWithUser == false;
    return l_Roact_0.createElement(v16, {
        username = if v77 then v68 else v73, 
        shouldShimmerName = v67, 
        thumbnail = v72, 
        contextualText = v71, 
        showOnlineIndicator = v70, 
        showVendorIcon = v77, 
        layoutOrder = v64.layoutOrder, 
        onActivated = v76, 
        isContextualTextMuted = true, 
        tileSize = v64.tileSize, 
        infoHeight = v64.tileInfoHeight, 
        showNewPresenceIndicator = if not v18 or v19 then nil else v64.showNewPresenceIndicator
    });
end;