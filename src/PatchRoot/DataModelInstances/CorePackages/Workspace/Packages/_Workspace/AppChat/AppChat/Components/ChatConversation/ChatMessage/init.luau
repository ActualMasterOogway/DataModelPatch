local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.OptionsConstants);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v9 = require(script.Parent.PlainTextAutomaticSize);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v11 = require(script.Parent.AssetCardTempAutomaticSize);
local v12 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v13 = require(script.Parent.ChatMessageContainerAutomaticSize);
local v14 = require(script.Parent.Logger);
local l_pruneConsecutiveNewLines_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.pruneConsecutiveNewLines;
local v16 = {
    [v12.PlainText] = {
        component = v9, 
        name = "PlainText", 
        paddingOffset = 0
    }, 
    [v12.Link] = {
        component = v11, 
        name = "AssetCard", 
        paddingOffset = 2
    }
};
local v17 = v4.PureComponent:extend("ChatMessage");
v17.defaultProps = {
    additionalProps = {
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function() --[[ Line: 48 ]] --[[ Name: onDetailsOpened ]]

        end, 
        openGameDetailsPage = function() --[[ Line: 49 ]] --[[ Name: openGameDetailsPage ]]

        end
    }, 
    conversationId = nil, 
    BackgroundColor3 = nil, 
    content = "", 
    debugElement = nil, 
    displayName = nil, 
    failed = false, 
    filteredForReceivers = false, 
    isIncoming = false, 
    isNewSender = false, 
    isSending = false, 
    isUnfiltered = false, 
    messageType = nil, 
    moderated = false, 
    parentWidth = 0, 
    senderUserId = nil, 
    sent = nil, 
    showDateTime = false, 
    thumbnail = nil, 
    Transparency = nil, 
    wideMode = false, 
    viewProfileOnAvatarPressed = true, 
    closeKeyboard = function() --[[ Line: 72 ]] --[[ Name: closeKeyboard ]]

    end, 
    inputBoxRef = nil, 
    repliesTo = nil, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user"
};
v17.init = function(v18) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), l_Text_0 (copy)
    v18.getModeratedText = function(v19) --[[ Line: 82 ]]
        return string.gsub(v19, "[^%s]", "#");
    end;
    v18.messageMaxWidth = function(v20, v21) --[[ Line: 86 ]]
        local v22 = 128;
        if v20 then
            v22 = v22 + 112;
        end;
        return v21 - v22;
    end;
    v18.getBubbleMaxWidth = l_memoize_0(function(v23, v24, v25, v26) --[[ Line: 96 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextBounds(v24, v26, v25, Vector2.new(v23, 10000)).X + 20;
    end);
end;
v17.render = function(v27) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v14 (copy), l_pruneConsecutiveNewLines_0 (copy), v8 (copy), l_withStyle_0 (copy), v4 (copy), v13 (copy), v2 (copy), v3 (copy), v6 (copy)
    local v28 = v16[v27.props.messageType];
    local v29 = v27.messageMaxWidth(v27.props.wideMode, v27.props.parentWidth);
    if not v28 then
        v14:warning("ChatMessage doesn't support messageType: {}", v27.props.messageType);
        return nil;
    else
        local l_content_0 = v27.props.content;
        l_content_0 = l_pruneConsecutiveNewLines_0(l_content_0);
        local v31 = v27.props.moderated and v27.getModeratedText(l_content_0) or l_content_0;
        local v32 = v8() and v27.props.repliesTo and v27.props.repliesTo.messageType and v27.props.repliesTo.content;
        return l_withStyle_0(function(v33) --[[ Line: 123 ]]
            -- upvalues: v4 (ref), v13 (ref), v2 (ref), v27 (copy), v29 (copy), v28 (copy), v8 (ref), v31 (copy), v3 (ref), v32 (copy), v16 (ref), v6 (ref)
            local l_Body_0 = v33.Font.Body;
            local v35 = v33.Font.BaseSize * l_Body_0.RelativeSize;
            local l_BodySmall_0 = v33.Font.BodySmall;
            local v37 = v33.Font.BaseSize * l_BodySmall_0.RelativeSize;
            return v4.createElement(v13, v2.Dictionary.join(v27.props, {
                messageMaxWidth = v29, 
                messageTypePaddingOffset = v28.paddingOffset, 
                messageId = v27.props.messageId, 
                isPending = if v8() then v27.props.isSending or v27.props.moderated or v27.props.failed else nil, 
                renderMessage = not v8() and function(v38) --[[ Line: 142 ]]
                    -- upvalues: v4 (ref), v28 (ref), v2 (ref), v27 (ref), l_Body_0 (copy), v29 (ref), v31 (ref), v35 (copy)
                    return v4.createFragment({
                        [v28.name] = v4.createElement(v28.component, v2.Dictionary.join({
                            additionalProps = v27.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = v27.props.isNewSender, 
                            innerPadding = 10, 
                            isIncoming = v27.props.isIncoming, 
                            isPending = v27.props.isSending or v27.props.moderated or v27.props.failed, 
                            isUnfiltered = v27.props.isUnfiltered, 
                            maxWidth = v27.getBubbleMaxWidth(v29, v31, v35, l_Body_0.Font), 
                            messageDefaultNoticeText = v27.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v27.props.messageModeratedNoticeText, 
                            parentWidth = v27.props.parentWidth, 
                            text = v31, 
                            textSize = v35, 
                            wideMode = v27.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v27.messageSizeChanged
                        }, v38 or {}))
                    });
                end or function(v39, v40) --[[ Line: 174 ]]
                    -- upvalues: v3 (ref), v2 (ref), v27 (ref), v32 (ref), v4 (ref), v16 (ref), l_Body_0 (copy), v29 (ref), v37 (copy), l_BodySmall_0 (copy), v6 (ref), v28 (ref), v31 (ref), v35 (copy)
                    return v3.createElement("ImageButton", v2.Dictionary.join({
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1
                    }, v39 or {}), {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = if v27.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
                            Padding = UDim.new(0, 10)
                        }), 
                        repliesTo = if v32 then v4.createElement(v16[v27.props.repliesTo.messageType].component, {
                            additionalProps = v27.props.additionalProps, 
                            font = l_Body_0.Font, 
                            hasTail = false, 
                            innerPadding = 10, 
                            isIncoming = v27.props.isIncoming, 
                            isPending = false, 
                            isUnfiltered = v27.props.isUnfiltered, 
                            isRepliedTo = true, 
                            maxWidth = v27.getBubbleMaxWidth(v29, v27.props.repliesTo.content, v37, l_BodySmall_0.Font), 
                            messageDefaultNoticeText = v27.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v27.props.messageModeratedNoticeText, 
                            parentWidth = v27.props.parentWidth, 
                            text = v27.props.repliesTo.content, 
                            textSize = v37, 
                            wideMode = v27.props.wideMode, 
                            [v4.Change.AbsoluteSize] = v27.messageSizeChanged, 
                            LayoutOrder = 1
                        }) else nil, 
                        mainMessage = v3.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            [v3.Change.AbsoluteSize] = v27.messageSizeChanged, 
                            LayoutOrder = 2
                        }, {
                            UIListLayout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, v6.DESKTOP_OPTIONS_HORIZONTAL_MARGIN)
                            }), 
                            Icons = if v40 then v40.Icons else nil, 
                            [v28.name] = v4.createElement(v28.component, {
                                additionalProps = v27.props.additionalProps, 
                                font = l_Body_0.Font, 
                                hasTail = not v27.props.repliesTo and v27.props.isNewSender, 
                                innerPadding = 10, 
                                isIncoming = v27.props.isIncoming, 
                                isPending = v27.props.isSending or v27.props.moderated or v27.props.failed, 
                                isUnfiltered = v27.props.isUnfiltered, 
                                isPressed = if v40 then v40.isPressed else nil, 
                                maxWidth = v27.getBubbleMaxWidth(v29, v31, v35, l_Body_0.Font), 
                                messageDefaultNoticeText = v27.props.messageDefaultNoticeText, 
                                messageModeratedNoticeText = v27.props.messageModeratedNoticeText, 
                                parentWidth = v27.props.parentWidth, 
                                text = v31, 
                                textSize = v35, 
                                wideMode = v27.props.wideMode, 
                                [v4.Change.AbsoluteSize] = v27.messageSizeChanged, 
                                LayoutOrder = v27.props.isIncoming and 1 or 2
                            })
                        })
                    });
                end
            }));
        end);
    end;
end;
return v17;