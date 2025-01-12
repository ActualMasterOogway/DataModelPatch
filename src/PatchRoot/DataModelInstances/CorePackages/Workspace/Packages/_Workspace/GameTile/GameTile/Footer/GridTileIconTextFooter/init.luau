local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v5 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
return function(v6) --[[ Line: 40 ]] --[[ Name: GridTileIconTextFooter ]]
    -- upvalues: l_useDesignTokens_0 (copy), v5 (copy), v2 (copy), l_ImageSetLabel_0 (copy)
    local v7 = l_useDesignTokens_0();
    local l_Space_250_0 = v7.Global.Space_250;
    local l_Space_75_0 = v7.Global.Space_75;
    local l_Default_0 = v7.Semantic.Color.Text.Default;
    local v11 = v5(v6.useLargerFont, v7);
    local l_FontSize_0 = v11.FontSize;
    local v13 = nil;
    local v14 = nil;
    if v6.iconSize then
        v14 = v6.iconSize;
        v13 = v7.Global.Size_250;
    else
        v14 = l_FontSize_0 / 1.26;
        v13 = v14;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Space_250_0), 
        Position = v6.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        IconSlot = v2.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v13, v13), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = if v6.iconElement then v6.iconElement else v2.createElement(l_ImageSetLabel_0, {
                Image = v6.icon, 
                ImageColor3 = l_Default_0.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v14, v14), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        Text = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v6.text, 
            Size = UDim2.new(1, -(v13 + l_Space_75_0), 0, l_FontSize_0), 
            Position = UDim2.new(0, v13 + l_Space_75_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = l_FontSize_0, 
            Font = v11.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;