local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactNavigation);
local _ = require(l_script_FirstAncestor_0.types);
local function v6(v7) --[[ Line: 10 ]] --[[ Name: getActiveChildParams ]]
    -- upvalues: v6 (copy)
    local l_index_0 = v7.index;
    local v9 = v7.routes and v7.routes[l_index_0];
    if v9 then
        return v6(v9);
    else
        return v7.params;
    end;
end;
local function v10(v11) --[[ Line: 20 ]] --[[ Name: getActiveChildNavigationOptions ]]
    -- upvalues: v10 (copy), v4 (copy)
    local l_state_0 = v11.state;
    local l_index_1 = l_state_0.index;
    local v14 = l_state_0.routes and l_state_0.routes[l_index_1];
    if v14 and v14.routes then
        local v15 = v11.getChildNavigation(v14.key);
        return v10(v15);
    else
        return v4.getActiveChildNavigationOptions(v11);
    end;
end;
local function _(v16) --[[ Line: 33 ]] --[[ Name: getActiveConversationId ]]
    if v16 then
        if v16.conversation then
            return v16.conversation.id;
        else
            return v16.conversationId;
        end;
    else
        return nil;
    end;
end;
return function(v18, v19, v20, v21) --[[ Line: 45 ]]
    -- upvalues: v3 (copy), v10 (copy), v4 (copy), v2 (copy), v6 (copy)
    local v22 = v3.PureComponent:extend("RoactChatStackNavigator");
    v22.defaultProps = {
        navigation = nil, 
        parameters = nil, 
        setActiveConversationId = function() --[[ Line: 56 ]] --[[ Name: setActiveConversationId ]]

        end, 
        setBackButtonEnabled = function() --[[ Line: 57 ]] --[[ Name: setBackButtonEnabled ]]

        end, 
        setTabBarVisible = function() --[[ Line: 58 ]] --[[ Name: setTabBarVisible ]]

        end, 
        notificationCount = 0
    };
    v22.init = function(v23) --[[ Line: 62 ]] --[[ Name: init ]]
        -- upvalues: v10 (ref), v4 (ref), v19 (copy), v2 (ref), v21 (copy)
        v23.backButtonConnection = nil;
        v23.onBackButtonPressed = function() --[[ Line: 66 ]]
            -- upvalues: v23 (copy), v10 (ref), v4 (ref), v19 (ref), v2 (ref), v21 (ref)
            local l_navigation_0 = v23.props.navigation;
            local l_state_1 = l_navigation_0.state;
            local l_index_2 = l_state_1.index;
            local v27 = l_state_1.routes and l_state_1.routes[l_index_2];
            local v28;
            if v27 and v27.routes then
                local v29 = l_navigation_0.getChildNavigation(v27.key);
                v28 = v10(v29);
            else
                v28 = v4.getActiveChildNavigationOptions(l_navigation_0);
            end;
            if v19 and v28.isRoot then
                v23.props.navigation.navigate(v2.EmptyConversation);
                v19();
                if v21 and v23.props.chatIsVisible then
                    v21.showExitDialog();
                    return;
                end;
            else
                v23.props.navigation.pop();
            end;
        end;
    end;
    v22.willUpdate = function(v30, v31) --[[ Line: 81 ]] --[[ Name: willUpdate ]]
        -- upvalues: v6 (ref), v10 (ref), v4 (ref)
        local l_state_2 = v30.props.navigation.state;
        local l_index_3 = l_state_2.index;
        local v34 = l_state_2.routes and l_state_2.routes[l_index_3];
        local v35 = if v34 then v6(v34) else l_state_2.params;
        l_index_3 = v31.navigation.state;
        v34 = l_index_3.index;
        local v36 = l_index_3.routes and l_index_3.routes[v34];
        l_state_2 = if v36 then v6(v36) else l_index_3.params;
        l_index_3 = if v35 then if v35.conversation then v35.conversation.id else v35.conversationId else nil;
        v34 = if l_state_2 then if l_state_2.conversation then l_state_2.conversation.id else l_state_2.conversationId else nil;
        if l_index_3 ~= v34 then
            v30.props.setActiveConversationId(v34);
        end;
        if not v31.chatIsVisible then
            return;
        else
            local l_navigation_1 = v31.navigation;
            local l_state_3 = l_navigation_1.state;
            local l_index_4 = l_state_3.index;
            local v40 = l_state_3.routes and l_state_3.routes[l_index_4];
            if v40 and v40.routes then
                local v41 = l_navigation_1.getChildNavigation(v40.key);
                v36 = v10(v41);
            else
                v36 = v4.getActiveChildNavigationOptions(l_navigation_1);
            end;
            if v36 then
                if v36.backButtonEnabled ~= nil then
                    v30.props.setBackButtonEnabled(v36.backButtonEnabled);
                end;
                if v36.tabBarVisible ~= nil then
                    v30.props.setTabBarVisible(v36.tabBarVisible);
                end;
            end;
            return;
        end;
    end;
    v22.didMount = function(v42) --[[ Line: 109 ]] --[[ Name: didMount ]]
        -- upvalues: v20 (copy), v19 (copy), v2 (ref)
        if v20 and v19 then
            v42.backButtonConnection = v20:connect(v42.onBackButtonPressed);
        end;
        local l_parameters_0 = v42.props.parameters;
        local v44 = l_parameters_0 and l_parameters_0.conversationId;
        if v44 then
            v42.props.navigation.navigate(v2.ChatConversation, {
                conversationId = v44
            });
        end;
    end;
    v22.willUnmount = function(v45) --[[ Line: 122 ]] --[[ Name: willUnmount ]]
        v45.props.setActiveConversationId(nil);
        if v45.backButtonConnection then
            v45.backButtonConnection:disconnect();
        end;
    end;
    v22.render = function(v46) --[[ Line: 129 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v18 (copy)
        local l_navigation_2 = v46.props.navigation;
        return v3.createElement(v18, {
            navigation = l_navigation_2
        });
    end;
    v22.router = v18.router;
    return v22;
end;