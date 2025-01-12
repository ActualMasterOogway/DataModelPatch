local v0 = game:DefineFastFlag("EnableChatWindowMemoizationV2", false);
local v1 = game:DefineFastFlag("DebugEnableChatWindowMemoization", false);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v3 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v4 = game:DefineFastString("ChatMemoizationIXPLayerName", "Voice.Performance");
local v5 = game:DefineFastString("ChatMemoizationIXPLayerValue", "ChatMemoizationEnabled");
local v6 = nil;
local v7 = nil;
if v0 then
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
        -- upvalues: v3 (copy), v4 (copy)
        return v3:GetLayerData(v4);
    end);
    v6 = l_status_0;
    v7 = l_result_0;
    if not v6 or not v7 or v7[v5] == nil then
        return function() --[[ Line: 19 ]]
            return false;
        end;
    else
        v3:LogUserLayerExposure(v4);
    end;
end;
return function() --[[ Line: 27 ]]
    -- upvalues: v1 (copy), v6 (ref), v7 (ref), v5 (copy)
    return v1 or game:GetFastFlag("EnableChatWindowMemoizationV2") and v6 and v7 and v7[v5];
end;