local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v5 = require(l_RobloxGui_0.Modules.Common.Hooks.usePlayerCurrentScreenOrientation);
local v6 = require(l_RobloxGui_0.Modules.GamepadDisconnect.CoreScriptsGamepadDisconnectListener);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Roact);
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local l_useLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogInputTypeChanged;
local l_useLogOrientationChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogOrientationChanged;
local l_GetFFlagLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLogInputTypeChanged;
local l_GetFFlagLogOrientationChanged_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLogOrientationChanged;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v15 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
v8.mount(v7.createElement(function(_) --[[ Line: 25 ]] --[[ Name: CoreScriptsGlobalEffects ]]
    -- upvalues: l_GetFFlagLogInputTypeChanged_0 (copy), l_game_EngineFeature_0 (copy), l_useLogInputTypeChanged_0 (copy), v15 (copy), l_RbxAnalyticsService_0 (copy), l_GetFFlagLogOrientationChanged_0 (copy), v5 (copy), l_useLogOrientationChanged_0 (copy), l_DeviceType_0 (copy), v7 (copy), l_CoreScriptsRootProvider_0 (copy), v6 (copy)
    if l_GetFFlagLogInputTypeChanged_0() then
        if l_game_EngineFeature_0 then
            l_useLogInputTypeChanged_0(v15, l_RbxAnalyticsService_0:GetPlaySessionId());
        else
            l_useLogInputTypeChanged_0(v15);
        end;
    end;
    if l_GetFFlagLogOrientationChanged_0() then
        local v18 = v5();
        l_useLogOrientationChanged_0(v15, v18);
    end;
    local v19 = {
        deviceType = l_DeviceType_0.Console
    };
    return v7.createElement(l_CoreScriptsRootProvider_0, {
        styleOverride = v19
    }, {
        CoreScriptsGamepadDisconnectListener = v7.createElement(v6)
    });
end), l_CoreGui_0, "CoreScriptsGlobalEffects");