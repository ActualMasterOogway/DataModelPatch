local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSearch").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local v6 = {
    emptyStateText = "Feature.Catalog.Search.LandingPage.Empty"
};
local function v8(v7) --[[ Line: 15 ]] --[[ Name: mapTokens ]]
    return {
        backgroundColor = v7.Semantic.Color.Background.Default.Color3, 
        backgroundTransparency = v7.Semantic.Color.Background.Default.Transparency, 
        textColorGroup = v7.Semantic.Color.Text.Emphasis, 
        textFontGroup = v7.Semantic.Typography.Body
    };
end;
return function(v9) --[[ Line: 28 ]] --[[ Name: SearchEmptyState ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), l_useDesignTokens_0 (copy), v8 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v10 = l_useLocalization_0(v6);
    local v11 = l_useDesignTokens_0(v8);
    local v12 = v9.text or v10.emptyStateText;
    return v1.createElement(l_StyledTextLabel_0, {
        fontStyle = v11.textFontGroup, 
        colorStyle = v11.textColorGroup, 
        text = v12, 
        textTruncate = Enum.TextTruncate.AtEnd, 
        textXAlignment = Enum.TextXAlignment.Center, 
        textYAlignment = Enum.TextYAlignment.Center, 
        automaticSize = Enum.AutomaticSize.XY, 
        size = UDim2.fromScale(1, 1)
    });
end;