local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = l_script_FirstAncestor_0.Parent;
local l_llama_0 = v1.llama;
local l_Roact_0 = v1.Roact;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_RoactRodux_0 = v1.RoactRodux;
local l_withLocalization_0 = v1.withLocalization;
local l_UniversalAppPolicy_0 = v1.UniversalAppPolicy;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_memoize_0 = v1.memoize;
local v12 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v13 = require(script.Parent.mapStateToProps);
local v14 = require(script.Parent.mapDispatchToProps);
local v15 = require(l_script_FirstAncestor_0.Components.ShowMoreWrapper);
local v16 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v17 = require(l_script_FirstAncestor_0.Friends.filterFriends);
local l_User_0 = l_SocialLibraries_0.User;
local l_Logger_0 = v1.Logger;
local l_getFStringSocialFriendsLandingLayer_0 = v1.getFStringSocialFriendsLandingLayer;
local v21 = l_Roact_0.PureComponent:extend("FriendsLandingContainer");
v21.defaultProps = {
    visibleRows = 6, 
    tilesPerRow = 2, 
    Logger = l_Logger_0, 
    contentComponent = v15
};
v21.init = function(v22) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v17 (copy), l_llama_0 (copy), l_User_0 (copy)
    v22.localization = {
        pageError = "CommonUI.Messages.Response.PageError"
    };
    v22.filterFriends = l_memoize_0(v17);
    v22.sortFriends = l_memoize_0(function(v23) --[[ Line: 45 ]]
        -- upvalues: l_llama_0 (ref), l_User_0 (ref)
        return l_llama_0.List.sort(v23, l_User_0.sortFriendsByCorrectedPresenceAndRank);
    end);
end;
v21.render = function(v24) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_Roact_0 (copy), l_llama_0 (copy)
    return l_withLocalization_0(v24.localization)(function(v25) --[[ Line: 51 ]]
        -- upvalues: l_Roact_0 (ref), v24 (copy), l_llama_0 (ref)
        return l_Roact_0.createElement(v24.props.contentComponent, l_llama_0.Dictionary.join(v24.props, {
            totalFriendCount = #v24.props.friends, 
            friends = v24.sortFriends(v24.filterFriends(v24.props.friends, v24.props.filter)), 
            friendPruningEnabled = v24.props.friendPruningEnabled, 
            localizedStrings = v25, 
            totalInactiveFriends = #v24.filterFriends(v24.props.friends, "Inactive")
        }));
    end);
end;
v21 = l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialFriendsLandingLayer_0()
}, function(v26, _) --[[ Line: 68 ]]
    -- upvalues: l_getFStringSocialFriendsLandingLayer_0 (copy)
    local v28 = v26[l_getFStringSocialFriendsLandingLayer_0()] or {};
    return {
        friendPruningEnabled = v28.show_friend_pruning, 
        newFriendsSort = v28.new_friends_sort
    };
end)(v21);
return l_compose_0(l_RoactRodux_0.connect(v13, v14), l_UniversalAppPolicy_0.connect(function(v29) --[[ Line: 78 ]]
    return {
        enableDisplayNamePolicy = v29.getShowDisplayName()
    };
end), v16.connect(function(v30) --[[ Line: 83 ]]
    return {
        navigateToLuaAppPages = v30.navigateToLuaAppPages, 
        wideMode = v30.wideMode, 
        filter = v30.filter, 
        isLuobu = v30.isLuobu, 
        setFilterKeys = v30.setFilterKeys, 
        refreshPage = v30.refreshPage, 
        openPlayerContextualMenu = v30.openPlayerContextualMenu
    };
end), v12.connect(function(v31) --[[ Line: 94 ]]
    return {
        analytics = v31
    };
end))(v21);