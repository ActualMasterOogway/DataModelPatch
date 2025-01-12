local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local l_Parent_0 = script.Parent;
local l_Connection_0 = l_Parent_0.Components.Connection;
local v7 = require(l_Parent_0.Components.Presentation.PlayerListApp);
local v8 = require(l_Parent_0.Components.PresentationMobile.PlayerListApp);
local l_Provider_0 = require(l_Connection_0.LayoutValues).Provider;
local v10 = require(l_Parent_0.CreateLayoutValues);
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v12 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v13 = require(l_Parent_0.PlayerListInitialVisibleState);
local v14 = v2.PureComponent:extend("PlayerListSwitcher");
v14.didMount = function(v15) --[[ Line: 25 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy)
    v15.props.setPlayerListVisible(v13());
end;
v14.wrapWithUiModeStyleProvider = function(v16, v17) --[[ Line: 29 ]] --[[ Name: wrapWithUiModeStyleProvider ]]
    -- upvalues: v2 (copy), l_UiModeStyleProvider_0 (copy)
    return {
        ThemeProvider = v2.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = v16.props.appStyleForUiModeStyleProvider.themeName, 
                fontName = v16.props.appStyleForUiModeStyleProvider.fontName
            }
        }, v17)
    };
end;
v14.render = function(v18) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Provider_0 (copy), v10 (copy), v11 (copy), v8 (copy), v7 (copy)
    return v2.createElement(l_Provider_0, {
        layoutValues = v10(v11:IsEnabled())
    }, v18:wrapWithUiModeStyleProvider({
        PlayerListApp = v18.props.isSmallTouchDevice and v2.createElement(v8, {
            setLayerCollectorEnabled = v18.props.setLayerCollectorEnabled
        }) or v2.createElement(v7, {
            setLayerCollectorEnabled = v18.props.setLayerCollectorEnabled
        })
    }));
end;
v14.didUpdate = function(v19) --[[ Line: 56 ]] --[[ Name: didUpdate ]]
    v19.props.setPlayerListVisible(not v19.props.isSmallTouchDevice);
end;
return v3.connect(function(v20) --[[ Line: 60 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v20.displayOptions.isSmallTouchDevice
    };
end, function(v21) --[[ Line: 66 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy)
    return {
        setPlayerListVisible = function(v22) --[[ Line: 68 ]] --[[ Name: setPlayerListVisible ]]
            -- upvalues: v21 (copy), v12 (ref)
            return v21(v12(v22));
        end
    };
end)(v14);