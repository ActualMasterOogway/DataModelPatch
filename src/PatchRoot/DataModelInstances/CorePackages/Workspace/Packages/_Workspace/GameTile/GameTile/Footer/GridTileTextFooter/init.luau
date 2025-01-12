local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local l_FFlagLuaAppTextFooterLegacyTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTextFooterLegacyTile;
local l_FFlagLuaAppEmphasisOfficial_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEmphasisOfficial;
return function(v7) --[[ Line: 32 ]] --[[ Name: GridTileTextFooter ]]
    -- upvalues: l_useDesignTokens_0 (copy), v4 (copy), v2 (copy), l_FFlagLuaAppEmphasisOfficial_0 (copy), l_FFlagLuaAppTextFooterLegacyTile_0 (copy)
    local v8 = l_useDesignTokens_0();
    local l_Space_250_0 = v8.Global.Space_250;
    local l_Default_0 = v8.Semantic.Color.Text.Default;
    local v11 = v4(v7.useLargerFont, v8);
    return v2.createElement("Frame", {
        LayoutOrder = if l_FFlagLuaAppEmphasisOfficial_0 then v7.LayoutOrder else nil, 
        Size = UDim2.new(1, 0, 0, l_Space_250_0), 
        Position = v7.Position, 
        AnchorPoint = if l_FFlagLuaAppTextFooterLegacyTile_0 then v7.AnchorPoint else nil, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        Text = v2.createElement("TextLabel", {
            Text = v7.text, 
            Size = UDim2.new(1, 0, 0, v11.FontSize), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = v11.FontSize, 
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