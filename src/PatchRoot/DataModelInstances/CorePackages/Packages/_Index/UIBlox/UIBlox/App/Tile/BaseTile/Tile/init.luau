local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.UIBloxConfig);
local v5 = require(l_Parent_3.RoactGamepad);
local v6 = require(l_Parent_3.React);
local v7 = require(l_Parent_3.Cryo);
local v8 = require(l_Parent_3.t);
local v9 = require(l_Parent_2.Core.Style.withStyle);
local v10 = require(l_Parent_2.Core.Style.Validator.validateFontInfo);
local v11 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v12 = require(l_Parent_2.Core.Text.GetTextSize);
local v13 = require(l_Parent_2.Core.Text.GetWrappedTextWithIcon);
local v14 = require(l_Parent_2.Core.Style.withTextSizeOffset);
local v15 = require(l_Parent_1.SelectionImage.CursorKind);
local v16 = require(l_Parent_1.SelectionImage.withSelectionCursorProvider);
local v17 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v18 = require(l_Parent_0.TileName);
local v19 = require(l_Parent_0.TileThumbnail);
local v20 = require(l_Parent_0.TileBanner);
local v21 = require(l_Parent_1.Text.StyledTextLabel);
local v22 = require(l_Parent_2.App.ImageSet.Images);
local v23 = require(l_Parent_2.Core.Control.Interactable);
local v24 = UDim.new(0, 10);
local v25 = v6.PureComponent:extend("Tile");
local v26 = v8.strictInterface({
    footer = v8.optional(v8.table), 
    name = v8.optional(v8.string), 
    nameTextColor = v8.optional(v8.Color3), 
    nameTextTransparency = v8.optional(v8.number), 
    nameOverThumbnail = v8.optional(v8.boolean), 
    titleRichText = v8.optional(v8.boolean), 
    subtitle = v8.optional(v8.string), 
    hasVerifiedBadge = v8.optional(v8.boolean), 
    titleTextLineCount = v8.optional(v8.integer), 
    innerPadding = v8.optional(v8.integer), 
    titleTopPadding = v8.optional(v8.integer), 
    subtitleTopPadding = v8.optional(v8.integer), 
    footerTopPadding = v8.optional(v8.integer), 
    onActivated = v8.optional(v8.callback), 
    thumbnail = v8.optional(v8.union(v8.string, v8.table)), 
    thumbnailSize = v8.optional(v8.UDim2), 
    thumbnailFrameSize = v8.optional(v8.UDim2), 
    thumbnailColor = v8.optional(v8.Color3), 
    thumbnailTransparency = v8.optional(v8.number), 
    thumbnailAspectRatio = v8.optional(v8.number), 
    thumbnailScaleType = v8.optional(v8.enum(Enum.ScaleType)), 
    bannerText = v8.optional(v8.string), 
    backgroundImage = v8.optional(v8.union(v8.string, v8.table)), 
    isSelected = v8.optional(v8.boolean), 
    Selectable = v8.optional(v8.boolean), 
    multiSelect = v8.optional(v8.boolean), 
    isDisabled = v8.optional(v8.boolean), 
    hasRoundedCorners = v8.optional(v8.boolean), 
    titleIcon = v8.optional(v8.table), 
    thumbnailOverlayComponents = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    thumbnailRef = v8.optional(v8.table), 
    textButtonRef = v8.optional(v8.table), 
    inputBindings = v8.optional(v8.table), 
    useMaxTitleHeight = v8.optional(v8.boolean), 
    addSubtitleSpace = v8.optional(v8.boolean), 
    titleFontStyle = v8.optional(v8.union(v10, v11)), 
    subtitleFontStyle = v8.optional(v8.union(v10, v11)), 
    renderTileInset = v8.optional(v8.callback), 
    [v6.Tag] = v8.optional(v8.string), 
    cursor = v8.optional(v8.any), 
    isCircular = v8.optional(v8.boolean), 
    horizontalAlignment = v8.optional(v8.EnumItem), 
    openTypeFeatures = v8.optional(v8.string), 
    onThumbnailLoaded = v8.optional(v8.callback)
});
v25.validateProps = v8.intersection(v26, function(v27) --[[ Line: 173 ]] --[[ Name: tileBannerUseValidator ]]
    if v27.bannerText and v27.footer then
        return false, "A custom footer and bannerText can't be used together";
    else
        return true;
    end;
end);
v25.defaultProps = {
    titleTextLineCount = 2, 
    innerPadding = 8, 
    titleTopPadding = 0, 
    subtitleTopPadding = 0, 
    footerTopPadding = 0, 
    isSelected = false, 
    multiSelect = false, 
    isDisabled = false, 
    hasRoundedCorners = true, 
    Selectable = false, 
    isCircular = false, 
    horizontalAlignment = nil, 
    thumbnailFrameSize = UDim2.new(1, 0, 1, 0), 
    titleRichText = false
};
v25.init = function(v28) --[[ Line: 200 ]] --[[ Name: init ]]
    v28.state = {
        tileWidth = 0, 
        tileHeight = 0
    };
    v28.onAbsoluteSizeChange = function(v29) --[[ Line: 206 ]]
        -- upvalues: v28 (copy)
        local l_X_0 = v29.AbsoluteSize.X;
        local l_Y_0 = v29.AbsoluteSize.Y;
        v28:setState({
            tileWidth = l_X_0, 
            tileHeight = l_Y_0
        });
    end;
end;
v25.render = function(v32) --[[ Line: 216 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v9 (copy), v16 (copy), v4 (copy), v22 (copy), v13 (copy), v12 (copy), v6 (copy), v5 (copy), v23 (copy), v15 (copy), v19 (copy), v24 (copy), v18 (copy), v21 (copy), v20 (copy)
    local l_footer_0 = v32.props.footer;
    local l_name_0 = v32.props.name;
    local l_subtitle_0 = v32.props.subtitle;
    local l_hasVerifiedBadge_0 = v32.props.hasVerifiedBadge;
    local l_titleTextLineCount_0 = v32.props.titleTextLineCount;
    local l_innerPadding_0 = v32.props.innerPadding;
    local l_titleTopPadding_0 = v32.props.titleTopPadding;
    local l_subtitleTopPadding_0 = v32.props.subtitleTopPadding;
    local l_footerTopPadding_0 = v32.props.footerTopPadding;
    local l_onActivated_0 = v32.props.onActivated;
    local l_thumbnail_0 = v32.props.thumbnail;
    local l_thumbnailSize_0 = v32.props.thumbnailSize;
    local l_thumbnailFrameSize_0 = v32.props.thumbnailFrameSize;
    local l_thumbnailColor_0 = v32.props.thumbnailColor;
    local l_thumbnailTransparency_0 = v32.props.thumbnailTransparency;
    local l_bannerText_0 = v32.props.bannerText;
    local l_hasRoundedCorners_0 = v32.props.hasRoundedCorners;
    local l_isSelected_0 = v32.props.isSelected;
    local l_multiSelect_0 = v32.props.multiSelect;
    local l_isDisabled_0 = v32.props.isDisabled;
    local l_titleIcon_0 = v32.props.titleIcon;
    local l_thumbnailOverlayComponents_0 = v32.props.thumbnailOverlayComponents;
    local l_backgroundImage_0 = v32.props.backgroundImage;
    local l_useMaxTitleHeight_0 = v32.props.useMaxTitleHeight;
    local l_addSubtitleSpace_0 = v32.props.addSubtitleSpace;
    local l_horizontalAlignment_0 = v32.props.horizontalAlignment;
    return v14(function(v59) --[[ Line: 244 ]]
        -- upvalues: v9 (ref), v16 (ref), v32 (copy), l_titleTextLineCount_0 (copy), v4 (ref), l_innerPadding_0 (copy), l_titleTopPadding_0 (copy), l_addSubtitleSpace_0 (copy), l_useMaxTitleHeight_0 (copy), l_name_0 (copy), l_titleIcon_0 (copy), v22 (ref), v13 (ref), v12 (ref), l_subtitle_0 (copy), l_footer_0 (copy), l_bannerText_0 (copy), v6 (ref), l_isDisabled_0 (copy), l_onActivated_0 (copy), v5 (ref), v23 (ref), v15 (ref), l_horizontalAlignment_0 (copy), l_thumbnailFrameSize_0 (copy), v19 (ref), l_thumbnail_0 (copy), l_hasRoundedCorners_0 (copy), v24 (ref), l_isSelected_0 (copy), l_multiSelect_0 (copy), l_thumbnailOverlayComponents_0 (copy), l_thumbnailSize_0 (copy), l_thumbnailColor_0 (copy), l_thumbnailTransparency_0 (copy), l_backgroundImage_0 (copy), l_subtitleTopPadding_0 (copy), v18 (ref), l_hasVerifiedBadge_0 (copy), v21 (ref), l_footerTopPadding_0 (copy), v20 (ref)
        return v9(function(v60) --[[ Line: 245 ]]
            -- upvalues: v16 (ref), v32 (ref), l_titleTextLineCount_0 (ref), v59 (copy), v4 (ref), l_innerPadding_0 (ref), l_titleTopPadding_0 (ref), l_addSubtitleSpace_0 (ref), l_useMaxTitleHeight_0 (ref), l_name_0 (ref), l_titleIcon_0 (ref), v22 (ref), v13 (ref), v12 (ref), l_subtitle_0 (ref), l_footer_0 (ref), l_bannerText_0 (ref), v6 (ref), l_isDisabled_0 (ref), l_onActivated_0 (ref), v5 (ref), v23 (ref), v15 (ref), l_horizontalAlignment_0 (ref), l_thumbnailFrameSize_0 (ref), v19 (ref), l_thumbnail_0 (ref), l_hasRoundedCorners_0 (ref), v24 (ref), l_isSelected_0 (ref), l_multiSelect_0 (ref), l_thumbnailOverlayComponents_0 (ref), l_thumbnailSize_0 (ref), l_thumbnailColor_0 (ref), l_thumbnailTransparency_0 (ref), l_backgroundImage_0 (ref), l_subtitleTopPadding_0 (ref), v18 (ref), l_hasVerifiedBadge_0 (ref), v21 (ref), l_footerTopPadding_0 (ref), v20 (ref)
            return v16(function(v61) --[[ Line: 246 ]]
                -- upvalues: v60 (copy), v32 (ref), l_titleTextLineCount_0 (ref), v59 (ref), v4 (ref), l_innerPadding_0 (ref), l_titleTopPadding_0 (ref), l_addSubtitleSpace_0 (ref), l_useMaxTitleHeight_0 (ref), l_name_0 (ref), l_titleIcon_0 (ref), v22 (ref), v13 (ref), v12 (ref), l_subtitle_0 (ref), l_footer_0 (ref), l_bannerText_0 (ref), v6 (ref), l_isDisabled_0 (ref), l_onActivated_0 (ref), v5 (ref), v23 (ref), v15 (ref), l_horizontalAlignment_0 (ref), l_thumbnailFrameSize_0 (ref), v19 (ref), l_thumbnail_0 (ref), l_hasRoundedCorners_0 (ref), v24 (ref), l_isSelected_0 (ref), l_multiSelect_0 (ref), l_thumbnailOverlayComponents_0 (ref), l_thumbnailSize_0 (ref), l_thumbnailColor_0 (ref), l_thumbnailTransparency_0 (ref), l_backgroundImage_0 (ref), l_subtitleTopPadding_0 (ref), v18 (ref), l_hasVerifiedBadge_0 (ref), v21 (ref), l_footerTopPadding_0 (ref), v20 (ref)
                local l_Font_0 = v60.Font;
                local l_Theme_0 = v60.Theme;
                local l_tileHeight_0 = v32.state.tileHeight;
                local l_tileWidth_0 = v32.state.tileWidth;
                local v66 = v32.props.titleFontStyle or l_Font_0.Header2;
                local l_titleRichText_0 = v32.props.titleRichText;
                local v68 = v32.props.subtitleFontStyle or l_Font_0.CaptionHeader;
                local v69 = if v66.RelativeSize then l_Font_0.BaseSize * v66.RelativeSize else v66.FontSize;
                local v70 = if v68.RelativeSize then l_Font_0.BaseSize * v68.RelativeSize else v68.FontSize;
                local v71 = math.ceil(v69 * l_titleTextLineCount_0);
                local v72 = v69 + v59;
                if v4.refactorTileTextHeights then
                    v71 = math.ceil(v72 * l_titleTextLineCount_0);
                end;
                local v73 = l_tileHeight_0 - l_tileWidth_0 / (v32.props.thumbnailAspectRatio or 1) - l_innerPadding_0 - v71 - l_innerPadding_0 - l_titleTopPadding_0;
                local v74 = Vector2.new(0, 0);
                local v75 = 0;
                if l_addSubtitleSpace_0 then
                    v74 = Vector2.new(0, v71);
                    v75 = if v4.refactorTileTextHeights then math.ceil(v70) + v59 else math.ceil(v70);
                    v73 = v73 - v75;
                else
                    if l_useMaxTitleHeight_0 then
                        v74 = Vector2.new(0, v71);
                    else
                        local v76 = l_name_0 or "";
                        local l_Font_1 = v66.Font;
                        if l_titleIcon_0 then
                            local v78 = l_titleIcon_0.ImageRectSize.X / v22.ImagesResolutionScale;
                            v76 = v13(v76, v69, l_Font_1, v78, 4);
                        end;
                        v74 = v12(v76, v69, l_Font_1, Vector2.new(l_tileWidth_0, v71));
                        if v4.refactorTileTextHeights then
                            v74 = Vector2.new(v74.X, (math.min(v74.Y, v71)));
                        end;
                    end;
                    if l_subtitle_0 ~= nil and l_subtitle_0 ~= "" then
                        v75 = if v4.refactorTileTextHeights then math.ceil(v70) + v59 else math.ceil(v70);
                        v73 = v73 - v75;
                    end;
                end;
                v73 = math.max(0, v73);
                local v79 = true;
                if l_footer_0 == nil then
                    v79 = l_bannerText_0 ~= nil;
                end;
                local l_renderTileInset_0 = v32.props.renderTileInset;
                local v81 = UDim2.new(1, 0, 0, v74.Y + v75 + l_titleTopPadding_0);
                local v82 = nil;
                if v32.props.nameOverThumbnail then
                    v81 = UDim2.new(0, l_tileWidth_0 - 10, 0, -(v74.Y + 20));
                    v82 = v6.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 10)
                    });
                end;
                local v83 = v32.props.inputBindings or not l_isDisabled_0 and l_onActivated_0 and {
                    Activate = v5.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
                } or nil;
                local l_createElement_0 = v6.createElement;
                local v85 = if v4.useInteractableWithTileAndCell then v23 else "TextButton";
                local v86 = {
                    Text = if v4.useInteractableWithTileAndCell then nil else "", 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Selectable = v32.props.Selectable, 
                    [v6.Event.Activated] = if l_isDisabled_0 then nil else l_onActivated_0, 
                    [v6.Change.AbsoluteSize] = v32.onAbsoluteSizeChange, 
                    ref = v32.props.textButtonRef, 
                    SelectionImageObject = if v32.props.cursor then v32.props.cursor else v61(v15.RoundedRect)
                };
                local v87 = {
                    UIListLayout = v6.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_innerPadding_0), 
                        HorizontalAlignment = if not v32.props.nameOverThumbnail then l_horizontalAlignment_0 else nil
                    }), 
                    Thumbnail = v6.createElement(v5.Focusable.Frame, {
                        Size = l_thumbnailFrameSize_0, 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        NextSelectionLeft = v32.props.NextSelectionLeft, 
                        NextSelectionRight = v32.props.NextSelectionRight, 
                        NextSelectionUp = v32.props.NextSelectionUp, 
                        NextSelectionDown = v32.props.NextSelectionDown, 
                        ref = v32.props.thumbnailRef, 
                        [v6.Tag] = v32.props[v6.Tag], 
                        SelectionImageObject = if v32.props.cursor then v32.props.cursor else v61(v15.RoundedRectNoInset), 
                        inputBindings = v83
                    }, {
                        Image = v6.createElement(v19, {
                            Image = l_thumbnail_0, 
                            hasRoundedCorners = l_hasRoundedCorners_0, 
                            cornerRadius = if v32.props.isCircular then UDim.new(0.5, 0) else if v4.useNewSelectionCursor then v24 else nil, 
                            isSelected = l_isSelected_0, 
                            multiSelect = l_multiSelect_0, 
                            overlayComponents = l_thumbnailOverlayComponents_0, 
                            imageSize = l_thumbnailSize_0, 
                            imageColor = l_thumbnailColor_0, 
                            imageTransparency = l_thumbnailTransparency_0, 
                            backgroundImage = l_backgroundImage_0, 
                            scaleType = v32.props.thumbnailScaleType, 
                            onThumbnailLoaded = v32.props.onThumbnailLoaded
                        }), 
                        TileInset = l_renderTileInset_0 and l_renderTileInset_0() or nil, 
                        UIAspectRatioConstraint = if v32.props.thumbnailAspectRatio ~= nil then v6.createElement("UIAspectRatioConstraint", {
                            AspectRatio = v32.props.thumbnailAspectRatio, 
                            AspectType = Enum.AspectType.ScaleWithParentSize
                        }) else nil
                    })
                };
                local l_createElement_1 = v6.createElement;
                local v89 = "Frame";
                local v90 = {
                    Size = v81, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                };
                local v91 = {
                    TitleTopPadding = v6.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_titleTopPadding_0)
                    }), 
                    UIListLayout = v6.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_subtitleTopPadding_0), 
                        HorizontalAlignment = l_horizontalAlignment_0
                    }), 
                    NameOverThumbnailPadding = v82
                };
                local v92 = false;
                if l_titleTextLineCount_0 > 0 then
                    v92 = false;
                    if l_tileWidth_0 > 0 then
                        v92 = v6.createElement(v18, {
                            titleIcon = l_titleIcon_0, 
                            name = l_name_0, 
                            nameTextColor = v32.props.nameTextColor, 
                            nameTextTransparency = v32.props.nameTextTransparency, 
                            hasVerifiedBadge = l_hasVerifiedBadge_0, 
                            maxHeight = v71, 
                            maxWidth = l_tileWidth_0, 
                            LayoutOrder = 1, 
                            useMaxHeight = l_useMaxTitleHeight_0, 
                            titleFontStyle = v66, 
                            richText = l_titleRichText_0, 
                            horizontalAlignment = if v4.imageTextLabelTextXAlignment then l_horizontalAlignment_0 else nil
                        });
                    end;
                end;
                v91.Name = v92;
                v92 = false;
                if l_subtitle_0 ~= "" then
                    v92 = false;
                    if l_subtitle_0 ~= nil then
                        v92 = v6.createElement(v21, {
                            size = UDim2.new(0, 0, 0, v75), 
                            automaticSize = Enum.AutomaticSize.X, 
                            text = l_subtitle_0, 
                            colorStyle = l_Theme_0.TextDefault, 
                            fontStyle = v68, 
                            openTypeFeatures = v32.props.openTypeFeatures, 
                            layoutOrder = 2, 
                            fluidSizing = false, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            richText = false, 
                            lineHeight = 1
                        });
                    end;
                end;
                v91.Subtitle = v92;
                v87.TitleArea = l_createElement_1(v89, v90, v91);
                v87.FooterContainer = v79 and v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v73), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    FooterTopPadding = v6.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_footerTopPadding_0)
                    }), 
                    Banner = l_bannerText_0 and v6.createElement(v20, {
                        bannerText = l_bannerText_0
                    }), 
                    Footer = not l_bannerText_0 and l_footer_0
                });
                return l_createElement_0(v85, v86, v87);
            end);
        end);
    end);
end;
local function v96(v93) --[[ Line: 472 ]]
    -- upvalues: v17 (copy), v24 (copy), v7 (copy), v6 (copy), v25 (copy)
    local v94 = v17(v24);
    local v95 = v7.Dictionary.join({
        cursor = v94
    }, v93);
    return v6.createElement(v25, v95);
end;
return v6.forwardRef(function(v97, v98) --[[ Line: 480 ]]
    -- upvalues: v6 (copy), v4 (copy), v96 (copy), v25 (copy), v7 (copy)
    return v6.createElement(if v4.useNewSelectionCursor then v96 else v25, v7.Dictionary.join(v97, {
        thumbnailRef = v98
    }));
end);