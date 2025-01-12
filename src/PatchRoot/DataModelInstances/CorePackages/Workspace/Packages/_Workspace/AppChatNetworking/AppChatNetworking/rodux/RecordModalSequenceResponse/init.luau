local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local _ = require(l_script_FirstAncestor_0.responses.SharedTypes);
return require(script.Parent.RoduxNetworking).POST(script, function(v3, v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return v3(v1):path("v1"):path("record-modal-sequence-response"):body({
        action_type = v4, 
        modal_sequence = v5, 
        modal_id = v6
    });
end);