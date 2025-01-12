local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_3.Core;
local l_Parent_4 = l_Parent_3.Parent;
local v6 = require(l_Parent_4.Cryo);
local v7 = require(l_Parent_4.React);
local v8 = require(l_Parent_4.Roact);
local v9 = require(l_Parent_3.Utility.getControlStateColor);
local v10 = require(l_Parent_3.Utility.setDefault);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Control.useControlState);
local _ = require(l_Parent_2.Style.StyleTypes);
local _ = require(l_Parent_2.Style.Fonts);
local v16 = require(l_Parent_2.SelectionImage.useSelectionCursor);
local v17 = require(l_Parent_2.SelectionImage.CursorKind);
local v18 = require(l_Parent_2.SelectionCursor.useCursor);
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.ExperienceActionRow);
local v21 = require(l_Parent_0.Enum.AspectRatioMode);
local v22 = require(l_Parent_0.getAspectRatio);
local v23 = require(l_Parent_1.VerticalTile.VerticalTile);
local v24 = require(l_Parent_1.TileContentPanel);
local v25 = require(l_Parent_1.VerticalTile.VerticalTileThumbnail);
local v26 = require(l_Parent_3.UIBloxConfig);
local function v31(v27, v28, v29, v30) --[[ Line: 85 ]] --[[ Name: renderContentWithPadding ]]
    -- upvalues: v7 (copy), v6 (copy), v8 (copy)
    return v7.createElement(v27, v6.Dictionary.join({
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v29), {
        Padding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v28.Left), 
            PaddingRight = UDim.new(0, v28.Right), 
            PaddingTop = UDim.new(0, v28.Top), 
            PaddingBottom = UDim.new(0, v28.Bottom)
        }), 
        Content = v8.createFragment(v30)
    });
end;
local function _(v32, v33) --[[ Line: 109 ]] --[[ Name: getFinalAspectRatioMode ]]
    -- upvalues: v21 (copy)
    if v32 ~= nil then
        if v33 then
            return v21.Wide;
        else
            return v32;
        end;
    elseif v33 then
        return v21.Wide;
    else
        return v21.Square;
    end;
end;
return function(v35) --[[ Line: 125 ]] --[[ Name: ExperienceTileV3 ]]
    -- upvalues: v11 (copy), v10 (copy), v19 (copy), v6 (copy), v7 (copy), v21 (copy), v22 (copy), v31 (copy), v25 (copy), v8 (copy), v24 (copy), v20 (copy), v13 (copy), v26 (copy), v18 (copy), v16 (copy), v17 (copy), v9 (copy), v12 (copy), v23 (copy)
    local v36 = v11();
    local v37 = v10(v35.footerHeight, v19.DEFAULT_FOOTER_HEIGHT);
    local v38 = v10(v35.isHoverEnabled, false);
    local v39 = v10(v35.hasBackground, true);
    local v40 = v19.getDefaultStyleProps(v36);
    local v41 = v6.Dictionary.join(v40, v35.styleProps or {});
    local l_backgroundColor_0 = v41.backgroundColor;
    local l_border_0 = v41.border;
    local l_dropShadow_0 = v41.dropShadow;
    local l_topContentPadding_0 = v41.topContentPadding;
    local l_bottomContentPadding_0 = v41.bottomContentPadding;
    local l_overlayColors_0 = v41.overlayColors;
    local l_selectionCursorPadding_0 = v41.selectionCursorPadding;
    local l_contentTitlePadding_0 = v41.contentTitlePadding;
    local l_contentTitleFont_0 = v41.contentTitleFont;
    local v51 = v10(v35.contentTextLineCount, v19.DEFAULT_TEXT_LINE_COUNT);
    local v56 = v7.useCallback(function(v52) --[[ Line: 143 ]]
        -- upvalues: v36 (copy), v35 (copy), v21 (ref), v22 (ref), v31 (ref), l_topContentPadding_0 (copy), v7 (ref), v25 (ref), l_border_0 (copy), v39 (copy), v8 (ref)
        v52 = v52 and not v36.Settings.ReducedMotion;
        local l_thumbnailAspectRatioOverride_0 = v35.thumbnailAspectRatioOverride;
        local l_v52_0 = v52;
        local v55 = if l_thumbnailAspectRatioOverride_0 ~= nil then if l_v52_0 then v21.Wide else l_thumbnailAspectRatioOverride_0 else if l_v52_0 then v21.Wide else v21.Square;
        l_thumbnailAspectRatioOverride_0 = v22(v55);
        l_v52_0 = if v55 == v21.Wide then v35.wideThumbnail else v35.thumbnail;
        return v31("Frame", l_topContentPadding_0, {
            Size = UDim2.new(1, 0, l_thumbnailAspectRatioOverride_0, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            ZIndex = 3
        }, {
            Thumbnail = v7.createElement(v25, {
                aspectRatio = l_thumbnailAspectRatioOverride_0, 
                border = l_border_0, 
                isTopRounded = true, 
                isBottomRounded = not v39, 
                thumbnail = l_v52_0
            }), 
            TopContentOverlay = if v35.renderTopContentOverlay ~= nil then v8.createFragment((v35.renderTopContentOverlay(v52, l_border_0))) else nil
        });
    end, {
        v35.renderTopContentOverlay, 
        v35.wideThumbnail, 
        v35.thumbnail, 
        v35.thumbnailAspectRatioOverride, 
        l_topContentPadding_0, 
        l_border_0, 
        v39
    });
    local v59 = v7.useCallback(function(v57) --[[ Line: 177 ]]
        -- upvalues: v51 (copy), l_contentTitleFont_0 (copy), v36 (copy), l_contentTitlePadding_0 (copy), v37 (copy), l_bottomContentPadding_0 (copy), v35 (copy), v31 (ref), l_border_0 (copy), v7 (ref), v24 (ref)
        local v58 = math.floor(v51 * l_contentTitleFont_0.RelativeSize * v36.Font.BaseSize + l_contentTitlePadding_0) + v37 + l_bottomContentPadding_0.Top + l_bottomContentPadding_0.Bottom;
        if v35.renderBottomContent ~= nil then
            return v31("Frame", l_bottomContentPadding_0, {
                Size = UDim2.new(1, 0, 0, v58)
            }, {
                BottomContent = v35.renderBottomContent(v57, l_border_0)
            });
        else
            return v7.createElement(v24, {
                contentTitle = v35.experienceName, 
                panelHeight = UDim.new(0, v58), 
                outerPadding = l_bottomContentPadding_0, 
                footerHeight = UDim.new(0, v37), 
                textLineCount = v51, 
                titleFont = l_contentTitleFont_0, 
                titlePadding = l_contentTitlePadding_0, 
                contentFooter = if v57 then v35.footer else nil, 
                hasSidePadding = true
            });
        end;
    end, {
        v35.experienceName, 
        v35.renderBottomContent, 
        v35.footer, 
        v51, 
        l_contentTitlePadding_0, 
        l_bottomContentPadding_0, 
        v37, 
        l_contentTitleFont_0, 
        l_border_0, 
        v36
    });
    local v62 = v7.useCallback(function(v60) --[[ Line: 216 ]]
        -- upvalues: v35 (copy), v7 (ref), v20 (ref), v37 (copy), l_bottomContentPadding_0 (copy), v31 (ref)
        if v35.renderBottomContent ~= nil then
            return nil;
        elseif v60 then
            if v35.renderActionRow ~= nil then
                return v35.renderActionRow();
            else
                return v7.createElement(v20, v35.actionRowProps);
            end;
        else
            local v61 = v37 + l_bottomContentPadding_0.Top + l_bottomContentPadding_0.Bottom;
            return v31("Frame", l_bottomContentPadding_0, {
                Size = UDim2.new(1, 0, 0, v61), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1)
            }, {
                FooterContent = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Footer = v35.footer
                })
            });
        end;
    end, {
        v35.footer, 
        v35.actionRowProps, 
        v35.renderBottomContent, 
        v35.renderActionRow, 
        l_bottomContentPadding_0, 
        v37
    });
    local v63, v64 = v13();
    local v65 = if v26.useNewSelectionCursor then v18(l_border_0.CornerRadius) else v16(v17.RoundedRect);
    local v66 = v9(v63, l_overlayColors_0);
    local v67 = nil;
    local v68 = nil;
    if v66 ~= nil then
        v67 = v66.Color;
        v68 = v66.Transparency;
    else
        v67 = nil;
        v68 = 1;
    end;
    return v31(v12, l_selectionCursorPadding_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        SelectionImageObject = v65, 
        onStateChanged = v64, 
        isDisabled = v35.isDisabled, 
        [v7.Event.Activated] = v35.onActivated, 
        [v7.Event.SelectionGained] = v35.onSelectionGained, 
        [v7.Event.SelectionLost] = v35.onSelectionLost
    }, {
        VerticalTile = v7.createElement(v23, {
            hasBackground = v39, 
            hasOutline = v10(v35.hasOutline, true), 
            isHoverEnabled = v38, 
            hoverDelay = v35.hoverDelay, 
            onHoverChanged = v35.onHoverChanged, 
            isOverlayVisible = false, 
            isActive = false, 
            renderTopContent = v56, 
            renderBottomContent = v59, 
            renderFooterRow = v62, 
            reservedBottomHeight = 0, 
            backgroundColor = l_backgroundColor_0, 
            border = l_border_0, 
            dropShadow = l_dropShadow_0
        }), 
        OverlayColor = v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v67, 
            ZIndex = 10, 
            BackgroundTransparency = v68
        }, {
            Corner = v7.createElement("UICorner", {
                CornerRadius = l_border_0.CornerRadius
            })
        })
    });
end;