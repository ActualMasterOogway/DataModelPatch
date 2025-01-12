local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(script.Parent.MessageList);
local v7 = require(script.Parent.ReplyComposeBarContainer);
local v8 = require(script.Parent.ChatInputBar);
local v9 = require(script.Parent.UserTypingIndicator);
local v10 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v13 = require(script.Parent.ConversationBanner.UnfilteredThreadsBannerContainer);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v15 = require(script.Parent.ConversationModal.ConversationModal);
local v16 = require(script.Parent.ConversationTopModalContainer);
local v17 = require(script.Parent.KeyboardOffsetEventHandler);
local _ = require(script.Parent.MessageInteraction.ReplyingContext.ReplyingToMessageContext);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_getFFlagAppChatEnableConversationUnavailableUI_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatEnableConversationUnavailableUI;
local v21 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationKeyboardOffsetCalculation);
local v22 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatOverhaulModals);
local v23 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v24 = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationExitType);
local v25 = require(l_script_FirstAncestor_0.Analytics.Enums.SendMessageError);
local v26 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v28 = game:DefineFastFlag("FixMessageListScrolling", false);
local v29 = v2.PureComponent:extend("ChatConversation");
v29.defaultProps = {
    topBarHeight = 0, 
    conversationId = nil, 
    conversationTitle = nil, 
    itemList = {}, 
    inputBoxRef = nil, 
    wideMode = false, 
    getOlderMessages = function() --[[ Line: 53 ]] --[[ Name: getOlderMessages ]]

    end, 
    isDebugEnabled = false, 
    sendMessage = function() --[[ Line: 55 ]] --[[ Name: sendMessage ]]

    end, 
    navigateToToast = function() --[[ Line: 56 ]] --[[ Name: navigateToToast ]]

    end, 
    markConversationAsRead = function() --[[ Line: 57 ]] --[[ Name: markConversationAsRead ]]

    end, 
    postTypingStatus = function() --[[ Line: 58 ]] --[[ Name: postTypingStatus ]]

    end, 
    navigateBack = function() --[[ Line: 59 ]] --[[ Name: navigateBack ]]

    end, 
    openViewProfile = function() --[[ Line: 60 ]] --[[ Name: openViewProfile ]]

    end, 
    updateConversationTitle = function() --[[ Line: 61 ]] --[[ Name: updateConversationTitle ]]

    end, 
    openGameDetailsPage = function() --[[ Line: 62 ]] --[[ Name: openGameDetailsPage ]]

    end, 
    navigateToScreen = function() --[[ Line: 63 ]] --[[ Name: navigateToScreen ]]

    end, 
    viewProfileOnAvatarPressed = true, 
    chatInputPlaceholder = "Say something", 
    usersTyping = {}, 
    invalidMessageTypeText = "PLACEHOLDER This message could not be displayed", 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    unknownUserText = "PLACEHOLDER unknown user", 
    oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...", 
    twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...", 
    severalUsersTyping = "PLACEHOLDER Several users are typing...", 
    bottomModalText = "PLACEHOLDER At this time, Chat is not available with this user.", 
    readingMessagesIsEnabled = true, 
    onConversationUnmount = function() --[[ Line: 77 ]] --[[ Name: onConversationUnmount ]]

    end, 
    chatIsVisible = true, 
    keyboardOffset = nil, 
    replyingToMessage = nil, 
    replyingToMessageDispatch = function(_) --[[ Line: 82 ]] --[[ Name: replyingToMessageDispatch ]]

    end, 
    shouldShowChatInputBar = true, 
    shouldShowBottomModal = false
};
v29.init = function(v31) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_UserInputService_0 (copy), v21 (copy), l_memoize_0 (copy), v10 (copy), v19 (copy), l_StatusCodes_0 (copy), v25 (copy), v23 (copy), l_DateTime_0 (copy), v24 (copy), v28 (copy)
    v31.state = {
        inputBarHeight = 0, 
        keyboardOffset = 0, 
        replyComposeBarHeight = 0, 
        conversationBannerHeight = 0, 
        messageListHeight = 0, 
        bottomModalHeight = 0
    };
    v31.inputBoxRef = v31.props.inputBoxRef or v2.createRef();
    v31.conversationViewRef = v2.createRef();
    v31.messageListRef = v2.createRef();
    v31.getKeyboardOffset = function() --[[ Line: 101 ]]
        -- upvalues: l_UserInputService_0 (ref), v31 (copy)
        if l_UserInputService_0.OnScreenKeyboardVisible and v31.inputBoxRef:getValue() and v31.inputBoxRef:getValue():IsFocused() then
            if v31.props.keyboardOffset ~= nil then
                return v31.props.keyboardOffset;
            else
                local v32 = v31.conversationViewRef:getValue();
                if v32 then
                    return v32.AbsolutePosition.Y + v32.AbsoluteSize.Y - l_UserInputService_0.OnScreenKeyboardPosition.Y;
                end;
            end;
        end;
        return 0;
    end;
    v31.updateKeyboardOffset = function() --[[ Line: 124 ]]
        -- upvalues: v31 (copy)
        if not v31.isMounted then
            return;
        else
            local v33 = v31.getKeyboardOffset();
            if v31.state.keyboardOffset ~= v33 then
                v31:setState({
                    keyboardOffset = v33
                });
            end;
            return;
        end;
    end;
    v31.onKeyboardOffsetChanged = v21() and function(v34) --[[ Line: 137 ]]
        -- upvalues: v31 (copy)
        if not v31.isMounted then
            return;
        else
            if not v31.inputBoxRef:getValue() or not v31.inputBoxRef:getValue():IsFocused() then
                v34 = 0;
            end;
            if v31.state.keyboardOffset ~= v34 then
                v31:setState({
                    keyboardOffset = v34
                });
            end;
            return;
        end;
    end or nil;
    v31.clearKeyboardOffset = function() --[[ Line: 155 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            keyboardOffset = 0
        });
    end;
    if not v21() then
        v31.keyboardConnections = {
            l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(v31.updateKeyboardOffset), 
            l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardPosition"):connect(v31.updateKeyboardOffset)
        };
    end;
    v31.loadNext = l_memoize_0(function(v35, v36) --[[ Line: 168 ]]
        -- upvalues: v31 (copy)
        return function() --[[ Line: 169 ]]
            -- upvalues: v35 (copy), v36 (copy), v31 (ref)
            local v37 = v35(v36);
            if v37 then
                v37:catch(function() --[[ Line: 172 ]]
                    -- upvalues: v31 (ref)
                    v31.showNetworkErrorToast();
                end);
            end;
        end;
    end);
    v31.markAsRead = l_memoize_0(function(v38, v39) --[[ Line: 179 ]]
        -- upvalues: v31 (copy)
        return function() --[[ Line: 180 ]]
            -- upvalues: v31 (ref), v38 (copy), v39 (copy)
            if v31.props.readingMessagesIsEnabled then
                v38(v39);
            end;
        end;
    end);
    v31.showNetworkErrorToast = function() --[[ Line: 187 ]]
        -- upvalues: v31 (copy)
        v31.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v31.props.networkErrorText
                }
            }
        });
    end;
    v31.onSendChat = l_memoize_0(function(v40, v41, v42, v43, v44, v45, v46) --[[ Line: 198 ]]
        -- upvalues: v10 (ref), v19 (ref), v31 (copy), l_StatusCodes_0 (ref), v25 (ref), v23 (ref), l_DateTime_0 (ref)
        return function(v47) --[[ Line: 207 ]]
            -- upvalues: v44 (copy), v10 (ref), v41 (ref), v45 (copy), v43 (copy), v46 (copy), v40 (copy), v19 (ref), v31 (ref), l_StatusCodes_0 (ref), v42 (copy), v25 (ref), v23 (ref), l_DateTime_0 (ref)
            if v44 and v44.source == "friends" then
                v10:info("Creating a conversation for friend conversation {} via onSendChat", v41);
                local v48, v49 = v45(v41, v43):await();
                if v48 and v49 then
                    v10:debug("Created conversation {} for friend conversation {} via onSendChat", v49.id, v41);
                    v41 = v49.id;
                    v46(v49.id);
                else
                    v10:error("Could not create conversation. Error: {}", (tostring(v49)));
                    return;
                end;
            end;
            v10:info("Sending message '{}' to conversationId {} via onSendChat", v47, v41);
            local v50 = v40(v41, v47, if v19() then v31.props.replyingToMessage else nil);
            if v50 then
                v50:andThen(function(v51) --[[ Line: 236 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v31 (ref), v42 (ref), v41 (ref)
                    if v51 and v51.StatusCode == l_StatusCodes_0.CONFLICT then
                        v31.showNetworkErrorToast();
                        return;
                    else
                        if v42 then
                            v42(v41);
                        end;
                        return;
                    end;
                end);
            elseif v42 then
                v42(v41);
            end;
            if v19() then
                v31.closeReplying();
            end;
            if v43 then
                local v52 = {
                    conversationId = v41, 
                    messageSentResult = v25.OtherFailure, 
                    recipientIds = v31.props.recipientIdsSerialized
                };
                if not v50 then
                    v43.fireAnalyticsEvent(v23.ConversationMessageSent, v52);
                    return;
                else
                    v50:andThen(function(v53) --[[ Line: 264 ]]
                        -- upvalues: v25 (ref), l_StatusCodes_0 (ref), v19 (ref), l_DateTime_0 (ref), v43 (ref), v23 (ref), v41 (ref), v31 (ref)
                        local v54 = nil;
                        local v55 = nil;
                        local v56 = nil;
                        local v57 = nil;
                        local v58 = nil;
                        local v59 = nil;
                        local v60 = v53 and v53.StatusCode;
                        if not v53 then
                            v54 = v25.NoResponse;
                        elseif v60 == l_StatusCodes_0.CONFLICT then
                            v54 = v25.Conflict;
                        elseif not v53.responseBody then
                            v54 = v25.NoResponseBody;
                        elseif not v53.responseBody.messages or #v53.responseBody.messages == 0 then
                            v54 = v25.NoMessages;
                        elseif not v53.responseBody.messages[1].status then
                            v54 = v25.NoMessageStatus;
                        else
                            v54 = v53.responseBody.messages[1].status;
                            v55 = v53.responseBody.messages[1].id;
                            if v19() and v53.responseBody.messages[1].replies_to then
                                local l_replies_to_0 = v53.responseBody.messages[1].replies_to;
                                v56 = l_replies_to_0.id;
                                v57 = l_replies_to_0.sender_user_id;
                                v58 = tostring(l_DateTime_0.fromIsoDate(l_replies_to_0.created_at).dateTime);
                                v59 = if l_replies_to_0.content then #l_replies_to_0.content else nil;
                            end;
                        end;
                        v43.fireAnalyticsEvent(v23.ConversationMessageSent, {
                            conversationId = v41, 
                            messageSentResult = v54, 
                            messageId = v55, 
                            recipientIds = v31.props.recipientIdsSerialized, 
                            targetMessageId = v56, 
                            targetMessageSenderId = v57, 
                            targetMessageSentAt = v58, 
                            targetMessageLength = v59
                        });
                    end):catch(function() --[[ Line: 317 ]]
                        -- upvalues: v43 (ref), v23 (ref), v52 (copy)
                        v43.fireAnalyticsEvent(v23.ConversationMessageSent, v52);
                    end);
                end;
            end;
        end;
    end);
    v31.onSendBtnClicked = l_memoize_0(function(v62) --[[ Line: 325 ]]
        -- upvalues: v23 (ref), v31 (copy)
        if v62 then
            return function(v63) --[[ Line: 329 ]]
                -- upvalues: v62 (copy), v23 (ref), v31 (ref)
                v62.fireAnalyticsEvent(v23.ConversationSendBtnClicked, {
                    conversationId = v31.props.conversationId, 
                    sendBtnClickResult = v63
                });
            end;
        else
            return nil;
        end;
    end);
    v31.onHeightChanged = function(v64) --[[ Line: 339 ]]
        -- upvalues: v31 (copy)
        v31:setState(function(v65, _) --[[ Line: 340 ]]
            -- upvalues: v64 (copy)
            if v64 ~= v65.inputBarHeight then
                return {
                    inputBarHeight = v64
                };
            else
                return {};
            end;
        end);
    end;
    v31.lastTypingRequest = 0;
    v31.chatInputTextChanged = function() --[[ Line: 350 ]]
        -- upvalues: v31 (copy)
        if v31.props.conversation and v31.props.conversation.source == "friends" then
            return;
        else
            local v67 = tick();
            if v67 - v31.lastTypingRequest >= 3 then
                v31.lastTypingRequest = v67;
                v31.props.postTypingStatus(v31.props.conversationId, true);
            end;
            return;
        end;
    end;
    v31.exitTypeForAnalytics = v24.Default;
    v31.onTouchSwipe = function(_, v69, v70) --[[ Line: 365 ]]
        -- upvalues: v31 (copy), v24 (ref)
        if not v31.props.wideMode and v69 == Enum.SwipeDirection.Right and v70 == 1 then
            v31.exitTypeForAnalytics = v24.SwipedRight;
            v31.props.navigateBack();
        end;
    end;
    v31.fireAnalyticsEventOnUnmount = function() --[[ Line: 372 ]]
        -- upvalues: v31 (copy), v24 (ref)
        v31.props.onConversationUnmount(v31.exitTypeForAnalytics);
        v31.exitTypeForAnalytics = v24.Default;
    end;
    v31.closeKeyboard = function() --[[ Line: 379 ]]
        -- upvalues: v31 (copy)
        if v31.inputBoxRef:getValue() then
            v31.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    if v19() then
        v31.closeReplying = function() --[[ Line: 386 ]]
            -- upvalues: v31 (copy)
            v31.props.replyingToMessageDispatch(nil);
        end;
    end;
    v31.onSizeChange = function() --[[ Line: 391 ]]
        -- upvalues: v31 (copy)
        v31.updateKeyboardOffset();
    end;
    v31.calculateScrollOffset = function(v71) --[[ Line: 395 ]]
        local l_Y_0 = v71.CanvasPosition.Y;
        local l_Y_1 = v71.AbsoluteCanvasSize.Y;
        local l_Y_2 = v71.AbsoluteWindowSize.Y;
        return l_Y_1 - l_Y_0 - l_Y_2;
    end;
    v31.setBannerHeight = function(v75) --[[ Line: 402 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            conversationBannerHeight = v75
        });
    end;
    v31.setBottomModalHeight = function(v76) --[[ Line: 408 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            bottomModalHeight = v76
        });
    end;
    if v19() then
        v31.setReplyComposeBarHeight = function(v77) --[[ Line: 415 ]]
            -- upvalues: v31 (copy)
            v31:setState({
                replyComposeBarHeight = v77
            });
        end;
    end;
    if v28 then
        v31.onMessageListSizeChange = function(v78) --[[ Line: 423 ]]
            -- upvalues: v31 (copy)
            v31:setState({
                messageListHeight = v78.AbsoluteSize.Y
            });
        end;
    end;
end;
v29.didMount = function(v79) --[[ Line: 431 ]] --[[ Name: didMount ]]
    v79.isMounted = true;
    v79.markAsRead(v79.props.markConversationAsRead, v79.props.conversationId)();
end;
v29.willUpdate = function(v80, v81, _) --[[ Line: 436 ]] --[[ Name: willUpdate ]]
    if v81.chatIsVisible ~= v80.props.chatIsVisible and not v81.chatIsVisible then
        v80.closeKeyboard();
    end;
end;
v29.didUpdate = function(v83, v84, v85) --[[ Line: 442 ]] --[[ Name: didUpdate ]]
    -- upvalues: v19 (copy), v28 (copy)
    if v84.conversationId ~= v83.props.conversationId then
        if v83.inputBoxRef:getValue() then
            v83.inputBoxRef:getValue().Text = "";
            v83.inputBoxRef:getValue():ReleaseFocus();
        end;
        if v19() then
            v83.closeReplying();
        end;
        v83.markAsRead(v83.props.markConversationAsRead, v83.props.conversationId, false)();
    end;
    if v28 then
        local v86 = v83.messageListRef and v83.messageListRef.current and v83.messageListRef.current._listRef;
        local v87 = v86 and v86._scrollRef and v86._scrollRef.getNativeScrollRef();
        local v88 = v83.state.messageListHeight - v85.messageListHeight;
        if v86 and v87 and v85.messageListHeight ~= 0 and v88 ~= 0 then
            local v89 = v83.calculateScrollOffset(v87._nativeRef.current);
            if v89 <= 0 then
                return;
            else
                v86:scrollToOffset({
                    offset = v89 + v88
                });
            end;
        end;
    end;
    if not v28 and (v83.state.keyboardOffset ~= v85.keyboardOffset or v83.state.inputBarHeight ~= v85.inputBarHeight or v19() and v83.state.replyComposeBarHeight ~= v85.replyComposeBarHeight or v83.state.conversationBannerHeight ~= v85.conversationBannerHeight) then
        local v90 = v83.messageListRef and v83.messageListRef.current and v83.messageListRef.current._listRef;
        local v91 = v90 and v90._scrollRef and v90._scrollRef.getNativeScrollRef();
        if v90 and v91 then
            local v92 = v83.state.keyboardOffset - v85.keyboardOffset;
            local v93 = if v19() then v83.state.replyComposeBarHeight - v85.replyComposeBarHeight else 0;
            local v94 = v83.state.conversationBannerHeight - v85.conversationBannerHeight;
            local v95 = v83.state.inputBarHeight - v85.inputBarHeight;
            local v96 = v83.calculateScrollOffset(v91._nativeRef.current);
            v90:scrollToOffset({
                offset = v96 - v92 - v95 - (if v96 ~= 0 then v93 else 0) - v94
            });
        end;
    end;
end;
v29.willUnmount = function(v97) --[[ Line: 538 ]] --[[ Name: willUnmount ]]
    -- upvalues: v21 (copy), v19 (copy)
    if not v21() then
        for _, v99 in ipairs(v97.keyboardConnections) do
            v99:Disconnect();
        end;
    end;
    v97.fireAnalyticsEventOnUnmount();
    if v19() then
        v97.closeReplying();
    end;
    v97.keyboardConnections = {};
    v97.isMounted = false;
end;
v29.render = function(v100) --[[ Line: 554 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), l_withStyle_0 (copy), v2 (copy), v27 (copy), v21 (copy), v17 (copy), v22 (copy), v13 (copy), v16 (copy), v19 (copy), v6 (copy), v9 (copy), v7 (copy), l_getFFlagAppChatEnableConversationUnavailableUI_0 (copy), v8 (copy), v15 (copy)
    local v101 = #v100.props.usersTyping > 0;
    local v102 = if v100.props.conversation then v100.props.conversation.source == "friends" else false;
    local v103 = "MessageList" .. tostring(v100.props.conversationId);
    return v26(function(v104) --[[ Line: 565 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v27 (ref), v21 (ref), v100 (copy), v17 (ref), v22 (ref), v13 (ref), v16 (ref), v19 (ref), v103 (copy), v6 (ref), v102 (copy), v101 (copy), v9 (ref), v7 (ref), l_getFFlagAppChatEnableConversationUnavailableUI_0 (ref), v8 (ref), v15 (ref)
        return l_withStyle_0(function(v105) --[[ Line: 566 ]]
            -- upvalues: v2 (ref), v27 (ref), v21 (ref), v100 (ref), v17 (ref), v22 (ref), v13 (ref), v16 (ref), v19 (ref), v103 (ref), v6 (ref), v102 (ref), v101 (ref), v9 (ref), v7 (ref), l_getFFlagAppChatEnableConversationUnavailableUI_0 (ref), v8 (ref), v104 (copy), v15 (ref)
            return v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v105.Theme.BackgroundDefault.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                Transparency = if v27() then v105.Tokens.Global.Color.None.Transparency else v105.Theme.BackgroundDefault.Transparency, 
                [v2.Change.AbsoluteSize] = if not v21() then v100.onSizeChange else nil, 
                [v2.Event.TouchSwipe] = v100.onTouchSwipe, 
                [v2.Event.TouchTap] = v100.closeKeyboard, 
                [v2.Event.MouseButton1Down] = v100.closeKeyboard, 
                [v2.Ref] = v100.conversationViewRef
            }, {
                KeyboardOffsetEventHandler = if v21() then v2.createElement(v17, {
                    onKeyboardOffsetChanged = v100.onKeyboardOffsetChanged, 
                    parentViewRef = v100.conversationViewRef
                }) else nil, 
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ConversationBanner = if v22() then nil else v2.createElement(v13, {
                    conversation = v100.props.conversation, 
                    navigateToScreen = v100.props.navigateToScreen, 
                    setBannerHeight = v100.setBannerHeight, 
                    layoutOrder = 1
                }), 
                ConversationTopModal = if v22() then v2.createElement(v16, {
                    conversation = v100.props.conversation, 
                    navigateToScreen = v100.props.navigateToScreen, 
                    setModalHeight = v100.setBannerHeight, 
                    layoutOrder = 1
                }) else nil, 
                MessageListFrame = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    [v2.Change.AbsoluteSize] = v100.onMessageListSizeChange, 
                    Size = UDim2.new(1, 0, 1, -v100.state.inputBarHeight - v100.state.keyboardOffset - (if v19() then v100.state.replyComposeBarHeight else 0) - v100.state.conversationBannerHeight - v100.state.bottomModalHeight)
                }, {
                    [v103] = v2.createElement(v6, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        bottomMargin = 28, 
                        conversationId = v100.props.conversationId, 
                        isDebugEnabled = v100.props.isDebugEnabled, 
                        itemList = v100.props.itemList, 
                        loadNext = if v102 then nil else v100.loadNext(v100.props.getOlderMessages, v100.props.conversationId), 
                        localUserId = v100.props.localUserId, 
                        markAsRead = v100.markAsRead(v100.props.markConversationAsRead, v100.props.conversationId), 
                        messageListRef = v100.messageListRef, 
                        openViewProfile = v100.props.openViewProfile, 
                        onDetailsOpened = v100.closeKeyboard, 
                        closeKeyboard = if v19() then v100.closeKeyboard else nil, 
                        inputBoxRef = if v19() then v100.inputBoxRef else nil, 
                        wideMode = v100.props.wideMode, 
                        viewProfileOnAvatarPressed = v100.props.viewProfileOnAvatarPressed, 
                        readingMessagesIsEnabled = v100.props.readingMessagesIsEnabled, 
                        invalidMessageTypeText = v100.props.invalidMessageTypeText, 
                        messageDefaultNoticeText = v100.props.messageDefaultNoticeText, 
                        messageModeratedNoticeText = v100.props.messageModeratedNoticeText, 
                        unknownUserText = v100.props.unknownUserText, 
                        openGameDetailsPage = v100.props.openGameDetailsPage
                    }), 
                    UserTypingIndicator = v101 and v2.createElement(v9, {
                        AnchorPoint = Vector2.new(0, 1), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        ZIndex = 2, 
                        height = 28, 
                        usersTyping = v100.props.usersTyping, 
                        oneUserTyping = v100.props.oneUserTyping, 
                        twoUsersTyping = v100.props.twoUsersTyping, 
                        severalUsersTyping = v100.props.severalUsersTyping
                    })
                }), 
                ReplyComposeBar = if v19() and v100.props.replyingToMessage then v2.createElement(v7, {
                    LayoutOrder = 3, 
                    message = v100.props.replyingToMessage, 
                    close = v100.closeReplying, 
                    setReplyComposeBarHeight = v100.setReplyComposeBarHeight, 
                    inputBoxRef = v100.inputBoxRef
                }) else nil, 
                ChatInputBar = if not l_getFFlagAppChatEnableConversationUnavailableUI_0() or v100.props.shouldShowChatInputBar then v2.createElement(v8, {
                    LayoutOrder = 4, 
                    onFocusLost = v100.clearKeyboardOffset, 
                    conversationId = v100.props.conversationId, 
                    inputBoxRef = v100.inputBoxRef, 
                    localUserId = v100.props.localUserId, 
                    messageListRef = v100.messageListRef, 
                    onHeightChanged = v100.onHeightChanged, 
                    onSendChat = v100.onSendChat(v100.props.sendMessage, v100.props.conversationId, v100.props.markConversationAsRead, v104, v100.props.conversation, v100.props.createFriendConversation, v100.props.navigateToChatConversation), 
                    onSendBtnClicked = v100.onSendBtnClicked(v104), 
                    onTextChanged = v100.chatInputTextChanged, 
                    placeholderText = v100.props.chatInputPlaceholder
                }) else nil, 
                BottomModal = if l_getFFlagAppChatEnableConversationUnavailableUI_0() and v100.props.shouldShowBottomModal then v2.createElement(v15, {
                    layoutOrder = 5, 
                    onHeightChanged = v100.setBottomModalHeight, 
                    bodyText = v100.props.bottomModalText
                }) else nil
            });
        end);
    end);
end;
return v29;