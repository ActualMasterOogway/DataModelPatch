local l_AddFriends_0 = script:FindFirstAncestor("FriendsLanding").AddFriends;
local v1 = require(l_AddFriends_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_BaseMenu_0 = l_UIBlox_0.App.Menu.BaseMenu;
local v7 = l_Roact_0.PureComponent:extend("IgnoreAllFriendsRequestsMenu");
v7.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    onIgnoreAll = l_t_0.callback, 
    width = l_t_0.optional(l_t_0.UDim), 
    openPositionY = l_t_0.optional(l_t_0.UDim)
});
v7.defaultProps = {
    openPositionY = UDim.new(0, 0)
};
v7.render = function(v8) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_Roact_0 (copy), l_BaseMenu_0 (copy)
    return l_withLocalization_0({
        ignoreAllLabel = "Feature.AddFriends.Action.IgnoreAll"
    })(function(v9) --[[ Line: 26 ]]
        -- upvalues: v8 (copy), l_Roact_0 (ref), l_BaseMenu_0 (ref)
        local l_open_0 = v8.props.open;
        local l_onIgnoreAll_0 = v8.props.onIgnoreAll;
        local l_width_0 = v8.props.width;
        local l_openPositionY_0 = v8.props.openPositionY;
        return l_open_0 and l_Roact_0.createElement(l_BaseMenu_0, {
            buttonProps = {
                {
                    text = v9.ignoreAllLabel, 
                    onActivated = l_onIgnoreAll_0
                }
            }, 
            anchorPoint = Vector2.new(1, 0), 
            width = l_width_0, 
            position = UDim2.new(UDim.new(1, 0), l_openPositionY_0)
        }) or nil;
    end);
end;
return v7;