local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Navigator.MainStackNavigatorConnector);
local v5 = require(l_script_FirstAncestor_0.Components.FriendsLandingFilter);
local v6 = require(l_script_FirstAncestor_0.Components.FriendsLandingContextualMenu);
local l_DiscoverabilityOverlay_0 = v1.DiscoverabilityOverlay;
local v8 = require(l_script_FirstAncestor_0.Navigator.CINavigatorInFL);
local l_Roact_0 = v1.Roact;
local _ = require(l_script_FirstAncestor_0.Parent.React);
local v11 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v12 = require(l_script_FirstAncestor_0.Navigator.ProfileQRCodePageWrapper);
local v13 = l_Roact_0.PureComponent:extend("DiscoverabilityWrapped");
v13.render = function(v14) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), l_DiscoverabilityOverlay_0 (copy)
    return v11.with(function(v15) --[[ Line: 19 ]]
        -- upvalues: l_Roact_0 (ref), l_DiscoverabilityOverlay_0 (ref), v14 (copy)
        return l_Roact_0.createElement(l_DiscoverabilityOverlay_0, {
            navigation = v14.props.navigation, 
            context = v15
        });
    end);
end;
local v16 = {
    {
        MainStackNavigator = {
            screen = v4, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [v3.FilterByModal] = {
            screen = v5
        }
    }, 
    {
        [v3.ContextualMenu] = v6
    }, 
    {
        [v3.ContactImporter] = v8
    }, 
    {
        [v3.DiscoverabilityOverlay] = v13
    }, 
    {
        [v3.ProfileQRCodePage] = v12
    }
};
return (l_RoactNavigation_0.createRobloxStackNavigator(v16, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        absorbInputSelectable = false
    }, 
    mode = l_RoactNavigation_0.StackPresentationStyle.Overlay
}));