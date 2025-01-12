local l_AddFriends_0 = script:FindFirstAncestor("FriendsLanding").AddFriends;
local v1 = require(l_AddFriends_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v8 = l_Roact_0.PureComponent:extend("AddFriendsContactImporterBanner");
local function v9() --[[ Line: 18 ]]

end;
v8.validateProps = l_t_0.strictInterface({
    bannerText = l_t_0.string, 
    buttonText = l_t_0.optional(l_t_0.string), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    containerWidth = l_t_0.number
});
v8.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v9 (copy)
    local l_props_0 = v10.props;
    return l_withStyle_0(function(v12) --[[ Line: 36 ]]
        -- upvalues: l_Roact_0 (ref), l_props_0 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v9 (ref)
        return l_Roact_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 1, 
            BackgroundColor3 = v12.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v12.Theme.BackgroundUIDefault.Transparency
        }, {
            UIPadding = l_Roact_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 12)
            }), 
            UICorner = l_Roact_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIStroke = l_Roact_0.createElement("UIStroke", {
                Color = v12.Theme.Divider.Color, 
                Transparency = v12.Theme.Divider.Transparency, 
                Thickness = 1
            }), 
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = if l_props_0.containerWidth >= 480 then Enum.FillDirection.Horizontal else nil, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(640, 1e999)
            }), 
            TitleFrame = l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = if l_props_0.containerWidth >= 480 then UDim2.fromScale(0.6, 0) else UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = l_Roact_0.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 12)
                }), 
                BannerText = l_Roact_0.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v12.Font.CaptionBody.Font, 
                    Size = UDim2.fromScale(1, 0), 
                    Text = l_props_0.bannerText, 
                    TextColor3 = v12.Theme.TextEmphasis.Color, 
                    TextSize = v12.Font.BaseSize * v12.Font.CaptionBody.RelativeSize, 
                    TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true, 
                    LayoutOrder = 1
                })
            }), 
            ButtonFrame = if l_props_0.buttonText then l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = if l_props_0.containerWidth >= 480 then UDim2.new(0.4, 0, 0, 28) else UDim2.new(1, 0, 0, 28), 
                LayoutOrder = 2
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                Button = l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = if l_props_0.containerWidth >= 480 then UDim2.new(0, 160, 1, 0) else UDim2.fromScale(1, 1), 
                    text = l_props_0.buttonText, 
                    onActivated = l_props_0.onActivated or v9, 
                    fontStyle = v12.Font.CaptionBody
                })
            }) else nil
        });
    end);
end;
return v8;