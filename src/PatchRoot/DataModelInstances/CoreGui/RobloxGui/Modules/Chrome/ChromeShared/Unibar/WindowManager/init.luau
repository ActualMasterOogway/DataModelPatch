local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.Hooks.useChromeWindowItems);
local v5 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.WindowHost);
local v6 = require(l_script_FirstAncestor_0.Parent.Flags.GetFFlagChromeTrackWindowPosition);
return function(_) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), v6 (copy), v3 (copy)
    local v8 = v4();
    local v9 = {};
    for _, v11 in v8 do
        v9["window_" .. v11.integration.id] = v2.createElement(v5, {
            position = if v6() then v3:windowPosition(v11.integration.id) else v11.integration.startingWindowPosition, 
            integration = v11
        });
    end;
    return v9;
end;