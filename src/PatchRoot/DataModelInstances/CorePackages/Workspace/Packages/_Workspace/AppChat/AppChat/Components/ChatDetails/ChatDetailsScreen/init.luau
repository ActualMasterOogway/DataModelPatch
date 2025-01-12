local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.ChatDetailsContainer);
local v5 = require(script.Parent.Logger);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v7 = v3.PureComponent:extend("ChatDetailsScreen");
v7.defaultProps = {
    navigation = nil
};
v7.navigationOptions = function() --[[ Line: 16 ]]
    -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy)
    return {
        headerText = {
            raw = l_GetFFlagAppChatRebrandStringUpdates_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
            shouldLocalize = true
        }
    };
end;
v7.init = function(v8) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v2 (copy)
    v8.navigateToEditChatMembers = function(v9) --[[ Line: 28 ]]
        -- upvalues: v5 (ref), v8 (copy), v2 (ref)
        v5:info("Navigate To EditChatMembers from {screen}");
        v8.props.navigation.navigate(v2.EditChatMembers, {
            conversation = v9
        });
    end;
    v8.navigateToToast = function(v10) --[[ Line: 33 ]]
        -- upvalues: v5 (ref), v8 (copy), v2 (ref)
        v5:info("Navigate To Toast from {screen}");
        v8.props.navigation.navigate(v2.RoactChatToast, v10);
    end;
    v8.navigateToDialog = function(v11, v12) --[[ Line: 38 ]]
        -- upvalues: v5 (ref), v8 (copy)
        v5:info("Navigate To {} from {screen}", v11);
        v8.props.navigation.navigate(v11, v12);
    end;
    v8.navigateBack = function() --[[ Line: 43 ]]
        -- upvalues: v8 (copy)
        if v8.props.navigation.isFocused() then
            v8.props.navigation.goBack();
        end;
    end;
    v8.navigateToConversation = function(v13) --[[ Line: 49 ]]
        -- upvalues: v5 (ref), v8 (copy), v2 (ref)
        v5:info("Navigate To Conversation from {screen}");
        v8.props.navigation.navigate(v2.ChatConversation, {
            conversationId = v13
        });
    end;
end;
v7.render = function(v14) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    local l_navigation_0 = v14.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation");
    local v16 = l_navigation_0.getParam("conversationId", nil);
    if v16 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            topBarHeight = l_navigation_0.getScreenProps("topBarHeight", 0), 
            wideMode = l_navigation_0.getScreenProps("wideMode", false), 
            conversationId = v16, 
            navigateBack = v14.navigateBack, 
            navigateToEditChatMembers = v14.navigateToEditChatMembers, 
            navigateToDialog = v14.navigateToDialog, 
            navigateToToast = v14.navigateToToast, 
            navigateToConversation = v14.navigateToConversation
        });
    end;
end;
v7.didMount = function(_) --[[ Line: 77 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    v5:info("{screen} mounted");
end;
return v7;