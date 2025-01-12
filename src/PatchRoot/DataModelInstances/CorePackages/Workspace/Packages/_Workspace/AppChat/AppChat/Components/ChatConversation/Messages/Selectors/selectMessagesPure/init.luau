local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.messageSortPredicate);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v6 = require(l_script_FirstAncestor_0.Conversations.populateMessageWithState);
return function(v7, v8) --[[ Line: 78 ]] --[[ Name: selectMessagesPure ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    local l_conversation_0 = v7.conversation;
    if not l_conversation_0 then
        return {
            itemList = {}, 
            previousMessagesState = v8.previousMessagesState, 
            previousSendingMessagesState = v8.previousSendingMessagesState, 
            previousMessagesResult = v8.previousMessagesResult
        };
    else
        local l_messages_0 = l_conversation_0.messages;
        local l_sendingMessages_0 = l_conversation_0.sendingMessages;
        local l_conversationId_0 = v7.conversationId;
        local v13 = v8.previousMessagesState[l_conversationId_0];
        local v14 = v8.previousSendingMessagesState[l_conversationId_0];
        local v15 = v8.previousMessagesResult[l_conversationId_0];
        if not l_messages_0 then
            return {
                itemList = v15 or {}, 
                previousMessagesState = v8.previousMessagesState, 
                previousSendingMessagesState = v8.previousSendingMessagesState, 
                previousMessagesResult = v8.previousMessagesResult
            };
        elseif l_messages_0 == v13 and l_sendingMessages_0 == v14 then
            return {
                itemList = v15 or {}, 
                previousMessagesState = v8.previousMessagesState, 
                previousSendingMessagesState = v8.previousSendingMessagesState, 
                previousMessagesResult = v8.previousMessagesResult
            };
        else
            local v16 = v2(l_messages_0, "values");
            local v17 = if l_sendingMessages_0 then v2(l_sendingMessages_0, "values") else {};
            v16 = v3.Dictionary.join(v16, v17);
            local v18 = v3.List.sort(v3.Dictionary.values(v16), v4);
            local v19 = {};
            local v20 = table.clone(v15 or {});
            local v21 = if #v20 > 0 and v20[#v20].sent then v20[#v20].sent:GetUnixTimestamp() else 1e999;
            local v22 = if #v20 > 0 and v20[#v20].id then v20[#v20].id else "";
            local v23 = 0;
            for _, v25 in v18 do
                local v26 = not not v17[v25.id];
                for v27, v28 in v5(v25) do
                    local v29 = {
                        Users = v7.Users, 
                        LocalUserId = v7.localUserId
                    };
                    local v30 = v6(v29, v28, v25.id, l_conversation_0, v19[#v19], v26);
                    local _ = nil;
                    if not (v30.sent and v30.sent:GetUnixTimestamp() < v21 or if v30.sent then v30.sent:GetUnixTimestamp() == v21 and (v22 == "" or if v30.id then v22 < v30.id else false) else false) then
                        v23 = v23 + 1;
                    end;
                    v30.stable_key = ("%*_%*"):format(v30.stableKey or v30.messageId, v27);
                    table.insert(v19, v30);
                end;
            end;
            if v23 < #v20 then
                return {
                    itemList = v15 or {}, 
                    previousMessagesState = v8.previousMessagesState, 
                    previousSendingMessagesState = v8.previousSendingMessagesState, 
                    previousMessagesResult = v8.previousMessagesResult
                };
            else
                local v32 = table.clone(v8.previousMessagesState);
                local v33 = table.clone(v8.previousSendingMessagesState);
                local v34 = table.clone(v8.previousMessagesResult);
                v32[l_conversationId_0] = l_messages_0;
                v33[l_conversationId_0] = l_sendingMessages_0;
                v34[l_conversationId_0] = v3.List.reverse(v19);
                return {
                    itemList = v34[l_conversationId_0], 
                    previousMessagesState = v32, 
                    previousSendingMessagesState = v33, 
                    previousMessagesResult = v34
                };
            end;
        end;
    end;
end;