local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v4 = require(l_Parent_0.Components.DiscoverabilityOverlay);
return (l_RoactNavigation_0.createRobloxSwitchNavigator({
    {
        [l_EnumScreens_0.DiscoverabilityOverlay] = v4
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        overlayTransparency = 1
    }, 
    mode = l_RoactNavigation_0.StackPresentationStyle.Modal
}));