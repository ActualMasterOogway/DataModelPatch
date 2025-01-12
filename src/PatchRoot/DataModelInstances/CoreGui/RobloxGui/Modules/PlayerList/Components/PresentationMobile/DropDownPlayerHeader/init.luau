local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_withStyle_0 = v3.Style.withStyle;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_EmojiTextLabel_0 = v3.Core.Text.EmojiTextLabel;
local l_Emoji_0 = v3.App.Emoji.Enum.Emoji;
local v10 = v1.PureComponent:extend("DropDownPlayerHeader");
v10.validateProps = v2.strictInterface({
    player = v2.instanceIsA("Player"), 
    transparency = v2.any, 
    contentVisible = v2.boolean
});
v10.render = function(v11) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v4 (copy), v1 (copy), l_EmojiTextLabel_0 (copy), l_Emoji_0 (copy)
    return l_WithLayoutValues_0(function(v12) --[[ Line: 32 ]]
        -- upvalues: l_withStyle_0 (ref), v11 (copy), v4 (ref), v1 (ref), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref)
        return l_withStyle_0(function(v13) --[[ Line: 33 ]]
            -- upvalues: v11 (ref), v4 (ref), v1 (ref), v12 (copy), l_EmojiTextLabel_0 (ref), l_Emoji_0 (ref)
            local l_player_0 = v11.props.player;
            local v15 = v4.Utils.isPlayerVerified(l_player_0);
            return v1.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, v12.DropDownHeaderSizeY), 
                LayoutOrder = 0, 
                Selectable = false
            }, {
                Background = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png", 
                    ImageTransparency = v11.props.transparency, 
                    Size = UDim2.new(1, 0, 0, v12.DropDownHeaderBackgroundSize), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1)
                }, {
                    TextContainerFrame = v1.createElement("Frame", {
                        Visible = v11.props.contentVisible, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -124, 1, 0), 
                        Position = UDim2.new(0, 107, 0, 0)
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            Padding = UDim.new(0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        DisplayName = v15 and v1.createElement(l_EmojiTextLabel_0, {
                            fontStyle = v13.Font.Header2, 
                            colorStyle = v13.Theme.TextEmphasis, 
                            fluidSizing = false, 
                            emoji = l_Emoji_0.Verified, 
                            maxSize = Vector2.new(v12.PlayerDropDownSizeXMobile - 124, 22), 
                            LayoutOrder = 1, 
                            Text = l_player_0.DisplayName, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }) or v1.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            Text = l_player_0.DisplayName, 
                            Font = v13.Font.Header2.Font, 
                            TextSize = v13.Font.BaseSize * v13.Font.Header2.RelativeSize, 
                            TextColor3 = v13.Theme.TextEmphasis.Color, 
                            TextTransparency = v13.Theme.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }, {
                            SizeConstraint = v1.createElement("UITextSizeConstraint", {
                                MaxTextSize = v13.Font.BaseSize * v13.Font.Header2.RelativeSize, 
                                MinTextSize = v13.Font.BaseSize * v13.Font.Footer.RelativeSize
                            })
                        }), 
                        PlayerName = v1.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 22), 
                            Text = "@" .. l_player_0.Name, 
                            Font = v13.Font.CaptionHeader.Font, 
                            TextSize = v13.Font.BaseSize * v13.Font.CaptionHeader.RelativeSize, 
                            TextColor3 = v13.Theme.TextMuted.Color, 
                            TextTransparency = v13.Theme.TextMuted.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            BackgroundTransparency = 1, 
                            TextScaled = true
                        }, {
                            SizeConstraint = v1.createElement("UITextSizeConstraint", {
                                MaxTextSize = v13.Font.BaseSize * v13.Font.CaptionHeader.RelativeSize, 
                                MinTextSize = v13.Font.BaseSize * v13.Font.Footer.RelativeSize
                            })
                        })
                    })
                }), 
                AvatarImage = v1.createElement("ImageLabel", {
                    Position = UDim2.new(0, 56, 0, 0), 
                    Size = UDim2.new(0, v12.DropDownHeaderSizeY, 0, v12.DropDownHeaderSizeY), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = v11.props.transparency, 
                    Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(l_player_0.UserId), 
                    ZIndex = 2
                }), 
                Divider = not v11.props.lastButton and v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Visible = v11.props.contentVisible, 
                    BackgroundTransparency = v13.Theme.Divider.Transparency, 
                    BackgroundColor3 = v13.Theme.Divider.Color, 
                    BorderSizePixel = 0, 
                    ZIndex = 3
                })
            });
        end);
    end);
end;
return v10;