local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local v9 = require(l_script_FirstAncestor_0.Footer.RightAlignedButtonWrapper);
local v10 = require(l_script_FirstAncestor_0.ZoomAnimatedFrame);
local v11 = require(l_script_FirstAncestor_0.GameTileViewConfig);
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local l_game_EngineFeature_0 = game:GetEngineFeature("TextTruncateSplitWord");
return function(v15) --[[ Line: 69 ]] --[[ Name: GameTileView ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), v11 (copy), l_useCursor_0 (copy), v2 (copy), v10 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), l_LoadableImage_0 (copy), v9 (copy), l_game_EngineFeature_0 (copy)
    local v16 = l_useDesignTokens_0();
    local v17 = if l_FFlagLuaAppMigrateGameTile_0 then v15.numLinesForTitle or 1 else nil;
    local l_textSizeOffset_0 = v15.textSizeOffset;
    local v19 = v11.getElementSizes(v16, l_textSizeOffset_0, if l_FFlagLuaAppMigrateGameTile_0 then v17 else nil);
    local l_Space_100_0 = v16.Global.Space_100;
    local v21 = UDim.new(0, l_Space_100_0);
    local v22 = l_useCursor_0(v21);
    local l_Subheader_0 = v16.Semantic.Typography.Subheader;
    local l_FontSize_0 = l_Subheader_0.FontSize;
    local l_Emphasis_0 = v16.Semantic.Color.Text.Emphasis;
    local l_Space_50_0 = v16.Global.Space_50;
    local v27 = if l_FFlagLuaAppMigrateGameTile_0 then v15.hoverPadding or v16.Global.Space_150 else v16.Global.Space_150;
    local v28 = v15.hidePlayButton and 0 or v19.playButtonHeight;
    local v29 = nil;
    v29 = if l_FFlagLuaAppMigrateGameTile_0 then if v15.isContained then v15.containmentSidePadding or v16.Global.Space_150 else 0 else if v15.isContained then v16.Global.Space_150 else 0;
    local v30 = (not not v15.hidePlayButton or l_FFlagLuaAppMigrateGameTile_0 and v15.isContained) and 0 or v16.Global.Space_150;
    local l_isHovered_0 = v15.isHovered;
    local v32 = UDim.new(1, -(l_FFlagLuaAppMigrateGameTile_0 and 0 or v16.Global.Space_150 + v29));
    local v33 = v15.Size or UDim2.fromScale(1, 1);
    if l_isHovered_0 then
        v33 = v33 + UDim2.fromOffset(v27 * 2, v27 * 2);
    end;
    local v34 = v11.getFooterHeight(v16, v15.isContained, v15.footerMetadata == nil, v15.title == nil, l_textSizeOffset_0, v15.extraFooterSpace, if l_FFlagLuaAppMigrateGameTile_0 then v17 else nil);
    local v35 = if not not v15.title or v15.footerMetadata then v19.footerTopPadding else 0;
    local v36 = if v15.title and v15.footerMetadata then v19.paddingAboveMetadata else 0;
    local v37 = if v15.title then v19.titleHeight else 0;
    return v2.createElement(v10, {
        isZoomEnabled = l_isHovered_0, 
        expansionOffsetX = l_Space_50_0 * 2, 
        expansionOffsetTop = l_Space_50_0, 
        expansionOffsetBottom = if l_FFlagLuaAppMigrateGameTile_0 then v28 + v30 + (v15.hidePlayButton and 0 or l_Space_50_0) / (v15.imageAspectRatio or 1) + 1 else v28 + v30, 
        reducedMotion = v15.reducedMotion
    }, {
        HoverShadow = l_isHovered_0 and v2.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, v27 + 18, 1, v27 + 20), 
            Image = l_Images_0["component_assets/dropshadow_56_8"], 
            ImageColor3 = v16.Semantic.Color.Common.DropShadow.Color3, 
            ImageTransparency = v16.Semantic.Color.Common.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(35, 35, 37, 37), 
            ZIndex = -1
        }) or nil, 
        GameTileContent = v2.createElement("TextButton", {
            ref = v15.forwardRef, 
            Size = v33, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            SelectionImageObject = v22, 
            Active = not v15.isDisabled, 
            [v2.Change.GuiState] = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v15.onGuiStateChanged else nil, 
            [v2.Event.Activated] = v15.onActivated, 
            [v2.Event.SelectionGained] = v15.onSelectionGained, 
            [v2.Event.SelectionLost] = v15.onSelectionLost, 
            ClipsDescendants = false, 
            Text = "", 
            BackgroundTransparency = l_isHovered_0 and v16.Semantic.Color.BackgroundUi.Default.Transparency or 1, 
            BackgroundColor3 = v16.Semantic.Color.BackgroundUi.Default.Color3, 
            AutoButtonColor = false
        }, {
            UIPadding = l_isHovered_0 and v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v27), 
                PaddingTop = UDim.new(0, v27), 
                PaddingRight = UDim.new(0, v27), 
                PaddingBottom = UDim.new(0, v27)
            }) or nil, 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v21 + UDim.new(0, v27)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ImageFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 1, 
                ZIndex = -1
            }, {
                Thumbnail = v2.createElement(l_LoadableImage_0, {
                    BackgroundTransparency = 1, 
                    Image = v15.image, 
                    Size = UDim2.new(1, 0, 1, if v15.isContained then l_Space_100_0 else 0), 
                    cornerRadius = v21, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true, 
                    ZIndex = -2, 
                    ScaleType = if v15.isContained then Enum.ScaleType.Tile else nil, 
                    TileSize = if v15.isContained then UDim2.new(1, 0, 1, -l_Space_100_0) else nil
                }), 
                ContainedBackgroundTop = if v15.isContained then v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v34 - l_Space_100_0), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    ZIndex = -1, 
                    BackgroundColor3 = v16.Semantic.Color.BackgroundUi.Default.Color3, 
                    BorderSizePixel = 0
                }) else nil, 
                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v15.imageAspectRatio or 1
                }), 
                ThumbnailOverlay = v15.thumbnailOverlay
            }), 
            BottomContent = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v34), 
                LayoutOrder = 2, 
                BackgroundTransparency = v15.isContained and 0 or 1, 
                BackgroundColor3 = v16.Semantic.Color.BackgroundUi.Default.Color3, 
                BorderSizePixel = 0
            }, {
                UICorner = if v15.isContained then v2.createElement("UICorner", {
                    CornerRadius = v21
                }) else nil, 
                TextWrapper = v2.createElement(v9, {
                    Button = v15.rightCornerButton, 
                    Padding = UDim.new(0, v15.isContained and 0 or v16.Global.Space_150), 
                    Content = v2.createElement(v2.Fragment, nil, {
                        Title = v15.title and v2.createElement("TextLabel", {
                            Position = UDim2.new(0, v29, 0, v35), 
                            Size = UDim2.new(1, -2 * v29, 0, v37), 
                            BackgroundTransparency = 1, 
                            Text = v15.title, 
                            Font = l_Subheader_0.Font, 
                            TextSize = l_FontSize_0, 
                            TextTransparency = l_Emphasis_0.Transparency, 
                            TextColor3 = l_Emphasis_0.Color3, 
                            TextWrapped = if l_FFlagLuaAppMigrateGameTile_0 then v17 > 1 else false, 
                            TextTruncate = if l_game_EngineFeature_0 then Enum.TextTruncate.SplitWord else Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = if l_FFlagLuaAppMigrateGameTile_0 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
                            LayoutOrder = 3
                        }) or nil, 
                        Metadata = v15.footerMetadata and v2.createElement("Frame", {
                            Position = UDim2.new(0, v29, 0, v37 + v35 + v36), 
                            Size = UDim2.new(v32, UDim.new(0, v19.metadataHeight)), 
                            ClipsDescendants = false, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 5
                        }, {
                            MetadataContent = v15.footerMetadata
                        }), 
                        ExtraContent = v15.extraFooterContent and v15.extraFooterSpace and v2.createElement("Frame", {
                            Size = UDim2.new(1, -v29 * 2, 0, v15.extraFooterSpace), 
                            Position = UDim2.new(0, v29, 0, v37 + v35 + v36 + v19.metadataHeight), 
                            BackgroundTransparency = 1
                        }, {
                            v15.extraFooterContent
                        })
                    })
                })
            }) or nil, 
            PaddingAboveActionRow = l_isHovered_0 and v2.createElement("Frame", {
                LayoutOrder = 6, 
                Size = UDim2.fromOffset(0, v30), 
                BackgroundTransparency = 1
            }) or nil, 
            ActionRow = l_isHovered_0 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v28), 
                BackgroundTransparency = 1, 
                LayoutOrder = 7
            }, {
                Content = v15.hoverActionRow
            }) or nil
        })
    });
end;