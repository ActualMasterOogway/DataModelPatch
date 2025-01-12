local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
local v7 = require(script.Parent.Parent.parseNewConversationResponse);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatExpandToGroupConversation);
local function v15(v9, v10, v11) --[[ Line: 21 ]] --[[ Name: parseResponse ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy), v5 (copy)
    local v12 = v9.responseBody.conversations[1];
    if not v12 then
        return v3.reject("No conversation returned.");
    elseif v12.status == "failed" then
        return v3.reject("Failed to create conversation.");
    else
        local v13 = v4.fromChannelsApi(v12);
        if v10 then
            local v14 = if not v13 then v6.InvalidResponse else v9.responseBody.conversations[1].status;
            v10.fireAnalyticsEvent(v5.NewConversationCreated, {
                conversationId = v13.id, 
                createConversationResult = v14, 
                participantsCount = #v13.participants, 
                createdReason = v11 or "unknown"
            });
        end;
        return v13;
    end;
end;
return function(v16, v17, v18, v19) --[[ Line: 53 ]]
    -- upvalues: v2 (copy), v8 (copy), v7 (copy), v15 (copy)
    return function(v20) --[[ Line: 59 ]]
        -- upvalues: v2 (ref), v16 (copy), v17 (copy), v8 (ref), v7 (ref), v18 (copy), v19 (copy), v15 (ref)
        return v20:dispatch(v2.rodux.CreateConversation.API(v16, v17)):andThen(function(v21) --[[ Line: 62 ]]
            -- upvalues: v8 (ref), v7 (ref), v18 (ref), v19 (ref), v15 (ref)
            if v8() then
                return v7(v21.responseBody.conversations and v21.responseBody.conversations[1], v18, v19);
            else
                return v15(v21, v18, v19);
            end;
        end);
    end;
end;