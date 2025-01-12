local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new("AppChat.paginateForNewerMessages");
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatCapNewMessageRefetch);
local v6 = game:DefineFastInt("AppChatNewMessageFetchMaxDepth", 10);
local function _(v7, v8) --[[ Line: 19 ]] --[[ Name: isMessageAlreadyInConversation ]]
    return v7.messages:Get(v8) ~= nil;
end;
local function v10(v11, v12, v13) --[[ Line: 24 ]] --[[ Name: fetchOlderMessages ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v2 (copy), v10 (copy)
    return function(v14) --[[ Line: 31 ]]
        -- upvalues: v5 (ref), v13 (copy), v6 (ref), v3 (ref), v12 (copy), v11 (copy), v2 (ref), v10 (ref)
        if v5() and v6 <= v13 then
            v3:warning("Reached max depth {} of fetching new messages", v6);
            return;
        else
            local l_responseBody_0 = v12.responseBody;
            if not l_responseBody_0 then
                return;
            else
                local l_messages_0 = l_responseBody_0.messages;
                local v17 = l_messages_0 and #l_messages_0 > 0 and l_messages_0[#l_messages_0].id or nil;
                if v17 == nil then
                    v3:warning("No messages in response");
                    return;
                else
                    assert(v17, "FFlagLuauTinyControlFlowAnalysis");
                    local v18 = l_responseBody_0.next_cursor and l_responseBody_0.next_cursor ~= "" and l_responseBody_0.next_cursor or nil;
                    if v18 == nil then
                        v3:debug("No more messages to fetch");
                        return;
                    elseif v11.messages:Get(v17) ~= nil then
                        v3:debug("Last message already in conversation, we've caught up");
                        return;
                    else
                        v3:trace("Fetching for the next page of messages using cursor: {}", v18);
                        return v14:dispatch(v2.rodux.GetOlderMessages.API(v11.id, v18)):andThen(function(v19) --[[ Line: 67 ]]
                            -- upvalues: v14 (copy), v10 (ref), v11 (ref), v13 (ref)
                            return v14:dispatch(v10(v11, v19, v13 + 1));
                        end):catch(function(v20) --[[ Line: 70 ]]
                            -- upvalues: v3 (ref)
                            v3:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", v20);
                        end);
                    end;
                end;
            end;
        end;
    end;
end;
return function(v21) --[[ Line: 76 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v6 (copy), v10 (copy)
    return function(v22) --[[ Line: 77 ]]
        -- upvalues: v3 (ref), v21 (copy), v2 (ref), v5 (ref), v6 (ref), v10 (ref)
        v3:info("Starting to fetch newest messages for conversation: {}", v21.id);
        return v22:dispatch(v2.rodux.GetOlderMessages.API(v21.id, nil)):andThen(function(v23) --[[ Line: 83 ]]
            -- upvalues: v22 (copy), v21 (ref), v5 (ref), v6 (ref), v3 (ref), v2 (ref), v10 (ref)
            local l_v22_0 = v22;
            local l_v21_0 = v21;
            local v26 = 0;
            return l_v22_0:dispatch(function(v27) --[[ Line: 31 ]]
                -- upvalues: v5 (ref), v26 (copy), v6 (ref), v3 (ref), v23 (copy), l_v21_0 (copy), v2 (ref), v10 (ref)
                if v5() and v6 <= v26 then
                    v3:warning("Reached max depth {} of fetching new messages", v6);
                    return;
                else
                    local l_responseBody_1 = v23.responseBody;
                    if not l_responseBody_1 then
                        return;
                    else
                        local l_messages_1 = l_responseBody_1.messages;
                        local v30 = l_messages_1 and #l_messages_1 > 0 and l_messages_1[#l_messages_1].id or nil;
                        if v30 == nil then
                            v3:warning("No messages in response");
                            return;
                        else
                            assert(v30, "FFlagLuauTinyControlFlowAnalysis");
                            local v31 = l_responseBody_1.next_cursor and l_responseBody_1.next_cursor ~= "" and l_responseBody_1.next_cursor or nil;
                            if v31 == nil then
                                v3:debug("No more messages to fetch");
                                return;
                            elseif l_v21_0.messages:Get(v30) ~= nil then
                                v3:debug("Last message already in conversation, we've caught up");
                                return;
                            else
                                v3:trace("Fetching for the next page of messages using cursor: {}", v31);
                                return v27:dispatch(v2.rodux.GetOlderMessages.API(l_v21_0.id, v31)):andThen(function(v32) --[[ Line: 67 ]]
                                    -- upvalues: v27 (copy), v10 (ref), l_v21_0 (ref), v26 (ref)
                                    return v27:dispatch(v10(l_v21_0, v32, v26 + 1));
                                end):catch(function(v33) --[[ Line: 70 ]]
                                    -- upvalues: v3 (ref)
                                    v3:warning("AppChatNetworking failure in fetchOlderMessages of refreshing new messages: {}", v33);
                                end);
                            end;
                        end;
                    end;
                end;
            end);
        end):catch(function(v34) --[[ Line: 86 ]]
            -- upvalues: v3 (ref)
            v3:warning("AppChatNetworking failure in refreshing first batch of new messages: {}", v34);
        end);
    end;
end;