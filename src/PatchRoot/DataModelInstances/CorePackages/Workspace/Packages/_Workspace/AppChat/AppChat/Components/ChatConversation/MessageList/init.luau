local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v7 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v8 = require(script.Parent.ChatMessage);
local v9 = require(script.Parent.SystemMessage);
local v10 = require(script.Parent.SystemMessageContainer);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
local v14 = game:DefineFastFlag("AppChatMessageListInitialFetch", false);
local v15 = game:DefineFastInt("AppChatMessageInitialFetchMinMessages", 20);
local v16 = game:DefineFastInt("AppChatInitialMessageFetchLimit", 10);
local v17 = v2.PureComponent:extend("MessageList");
v17.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    autoScrollMaxIndex = 3, 
    bottomMargin = 10, 
    conversationId = nil, 
    initialFocusIndex = 1, 
    isDebugEnabled = false, 
    itemList = {}, 
    loadNext = function() --[[ Line: 36 ]] --[[ Name: loadNext ]]

    end, 
    markAsRead = function() --[[ Line: 37 ]] --[[ Name: markAsRead ]]

    end, 
    messageListRef = nil, 
    onDetailsOpened = function() --[[ Line: 39 ]] --[[ Name: onDetailsOpened ]]

    end, 
    openGameDetailsPage = function(_, _) --[[ Line: 40 ]] --[[ Name: openGameDetailsPage ]]

    end, 
    openViewProfile = nil, 
    wideMode = false, 
    viewProfileOnAvatarPressed = true, 
    closeKeyboard = function() --[[ Line: 44 ]] --[[ Name: closeKeyboard ]]

    end, 
    inputBoxRef = nil, 
    invalidMessageTypeText = "PLACEHOLDER This message could not be displayed", 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user"
};
local function v22(v20, v21) --[[ Line: 53 ]] --[[ Name: compareItemData ]]
    if v20 == nil or v21 == nil then
        return false;
    else
        return v20.stable_key ~= nil and v20.stable_key == v21.stable_key or v20.messageId ~= nil and v20.messageId == v21.messageId;
    end;
end;
v17.init = function(v23) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v11 (copy), v10 (copy), l_GetFFlagEnableSocialCards_0 (copy), v8 (copy), v7 (copy), v12 (copy), v9 (copy)
    v23.state = {
        width = 0, 
        startIndex = 1, 
        firstItem = v23.props.itemList[1]
    };
    v23.focusIndex = v23.props.initialFocusIndex;
    v23.isValidMessageAndSenderType = function(v24, v25) --[[ Line: 71 ]]
        -- upvalues: v5 (ref), v6 (ref)
        if v25 == v5.SenderTypes.System then
            return v24 == v6.System;
        elseif v25 == v5.SenderTypes.User then
            local v26 = true;
            if v24 ~= v6.PlainText then
                v26 = v24 == v6.Link;
            end;
            return v26;
        else
            return false;
        end;
    end;
    v23.isValidMessageType = function(v27) --[[ Line: 81 ]]
        -- upvalues: v6 (ref)
        local v28 = true;
        if v27 ~= v6.PlainText then
            v28 = v27 == v6.Link;
        end;
        return v28;
    end;
    v23.ref = v23.props.messageListRef or v2.createRef();
    v23.renderItem = function(v29) --[[ Line: 87 ]]
        -- upvalues: v11 (ref), v23 (copy), v2 (ref), v6 (ref), v10 (ref), l_GetFFlagEnableSocialCards_0 (ref), v8 (ref), v7 (ref), v12 (ref), v9 (ref)
        if if v11() then v23.isValidMessageAndSenderType(v29.messageType, v29.senderType) else v23.isValidMessageType(v29.messageType) then
            local v30 = v23.props.isDebugEnabled and v2.createElement("StringValue", {
                Value = tostring(v29.messageId)
            });
            if v11() and v29.messageType == v6.System then
                return v2.createElement(v10, {
                    cards = if l_GetFFlagEnableSocialCards_0() then v29.cards else nil, 
                    text = v29.content, 
                    parentWidth = v23.state.width, 
                    sent = v29.sent, 
                    showDateTime = v29.showDateTime, 
                    messageId = v29.messageId, 
                    senderTargetId = if l_GetFFlagEnableSocialCards_0() then v29.senderTargetId else nil, 
                    debugElement = v30
                });
            else
                local l_additionalProps_0 = v29.additionalProps;
                if l_additionalProps_0 then
                    l_additionalProps_0.onDetailsOpened = v23.props.onDetailsOpened;
                end;
                if not l_additionalProps_0 then
                    l_additionalProps_0 = {};
                end;
                l_additionalProps_0.openGameDetailsPage = v23.props.openGameDetailsPage;
                return v2.createElement(v8, {
                    additionalProps = l_additionalProps_0, 
                    content = v29.content, 
                    debugElement = v30, 
                    failed = v29.failed, 
                    filteredForReceivers = v29.filteredForReceivers, 
                    isIncoming = v29.isIncoming, 
                    isNewSender = v29.isNewSender, 
                    isSending = v29.isSending, 
                    isUnfiltered = v29.moderationType == v7.ModerationTypes.TrustedComms, 
                    messageDefaultNoticeText = v23.props.messageDefaultNoticeText, 
                    conversationId = if v12() then v29.conversationId else nil, 
                    messageId = v29.messageId, 
                    messageModeratedNoticeText = v23.props.messageModeratedNoticeText, 
                    messageType = v29.messageType, 
                    moderated = v29.moderated, 
                    openViewProfile = v23.props.openViewProfile, 
                    parentWidth = v23.state.width, 
                    readingMessagesIsEnabled = true, 
                    senderUserId = if v12() then v29.senderTargetId else v29.sender.id, 
                    sent = v29.sent, 
                    showDateTime = v29.showDateTime, 
                    showDisplayName = v29.showDisplayName, 
                    shouldShowName = v29.sender.shouldShowName, 
                    thumbnail = v29.sender.thumbnail, 
                    wideMode = v23.props.wideMode, 
                    unknownUserText = v23.props.unknownUserText, 
                    viewProfileOnAvatarPressed = v23.props.viewProfileOnAvatarPressed, 
                    closeKeyboard = if v12() then v23.props.closeKeyboard else nil, 
                    inputBoxRef = if v12() then v23.props.inputBoxRef else nil, 
                    repliesTo = if v12() then v29.repliesTo else nil
                });
            end;
        else
            return v2.createElement(v9, {
                Text = v23.props.invalidMessageTypeText
            });
        end;
    end;
    v23.updateWidth = function(v32) --[[ Line: 162 ]]
        -- upvalues: v23 (copy)
        if v32.AbsoluteSize.X ~= v23.state.width then
            v23:setState({
                width = v32.AbsoluteSize.X
            });
        end;
    end;
    v23.changeFocus = function(v33) --[[ Line: 169 ]]
        -- upvalues: v23 (copy)
        v23.isNearBottom = v33.anchorIndex <= v23.props.autoScrollMaxIndex + 1;
        v23.focusIndex = v23.isNearBottom and 1 or v33.anchorIndex + 1;
        if v33.anchorIndex == 1 and not v23.props.itemList[1].read then
            v23.props.markAsRead();
        end;
    end;
    v23.identifier = function(v34) --[[ Line: 181 ]]
        return v34.messageId .. "|" .. (v34.position or "");
    end;
    v23.getScrollRef = function() --[[ Line: 185 ]]
        -- upvalues: v23 (copy)
        if v23.ref.current == nil then
            return nil;
        else
            local v35 = v23.ref.current._listRef._scrollRef.getNativeScrollRef();
            if v35 == nil then
                return nil;
            else
                return v35._nativeRef.current;
            end;
        end;
    end;
    v23.calculateScrollOffset = function(v36) --[[ Line: 198 ]]
        local l_Y_0 = v36.CanvasPosition.Y;
        local l_Y_1 = v36.AbsoluteCanvasSize.Y;
        local l_Y_2 = v36.AbsoluteWindowSize.Y;
        return l_Y_1 - l_Y_0 - l_Y_2;
    end;
    v23.onScroll = function(v40) --[[ Line: 206 ]]
        -- upvalues: v23 (copy)
        local v41 = v23.calculateScrollOffset(v40);
        if v41 < 512 then
            v23:setState(function(_, v43) --[[ Line: 209 ]]
                return {
                    firstItem = v43.itemList[1]
                };
            end);
        end;
        if v41 < 64 then
            v23.props.markAsRead();
        end;
        v23.isNearBottom = v41 < 64;
    end;
    v23.initialFetchesAttempted = 0;
end;
v17.getDerivedStateFromProps = function(v44, v45) --[[ Line: 225 ]] --[[ Name: getDerivedStateFromProps ]]
    if v45.firstItem == nil then
        return {
            startIndex = 1
        };
    else
        local v46 = 1;
        while v46 <= #v44.itemList do
            local v47 = v44.itemList[v46];
            local l_firstItem_0 = v45.firstItem;
            if not (v47 ~= nil and not (l_firstItem_0 == nil) and (v47.stable_key ~= nil and v47.stable_key == l_firstItem_0.stable_key or v47.messageId ~= nil and v47.messageId == l_firstItem_0.messageId)) then
                v46 = v46 + 1;
            else
                break;
            end;
        end;
        if #v44.itemList < v46 then
            return {
                startIndex = 1
            };
        else
            return {
                startIndex = v46
            };
        end;
    end;
end;
v17.didUpdate = function(v49, v50, _) --[[ Line: 250 ]] --[[ Name: didUpdate ]]
    -- upvalues: v14 (copy), v16 (copy), v15 (copy)
    if not v14 and #v49.props.itemList < 30 and v49.props.loadNext and #v49.props.itemList ~= #v50.itemList then
        v49.props.loadNext();
    end;
    if v14 and v49.props.itemList and v49.props.itemList ~= v50.itemList and v49.initialFetchesAttempted < v16 and #v49.props.itemList < v15 and v49.props.loadNext then
        v49.initialFetchesAttempted = v49.initialFetchesAttempted + 1;
        v49.props.loadNext();
    end;
    if v50.conversationId ~= v49.props.conversationId then
        v49.isNearBottom = true;
    end;
    local v52 = v49.getScrollRef();
    if (if v52 ~= nil then v49.calculateScrollOffset(v52) else 0) < 64 then
        v49.isNearBottom = true;
        if #v49.props.itemList > 0 then
            v49.props.markAsRead();
        end;
    end;
    if v50.readingMessagesIsEnabled ~= v49.props.readingMessagesIsEnabled and v49.props.readingMessagesIsEnabled and v49.isNearBottom then
        v49.props.markAsRead();
    end;
end;
v17.didMount = function(v53) --[[ Line: 296 ]] --[[ Name: didMount ]]
    -- upvalues: v15 (copy)
    if #v53.props.itemList < v15 and v53.props.loadNext then
        v53.props.loadNext();
    end;
    v53.isNearBottom = true;
end;
v17.renderScrollingFrame = function(v54) --[[ Line: 303 ]] --[[ Name: renderScrollingFrame ]]
    -- upvalues: v2 (copy), l_BidirectionalFlatList_0 (copy), v4 (copy), v22 (copy)
    local v55 = false;
    local v56 = {};
    local l_startIndex_0 = v54.state.startIndex;
    if l_startIndex_0 ~= 1 then
        local v58 = v54.getScrollRef();
        if (if v58 ~= nil then v54.calculateScrollOffset(v58) else 0) < 128 then
            l_startIndex_0 = 1;
        end;
    end;
    if l_startIndex_0 ~= 1 then
        local v59 = v54.props.itemList[1];
        local l_firstItem_1 = v54.state.firstItem;
        if v59 == nil or l_firstItem_1 == nil or (v59.stable_key == nil or v59.stable_key ~= l_firstItem_1.stable_key) and (v59.messageId == nil or v59.messageId ~= l_firstItem_1.messageId) then
            table.move(v54.props.itemList, l_startIndex_0, #v54.props.itemList, 1, v56);
            v55 = true;
        end;
    end;
    if not v55 then
        v56 = v54.props.itemList;
    end;
    v55 = false;
    return v2.createElement(l_BidirectionalFlatList_0, {
        data = v56, 
        renderItem = function(v61) --[[ Line: 323 ]] --[[ Name: renderItem ]]
            -- upvalues: v54 (copy)
            return v54.renderItem(v61.item);
        end, 
        inverted = true, 
        Size = v54.props.Size, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            Name = "MessageList"
        }, 
        contentContainerStyle = {
            BackgroundTransparency = 1
        }, 
        keyExtractor = function(v62, v63) --[[ Line: 337 ]] --[[ Name: keyExtractor ]]
            return v62.stable_key or v62.messageId or v63;
        end, 
        windowSize = 5, 
        initialNumToRender = 30, 
        onScroll = v54.onScroll, 
        onEndReached = function() --[[ Line: 344 ]] --[[ Name: onEndReached ]]
            -- upvalues: v54 (copy), v4 (ref)
            v54.props.loadNext();
            return v4.resolve();
        end, 
        onEndReachedThreshold = 300, 
        onStartReachedThreshold = 64, 
        compareItemData = v22, 
        scrollEventThrottle = v54.props.scrollEventThrottle or 75, 
        [v2.Ref] = v54.ref, 
        autoscrollToTopThreshold = 33, 
        enableAutoscrollToTop = true, 
        ListHeaderComponent = function() --[[ Line: 355 ]] --[[ Name: ListHeaderComponent ]]
            -- upvalues: v2 (ref)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 10)
            });
        end, 
        showDefaultLoadingIndicators = false, 
        onContentSizeChange = function(v64, _) --[[ Line: 362 ]] --[[ Name: onContentSizeChange ]]
            -- upvalues: v54 (copy)
            v54:setState({
                width = v64
            });
        end, 
        optimizeInvertedCanvasResize = true, 
        UNSTABLE_forceSiblingLayoutUpdate = true
    });
end;
v17.renderEmptyMessageList = function(v66) --[[ Line: 372 ]] --[[ Name: renderEmptyMessageList ]]
    -- upvalues: v2 (copy)
    return v2.createElement("Frame", {
        Size = v66.props.Size, 
        BackgroundTransparency = 1
    });
end;
v17.render = function(v67) --[[ Line: 379 ]] --[[ Name: render ]]
    if #v67.props.itemList ~= 0 then
        return (v67:renderScrollingFrame());
    else
        return (v67:renderEmptyMessageList());
    end;
end;
return v17;