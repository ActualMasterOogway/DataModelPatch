local l_script_FirstAncestor_0 = script:FindFirstAncestor("UIBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v6 = require(l_script_FirstAncestor_0.App.SelectionImage.useSelectionCursor);
local v7 = require(l_script_FirstAncestor_0.Core.Style.useStyle);
local _ = require(l_script_FirstAncestor_0.App.Style.StyleTypes);
local v9 = require(l_script_FirstAncestor_0.App.SelectionCursor.useCursor);
local v10 = require(l_script_FirstAncestor_0.App.SelectionImage.CursorKind);
local v11 = require(l_script_FirstAncestor_0.UIBloxConfig);
local v12 = require(script.Parent.Constants);
local v13 = {
    titleText = "Media", 
    numItemsShown = 4, 
    itemAspectRatio = 1.7777777777777777, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 6.666666666666667
    }, 
    onActivated = function() --[[ Line: 26 ]] --[[ Name: onActivated ]]

    end, 
    onSelectionGained = function() --[[ Line: 27 ]] --[[ Name: onSelectionGained ]]

    end, 
    exitFullscreen = function() --[[ Line: 28 ]] --[[ Name: exitFullscreen ]]

    end
};
return function(v14) --[[ Line: 69 ]] --[[ Name: MediaGalleryExpandableView ]]
    -- upvalues: v4 (copy), v13 (copy), v7 (copy), v12 (copy), v3 (copy), v2 (copy), v11 (copy), v9 (copy), v6 (copy), v10 (copy), v5 (copy)
    local v15 = v4.Dictionary.join(v13, v14);
    local v16 = v7();
    local v17 = v12.getDefaultStyleProps(v16);
    local v18 = v4.Dictionary.join(v17, v15.styleProps or {});
    local l_borderRadius_0 = v18.borderRadius;
    local l_gutter_0 = v18.gutter;
    local l_contentGap_0 = v18.contentGap;
    local l_titleFont_0 = v18.titleFont;
    local l_titleTextColor_0 = v18.titleTextColor;
    local v24, v25 = v3.useAnimatedBinding(0);
    local v26, v27 = v2.useState(Vector2.zero);
    local v34 = v2.useCallback(function(v28, _, _, _) --[[ Line: 84 ]]
        -- upvalues: l_gutter_0 (copy), v15 (copy), v27 (copy)
        local v32 = l_gutter_0 * (v15.numItemsShown - 1);
        local v33 = (v28.AbsoluteSize.X - v32) / v15.numItemsShown;
        v27(Vector2.new(v33, v33 / v15.itemAspectRatio));
    end, {
        l_gutter_0, 
        v15.itemAspectRatio, 
        v15.numItemsShown
    });
    local v44 = v2.useCallback(function(v35, _, v37, v38) --[[ Line: 96 ]]
        -- upvalues: v25 (copy), v3 (ref), v15 (copy)
        if not v35 then
            return nil;
        else
            local v39 = false;
            if v38 ~= nil then
                v39 = v38:isDescendantOf(v35);
            end;
            local v40 = false;
            if v37 ~= nil then
                v40 = v37:IsDescendantOf(v35);
            end;
            local v41 = v39 and not v40;
            local v42 = not v39 and v40;
            if v41 then
                v25(v3.spring(v15.expandableAreaHeightOffset, v15.animationConfig));
                v15.mediaGalleryGainFocused(true);
                return nil;
            elseif v42 then
                local v43 = false;
                if v38 ~= nil then
                    v43 = v38.AbsolutePosition.Y > v37.AbsolutePosition.Y;
                end;
                if not v43 then
                    v25(v3.spring(0, v15.animationConfig));
                end;
                v15.exitFullscreen();
                v15.mediaGalleryGainFocused(false);
                return nil;
            else
                return nil;
            end;
        end;
    end, {
        v15.expandableAreaHeightOffset, 
        v15.animationConfig, 
        v15.exitFullscreen, 
        v15.mediaGalleryGainFocused
    });
    local v45 = if v11.useNewSelectionCursor then v9(l_borderRadius_0) else nil;
    local v46 = if v11.useNewSelectionCursor then v6(v10.Invisible) else nil;
    local v47 = if v11.useNewSelectionCursor then if v15.showCursor then v45 else v46 else v6(v15.selectionCursor);
    local v51 = v2.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v15 (copy), v2 (ref), v26 (copy), v47 (copy), l_borderRadius_0 (copy)
        local v48 = {};
        for v49, v50 in v15.items do
            v48["Item" .. v49] = v2.createElement("ImageButton", {
                LayoutOrder = v49, 
                Size = UDim2.fromOffset(v26.X, v26.Y), 
                Image = v50.imageId, 
                ScaleType = Enum.ScaleType.Crop, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                SelectionImageObject = v47, 
                [v2.Event.Activated] = function() --[[ Line: 159 ]]
                    -- upvalues: v15 (ref), v49 (copy)
                    v15.onActivated(v49);
                end, 
                [v2.Event.SelectionGained] = function() --[[ Line: 162 ]]
                    -- upvalues: v15 (ref), v49 (copy)
                    v15.onSelectionGained(v49);
                end
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = l_borderRadius_0
                })
            });
        end;
        return v48;
    end, {
        v26, 
        v15.items, 
        v15.onActivated, 
        v15.onSelectionGained, 
        v47, 
        l_borderRadius_0
    });
    local v52 = if l_titleFont_0.RelativeSize then l_titleFont_0.RelativeSize * v16.Font.BaseSize else l_titleFont_0.FontSize;
    return v2.createElement("CanvasGroup", {
        GroupTransparency = v15.groupTransparency, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_contentGap_0)
        }), 
        ExpandableArea = v2.createElement("Frame", {
            Size = v24:map(function(v53) --[[ Line: 195 ]]
                return UDim2.new(1, 0, 0, v53);
            end), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        Title = v2.createElement(v5, {
            Size = UDim2.new(1, 0, 0, v52), 
            Text = v15.titleText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            colorStyle = l_titleTextColor_0, 
            fontStyle = l_titleFont_0, 
            LayoutOrder = 2
        }), 
        MediaGallery = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v26.Y), 
            BackgroundTransparency = 1, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ScrollBarImageTransparency = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = false, 
            LayoutOrder = 3, 
            [v2.Change.AbsoluteSize] = v34, 
            [v2.Event.SelectionChanged] = v44
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_gutter_0)
            }), 
            Items = v2.createElement(v2.Fragment, {}, v51)
        })
    });
end;