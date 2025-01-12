local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Service);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local l_GetFFlagChromePeekArchitecture_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromePeekArchitecture;
local function v6() --[[ Line: 12 ]] --[[ Name: onDismiss ]]
    -- upvalues: v2 (copy)
    v2:dismissCurrentPeek();
end;
if l_GetFFlagChromePeekArchitecture_0() then
    return (v2:register({
        id = "peek_close", 
        label = "CoreScripts.TopBar.PeekClose", 
        components = {
            Icon = function(_) --[[ Line: 21 ]] --[[ Name: Icon ]]
                -- upvalues: v3 (copy), v4 (copy), v6 (copy)
                return v3.createElement(v4.DismissButton, {
                    onDismiss = v6
                });
            end
        }, 
        initialAvailability = v2.AvailabilitySignal.Available
    }));
else
    return nil;
end;