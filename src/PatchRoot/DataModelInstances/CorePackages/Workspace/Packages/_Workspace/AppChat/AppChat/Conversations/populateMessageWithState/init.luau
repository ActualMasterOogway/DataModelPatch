local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v3 = require(l_script_FirstAncestor_0.Models.Conversation);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
return function(v9, v10, v11, v12, v13, v14) --[[ Line: 33 ]]
    -- upvalues: v7 (copy), v2 (copy), v3 (copy), v8 (copy), v4 (copy), v6 (copy), v5 (copy)
    local v15 = v10.senderTargetId ~= tostring(v9.LocalUserId);
    local v16 = nil;
    local v17 = nil;
    local v18 = not v13 and v12.fetchedOldestMessage == true;
    local v19 = false;
    if (v13 and v10.sent and v13.sent) ~= nil then
        v19 = v10.sent:GetUnixTimestamp() - v13.sent:GetUnixTimestamp() > 300;
    end;
    local v20 = v7() and v10.repliesTo ~= nil;
    v16 = v18 or v19;
    v17 = v16 or not v13 or v13.senderTargetId ~= v10.senderTargetId;
    local l_Users_0 = v9.Users;
    local v22 = (v15 and v17 or v20) and v10.senderTargetId;
    local v23 = {};
    if v22 then
        local v24 = l_Users_0[v10.senderTargetId];
        local v25 = {
            id = v10.senderTargetId, 
            thumbnail = if v15 and v24 then v2({
                v10.senderTargetId
            })[1] else if v7() then nil else ""
        };
        local v26 = true;
        if v12.conversationType ~= v3.Type.MULTI_USER_CONVERSATION then
            v26 = v20;
        end;
        v25.shouldShowName = v26;
        v23 = v25;
    elseif v8() and v10.senderType == v4.SenderTypes.User and not v10.senderTargetId then
        v6:warning((("User message with no senderTargetId: %*"):format(v10.id)));
    end;
    local v27 = {
        placeId = v10.placeId, 
        universeId = v10.gameLink and v10.gameLink.universeId, 
        senderUserId = v15 and v10.senderTargetId or nil
    };
    return v5.Dictionary.join(v10, {
        conversationId = if v7() then v12.id else nil, 
        messageId = v11, 
        position = v13 and v13.position + 1 or 1, 
        isIncoming = v15, 
        isNewSender = v17, 
        sender = v23, 
        isSending = v14 or false, 
        showDateTime = v16, 
        additionalProps = v27
    });
end;