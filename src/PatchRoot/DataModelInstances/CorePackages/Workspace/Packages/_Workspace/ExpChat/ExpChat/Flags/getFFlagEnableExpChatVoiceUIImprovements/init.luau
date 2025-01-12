local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v2 = game:DefineFastFlag("EnableExpChatVoiceUIImprovements6", false);
local v3 = game:DefineFastFlag("DebugEnableExpChatImprovements", false);
local v4 = game:DefineFastString("BillboardRefactorIXPLayerName", "Voice.Performance");
local v5 = game:DefineFastString("BillboardRefactorIXPLayerValue", "BillboardRefactorEnabled");
local v6 = nil;
local v7 = nil;
if v2 then
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
        -- upvalues: v1 (copy), v4 (copy)
        return v1:GetLayerData(v4);
    end);
    v6 = l_status_0;
    v7 = l_result_0;
    if not v6 or not v7 or v7[v5] == nil then
        return function() --[[ Line: 19 ]]
            return false;
        end;
    else
        v1:LogUserLayerExposure(v4);
    end;
end;
return function() --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (ref), v7 (ref), v5 (copy)
    return v3 or v2 and v6 and v7 and v7[v5];
end;