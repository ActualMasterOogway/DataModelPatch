local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_ConnectTabChatTileRecolorExperimentation_0 = v1.ConnectTabChatTileRecolorExperimentation;
local l_GetFFlagConnectTabChatTileRecolorEnabled_0 = v1.GetFFlagConnectTabChatTileRecolorEnabled;
local l_BadgeStates_0 = l_UIBlox_0.App.Indicator.Enum.BadgeStates;
local l_BadgeVariant_0 = l_UIBlox_0.App.Indicator.Enum.BadgeVariant;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v10 = l_Roact_0.PureComponent:extend("ChatTile");
v10.defaultProps = {
    LayoutOrder = 1, 
    unreadConversationCount = nil, 
    onActivated = function() --[[ Line: 18 ]] --[[ Name: onActivated ]]

    end, 
    title = ""
};
v10.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    unreadConversationCount = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    title = l_t_0.optional(l_t_0.string)
});
v10.render = function(v11) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_BadgeStates_0 (copy), l_UIBlox_0 (copy), l_Roact_0 (copy), l_ConnectTabChatTileRecolorExperimentation_0 (copy), l_GetFFlagConnectTabChatTileRecolorEnabled_0 (copy), l_BadgeVariant_0 (copy), l_Images_0 (copy)
    local v12 = if v11.props.unreadConversationCount and v11.props.unreadConversationCount > 0 then l_BadgeStates_0.isEmpty else nil;
    return l_UIBlox_0.Style.withStyle(function() --[[ Line: 34 ]]
        -- upvalues: l_Roact_0 (ref), l_UIBlox_0 (ref), v11 (copy), v12 (copy), l_ConnectTabChatTileRecolorExperimentation_0 (ref), l_GetFFlagConnectTabChatTileRecolorEnabled_0 (ref), l_BadgeVariant_0 (ref), l_Images_0 (ref)
        return l_Roact_0.createElement(l_UIBlox_0.App.Tile.MenuTile, {
            size = UDim2.fromScale(1, 1), 
            layoutOrder = v11.props.LayoutOrder, 
            badgeValue = v12, 
            badgeVariant = if l_ConnectTabChatTileRecolorExperimentation_0.isEnabled() and l_ConnectTabChatTileRecolorExperimentation_0:getIsRecolored() or l_GetFFlagConnectTabChatTileRecolorEnabled_0() then l_BadgeVariant_0.Alert else nil, 
            icon = l_Images_0["icons/menu/messages_large"], 
            title = v11.props.title, 
            onActivated = v11.props.onActivated
        });
    end);
end;
return v10;