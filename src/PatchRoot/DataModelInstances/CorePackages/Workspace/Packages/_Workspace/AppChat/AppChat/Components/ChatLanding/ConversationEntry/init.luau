local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_Parent_0.React);
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_memo_0 = v3.memo;
local l_useMemo_0 = v3.useMemo;
local v7 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(script.Parent.Utils.getBoldTextTheme);
local l_ConversationCell_0 = require(l_script_FirstAncestor_0.Components.Cells).ConversationCell;
local v13 = require(script.Parent.ConversationTimestamp);
local v14 = require(l_Parent_0.Squads);
local l_SquadJoinButton_0 = v14.SquadJoinButton;
local l_SquadButtonSourceEnum_0 = v14.Enums.SquadButtonSourceEnum;
local l_SquadComponentAccessWrapper_0 = v14.SquadComponentAccessWrapper;
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v20 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatConversationTimestampSmaller);
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local _ = require(l_script_FirstAncestor_0.types);
local v23 = {
    entryHeight = 64, 
    boldTitle = true, 
    onSquadJoinButtonActivated = function() --[[ Line: 48 ]] --[[ Name: onSquadJoinButtonActivated ]]

    end
};
return l_memo_0(function(v24) --[[ Line: 52 ]] --[[ Name: ConversationEntry ]]
    -- upvalues: v10 (copy), v23 (copy), l_useStyle_0 (copy), v7 (copy), v11 (copy), l_useChatPlacementContext_0 (copy), v20 (copy), l_useMemo_0 (copy), l_Text_0 (copy), l_dependencyArray_0 (copy), v3 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), l_ConversationCell_0 (copy), v19 (copy), v18 (copy), v13 (copy)
    local v25 = v10.Dictionary.join(v23, v24);
    local v26 = l_useStyle_0();
    local l_conversation_0 = v25.conversation;
    local l_hasGroupUp_0 = l_conversation_0.hasGroupUp;
    local v29 = v7(l_conversation_0);
    local v30 = l_conversation_0.hasUnreadMessages and not v29;
    local v31 = if v30 then v11(v26) else v26;
    local v32 = l_useChatPlacementContext_0();
    local v33 = if v20() then v31.Font.CaptionSubHeader else v31.Font.Body;
    local v34 = v31.Font.BaseSize * v33.RelativeSize;
    local v35 = v25.conversation.shortRelativeTime or "";
    local v36 = l_useMemo_0(function() --[[ Line: 70 ]]
        -- upvalues: l_Text_0 (ref), v35 (copy), v33 (copy), v34 (copy)
        return l_Text_0.GetTextWidth(v35, v33.Font, v34);
    end, l_dependencyArray_0(v35, v33.Font, v34));
    local v37 = v25.children or {};
    local v38 = if l_hasGroupUp_0 then v36 + 36 + 77 else v36 + 24;
    local v39 = if l_hasGroupUp_0 and l_conversation_0.id then v3.createElement(l_SquadComponentAccessWrapper_0, {
        parentChannelId = l_conversation_0.id
    }, {
        v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 89, 1, 0), 
            LayoutOrder = 2
        }, {}, {
            layout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            padding = v3.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12)
            }), 
            button = v3.createElement(l_SquadJoinButton_0, {
                conversationId = l_conversation_0.id, 
                isFullWidth = false, 
                isInCard = false, 
                layoutOrder = 0, 
                onActivated = v25.onSquadJoinButtonActivated, 
                shouldAnimate = false, 
                squadLocation = v32.chatPlacement, 
                squadButtonSource = l_SquadButtonSourceEnum_0.ConversationEntry
            })
        })
    }) else nil;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v25.entryHeight), 
        BackgroundTransparency = 1
    }, {
        cell = v3.createElement(l_ConversationCell_0, {
            Size = UDim2.new(1, 0, 0, v25.entryHeight), 
            conversation = v25.conversation, 
            childWidth = v38, 
            subTitleText = if v19() then v25.conversation.id else v25.conversation.lastMessageContent, 
            onActivated = v25.onActivated, 
            style = v31, 
            boldTitle = v30, 
            hideLeftPadding = v18(), 
            onSquadJoinButtonActivated = v25.onSquadJoinButtonActivated
        }, v10.Dictionary.join(v37, {
            timeStamp = v3.createElement(v13, {
                currentStyle = v31, 
                paddingX = 12, 
                paddingY = 14, 
                text = v35, 
                textSize = v34, 
                textWidth = v36
            }), 
            squadButton = v39
        }))
    });
end);