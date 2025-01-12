local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v3 = require(l_AddFriends_0.dependencies);
local l_t_0 = v3.t;
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_withLocalization_0 = v3.withLocalization;
local l_EmptyState_0 = l_UIBlox_0.App.Indicator.EmptyState;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local v10 = l_Roact_0.PureComponent:extend("AddFriendsEmptyState");
local v11 = UDim2.new(0, 255, 0, 170);
v10.validateProps = l_t_0.strictInterface({
    screenSize = l_t_0.optional(l_t_0.Vector2), 
    showNewAddFriendsPageVariant = l_t_0.optional(l_t_0.boolean)
});
v10.render = function(v12) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v2 (copy), l_Roact_0 (copy), l_EmptyState_0 (copy), l_Colors_0 (copy), v11 (copy)
    return l_withLocalization_0({
        noRequestsText = "Feature.AddFriends.Label.NoRequests", 
        emptyStatePromptText = if v12.props.showNewAddFriendsPageVariant then v2.ADD_FRIENDS_EMPTY_STATE_PROMPT_TEXT else nil, 
        titleText = if v12.props.showNewAddFriendsPageVariant then v2.ADD_FRIENDS_TOOLTIP_TITLE else nil
    })(function(v13) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), l_Roact_0 (ref), l_EmptyState_0 (ref), l_Colors_0 (ref), v11 (ref)
        if v12.props.showNewAddFriendsPageVariant then
            return l_Roact_0.createElement(l_EmptyState_0, {
                iconColor = l_Colors_0.White, 
                icon = "rbxassetid://12261497919", 
                iconSize = v11, 
                titleProps = {
                    titleText = v13.titleText
                }, 
                text = v13.emptyStatePromptText, 
                maxSizeTextLabel = v12.props.screenSize
            });
        else
            return l_Roact_0.createElement(l_EmptyState_0, {
                text = v13.noRequestsText, 
                size = UDim2.fromScale(1, 1)
            });
        end;
    end);
end;
return v10;