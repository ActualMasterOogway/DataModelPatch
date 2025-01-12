local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppCommonStyle);
local v4 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local v7 = require(l_script_FirstAncestor_0.Enums.HeadShapeProperties);
local v8 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v9 = require(l_script_FirstAncestor_0.Enums.HeadShapeTileSize);
local v10 = require(l_script_FirstAncestor_0.Utils.getMappedStyleTokens);
local l_useDesignTokens_0 = v3.useDesignTokens;
local v12 = require(l_script_FirstAncestor_0.Flags.GetFFlagAXHeadRefinementVisualFixes);
return function(v13) --[[ Line: 33 ]] --[[ Name: HeadShapeTile ]]
    -- upvalues: l_useDesignTokens_0 (copy), v10 (copy), v8 (copy), v7 (copy), v9 (copy), v2 (copy), l_ImageSetButton_0 (copy), v12 (copy), l_ImageSetLabel_0 (copy)
    local v14 = l_useDesignTokens_0();
    local v15 = v10(v14);
    local v16 = v7[v13.headShape or v8.Default];
    local v17 = if v13.size == v9.Large then v15.largeTileImageSize else v15.smallTileImageSize;
    local v18 = if v13.size == v9.Large then v15.largeTileContainerSize else v15.smallTileContainerSize;
    local v19 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v13 (copy)
        if v13.onActivated then
            v13.onActivated();
        end;
    end, {
        v13.onActivated
    });
    return v2.createElement(l_ImageSetButton_0, {
        BackgroundColor3 = v14.Semantic.Color.BackgroundUi.Default.Color3, 
        BackgroundTransparency = v14.Semantic.Color.BackgroundUi.Default.Transparency, 
        Size = UDim2.new(0, v18, 0, v18), 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeTile", 
        [v2.Event.Activated] = v19, 
        LayoutOrder = v13.LayoutOrder, 
        NextSelectionUp = v13.NextSelectionUp
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v14.Semantic.Radius.Medium)
        }), 
        UIStroke = if v13.isSelected then v2.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
            Thickness = v12() and 2 or 1, 
            Color = v14.Semantic.Color.Ui.Emphasis.Color3
        }) else nil, 
        HeadShapeTileImage = v2.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = v16.image, 
            Size = UDim2.new(0, v17, 0, v17), 
            BackgroundTransparency = 1, 
            [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapeTile_Image"
        })
    });
end;