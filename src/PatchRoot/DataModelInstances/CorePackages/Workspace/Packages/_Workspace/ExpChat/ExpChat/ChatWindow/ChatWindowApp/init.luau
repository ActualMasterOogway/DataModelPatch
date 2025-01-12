local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_List_0 = require(l_Parent_0.llama).List;
local v5 = require(l_script_FirstAncestor_0.memoize);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagShowVerifiedBadgeInNewChat);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatRefactorVisibleMessages);
local l_UI_0 = script.Parent.UI;
local v9 = require(l_UI_0.ChatWindow);
local v10 = require(l_script_FirstAncestor_0.Actions.UserInteraction);
local v11 = v2.Component:extend("ChatWindowApp");
v11.defaultProps = {
    LayoutOrder = 1, 
    messages = {}, 
    size = UDim2.fromScale(1, 1)
};
local v17 = v5(function(v12, v13, v14) --[[ Line: 23 ]]
    -- upvalues: v7 (copy), l_List_0 (copy)
    if not v13 or not v7() then
        return l_List_0.map(v12.windowMessagesInOrder, function(v15) --[[ Line: 25 ]]
            -- upvalues: v12 (copy)
            return v12.byMessageId[v15];
        end);
    elseif v14 then
        return l_List_0.map(v12.windowMessagesInOrderByTabId[v14.Name] or {}, function(v16) --[[ Line: 32 ]]
            -- upvalues: v12 (copy)
            return v12.byMessageId[v16];
        end);
    else
        return {};
    end;
end);
v11.render = function(v18) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v9 (copy), v17 (copy), v6 (copy)
    return v2.createElement(v9, {
        LayoutOrder = v18.props.LayoutOrder, 
        messages = v17(v18.props.messages, v18.props.isChannelBarVisible, v18.props.targetTextChannel), 
        size = v18.props.size, 
        transparencyValue = v18.props.transparencyValue, 
        textTransparency = v18.props.textTransparency, 
        onHovered = v18.props.onHovered, 
        onUnhovered = v18.props.onUnhovered, 
        mutedUserIds = v18.props.mutedUserIds, 
        verifiedUserIds = if v6() then v18.props.verifiedUserIds else nil, 
        activateWhisperMode = v18.props.activateWhisperMode, 
        resetTargetChannel = v18.props.resetTargetChannel, 
        visible = v18.props.visible, 
        onAbsoluteSizeChanged = v18.props.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v18.props.onAbsolutePositionChanged, 
        chatWindowSettings = v18.props.chatWindowSettings, 
        showTranslationButton = v18.props.showTranslationButton, 
        targetTextChannel = v18.props.targetTextChannel, 
        isChannelBarVisible = v18.props.isChannelBarVisible, 
        onFocus = v18.props.onFocus, 
        onUnfocus = v18.props.onUnfocus
    });
end;
return v3.connect(function(v19) --[[ Line: 67 ]]
    return {
        chatIntervention = v19.ChatIntervention, 
        messages = v19.Messages, 
        mutedUserIds = v19.MutedUsers, 
        verifiedUserIds = v19.VerifiedUsers, 
        targetTextChannel = v19.TextChannels.targetTextChannel
    };
end, function(v20) --[[ Line: 75 ]]
    -- upvalues: v10 (copy)
    return {
        onFocus = function() --[[ Line: 77 ]] --[[ Name: onFocus ]]
            -- upvalues: v20 (copy), v10 (ref)
            return v20(v10("focus"));
        end, 
        onUnfocus = function() --[[ Line: 81 ]] --[[ Name: onUnfocus ]]
            -- upvalues: v20 (copy), v10 (ref)
            return v20(v10("unfocus"));
        end
    };
end)(v11);