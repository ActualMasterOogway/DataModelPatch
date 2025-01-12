local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v8 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local v9 = l_Images_0["icons/status/games/rating_small"];
local v10 = l_Images_0["icons/status/games/people-playing_small"];
local v11 = Vector2.new(1e999, 1e999);
return function(v12) --[[ Line: 38 ]] --[[ Name: GridTileGameStats ]]
    -- upvalues: l_useDesignTokens_0 (copy), v8 (copy), v3 (copy), l_TextService_0 (copy), v11 (copy), l_ImageSetLabel_0 (copy), v9 (copy), v10 (copy)
    local v13 = l_useDesignTokens_0();
    local l_Space_250_0 = v13.Global.Space_250;
    local l_Space_50_0 = v13.Global.Space_50;
    local l_Space_100_0 = v13.Global.Space_100;
    local l_Default_0 = v13.Semantic.Color.Text.Default;
    local v18 = v8(v12.useLargerFont, v13);
    local l_FontSize_0 = v18.FontSize;
    local l_Font_0 = v18.Font;
    local v21 = l_FontSize_0 / 1.26;
    local l_ratingText_0 = v12.ratingText;
    local v23 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: l_ratingText_0 (copy), l_TextService_0 (ref), l_FontSize_0 (copy), l_Font_0 (copy), v11 (ref)
        if l_ratingText_0 == nil or l_ratingText_0 == "" then
            return 0;
        else
            return l_TextService_0:GetTextSize(l_ratingText_0, l_FontSize_0, l_Font_0, v11).X;
        end;
    end, {
        l_ratingText_0, 
        l_FontSize_0, 
        l_Font_0
    });
    local v24 = v21 + l_Space_50_0 + v23 + l_Space_100_0;
    local v25 = UDim.new(1, -(v24 + l_Space_50_0 + v21));
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Space_250_0), 
        Position = v12.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        RatingIconSlot = v3.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v21, v21), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = v3.createElement(l_ImageSetLabel_0, {
                Image = v9, 
                ImageColor3 = l_Default_0.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v21, v21), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        RatingText = v3.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = l_ratingText_0, 
            Size = UDim2.new(0, v23 + l_Space_50_0, 0, l_FontSize_0), 
            Position = UDim2.new(0, v21 + l_Space_50_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = l_FontSize_0, 
            Font = v18.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.None, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        PlayerCountIconSlot = v3.createElement("Frame", {
            Position = UDim2.new(0, v24, 0.5, 0), 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v21, v21), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = v3.createElement(l_ImageSetLabel_0, {
                Image = v10, 
                ImageColor3 = l_Default_0.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v21, v21), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        PlayerCountText = v3.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v12.playerCountText, 
            Size = UDim2.new(v25, UDim.new(0, v18.FontSize)), 
            Position = UDim2.new(0, v24 + v21 + l_Space_50_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = v18.FontSize, 
            Font = v18.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.None, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;