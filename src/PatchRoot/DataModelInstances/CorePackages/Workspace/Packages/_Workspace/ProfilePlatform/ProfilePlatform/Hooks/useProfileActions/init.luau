local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.AppChat);
local v7 = require(l_Parent_0.SocialCommon);
local v8 = require(l_Parent_0.Navigation);
local v9 = require(l_Parent_0.SetAlias);
local v10 = require(l_Parent_0.SocialExperienceJoin);
local v11 = require(l_Parent_0.RobloxAppEnums);
local v12 = require(l_Parent_0.SharedFlags);
local v13 = require(l_Parent_0.Http);
local l_Images_0 = v4.App.ImageSet.Images;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local v16 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_useNavigation_0 = v8.useNavigation;
local v18 = require(l_Parent_0.NavigationRodux);
local l_Url_0 = v13.Url;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_NavigateDown_0 = v18.Thunks.NavigateDown;
local l_AppPage_0 = v11.AppPage;
local l_useJoinUserInExperience_0 = v10.useJoinUserInExperience;
local v25 = require(l_Parent_0.SocialStopwatch);
local v26 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v28 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v29 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v30 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local v31 = require(l_script_FirstAncestor_0.Networking.myUserBlockingNetworking);
local v32 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v33 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v34 = require(l_script_FirstAncestor_0.Common.Enums);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_FFlagProfilePlatformRemainingLogging_0 = v12.FFlagProfilePlatformRemainingLogging;
local l_FFlagProfilePlatformAddToasts_0 = v12.FFlagProfilePlatformAddToasts;
local l_FFlagContactInvitesInProfilePlatform_0 = v12.FFlagContactInvitesInProfilePlatform;
local v39 = require(l_Parent_0.SocialToast);
local l_ChatEntryPointNames_0 = v7.Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = v6.Actions.EnteredChatFromEntryPoint;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
return function(v44) --[[ Line: 56 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v16 (copy), v32 (copy), l_useLocalization_0 (copy), v34 (copy), v28 (copy), v3 (copy), l_useJoinUserInExperience_0 (copy), l_FFlagProfilePlatformAddToasts_0 (copy), v39 (copy), l_FriendRequestNicknamesIXP_0 (copy), v33 (copy), l_FFlagProfilePlatformRemainingLogging_0 (copy), v26 (copy), l_Images_0 (copy), v29 (copy), l_FFlagContactInvitesInProfilePlatform_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v31 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_ChatEntryPointNames_0 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), v25 (copy), v9 (copy), v30 (copy), l_ButtonType_0 (copy), l_Url_0 (copy), l_dependencyArray_0 (copy)
    local v45 = l_useLocalUserId_0();
    local v46 = l_useDispatch_0();
    local v47 = l_useNavigation_0();
    local v48 = v16();
    local v49 = v32();
    local v50 = l_useLocalization_0({
        [v34.ProfileActions.AcceptFriendRequest] = v28.AcceptFriend, 
        [v34.ProfileActions.AcceptOffNetworkFriendRequest] = v28.AcceptFriend, 
        [v34.ProfileActions.AddFriend] = v28.AddFriend, 
        [v34.ProfileActions.AddFriendFromContacts] = v28.AddFriend, 
        [v34.ProfileActions.AddFriendFromContactsSent] = v28.AddFriend, 
        [v34.ProfileActions.Block] = v28.Block, 
        [v34.ProfileActions.CannotAddFriend] = v28.AddFriend, 
        [v34.ProfileActions.Chat] = v28.Chat, 
        [v34.ProfileActions.EditAlias] = v28.CustomizeName, 
        [v34.ProfileActions.EditProfile] = v28.EditProfile, 
        [v34.ProfileActions.IgnoreFriendRequest] = v28.IgnoreFriendRequest, 
        [v34.ProfileActions.JoinExperience] = v28.Join, 
        [v34.ProfileActions.PendingFriendRequest] = v28.PendingRequest, 
        [v34.ProfileActions.QrCode] = v28.ToQRCode, 
        [v34.ProfileActions.Report] = v28.Report, 
        [v34.ProfileActions.Unblock] = v28.Unblock, 
        [v34.ProfileActions.Unfriend] = v28.Unfriend, 
        friendAcceptedToast = v28.FriendAdded, 
        friendRemovedToast = v28.FriendRemoved, 
        friendRequestSentToast = v28.FriendRequestSent, 
        friendRequestIgnoredToast = v28.RequestIgnored, 
        userBlockedToast = v28.UserBlocked, 
        blockLimitReachedToast = v28.BlockLimitReached, 
        somethingIsWrongToast = v28.SomethingIsWrong
    });
    local v51 = v3.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v48 (copy)
        v48.navigateTo.previousView(true);
    end, {
        v48.navigateTo.previousView
    });
    local v52 = l_useJoinUserInExperience_0(v48.profileUserId, {
        isHomePageCarousel = v48.sourceInfo.source == v34.Sources.HomepageFriendsCarousel, 
        homepageCarouselAbsolutePosition = v48.sourceInfo.homepageCarouselAbsolutePosition, 
        openGameDetailsPeekViewClosed = v51
    });
    local v53 = if l_FFlagProfilePlatformAddToasts_0 then v39.useOpenToast() else function() --[[ Line: 98 ]]

    end;
    local l_qRCodePage_0 = v48.navigateTo.qRCodePage;
    local l_editUsername_0 = v48.navigateTo.editUsername;
    local l_profileUserId_0 = v48.profileUserId;
    local v57 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    return (v3.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: v34 (ref), v50 (copy), v49 (copy), v33 (ref), v44 (copy), v48 (copy), l_FFlagProfilePlatformRemainingLogging_0 (ref), v46 (copy), v26 (ref), l_profileUserId_0 (copy), v45 (copy), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (copy), l_Images_0 (ref), v29 (ref), l_FFlagContactInvitesInProfilePlatform_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v57 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v31 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref), v25 (ref), v47 (copy), v9 (ref), l_editUsername_0 (copy), v30 (ref), l_ButtonType_0 (ref), v52 (copy), l_qRCodePage_0 (copy), l_Url_0 (ref), v28 (ref)
        return {
            [v34.ProfileActions.AcceptFriendRequest] = {
                text = v50[v34.ProfileActions.AcceptFriendRequest], 
                onActivated = function() --[[ Line: 111 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v48 (ref), v34 (ref), l_FFlagProfilePlatformRemainingLogging_0 (ref), v46 (ref), v26 (ref), l_profileUserId_0 (ref), v45 (ref), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v29 (ref)
                    v49.fireAnalyticsEvent(v33.CTAButtonAcceptFriendRequest, {
                        buttonSurface = v44, 
                        absolutePosition = v48.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v48.sourceInfo.source == v34.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v48.sourceInfo.isRecommendation, 
                        source = v48.sourceInfo.source, 
                        contextualInfoType = v48.sourceInfo.contextualInfoType, 
                        recommendationContextType = if l_FFlagProfilePlatformRemainingLogging_0 then v48.sourceInfo.recommendationContextType else nil, 
                        recommendationRank = if l_FFlagProfilePlatformRemainingLogging_0 then v48.sourceInfo.recommendationRank else nil, 
                        recommendationSessionId = if l_FFlagProfilePlatformRemainingLogging_0 then v48.sourceInfo.recommendationSessionId else nil
                    });
                    return v46(v26.AcceptFriendRequestFromUserId.API({
                        targetUserId = l_profileUserId_0, 
                        currentUserId = v45
                    })):andThen(function() --[[ Line: 133 ]]
                        -- upvalues: l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                        if l_FFlagProfilePlatformAddToasts_0 then
                            v53({
                                toastTitle = v50.friendAcceptedToast, 
                                iconImage = l_Images_0["icons/actions/friends/friendAdd"]
                            });
                        end;
                        return v46(v29(l_profileUserId_0)):andThen(function(_) --[[ Line: 141 ]]

                        end):catch(function(_) --[[ Line: 144 ]]

                        end);
                    end);
                end
            }, 
            [v34.ProfileActions.AcceptOffNetworkFriendRequest] = {
                text = v50[v34.ProfileActions.AcceptOffNetworkFriendRequest], 
                onActivated = function() --[[ Line: 152 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_FFlagContactInvitesInProfilePlatform_0 (ref), v49 (ref), v33 (ref), v48 (ref), v46 (ref), v26 (ref), l_profileUserId_0 (ref), v45 (ref), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v29 (ref)
                    if l_FFlagContactInvitesInProfilePlatform_0 then
                        v49.fireAnalyticsEvent(v33.CTAButtonAddFriendFromContacts, {
                            shareLinkId = v48.sourceInfo.shareLinkId
                        });
                    end;
                    return v46(v26.AcceptFriendRequestWithToken.API({
                        targetUserId = l_profileUserId_0, 
                        currentUserId = v45, 
                        friendingToken = if l_FFlagContactInvitesInProfilePlatform_0 then v48.offNetworkFriendRequestToken else nil
                    })):andThen(function() --[[ Line: 164 ]]
                        -- upvalues: l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                        if l_FFlagProfilePlatformAddToasts_0 then
                            v53({
                                toastTitle = v50.friendAcceptedToast, 
                                iconImage = l_Images_0["icons/actions/friends/friendAdd"]
                            });
                        end;
                        return v46(v29(l_profileUserId_0));
                    end);
                end
            }, 
            [v34.ProfileActions.AddFriend] = {
                text = v50[v34.ProfileActions.AddFriend], 
                onActivated = function() --[[ Line: 177 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v48 (ref), v34 (ref), l_FFlagProfilePlatformRemainingLogging_0 (ref), l_FriendRequestNicknamesIXP_0 (ref), v57 (ref), v46 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_profileUserId_0 (ref), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v26 (ref), v45 (ref), v29 (ref)
                    v49.fireAnalyticsEvent(v33.CTAButtonAddFriend, {
                        buttonSurface = v44, 
                        absolutePosition = v48.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v48.sourceInfo.source == v34.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v48.sourceInfo.isRecommendation, 
                        source = v48.sourceInfo.source, 
                        contextualInfoType = v48.sourceInfo.contextualInfoType, 
                        recommendationContextType = if l_FFlagProfilePlatformRemainingLogging_0 then v48.sourceInfo.recommendationContextType else nil, 
                        recommendationRank = if l_FFlagProfilePlatformRemainingLogging_0 then v48.sourceInfo.recommendationRank else nil, 
                        recommendationSessionId = if l_FFlagProfilePlatformRemainingLogging_0 then v48.sourceInfo.recommendationSessionId else nil
                    });
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v57 then
                        return v46(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = l_profileUserId_0, 
                                    source = v48.sourceInfo.friendshipOriginSourceType
                                }
                            }
                        }));
                    else
                        if l_FFlagProfilePlatformAddToasts_0 then
                            v53({
                                toastTitle = v50.friendRequestSentToast, 
                                iconImage = l_Images_0["icons/actions/friends/friendAdd"]
                            });
                        end;
                        return v46(v26.RequestFriendshipFromUserId.API({
                            targetUserId = l_profileUserId_0, 
                            currentUserId = v45, 
                            friendshipOriginSourceType = v48.sourceInfo.friendshipOriginSourceType
                        })):andThen(function() --[[ Line: 218 ]]
                            -- upvalues: v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                            return v46(v29(l_profileUserId_0));
                        end);
                    end;
                end
            }, 
            [v34.ProfileActions.AddFriendFromContacts] = {
                text = v50[v34.ProfileActions.AddFriendFromContacts], 
                onActivated = function() --[[ Line: 226 ]] --[[ Name: onActivated ]]

                end
            }, 
            [v34.ProfileActions.AddFriendFromContactsSent] = {
                text = v50[v34.ProfileActions.AddFriendFromContactsSent], 
                onActivated = function() --[[ Line: 232 ]] --[[ Name: onActivated ]]

                end
            }, 
            [v34.ProfileActions.Block] = {
                text = v50[v34.ProfileActions.Block], 
                icon = l_Images_0["icons/actions/block"], 
                onActivated = function() --[[ Line: 239 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v46 (ref), v31 (ref), l_profileUserId_0 (ref), v45 (ref), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v29 (ref)
                    v49.fireAnalyticsEvent(v33.ContextualMenuButtonBlock, {
                        buttonSurface = v44
                    });
                    return v46(v31.BlockUserById.API({
                        userId = l_profileUserId_0, 
                        currentUserId = v45
                    })):andThen(function() --[[ Line: 247 ]]
                        -- upvalues: l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                        if l_FFlagProfilePlatformAddToasts_0 then
                            v53({
                                toastTitle = v50.userBlockedToast, 
                                iconImage = l_Images_0["icons/actions/block"]
                            });
                        end;
                        return v46(v29(l_profileUserId_0));
                    end):catch(function(v60) --[[ Line: 257 ]]
                        -- upvalues: v53 (ref), v50 (ref)
                        if v60 ~= nil and v60.Body == "\"User sending block request has reached their block limit.\"" then
                            v53({
                                toastTitle = v50.blockLimitReachedToast
                            });
                            return;
                        else
                            v53({
                                toastTitle = v50.somethingIsWrongToast
                            });
                            return;
                        end;
                    end);
                end
            }, 
            [v34.ProfileActions.CannotAddFriend] = {
                text = v50[v34.ProfileActions.CannotAddFriend], 
                onActivated = function() --[[ Line: 272 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v34.ProfileActions.Chat] = {
                text = v50[v34.ProfileActions.Chat], 
                icon = l_Images_0["icons/menu/chat_off"], 
                onActivated = function() --[[ Line: 278 ]] --[[ Name: onActivated ]]
                    -- upvalues: v44 (ref), v34 (ref), v49 (ref), v33 (ref), v46 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_profileUserId_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
                    if v44 == v34.ButtonSurface.ContextualMenu then
                        v49.fireAnalyticsEvent(v33.ContextualMenuButtonChat, {
                            buttonSurface = v44
                        });
                    else
                        v49.fireAnalyticsEvent(v33.CTAButtonChat, {
                            buttonSurface = v44
                        });
                    end;
                    v46(l_EnteredChatFromEntryPoint_0(l_ChatEntryPointNames_0.ProfilePeekView));
                    l_GuiService_0:BroadcastNotification(l_profileUserId_0, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
                end
            }, 
            [v34.ProfileActions.EditAlias] = {
                text = v50[v34.ProfileActions.EditAlias], 
                icon = l_Images_0["icons/actions/edit/edit"], 
                onActivated = function() --[[ Line: 296 ]] --[[ Name: onActivated ]]
                    -- upvalues: v25 (ref), v49 (ref), v33 (ref), v44 (ref), v47 (ref), v34 (ref), l_profileUserId_0 (ref), v9 (ref)
                    v25.Stopwatch.start(v25.Events.CustomizeNameOpened);
                    v49.fireAnalyticsEvent(v33.ContextualMenuButtonSetAlias, {
                        buttonSurface = v44
                    });
                    v47.navigate(v34.Screens.SetAliasModal, {
                        profileUserId = l_profileUserId_0, 
                        origin = v9.Analytics.EntryPoints.ContextualMenu
                    });
                end
            }, 
            [v34.ProfileActions.EditProfile] = {
                text = v50[v34.ProfileActions.EditProfile], 
                onActivated = function() --[[ Line: 309 ]] --[[ Name: onActivated ]]
                    -- upvalues: v25 (ref), v49 (ref), v33 (ref), v44 (ref), v47 (ref), v34 (ref), l_editUsername_0 (ref), v46 (ref), v30 (ref), l_profileUserId_0 (ref)
                    v25.Stopwatch.start(v25.Events.EditProfileOpened);
                    v49.fireAnalyticsEvent(v33.CTAButtonOpenEditProfilePage, {
                        buttonSurface = v44
                    });
                    v47.navigate(v34.Screens.EditProfilePage, {
                        profileScreens = v34.Screens, 
                        navigateToEditUsername = function(v61) --[[ Line: 316 ]] --[[ Name: navigateToEditUsername ]]
                            -- upvalues: l_editUsername_0 (ref), v46 (ref), v30 (ref), l_profileUserId_0 (ref)
                            l_editUsername_0({
                                showToast = v61, 
                                onUsernameChanged = function() --[[ Line: 319 ]] --[[ Name: onUsernameChanged ]]
                                    -- upvalues: v46 (ref), v30 (ref), l_profileUserId_0 (ref)
                                    v46(v30(l_profileUserId_0));
                                end
                            });
                        end, 
                        onIdentityChange = function() --[[ Line: 324 ]] --[[ Name: onIdentityChange ]]
                            -- upvalues: v46 (ref), v30 (ref), l_profileUserId_0 (ref)
                            v46(v30(l_profileUserId_0));
                        end
                    });
                end
            }, 
            [v34.ProfileActions.IgnoreFriendRequest] = {
                text = v50[v34.ProfileActions.IgnoreFriendRequest], 
                icon = l_Images_0["icons/actions/reject"], 
                onActivated = function() --[[ Line: 333 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v46 (ref), v26 (ref), l_profileUserId_0 (ref), v45 (ref), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v29 (ref)
                    v49.fireAnalyticsEvent(v33.ContextualMenuButtonIgnoreFriendRequest, {
                        buttonSurface = v44
                    });
                    return v46(v26.DeclineFriendRequestFromUserId.API({
                        targetUserId = l_profileUserId_0, 
                        currentUserId = v45
                    })):andThen(function() --[[ Line: 340 ]]
                        -- upvalues: l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                        if l_FFlagProfilePlatformAddToasts_0 then
                            v53({
                                toastTitle = v50.friendRequestIgnoredToast, 
                                iconImage = l_Images_0["icons/actions/reject"]
                            });
                        end;
                        return v46(v29(l_profileUserId_0));
                    end);
                end
            }, 
            [v34.ProfileActions.JoinExperience] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                isLoading = v52.isLoading, 
                isDisabled = not v52.isInExperience, 
                text = v50[v34.ProfileActions.JoinExperience], 
                onActivated = function() --[[ Line: 357 ]] --[[ Name: onActivated ]]
                    -- upvalues: v52 (ref)
                    v52.joinExperience();
                end
            }, 
            [v34.ProfileActions.PendingFriendRequest] = {
                buttonType = l_ButtonType_0.Secondary, 
                text = v50[v34.ProfileActions.PendingFriendRequest], 
                onActivated = function() --[[ Line: 365 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v34.ProfileActions.QrCode] = {
                text = v50[v34.ProfileActions.QrCode], 
                icon = l_Images_0["icons/menu/scanqr"], 
                onActivated = function() --[[ Line: 371 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), l_qRCodePage_0 (ref)
                    v49.fireAnalyticsEvent(v33.CTAButtonShareProfileQRCode, {
                        buttonSurface = v44
                    });
                    l_qRCodePage_0();
                end
            }, 
            [v34.ProfileActions.Report] = {
                text = v50[v34.ProfileActions.Report], 
                icon = l_Images_0["icons/actions/feedback"], 
                onActivated = function() --[[ Line: 381 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v46 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileUserId_0 (ref), v28 (ref)
                    v49.fireAnalyticsEvent(v33.ContextualMenuButtonReport, {
                        buttonSurface = v44
                    });
                    v46(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = string.format("%sabusereport/userprofile?id=%s", l_Url_0.BASE_URL, l_profileUserId_0), 
                        extraProps = {
                            titleKey = v28.Report
                        }
                    }, nil));
                end
            }, 
            [v34.ProfileActions.Unblock] = {
                text = v50[v34.ProfileActions.Unblock], 
                onActivated = function() --[[ Line: 396 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v46 (ref), v31 (ref), l_profileUserId_0 (ref), v45 (ref), v29 (ref)
                    v49.fireAnalyticsEvent(v33.CTAButtonUnblock, {
                        buttonSurface = v44
                    });
                    return v46(v31.UnblockUserById.API({
                        userId = l_profileUserId_0, 
                        currentUserId = v45
                    })):andThen(function() --[[ Line: 403 ]]
                        -- upvalues: v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                        return v46(v29(l_profileUserId_0));
                    end);
                end
            }, 
            [v34.ProfileActions.Unfriend] = {
                text = v50[v34.ProfileActions.Unfriend], 
                icon = l_Images_0["icons/actions/friends/friendRemove"], 
                onActivated = function() --[[ Line: 411 ]] --[[ Name: onActivated ]]
                    -- upvalues: v49 (ref), v33 (ref), v44 (ref), v46 (ref), v26 (ref), l_profileUserId_0 (ref), v45 (ref), l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v29 (ref)
                    v49.fireAnalyticsEvent(v33.ContextualMenuButtonUnfriend, {
                        buttonSurface = v44
                    });
                    return v46(v26.UnfriendTargetUserId.API({
                        targetUserId = l_profileUserId_0, 
                        currentUserId = v45
                    })):andThen(function() --[[ Line: 418 ]]
                        -- upvalues: l_FFlagProfilePlatformAddToasts_0 (ref), v53 (ref), v50 (ref), l_Images_0 (ref), v46 (ref), v29 (ref), l_profileUserId_0 (ref)
                        if l_FFlagProfilePlatformAddToasts_0 then
                            v53({
                                toastTitle = v50.friendRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"]
                            });
                        end;
                        return v46(v29(l_profileUserId_0));
                    end);
                end
            }
        };
    end, l_dependencyArray_0(v46, l_profileUserId_0, l_qRCodePage_0, v50, v45, v47, l_editUsername_0, v52.joinExperience, v52.isLoading, v49, v57, v44)));
end;