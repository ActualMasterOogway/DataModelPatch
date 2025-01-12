local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.PlayerContextualMenu);
local v5 = require(l_Parent_0.Cryo);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v7 = require(l_Parent_0.RoactAppExperiment);
local v8 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactRodux_0 = v8.RoactRodux;
local v10 = require(script.Parent.Carousel);
local v11 = require(script.Parent.carouselMapStateToProps);
local v12 = require(script.Parent.carouselMapDispatchToProps);
local v13 = require(l_script_FirstAncestor_0.Components.PaginatedCarousel.PaginatedCarouselWrapper);
local _ = require(l_script_FirstAncestor_0.Components.PaginatedCarousel.useCarouselList);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local l_Dictionary_0 = v8.llama.Dictionary;
local l_useUiModeInfo_0 = v8.Hooks.useUiModeInfo;
local l_UiMode_0 = v8.RobloxAppEnums.UiMode;
local l_AnalyticsService_0 = v8.AnalyticsService;
local v21 = require(l_script_FirstAncestor_0.Analytics);
local l_setupFireEvent_0 = v21.setupFireEvent;
local l_EventNames_0 = v21.EventNames;
local v24 = require(l_Parent_0.SocialCommon);
local l_getRecommendationContextualInfoType_0 = v24.Utils.getRecommendationContextualInfoType;
local l_convertUserPresenceTypeToString_0 = v24.Utils.convertUserPresenceTypeToString;
local v27 = require(l_script_FirstAncestor_0.Utils.friendshipStatusToEnum);
local l_NetworkingFriendsEnums_0 = v8.NetworkingFriendsEnums;
local l_RecommendationContextType_0 = v8.RoduxFriends.Enums.RecommendationContextType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v32 = game:DefineFastFlag("FriendsCarouselPlayerContextualMenuEntrypoint", false);
local l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselPaginatedFriendsEnabled;
local l_FFlagLuaAppPropagateFriendsCarouselHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader;
local l_FFlagPaginatedFriendsCarouselEnabledForAll_0 = require(l_Parent_0.SharedFlags).FFlagPaginatedFriendsCarouselEnabledForAll;
local l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselRemoveCiUpsellExperiment;
local l_FFlagFriendsCarouselRemoveCiUpsellEnabledForAll_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselRemoveCiUpsellEnabledForAll;
local l_FFlagFriendsCarouselFixExperienceName_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselFixExperienceName;
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselSmallerUIExperiment);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselSmallerUIEnabledForAll);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselNewPresenceUIEnabledForAll);
local v42 = {
    analyticsService = l_AnalyticsService_0
};
local function v79(v43) --[[ Line: 125 ]] --[[ Name: CarouselContainer ]]
    -- upvalues: l_Dictionary_0 (copy), v42 (copy), l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 (copy), v7 (copy), l_AppUserLayers_0 (copy), v39 (copy), v40 (copy), v41 (copy), v3 (copy), l_setupFireEvent_0 (copy), l_EventNames_0 (copy), l_useUiModeInfo_0 (copy), v8 (copy), v4 (copy), l_UiMode_0 (copy), v32 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (copy), l_convertUserPresenceTypeToString_0 (copy), v27 (copy), l_NetworkingFriendsEnums_0 (copy), l_RecommendationContextType_0 (copy), l_FFlagFriendsCarouselFixExperienceName_0 (copy), v5 (copy), v16 (copy), l_getRecommendationContextualInfoType_0 (copy), l_IXPService_0 (copy), l_FFlagFriendsCarouselRemoveCiUpsellEnabledForAll_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v21 (copy), v10 (copy), l_FFlagLuaAppPropagateFriendsCarouselHeader_0 (copy), l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 (copy)
    local v44 = l_Dictionary_0.join(v42, v43);
    local v46 = if l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 then v7.useUserExperiment({
        l_AppUserLayers_0.SocialFriendsCarouselAddFriendsEntryLayer
    }, function(v45) --[[ Line: 131 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v45[l_AppUserLayers_0.SocialFriendsCarouselAddFriendsEntryLayer] or {}).friendsCarouselRemoveCiUpsell;
    end, false) else nil;
    local v47 = nil;
    local v48 = nil;
    if v39 then
        local v52, v53 = v7.useUserExperiment({
            l_AppUserLayers_0.PlayerAppHomePageUXLayer
        }, function(v49) --[[ Line: 143 ]]
            -- upvalues: l_AppUserLayers_0 (ref), v40 (ref), v41 (ref)
            local v50 = v49[l_AppUserLayers_0.PlayerAppHomePageUXLayer] or {};
            local v51 = if v40 then nil else v50.friendsCarouselSmallerUI;
            if v41 then
                return v51, nil;
            else
                return v51, v50.showNewPresenceIndicator;
            end;
        end, false);
        v47 = v52;
        v48 = v53;
    end;
    local v54, v55 = v3.useState({});
    local l_eventIngestService_0 = v44.eventIngestService;
    local v57 = v3.useMemo(function() --[[ Line: 155 ]]
        -- upvalues: v44 (copy), l_eventIngestService_0 (copy)
        return {
            Diag = v44.diagService, 
            EventStream = l_eventIngestService_0
        };
    end, {
        v44.diagService, 
        l_eventIngestService_0
    });
    local v58 = v3.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: l_setupFireEvent_0 (ref), v44 (copy), v57 (copy)
        return l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v44.localUserId, 
                recommendationSessionId = v44.recommendationSessionId
            }, 
            analytics = v57
        });
    end, {
        v44.localUserId, 
        v44.recommendationSessionId
    });
    local v62 = v3.useCallback(function(v59, v60) --[[ Line: 172 ]]
        -- upvalues: v54 (copy), v58 (copy), l_EventNames_0 (ref), v55 (copy), l_Dictionary_0 (ref)
        if not v54[v59.id] then
            v58(l_EventNames_0.UserSeen, {
                presence = v59.userPresenceType or v59.presence and v59.presence.userPresenceType, 
                absolutePosition = v60.absolutePosition, 
                friendId = v59.id, 
                friendStatus = v59, 
                recommendationContextType = v59.contextType, 
                recommendationRank = v59.rank, 
                isRecommendation = v59.contextType and true or false, 
                userId = v59.id, 
                universeId = v59
            });
            v55(function(v61) --[[ Line: 186 ]]
                -- upvalues: l_Dictionary_0 (ref), v59 (copy)
                return {
                    seenUsers = l_Dictionary_0.join(v61, {
                        [v59.id] = true
                    })
                };
            end);
        end;
    end, {
        v54, 
        v58
    });
    local v63 = l_useUiModeInfo_0();
    local v64 = v8.Hooks.useDispatch();
    local v66 = v3.useCallback(function(v65) --[[ Line: 197 ]]
        -- upvalues: v64 (copy), v4 (ref)
        v64(v4.openPlayerContextualMenu(v65));
    end, {
        v44.openPlayerContextualMenu, 
        v64
    });
    local v73 = v3.useCallback(function(v67, v68) --[[ Line: 202 ]]
        -- upvalues: v58 (copy), l_EventNames_0 (ref), v63 (copy), l_UiMode_0 (ref), v32 (ref), v66 (copy), v44 (copy), l_FFlagPaginatedFriendsCarouselEnabledForAll_0 (ref), l_convertUserPresenceTypeToString_0 (ref), v27 (ref), l_NetworkingFriendsEnums_0 (ref), l_RecommendationContextType_0 (ref), l_FFlagFriendsCarouselFixExperienceName_0 (ref), v5 (ref), v16 (ref), l_getRecommendationContextualInfoType_0 (ref)
        v58(l_EventNames_0.UserPressed, {
            presence = v67.userPresenceType or v67.presence and v67.presence.userPresenceType, 
            absolutePosition = v68.absolutePosition, 
            friendId = v67.id, 
            friendStatus = v67, 
            recommendationContextType = v67.contextType, 
            recommendationRank = v67.rank, 
            isRecommendation = v67.contextType and true or false, 
            universeId = v67
        });
        if v63 and v63.uiMode == l_UiMode_0.TenFoot then
            local _ = nil;
            (if v32 then v66 else v44.openPlayerContextualMenu)({
                subjectUserId = v67.id, 
                subjectPresence = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then if v67.presence and v67.presence.userPresenceType then {
                    locationString = v67.presence.lastLocation, 
                    locationPlaceId = v67.presence.placeId, 
                    locationRootPlaceId = v67.presence.rootPlaceId, 
                    locationUniverseId = v67.presence.universeId, 
                    status = v67.presence.userPresenceType
                } else nil else if v67.userPresenceType then {
                    locationString = v67.lastLocation, 
                    locationPlaceId = v67.placeId, 
                    locationRootPlaceId = v67.rootPlaceId, 
                    locationUniverseId = v67.universeId, 
                    status = l_convertUserPresenceTypeToString_0(v67.userPresenceType)
                } else nil, 
                robloxFriendshipStatus = v27(v67), 
                friendshipOriginSourceType = l_NetworkingFriendsEnums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue()
            });
            return;
        else
            local v70 = v67.contextType == l_RecommendationContextType_0.Contacts;
            local l_v67_0 = v67;
            if l_FFlagFriendsCarouselFixExperienceName_0 then
                local v72 = if v67.presence then v67.presence.lastLocation else v67.userPresenceType and v67.lastLocation or nil;
                l_v67_0 = v5.Dictionary.union(v67, {
                    lastLocation = v72
                });
            end;
            v44.openProfilePeekView(v67.id, {
                openJoinable = true, 
                profilePeekViewProps = {
                    resetPeekView = true, 
                    absolutePosition = v68.absolutePosition, 
                    isHomePageCarousel = true, 
                    source = v16.HomepageFriendsCarouselSourceName, 
                    recommendationRank = v67.rank, 
                    isRecommendation = v67.contextType and true or false, 
                    mutualFriendsCount = v67.mutualFriendsList and #v67.mutualFriendsList or 0, 
                    recommendationSessionId = v44.recommendationSessionId, 
                    recommendationContextType = if v67.contextType then v67.contextType.rawValue() else nil, 
                    contextualInfoType = l_getRecommendationContextualInfoType_0(v67), 
                    contactProps = if v70 then {
                        contactId = v67.entityId, 
                        contactName = v67.entityDisplayName, 
                        avatarImageUrl = if v67.thumbnailEntities then v67.thumbnailEntities.avatarImageUrl else nil
                    } else nil, 
                    profileType = v70 and "FromContacts" or nil
                }, 
                contextualMenuProps = {
                    user = l_v67_0, 
                    absolutePosition = v68.absolutePosition, 
                    positionIndex = v68.positionIndex, 
                    anchorSpaceSize = v68.anchorSpaceSize, 
                    anchorSpacePosition = v68.anchorSpacePosition, 
                    onOpen = v68.onOpen, 
                    onClose = v68.onClose, 
                    source = v16.HomepageFriendsCarouselSourceName
                }
            });
            return;
        end;
    end, {
        v58, 
        v44.openProfilePeekView, 
        v44.recommendationSessionId
    });
    local v74 = v3.useCallback(function() --[[ Line: 304 ]]
        -- upvalues: l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v46 (copy), l_FFlagFriendsCarouselRemoveCiUpsellEnabledForAll_0 (ref), v64 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v44 (copy), v58 (copy), l_EventNames_0 (ref)
        if l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.SocialFriendsCarouselAddFriendsEntryLayer);
        end;
        if l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 and v46 or l_FFlagFriendsCarouselRemoveCiUpsellEnabledForAll_0 then
            v64(l_NavigateDown_0({
                name = l_AppPage_0.AddFriendsPage
            }));
        else
            v44.navigateFromAddFriends();
        end;
        v58(l_EventNames_0.ViewAddFriends, {
            friendCount = v44.friendCount, 
            recommendationLimit = true, 
            recommendationCount = v44.recommendationCount, 
            requestCount = v44.friendRequestCount, 
            showContactImporterModal = if l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 and v46 or l_FFlagFriendsCarouselRemoveCiUpsellEnabledForAll_0 then nil else v44.showContactImporter and true or false
        });
    end, {
        v58, 
        if l_FFlagFriendsCarouselRemoveCiUpsellExperiment_0 and v46 or l_FFlagFriendsCarouselRemoveCiUpsellEnabledForAll_0 then nil else v44.navigateFromAddFriends, 
        v44.friendCount, 
        v44.recommendationCount, 
        v44.friendRequestCount
    });
    local v76 = v3.useCallback(function() --[[ Line: 345 ]]
        -- upvalues: v58 (copy), l_EventNames_0 (ref), v44 (copy), l_AppPage_0 (ref), v64 (copy), l_NavigateDown_0 (ref)
        v58(l_EventNames_0.ViewAllFriends, {
            friendCount = v44.friendCount
        });
        local v75 = {
            navigateToFriendsLandingEventStart = {
                startPage = l_AppPage_0.Home, 
                startTime = os.clock()
            }
        };
        v64(l_NavigateDown_0({
            name = l_AppPage_0.ViewFriends, 
            extraProps = v75
        }));
    end, {
        v58, 
        v44.friendCount
    });
    local v77 = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then v3.useMemo(function() --[[ Line: 363 ]]
        -- upvalues: v5 (ref), v44 (copy)
        return v5.List.join(v44.onlineFriends or {}, v44.recommendationsList or {}, v44.offlineFriends or {});
    end, {
        v44.onlineFriends, 
        v44.recommendationsList, 
        v44.offlineFriends
    }) else nil;
    local v78 = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then v77 else v44.carouselList;
    return v3.createElement(v21.Context.Provider, {
        value = {
            fireEvent = v58
        }
    }, {
        carousel = v3.createElement(v10, {
            carousel = v44.carousel, 
            carouselProps = v44.carouselProps, 
            showToast = v44.showToast, 
            onSuccessfulRender = v44.onSuccessfulRender, 
            title = if l_FFlagLuaAppPropagateFriendsCarouselHeader_0 then v44.title else nil, 
            onSeeAllFriends = v76, 
            friendCount = v44.friendCount, 
            users = if l_FFlagPaginatedFriendsCarouselEnabledForAll_0 then v78 else if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 and v44.carouselList then v44.carouselList else v44.friendsAndRecList, 
            fetchNext = if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then v44.fetchMoreFriends else nil, 
            socialOnboardingBtns = v44.socialOnboardingBtns, 
            addFriendsBtn = v44.addFriendsBtn, 
            paginatedCarouselEnabled = v44.carouselList ~= nil, 
            friendRequestCount = v44.friendRequestCount, 
            fetchingStatus = v44.fetchingStatus, 
            userSeen = v62, 
            onFindFriendsTileActivated = v74, 
            onUserTileActivated = v73, 
            showNewBadge = false, 
            friendsCarouselSmallerUI = if not v39 or v40 then nil else v47, 
            showNewPresenceIndicator = if not v39 or v41 then nil else v48
        })
    });
end;
if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then
    v79 = v13(v79);
    return (l_RoactRodux_0.connect(v11, v12)(v79));
else
    return l_RoactRodux_0.connect(v11, v12)(v79);
end;