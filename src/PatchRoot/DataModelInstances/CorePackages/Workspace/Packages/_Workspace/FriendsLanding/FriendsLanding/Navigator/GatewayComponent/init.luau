local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local v4 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v5 = require(l_script_FirstAncestor_0.EnumScreens);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_compose_0 = v2.SocialLibraries.RoduxTools.compose;
local v8 = l_Roact_0.PureComponent:extend("GatewayComponent");
v8.render = function(_) --[[ Line: 15 ]] --[[ Name: render ]]
    return nil;
end;
v8.didMount = function(v10) --[[ Line: 20 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy), l_AppPage_0 (copy)
    local function v11() --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v5 (ref)
        v10.props.navigation.replace(v5.SearchFriends, {
            shouldShowUserSearchLandingPage = v10.props.passedNavParams.shouldShowUserSearchLandingPage, 
            userSearchSource = v10.props.passedNavParams.userSearchSource
        });
        if v10.props.setScreenTopBar and v10.props.passedNavParams.screenTopBarParams then
            v10.props.setScreenTopBar(v5.FriendsLanding, v10.props.passedNavParams.screenTopBarParams);
        end;
    end;
    ({
        [l_AppPage_0.AddFriendsPage] = function() --[[ Line: 32 ]]
            -- upvalues: v10 (copy), v5 (ref)
            v10.props.navigation.replace(v5.AddFriends);
        end, 
        [l_AppPage_0.SearchPage] = v11, 
        [l_AppPage_0.SearchUsers] = v11, 
        [l_AppPage_0.ViewFriends] = function() --[[ Line: 38 ]]
            -- upvalues: v10 (copy), v5 (ref)
            v10.props.navigation.replace(v5.FriendsLanding);
        end
    })[v10.props.entryPage or l_AppPage_0.ViewFriends]();
end;
return l_compose_0(v4.connect(function(v12, _) --[[ Line: 47 ]]
    return {
        entryPage = v12.entryPage, 
        setScreenTopBar = v12.setScreenTopBar, 
        passedNavParams = v12.passedNavParams or {}
    };
end))(v8);