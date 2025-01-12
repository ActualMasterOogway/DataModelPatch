local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(script.Parent.SendMessagePolicy);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.ReceivedChatResponse);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.SendingMessage);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.SentMessage);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.MessageFailedToSend);
local v11 = require(l_script_FirstAncestor_0.Conversations.Actions.MessageModerated);
local l_ResponseStatus_0 = require(l_Parent_0.AppChatNetworking).Constants.ResponseStatus;
local v13 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local v14 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedChannelsMigrationConflict);
local v15 = require(l_script_FirstAncestor_0.EnumScreens);
local v16 = 0;
local v17 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local function _() --[[ Line: 26 ]] --[[ Name: getAscendingNumber ]]
    -- upvalues: v16 (ref)
    v16 = v16 + 1;
    return v16;
end;
local v19 = setmetatable({}, v3);
v19.__index = v19;
v19.new = function(v20, v21, v22) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        messageSendingId = v4.newSendingId(), 
        conversationId = v21, 
        replyingToMessage = v22
    }, v20));
end;
v19.onBeforeSendingMessage = function(v23, v24) --[[ Line: 42 ]] --[[ Name: onBeforeSendingMessage ]]
    -- upvalues: v17 (copy), v4 (copy), l_Immutable_0 (copy), v16 (ref), l_DateTime_0 (copy), v7 (copy)
    v17:trace("onBeforeSendingMessage conversationId: {} messageSendingId: {}, replyingToId: {}", v23.conversationId, v23.messageSendingId, if v23.replyingToMessage then v23.replyingToMessage.id else nil);
    local l_newSending_0 = v4.newSending;
    local l_JoinDictionaries_0 = l_Immutable_0.JoinDictionaries;
    local v27 = {
        id = v23.messageSendingId
    };
    v16 = v16 + 1;
    v27.order = v16;
    v27.conversationId = v23.conversationId;
    v27.repliesTo = v23.replyingToMessage;
    v27.sent = l_DateTime_0.now();
    l_newSending_0 = l_newSending_0(l_JoinDictionaries_0(v27, v23:sendingMessagePayload()));
    v23.sendingMessageStableKey = l_newSending_0.stableKey;
    assert(l_newSending_0, "Failed to create sending message placeholder");
    v24:dispatch(v7(v23.conversationId, l_newSending_0));
end;
v19.sendingMessagePayload = function(_) --[[ Line: 63 ]] --[[ Name: sendingMessagePayload ]]
    error("Override me");
end;
v19.onSuccess = function(v29, v30, v31) --[[ Line: 67 ]] --[[ Name: onSuccess ]]
    -- upvalues: v17 (copy), v8 (copy), v6 (copy)
    v17:debug("Message sent successfully. conversationId: {} messageSendingId: {} replyingToId: {}", v29.conversationId, v29.messageSendingId, if v29.replyingToMessage then v29.replyingToMessage.id else nil);
    v30:dispatch(v8(v29.conversationId, v29.messageSendingId));
    v30:dispatch(v6(v29.conversationId, v31.responseBody, v29.sendingMessageStableKey));
    return v31;
end;
v19.onFailure = function(v32, v33, v34) --[[ Line: 80 ]] --[[ Name: onFailure ]]
    -- upvalues: v17 (copy), l_StatusCodes_0 (copy), v14 (copy), v13 (copy), v15 (copy), v10 (copy), l_ResponseStatus_0 (copy), v11 (copy)
    v17:error("Failed to send message. conversationId: {}, messageSendingId: {}, responseCode: {}", v32.conversationId, v32.messageSendingId, v34.responseCode);
    if not v34 or v34.responseCode ~= nil and v34.responseCode ~= l_StatusCodes_0.OK or v34.StatusCode ~= nil and v34.StatusCode ~= l_StatusCodes_0.OK or not v34.responseBody or not v34.responseBody.messages or #v34.responseBody.messages == 0 then
        if v34.StatusCode == l_StatusCodes_0.CONFLICT then
            v17:error("Message sent conflicting system (409). Reloading messages...");
            v33:dispatch(v14());
            v33:dispatch(v13({
                screen = v15.ChatLanding, 
                params = {
                    key = tostring(os.clock())
                }
            }));
            return v34;
        else
            v33:dispatch(v10(v32.conversationId, v32.messageSendingId));
            v17:error("Message could not be sent, no response body or no messages in response body");
            return v34;
        end;
    elseif v34.responseBody.messages[1].status and v34.responseBody.messages[1].status == l_ResponseStatus_0.MODERATED then
        v33:dispatch(v11(v32.conversationId, v32.messageSendingId));
        v17:error("Message was moderated.");
        return v34;
    else
        v33:dispatch(v10(v32.conversationId, v32.messageSendingId));
        v17:error("Message could not be sent, no response body or no messages in response body");
        return v34;
    end;
end;
return v19;