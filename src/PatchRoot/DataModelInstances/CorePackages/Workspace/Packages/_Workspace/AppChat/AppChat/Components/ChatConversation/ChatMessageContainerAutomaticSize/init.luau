local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v9 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.Options);
local v11 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.OptionsEnum);
local v12 = require(script.Parent.ChatMessageContainerConstants);
local v13 = require(l_script_FirstAncestor_0.EnumScreens);
local v14 = require(l_Parent_0.Cryo);
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v17 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v18 = require(l_script_FirstAncestor_0.Models.Conversation);
local v19 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v20 = require(script.Parent.Logger);
local v21 = require(script.Parent.NoticeText);
local v22 = require(script.Parent.SystemMessage);
local v23 = require(l_Parent_0.UserProfiles);
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatChatMessageRightPadding);
local v25 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v26 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationIncreasePadding);
local v28 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_AvatarCircle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.AvatarCircle;
local v32 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationNewAvatarCircle);
if v32() then
    l_AvatarCircle_0 = require(l_script_FirstAncestor_0.Components.Cells.AvatarCircle);
end;
local v33 = {
    failed = false, 
    filteredForReceivers = false, 
    Font = Enum.Font.Gotham, 
    isIncoming = false, 
    isNewSender = false, 
    parentWidth = 0, 
    messageId = "", 
    conversationId = "", 
    messageTypePaddingOffset = 0, 
    moderated = false, 
    messageMaxWidth = 0, 
    openViewProfile = function() --[[ Line: 58 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v20 (copy)
        v20:warning("openViewProfile was not passed to ChatMessage");
    end, 
    renderMessage = function() --[[ Line: 61 ]] --[[ Name: renderMessage ]]
        -- upvalues: v20 (copy)
        v20:warning("renderMessage was not passed to ChatMessage");
    end, 
    closeKeyboard = function() --[[ Line: 64 ]] --[[ Name: closeKeyboard ]]

    end, 
    inputBoxRef = nil, 
    viewProfileOnAvatarPressed = true, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserKey = "Feature.Chat.Label.UnknownUser", 
    isPending = false, 
    unitTestTouchEnabled = false
};
ChatMessageContainer = function(v34) --[[ Line: 76 ]] --[[ Name: ChatMessageContainer ]]
    -- upvalues: v14 (copy), v33 (copy), v5 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v26 (copy), v17 (copy), l_useNavigation_0 (copy), v9 (copy), v28 (copy), l_useLocalUserId_0 (copy), v13 (copy), l_UserInputService_0 (copy), v19 (copy), v12 (copy), v11 (copy), l_setTimeout_0 (copy), v18 (copy), v23 (copy), l_useLocalization_0 (copy), l_TextService_0 (copy), v25 (copy), v10 (copy), v24 (copy), v27 (copy), v32 (copy), l_AvatarCircle_0 (ref), l_ShimmerPanel_0 (copy), v22 (copy), v21 (copy)
    local v35 = v14.Dictionary.join(v33, v34);
    local v36 = v5.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v35 (copy)
        if v35.viewProfileOnAvatarPressed then
            v35.openViewProfile(v35.senderUserId);
        end;
    end, {
        v35.senderUserId
    });
    local v37 = l_useStyle_0();
    local v38 = l_useTokens_0();
    local l_shouldShowName_0 = v35.shouldShowName;
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    if v26() then
        v40 = v17();
        local v60, v61 = v5.useState(false);
        v41 = v60;
        v42 = v61;
        v60, v61 = v5.useState(false);
        v43 = v60;
        v44 = v61;
        v45 = l_useNavigation_0();
        v46 = v9(v35.conversationId);
        if v46 and v46.messages then
            v47 = v46.messages:Get(v35.messageId);
        end;
        v48 = v28();
        v49 = l_useLocalUserId_0();
        v59 = v5.useCallback(function(v62) --[[ Line: 119 ]]
            -- upvalues: v40 (ref), v35 (copy)
            if v40 then
                v40.fireAnalyticsEvent(v62, {
                    conversationId = v35.conversationId, 
                    targetMessageSenderId = v35.senderUserId, 
                    targetMessageId = v35.messageId, 
                    targetMessageSentAt = if v35.sent then tostring(v35.sent.dateTime) else nil, 
                    targetMessageLength = if v35.content then #v35.content else nil
                });
            end;
        end, {
            v35.conversationId, 
            v35.senderUserId, 
            v35.messageId, 
            v35.sent, 
            v35.content
        });
        v58 = v5.useCallback(function() --[[ Line: 138 ]]
            -- upvalues: v45 (ref), v13 (ref), v35 (copy)
            v45.navigate(v13.MessageContextMenu, {
                messageId = v35.messageId, 
                conversationId = v35.conversationId, 
                inputBoxRef = v35.inputBoxRef
            });
        end, {
            v45.navigate, 
            v35.messageId, 
            v35.conversationId, 
            v35.inputBoxRef
        });
        v56 = v5.useCallback(function(v63, v64, v65) --[[ Line: 146 ]]
            -- upvalues: v35 (copy), l_UserInputService_0 (ref), v5 (ref), v42 (ref), v59 (ref), v19 (ref), v58 (ref), v57 (ref), v12 (ref), v44 (ref), v11 (ref), v48 (ref), v47 (ref)
            if v35.isPending then
                return;
            else
                if l_UserInputService_0.MouseEnabled then
                    if v63 == v5.Event.MouseEnter then
                        v42(true);
                    end;
                    if v63 == v5.Event.MouseLeave then
                        v42(false);
                    end;
                    if v63 == v5.Event.MouseButton1Down then
                        v35.closeKeyboard();
                    end;
                end;
                if l_UserInputService_0.TouchEnabled or v35.unitTestTouchEnabled then
                    if v63 == v5.Event.TouchLongPress then
                        v59(v19.ChatMessageLongPressed);
                        v58();
                        v57(v5.Event.InputEnded, v64, v12.PEEK_VIEW_ANIMATION_MILLISEC);
                    end;
                    if v63 == v5.Event.InputBegan and v64 then
                        v59(v19.ChatMessagePressed);
                        v44(true);
                        v57(v5.Event.TouchLongPress, v64, v12.LONG_PRESS_DELAY_MILLISEC);
                    end;
                    if v63 == v5.Event.InputEnded then
                        v44(false);
                    end;
                    if v63 == v5.Event.TouchTap then
                        v35.closeKeyboard();
                    end;
                end;
                if v63 == v5.Event.Activated then
                    if v65 == v11.MessageContextMenu then
                        v59(v19.ChatMessageOpenMenuIconClicked);
                        v58();
                    end;
                    if v65 == v11.Reply then
                        v59(v19.ChatMessageReplyIconClicked);
                        v48(v47);
                    end;
                end;
                return;
            end;
        end, {
            v35.isPending, 
            l_UserInputService_0.MouseEnabled, 
            v42, 
            l_UserInputService_0.TouchEnabled, 
            v35.unitTestTouchEnabled, 
            v45.navigate, 
            v57, 
            v43, 
            v44, 
            v59, 
            v58, 
            v48
        });
        v57 = v5.useCallback(function(v66, v67, v68) --[[ Line: 217 ]]
            -- upvalues: l_setTimeout_0 (ref), v56 (ref)
            l_setTimeout_0(function() --[[ Line: 218 ]]
                -- upvalues: v67 (copy), v56 (ref), v66 (copy)
                if v67.UserInputState == Enum.UserInputState.Begin or v67.UserInputState == Enum.UserInputState.Change then
                    v56(v66, v67);
                end;
            end, v68);
        end, {
            l_setTimeout_0, 
            v56
        });
        v52 = v5.useCallback(function(_, v70) --[[ Line: 231 ]]
            -- upvalues: v57 (ref), v5 (ref), v12 (ref)
            v57(v5.Event.InputBegan, v70, v12.INPUT_BEGAN_DELAY_MILLISEC);
        end, {
            v57
        });
        v53 = v5.useCallback(function(_) --[[ Line: 235 ]]
            -- upvalues: v56 (ref), v5 (ref)
            v56(v5.Event.InputEnded);
        end, {
            v56
        });
        v50 = v5.useCallback(function(_) --[[ Line: 239 ]]
            -- upvalues: v56 (ref), v5 (ref)
            v56(v5.Event.MouseEnter);
        end, {
            v56
        });
        v51 = v5.useCallback(function(_) --[[ Line: 243 ]]
            -- upvalues: v56 (ref), v5 (ref)
            v56(v5.Event.MouseLeave);
        end, {
            v56
        });
        v54 = v5.useCallback(function(_) --[[ Line: 247 ]]
            -- upvalues: v56 (ref), v5 (ref)
            v56(v5.Event.TouchTap);
        end, {
            v56
        });
        v55 = v5.useCallback(function(_) --[[ Line: 251 ]]
            -- upvalues: v56 (ref), v5 (ref)
            v56(v5.Event.MouseButton1Down);
        end, {
            v56
        });
    end;
    local v76 = v26() and v35.repliesTo and v35.repliesTo.senderTargetId;
    local function v82(v77, v78) --[[ Line: 258 ]] --[[ Name: getDisplayNameText ]]
        -- upvalues: v49 (ref), v35 (copy), v76 (copy), v46 (ref), v18 (ref)
        local v79 = v49 == v35.senderUserId;
        local v80 = v35.senderUserId == v35.repliesTo.senderTargetId;
        local v81 = v49 == v35.repliesTo.senderTargetId;
        if not v76 then
            return v77;
        elseif v79 and v80 then
            return "Feature.Chat.Label.YouRepliedToYou";
        else
            if v46.conversationType == v18.Type.ONE_TO_ONE_CONVERSATION then
                if v79 and not v80 then
                    return "Feature.Chat.Label.OneToOne.YouRepliedToThem";
                elseif not v79 and v81 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToYou";
                elseif not v79 and v80 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToThem";
                end;
            end;
            if v46.conversationType == v18.Type.MULTI_USER_CONVERSATION then
                if v79 and not v80 then
                    return {
                        "Feature.Chat.Label.Group.YouRepliedToThem"; 
                        DISPLAY_NAME = v78
                    };
                elseif not v79 and v81 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToYou"; 
                        DISPLAY_NAME = v77
                    };
                elseif not v79 and v80 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToThem"; 
                        DISPLAY_NAME = v77
                    };
                elseif not v79 and not v81 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToOther"; 
                        DISPLAY_NAME_1 = v77, 
                        DISPLAY_NAME_2 = v78
                    };
                end;
            end;
            return v35.unknownUserKey;
        end;
    end;
    local v83 = {
        v35.senderUserId
    };
    if v76 then
        table.insert(v83, v35.repliesTo.senderTargetId);
    end;
    local v84 = v23.Hooks.useUserProfilesFetch({
        userIds = v83, 
        query = v23.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v85 = nil;
    local v86 = nil;
    if v84.data then
        v86 = false;
        local v87 = v23.Selectors.getCombinedNameFromId(v84.data, v35.senderUserId) or v35.unknownUserKey;
        v85 = if v76 then v82(v87, v23.Selectors.getCombinedNameFromId(v84.data, v35.repliesTo.senderTargetId) or v35.unknownUserKey) else v87;
    else
        v86 = true;
        v85 = nil;
    end;
    local v88 = l_useLocalization_0(if v76 then {
        displayName = v85
    } else {}).displayName or v85;
    local v91 = v5.useCallback(function() --[[ Line: 350 ]]
        -- upvalues: v35 (copy), v12 (ref), l_TextService_0 (ref), v88 (ref), v37 (copy)
        local v89 = Vector2.new(math.max(1, v35.messageMaxWidth - v12.TAIL_WIDTH), 1e999);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v88, v37.Font.BaseSize * v37.Font.Footer.RelativeSize, v37.Font.Footer.Font, v89);
        return UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    end, {
        v37.Font.BaseSize * v37.Font.Footer.RelativeSize, 
        v37.Font.Footer.Font, 
        v35.messageMaxWidth - v12.TAIL_WIDTH, 
        v88
    });
    local v92 = 0;
    if not v35.showDateTime then
        v92 = (if not not v35.isNewSender or v76 then v12.CHAT_MESSAGE_MAX_SPACE else v12.CHAT_MESSAGE_MIN_SPACE) + v35.messageTypePaddingOffset;
    end;
    local v93 = v12.AVATAR_PADDING + v12.THUMBNAIL_SIZE;
    local v94 = v35.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right;
    local v95, v96 = v5.useState(false);
    local v98 = v5.useCallback(function() --[[ Line: 377 ]]
        -- upvalues: v25 (ref), v96 (copy)
        if v25() then
            v96(function(v97) --[[ Line: 379 ]]
                return not v97;
            end);
        end;
    end, {
        v96
    });
    local v99 = v95 or v35.moderated or v35.filteredForReceivers;
    local v100 = if v95 then v35.messageId else v35.moderated and v35.messageModeratedNoticeText or v35.messageDefaultNoticeText;
    local v101 = nil;
    if v35.failed or v35.moderated then
        v101 = v5.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v12.ALERT_ICON_IMAGE, 
            ImageColor3 = v37.Theme.Alert.Color, 
            ImageTransparency = v37.Theme.Alert.Transparency, 
            LayoutOrder = v35.isIncoming and 2 or 1, 
            Size = UDim2.new(0, v12.ALERT_ICON_SIZE, 0, v12.ALERT_ICON_SIZE)
        });
    elseif v41 then
        v101 = v5.createElement(v10, {
            isIncoming = v35.isIncoming, 
            handleEvent = v56
        });
    end;
    local v102 = not v26() or v35.isIncoming;
    local function v103() --[[ Line: 410 ]] --[[ Name: renderMessage ]]
        -- upvalues: v5 (ref), v50 (ref), v51 (ref), v92 (ref), v35 (copy), v12 (ref), v93 (copy), v24 (ref), v27 (ref), v38 (copy), v94 (copy), v32 (ref), v37 (copy), l_AvatarCircle_0 (ref), v36 (copy), l_shouldShowName_0 (copy), v102 (copy), v76 (copy), v86 (ref), v91 (copy), v88 (ref), l_ShimmerPanel_0 (ref), v26 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref), v43 (ref), v101 (ref)
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            [v5.Event.MouseEnter] = v50, 
            [v5.Event.MouseLeave] = v51
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v92), 
                PaddingLeft = UDim.new(0, v35.thumbnail and v12.AVATAR_PADDING or v93), 
                PaddingRight = if v24() then UDim.new(0, v12.MESSAGE_RIGHT_PADDING) else if v27() then UDim.new(0, v38.Padding.XLarge - v12.TAIL_WIDTH) else nil
            }), 
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = v94
            }), 
            Avatar = v35.thumbnail and v5.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = if v32() then v37.Tokens.Global.Color.None.Transparency else nil, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v12.THUMBNAIL_SIZE, 0, v12.THUMBNAIL_SIZE)
            }, {
                AvatarCircle = v5.createElement(l_AvatarCircle_0, {
                    circleColor3 = v35.BackgroundColor3 or v37.Theme.BackgroundDefault.Color, 
                    circleTransparency = if v32() then v37.Tokens.Global.Color.None.Transparency else nil, 
                    circleInteriorTransparency = if v32() then v37.Tokens.Global.Color.None.Transparency else nil, 
                    circleInteriorBackgroundColor3 = v35.BackgroundColor3 or v37.Theme.BackgroundDefault.Color, 
                    onActivated = v36, 
                    thumbnails = {
                        v35.thumbnail
                    }
                })
            }) or nil, 
            MessageWithDisplayName = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                AutomaticSize = if game:GetEngineFeature("UseActualSizeToCalculateListMinSize") then Enum.AutomaticSize.Y else nil, 
                Size = UDim2.new(1, v35.isIncoming and -v93 or 0, 0, 0)
            }, {
                Layout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = v94
                }), 
                Padding = v5.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v35.isIncoming and 5 or 0)
                }), 
                DisplayNameContainer = l_shouldShowName_0 and v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v35.messageMaxWidth - v12.TAIL_WIDTH, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    Padding = v5.createElement("UIPadding", {
                        PaddingLeft = if v102 then UDim.new(0, v12.TAIL_WIDTH) else UDim.new(0, 0), 
                        PaddingRight = if v102 then UDim.new(0, 0) else UDim.new(0, v12.TAIL_WIDTH), 
                        PaddingBottom = if v76 then UDim.new(0, v12.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else nil
                    }), 
                    DisplayName = if not v86 then v5.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Font = v37.Font.Footer.Font, 
                        Size = v91(), 
                        AnchorPoint = if v102 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v102 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Text = v88, 
                        TextColor3 = v37.Theme.TextDefault.Color, 
                        TextSize = v37.Font.BaseSize * v37.Font.Footer.RelativeSize, 
                        TextTransparency = v37.Theme.TextDefault.Transparency, 
                        TextXAlignment = if v102 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        SizeConstraint = v5.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(v35.messageMaxWidth - v12.TAIL_WIDTH, 1e999)
                        })
                    }) else nil, 
                    ShimmerName = if v86 then v5.createElement(l_ShimmerPanel_0, {
                        AnchorPoint = if v102 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v102 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Size = UDim2.new(0, v12.SHIMMER_WIDTH, 0, v12.SHIMMER_HEIGHT), 
                        LayoutOrder = 2
                    }) else nil
                }), 
                MessageWithIcons = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, v35.isIncoming and -v93 or 0, 0, 0)
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = v94, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10)
                    }), 
                    AlertIcon = if not v26() and (v35.failed or v35.moderated) then v5.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Image = v12.ALERT_ICON_IMAGE, 
                        ImageColor3 = v37.Theme.Alert.Color, 
                        ImageTransparency = v37.Theme.Alert.Transparency, 
                        LayoutOrder = v35.isIncoming and 2 or 1, 
                        Size = UDim2.new(0, v12.ALERT_ICON_SIZE, 0, v12.ALERT_ICON_SIZE)
                    }) else nil, 
                    Message = v35.renderMessage({
                        LayoutOrder = v35.isIncoming and 1 or 2, 
                        [v5.Event.InputBegan] = v52, 
                        [v5.Event.InputEnded] = v53, 
                        [v5.Event.TouchTap] = v54, 
                        [v5.Event.MouseButton1Down] = v55
                    }, if v26() then {
                        isPressed = v43, 
                        Icons = v101
                    } else nil)
                })
            })
        });
    end;
    return v5.createElement(v25() and "TextButton" or "Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v25() and "" or nil, 
        [v5.Event.Activated] = if v25() then v98 else nil
    }, {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v94, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DateTime = v35.showDateTime and v5.createElement(v22, {
            LayoutOrder = 1, 
            Text = v35.sent:GetLongRelativeTime(), 
            maxWidth = v12.DATETIME_MAX_WIDTH
        }), 
        MessageWithAvatar = v103(), 
        Notice = v99 and v5.createElement(v21, {
            Font = v35.Font, 
            HorizontalAlignment = v94, 
            LayoutOrder = 3, 
            Text = v100, 
            TextColor3 = v35.moderated and v37.Theme.Alert.Color or v37.Theme.UIDefault.Color, 
            TextTransparency = v35.moderated and v37.Theme.Alert.Transparency or v37.Theme.UIDefault.Transparency, 
            TextXAlignment = v35.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
            margin = {
                top = 0, 
                left = v35.isIncoming and v93 + v12.NOTICE_HORIZONTAL_PADDING or 0, 
                right = not v35.isIncoming and v12.NOTICE_HORIZONTAL_PADDING or 0, 
                bottom = 0
            }, 
            maxWidth = v35.parentWidth, 
            width = UDim.new(1, v35.isIncoming and -v93 or 0)
        }), 
        debug = v35.debugElement or nil
    });
end;
return ChatMessageContainer;