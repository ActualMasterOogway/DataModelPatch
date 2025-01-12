local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v3 = require(l_AddFriends_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_t_0 = v3.t;
local v6 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_FFlagCalculateFriendsTileSize_0 = require(l_Parent_0.SharedFlags).FFlagCalculateFriendsTileSize;
local l_UIBlox_0 = v3.UIBlox;
local l_DefaultMetricsGridView_0 = l_UIBlox_0.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = l_UIBlox_0.App.Grid.GridMetrics;
local v14 = l_Roact_0.PureComponent:extend("AddFriendsGridView");
v14.validateProps = l_t_0.strictInterface({
    items = l_t_0.table, 
    windowSize = l_t_0.Vector2, 
    renderAddFriendsTile = l_t_0.callback, 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    itemMargin = l_t_0.optional(l_t_0.integer), 
    getItemMetrics = l_t_0.optional(l_t_0.callback), 
    tileHeightOffset = if l_FFlagCalculateFriendsTileSize_0 then l_t_0.number else nil
});
v14.defaultProps = {
    layoutOrder = 1, 
    itemMargin = 12, 
    getItemMetrics = l_GridMetrics_0.getMediumMetrics
};
v14.init = function(v15) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagCalculateFriendsTileSize_0 (copy)
    v15.renderItem = function(v16, v17) --[[ Line: 40 ]]
        -- upvalues: v15 (copy)
        local l_windowSize_0 = v15.props.windowSize;
        local l_itemWidth_0 = v15.props.getItemMetrics(l_windowSize_0.X, v15.props.itemMargin).itemWidth;
        local v20 = v15.getItemHeight(l_itemWidth_0);
        return v15.props.renderAddFriendsTile(v16, l_itemWidth_0, v20, v17);
    end;
    v15.getItemHeight = function(v21) --[[ Line: 47 ]]
        -- upvalues: l_FFlagCalculateFriendsTileSize_0 (ref), v15 (copy)
        if l_FFlagCalculateFriendsTileSize_0 then
            return v21 + v15.props.tileHeightOffset;
        else
            return v21 + 80;
        end;
    end;
end;
v14.render = function(v22) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_DefaultMetricsGridView_0 (copy)
    return l_Roact_0.createElement(l_DefaultMetricsGridView_0, {
        getItemHeight = v22.getItemHeight, 
        items = v22.props.items, 
        getItemMetrics = v22.props.getItemMetrics, 
        renderItem = v22.renderItem, 
        itemPadding = Vector2.new(12, 12), 
        maxHeight = 1e999, 
        defaultChildIndex = 1, 
        LayoutOrder = v22.props.layoutOrder
    });
end;
local function v26(v23) --[[ Line: 67 ]] --[[ Name: AddFriendsGridViewFunctional ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_Roact_0 (copy), v14 (copy), v6 (copy)
    local v24 = l_useDesignTokens_0();
    local v25 = if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then v24.Global.Space_800 else v24.Global.Space_1000;
    return l_Roact_0.createElement(v14, v6.Dictionary.join(v23, {
        tileHeightOffset = v25
    }));
end;
if l_FFlagCalculateFriendsTileSize_0 then
    return v26;
else
    return v14;
end;