local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = {
    ActiveUserSignedOut = require(l_Parent_0.AppCommonLib).Signal.new()
};
local v2 = nil;
pcall(function() --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    v2 = game:GetService("ThirdPartyUserService");
end);
return v2 or v1;