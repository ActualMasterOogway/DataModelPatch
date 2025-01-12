local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v4 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v5 = require(l_RobloxGui_0.Modules.Common.Hooks.useScreenSize);
local v6 = require(script.ChromeAnalytics);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v9 = v8.GetFFlagUnibarLuaOcclusionMetrics();
local v10 = require(script.OcclusionMetricsManager);
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = v8.GetFFlagRemoveChromeRobloxGuiReferences;
return function(_) --[[ Line: 18 ]] --[[ Name: ChromeAnalyticsListener ]]
    -- upvalues: v6 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), v4 (copy), v3 (copy), v5 (copy), v9 (copy), v7 (copy), v10 (copy)
    local l_default_0 = v6.default;
    local _ = nil;
    l_default_0:setScreenSize(if l_GetFFlagRemoveChromeRobloxGuiReferences_0() then v4(v3.screenSize) else v5());
    if v9 then
        return v7.createElement(v10);
    else
        return nil;
    end;
end;