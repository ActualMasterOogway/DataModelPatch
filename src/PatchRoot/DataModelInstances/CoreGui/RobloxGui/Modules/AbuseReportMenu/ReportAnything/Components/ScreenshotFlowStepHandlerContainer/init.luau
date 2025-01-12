local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.ReportAnything.Resources.Constants);
local v4 = require(script.Parent.ScreenshotFlowStepHandler);
local v5 = v2.PureComponent:extend("ScreenshotFlowStepHandlerContainer");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v7 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationCoreScriptsWrapper_0 = v7.FocusNavigationCoreScriptsWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
v5.render = function(v10) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), v3 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v4 (copy)
    return v2.createElement(l_CoreScriptsRootProvider_0, {}, {
        FocusNavigationCoreScriptsWrapper = v2.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
            selectionGroupName = v3.ScreenshotFlowStepHandlerRootName, 
            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            ScreenshotFlowStepHandlerContainer = v2.createElement(v4, v10.props)
        })
    });
end;
return v5;