local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local l_getFStringSocialAddFriendsPageLayer_0 = v2.getFStringSocialAddFriendsPageLayer;
local v6 = require(l_AddFriends_0.Utils.getAddFriendsPagePYMKVariant);
local v7 = game:DefineFastString("FriendRequestSortingIXPVariant", "treatment");
local v8 = l_Roact_0.PureComponent:extend("AddFriendsLayerExposure");
v8.init = function(v9) --[[ Line: 23 ]] --[[ Name: init ]]
    v9.state = {
        layerExposedOnMount = false
    };
end;
v8.didMount = function(v10) --[[ Line: 29 ]] --[[ Name: didMount ]]
    v10:setState({
        layerExposedOnMount = true
    });
end;
v8.render = function(v11) --[[ Line: 35 ]] --[[ Name: render ]]
    if v11.state.layerExposedOnMount then
        return (v11.props.renderChild({
            shouldShowPYMKSection = v11.props.shouldShowPYMKSection, 
            initialRequestsRows = v11.props.initialRequestsRows, 
            addFriendsPageSearchbarEnabled = v11.props.addFriendsPageSearchbarEnabled, 
            friendRequestScoringVariant = v11.props.friendRequestScoringVariant, 
            pymkEnabledForConsole = v11.props.pymkEnabledForConsole
        }));
    else
        return nil;
    end;
end;
return l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialAddFriendsPageLayer_0()
}, function(v12, _) --[[ Line: 49 ]]
    -- upvalues: l_getFStringSocialAddFriendsPageLayer_0 (copy), v6 (copy), v7 (copy)
    local v14 = v12[l_getFStringSocialAddFriendsPageLayer_0()] or {};
    local v15, v16 = v6(v14);
    local v17 = v14[v7];
    if v17 == "largerWindow" then
        v16 = 5;
    end;
    return {
        shouldShowPYMKSection = v15, 
        initialRequestsRows = v16, 
        addFriendsPageSearchbarEnabled = v14.show_add_friends_page_search_bar, 
        friendRequestScoringVariant = v17, 
        pymkEnabledForConsole = v14.enable_pymk_for_console
    };
end)(v8);