local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_BackBehavior_0 = v1.RoactNavigation.BackBehavior;
local v6 = require(l_script_FirstAncestor_0.SocialTabContext);
local v7 = require(l_script_FirstAncestor_0.SocialTabEventReceiver);
local v8 = require(l_script_FirstAncestor_0.SocialTabNavigationEventReceiver);
local v9 = require(l_script_FirstAncestor_0.Components.SocialTabContainer);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local l_default_0 = v1.SocialCommon.Experiments.NewChatTabExperimentation.default;
local l_ChatPlacementContext_0 = v1.AppChat.Contexts.ChatPlacementContext;
local function v13(v14) --[[ Line: 16 ]] --[[ Name: getActiveChildNavigationOptions ]]
    -- upvalues: v13 (copy), l_RoactNavigation_0 (copy)
    local l_state_0 = v14.state;
    local l_index_0 = l_state_0.index;
    local v17 = l_state_0.routes and l_state_0.routes[l_index_0];
    if v17 and v17.routes then
        local v18 = v14.getChildNavigation(v17.key);
        return v13(v18);
    else
        return l_RoactNavigation_0.getActiveChildNavigationOptions(v14);
    end;
end;
local function v19(v20) --[[ Line: 29 ]] --[[ Name: getActiveRouteName ]]
    -- upvalues: v19 (copy)
    local l_index_1 = v20.index;
    local v22 = v20.routes and v20.routes[l_index_1];
    if v22 then
        return v19(v22);
    else
        return v20.routeName;
    end;
end;
return function(v23, v24) --[[ Line: 39 ]]
    -- upvalues: l_default_0 (copy), v10 (copy), l_Roact_0 (copy), v9 (copy), v8 (copy), l_RoactNavigation_0 (copy), v6 (copy), l_llama_0 (copy), l_ChatPlacementContext_0 (copy), l_BackBehavior_0 (copy), v19 (copy), v13 (copy), v7 (copy)
    local v25 = l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab();
    local v31 = {
        {
            [v10.SocialTab] = {
                screen = function(v26) --[[ Line: 47 ]] --[[ Name: screen ]]
                    -- upvalues: l_Roact_0 (ref), v9 (ref), v8 (ref), l_RoactNavigation_0 (ref)
                    return l_Roact_0.createFragment({
                        screen = l_Roact_0.createElement(v9, {
                            navigation = v26.navigation
                        }), 
                        navigationEvents = l_Roact_0.createElement(v8, {
                            navigationEventReceiver = l_RoactNavigation_0.NavigationEvents
                        })
                    });
                end, 
                navigationOptions = {
                    tabBarVisible = true
                }
            }
        }, 
        {
            [v10.RoactChat] = {
                screen = function(v27) --[[ Line: 64 ]] --[[ Name: screen ]]
                    -- upvalues: v6 (ref), v24 (copy), v10 (ref), l_llama_0 (ref), l_default_0 (ref), v25 (copy), l_ChatPlacementContext_0 (ref), l_Roact_0 (ref), v23 (copy)
                    return v6.with(function(v28) --[[ Line: 65 ]]
                        -- upvalues: v24 (ref), v10 (ref), l_llama_0 (ref), v27 (copy), l_default_0 (ref), v25 (ref), l_ChatPlacementContext_0 (ref), l_Roact_0 (ref), v23 (ref)
                        local v29 = {
                            logger = v28.Logger, 
                            isLuaProfilePageEnabled = v28.isLuaProfilePageEnabled, 
                            parameters = v28.parameters, 
                            wideMode = v28.wideMode, 
                            isVisible = v28.isVisible, 
                            notificationCount = v28.notificationCount, 
                            navigateToLuaAppPages = v28.navigateToLuaAppPages, 
                            rnBypassActionSignal = v28.rnBypassActionSignal, 
                            setActiveConversationId = v28.setActiveConversationId, 
                            setBackButtonEnabled = v28.setBackButtonEnabled, 
                            setTabBarVisible = v28.setTabBarVisible, 
                            androidBackButtonSignal = v24.androidBackButtonSignal[v10.RoactChat], 
                            androidBackButtonConnection = v24.androidBackButtonConnection, 
                            updateExternalNavigationForScreen = v28.updateExternalNavigationForScreen
                        };
                        local v30 = l_llama_0.Dictionary.join(v27, v24, v29, {
                            navigateToRootStack = function() --[[ Line: 85 ]] --[[ Name: navigateToRootStack ]]
                                -- upvalues: v27 (ref), v10 (ref)
                                v27.navigation.navigate(v10.SocialTab);
                            end, 
                            navigateToAddFriends = l_default_0.isEnabled() and function() --[[ Line: 89 ]]
                                -- upvalues: v27 (ref), v10 (ref)
                                v27.navigation.navigate(v10.FriendsLanding, {
                                    EntryPage = "AddFriendsPage"
                                });
                            end or nil
                        });
                        v30 = l_llama_0.Dictionary.join(v30, {
                            chatPlacement = if v25 then l_ChatPlacementContext_0.Enum.ChatTab else l_ChatPlacementContext_0.Enum.ConnectTab
                        });
                        return l_Roact_0.createElement(v23[v10.RoactChat], v30);
                    end);
                end, 
                navigationOptions = {
                    tabBarVisible = v25 and true or false
                }
            }
        }, 
        v23[v10.FriendsLanding] and {
            [v10.FriendsLanding] = v23[v10.FriendsLanding](v6)
        }
    };
    if v25 then
        v31 = l_llama_0.List.removeIndex(v31, 1);
    end;
    local v32 = l_RoactNavigation_0.createRobloxSwitchNavigator(v31, {
        initialRouteName = v24.initialRouteName, 
        keepVisitedScreensMounted = false, 
        backBehavior = if l_default_0.isEnabled() then l_BackBehavior_0.History else l_BackBehavior_0.InitialRoute
    });
    local v33 = l_Roact_0.PureComponent:extend("SocialTabSwitchNavigator");
    v33.init = function(v34) --[[ Line: 132 ]] --[[ Name: init ]]
        -- upvalues: v19 (ref), v10 (ref), v24 (copy), v25 (copy)
        v34.onBackButtonPressed = function() --[[ Line: 134 ]]
            -- upvalues: v34 (copy), v19 (ref), v10 (ref), v24 (ref)
            local l_state_1 = v34.props.navigation.state;
            local l_index_2 = l_state_1.index;
            local v37 = l_state_1.routes and l_state_1.routes[l_index_2];
            local v38 = if v37 then v19(v37) else l_state_1.routeName;
            if v34.props.androidBackButtonHandlerDisabled then
                return;
            elseif v38 == v10.RoactChat or v38 == v10.SocialTab then
                v24.androidBackButtonSignal[v38]:fire();
                return;
            else
                v34.props.navigation.goBack();
                return;
            end;
        end;
        v34.isTabViewVisible = function() --[[ Line: 160 ]]
            -- upvalues: v34 (copy), v19 (ref), v25 (ref), v10 (ref)
            local l_state_2 = v34.props.navigation.state;
            local l_index_3 = l_state_2.index;
            local v41 = l_state_2.routes and l_state_2.routes[l_index_3];
            local v42 = if v41 then v19(v41) else l_state_2.routeName;
            if v25 then
                return v42 == v10.RoactChat;
            else
                return v42 == v10.SocialTab;
            end;
        end;
    end;
    v33.didMount = function(v43) --[[ Line: 169 ]] --[[ Name: didMount ]]
        -- upvalues: v24 (copy)
        v24.connectToAndroidBackButton(v43.onBackButtonPressed);
    end;
    v33.willUnmount = function(_) --[[ Line: 173 ]] --[[ Name: willUnmount ]]
        -- upvalues: v24 (copy)
        v24.disconnectFromAndroidBackButton();
    end;
    v33.willUpdate = function(_, v46) --[[ Line: 177 ]] --[[ Name: willUpdate ]]
        -- upvalues: v13 (ref), l_RoactNavigation_0 (ref), v24 (copy)
        local l_navigation_0 = v46.navigation;
        local l_state_3 = l_navigation_0.state;
        local l_index_4 = l_state_3.index;
        local v50 = l_state_3.routes and l_state_3.routes[l_index_4];
        local v51;
        if v50 and v50.routes then
            local v52 = l_navigation_0.getChildNavigation(v50.key);
            v51 = v13(v52);
        else
            v51 = l_RoactNavigation_0.getActiveChildNavigationOptions(l_navigation_0);
        end;
        if v51 and v51.tabBarVisible ~= nil then
            v24.setTabBarVisible(v51.tabBarVisible);
        end;
    end;
    v33.render = function(v53) --[[ Line: 186 ]] --[[ Name: render ]]
        -- upvalues: v6 (ref), l_Roact_0 (ref), v7 (ref), v19 (ref), v24 (copy), v25 (copy), v10 (ref), v32 (copy)
        return v6.with(function(v54) --[[ Line: 187 ]]
            -- upvalues: v53 (copy), l_Roact_0 (ref), v7 (ref), v19 (ref), v24 (ref), v25 (ref), v10 (ref), v32 (ref)
            if v54.isLuaProfilePageEnabled then
                v54.setIsTabBarEnabled(v53.isTabViewVisible);
            end;
            return l_Roact_0.createFragment({
                eventReceiver = l_Roact_0.createElement(v7, {
                    robloxEventReceiver = v54.robloxEventReceiver, 
                    getActiveConversationId = v54.getActiveConversationId, 
                    showTabBar = function() --[[ Line: 196 ]] --[[ Name: showTabBar ]]
                        -- upvalues: v53 (ref), v19 (ref), v24 (ref), v25 (ref), v10 (ref)
                        local l_state_4 = v53.props.navigation.state;
                        local l_index_5 = l_state_4.index;
                        local v57 = l_state_4.routes and l_state_4.routes[l_index_5];
                        local v58 = if v57 then v19(v57) else l_state_4.routeName;
                        v24.setTabBarVisible(v58 == if v25 then v10.RoactChat else v10.SocialTab);
                    end, 
                    goToChat = function() --[[ Line: 203 ]] --[[ Name: goToChat ]]
                        -- upvalues: v53 (ref), v10 (ref)
                        v53.props.navigation.navigate(v10.RoactChat);
                    end
                }), 
                switchNavigator = l_Roact_0.createElement(v32, {
                    navigation = v53.props.navigation
                })
            });
        end);
    end;
    v33.router = v32.router;
    return v33;
end;