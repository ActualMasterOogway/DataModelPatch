local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.ImageSet.Images);
local v6 = require(l_Core_0.ImageSet.ImageSetComponent);
local v7 = require(l_Core_0.Style.useStyle);
local _ = require(l_Parent_0.Style.Fonts);
local v9 = require(l_Parent_1.UIBloxConfig);
local function v22(v10, v11, v12, v13) --[[ Line: 28 ]] --[[ Name: renderStatItem ]]
    -- upvalues: v9 (copy), v4 (copy), v6 (copy), v5 (copy)
    local l_Tokens_0 = v13.Tokens;
    local l_Font_0 = v13.Font;
    local v16 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v17 = v16 + l_Tokens_0.Global.Size_100;
    local l_Space_25_0 = l_Tokens_0.Global.Space_25;
    local l_Small_0 = l_Tokens_0.Semantic.Icon.Size.Small;
    local v20 = if v9.useFoundationColors then l_Tokens_0.Semantic.Color.Text.Default else l_Tokens_0.Semantic.Color.Text.Muted;
    local v21 = if v9.useFoundationColors then l_Tokens_0.Semantic.Color.Text.Default else l_Tokens_0.Semantic.Color.Text.Muted;
    return v4.createElement("Frame", v10, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_25_0)
        }), 
        Icon = v4.createElement(v6.Label, {
            Size = UDim2.fromOffset(l_Small_0, l_Small_0), 
            Image = v5[v11], 
            BackgroundTransparency = 1, 
            ImageTransparency = v20.Transparency, 
            ImageColor3 = v20.Color3, 
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0, 0.5)
        }), 
        Label = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = v12, 
            Font = l_Font_0.Body.Font, 
            TextSize = v16, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextColor3 = v21.Color3, 
            TextTransparency = v21.Transparency, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_Tokens_0.Global.Size_700, 1e999)
            }), 
            UiTextSizeConstraint = v4.createElement("UITextSizeConstraint", {
                MaxTextSize = v17
            })
        })
    });
end;
return function(v23) --[[ Line: 84 ]] --[[ Name: StatGroup ]]
    -- upvalues: v7 (copy), v4 (copy), v22 (copy)
    local v24 = v7();
    local l_Space_100_0 = v24.Tokens.Global.Space_100;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_100_0)
        }), 
        RatingStats = v22({
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, "icons/status/games/rating_small", v23.ratingText, v24), 
        PlayingStats = if v23.playingText ~= nil then v22({
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, "icons/status/games/people-playing_small", v23.playingText, v24) else nil
    });
end;