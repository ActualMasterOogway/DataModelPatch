local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v6 = require(l_script_FirstAncestor_0.TopBarContext);
local v7 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v8 = require(script.Parent.CreateNewChatContainer);
local v9 = require(script.Parent.Logger);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v11 = v4.PureComponent:extend("CreateNewChatScreen");
v11.defaultProps = {};
v11.navigationOptions = function() --[[ Line: 19 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), v4 (copy), v6 (copy), v2 (copy), v3 (copy), l_withLocalization_0 (copy), v7 (copy)
    return {
        headerText = {
            raw = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Heading.PartyWithFriends" or "Feature.Chat.Heading.ChatWithFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function() --[[ Line: 30 ]] --[[ Name: renderRight ]]
            -- upvalues: v4 (ref), v6 (ref), v2 (ref), v3 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), v7 (ref)
            return v4.createElement(v6.Consumer, {
                render = function(v12) --[[ Line: 32 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v3 (ref), l_withLocalization_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), v7 (ref)
                    local v13 = v12.getScreenTopBar(v2.CreateNewChat);
                    v3.isType(v13, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Action.Create" or "Feature.Chat.Action.StartChatWithFriends", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v14) --[[ Line: 42 ]]
                        -- upvalues: v7 (ref), v13 (copy)
                        return v7({
                            localizedStrings = v14, 
                            isDisabled = not v13.systemButtonEnabled, 
                            onActivated = v13.systemButtonActivated
                        });
                    end);
                end
            });
        end
    };
end;
v11.init = function(v15) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v2 (copy), v3 (copy)
    v15.navigateToConversation = function(v16) --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v9 (ref), v2 (ref)
        local l_navigation_0 = v15.props.navigation;
        v9:info("Navigate To Conversation: {} from {screen}", v16);
        if l_navigation_0.getScreenProps("wideMode", false) then
            l_navigation_0.navigate(v2.ChatConversation, {
                conversationId = v16
            });
            return;
        else
            l_navigation_0.replace(v2.ChatConversation, {
                conversationId = v16
            });
            return;
        end;
    end;
    v15.navigateToToast = function(v18) --[[ Line: 67 ]]
        -- upvalues: v9 (ref), v15 (copy), v2 (ref)
        v9:info("Navigate To Toast from {screen}");
        v15.props.navigation.navigate(v2.RoactChatToast, v18);
    end;
    v15.setSystemButtonActivated = function(v19) --[[ Line: 72 ]]
        -- upvalues: v15 (copy), v3 (ref), v2 (ref)
        local v20 = v15.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v20, "setScreenTopBar in screenProps");
        v20(v2.CreateNewChat, {
            systemButtonActivated = v19
        });
    end;
    v15.setSystemButtonEnabled = function(v21) --[[ Line: 81 ]]
        -- upvalues: v15 (copy), v3 (ref), v2 (ref)
        local v22 = v15.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v22, "setScreenTopBar in screenProps");
        v22(v2.CreateNewChat, {
            systemButtonEnabled = v21
        });
    end;
end;
v11.render = function(v23) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v8 (copy)
    local v24 = v3.isNotNil(v23.props.navigation, "navigation in CreateNewChatScreen");
    return v4.createElement(v8, {
        topBarHeight = v24.getScreenProps("topBarHeight", 0), 
        navigateToConversation = v23.navigateToConversation, 
        navigateToToast = v23.navigateToToast, 
        setSystemButtonActivated = v23.setSystemButtonActivated, 
        setSystemButtonEnabled = v23.setSystemButtonEnabled
    });
end;
v11.didMount = function(v25) --[[ Line: 103 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    v9:info("{screen} mounted");
    v25.setSystemButtonEnabled(false);
end;
return v11;