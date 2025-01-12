local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_AddFriends_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_validateImage_0 = l_UIBlox_0.Core.ImageSet.Validator.validateImage;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsComponentsTransparent);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsPageUseToken);
local v12 = l_Roact_0.PureComponent:extend("AddFriendsSectionHeaderFrame");
v12.validateProps = l_t_0.strictInterface({
    title = l_t_0.string, 
    icon = l_validateImage_0, 
    iconVisible = l_t_0.boolean, 
    onIconActivated = l_t_0.optional(l_t_0.callback), 
    layoutOrder = l_t_0.optional(l_t_0.integer)
});
v12.defaultProps = {
    layoutOrder = 1
};
v12.render = function(v13) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v10 (copy), v11 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v14) --[[ Line: 32 ]]
        -- upvalues: l_Roact_0 (ref), v13 (copy), v10 (ref), v11 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref)
        return l_Roact_0.createElement("Frame", {
            ZIndex = 2, 
            Position = UDim2.new(0, 24, 0, 0), 
            Size = UDim2.new(1, 0, 0, v14.Tokens.Global.Space_600), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v13.props.layoutOrder, 
            BackgroundColor3 = if not v10 then v14.Theme.BackgroundDefault.Color else nil, 
            BackgroundTransparency = v10 and 1 or nil, 
            BorderSizePixel = 0
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
            }), 
            HeaderLabel = l_Roact_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = v14.Font.Header1.Font, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(0.8, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v13.props.title, 
                TextColor3 = if v11 then v14.Tokens.Semantic.Color.Text.Emphasis.Color3 else v14.Theme.TextEmphasis.Color, 
                TextSize = if v11 then v14.Tokens.Semantic.Typography.Header.FontSize else v14.Font.BaseSize * v14.Font.Header1.RelativeSize, 
                TextTransparency = if v11 then v14.Tokens.Semantic.Color.Text.Emphasis.Transparency else v14.Theme.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            HeaderImageButton = v13.props.iconVisible and l_Roact_0.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(l_IconSize_0.Medium, l_IconSize_0.Medium), 
                position = UDim2.new(1, 0, 0, 6), 
                anchorPoint = Vector2.new(1, 0), 
                icon = v13.props.icon, 
                iconTransparency = if v11 then v14.Tokens.Semantic.Color.Icon.Emphasis.Transparency else v14.Theme.IconEmphasis.Transparency, 
                iconColor3 = if v11 then v14.Tokens.Semantic.Color.Icon.Emphasis.Color3 else v14.Theme.IconEmphasis.Color, 
                onActivated = v13.props.onIconActivated, 
                layoutOrder = 2
            }) or nil
        });
    end);
end;
return v12;