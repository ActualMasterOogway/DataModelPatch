local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local v3 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v4 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v5 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v8 = l_Roact_0.PureComponent:extend("FriendsLandingEventListener");
v8.defaultProps = {
    navigation = nil, 
    navigationEvents = l_RoactNavigation_0.NavigationEvents, 
    debug_skipDidMount = false
};
v8.init = function(v9) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v9.refreshPageOnceCheck = false;
    v9.refreshPage = function() --[[ Line: 23 ]]
        -- upvalues: v9 (copy), v5 (ref)
        if v9.refreshPageOnceCheck then
            return;
        else
            v9.refreshPageOnceCheck = true;
            v9.props.setFilterKeys(v5.All);
            v9.props.analytics:pageLoaded();
            v9.props.refreshPage({
                errorMessage = v9.props.pageError, 
                onResolve = function(v10) --[[ Line: 34 ]] --[[ Name: onResolve ]]
                    -- upvalues: v9 (ref)
                    local v11 = v10 and v10[1] and v10[1].responseBody or {};
                    local v12 = v11 and v11.data or {};
                    v9.props.analytics:pageLoadedWithArgs("friendsLanding", {
                        friendsCount = #v12
                    });
                end
            });
            return;
        end;
    end;
    v9.onDidBlur = function() --[[ Line: 45 ]]
        -- upvalues: v9 (copy), v5 (ref)
        v9.refreshPageOnceCheck = false;
        v9.props.setFilterKeys(v5.All);
    end;
end;
v8.render = function(v13) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement(v13.props.navigationEvents, {
        onDidFocus = v13.refreshPage, 
        onDidBlur = v13.onDidBlur
    });
end;
v8.didMount = function(v14) --[[ Line: 59 ]] --[[ Name: didMount ]]
    if v14.props.debug_skipDidMount then
        return;
    else
        v14.refreshPage();
        return;
    end;
end;
v8.willUnmount = function(v15) --[[ Line: 67 ]] --[[ Name: willUnmount ]]
    v15.refreshPageOnceCheck = false;
end;
return l_compose_0(v3.connect(function(v16) --[[ Line: 72 ]]
    return {
        filter = v16.filter, 
        setFilterKeys = v16.setFilterKeys, 
        refreshPage = v16.refreshPage
    };
end), v4.connect(function(v17) --[[ Line: 79 ]]
    return {
        analytics = v17
    };
end))(v8);