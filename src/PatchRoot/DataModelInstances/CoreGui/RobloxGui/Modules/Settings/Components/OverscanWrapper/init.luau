local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v4 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local l_DeviceType_0 = v6.DeviceType;
OverscanWrapper = function(v9) --[[ Line: 18 ]] --[[ Name: OverscanWrapper ]]
    -- upvalues: l_DeviceType_0 (copy), v5 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    return function(v10) --[[ Line: 19 ]]
        -- upvalues: l_DeviceType_0 (ref), v5 (ref), l_CoreScriptsRootProvider_0 (ref), v4 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v9 (copy)
        local v11 = {
            deviceType = l_DeviceType_0.Console
        };
        return v5.createElement(l_CoreScriptsRootProvider_0, {
            styleOverride = v11
        }, {
            FocusNavigationEffects = v5.createElement(v4, {
                selectionGroupName = "OverscanScreen", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                Overscan = v5.createElement(v9, v10)
            })
        });
    end;
end;
return OverscanWrapper;