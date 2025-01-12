local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.Logger);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useCallback_0 = v4.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v9 = require(script.Parent.SectionHeader);
local v10 = require(script.Parent.GroupNameEntryCell);
local v11 = require(script.Parent.AddFriendsEntry);
local v12 = require(script.Parent.ParticipantList);
local v13 = require(script.Parent.LeaveGroupCell);
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local v15 = require(script.Parent.UnfilteredThreads.ConversationTypeCell);
local v16 = require(script.Parent.UnfilteredThreads.CreateUnfilteredChatCell);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v18 = require(l_script_FirstAncestor_0.App.Hooks.useIsAppChatVerticallyConstrained);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableGroupChatSettings);
local v20 = game:DefineFastFlag("AppChatDetailsPageAutomaticCanvasSize", false);
local v21 = game:DefineFastFlag("AppChatHideGroupNameEditForU13", false);
local v22 = game:DefineFastFlag("AppChatHideConversationTypeForU13", false);
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableChatUserMessagesSettings);
local v24 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local v31 = {
    participants = {}, 
    localUserId = nil, 
    conversation = nil, 
    conversationId = nil, 
    isGroupConversation = false, 
    topBarHeight = 0, 
    shouldShowCreateUnfilteredChat = false, 
    shouldShowRevampedUI = false, 
    shouldHideGroupChatFunctionality = false, 
    shouldShowAddFriends = true, 
    navigateBack = function() --[[ Line: 84 ]] --[[ Name: navigateBack ]]

    end, 
    conversationTitle = "PlaceholderTitle", 
    pageHeaderText = "localizedText.ChatDetails", 
    generalText = "localizedText.General", 
    membersText = "localizedText.Members", 
    addFriendsText = "localizedText.AddFriends", 
    leaveGroupText = "localizedText.LeaveGroup", 
    onlinePresenceText = "localizedText.OnlineText", 
    offlinePresenceText = "localizedText.OfflineText", 
    conversationTypeHeaderText = "Expressive Chat Features", 
    conversationTypeText = "localizedText.ConversationTypeText", 
    createUnfilteredChatText = "Create new chat without filters", 
    createUnfilteredChatSubTitleText = "All members of this conversation will be invited, but some are not eligible to join.", 
    onGroupNameEntryCellActivated = function(_) --[[ Line: 99 ]] --[[ Name: onGroupNameEntryCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage");
    end, 
    onAddFriendsCellActivated = function(_) --[[ Line: 102 ]] --[[ Name: onAddFriendsCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage");
    end, 
    onLeaveGroupCellActivated = function(_) --[[ Line: 105 ]] --[[ Name: onLeaveGroupCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage");
    end, 
    onParticipantCellActivated = function(_) --[[ Line: 108 ]] --[[ Name: onParticipantCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onParticipantCellActivated was not passed to ChatDetailsPage");
    end, 
    onConversationTypeIconActivated = function(_) --[[ Line: 111 ]] --[[ Name: onConversationTypeIconActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage");
    end, 
    onCreateUnfilteredChatCellActivated = function(_) --[[ Line: 114 ]] --[[ Name: onCreateUnfilteredChatCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage");
    end, 
    LayoutOrder = 0, 
    style = v3.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    })
};
ChatDetailsPage = function(v32) --[[ Line: 132 ]] --[[ Name: ChatDetailsPage ]]
    -- upvalues: v3 (copy), v31 (copy), v18 (copy), v2 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v24 (copy), v19 (copy), v22 (copy), v23 (copy), v21 (copy), v4 (copy), v17 (copy), v20 (copy), v9 (copy), v10 (copy), l_Images_0 (copy), v11 (copy), v12 (copy), v13 (copy), v15 (copy), v16 (copy)
    local v33 = v3.Dictionary.join(v31, v32);
    local l_style_0 = v33.style;
    local v35 = v18();
    local v36 = {
        ChatGroupHeader = {
            marginTop = l_style_0.Tokens.Global.Size_0, 
            marginBottom = l_style_0.Tokens.Global.Size_0
        }, 
        MembersHeader = {
            marginTop = l_style_0.Tokens.Global.Size_0, 
            marginBottom = l_style_0.Tokens.Global.Size_0
        }, 
        GroupNameEntryCell = {
            paddingBottom = l_style_0.Tokens.Global.Size_0
        }
    };
    local function v37() --[[ Line: 151 ]]
        -- upvalues: v33 (copy)
        v33.onGroupNameEntryCellActivated(v33.conversation);
    end;
    local function v38() --[[ Line: 155 ]]
        -- upvalues: v33 (copy)
        v33.onAddFriendsCellActivated(v33.conversation);
    end;
    local function v39() --[[ Line: 159 ]]
        -- upvalues: v33 (copy)
        v33.onLeaveGroupCellActivated(v33.conversation);
    end;
    local function v41(v40) --[[ Line: 163 ]]
        -- upvalues: v2 (ref), v33 (copy)
        v2:info("onParticipantCellActivated: {}", v40.id);
        if v40.isLocalUser then
            return;
        else
            v33.onParticipantCellActivated(v40.id);
            return;
        end;
    end;
    local v42 = l_useCallback_0(function() --[[ Line: 172 ]]
        -- upvalues: v33 (copy)
        v33.onCreateUnfilteredChatCellActivated(v33.conversation);
    end, l_dependencyArray_0(v33.conversation));
    local v46 = l_useCallback_0(function(_, v44, v45) --[[ Line: 177 ]]
        -- upvalues: v33 (copy)
        if not v33.wideMode and v44 == Enum.SwipeDirection.Right and v45 == 1 then
            v33.navigateBack();
        end;
    end);
    local v47 = 0;
    for _, _ in pairs(v33.participants) do
        v47 = v47 + 1;
    end;
    local v50 = v24();
    local v51 = if v19() then v33.shouldShowAddFriends else not v33.shouldHideGroupChatFunctionality;
    local v52 = if v22 and v23() then v33.shouldShowRevampedUI and v50 else v33.shouldShowRevampedUI;
    local v53 = (if v51 then v47 + 1 else v47) * 48;
    local v54 = v53 + 384;
    local v55 = v21 and v23() and not v50;
    return v4.createElement("TextButton", {
        AutoButtonColor = false, 
        BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = v33.LayoutOrder, 
        Size = UDim2.new(1, 0, 1, 0), 
        Text = "", 
        Transparency = if v17() then l_style_0.Tokens.Global.Color.None.Transparency else l_style_0.Theme.BackgroundDefault.Transparency, 
        [v4.Event.TouchSwipe] = v46
    }, {
        ScrollingContent = v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, v20 and 0 or v54), 
            AutomaticCanvasSize = if v20 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            LayoutOrder = v33.LayoutOrder, 
            ScrollingDirection = Enum.ScrollingDirection.Y
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ChatGroupHeader = v33.isGroupConversation and v4.createElement(v9, {
                marginTop = if v35 then v36.ChatGroupHeader.marginTop else 20, 
                marginBottom = if v35 then v36.ChatGroupHeader.marginBottom else nil, 
                LayoutOrder = 1, 
                Text = v33.chatGroupText, 
                style = v33.style
            }), 
            GroupNameEntryCell = v33.isGroupConversation and v4.createElement(v10, {
                LayoutOrder = 2, 
                groupNameText = v33.conversationTitle, 
                iconImage = l_Images_0["icons/actions/edit/edit"], 
                isDisabled = v33.shouldHideGroupChatFunctionality or v55, 
                cellHeight = 48, 
                paddingBottom = if v35 then v36.GroupNameEntryCell.paddingBottom else nil, 
                onActivated = v37, 
                style = v33.style
            }), 
            MembersHeader = v4.createElement(v9, {
                LayoutOrder = 3, 
                marginTop = if v35 then v36.MembersHeader.marginTop else 14, 
                marginBottom = if v35 then v36.MembersHeader.marginBottom else 8, 
                Text = v33.membersText, 
                style = v33.style
            }), 
            MembersFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v53), 
                BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = if v17() then l_style_0.Tokens.Global.Color.None.Transparency else l_style_0.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 4
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                AddFriendsCell = if v51 then v4.createElement(v11, {
                    LayoutOrder = 1, 
                    Text = v33.addFriendsText, 
                    iconImage = l_Images_0["icons/actions/edit/add"], 
                    cellHeight = 48, 
                    onActivated = v38, 
                    style = v33.style
                }) else nil, 
                ParticipantList = v4.createElement(v12, {
                    LayoutOrder = 2, 
                    entries = v33.participants, 
                    entryHeight = 48, 
                    onlinePresenceText = v33.onlinePresenceText, 
                    offlinePresenceText = v33.offlinePresenceText, 
                    childWidth = 120, 
                    onEntryActivated = v41
                })
            }), 
            LeaveGroupCell = v33.isGroupConversation and v4.createElement(v13, {
                LayoutOrder = 5, 
                leaveGroupText = v33.leaveGroupText, 
                iconImage = l_Images_0["icons/controls/vehicle/exit"], 
                cellHeight = 48, 
                onActivated = v39, 
                style = v33.style
            }), 
            ConversationTypeHeader = if v52 then v4.createElement(v9, {
                LayoutOrder = 6, 
                marginTop = 26, 
                Text = v33.conversationTypeHeaderText, 
                style = v33.style
            }) else nil, 
            ConversationTypeCell = if v52 then v4.createElement(v15, {
                layoutOrder = 7, 
                bodyText = v33.conversationTypeText, 
                iconImage = l_Images_0["icons/actions/info"], 
                onIconActivated = v33.onConversationTypeIconActivated, 
                style = v33.style
            }) else nil, 
            CreateUnfilteredChatCell = if v52 and v33.shouldShowCreateUnfilteredChat then v4.createElement(v16, {
                layoutOrder = 8, 
                bodyText = v33.createUnfilteredChatText, 
                subTitleText = v33.createUnfilteredChatSubTitleText, 
                iconImage = l_Images_0["icons/actions/edit/copy"], 
                cellHeight = 48, 
                isLoading = v33.isCreateUnfilteredChatLoading, 
                conversationId = v33.conversationId, 
                onActivated = v42, 
                style = v33.style
            }) else nil
        })
    });
end;
return l_memo_0(ChatDetailsPage);