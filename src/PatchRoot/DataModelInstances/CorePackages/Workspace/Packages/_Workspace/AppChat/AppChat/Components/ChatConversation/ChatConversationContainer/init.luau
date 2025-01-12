local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
local v6 = require(script.Parent.ChatConversation);
local v7 = require(script.Parent.PendingState.PendingStateConversationPage);
local v8 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v9 = require(l_script_FirstAncestor_0.LegacyAnalytics.useAnalytics);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.Messages.Selectors.selectMessagesPure);
local v11 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v12 = require(l_script_FirstAncestor_0.Models.Conversation);
local v13 = require(l_script_FirstAncestor_0.Components.ChatDetails.Dialogs.GenericDialogType);
local v14 = require(l_Parent_0.AppChatNetworking);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v16 = require(script.Parent.mapDispatchToProps);
local v17 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useEffect_0 = v3.useEffect;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v23 = require(l_script_FirstAncestor_0.Hooks.useMapDispatch);
local v24 = require(l_script_FirstAncestor_0.Hooks.useGetUsers);
local v25 = require(l_script_FirstAncestor_0.Hooks.useGetUsersTyping);
local v26 = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessage);
local v27 = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch);
local v28 = require(l_Parent_0.UserProfiles);
local v29 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v30 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local v31 = require(l_script_FirstAncestor_0.Hooks.useRecipientIds);
local v32 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v33 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v34 = require(l_script_FirstAncestor_0.Hooks.useNeedsPhoneVerificationUnfilteredThreads);
local v35 = require(l_script_FirstAncestor_0.Hooks.usePositionOffsetForVirtualKeyboard);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v37 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local v38 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v39 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local v40 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v41 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v42 = require(l_script_FirstAncestor_0.EnumScreens);
local v43 = require(l_script_FirstAncestor_0.Flags.getFFlagLoadedMessageCountOnRender);
local v44 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatShouldNotAdjustForKeyboardInExperience);
local v45 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppChatInExperience;
local v47 = require(l_script_FirstAncestor_0.App.InExperienceAppChatExperimentation);
local v48 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationKeyboardOffsetCalculation);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v50 = game:DefineFastFlag("AppChatDisableInputBarU13", false);
local l_GetFFlagAppChatInExperienceRenameToRobloxChat_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatInExperienceRenameToRobloxChat;
local v52 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local l_getFFlagAppChatEnableConversationUnavailableUI_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatEnableConversationUnavailableUI;
local v55 = {
    topBarHeight = 0, 
    wideMode = false, 
    chatInputPlaceholderKey = "Feature.Chat.Label.ChatInputPlaceholder", 
    messageDefaultNoticeKey = "Feature.Chat.Message.Default", 
    messageModeratedNoticeKey = "Feature.Chat.Message.MessageContentModerated", 
    networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    notImplementedMessageTypeKey = "Feature.Chat.Label.NotImplementedMessageType", 
    viewProfileOnAvatarPressed = true, 
    unknownUserTextKey = "Feature.Chat.Label.UnknownUser", 
    oneUserTyping = {
        "Feature.Chat.Message.OneUserTyping"; 
        DISPLAY_NAME = ""
    }, 
    twoUsersTyping = {
        "Feature.Chat.Message.TwoUsersTyping"; 
        DISPLAY_NAME_1 = "", 
        DISPLAY_NAME_2 = ""
    }, 
    severalUsersTyping = "Feature.Chat.Message.SeveralUsersTyping", 
    pendingStateBodyKey = "Feature.Chat.Message.ChatIsUnfiltered", 
    connectUnavailableWithUserKey = "Feature.Chat.RobloxConnectUnavailableWithUser", 
    chatUnavailableWithUserKey = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Message.PartyUnavailableWithUser" or "Feature.Chat.Message.ChatUnavailableWithUser", 
    getReadingMessagesIsEnabled = function() --[[ Line: 87 ]] --[[ Name: getReadingMessagesIsEnabled ]]

    end, 
    updateConversationTitle = function(_) --[[ Line: 88 ]] --[[ Name: updateConversationTitle ]]

    end, 
    navigateToScreen = function() --[[ Line: 89 ]] --[[ Name: navigateToScreen ]]

    end
};
ChatConversationContainer = function(v56) --[[ Line: 92 ]] --[[ Name: ChatConversationContainer ]]
    -- upvalues: v4 (copy), v55 (copy), v9 (copy), v41 (copy), v3 (copy), v8 (copy), v23 (copy), v16 (copy), v17 (copy), v31 (copy), l_HttpService_0 (copy), l_useLocalUserId_0 (copy), v33 (copy), v50 (copy), v39 (copy), v28 (copy), v30 (copy), v29 (copy), v24 (copy), v25 (copy), v10 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v38 (copy), l_GetFFlagAppChatInExperienceRenameToRobloxChat_0 (copy), v47 (copy), l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v32 (copy), v52 (copy), v14 (copy), l_useEffectOnMount_0 (copy), v40 (copy), v43 (copy), v48 (copy), v44 (copy), v35 (copy), l_getFFlagAppChatEnableConversationUnavailableUI_0 (copy), v11 (copy), v37 (copy), v42 (copy), v12 (copy), l_useSelector_0 (copy), v13 (copy), v45 (copy), v26 (copy), v27 (copy), l_dependencyArray_0 (copy), v34 (copy), v7 (copy), v6 (copy)
    local v57 = v4.Dictionary.join(v55, v56);
    local v58 = v9();
    local v59 = v41();
    local v61 = v3.useCallback(function(v60) --[[ Line: 96 ]]
        -- upvalues: v58 (copy), v8 (ref), v57 (copy)
        v58:navigate(v8.NavigationEvents.ChatConversationProfile);
        v57.openViewProfile(v60);
    end, {
        v57.openViewProfile, 
        v58
    });
    local v62 = v23(v16);
    local v63 = v17(v57.conversationId);
    local v64 = nil;
    local v65 = v31(v63);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 104 ]]
        -- upvalues: l_HttpService_0 (ref), v65 (copy)
        return l_HttpService_0:JSONEncode(v65);
    end);
    v64 = if l_status_0 then l_result_0 else "[]";
    local v68 = nil;
    local v69 = nil;
    local v70 = l_useLocalUserId_0();
    local v71 = v33();
    local v72 = if v50 then v39() else nil;
    v69 = v28.Hooks.useUserProfilesFetch({
        userIds = v30(v63, v70), 
        query = v28.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v73 = v28.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v70))
        }, 
        query = v28.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v68 = v29(v63, v69.data and v69.data.userProfiles, if v73.data then v28.Selectors.getCombinedNameFromId(v73.data, (tostring(v70))) else "");
    local v74 = v24();
    local v75 = v25(v57.conversationId);
    local v76 = v3.useRef({
        itemList = {}, 
        previousMessagesState = {}, 
        previousSendingMessagesState = {}, 
        previousMessagesResult = {}
    });
    local v77 = v3.useMemo(function() --[[ Line: 146 ]]
        -- upvalues: v76 (copy), v10 (ref), v63 (ref), v57 (copy), v74 (copy), v70 (copy)
        v76.current = v10({
            conversation = v63, 
            conversationId = v57.conversationId, 
            Users = v74, 
            localUserId = v70
        }, v76.current);
        return v76.current.itemList;
    end, {
        v63, 
        v57.conversationId, 
        v74, 
        v70
    });
    local v78 = if v75[1] and v69.data then v28.Selectors.getCombinedNameFromId(v69.data, v75[1].id) else nil;
    local v79 = if v75[2] and v69.data then v28.Selectors.getCombinedNameFromId(v69.data, v75[2].id) else nil;
    local v80 = l_GetFFlagEnableAppChatInExperience_0() and v38();
    local v81 = if v80 then not l_GetFFlagAppChatInExperienceRenameToRobloxChat_0() else l_GetFFlagEnableAppChatInExperience_0() and v47.default.variant.ShowPlatformChatNewTitleInUniversalApp;
    local v82 = l_useLocalization_0({
        chatInputPlaceholder = v57.chatInputPlaceholderKey, 
        invalidMessageTypeText = v57.notImplementedMessageTypeKey, 
        messageDefaultNoticeText = v57.messageDefaultNoticeKey, 
        messageModeratedNoticeText = v57.messageModeratedNoticeKey, 
        networkErrorText = v57.networkErrorTextKey, 
        unknownUserText = v57.unknownUserTextKey, 
        oneUserTyping = {
            "Feature.Chat.Message.OneUserTyping"; 
            DISPLAY_NAME = v78
        }, 
        twoUsersTyping = {
            "Feature.Chat.Message.TwoUsersTyping"; 
            DISPLAY_NAME_1 = v78, 
            DISPLAY_NAME_2 = v79
        }, 
        severalUsersTyping = v57.severalUsersTyping, 
        bottomModalText = if v81 then v57.connectUnavailableWithUserKey else v57.chatUnavailableWithUserKey
    });
    local v83 = l_useDispatch_0();
    local v84 = v63 and v63.moderationType or v4.None;
    local v85 = v63 and v63.userPendingStatus or v4.None;
    l_useEffect_0(function() --[[ Line: 196 ]]
        -- upvalues: v59 (copy), v84 (copy), v85 (copy)
        if v59 then
            v59.updateInfoForAllEvents({
                moderationType = v84, 
                userPendingStatus = v85
            });
        end;
    end, {
        v59, 
        v84, 
        v85
    });
    local v86 = v32(v63 or {});
    local v87 = v63 and v63.source;
    l_useEffect_0(function() --[[ Line: 207 ]]
        -- upvalues: v87 (copy), v52 (ref), v86 (copy), v83 (copy), v14 (ref), v57 (copy), v80 (copy)
        if v87 ~= "channels" then
            return;
        elseif v52() then
            if v86 then
                v83(v14.rodux.GetPendingStateModal.API(v57.conversationId, v80)):catch(function(v88) --[[ Line: 214 ]]
                    warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(v88));
                end);
                return;
            else
                v83(v14.rodux.GetConversationTopModal.API(v57.conversationId, v80)):catch(function(v89) --[[ Line: 220 ]]
                    warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(v89));
                end);
                return;
            end;
        else
            v83(v14.rodux.GetUnfilteredThreadsConversationBanner.API(v57.conversationId)):catch(function(v90) --[[ Line: 227 ]]
                warn("GetUnfilteredThreadsConversationBanner error in ChatConversationContainer " .. tostring(v90));
            end);
            return;
        end;
    end, {
        v57.conversationId, 
        v83, 
        v87
    });
    local v91 = nil;
    if v59 then
        l_useEffectOnMount_0(function() --[[ Line: 238 ]]
            -- upvalues: v59 (copy), v40 (ref), v57 (copy), v43 (ref), v77 (copy)
            v59.fireAnalyticsEvent(v40.ConversationScreenRendered, {
                conversationId = v57.conversationId, 
                loadedMessageCount = if v43() then #v77 else nil
            });
        end);
        v91 = function(v92) --[[ Line: 247 ]]
            -- upvalues: v59 (copy), v40 (ref), v57 (copy), v4 (ref)
            v59.fireAnalyticsEvent(v40.ConversationScreenExit, {
                conversationId = v57.conversationId, 
                conversationExitType = v92
            });
            v59.updateInfoForAllEvents({
                moderationType = v4.None, 
                userPendingStatus = v4.None
            });
        end;
    end;
    local v93 = nil;
    if not v48() and v44() then
        v93 = v35({
            isNearBottomOfScreen = true
        });
    end;
    v63 = v63 or {};
    local v94 = not l_getFFlagAppChatEnableConversationUnavailableUI_0() or v63.participantPendingStatus ~= v11.UserPendingStatus.Pending;
    local v95 = if l_getFFlagAppChatEnableConversationUnavailableUI_0() then not v94 else false;
    if l_getFFlagAppChatEnableConversationUnavailableUI_0() and v50 then
        v94 = v94 and v72;
        v95 = v95 and v72;
    end;
    local v96 = v37({
        v42.ViewUserProfile
    });
    local v97 = v63.conversationType == v12.Type.MULTI_USER_CONVERSATION;
    local v99 = l_useSelector_0(function(v98) --[[ Line: 286 ]]
        -- upvalues: v97 (copy), v63 (ref)
        return v97 and v63.initiator == v98.LocalUserId;
    end);
    local function v101(v100) --[[ Line: 291 ]]
        -- upvalues: v96 (copy), v42 (ref), v61 (copy), v57 (copy), v13 (ref), v86 (copy), v97 (copy), v99 (copy)
        if v96[v42.ViewUserProfile] then
            v61(v100);
            return;
        else
            v57.navigateToScreen(v13.ParticipantDialog, {
                conversationId = v57.conversationId, 
                participantId = v100, 
                showRemoveUserButton = not v86 and v97 and v99
            });
            return;
        end;
    end;
    local v102 = nil;
    local v103 = nil;
    if v45() then
        v102 = v26();
        v103 = v27();
    end;
    local l_chatInputPlaceholder_0 = v82.chatInputPlaceholder;
    l_useEffect_0(function() --[[ Line: 311 ]]
        -- upvalues: v57 (copy), v68 (ref)
        v57.updateConversationTitle(v68);
    end, l_dependencyArray_0(v68, v57.updateConversationTitle));
    local v105 = if v52() then nil else v34();
    if v86 then
        return v3.createElement(v7, {
            conversationId = v57.conversationId, 
            topBarHeight = v57.topBarHeight, 
            networkErrorText = v82.networkErrorText, 
            navigateToToast = v57.navigateToToast, 
            shouldShowPhoneVerificationUpsell = if v52() then nil else v105, 
            shouldShowIneligibleModal = if v52() then nil else not v105, 
            wideMode = v57.wideMode, 
            onConversationUnmount = v91, 
            navigateBack = v57.navigateBack, 
            style = v57.style
        });
    else
        return v3.createElement(v6, v4.Dictionary.join(v57, v62, v82, {
            conversation = v63, 
            conversationTitle = v68, 
            itemList = v77, 
            localUserId = v70, 
            openGameDetailsPage = v57.openGameDetailsPage, 
            openViewProfile = v101, 
            readingMessagesIsEnabled = v57.getReadingMessagesIsEnabled(), 
            Users = v74, 
            usersTyping = v75, 
            onConversationUnmount = v91, 
            recipientIdsSerialized = v64, 
            chatIsVisible = v71, 
            keyboardOffset = v93, 
            chatInputPlaceholder = l_chatInputPlaceholder_0, 
            replyingToMessage = v102, 
            replyingToMessageDispatch = v103, 
            shouldShowChatInputBar = v94, 
            shouldShowBottomModal = v95
        }));
    end;
end;
return l_UniversalAppPolicy_0.connect(function(v106) --[[ Line: 363 ]]
    return {
        viewProfileOnAvatarPressed = v106.getChatTapConversationThumbnail()
    };
end)(ChatConversationContainer);