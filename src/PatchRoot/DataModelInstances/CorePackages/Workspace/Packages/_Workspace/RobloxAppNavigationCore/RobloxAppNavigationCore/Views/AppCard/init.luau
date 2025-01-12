local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local l_SceneView_0 = require(l_Parent_0.RoactNavigation).SceneView;
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v3.FocusNavigableSurfaceWrapper;
local v5 = require(l_Parent_0.Navigation);
local l_useEarlyIsFocused_0 = v5.useEarlyIsFocused;
local l_getCurrentRouteKey_0 = v5.getCurrentRouteKey;
local l_getRouteKeyIsInNavigationState_0 = v5.getRouteKeyIsInNavigationState;
local l_FFlagEnableRNFocusRestoration_0 = require(l_Parent_0.SharedFlags).FFlagEnableRNFocusRestoration;
local function _(v10, v11) --[[ Line: 29 ]] --[[ Name: getIsSelectionFocusable ]]
    -- upvalues: l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy)
    local v12 = l_getCurrentRouteKey_0(v10);
    if v11.options.hasSubNavigation and v12 ~= nil then
        return (l_getRouteKeyIsInNavigationState_0(v12, v11.state));
    else
        return v12 == v11.key;
    end;
end;
return function(v14) --[[ Line: 37 ]] --[[ Name: AppCard ]]
    -- upvalues: l_FFlagEnableRNFocusRestoration_0 (copy), l_useEarlyIsFocused_0 (copy), l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy), v1 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v3 (copy), l_SceneView_0 (copy)
    if l_FFlagEnableRNFocusRestoration_0 then
        local l_descriptor_0 = v14.descriptor;
        local l_navigation_0 = l_descriptor_0.navigation;
        local v17 = l_useEarlyIsFocused_0() and v14.isActive;
        local v18 = l_getCurrentRouteKey_0(l_navigation_0);
        local v19 = if l_descriptor_0.options.hasSubNavigation and v18 ~= nil then l_getRouteKeyIsInNavigationState_0(v18, l_descriptor_0.state) else v18 == l_descriptor_0.key;
        return (v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
            isFocusable = v17 and v19, 
            surfaceIdentifier = v3.FocusNavigableSurfaceIdentifierEnum.RouterView, 
            shouldRestoreFocus = true, 
            frameProps = {
                Visible = v14.isVisible, 
                ZIndex = v14.ZIndex
            }
        }, {
            SceneView = v1.createElement(l_SceneView_0, {
                navigation = l_navigation_0, 
                component = l_descriptor_0.getComponent(), 
                screenProps = v14.screenProps
            })
        }));
    else
        return (v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = v14.isVisible, 
            ZIndex = v14.ZIndex
        }, {
            SceneView = v1.createElement(l_SceneView_0, {
                navigation = v14.descriptor.navigation, 
                component = v14.descriptor.getComponent(), 
                screenProps = v14.screenProps
            })
        }));
    end;
end;