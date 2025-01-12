local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.RoactNavigation);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatMakeBackgroundTransparent);
local v9 = require(l_script_FirstAncestor_0.EnumScreens);
local v10 = require(l_script_FirstAncestor_0.TopBarContext);
local v11 = require(l_script_FirstAncestor_0.createChatTopBar);
local v12 = require(l_script_FirstAncestor_0.Navigators.Wide.conversationSwitchNavigator);
local v13 = require(script.Parent.ChatLandingScreen);
local v14 = require(script.Parent.ChatSearchBox);
local v15 = require(script.Parent.ChatLandingContainer);
local v16 = require(script.Parent.Logger);
local v17 = require(script.Parent.Utils.getCurrentRoute);
local l_withStyle_0 = v5.Style.withStyle;
local v19 = v4.PureComponent:extend("ChatLandingScreenWithSwitchNavigator");
v19.router = v12.router;
v19.defaultProps = {
    navigation = nil
};
v19.init = function(v20) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v9 (copy), v17 (copy), v6 (copy), v2 (copy)
    v20.navigateToConversation = function(v21) --[[ Line: 35 ]]
        -- upvalues: v16 (ref), v20 (copy), v9 (ref)
        v16:info("Navigate To Conversation: {} from {screen}", v21);
        v20.props.navigation.navigate(v9.ChatConversation, {
            conversationId = v21
        });
    end;
    v20.navigateToCreateChat = function() --[[ Line: 40 ]]
        -- upvalues: v16 (ref), v20 (copy), v9 (ref)
        v16:info("Navigate To CreateNewChat from {screen}");
        v20.props.navigation.navigate(v9.CreateNewChat);
    end;
    v20.navigateToToast = function(v22) --[[ Line: 45 ]]
        -- upvalues: v16 (ref), v20 (copy), v9 (ref)
        v16:info("Navigate To Toast from {screen}");
        v20.props.navigation.navigate(v9.RoactChatToast, v22);
    end;
    v20.navigateToNotifications = function() --[[ Line: 50 ]]
        -- upvalues: v20 (copy), v9 (ref), v16 (ref)
        local v23 = v20.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v9.Notifications];
        if v23 then
            v16:info("Navigate To Notifications from {screen}");
            v23();
            return;
        else
            v16:warning("Notifications page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v20.navigateToPrivacy = function() --[[ Line: 61 ]]
        -- upvalues: v20 (copy), v9 (ref), v16 (ref)
        local v24 = v20.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v9.PrivacySettings];
        if v24 then
            v16:info("Navigate To PrivacySettings from {screen}");
            v24();
            return;
        else
            v16:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v20.navigateToSquadLobby = function(v25) --[[ Line: 72 ]]
        -- upvalues: v16 (ref), v17 (ref), v20 (copy), v9 (ref), v6 (ref)
        v16:info("Navigate To SquadLobby from {screen}");
        local v26 = v17(v20.props.navigation.state);
        if v26 and v26.params and v26.params.conversationId == v25 and v26.routeName == v9.ChatConversation then
            v20.props.navigation.navigate(v9.SquadLobby, {
                conversationId = v25
            });
            return;
        else
            v20.props.navigation.navigate(v9.ChatLanding, nil, v6.StackActions.reset({
                index = 2, 
                actions = {
                    v6.Actions.navigate({
                        routeName = v9.ChatConversation, 
                        params = {
                            conversationId = v25
                        }
                    }), 
                    v6.Actions.navigate({
                        routeName = v9.SquadLobby, 
                        params = {
                            conversationId = v25
                        }
                    })
                }
            }));
            return;
        end;
    end;
    v20.setScreenTopBar = function(v27) --[[ Line: 105 ]]
        -- upvalues: v20 (copy), v2 (ref), v9 (ref)
        local v28 = v20.props.navigation.getScreenProps("setScreenTopBar", nil);
        v2.isNotNil(v28, "setScreenTopBar in screenProps");
        v28(v9.ChatLanding, v27);
    end;
end;
v19.render = function(v29) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v2 (copy), l_withStyle_0 (copy), v4 (copy), v8 (copy), v10 (copy), v9 (copy), v11 (copy), v3 (copy), v13 (copy), l_default_0 (copy), v14 (copy), v15 (copy), v12 (copy)
    v16:info("{screen} render");
    local v30 = v2.isNotNil(v29.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator");
    local v31 = v30 and v30.getParam("key", "") or "";
    local v32 = v30.getScreenProps("showSearchRow", true);
    local v33 = v30.getScreenProps("topBarHeight", 0);
    return l_withStyle_0(function(v34) --[[ Line: 120 ]]
        -- upvalues: v4 (ref), v8 (ref), v10 (ref), v9 (ref), v2 (ref), v11 (ref), v3 (ref), v30 (copy), v13 (ref), l_default_0 (ref), v32 (copy), v14 (ref), v33 (copy), v15 (ref), v29 (copy), v31 (copy), v12 (ref)
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v34.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = if v8() then v34.Tokens.Global.Color.None.Transparency else v34.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            LeftContainer = v4.createElement(v10.Consumer, {
                render = function(v35) --[[ Line: 130 ]] --[[ Name: render ]]
                    -- upvalues: v9 (ref), v2 (ref), v4 (ref), v11 (ref), v3 (ref), v30 (ref), v13 (ref), l_default_0 (ref), v32 (ref), v14 (ref), v33 (ref), v8 (ref), v34 (copy), v15 (ref), v29 (ref), v31 (ref)
                    local v36 = v35.getScreenTopBar(v9.ChatLanding);
                    v2.isType(v36, "table", "screenTopBar");
                    return v4.createElement("Frame", {
                        Size = UDim2.new(0.37, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        layout = v4.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        leftTopBar = v11(v3.Dictionary.join(v36, {
                            navigation = v30
                        }, v13.navigationOptions({
                            screenProps = nil, 
                            navigationOptions = nil, 
                            navigation = v30
                        }), if l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then {
                            backButtonEnabled = false, 
                            shouldBoldHeader = true
                        } else {})), 
                        filterBox = if v32 then v4.createElement(v14, {
                            height = v33, 
                            initialText = v36.filterText, 
                            onFilter = function(v37) --[[ Line: 167 ]] --[[ Name: onFilter ]]
                                -- upvalues: v35 (copy), v9 (ref)
                                v35.setScreenTopBar(v9.ChatLanding, {
                                    filterText = v37
                                });
                            end
                        }) else nil, 
                        content = v4.createElement("Frame", {
                            BorderSizePixel = 0, 
                            Size = UDim2.new(1, 0, 1, -v30.getScreenProps("topBarHeight", 0) - if v32 then v33 else 0), 
                            LayoutOrder = 2, 
                            BackgroundTransparency = if v8() then v34.Tokens.Global.Color.None.Transparency else v34.Theme.BackgroundDefault.Transparency
                        }, {
                            ChatLanding = v4.createElement(v15, {
                                isShowingFilterBox = v36.shouldRenderCenter, 
                                filterText = v36.filterText, 
                                navigateToConversation = v29.navigateToConversation, 
                                navigateToCreateChat = v29.navigateToCreateChat, 
                                navigateToPrivacy = v29.navigateToPrivacy, 
                                navigateToSquadLobby = v29.navigateToSquadLobby, 
                                navigateToToast = v29.navigateToToast, 
                                navigateToAddFriends = if l_default_0.isEnabled() then v29.props.navigation.getScreenProps("navigateToAddFriends", {}) else nil, 
                                key = "ChatLanding" .. v31
                            })
                        })
                    });
                end
            }), 
            Border = v4.createElement("Frame", {
                BackgroundColor3 = v34.Theme.Divider.Color, 
                BackgroundTransparency = v34.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.37, 0, 0, 0), 
                Size = UDim2.new(0, 1, 1, 0)
            }), 
            RightContainer = v4.createElement("Frame", {
                Size = UDim2.new(0.63, -1, 1, 0), 
                Position = UDim2.new(0.37, 1, 0, 0), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Content = v4.createElement(v12, {
                    navigation = v30
                })
            })
        });
    end);
end;
v19.didMount = function(v38) --[[ Line: 227 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy)
    v16:info("{screen} mounted");
    v38.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v19;