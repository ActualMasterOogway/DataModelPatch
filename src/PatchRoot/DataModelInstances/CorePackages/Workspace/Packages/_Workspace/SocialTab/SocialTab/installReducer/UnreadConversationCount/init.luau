local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local l_Rodux_0 = require(l_script_FirstAncestor_0.dependencies).Rodux;
local v4 = require(l_script_FirstAncestor_0.Requests.GetUnreadConversationCount);
return l_Rodux_0.createReducer(0, {
    [v4.Succeeded.name] = function(v5, v6) --[[ Line: 11 ]]
        if v6.responseBody and v6.responseBody.count then
            return v6.responseBody.count;
        else
            return v5;
        end;
    end, 
    [v2.rodux.GetConversationMetadata.Succeeded.name] = function(v7, v8) --[[ Line: 19 ]]
        if v8.responseBody and v8.responseBody.global_unread_message_count then
            return v8.responseBody.global_unread_message_count;
        else
            return v7;
        end;
    end
});