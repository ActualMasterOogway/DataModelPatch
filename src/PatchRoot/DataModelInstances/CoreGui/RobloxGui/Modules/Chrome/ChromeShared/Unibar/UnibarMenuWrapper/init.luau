local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.ReactUtils);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Unibar.UnibarMenu);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local v9 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local l_GetFFlagRemoveChromeRobloxGuiReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagRemoveChromeRobloxGuiReferences;
local l_SelectionCursorProvider_0 = v6.App.SelectionImage.SelectionCursorProvider;
return function(v12) --[[ Line: 21 ]] --[[ Name: UnibarMenuWrapper ]]
    -- upvalues: v4 (copy), v3 (copy), l_GetFFlagRemoveChromeRobloxGuiReferences_0 (copy), l_SelectionCursorProvider_0 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), v9 (copy), v5 (copy)
    return v4.createElement(v3.ContextStack, {
        providers = if l_GetFFlagRemoveChromeRobloxGuiReferences_0() then {
            v4.createElement(l_SelectionCursorProvider_0), 
            v4.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            })
        } else {
            v4.createElement(v9.Provider), 
            v4.createElement(l_SelectionCursorProvider_0), 
            v4.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            })
        }
    }, {
        UnibarMenu = v4.createElement(v5, v12)
    });
end;