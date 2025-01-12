local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Enabled);
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRefactorChromeAssert() and l_GetFFlagFixChromeReferences_0() then
    assert(v2(), "Chrome.Service should not be initialized when Chrome is not enabled");
    return (require(l_script_FirstAncestor_0.ChromeShared.Service));
else
    return (require(l_script_FirstAncestor_0.ChromeShared.Service));
end;