local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_SquadLobby_0 = require(l_Parent_0.Squads).SquadLobby;
local v6 = require(script.Parent.SquadAddFriendsIconButton);
local v7 = v4.PureComponent:extend("SquadLobbyScreen");
local v8 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local l_withChatPlacementContext_0 = v8.withChatPlacementContext;
local v10 = {
    v1.SquadLobby, 
    v1.SquadInviteFriends, 
    v1.SquadVoiceReportAbuse
};
local function v13(v11) --[[ Line: 23 ]]
    -- upvalues: v4 (copy), v6 (copy)
    local l_navigation_0 = v11.navigation;
    return {
        renderRight = function() --[[ Line: 27 ]] --[[ Name: renderRight ]]
            -- upvalues: v4 (ref), v6 (ref), l_navigation_0 (copy)
            return v4.createElement(v6, {
                navigation = l_navigation_0
            });
        end
    };
end;
v7.init = function(v14) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v10 (copy)
    v14.hasNavigatedAwayFromSquad = false;
    v14.navigateToHomePage = function(_) --[[ Line: 38 ]]
        -- upvalues: v14 (copy), v1 (ref)
        local v16 = v14.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v1.Home];
        if v16 then
            v16();
        end;
    end;
    v14.openViewProfile = function(v17) --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v1 (ref)
        local v18 = v14.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v1.ViewUserProfile];
        if v18 then
            v18(v17, {});
        end;
    end;
    v14.openSquadVoiceAbuseReport = function(v19) --[[ Line: 56 ]]
        -- upvalues: v14 (copy), v1 (ref)
        v14.props.navigation.navigate(v1.SquadVoiceReportAbuse, {
            reportData = v19
        });
    end;
    v14.navigateToSquadInviteFriends = function(v20) --[[ Line: 60 ]]
        -- upvalues: v14 (copy), v1 (ref)
        v14.props.navigation.navigate(v1.SquadInviteFriends, {
            conversationId = v20
        });
    end;
    v14.navigateAwayFromSquad = function() --[[ Line: 64 ]]
        -- upvalues: v14 (copy), v10 (ref)
        if v14.hasNavigatedAwayFromSquad then
            return;
        else
            local v21 = v14.props.navigation._dangerouslyGetParent();
            if v21 then
                local l_state_0 = v21.state;
                if l_state_0 then
                    local l_index_0 = l_state_0.index;
                    local v24 = nil;
                    for v25 = l_index_0, 1, -1 do
                        local v26 = l_state_0.routes[v25];
                        if not table.find(v10, v26.routeName) then
                            if v24 then
                                v14.hasNavigatedAwayFromSquad = true;
                                v14.props.navigation.goBack(v24);
                            end;
                            return;
                        else
                            v24 = v26.key;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v7.render = function(v27) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_withChatPlacementContext_0 (copy), v4 (copy), l_SquadLobby_0 (copy), v8 (copy)
    return l_withChatPlacementContext_0(function(v28) --[[ Line: 93 ]]
        -- upvalues: v4 (ref), l_SquadLobby_0 (ref), v27 (copy), v8 (ref)
        return v4.createElement(l_SquadLobby_0, {
            navigateToHomePage = v27.navigateToHomePage, 
            openViewProfile = v27.openViewProfile, 
            openSquadVoiceAbuseReport = v27.openSquadVoiceAbuseReport, 
            navigateAwayFromSquad = v27.navigateAwayFromSquad, 
            navigateToSquadInviteFriends = v27.navigateToSquadInviteFriends, 
            isInExperience = v8.isPlacementInExperience(v28.chatPlacement), 
            isWideMode = v27.props.isWideMode
        });
    end);
end;
local v29 = v4.PureComponent:extend("WideSquadLobbyScreen");
v29.navigationOptions = v13;
v29.init = function(_) --[[ Line: 108 ]] --[[ Name: init ]]

end;
v29.render = function(v31) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy)
    return v4.createElement(v7, v3.Dictionary.union(v31.props, {
        isWideMode = true
    }));
end;
local v32 = v4.PureComponent:extend("CompactSquadLobbyScreen");
v32.navigationOptions = v13;
v32.init = function(_) --[[ Line: 116 ]] --[[ Name: init ]]

end;
v32.render = function(v34) --[[ Line: 117 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy)
    return v4.createElement(v7, v3.Dictionary.union(v34.props, {
        isWideMode = false
    }));
end;
return {
    WideSquadLobbyScreen = v29, 
    CompactSquadLobbyScreen = v32
};