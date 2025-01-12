local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_Parent_0.EditProfile);
local v4 = require(l_Parent_0.SetAlias);
local v5 = require(l_script_FirstAncestor_0.Components.ProfileContextualMenu);
local l_EditProfilePage_0 = v3.EditProfilePage;
local l_EditDisplayNameModal_0 = v3.EditDisplayNameModal;
local l_EditDisplayNameErrorModal_0 = v3.EditDisplayNameErrorModal;
local l_UsernameInsufficientFundsModal_0 = v3.UsernameInsufficientFundsModal;
local l_EditDescriptionModal_0 = v3.EditDescriptionModal;
local v11 = require(l_script_FirstAncestor_0.Components.ProfilePlatformViewAdaptor);
local l_SetAliasModal_0 = v4.SetAliasModal;
local v13 = require(l_Parent_0.RoactNavigation);
local v14 = {
    overlayEnabled = true, 
    overlayTransparency = 0.5, 
    absorbInput = true, 
    renderUnderlyingPage = true
};
return (v13.createRobloxStackNavigator({
    {
        [v2.Screens.ProfileMain] = v11
    }, 
    {
        [v2.Screens.EditProfilePage] = {
            screen = l_EditProfilePage_0, 
            navigationOptions = v14
        }
    }, 
    {
        [v2.Screens.EditDisplayNameModal] = {
            screen = l_EditDisplayNameModal_0, 
            navigationOptions = v14
        }
    }, 
    {
        [v2.Screens.EditDescriptionModal] = {
            screen = l_EditDescriptionModal_0, 
            navigationOptions = v14
        }
    }, 
    {
        [v2.Screens.EditDisplayNameErrorModal] = {
            screen = l_EditDisplayNameErrorModal_0, 
            navigationOptions = v14
        }
    }, 
    {
        [v2.Screens.UsernameInsufficientFundsModal] = {
            screen = l_UsernameInsufficientFundsModal_0, 
            navigationOptions = v14
        }
    }, 
    {
        [v2.Screens.SetAliasModal] = {
            screen = l_SetAliasModal_0, 
            navigationOptions = v14
        }
    }, 
    {
        [v2.Screens.ContextualMenu] = {
            screen = v5, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        overlayTransparency = 1, 
        renderUnderlyingPage = true, 
        disableBackButton = true
    }, 
    mode = v13.StackPresentationStyle.Overlay
}));