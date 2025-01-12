local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_AddFriends_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Dash_0 = v3.Dash;
local l_Contexts_0 = v3.SocialLuaAnalytics.Analytics.Enums.Contexts;
local l_UIBlox_0 = v3.UIBlox;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withLocalization_0 = v3.withLocalization;
local v14 = nil;
v14 = if v3.GetFFlagEnableAppCommonInputHooks() then v3.FocusNavigationUtils.useLastInputMode else v3.ReactFocusNavigation.useLastInputMode;
local l_FriendshipOriginSourceType_0 = v3.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v16 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v17 = require(l_script_FirstAncestor_0.Common.Constants);
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local v19 = require(script.mapStateToProps);
local v20 = require(script.getOverlayButtons);
local v21 = require(script.getFooterRelevanceInfo);
local v22 = require(script.useAddFriendsTileFocusNavigationBindings);
local v23 = require(script.useFriendRequestHandlers);
local v24 = require(l_Parent_0.UserProfiles);
local _ = require(l_Parent_0.PlayerContextualMenu);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsTileUseUserProfile);
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local l_RecommendationContextType_0 = (if require(l_Parent_0.SharedFlags).FFlagAddFriendsSeparateReducers then require(l_AddFriends_0.Redux.RoduxFriends) else v3.RoduxFriends).Enums.RecommendationContextType;
local function v33() --[[ Line: 62 ]]
    return nil;
end;
local v34 = l_Roact_0.PureComponent:extend("AddFriendsTile");
v34.validateProps = l_t_0.strictInterface({
    localUserId = l_t_0.string, 
    amIFollowingUser = l_t_0.optional(l_t_0.boolean), 
    isUserFollowingMe = l_t_0.optional(l_t_0.boolean), 
    sentFromExperienceName = l_t_0.optional(l_t_0.string), 
    friendStatus = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    user = l_t_0.table, 
    layoutOrder = l_t_0.integer, 
    size = l_t_0.Vector2, 
    isFriendRequest = l_t_0.optional(l_t_0.boolean), 
    isRecommendation = l_t_0.optional(l_t_0.boolean), 
    hasIncomingFriendRequest = l_t_0.boolean, 
    handleNavigateDownToViewUserProfile = l_t_0.optional(l_t_0.callback), 
    handleRequestFriendship = l_t_0.optional(l_t_0.callback), 
    handleAcceptFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleDeclineFriendRequest = l_t_0.optional(l_t_0.callback), 
    openPlayerContextualMenu = l_t_0.optional(l_t_0.callback), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean), 
    screenSize = l_t_0.Vector2, 
    originSourceType = l_t_0.optional(l_t_0.string), 
    contactImporterWarningSeen = l_t_0.optional(l_t_0.callback), 
    showTooltip = l_t_0.optional(l_t_0.boolean), 
    tooltipShown = l_t_0.optional(l_t_0.callback), 
    navigation = l_t_0.optional(l_t_0.table), 
    position = l_t_0.integer, 
    eventHandlerMapRef = l_t_0.optional(l_t_0.callback), 
    selected = l_t_0.optional(l_t_0.boolean), 
    focusGuiObject = l_t_0.optional(l_t_0.callback), 
    lastInputMode = l_t_0.string, 
    friendRequestNicknamesEnabled = l_t_0.optional(l_t_0.boolean)
});
v34.defaultProps = {
    isFriendRequest = false, 
    isPlayerContextualMenuEnabled = false, 
    handleNavigateDownToViewUserProfile = v33, 
    handleRequestFriendship = v33, 
    handleAcceptFriendRequest = v33, 
    handleDeclineFriendRequest = v33, 
    lastInputMode = "Cursor"
};
v34.init = function(v35) --[[ Line: 122 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_RecommendationContextType_0 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_Dash_0 (copy), v17 (copy), l_Contexts_0 (copy)
    v35.state = {
        showTooltip = v35.props.showTooltip
    };
    v35.isMounted = false;
    v35.addFriendsTileRef = l_Roact_0.createRef();
    v35.onActivated = function(_, _, v38, v39) --[[ Line: 130 ]]
        -- upvalues: v35 (copy)
        if v35.props.isPlayerContextualMenuEnabled then
            local l_user_0 = v35.props.user;
            return v35.openPlayerContextualMenu(l_user_0);
        else
            return v35.openPlayerProfile({
                profilePeekViewProps = {
                    contextualInfoDisplay = v38, 
                    contextualInfoType = v39
                }
            });
        end;
    end;
    v35.openPlayerContextualMenu = function(v41) --[[ Line: 149 ]]
        -- upvalues: v35 (copy), l_FFlagFriendRequestNicknames_0 (ref), l_convertUserPresenceTypeToString_0 (ref), l_FriendshipOriginSourceType_0 (ref)
        return function() --[[ Line: 150 ]]
            -- upvalues: v35 (ref), v41 (copy), l_FFlagFriendRequestNicknames_0 (ref), l_convertUserPresenceTypeToString_0 (ref), l_FriendshipOriginSourceType_0 (ref)
            if not v35.isMounted then
                return;
            else
                local v42 = if v35.props.isRecommendation then v35.props.friendStatus or Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived;
                v35.props.openPlayerContextualMenu({
                    subjectUserId = v41.id, 
                    profileUserNickname = if l_FFlagFriendRequestNicknames_0 and v35.props.friendRequestNicknamesEnabled and v41.senderNickname then v41.senderNickname else nil, 
                    contactId = v41.entityId, 
                    contactName = v41.entityDisplayName, 
                    recommendationContext = v35.props.user.contextType, 
                    mutualFriendsCount = v41.mutualFriendsCount, 
                    robloxFriendshipStatus = v42, 
                    subjectPresence = {
                        locationString = v41.lastLocation, 
                        locationPlaceId = v41.placeId, 
                        locationRootPlaceId = v41.rootPlaceId, 
                        locationUniverseId = v41.universeId, 
                        status = l_convertUserPresenceTypeToString_0(v41.userPresenceType)
                    }, 
                    friendshipOriginSourceType = if v35.props.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
                });
                return;
            end;
        end;
    end;
    v35.openPlayerProfile = function(v43) --[[ Line: 185 ]]
        -- upvalues: v35 (copy), l_RecommendationContextType_0 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_Dash_0 (ref), l_FFlagFriendRequestNicknames_0 (ref), v17 (ref), l_Contexts_0 (ref)
        return function() --[[ Line: 191 ]]
            -- upvalues: v35 (ref), l_RecommendationContextType_0 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_Dash_0 (ref), v43 (copy), l_FFlagFriendRequestNicknames_0 (ref), v17 (ref), l_Contexts_0 (ref)
            if not v35.isMounted then
                return;
            else
                local v44 = v35.props.user.contextType and v35.props.user.contextType == l_RecommendationContextType_0.Contacts;
                local v45 = nil;
                if l_FFlagAddFriendsMigrateAnalytics_0 then
                    v45 = l_Dash_0.join(v43.profilePeekViewProps, {
                        absolutePosition = v35.props.position, 
                        rank = v35.props.user.rank, 
                        isRecommendation = v35.props.isRecommendation, 
                        isContact = v44, 
                        profileType = v44 and "FromContacts" or nil, 
                        contactProps = if v44 then {
                            contactId = v35.props.user.entityId, 
                            contactname = v35.props.user.entityDisplayName, 
                            avatarImageUrl = v35.props.user.thumbnailEntities.avatarImageUrl
                        } else nil, 
                        profileUserNickname = if l_FFlagFriendRequestNicknames_0 and v35.props.friendRequestNicknamesEnabled then v35.props.user.senderNickname else nil, 
                        friendStatus = v35.props.friendStatus, 
                        source = if v35.props.isRecommendation then v17.AddFriendsPYMKSourceName else l_Contexts_0.AddFriends
                    });
                else
                    v45 = l_Dash_0.join(v43.profilePeekViewProps, {
                        absolutePosition = v35.props.position, 
                        source = l_Contexts_0.AddFriends
                    });
                    if v35.props.isRecommendation then
                        v45 = l_Dash_0.join(v45, {
                            isRecommendation = v35.props.isRecommendation, 
                            rank = v35.props.user.rank, 
                            source = v17.AddFriendsPYMKSourceName, 
                            contactProps = if v44 then {
                                contactId = v35.props.user.entityId, 
                                contactname = v35.props.user.entityDisplayName, 
                                avatarImageUrl = v35.props.user.thumbnailEntities.avatarImageUrl
                            } else nil, 
                            profileType = v44 and "FromContacts" or nil
                        });
                    elseif l_FFlagFriendRequestNicknames_0 and v35.props.friendRequestNicknamesEnabled then
                        v45 = l_Dash_0.join(v45, {
                            profileUserNickname = v35.props.user.senderNickname
                        });
                    end;
                end;
                v35.props.handleNavigateDownToViewUserProfile(v35.props.user.id, {
                    profilePeekViewProps = v45
                });
                return;
            end;
        end;
    end;
    v35.hideTooltip = function() --[[ Line: 256 ]]
        -- upvalues: v35 (copy)
        v35.props.contactImporterWarningSeen();
        v35:setState({
            showTooltip = false
        });
    end;
    v35.checkAndSetSelected = function() --[[ Line: 263 ]]
        -- upvalues: v35 (copy)
        if v35.props.selected and v35.props.focusGuiObject then
            local v46 = v35.addFriendsTileRef:getValue();
            if v46 then
                v35.props.focusGuiObject(v46);
            end;
        end;
    end;
end;
v34.render = function(v47) --[[ Line: 273 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v16 (copy), v21 (copy), l_RecommendationContextType_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_Roact_0 (copy), l_PlayerTile_0 (copy), v20 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_size_0 = v47.props.size;
    local l_user_1 = v47.props.user;
    return l_withStyle_0(function(v50) --[[ Line: 277 ]]
        -- upvalues: l_withLocalization_0 (ref), l_user_1 (copy), v47 (copy), v16 (ref), v21 (ref), l_RecommendationContextType_0 (ref), l_FFlagFriendRequestNicknames_0 (ref), l_Roact_0 (ref), l_size_0 (copy), l_PlayerTile_0 (ref), v20 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
        return l_withLocalization_0({
            mutualFriendsText = l_user_1.mutualFriends and #l_user_1.mutualFriends == 1 and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualFriends", 
            sentFromWithContextText = {
                "Feature.Friends.Label.SentFromWithContext"; 
                gameName = v47.props.sentFromExperienceName or ""
            }, 
            youAreFollowingText = "Feature.Friends.Label.YouAreFollowing", 
            followsYouText = "Feature.Friends.Label.FollowsYou", 
            fromContactsText = "Feature.Friends.Description.FoundFromContactImporter", 
            contactNameText = if l_user_1.contactName then {
                "Feature.Friends.Description.FromContactsV2"; 
                contactName = l_user_1.contactName
            } else nil, 
            tooltipHeaderText = "Feature.Contacts.Heading.ContactsTooltip", 
            tooltipBodyText = "Feature.Contacts.Label.ContactsTooltip", 
            tooltipButtonText = "Feature.Avatar.Action.GotIt", 
            foundThroughQRCode = v16.PROFILE_QR_CODE_TILE_FOOTER, 
            friendRequests = v16.FRIEND_REQUEST, 
            mutualFriends = v16.MUTUAL_FRIENDS, 
            singularMutualFriend = v16.MUTUAL_FRIEND_SINGULAR, 
            frequents = v16.FREQUENTS, 
            fromContacts = v16.FROM_CONTACTS
        })(function(v51) --[[ Line: 304 ]]
            -- upvalues: v21 (ref), l_user_1 (ref), v47 (ref), v50 (copy), l_RecommendationContextType_0 (ref), l_FFlagFriendRequestNicknames_0 (ref), l_Roact_0 (ref), l_size_0 (ref), l_PlayerTile_0 (ref), v20 (ref), l_FFlagAddFriendsMigrateAnalytics_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
            local v52, v53 = v21({
                mutualFriends = l_user_1.mutualFriends, 
                isUserFollowingMe = v47.props.isUserFollowingMe, 
                amIFollowingUser = v47.props.amIFollowingUser, 
                sentFromExperienceName = v47.props.sentFromExperienceName, 
                isFriendRequest = v47.props.isFriendRequest, 
                isRecommendation = v47.props.isRecommendation, 
                friendStatus = v47.props.friendStatus, 
                userPresenceType = l_user_1.userPresenceType, 
                lastLocation = l_user_1.lastLocation, 
                originSourceType = v47.props.originSourceType, 
                contextType = l_user_1.contextType, 
                mutualFriendsCount = l_user_1.mutualFriendsCount, 
                hasIncomingFriendRequest = v47.props.hasIncomingFriendRequest
            }, v50, v51);
            local v54 = if v47.props.isRecommendation and v52 and v52.text then {
                text = v52.text, 
                icon = v52.icon
            } else nil;
            if v47.props.isPlayerContextualMenuEnabled then
                v54 = {
                    text = if v52 then v52.text else nil, 
                    icon = if v52 then v52.icon else nil
                };
            end;
            local v55 = nil;
            local v56 = nil;
            local v57 = nil;
            local v58 = l_user_1.contextType and l_user_1.contextType == l_RecommendationContextType_0.Contacts;
            if v58 then
                v55 = l_user_1.entityDisplayName;
                v56 = nil;
                v57 = l_user_1.thumbnailEntities.avatarImageUrl;
            else
                v55 = if l_FFlagFriendRequestNicknames_0 and v47.props.friendRequestNicknamesEnabled and l_user_1.senderNickname and l_user_1.senderNickname ~= "" then l_user_1.senderNickname else l_user_1.displayName;
                v56 = "@" .. (l_user_1.externalAppDisplayName or l_user_1.username);
                v57 = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(l_user_1.id)));
            end;
            return l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                Size = UDim2.new(0, l_size_0.X, 0, l_size_0.Y), 
                BackgroundTransparency = 1, 
                ZIndex = 1, 
                [l_Roact_0.Ref] = v47.props.eventHandlerMapRef
            }, {
                PlayerTile = l_Roact_0.createElement(l_PlayerTile_0, {
                    thumbnail = v57, 
                    title = v55, 
                    tileSize = UDim2.new(0, l_size_0.X, 0, l_size_0.Y), 
                    subtitle = v56, 
                    buttons = if v47.props.lastInputMode == "Focus" then nil else v20({
                        playerId = l_user_1.id, 
                        position = v47.props.position, 
                        isFriendRequest = v47.props.isFriendRequest, 
                        friendStatus = v47.props.friendStatus, 
                        networking = v47.props.networking, 
                        rank = l_user_1.rank, 
                        handleRequestFriendship = v47.props.handleRequestFriendship, 
                        handleAcceptFriendRequest = v47.props.handleAcceptFriendRequest, 
                        handleDeclineFriendRequest = v47.props.handleDeclineFriendRequest, 
                        hasIncomingFriendRequest = v47.props.hasIncomingFriendRequest, 
                        contextType = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else if l_user_1.contextType then l_user_1.contextType.rawValue() else nil, 
                        isContact = if l_FFlagAddFriendsMigrateAnalytics_0 then v58 else nil, 
                        contextualInfoType = if l_FFlagAddFriendsMigrateAnalytics_0 then v53 else nil
                    }), 
                    relevancyInfo = v52, 
                    onActivated = v47.onActivated(v55, v56, v54, v53), 
                    forwardedRef = v47.addFriendsTileRef, 
                    Selectable = true, 
                    openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
                })
            });
        end);
    end);
end;
v34.didUpdate = function(v59) --[[ Line: 405 ]] --[[ Name: didUpdate ]]
    if v59.state.showTooltip and not v59.props.navigation.isFocused() then
        v59:setState({
            showTooltip = false
        });
    end;
end;
v34.didMount = function(v60) --[[ Line: 413 ]] --[[ Name: didMount ]]
    v60.isMounted = true;
    v60.checkAndSetSelected();
end;
v34.willUnmount = function(v61) --[[ Line: 419 ]] --[[ Name: willUnmount ]]
    v61.isMounted = false;
end;
v34 = l_RoactRodux_0.connect(v19, nil)(v34);
return function(v62) --[[ Line: 425 ]] --[[ Name: AddFriendsTileContainer ]]
    -- upvalues: l_useSelector_0 (copy), v19 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_useAppPolicy_0 (copy), v27 (copy), l_RecommendationContextType_0 (copy), v24 (copy), l_Dash_0 (copy), v23 (copy), v22 (copy), v14 (ref), l_Roact_0 (copy), v34 (ref)
    local v64 = l_useSelector_0(function(v63) --[[ Line: 426 ]]
        -- upvalues: v19 (ref), v62 (copy)
        return v19(v63, v62);
    end);
    local v66 = if l_FFlagFriendRequestNicknames_0 then l_useAppPolicy_0(function(v65) --[[ Line: 431 ]]
        return v65.getFriendRequestNicknamesEnabled();
    end) else false;
    local v67 = nil;
    local v68 = nil;
    if v27 then
        local v69 = {
            data = nil
        };
        if v62.user.contextType ~= l_RecommendationContextType_0.Contacts then
            v69 = v24.Hooks.useUserProfilesFetch({
                userIds = {
                    v62.user.id
                }, 
                query = v24.Queries.userProfilesCombinedNameAndUsernameByUserIds
            });
        end;
        v67 = l_Dash_0.join(v62.user, {});
        v67.displayName = "";
        v67.username = "";
        if v69.data then
            v67.displayName = v24.Selectors.getCombinedNameFromId(v69.data, v67.id) or "";
            v67.username = v24.Selectors.getUsernameFromId(v69.data, v67.id) or "";
        end;
    else
        v68 = v62.user;
    end;
    local v70 = v23({
        playerId = if v27 then v67.id else v68.id, 
        position = v62.position, 
        isFriendRequest = v62.isFriendRequest, 
        friendStatus = v62.friendStatus, 
        networking = v62.networking, 
        rank = if v27 then v67.rank else v68.rank, 
        handleRequestFriendship = v62.handleRequestFriendship, 
        handleAcceptFriendRequest = v62.handleAcceptFriendRequest, 
        handleDeclineFriendRequest = v62.handleDeclineFriendRequest, 
        hasIncomingFriendRequest = v62.hasIncomingFriendRequest, 
        contextType = if v27 then if v67.contextType then v67.contextType.rawValue() else nil else if v68.contextType then v68.contextType.rawValue() else nil
    });
    local l_v22_0 = v22;
    local l_v70_0 = v70;
    local v73 = true;
    if v64.friendStatus ~= Enum.FriendStatus.FriendRequestReceived then
        v73 = false;
    end;
    l_v22_0 = l_v22_0(l_v70_0, v73);
    l_v70_0 = v14();
    return l_Roact_0.createElement(v34, l_Dash_0.join(v62, {
        eventHandlerMapRef = l_v22_0, 
        lastInputMode = l_v70_0, 
        friendRequestNicknamesEnabled = v66, 
        user = if v27 then v67 else nil
    }));
end;