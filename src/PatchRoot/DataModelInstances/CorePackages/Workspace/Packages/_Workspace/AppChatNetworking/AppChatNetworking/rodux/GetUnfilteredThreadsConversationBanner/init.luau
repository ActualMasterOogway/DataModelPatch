local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(l_script_FirstAncestor_0.Constants);
return require(script.Parent.RoduxNetworking).POST(script, function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v3(v1):path("v1"):path("get-modal-sequence"):body({
        conversation_id = v4, 
        modal_sequence = v2.UnfilteredThreadsConversationBannerModalSequence
    });
end);