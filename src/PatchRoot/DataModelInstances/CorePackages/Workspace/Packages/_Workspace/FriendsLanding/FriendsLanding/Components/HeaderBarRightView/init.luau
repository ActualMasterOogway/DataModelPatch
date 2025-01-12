local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local v6 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v9 = require(l_script_FirstAncestor_0.Components.AddFriendsIcon);
local l_memoize_0 = v2.memoize;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.PlayerSearchEvent);
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local function v19(v18) --[[ Line: 24 ]]
    -- upvalues: l_Roact_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    return l_Roact_0.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        icon = l_Images_0["icons/common/search"], 
        layoutOrder = v18.layoutOrder, 
        onActivated = v18.goToSearchFriendsPage
    });
end;
local v20 = {
    SHOW_ADDFRIENDS_ICON = {
        [v7.FriendsLanding] = true, 
        [v7.SearchFriends] = true
    }, 
    SHOW_SEARCHFRIENDS_ICON = {
        [v7.FriendsLanding] = true, 
        [v7.SearchFriends] = true, 
        [v7.AddFriends] = true
    }
};
local v21 = l_Roact_0.PureComponent:extend("HeaderBarRightView");
v21.defaultProps = {
    layoutOrder = 1, 
    onActivated = nil
};
v21.init = function(v22) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v13 (copy), v7 (copy), l_getDeepValue_0 (copy), l_Sources_0 (copy), v14 (copy)
    v22.goToFriendRequestsPage = l_memoize_0(function(_, v24) --[[ Line: 54 ]]
        -- upvalues: v13 (ref), v22 (copy), v7 (ref)
        return function() --[[ Line: 55 ]]
            -- upvalues: v24 (copy), v13 (ref), v22 (ref), v7 (ref)
            local v25 = v24 == 0 and v13.AddFriendsNoFriends or v13.AddFriends;
            v22.props.analytics:buttonClick(v25);
            v22.props.analytics:navigate(v7.AddFriends);
            return v22.props.navigation.navigate(v7.AddFriends);
        end;
    end);
    v22.goToSearchFriendsPage = l_memoize_0(function(v26) --[[ Line: 65 ]]
        -- upvalues: v22 (copy), l_getDeepValue_0 (ref), v7 (ref), l_Sources_0 (ref), v14 (ref)
        return function() --[[ Line: 66 ]]
            -- upvalues: v22 (ref), l_getDeepValue_0 (ref), v7 (ref), l_Sources_0 (ref), v14 (ref), v26 (copy)
            local l_navigation_0 = v22.props.navigation;
            local v28 = if l_navigation_0 and l_navigation_0.state then l_navigation_0.state.routeName else nil;
            local v29 = nil;
            if l_getDeepValue_0(l_navigation_0 or {}, "state.params.userSearchSource") then
                v29 = l_navigation_0.state.params.userSearchSource;
            elseif l_getDeepValue_0(v22.props, "passedNavParams.userSearchSource") then
                v29 = v22.props.passedNavParams.userSearchSource;
            elseif v28 == v7.FriendsLanding then
                v29 = l_Sources_0.FriendsLanding;
            end;
            v14(v22.props.analytics, "open", {
                source = v29, 
                currentRoute = v28
            });
            v26(v7.FriendsLanding, {
                shouldRenderCenter = true, 
                shouldAutoFocusCenter = true
            });
        end;
    end);
end;
v21.render = function(v30) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v20 (copy), l_Roact_0 (copy), v19 (copy), v9 (copy)
    if v30.props.getScreenTopBar(v7.FriendsLanding).shouldRenderCenter then
        return nil;
    else
        local l_navigation_1 = v30.props.navigation;
        local v32 = nil;
        local v33 = nil;
        if v30.props.addFriendsPageSearchbarEnabled then
            v20.SHOW_ADDFRIENDS_ICON[v7.SearchFriends] = false;
        end;
        if l_navigation_1 and l_navigation_1.state then
            local l_routeName_0 = l_navigation_1.state.routeName;
            v32 = v20.SHOW_SEARCHFRIENDS_ICON[l_routeName_0];
            v33 = v20.SHOW_ADDFRIENDS_ICON[l_routeName_0];
        end;
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 72, 0, 36)
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SearchFriendsIcon = v32 and v19({
                goToSearchFriendsPage = v30.goToSearchFriendsPage(v30.props.setScreenTopBar), 
                layoutOrder = 1
            }), 
            Padding = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            AddFriendsIcon = v33 and l_Roact_0.createElement(v9, {
                onActivated = v30.goToFriendRequestsPage(v30.props.navigateToLuaAppPages, v30.props.totalFriendCount), 
                layoutOrder = 3, 
                friendRequestCount = v30.props.friendRequestCount, 
                showTooltip = v30.props.totalFriendCount == 0
            })
        });
    end;
end;
return l_compose_0(v8.connect(function(v35) --[[ Line: 142 ]]
    return {
        analytics = v35
    };
end), v6.connect(function(v36, _) --[[ Line: 147 ]]
    return {
        getScreenTopBar = v36.getScreenTopBar, 
        setScreenTopBar = v36.setScreenTopBar, 
        navigateToLuaAppPages = v36.navigateToLuaAppPages, 
        friendRequestCount = v36.friendRequestCount, 
        totalFriendCount = v36.totalFriendCount, 
        luaAddFriendsPageEnabled = v36.luaAddFriendsPageEnabled, 
        addFriendsPageSearchbarEnabled = v36.addFriendsPageSearchbarEnabled, 
        passedNavParams = v36.passedNavParams
    };
end))(v21);