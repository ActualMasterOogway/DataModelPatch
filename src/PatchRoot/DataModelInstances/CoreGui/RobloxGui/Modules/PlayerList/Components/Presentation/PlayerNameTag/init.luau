local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v5 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Connection_0 = l_Parent_0.Components.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v10 = require(l_Parent_0.Hooks.usePlayerCombinedName);
local v11 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v12 = v2.PureComponent:extend("PlayerNameTag");
v12.validateProps = v3.strictInterface({
    player = v11, 
    isTitleEntry = v3.boolean, 
    isHovered = v3.boolean, 
    layoutOrder = v3.integer, 
    name = v3.string, 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    textFont = v3.strictInterface({
        Size = v3.number, 
        MinSize = v3.number, 
        Font = v3.enum(Enum.Font)
    })
});
v12.render = function(v13) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    return l_WithLayoutValues_0(function(v14) --[[ Line: 59 ]]
        -- upvalues: v13 (copy), v5 (ref), v2 (ref), v4 (ref)
        local l_IconUnSelectedColor_0 = v14.IconUnSelectedColor;
        if v13.props.isHovered then
            l_IconUnSelectedColor_0 = v14.IconSelectedColor;
        end;
        local l_Font_0 = v13.props.textFont.Font;
        local l_Size_0 = v13.props.textFont.Size;
        local v18 = {};
        local l_PlatformName_0 = v13.props.player.PlatformName;
        local v20 = v5.Utils.isPlayerVerified(v13.props.player);
        if v14.IsTenFoot and l_PlatformName_0 ~= "" then
            v18.VerticalLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            });
            v18.PlayerPlatformName = v2.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0.35, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = Enum.Font.SourceSans, 
                TextSize = l_Size_0, 
                TextColor3 = v13.props.textStyle.Color, 
                TextTransparency = v13.props.textStyle.Transparency, 
                TextStrokeColor3 = v13.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v13.props.textStyle.StrokeTransparency, 
                BackgroundTransparency = 1, 
                Text = l_PlatformName_0, 
                LayoutOrder = 2
            });
            v18.RobloxNameFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0.45, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                RobloxIcon = v2.createElement("ImageButton", {
                    Size = UDim2.new(0, 24, 0, 24), 
                    Image = v14.RobloxIconImage, 
                    BackgroundTransparency = 1, 
                    Selectable = false, 
                    ImageColor3 = l_IconUnSelectedColor_0, 
                    LayoutOrder = 1
                }), 
                PlayerNameContainer = v2.createElement(v4.EmojiWrapper, {
                    emoji = if v20 then v4.emoji.verified else "", 
                    layoutOrder = 2, 
                    mockIsEnrolled = true, 
                    size = UDim2.new(1, -30, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    verticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    PlayerName = v2.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        ClipsDescendants = false, 
                        Size = UDim2.fromScale(0, 1), 
                        Font = l_Font_0, 
                        Text = v13.props.name, 
                        TextSize = l_Size_0, 
                        TextColor3 = v13.props.textStyle.Color, 
                        TextTransparency = v13.props.textStyle.Transparency, 
                        TextStrokeColor3 = v13.props.textStyle.StrokeColor, 
                        TextStrokeTransparency = v13.props.textStyle.StrokeTransparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1
                    })
                })
            });
        else
            v18.PlayerNameContainer = v2.createElement(v4.EmojiWrapper, {
                emoji = if v20 then v4.emoji.verified else "", 
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.fromScale(0, 0.5), 
                mockIsEnrolled = true, 
                verticalAlignment = Enum.VerticalAlignment.Center, 
                automaticSize = Enum.AutomaticSize.X, 
                size = UDim2.new(0, 0, 0, l_Size_0)
            }, {
                PlayerName = v2.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromScale(0, 1), 
                    Font = l_Font_0, 
                    Text = v13.props.name, 
                    TextSize = l_Size_0, 
                    TextColor3 = v13.props.textStyle.Color, 
                    TextTransparency = v13.props.textStyle.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextScaled = false, 
                    TextStrokeColor3 = v13.props.textStyle.StrokeColor, 
                    TextStrokeTransparency = v13.props.textStyle.StrokeTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1
                })
            });
        end;
        return v2.createElement("Frame", {
            LayoutOrder = v13.props.layoutOrder, 
            Size = v14.PlayerNameSize, 
            BackgroundTransparency = 1
        }, v18);
    end);
end;
return function(v21) --[[ Line: 178 ]] --[[ Name: PlayerNameTagContainer ]]
    -- upvalues: v10 (copy), v2 (copy), v12 (copy), v6 (copy)
    local v22 = v10(tostring(v21.player.UserId), v21.player.DisplayName);
    return v2.createElement(v12, v6.Dictionary.join(v21, {
        name = v22
    }));
end;