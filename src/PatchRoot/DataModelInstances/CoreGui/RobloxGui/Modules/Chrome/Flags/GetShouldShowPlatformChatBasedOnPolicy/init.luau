local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = game:DefineFastFlag("AppChatDisableInExpU13", false);
local v2 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1 then
        return (v2.getAppFeaturePolicies().getCanSeeChatTab());
    else
        return true;
    end;
end;