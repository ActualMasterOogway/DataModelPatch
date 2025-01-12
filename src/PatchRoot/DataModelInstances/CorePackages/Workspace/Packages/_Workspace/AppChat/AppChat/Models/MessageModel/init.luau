local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_GenerateStringId_0 = require(l_Parent_0.AppCommonLib).GenerateStringId;
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatHiddenMessages);
local l_GetFFlagEnableSocialCards_0 = v5.GetFFlagEnableSocialCards;
local v11 = {
    new = function(v10) --[[ Line: 19 ]] --[[ Name: new ]]
        return {
            universeId = tostring(v10)
        };
    end
};
local v12 = {
    SenderTypes = {
        User = "user", 
        System = "system", 
        UnknownType = "unknown_type"
    }, 
    MessageTypes = {
        PlainText = "PlainText", 
        Link = "Link", 
        System = "System"
    }, 
    LinkTypes = {
        Game = "Game"
    }, 
    ModerationTypes = {
        TrustedComms = "trusted_comms", 
        Moderated = "moderated", 
        Invalid = "invalid", 
        UnknownType = "unknown_type"
    }
};
v12.new = function(v13) --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    v12.__index = v12;
    local v14 = v13 or {};
    setmetatable(v14, v12);
    return v14;
end;
v12.fromWeb = function(v15, v16, v17) --[[ Line: 57 ]] --[[ Name: fromWeb ]]
    -- upvalues: v12 (copy), l_DateTime_0 (copy)
    if not v12.DoRequiredFieldsPresent(v15) then
        return nil;
    else
        local v18 = v12.new();
        v18.id = v15.id;
        v18.senderTargetId = tostring(v15.senderTargetId);
        v18.senderType = v15.senderType;
        v18.read = v15.read;
        v18.sent = l_DateTime_0.fromIsoDate(v15.sent);
        v18.conversationId = tostring(v16);
        v18.previousMessageId = v17;
        v18.filteredForReceivers = false;
        v18:parseContentWeb(v15);
        return v18;
    end;
end;
v12.fromSentWeb = function(v19, v20) --[[ Line: 77 ]] --[[ Name: fromSentWeb ]]
    -- upvalues: v12 (copy), l_Players_0 (copy), l_DateTime_0 (copy)
    if not v12.DoRequiredFieldsPresentForSent(v19) then
        return nil;
    else
        local v21 = v12.new();
        v21.id = v19.messageId;
        v21.senderTargetId = tostring(l_Players_0.LocalPlayer.UserId);
        v21.senderType = "User";
        v21.read = true;
        v21.sent = l_DateTime_0.fromIsoDate(v19.sent);
        v21.conversationId = tostring(v20);
        v21.previousMessageId = "";
        v21.filteredForReceivers = v19.filteredForReceivers;
        v21:parseContentSentWeb(v19);
        return v21;
    end;
end;
v12.newSendingId = function() --[[ Line: 98 ]] --[[ Name: newSendingId ]]
    -- upvalues: l_GenerateStringId_0 (copy)
    return "sending-message-" .. l_GenerateStringId_0();
end;
v12.newSending = function(v22) --[[ Line: 102 ]] --[[ Name: newSending ]]
    -- upvalues: v12 (copy), l_Players_0 (copy)
    assert(v22, "props argument is missing");
    assert(v22.id, "props.id argument is missing");
    assert(v22.messageType, "props.messageType argument is missing");
    assert(v22.order, "props.order argument is missing");
    assert(v22.conversationId, "props.conversationId argument is missing");
    assert(v22.sent, "props.sent argument is missing");
    local v23 = v12.new(v22);
    v23.senderTargetId = tostring(l_Players_0.LocalPlayer.UserId);
    v23.senderType = v12.SenderTypes.User;
    v23.moderated = false;
    v23.failed = false;
    v23.stableKey = v23.id;
    return v23;
end;
v12.DoRequiredFieldsPresent = function(v24) --[[ Line: 122 ]] --[[ Name: DoRequiredFieldsPresent ]]
    return v24 and v24.id and v24.messageType and v24.senderTargetId and v24.sent;
end;
v12.DoRequiredFieldsPresentForSent = function(v25) --[[ Line: 125 ]] --[[ Name: DoRequiredFieldsPresentForSent ]]
    return v25 and v25.messageId and v25.messageType and v25.sent;
end;
v12.parseContentWeb = function(v26, v27) --[[ Line: 129 ]] --[[ Name: parseContentWeb ]]
    -- upvalues: v12 (copy), v11 (copy)
    v26:parseContent(v27);
    if v27.messageType == v12.MessageTypes.Link and v27.link and v27.link.type == v12.LinkTypes.Game and v27.link.game then
        v26.gameLink = v11.new(v27.link.game.universeId);
    end;
end;
v12.parseContentSentWeb = function(v28, v29) --[[ Line: 138 ]] --[[ Name: parseContentSentWeb ]]
    -- upvalues: v12 (copy), v11 (copy)
    v28:parseContent(v29);
    if v29.messageType == v12.MessageTypes.Link and v29.chatMessageLinkType == v12.LinkTypes.Game then
        v28.gameLink = v11.new(v29.universeId);
    end;
end;
v12.parseContent = function(v30, v31) --[[ Line: 147 ]] --[[ Name: parseContent ]]
    -- upvalues: v12 (copy)
    v30.messageType = v31.messageType;
    if v31.messageType == v12.MessageTypes.PlainText then
        v30.content = v31.content;
        return;
    else
        v30.content = nil;
        return;
    end;
end;
v12.fromChannelsApi = function(v32, v33, v34, v35) --[[ Line: 160 ]] --[[ Name: fromChannelsApi ]]
    -- upvalues: v12 (copy), v7 (copy), l_DateTime_0 (copy), l_GetFFlagEnableSocialCards_0 (copy), v6 (copy), v8 (copy)
    if not v12.DoRequiredFieldsPresentFromChannelsApi(v32) then
        return nil;
    else
        local v36 = v12.new();
        if v7() then
            v36.id = v32.id;
            v36.read = true;
            v36.sent = l_DateTime_0.fromIsoDate(v32.created_at);
            v36.conversationId = tostring(v33);
            v36.previousMessageId = v34;
            v36.filteredForReceivers = false;
            v36.content = v32.content;
            if v32.type == v12.SenderTypes.User then
                v36:serializeForUserMessage(v32);
            elseif v32.type == v12.SenderTypes.System then
                v36:serializeForSystemMessage(v32);
            end;
            v36.cards = if l_GetFFlagEnableSocialCards_0() then v32.cards else nil;
            if l_GetFFlagEnableSocialCards_0() then
                v36.senderTargetId = tostring(v32.sender_user_id);
            end;
        else
            v36.id = v32.id;
            v36.senderTargetId = tostring(v32.sender_user_id);
            v36.senderType = v12.SenderTypes.User;
            v36.read = true;
            v36.sent = l_DateTime_0.fromIsoDate(v32.created_at);
            v36.conversationId = tostring(v33);
            v36.previousMessageId = v34;
            v36.filteredForReceivers = false;
            v36.moderationType = v32.moderation_type;
            if v6() and not v35 then
                v36.repliesTo = v12.fromChannelsApi(v32.replies_to, nil, nil, true);
            end;
            v36:parseContentFromChannelsApi(v32);
        end;
        v36.stableKey = v36.id;
        if v8() then
            v36.isBadgeable = v32.is_badgeable;
            v36.isPreviewable = v32.is_previewable;
        end;
        return v36;
    end;
end;
v12.serializeForUserMessage = function(v37, v38) --[[ Line: 214 ]] --[[ Name: serializeForUserMessage ]]
    -- upvalues: v12 (copy), v6 (copy)
    v37.senderTargetId = tostring(v38.sender_user_id);
    v37.senderType = v12.SenderTypes.User;
    v37.moderationType = v38.moderation_type;
    if v6() then
        v37.repliesTo = v12.fromChannelsApi(v38.replies_to, nil, nil, true);
    end;
    v37.messageType = v12.MessageTypes.PlainText;
end;
v12.serializeForSystemMessage = function(v39, _) --[[ Line: 224 ]] --[[ Name: serializeForSystemMessage ]]
    -- upvalues: v12 (copy)
    v39.senderType = v12.SenderTypes.System;
    v39.messageType = v12.MessageTypes.System;
end;
v12.DoRequiredFieldsPresentFromChannelsApi = function(v41) --[[ Line: 230 ]] --[[ Name: DoRequiredFieldsPresentFromChannelsApi ]]
    -- upvalues: v7 (copy), v12 (copy)
    if v7() then
        if not v41 then
            return false;
        elseif v41.type == v12.SenderTypes.User then
            return v41.id and v41.sender_user_id and v41.created_at;
        elseif v41.type == v12.SenderTypes.System then
            return v41.id and v41.created_at;
        else
            return false;
        end;
    else
        return v41 and v41.id and v41.sender_user_id and v41.created_at;
    end;
end;
v12.parseContentFromChannelsApi = function(v42, v43) --[[ Line: 248 ]] --[[ Name: parseContentFromChannelsApi ]]
    -- upvalues: v12 (copy)
    v42.messageType = v12.MessageTypes.PlainText;
    v42.content = v43.content;
end;
v12.fromSentChannelsApi = function(v44, v45, v46) --[[ Line: 254 ]] --[[ Name: fromSentChannelsApi ]]
    -- upvalues: v12 (copy), l_DateTime_0 (copy), v8 (copy), v6 (copy)
    if not v12.DoRequiredFieldsPresentForSentFromChannelsApi(v44) then
        return nil;
    else
        local v47 = v12.new();
        v47.id = v44.messages[1].id;
        v47.senderTargetId = tostring(v44.messages[1].sender_user_id);
        v47.senderType = v12.SenderTypes.User;
        v47.read = true;
        v47.sent = l_DateTime_0.fromIsoDate(v44.messages[1].created_at);
        v47.conversationId = tostring(v45);
        v47.previousMessageId = "";
        v47.moderationType = v44.messages[1].moderation_type;
        v47.stableKey = v46 or v47.id;
        if v8() then
            v47.isBadgeable = v44.messages[1].is_badgeable;
            v47.isPreviewable = v44.messages[1].is_previewable;
        end;
        v47.filteredForReceivers = false;
        v47.messageType = v12.MessageTypes.PlainText;
        v47.content = v44.messages[1].content;
        if v6() then
            v47.repliesTo = v12.fromChannelsApi(v44.messages[1].replies_to, nil, nil, true);
        end;
        return v47;
    end;
end;
v12.DoRequiredFieldsPresentForSentFromChannelsApi = function(v48) --[[ Line: 287 ]] --[[ Name: DoRequiredFieldsPresentForSentFromChannelsApi ]]
    return v48 and v48.messages and #v48.messages > 0 and v48.messages[1].id and v48.messages[1].created_at;
end;
return v12;