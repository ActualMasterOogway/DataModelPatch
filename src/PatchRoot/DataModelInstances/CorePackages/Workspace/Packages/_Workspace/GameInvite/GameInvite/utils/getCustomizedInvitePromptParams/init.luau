local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local v1 = require(script.Parent.getCustomizedInvitePromptUserId);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
return function(v3, v4, v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    local v6 = v1(v3);
    local v7, v8 = v5(v4, v6);
    if not v7 then
        return nil;
    else
        local v9 = {
            trigger = v4
        };
        if v8 and v3 then
            if v3.InviteMessageId ~= "" then
                v9.inviteMessageId = v3.InviteMessageId;
            end;
            if v6 then
                v9.inviteUserId = v6;
            end;
            if v3.PromptMessage ~= "" then
                v9.promptMessage = v3.PromptMessage;
            end;
            if v3.LaunchData ~= "" then
                v9.launchData = v3.LaunchData;
            end;
        end;
        return v9;
    end;
end;