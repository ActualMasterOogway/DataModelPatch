local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedConversationTopModal);
local v5 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v6 = require(l_Parent_0.AppChatNetworking);
local v7 = {
    chatLandingModal = {}, 
    conversationTopModals = {}, 
    conversationTopModalsDismissed = {}, 
    pendingStateModals = {}
};
return v3.createReducer(v7, {
    [v6.rodux.GetChatLandingModal.Succeeded.name] = function(v8, v9) --[[ Line: 27 ]]
        -- upvalues: v2 (copy)
        local l_responseBody_0 = v9.responseBody;
        return v2.Dictionary.join(v8, {
            chatLandingModal = l_responseBody_0
        });
    end, 
    [v6.rodux.GetConversationTopModal.Succeeded.name] = function(v11, v12) --[[ Line: 39 ]]
        -- upvalues: v2 (copy)
        local v13 = v12.postBody and v12.postBody.conversation_id;
        if not v13 then
            return v11;
        else
            return v2.Dictionary.join(v11, {
                conversationTopModals = v2.Dictionary.join(v11.conversationTopModals, {
                    [v13] = v12.responseBody
                })
            });
        end;
    end, 
    [v4.name] = function(v14, v15) --[[ Line: 58 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_0 = v15.conversationId;
        local l_modalVariant_0 = v15.modalVariant;
        if not l_conversationId_0 or not l_modalVariant_0 then
            return v14;
        else
            return v2.Dictionary.join(v14, {
                conversationTopModalsDismissed = v2.Dictionary.join(v14.conversationTopModalsDismissed, {
                    [l_conversationId_0] = v2.Dictionary.join(v14.conversationTopModalsDismissed[l_conversationId_0] or {}, {
                        [l_modalVariant_0] = true
                    })
                })
            });
        end;
    end, 
    [v6.rodux.GetPendingStateModal.Succeeded.name] = function(v18, v19) --[[ Line: 73 ]]
        -- upvalues: v2 (copy)
        local v20 = v19.postBody and v19.postBody.conversation_id;
        if not v20 then
            return v18;
        else
            return v2.Dictionary.join(v18, {
                pendingStateModals = v2.Dictionary.join(v18.pendingStateModals, {
                    [v20] = v19.responseBody
                })
            });
        end;
    end, 
    [v5.name] = function(v21, v22) --[[ Line: 92 ]]
        -- upvalues: v2 (copy)
        local l_conversationId_1 = v22.conversationId;
        if not l_conversationId_1 then
            return v21;
        else
            return v2.Dictionary.join(v21, {
                conversationTopModals = v2.Dictionary.join(v21.conversationTopModals, {
                    [l_conversationId_1] = v2.None
                }), 
                pendingStateModals = v2.Dictionary.join(v21.pendingStateModals, {
                    [l_conversationId_1] = v2.None
                })
            });
        end;
    end
});