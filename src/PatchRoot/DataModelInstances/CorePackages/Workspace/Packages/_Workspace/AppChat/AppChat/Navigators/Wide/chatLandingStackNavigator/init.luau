local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingScreenWithSwitchNavigator);
local v5 = require(l_script_FirstAncestor_0.Components.CreateNewChat.CreateNewChatScreen);
local v6 = require(l_script_FirstAncestor_0.Components.EditChatMembers.EditChatMembersScreen);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Navigators");
local v8 = require(l_script_FirstAncestor_1.createOverlayTopBarStackNavigator);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRemoveDynamicRequires);
local function _(v11, v12) --[[ Line: 18 ]] --[[ Name: wrapScreenInOverlayNavigator ]]
    -- upvalues: v8 (copy)
    return v8({
        {
            [v11] = v12
        }
    });
end;
local v14 = {
    backButtonEnabled = true, 
    tabBarVisible = true, 
    overlayEnabled = true, 
    overlayTransparency = 0.5, 
    absorbInput = true, 
    renderUnderlyingPage = false
};
return v2.createRobloxStackNavigator({
    {
        [v3.ChatLanding] = {
            screen = v4, 
            navigationOptions = v10() and function() --[[ Line: 41 ]]
                -- upvalues: l_default_0 (copy)
                if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then
                    return {
                        backButtonEnabled = false, 
                        tabBarVisible = true
                    };
                else
                    return {};
                end;
            end or if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then {
                backButtonEnabled = false, 
                tabBarVisible = true
            } else {}
        }
    }, 
    {
        CreateNewChatScreenWrapper = {
            screen = v8({
                {
                    [v3.CreateNewChat] = v5
                }
            }), 
            navigationOptions = v14
        }
    }, 
    {
        EditChatMembersScreenWrapper = {
            screen = v8({
                {
                    [v3.EditChatMembers] = v6
                }
            }), 
            navigationOptions = v14
        }
    }
}, {
    mode = v2.StackPresentationStyle.Overlay
});