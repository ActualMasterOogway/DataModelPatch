local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v7 = game:DefineFastFlag("AppChatRemainingOlderMessagesLogResolve", false);
local function v14(v8) --[[ Line: 14 ]] --[[ Name: getNewestWithNilPreviousMessageId ]]
    -- upvalues: v6 (copy)
    local v9 = v6(v8, "keys");
    local v10 = v6(v8, "values");
    local v11 = nil;
    for _, v13 in pairs(v9) do
        if v10[v13] and v10[v13].previousMessageId == nil then
            return v13;
        end;
    end;
    return v11;
end;
return function(v15, v16) --[[ Line: 29 ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v3 (copy), v7 (copy), v14 (copy)
    v5:info("Maybe getting older messages for {}", v16);
    return function(v17) --[[ Line: 31 ]]
        -- upvalues: v4 (ref), v16 (copy), v2 (ref), v3 (ref), v7 (ref), v5 (ref), v14 (ref), v15 (copy)
        local l_ChatAppReducer_0 = v17:getState().ChatAppReducer;
        if not l_ChatAppReducer_0 or not l_ChatAppReducer_0.Conversations then
            return v4.resolve();
        else
            local v19 = l_ChatAppReducer_0.Conversations[v16];
            local v20 = v2.rodux.GetOlderMessages.getStatus(v17:getState(), v16) == v3.Enum.NetworkStatus.Fetching;
            if v7 then
                if not v19 then
                    v5:info("Canceling since conversation id {} is not in local state", v16);
                    return v4.resolve();
                elseif v20 then
                    v5:info("Canceling since we are already fetching older messages for conversation id {}", v16);
                    return v4.resolve();
                elseif v19.fetchedOldestMessage then
                    v5:info("Canceling since we have already fetched the oldest message for conversation id {}", v16);
                    return v4.resolve();
                end;
            elseif not v19 or v20 or v19.fetchedOldestMessage then
                return v4.resolve();
            end;
            local v21 = v14(v19.messages);
            return v15(v16, v21, v19.nextCursor);
        end;
    end;
end;