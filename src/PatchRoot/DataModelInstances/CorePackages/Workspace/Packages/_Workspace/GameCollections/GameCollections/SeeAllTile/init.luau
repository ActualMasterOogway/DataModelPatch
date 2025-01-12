local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_useCursor_0 = v2.App.SelectionCursor.useCursor;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v8 = l_Images_0["icons/navigation/pushRight"];
SeeAllTile = function(v9) --[[ Line: 26 ]] --[[ Name: SeeAllTile ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useCursor_0 (copy), v8 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    local v10 = l_useDesignTokens_0();
    local v11 = l_useLocalization_0({
        seeAll = "Feature.Home.ActionSeeAll"
    });
    local v12 = UDim.new(0, v10.Global.Space_100);
    local v13 = l_useCursor_0(v12);
    local l_Subheader_0 = v10.Semantic.Typography.Subheader;
    local l_Color3_0 = v10.Semantic.Color.Text.Emphasis.Color3;
    local l_Color3_1 = v10.Semantic.Color.Icon.Emphasis.Color3;
    local l_Transparency_0 = v10.Semantic.Color.Icon.Emphasis.Transparency;
    local v18 = v9.title or v11.seeAll;
    local v19 = v9.icon or v8;
    local l_Medium_0 = v10.Semantic.Icon.Size.Medium;
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        Text = "", 
        Size = v9.Size, 
        LayoutOrder = v9.LayoutOrder, 
        BackgroundTransparency = v10.Semantic.Color.BackgroundUi.Default.Transparency, 
        BackgroundColor3 = v10.Semantic.Color.BackgroundUi.Default.Color3, 
        [v1.Event.Activated] = v9.onActivated, 
        SelectionImageObject = v13
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = v12
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v10.Global.Space_50)
        }), 
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
            BackgroundTransparency = 1, 
            Image = v19, 
            ImageColor3 = l_Color3_1, 
            ImageTransparency = l_Transparency_0, 
            LayoutOrder = 1
        }), 
        Title = v1.createElement("TextLabel", {
            Text = v18, 
            Size = UDim2.new(1, 0, 0, l_Subheader_0.FontSize), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            LayoutOrder = 2, 
            Font = l_Subheader_0.Font, 
            TextSize = l_Subheader_0.FontSize, 
            TextColor3 = l_Color3_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
end;
return SeeAllTile;