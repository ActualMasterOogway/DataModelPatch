local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.AppCommonStyle);
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local v8 = require(l_script_FirstAncestor_0.Components.HeadShapeList);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShapeTileSize);
local v10 = require(l_script_FirstAncestor_0.Utils.sortHeadShapes);
local l_useDesignTokens_0 = v5.useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = game:DefineFastFlag("AXHeadRefinementPaddingFixes", false);
return function(v14) --[[ Line: 34 ]] --[[ Name: HeadShapePicker ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), v10 (copy), v13 (copy), l_StyledTextLabel_0 (copy), l_LoadingSpinner_0 (copy), v8 (copy)
    local v15 = l_useDesignTokens_0();
    local v16 = l_useLocalization_0({
        headingText = "Feature.Avatar.Label.HeadRefinement.Title", 
        subheadingText = "Feature.Avatar.Label.HeadRefinement.Description", 
        unsupportedText = "Feature.Avatar.Label.HeadRefinement.Description.Unsupported"
    });
    local v18 = v2.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v10 (ref), v14 (copy)
        return v10(v14.items or {}, function(v17) --[[ Line: 43 ]]
            return v17.headShapeName;
        end);
    end, {
        v14.items
    });
    return v2.createElement("Frame", {
        Size = v14.size or UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = v15.Semantic.Color.Background.Default.Color3, 
        BackgroundTransparency = v15.Semantic.Color.Background.Default.Transparency, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerContainer", 
        ref = v14.containerRef, 
        NextSelectionUp = v14.NextSelectionUp
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v15.Global.Size_200), 
            PaddingBottom = UDim.new(0, v15.Global.Size_250)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v15.Semantic.Radius.Medium)
        }), 
        Heading = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerHeadingText"
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v15.Global.Size_250), 
                PaddingRight = UDim.new(0, v15.Global.Size_250), 
                PaddingBottom = if v13 then UDim.new(0, v15.Global.Size_150) else nil
            }), 
            StyledTextLabel = v2.createElement(l_StyledTextLabel_0, {
                automaticSize = if v13 then Enum.AutomaticSize.XY else nil, 
                size = if v13 then UDim2.new(0, 0, 0, 0) else nil, 
                text = v16.headingText, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v15.Semantic.Typography.Header, 
                colorStyle = v15.Semantic.Color.Text.Emphasis
            })
        }), 
        HeadShapePickerLoading = if v14.isLoading then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v15.Global.Size_150), 
                PaddingBottom = UDim.new(0, v15.Global.Size_150)
            }), 
            Spinner = v2.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.new(0, v15.Global.Size_250, 0.5, 0), 
                size = UDim2.fromOffset(v15.Semantic.Icon.Size.Medium, v15.Semantic.Icon.Size.Medium)
            })
        }) else nil, 
        Subheading = if v14.isLoading then nil else v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v2.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerSubheadingText"
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v15.Global.Size_250), 
                PaddingRight = UDim.new(0, v15.Global.Size_250), 
                PaddingBottom = if v14.isUnsupported then nil else UDim.new(0, v15.Global.Size_150)
            }), 
            StyledTextLabel = v2.createElement(l_StyledTextLabel_0, {
                automaticSize = if v13 then Enum.AutomaticSize.XY else nil, 
                size = if v13 then UDim2.new(0, 0, 0, 0) else nil, 
                text = if v14.isUnsupported then v16.unsupportedText else v16.subheadingText, 
                textWrapped = true, 
                textXAlignment = Enum.TextXAlignment.Left, 
                fontStyle = v15.Semantic.Typography.CaptionBody, 
                colorStyle = v15.Semantic.Color.Text.Default
            })
        }), 
        HeadShapeList = if not not v14.isUnsupported or v14.isLoading then nil else v2.createElement(v8, {
            orientation = v14.orientation, 
            tileSize = v14.tileSize, 
            items = v18, 
            LayoutOrder = 3, 
            NextSelectionUp = v14.NextSelectionUp
        })
    });
end;