local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script, function(v2, v3, v4) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return v2(v1):path("v1"):path("update-conversations"):body({
        conversations = {
            {
                id = v3, 
                name = v4
            }
        }
    }):setStatusIds(v3);
end);