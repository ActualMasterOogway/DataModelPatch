local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_RoactNavigation_0 = v2.RoactNavigation;
local v5 = require(l_script_FirstAncestor_0.Components.FriendsLandingScreen);
local v6 = require(l_script_FirstAncestor_0.AddFriends.Components.AddFriendsScreen);
local v7 = require(l_script_FirstAncestor_0.Components.FriendsLandingScreen.NavigationOptions);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v9 = require(l_script_FirstAncestor_0.EnumScreens);
local v10 = require(l_script_FirstAncestor_0.Navigator.PlayerSearchWrapper);
local v11 = require(l_script_FirstAncestor_0.Components.HeaderBarCenterView);
local v12 = require(l_script_FirstAncestor_0.Components.HeaderBarRightView);
local v13 = require(l_script_FirstAncestor_0.Navigator.GatewayComponent);
return (l_RoactNavigation_0.createRobloxStackNavigator({
    {
        [v9.Gateway] = {
            screen = v13, 
            navigationOptions = {
                headerText = {}
            }
        }
    }, 
    {
        [v9.FriendsLanding] = {
            screen = v5, 
            navigationOptions = v7
        }
    }, 
    {
        [v9.AddFriends] = {
            screen = v6, 
            navigationOptions = function(v14) --[[ Line: 44 ]] --[[ Name: navigationOptions ]]
                -- upvalues: l_Roact_0 (copy), v11 (copy), v8 (copy), v12 (copy)
                return {
                    headerText = {
                        raw = "Feature.Chat.Label.AddFriends"
                    }, 
                    renderCenter = function() --[[ Line: 49 ]] --[[ Name: renderCenter ]]
                        -- upvalues: l_Roact_0 (ref), v11 (ref), v14 (copy)
                        return l_Roact_0.createElement(v11, v14);
                    end, 
                    renderRight = function() --[[ Line: 52 ]] --[[ Name: renderRight ]]
                        -- upvalues: v8 (ref), l_Roact_0 (ref), v12 (ref), v14 (copy)
                        return v8.with(function(v15) --[[ Line: 53 ]]
                            -- upvalues: l_Roact_0 (ref), v12 (ref), v14 (ref)
                            if v15.addFriendsPageSearchbarEnabled then
                                return false;
                            else
                                return l_Roact_0.createElement(v12, v14);
                            end;
                        end);
                    end, 
                    useSecondaryHeader = true, 
                    tabBarVisible = false, 
                    transparent = true, 
                    absorbInputSelectable = false
                };
            end
        }
    }, 
    {
        [v9.SearchFriends] = {
            screen = function(v16) --[[ Line: 71 ]] --[[ Name: screen ]]
                -- upvalues: l_Roact_0 (copy), v10 (copy)
                return l_Roact_0.createElement(v10, {
                    navigation = v16.navigation
                });
            end, 
            navigationOptions = function(v17) --[[ Line: 76 ]] --[[ Name: navigationOptions ]]
                -- upvalues: l_Roact_0 (copy), v11 (copy), v12 (copy)
                return {
                    headerText = {
                        raw = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople"
                    }, 
                    tabBarVisible = false, 
                    renderCenter = function() --[[ Line: 82 ]] --[[ Name: renderCenter ]]
                        -- upvalues: l_Roact_0 (ref), v11 (ref), v17 (copy)
                        return l_Roact_0.createElement(v11, v17);
                    end, 
                    renderRight = function() --[[ Line: 85 ]] --[[ Name: renderRight ]]
                        -- upvalues: l_Roact_0 (ref), v12 (ref), v17 (copy)
                        return l_Roact_0.createElement(v12, v17);
                    end, 
                    useSecondaryHeader = true
                };
            end
        }
    }
}, {
    transitionConfig = function() --[[ Line: 19 ]] --[[ Name: getTransitionConfig ]]
        -- upvalues: l_UserGameSettings_0 (copy), l_RoactNavigation_0 (copy)
        if l_UserGameSettings_0.ReducedMotion then
            return l_RoactNavigation_0.StackViewTransitionConfigs.FadeInPlace;
        else
            return l_RoactNavigation_0.StackViewTransitionConfigs.SlideFromRight;
        end;
    end
}));