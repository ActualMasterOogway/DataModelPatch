local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_networkImpl_0 = require(l_script_FirstAncestor_0.GameInviteDependencies).networkImpl;
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v3 = require(l_script_FirstAncestor_0.Requests.GetCanSendAndCanCustomizeInvites);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_networkImpl_0 (copy)
    local v6, v7 = v3(l_networkImpl_0, v4, v5):await();
    if v6 and v7 and v7.responseBody then
        return v7.responseBody.canPrompt or false, v7.responseBody.canCustomize or false;
    else
        return false, false;
    end;
end;