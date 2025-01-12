local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v6 = require(l_script_FirstAncestor_0.TopBarContext);
local v7 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v8 = require(script.Parent.EditChatMembersContainer);
local v9 = require(script.Parent.Logger);
local v10 = v4.PureComponent:extend("EditChatMembersScreen");
v10.defaultProps = {};
v10.navigationOptions = function() --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy), v3 (copy), l_withLocalization_0 (copy), v7 (copy)
    return {
        headerText = {
            raw = "Feature.Chat.Label.AddFriends", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = function() --[[ Line: 27 ]] --[[ Name: renderRight ]]
            -- upvalues: v4 (ref), v6 (ref), v2 (ref), v3 (ref), l_withLocalization_0 (ref), v7 (ref)
            return v4.createElement(v6.Consumer, {
                render = function(v11) --[[ Line: 29 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v3 (ref), l_withLocalization_0 (ref), v7 (ref)
                    local v12 = v11.getScreenTopBar(v2.EditChatMembers);
                    v3.isType(v12, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Chat.Action.Add", 
                        networkErrorText = "Feature.Chat.Response.NetworkError", 
                        invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected"
                    })(function(v13) --[[ Line: 37 ]]
                        -- upvalues: v7 (ref), v12 (copy)
                        return v7({
                            localizedStrings = v13, 
                            isDisabled = not v12.systemButtonEnabled, 
                            onActivated = v12.systemButtonActivated
                        });
                    end);
                end
            });
        end
    };
end;
v10.init = function(v14) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v2 (copy), v3 (copy)
    v14.navigateToConversation = function(v15) --[[ Line: 51 ]]
        -- upvalues: v9 (ref), v14 (copy), v2 (ref)
        v9:info("Navigate To Conversation: {} from {screen}", v15);
        v14.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v15
        });
    end;
    v14.navigateToToast = function(v16) --[[ Line: 56 ]]
        -- upvalues: v9 (ref), v14 (copy), v2 (ref)
        v9:info("Navigate To Toast from {screen}");
        v14.props.navigation.navigate(v2.RoactChatToast, v16);
    end;
    v14.setSystemButtonActivated = function(v17) --[[ Line: 61 ]]
        -- upvalues: v14 (copy), v3 (ref), v2 (ref)
        local v18 = v14.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v18, "setScreenTopBar in screenProps");
        v18(v2.EditChatMembers, {
            systemButtonActivated = v17
        });
    end;
    v14.setSystemButtonEnabled = function(v19) --[[ Line: 70 ]]
        -- upvalues: v14 (copy), v3 (ref), v2 (ref)
        local v20 = v14.props.navigation.getScreenProps("setScreenTopBar", nil);
        v3.isNotNil(v20, "setScreenTopBar in screenProps");
        v20(v2.EditChatMembers, {
            systemButtonEnabled = v19
        });
    end;
end;
v10.render = function(v21) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy), v8 (copy)
    local v22 = v3.isNotNil(v21.props.navigation, "navigation in EditChatMembersScreen");
    local v23 = v22.getParam("conversation", nil);
    if not v23 then
        v9:warning("Conversation info required to open {screen}");
        return nil;
    else
        return v4.createElement(v8, {
            topBarHeight = v22.getScreenProps("topBarHeight", 0), 
            conversation = v23, 
            navigateToConversation = v21.navigateToConversation, 
            navigateToToast = v21.navigateToToast, 
            setSystemButtonActivated = v21.setSystemButtonActivated, 
            setSystemButtonEnabled = v21.setSystemButtonEnabled
        });
    end;
end;
v10.didMount = function(v24) --[[ Line: 99 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    v9:info("{screen} mounted");
    v24.setSystemButtonEnabled(false);
end;
return v10;