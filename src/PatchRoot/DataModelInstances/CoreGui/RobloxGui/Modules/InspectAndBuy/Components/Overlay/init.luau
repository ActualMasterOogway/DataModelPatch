local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = v5.FocusNavigationService.new(v5.EngineInterface.CoreGui);
local v7 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_Provider_0 = v7.FocusNavigableSurfaceRegistry.Provider;
local v9 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_Parent_0 = script.Parent.Parent;
local v12 = require(l_Parent_0.Colors);
local v13 = require(l_Parent_0.Components.OverlayComponents);
local function v15(v14) --[[ Line: 33 ]] --[[ Name: selectOverlayComponent ]]
    -- upvalues: v13 (copy)
    return v13[v14.overlay.overlay];
end;
local function v17(v16) --[[ Line: 37 ]] --[[ Name: selectOverlayProps ]]
    return v16.overlay.overlayProps;
end;
return function(_) --[[ Line: 41 ]] --[[ Name: Overlay ]]
    -- upvalues: l_useSelector_0 (copy), v15 (copy), v17 (copy), l_useStyle_0 (copy), v2 (copy), v5 (copy), v6 (copy), l_Provider_0 (copy), v9 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v12 (copy)
    local v19 = l_useSelector_0(v15);
    local v20 = l_useSelector_0(v17);
    local v21 = l_useStyle_0();
    return v2.createElement(v5.FocusNavigationContext.Provider, {
        value = v6
    }, {
        FocusNavigationRegistryProvider = v2.createElement(l_Provider_0, nil, {
            FocusNavigationEffects = v2.createElement(v9, {
                selectionGroupName = "InspectAndBuyOverlay", 
                focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
            }, {
                OverlayContainer = v2.createElement("Frame", {
                    BackgroundTransparency = v21.Tokens.Semantic.Color.Common.Overlay.Transparency, 
                    BackgroundColor3 = v12.Black, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    Visible = v19 ~= nil
                }, {
                    Overlay = v19 and v2.createElement(v19, v20) or nil
                })
            })
        })
    });
end;