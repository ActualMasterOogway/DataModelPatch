local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v2.llama;
local l_Roact_0 = v2.Roact;
local l_memoize_0 = v2.memoize;
local l_Dictionary_0 = l_llama_0.Dictionary;
local v7 = require(l_script_FirstAncestor_0.Components.FriendsLandingPage);
local v8 = require(script.helpers.limitFriends);
local v9 = require(script.helpers.updateFriendsWithWidth);
local v10 = require(script.helpers.loadFriendGroup);
local v11 = require(script.helpers.friendsPerRow);
local v12 = require(script.helpers.friendsPerLoadGroup);
local v13 = require(l_script_FirstAncestor_0.Components.ShowMoreButton);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v15 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_Contexts_0 = v2.SocialLuaAnalytics.Analytics.Enums.Contexts;
local v17 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local l_React_0 = v2.React;
local l_GridMetrics_0 = v2.UIBlox.App.Grid.GridMetrics;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FFlagAddFriendsMigrateAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsMigrateAnalytics;
local v24 = l_Roact_0.PureComponent:extend("ShowMoreWrapper");
v24.defaultProps = {
    listComponent = v7, 
    itemSize = 175, 
    visibleRows = 6, 
    friends = {}, 
    analytics = nil, 
    filter = v15.All, 
    overrideRenderShowMore = nil, 
    handleShowMore = nil, 
    spacingIfEmpty = 48, 
    sectionType = v17.Friends
};
v24.init = function(v25) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: l_Dictionary_0 (copy), v15 (copy), v9 (copy), v12 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (copy), v17 (copy), l_Contexts_0 (copy), v14 (copy), v11 (copy), v10 (copy), l_memoize_0 (copy), v8 (copy), l_Roact_0 (copy), v13 (copy)
    v25.state = {
        width = 100, 
        filterFriendCounts = l_Dictionary_0.map(v15, function() --[[ Line: 56 ]]
            -- upvalues: v25 (copy)
            return v25.props.visibleRows;
        end), 
        selectedItemIndex = nil
    };
    v25.updateWidth = function(v26) --[[ Line: 62 ]]
        -- upvalues: v25 (copy), v9 (ref)
        v25:setState(v9(v26.AbsoluteSize.X));
        if v25.props.onWidthUpdated then
            v25.props.onWidthUpdated(v26.AbsoluteSize.X);
        end;
    end;
    v25.reset = function() --[[ Line: 70 ]]
        -- upvalues: v25 (copy), l_Dictionary_0 (ref), v12 (ref)
        v25:setState(function(v27, v28) --[[ Line: 71 ]]
            -- upvalues: l_Dictionary_0 (ref), v25 (ref), v12 (ref)
            return {
                filterFriendCounts = l_Dictionary_0.join(v25.state.filterFriendCounts, {
                    [v25.props.filter] = v12(v27, v28)
                })
            };
        end);
    end;
    v25.showMore = function() --[[ Line: 81 ]]
        -- upvalues: v25 (copy), l_FFlagAddFriendsMigrateAnalytics_0 (ref), v17 (ref), l_Contexts_0 (ref), v14 (ref), v11 (ref), l_Dictionary_0 (ref), v10 (ref)
        if v25.props.analytics then
            local v29 = nil;
            if not l_FFlagAddFriendsMigrateAnalytics_0 then
                v29 = if not (v25.props.sectionType ~= v17.FriendRequests) or v25.props.sectionType == v17.FriendRecommendations then l_Contexts_0.AddFriends else nil;
            end;
            v25.props.analytics:buttonClick(v14.LoadMoreUsers, {
                sectionType = v25.props.sectionType, 
                contextOverride = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v29, 
                recommendationSessionId = if l_FFlagAddFriendsMigrateAnalytics_0 then nil else v25.props.friendRecommendationsSessionId
            });
        end;
        if l_FFlagAddFriendsMigrateAnalytics_0 and v25.props.fireOnShowMore then
            v25.props.fireOnShowMore(v25.props.sectionType);
        end;
        if v25.props.handleShowMore then
            v25.props.handleShowMore(v11(l_Dictionary_0.join({
                width = v25.state.width
            }, v25.props)));
            return;
        else
            v25:setState(function(v30, v31) --[[ Line: 113 ]]
                -- upvalues: l_Dictionary_0 (ref), v10 (ref)
                local v32 = v30.filterFriendCounts[v31.filter];
                return l_Dictionary_0.join(v10(v30, v31), {
                    selectedItemIndex = v32 + 1
                });
            end);
            return;
        end;
    end;
    v25.limitFriends = l_memoize_0(v8);
    v25.renderShowMore = l_memoize_0(function(v33, v34, v35) --[[ Line: 126 ]]
        -- upvalues: l_Roact_0 (ref), v13 (ref), v25 (copy)
        return function(v36) --[[ Line: 127 ]]
            -- upvalues: v35 (copy), v34 (copy), v33 (copy), l_Roact_0 (ref), v13 (ref), v25 (ref)
            local v37 = v35 and v35(v34);
            if v34 < v33 or v37 then
                return l_Roact_0.createElement(v13, {
                    layoutOrder = v36, 
                    onSizeChange = v25.updateWidth, 
                    onActivated = v25.showMore
                });
            else
                return l_Roact_0.createElement("Frame", {
                    Name = "showMoreSpacing", 
                    Size = UDim2.fromOffset(0, v25.props.spacingIfEmpty), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v36
                });
            end;
        end;
    end);
    v25.checkAndResetIfNeeded = function(v38) --[[ Line: 148 ]]
        -- upvalues: v25 (copy)
        if #v25.props.friends ~= #v38.friends or v38.visibleRows ~= v25.props.visibleRows then
            v25.reset();
        end;
    end;
end;
v24.didUpdate = function(v39, v40) --[[ Line: 155 ]] --[[ Name: didUpdate ]]
    v39.checkAndResetIfNeeded(v40);
end;
v24.render = function(v41) --[[ Line: 159 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_Dictionary_0 (copy)
    local v42 = v41.state.filterFriendCounts[v41.props.filter];
    return l_Roact_0.createElement(v41.props.listComponent, l_Dictionary_0.join(v41.props, {
        friends = v41.limitFriends(v42, v41.props.friends), 
        showMore = v41.showMore, 
        totalFilteredFriends = #v41.props.friends, 
        renderShowMore = v41.renderShowMore(#v41.props.friends, v42, v41.props.overrideRenderShowMore), 
        resetShowMore = v41.reset, 
        totalInactiveFriends = v41.props.totalInactiveFriends, 
        selectedItemIndex = v41.state.selectedItemIndex
    }));
end;
return function(v43) --[[ Line: 177 ]] --[[ Name: ShowMoreWrapperFn ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_React_0 (copy), l_GridMetrics_0 (copy), v24 (copy), l_llama_0 (copy)
    local v44 = l_useDesignTokens_0();
    local v45 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local l_GridViewItemMetrics_0 = v44.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
    local l_GridHorizontalSpacing_0 = v44.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    local l_GridVerticalSpacing_0 = v44.LuaApps.FriendsLanding.FriendsLandingPage.GridVerticalSpacing;
    local v49 = l_React_0.useMemo(function() --[[ Line: 186 ]]
        -- upvalues: v45 (copy), l_GridMetrics_0 (ref), l_GridViewItemMetrics_0 (copy)
        if v45 then
            return l_GridMetrics_0.makeCustomMetricsGetter(l_GridViewItemMetrics_0);
        else
            return nil;
        end;
    end, {
        v45, 
        l_GridViewItemMetrics_0
    });
    local v50, v51 = l_React_0.useState(100);
    local v52 = l_React_0.useMemo(function() --[[ Line: 195 ]]
        -- upvalues: v45 (copy), v49 (copy), l_GridHorizontalSpacing_0 (copy), v50 (copy)
        if v45 and v49 and l_GridHorizontalSpacing_0 then
            return v49(v50, l_GridHorizontalSpacing_0).itemWidth;
        else
            return nil;
        end;
    end, {
        v45, 
        v49, 
        v50, 
        l_GridHorizontalSpacing_0
    });
    return l_React_0.createElement(v24, l_llama_0.Dictionary.join({
        onWidthUpdated = if v45 then v51 else nil, 
        itemSize = v52, 
        getItemMetrics = v49, 
        gridHorizontalSpacing = l_GridHorizontalSpacing_0, 
        gridVerticalSpacing = l_GridVerticalSpacing_0
    }, v43));
end;