local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v4 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Conversations.hasConversationChanged);
local v6 = require(l_script_FirstAncestor_0.Conversations.getShouldRefetchMessages);
local v7 = require(l_script_FirstAncestor_0.Logger):new("paginateAndRefreshConversations");
local v8 = require(l_script_FirstAncestor_0.Conversations.Thunks.paginateForNewerMessages);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatFixExtraMessageRefetch);
local function v10(v11) --[[ Line: 29 ]] --[[ Name: paginateAndRefreshConversations ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v9 (copy), v6 (copy), v7 (copy), v8 (copy), v10 (copy)
    return function(v12) --[[ Line: 30 ]]
        -- upvalues: v2 (ref), v11 (copy), v3 (ref), v4 (ref), v5 (ref), v9 (ref), v6 (ref), v7 (ref), v8 (ref), v10 (ref)
        local v13 = v12:getState();
        return v12:dispatch(v2.rodux.GetUserConversations.API(v11)):andThen(function(v14) --[[ Line: 37 ]]
            -- upvalues: v3 (ref), v13 (copy), v4 (ref), v5 (ref), v9 (ref), v6 (ref), v7 (ref), v12 (copy), v8 (ref), v10 (ref)
            for _, v16 in v14.responseBody.conversations do
                local v17 = v3(v13, (("ChatAppReducer.Conversations.%*"):format((tostring(v16.id)))));
                local v18 = v4.fromChannelsApi(v16);
                if v5({
                    new = v18, 
                    existing = v17
                }) then
                    if if v9() then v6({
                        new = v18, 
                        existing = v17
                    }) else v17 then
                        v7:debug("Fetching missing messages for conversation: {}", v18.id);
                        v12:dispatch(v8(v18));
                    end;
                else
                    return;
                end;
            end;
            local l_next_cursor_0 = v14.responseBody.next_cursor;
            if l_next_cursor_0 and l_next_cursor_0 ~= "" and typeof(l_next_cursor_0) == "string" then
                return v12:dispatch(v10(l_next_cursor_0));
            else
                return;
            end;
        end):catch(function(v20) --[[ Line: 67 ]]
            warn("Failure in paginateAndRefreshConversations: ", (tostring(v20)));
            return v20;
        end);
    end;
end;
return function() --[[ Line: 74 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v9 (copy), v6 (copy), v7 (copy), v8 (copy), v10 (copy)
    return function(v21) --[[ Line: 75 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v9 (ref), v6 (ref), v7 (ref), v8 (ref), v10 (ref)
        local v22 = nil;
        return v21:dispatch(function(v23) --[[ Line: 30 ]]
            -- upvalues: v2 (ref), v22 (copy), v3 (ref), v4 (ref), v5 (ref), v9 (ref), v6 (ref), v7 (ref), v8 (ref), v10 (ref)
            local v24 = v23:getState();
            return v23:dispatch(v2.rodux.GetUserConversations.API(v22)):andThen(function(v25) --[[ Line: 37 ]]
                -- upvalues: v3 (ref), v24 (copy), v4 (ref), v5 (ref), v9 (ref), v6 (ref), v7 (ref), v23 (copy), v8 (ref), v10 (ref)
                for _, v27 in v25.responseBody.conversations do
                    local v28 = v3(v24, (("ChatAppReducer.Conversations.%*"):format((tostring(v27.id)))));
                    local v29 = v4.fromChannelsApi(v27);
                    if v5({
                        new = v29, 
                        existing = v28
                    }) then
                        if if v9() then v6({
                            new = v29, 
                            existing = v28
                        }) else v28 then
                            v7:debug("Fetching missing messages for conversation: {}", v29.id);
                            v23:dispatch(v8(v29));
                        end;
                    else
                        return;
                    end;
                end;
                local l_next_cursor_1 = v25.responseBody.next_cursor;
                if l_next_cursor_1 and l_next_cursor_1 ~= "" and typeof(l_next_cursor_1) == "string" then
                    return v23:dispatch(v10(l_next_cursor_1));
                else
                    return;
                end;
            end):catch(function(v31) --[[ Line: 67 ]]
                warn("Failure in paginateAndRefreshConversations: ", (tostring(v31)));
                return v31;
            end);
        end);
    end;
end;