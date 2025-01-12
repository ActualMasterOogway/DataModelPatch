local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
return function(v2, _) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        canLocalUserChat = v2.CanLocalUserChat, 
        isChatInputBarVisible = v2.ChatVisibility.isChatInputBarEnabled.value, 
        isChatWindowVisible = v2.ChatVisibility.isChatWindowEnabled.value, 
        isChannelBarVisible = if v1() then v2.ChatVisibility.isChannelBarEnabled.value else false, 
        chatTopBarVisibility = v2.ChatVisibility.isChatInputBarEnabled._topBarVisibility and v2.ChatVisibility.isChatWindowEnabled._topBarVisibility, 
        messages = v2.Messages.windowMessagesInOrder, 
        lastGeneralActivityTimestamp = v2.ChatVisibility.transparency.lastGeneralActivityTimestamp, 
        lastMessageActivityTimestamp = v2.ChatVisibility.transparency.lastMessageActivityTimestamp, 
        isTextBoxFocused = v2.ChatVisibility.transparency.isTextBoxFocused, 
        chatLayoutAlignment = v2.ChatLayout.Alignment, 
        chatWindowSettings = v2.ChatLayout.ChatWindowSettings, 
        clientSettings = v2.ClientSettings
    };
end;