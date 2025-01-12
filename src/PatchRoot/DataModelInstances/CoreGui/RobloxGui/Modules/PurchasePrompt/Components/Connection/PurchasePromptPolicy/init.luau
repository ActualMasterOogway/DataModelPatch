local l_CorePackages_0 = game:GetService("CorePackages");
local l_PolicyProvider_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).PolicyProvider;
local v2 = l_PolicyProvider_0.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = l_PolicyProvider_0.withGetPolicyImplementation(v2);
v3.Mapper = function(_) --[[ Line: 8 ]]
    return {};
end;
return v3;