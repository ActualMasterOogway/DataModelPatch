local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UserProfiles);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v7 = require(l_Parent_0.RoactUtils);
local l_RoactRodux_0 = v7.Hooks.RoactRodux;
local v9 = require(l_Parent_0.RobloxAppHooks);
local v10 = require(l_Parent_0.RobloxAppEnums);
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_AppPage_0 = v10.AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_Parent_0.ToastRodux);
local v15 = require(l_Parent_0.DiscoveryAnalytics);
local v16 = require(l_Parent_0.Navigation);
local l_getCurrentRouteState_0 = v16.getCurrentRouteState;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local v20 = require(l_Parent_0.RobloxAppSessionization);
local v21 = require(l_Parent_0.Dash);
local l_SetGamePlaySession_0 = v20.SetGamePlaySession;
local l_SessionType_0 = v20.SessionType;
local v24 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local l_getFFlagAppChatPCMFixBlocking_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatPCMFixBlocking;
local l_RecommendationContextType_0 = require(l_Parent_0.FriendsRodux).config({
    keyPath = "PlayerContextualMenu.Friends"
}).Enums.RecommendationContextType;
local l_useRecommendationContextualInfoDisplay_0 = require(l_Parent_0.SocialCommon).Hooks.useRecommendationContextualInfoDisplay;
local _ = require(script.Parent.Types);
local v29 = require(script.Parent.getPresenceIcon);
local v30 = require(script.Parent.getPresenceText);
local v31 = require(l_Parent_0.UIBlox);
local l_Images_0 = v31.App.ImageSet.Images;
local l_Button_0 = v31.App.Button.Button;
local l_ButtonType_0 = v31.App.Button.Enum.ButtonType;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v36 = require(l_script_FirstAncestor_0.Analytics);
local l_setupFireEvent_0 = v36.setupFireEvent;
local l_EventNames_0 = v36.EventNames;
local l_AnalyticsService_0 = v36.AnalyticsService;
local v40 = require(l_script_FirstAncestor_0.Http.Friends);
local v41 = require(l_script_FirstAncestor_0.Http.Blocking);
local v42 = require(l_script_FirstAncestor_0.Components.PlayerContextualMenuComponent);
local v43 = require(script.Parent.HttpRequest.useHttpRequest);
local _ = require(l_Parent_0.FriendsNetworking).Enums;
local l_GetFFlagAddAdditionalButtonsProp_0 = require(l_Parent_0.SharedFlags).GetFFlagAddAdditionalButtonsProp;
local v46 = game:DefineFastString("PlayerContextualMenuVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local v47 = require(l_script_FirstAncestor_0.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled);
local v48 = game:DefineFastFlag("FFlagPCMAcceptWidthAsProp", false);
local v49 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil;
local v50 = game:DefineFastFlag("PlayerContextualMenuGameJoinAttribution", false);
game:DefineFastFlag("PCMRefactorExperienceCTARendering", false);
local function v51() --[[ Line: 98 ]] --[[ Name: NO_OPT_CALLBACK ]]

end;
local function v58(v52, v53, v54, v55, v56) --[[ Line: 100 ]] --[[ Name: launchGameWithAnalytics ]]
    -- upvalues: v50 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_EventNames_0 (copy), l_HttpService_0 (copy), v15 (copy), l_AnalyticsService_0 (copy), l_ExperienceService_0 (copy)
    if v50 then
        l_SetGamePlaySession_0(v56, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
    end;
    v52(l_EventNames_0.JoinExperience, {
        profileUserId = v54
    });
    local v57 = l_HttpService_0:GenerateGUID(false);
    v15.Events.gamePlayIntent(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
        friendId = v54, 
        pageName = v53, 
        placeId = if v55 then v55.locationPlaceId else nil, 
        rootPlaceId = if v55 then v55.locationRootPlaceId else nil, 
        joinAttemptId = v57
    });
    l_ExperienceService_0:LaunchExperience({
        userId = v54, 
        joinAttemptId = v57
    }, "PlayerContextualMenu");
end;
local v59 = {
    enableExperienceCTAs = true, 
    width = UDim.new(0, 400)
};
local v60 = {
    AcceptFriendRequest = "Feature.Friends.Action.AcceptFriend", 
    AddFriend = "Feature.PlayerSearchResults.Action.AddFriend", 
    Block = "Feature.Friends.Action.Block", 
    Unblock = "Feature.Friends.Action.Unblock", 
    Chat = "CommonUI.Features.Label.Chat", 
    IgnoreFriendRequest = "Feature.AddFriends.Action.IgnoreFriendRequest", 
    Join = "Feature.Chat.Drawer.Join", 
    PendingRequest = "Feature.Friends.Action.PendingRequest", 
    Report = "Feature.Catalog.Action.Report", 
    Unfriend = "Feature.Friends.Action.Unfriend", 
    ViewDetails = "Feature.Profile.Label.ViewDetails", 
    ViewGamerCardWord = "Xbox.Old.ViewGamerCardWord", 
    ViewPlatformProfile = "Feature.Friends.Action.ViewPlatformProfile", 
    FriendRequestAccepted = "Feature.Friends.Action.FriendAdded", 
    FriendRequestIgnored = "Feature.AddFriends.Action.RequestIgnored", 
    FriendRequestSent = "Feature.Friends.Action.FriendRequestSent", 
    SomethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    UserBlocked = "Feature.Profile.Action.UserBlocked"
};
return function(v61) --[[ Line: 190 ]] --[[ Name: PlayerContextualMenuContainer ]]
    -- upvalues: v3 (copy), v59 (copy), l_RoactRodux_0 (copy), v9 (copy), v16 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), v60 (copy), v14 (copy), v4 (copy), l_setupFireEvent_0 (copy), l_AnalyticsService_0 (copy), l_dependencyArray_0 (copy), v43 (copy), l_Url_0 (copy), l_getFFlagAppChatPCMFixBlocking_0 (copy), v47 (copy), v41 (copy), v24 (copy), l_useDesignTokens_0 (copy), v5 (copy), v49 (copy), l_RecommendationContextType_0 (copy), v29 (copy), v30 (copy), l_useRecommendationContextualInfoDisplay_0 (copy), l_EventNames_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v15 (copy), l_getCurrentRouteState_0 (copy), l_AppPage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v58 (copy), v50 (copy), v40 (copy), l_Images_0 (copy), v46 (copy), v51 (copy), l_GetFFlagAddAdditionalButtonsProp_0 (copy), v21 (copy), v42 (copy), v48 (copy)
    local v62 = v3.Dictionary.union(v59, v61);
    local v63 = l_RoactRodux_0.useDispatch();
    local v64 = v9.useLocalUserId();
    local v65 = v16.useNavigation();
    local v66 = v9.useRoactService(l_AppSessionService_0);
    local v67 = l_useLocalization_0(v60);
    local v68 = {
        toastMessage = v67.SomethingIsWrong, 
        isLocalized = true, 
        toastType = v14.Enums.ToastType.NetworkingError
    };
    local v69 = v4.useMemo(function() --[[ Line: 206 ]]
        -- upvalues: l_setupFireEvent_0 (ref), l_AnalyticsService_0 (ref), v64 (copy)
        return l_setupFireEvent_0({
            analytics = l_AnalyticsService_0, 
            infoForAllEvents = {
                uid = v64
            }
        });
    end, l_dependencyArray_0(v64));
    local v70 = v43();
    local v71, v72 = v4.useState({
        status = "NotStarted", 
        isPlayable = false
    });
    v4.useEffect(function() --[[ Line: 222 ]]
        -- upvalues: v62 (copy), v72 (copy), v70 (copy), l_Url_0 (ref)
        if v62.subjectPresence and v62.subjectPresence.locationUniverseId then
            v72({
                status = "Fetching", 
                isPlayable = false
            });
            v70(l_Url_0.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. v62.subjectPresence.locationUniverseId, "GET"):andThen(function(v73) --[[ Line: 234 ]]
                -- upvalues: v72 (ref)
                if v73.responseBody and v73.responseBody[1] then
                    v72({
                        status = "Finished", 
                        isPlayable = v73.responseBody[1].isPlayable
                    });
                end;
            end):catch(function(_) --[[ Line: 242 ]]
                -- upvalues: v72 (ref)
                v72({
                    status = "Failed", 
                    isPlayable = false
                });
            end);
        end;
    end, {
        (tostring(v62.subjectPresence))
    });
    local v75 = nil;
    if l_getFFlagAppChatPCMFixBlocking_0() then
        v75 = l_RoactRodux_0.useSelector(function(v76) --[[ Line: 254 ]]
            -- upvalues: v47 (ref), v62 (copy)
            return (if v47 then v76.PlayerContextualMenu.UserBlocking.isBlockedByMe else v76.PlayerContextualMenu.IsBlockedByMe)[v62.subjectUserId] == nil;
        end);
        v4.useEffect(function() --[[ Line: 262 ]]
            -- upvalues: v75 (ref), v63 (copy), v41 (ref), v62 (copy), v24 (ref)
            if v75 then
                v63(v41.IsBlockedById.API({
                    userId = v62.subjectUserId
                })):andThen(function() --[[ Line: 267 ]]

                end):catch(function() --[[ Line: 268 ]]
                    -- upvalues: v24 (ref)
                    v24:warning("Failed to check if subject user is blocked");
                end);
            end;
        end, {
            v75, 
            v63, 
            v62.subjectUserId
        });
    end;
    local v78 = l_useDesignTokens_0(function(v77) --[[ Line: 275 ]]
        return {
            iconEmphasis = v77.Semantic.Icon.Emphasis, 
            onlinePresence = v77.Semantic.Color.Common.Online, 
            joinEventButtonHeight = v77.Global.Size_600
        };
    end);
    local v79 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v62.subjectUserId
        }, 
        query = v5.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v80 = "";
    local v81 = "";
    local v82 = "";
    local v83 = "";
    if v79.data then
        v80 = v5.Selectors.getUsernameFromId(v79.data, v62.subjectUserId);
        v81 = v5.Selectors.getDisplayNameFromId(v79.data, v62.subjectUserId);
        v82 = v5.Selectors.getPlatformNameFromId(v79.data, v62.subjectUserId);
        if v49 then
            v83 = v5.Selectors.getPlatformProfileIdFromId(v79.data, v62.subjectUserId);
        end;
    end;
    local v84 = if v82 then v82 ~= "" else false;
    if v62.recommendationContext == l_RecommendationContextType_0.Contacts then
        v81 = v62.contactName or "";
    end;
    local v85, v86 = v29(v62.subjectPresence, v78);
    if v62.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
        v85 = nil;
        v86 = nil;
    end;
    local v87 = if v62.robloxFriendshipStatus == Enum.FriendStatus.Friend then v30(v62.subjectPresence) else nil;
    if v62.recommendationContext then
        local v88 = l_useRecommendationContextualInfoDisplay_0({
            contextType = v62.recommendationContext, 
            mutualFriendsCount = v62.mutualFriendsCount
        });
        v87 = v88.text;
        v85 = v88.icon;
    end;
    local v90 = v4.useCallback(function() --[[ Line: 326 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), v66 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v15 (ref), l_AnalyticsService_0 (ref), l_getCurrentRouteState_0 (ref), v65 (copy), l_AppPage_0 (ref)
        v69(l_EventNames_0.ViewExperienceDetails, {
            profileUserId = v62.subjectUserId
        });
        v63(v62.closeCentralOverlayThunk());
        if v62.subjectPresence and v62.subjectPresence.locationUniverseId then
            local v89 = tostring(v62.subjectPresence.locationUniverseId);
            if v66 then
                l_SetGamePlaySession_0(v66, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            v15.Events.gameDetailReferral(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
                pg = l_getCurrentRouteState_0(v65).routeName, 
                universeId = v89, 
                pid = v62.subjectPresence.locationPlaceId, 
                friendId = v62.subjectUserId
            });
            v65.navigate(l_AppPage_0.ExperienceDetail, {
                detail = v89
            });
        end;
    end, {
        v69, 
        v62.subjectUserId, 
        v62.closeCentralOverlayThunk, 
        v62.subjectPresence, 
        v65, 
        v66
    });
    local v91 = v4.useMemo(function() --[[ Line: 364 ]]
        -- upvalues: v62 (copy), v71 (copy), v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v90 (copy), v78 (copy), v67 (copy)
        if game:GetFastFlag("PCMRefactorExperienceCTARendering") then
            if v62.enableExperienceCTAs then
                if (if v62.subjectPresence then v62.subjectPresence.status == "InGame" else false) and not v71.isPlayable then
                    return function() --[[ Line: 375 ]]
                        -- upvalues: v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v90 (ref), v78 (ref), v67 (ref)
                        return v4.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            onActivated = v90, 
                            isLoading = false, 
                            size = UDim2.new(1, 0, 0, v78.joinEventButtonHeight), 
                            text = v67.ViewDetails, 
                            layoutOrder = 100
                        });
                    end;
                else
                    return nil;
                end;
            else
                return function() --[[ Line: 392 ]]
                    -- upvalues: v4 (ref)
                    return v4.createElement("Folder");
                end;
            end;
        elseif v62.subjectPresence == nil or v62.subjectPresence.status ~= "InGame" or v71.isPlayable then
            return nil;
        else
            return function() --[[ Line: 404 ]]
                -- upvalues: v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v90 (ref), v78 (ref), v67 (ref)
                return v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    onActivated = v90, 
                    isLoading = false, 
                    size = UDim2.new(1, 0, 0, v78.joinEventButtonHeight), 
                    text = v67.ViewDetails, 
                    layoutOrder = 100
                });
            end;
        end;
    end, {
        v71, 
        tostring(v62.subjectPresence), 
        v62.enableExperienceCTAs
    });
    local v92 = if v62.robloxFriendshipStatus == Enum.FriendStatus.Friend and v62.subjectPresence and v62.subjectPresence.status == "InGame" then v67.Join else nil;
    local v93 = v4.useCallback(function() --[[ Line: 431 ]]
        -- upvalues: v58 (ref), v69 (copy), l_getCurrentRouteState_0 (ref), v65 (copy), v62 (copy), v50 (ref), v66 (copy)
        v58(v69, l_getCurrentRouteState_0(v65).routeName, v62.subjectUserId, v62.subjectPresence, if v50 then v66 else nil);
    end, l_dependencyArray_0(v69, v65, v62.subjectUserId, v62.subjectPresence, if v50 then v66 else nil));
    local v94 = v4.useCallback(function() --[[ Line: 450 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), v65 (copy), l_AppPage_0 (ref)
        v69(l_EventNames_0.ReportPlayer, {
            profileUserId = v62.subjectUserId
        });
        if v62.onReportActivated then
            v62.onReportActivated();
            return;
        else
            v63(v62.closeCentralOverlayThunk());
            v65.navigate(l_AppPage_0.ReportScreen, {
                reportData = {
                    assetId = v62.subjectUserId, 
                    reportAbuseVector = "user", 
                    context = "profile", 
                    platform = "console"
                }
            });
            return;
        end;
    end, l_dependencyArray_0(v63, v65, v62.subjectUserId, v62.closeCentralOverlayThunk, v62.onReportActivated));
    local v95 = if v49 then v4.useCallback(function() --[[ Line: 479 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v49 (ref), v83 (ref)
        v69(l_EventNames_0.ViewPlatformProfile, {
            profileUserId = v62.subjectUserId
        });
        v49:ShowProfile(v83);
    end, {
        v83, 
        v63, 
        v65, 
        v62.subjectUserId, 
        v62.closeCentralOverlayThunk
    }) else nil;
    local v97 = v4.useCallback(function() --[[ Line: 487 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), v41 (ref), v64 (copy), v14 (ref), v67 (copy), v68 (copy)
        v69(l_EventNames_0.BlockPlayer, {
            profileUserId = v62.subjectUserId
        });
        v63(v41.BlockUserById.API({
            userId = v62.subjectUserId, 
            currentUserId = v64
        })):andThen(function() --[[ Line: 494 ]]
            -- upvalues: v63 (ref), v14 (ref), v67 (ref), v62 (ref)
            v63(v14.Actions.SetCurrentToastMessage({
                toastMessage = v67.UserBlocked, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v63(v62.closeCentralOverlayThunk());
        end):catch(function(_) --[[ Line: 502 ]]
            -- upvalues: v63 (ref), v14 (ref), v68 (ref)
            v63(v14.Actions.SetCurrentToastMessage(v68));
        end);
    end, l_dependencyArray_0(v67, v64, v63, v62.closeCentralOverlayThunk, v62.subjectUserId));
    local v99 = v4.useCallback(function() --[[ Line: 507 ]]
        -- upvalues: v63 (copy), v41 (ref), v62 (copy), v64 (copy), v14 (ref), v68 (copy)
        v63(v41.UnblockUserById.API({
            userId = v62.subjectUserId, 
            currentUserId = v64
        })):andThen(function() --[[ Line: 512 ]]
            -- upvalues: v63 (ref), v62 (ref)
            v63(v62.closeCentralOverlayThunk());
        end):catch(function(_) --[[ Line: 515 ]]
            -- upvalues: v63 (ref), v14 (ref), v68 (ref)
            v63(v14.Actions.SetCurrentToastMessage(v68));
        end);
    end, l_dependencyArray_0(v64, v63, v62.closeCentralOverlayThunk, v62.subjectUserId));
    local v100 = v4.useCallback(function() --[[ Line: 520 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), v40 (ref), v64 (copy), v14 (ref), v67 (copy), v68 (copy)
        v69(l_EventNames_0.Unfriend, {
            profileUserId = v62.subjectUserId
        });
        v63(v40.UnfriendTargetUserId.API({
            targetUserId = v62.subjectUserId, 
            currentUserId = v64
        })):andThen(function() --[[ Line: 527 ]]
            -- upvalues: v63 (ref), v14 (ref), v67 (ref), v62 (ref)
            v63(v14.Actions.SetCurrentToastMessage({
                toastMessage = v67.Unfriend, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v63(v62.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 535 ]]
            -- upvalues: v63 (ref), v14 (ref), v68 (ref)
            v63(v14.Actions.SetCurrentToastMessage(v68));
        end);
    end, l_dependencyArray_0(v67, v64, v63, v62.subjectUserId, v62.closeCentralOverlayThunk));
    local v101 = v4.useCallback(function() --[[ Line: 541 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), l_RecommendationContextType_0 (ref), v40 (ref), v64 (copy), v14 (ref), v67 (copy), v68 (copy)
        v69(l_EventNames_0.RequestFriendship, {
            profileUserId = v62.subjectUserId
        });
        v63(if v62.recommendationContext == l_RecommendationContextType_0.Contacts and v62.contactId then v40.RequestFriendshipFromContactId.API({
            contactId = v62.contactId, 
            currentUserId = v64
        }) else v40.RequestFriendshipFromUserId.API({
            targetUserId = v62.subjectUserId, 
            currentUserId = v64, 
            friendshipOriginSourceType = v62.friendshipOriginSourceType
        })):andThen(function() --[[ Line: 553 ]]
            -- upvalues: v63 (ref), v14 (ref), v67 (ref), v62 (ref)
            v63(v14.Actions.SetCurrentToastMessage({
                toastMessage = v67.FriendRequestSent, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v63(v62.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 561 ]]
            -- upvalues: v63 (ref), v14 (ref), v68 (ref)
            v63(v14.Actions.SetCurrentToastMessage(v68));
        end);
    end, {
        v67, 
        v64, 
        v63, 
        v62.closeCentralOverlayThunk, 
        v62.subjectUserId, 
        v62.recommendationContext, 
        v62.contactId, 
        v62.friendshipOriginSourceType
    });
    local v102 = v4.useCallback(function() --[[ Line: 577 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), v40 (ref), v64 (copy), v14 (ref), v67 (copy), v68 (copy)
        v69(l_EventNames_0.AcceptFriendRequest, {
            profileUserId = v62.subjectUserId
        });
        v63(v40.AcceptFriendRequestFromUserId.API({
            targetUserId = v62.subjectUserId, 
            currentUserId = v64
        })):andThen(function() --[[ Line: 584 ]]
            -- upvalues: v63 (ref), v14 (ref), v67 (ref), v62 (ref)
            v63(v14.Actions.SetCurrentToastMessage({
                toastMessage = v67.FriendRequestAccepted, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v63(v62.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 592 ]]
            -- upvalues: v63 (ref), v14 (ref), v68 (ref)
            v63(v14.Actions.SetCurrentToastMessage(v68));
        end);
    end, l_dependencyArray_0(v67, v64, v63, v62.closeCentralOverlayThunk, v62.subjectUserId));
    local v103 = v4.useCallback(function() --[[ Line: 597 ]]
        -- upvalues: v69 (copy), l_EventNames_0 (ref), v62 (copy), v63 (copy), v40 (ref), v64 (copy), v14 (ref), v67 (copy), v68 (copy)
        v69(l_EventNames_0.IgnoreFriendRequest, {
            profileUserId = v62.subjectUserId
        });
        v63(v40.DeclineFriendRequestFromUserId.API({
            targetUserId = v62.subjectUserId, 
            currentUserId = v64
        })):andThen(function() --[[ Line: 604 ]]
            -- upvalues: v63 (ref), v14 (ref), v67 (ref), v62 (ref)
            v63(v14.Actions.SetCurrentToastMessage({
                toastMessage = v67.FriendRequestIgnored, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v63(v62.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 612 ]]
            -- upvalues: v63 (ref), v14 (ref), v68 (ref)
            v63(v14.Actions.SetCurrentToastMessage(v68));
        end);
    end, l_dependencyArray_0(v67, v64, v63, v62.closeCentralOverlayThunk, v62.subjectUserId));
    local v105 = l_RoactRodux_0.useSelector(function(v104) --[[ Line: 617 ]]
        -- upvalues: v47 (ref), v62 (copy)
        return (if v47 then v104.PlayerContextualMenu.UserBlocking.isBlockedByMe else v104.PlayerContextualMenu.IsBlockedByMe)[v62.subjectUserId] or false;
    end);
    local v118 = v4.useMemo(function() --[[ Line: 626 ]]
        -- upvalues: l_Images_0 (ref), v67 (copy), v94 (copy), v46 (ref), v95 (copy), v97 (copy), v75 (ref), v99 (copy), v100 (copy), v101 (copy), v51 (ref), v102 (copy), v103 (copy), v105 (copy), v62 (copy), l_GetFFlagAddAdditionalButtonsProp_0 (ref), l_getFFlagAppChatPCMFixBlocking_0 (ref), v3 (ref), v49 (ref), v83 (ref), v21 (ref)
        local v106 = {
            icon = l_Images_0["icons/actions/feedback"], 
            text = v67.Report, 
            onActivated = v94
        };
        local v107 = {
            icon = v46, 
            text = v67.ViewPlatformProfile, 
            onActivated = v95
        };
        local v108 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v67.Block, 
            onActivated = v97, 
            disabled = v75
        };
        local v109 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v67.Unblock, 
            onActivated = v99
        };
        local v110 = {
            icon = l_Images_0["icons/actions/friends/friendRemove"], 
            text = v67.Unfriend, 
            onActivated = v100
        };
        local v111 = {
            icon = l_Images_0["icons/actions/friends/friendAdd"], 
            text = v67.AddFriend, 
            onActivated = v101
        };
        local v112 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v67.PendingRequest, 
            onActivated = v51
        };
        local v113 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v67.AcceptFriendRequest, 
            onActivated = v102
        };
        local v114 = {
            icon = l_Images_0["icons/actions/reject"], 
            text = v67.IgnoreFriendRequest, 
            onActivated = v103
        };
        local function v117() --[[ Line: 682 ]] --[[ Name: makeCtas ]]
            -- upvalues: v105 (ref), v109 (copy), v108 (copy), v62 (ref), l_GetFFlagAddAdditionalButtonsProp_0 (ref), v106 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v110 (copy), v111 (copy), v112 (copy), v113 (copy), v114 (copy), v3 (ref)
            local v115 = if v105 then v109 else v108;
            local v116 = {};
            if v62.robloxFriendshipStatus == Enum.FriendStatus.Friend then
                if l_GetFFlagAddAdditionalButtonsProp_0() then
                    v116 = {
                        v106, 
                        if l_getFFlagAppChatPCMFixBlocking_0() then v115 else v108, 
                        v110
                    };
                else
                    return {
                        v106, 
                        if l_getFFlagAppChatPCMFixBlocking_0() then v115 else v108, 
                        v110
                    };
                end;
            elseif v62.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then
                if v62.contactId then
                    if l_GetFFlagAddAdditionalButtonsProp_0() then
                        v116 = {
                            v111
                        };
                    else
                        return {
                            v111
                        };
                    end;
                elseif l_GetFFlagAddAdditionalButtonsProp_0() then
                    v116 = {
                        v111, 
                        v106, 
                        v115
                    };
                else
                    return {
                        v111, 
                        v106, 
                        v115
                    };
                end;
            elseif v62.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then
                if l_GetFFlagAddAdditionalButtonsProp_0() then
                    v116 = {
                        v112, 
                        v106, 
                        v115
                    };
                else
                    return {
                        v112, 
                        v106, 
                        v115
                    };
                end;
            elseif v62.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then
                if l_GetFFlagAddAdditionalButtonsProp_0() then
                    v116 = {
                        v113, 
                        v114, 
                        v106, 
                        v115
                    };
                else
                    return {
                        v113, 
                        v114, 
                        v106, 
                        v115
                    };
                end;
            elseif l_GetFFlagAddAdditionalButtonsProp_0() then
                v116 = {
                    v106, 
                    v115
                };
            else
                return {
                    v106, 
                    v115
                };
            end;
            if v62.additionalButtons then
                v116 = v3.List.join(v116, v62.additionalButtons);
            end;
            return v116;
        end;
        if v49 and v49:IsProfileEnabled() and v83 and v83 ~= "" then
            return v21.append({
                v107
            }, (v117()));
        else
            return (v117());
        end;
    end, v3.Dictionary.union(if v49 then {
        v62.robloxFriendshipStatus, 
        v105, 
        v83, 
        v62.contactId, 
        v62.additionalButtons
    } else {
        v62.robloxFriendshipStatus, 
        v105, 
        v62.contactId, 
        v62.additionalButtons
    }, if l_getFFlagAppChatPCMFixBlocking_0() then {
        v75
    } else {}));
    return v4.createElement(v42, {
        headerProps = v4.useMemo(function() --[[ Line: 806 ]]
            -- upvalues: v81 (ref), v79 (copy), v62 (copy), l_RecommendationContextType_0 (ref), v80 (ref), v82 (ref), v84 (copy), v46 (ref), v87 (ref), v85 (ref), v86 (ref), v92 (copy), v93 (copy), v91 (copy)
            return {
                displayNameItem = {
                    labelText = v81, 
                    icon = nil, 
                    isLoading = v79.loading
                }, 
                userNameItem = if v62.recommendationContext == l_RecommendationContextType_0.Contacts then nil else {
                    labelText = "@" .. v80, 
                    icon = nil, 
                    isLoading = v79.loading
                }, 
                vendorNameItem = if v82 == "" then nil else {
                    labelText = v82 or "", 
                    icon = v84 and {
                        Image = v46, 
                        ImageRectOffset = Vector2.zero, 
                        ImageRectSize = Vector2.zero
                    } or nil, 
                    isLoading = v79.loading
                }, 
                contextText = v87, 
                contextIcon = v85, 
                contextIconColor = if v86 then v86.Color3 else nil, 
                contextIconTransparency = if v86 then v86.Transparency else nil, 
                joinEventText = v92, 
                joinEventOnActivated = v93, 
                renderJoinEventButton = v91
            };
        end, l_dependencyArray_0(v79, v81, v80, v82, v84, v85, v87, v86, v91, v92, v93, v62.recommendationContext)), 
        buttonProps = v118, 
        width = if v48 then v62.width else UDim.new(0, 400)
    });
end;