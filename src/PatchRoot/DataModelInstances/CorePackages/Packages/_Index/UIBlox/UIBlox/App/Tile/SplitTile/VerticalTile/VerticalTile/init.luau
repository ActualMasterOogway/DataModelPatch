local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_2.Core;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.React);
local l_useDebouncedState_0 = require(l_Parent_3.ReactUtils).useDebouncedState;
local v8 = require(l_Core_0.Style.useStyle);
local v9 = require(l_Core_0.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.ImageSet.Images);
local v11 = require(l_Parent_0.SplitTile.TileOverlay);
local _ = require(l_Parent_1.Style.StyleTypes);
local v13 = UDim.new(0, 8);
local function v18(v14, v15) --[[ Line: 65 ]] --[[ Name: useIsHoveredState ]]
    -- upvalues: l_useDebouncedState_0 (copy), v6 (copy)
    local v16, v17 = l_useDebouncedState_0(false, v14);
    v6.useLayoutEffect(function() --[[ Line: 68 ]]
        -- upvalues: v15 (copy), v16 (copy)
        if v15 ~= nil then
            v15(v16);
        end;
    end, {
        v15, 
        v16
    });
    return v16, v17;
end;
return function(v19) --[[ Line: 77 ]] --[[ Name: VerticalTile ]]
    -- upvalues: v8 (copy), v5 (copy), v13 (copy), v18 (copy), v6 (copy), v11 (copy), v9 (copy), v10 (copy)
    local l_Theme_0 = v8().Theme;
    local v21 = v5.Dictionary.join({
        hasBackground = true, 
        hasOutline = true, 
        isHoverEnabled = true, 
        isOverlayVisible = true, 
        isActive = true, 
        backgroundColor = {
            Color = l_Theme_0.BackgroundUIDefault.Color, 
            Transparency = l_Theme_0.BackgroundUIDefault.Transparency
        }, 
        border = {
            BorderColor = {
                Color = l_Theme_0.Divider.Color, 
                Transparency = l_Theme_0.Divider.Transparency
            }, 
            CornerRadius = v13, 
            Width = 1
        }, 
        dropShadow = {
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 10, 1, 12), 
            ImageColor = {
                Color = l_Theme_0.DropShadow.Color, 
                Transparency = l_Theme_0.DropShadow.Transparency
            }, 
            ImageAssetName = "component_assets/dropshadow_24_6", 
            SliceCenter = Rect.new(18, 18, 18, 18)
        }
    }, v19);
    local l_hasBackground_0 = v21.hasBackground;
    local l_isHoverEnabled_0 = v21.isHoverEnabled;
    local v24, v25 = v18(v21.hoverDelay, v21.onHoverChanged);
    local v27 = v6.useCallback(function(v26) --[[ Line: 113 ]]
        -- upvalues: v25 (copy)
        return function() --[[ Line: 114 ]]
            -- upvalues: v25 (ref), v26 (copy)
            v25(v26);
        end;
    end, {});
    local v28 = v24 and l_isHoverEnabled_0;
    local v29 = if l_hasBackground_0 then v21.backgroundColor.Color else nil;
    local v30 = if l_hasBackground_0 then v21.backgroundColor.Transparency else 1;
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        UISizeConstraint = if v21.minTileSize then v6.createElement("UISizeConstraint", {
            MinSize = v21.minTileSize
        }) else nil, 
        TileContent = v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v29, 
            BackgroundTransparency = v30, 
            [v6.Event.MouseEnter] = if l_isHoverEnabled_0 then v27(true) else nil, 
            [v6.Event.MouseLeave] = if l_isHoverEnabled_0 then v27(false) else nil, 
            ClipsDescendants = false, 
            ZIndex = 1
        }, {
            UICorner = v6.createElement("UICorner", {
                CornerRadius = v21.border.CornerRadius
            }), 
            Panel = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                UIListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.Name
                }), 
                Content1 = if v21.renderTopContent then v21.renderTopContent(v28) else nil, 
                Content2 = if v21.renderBottomContent then v21.renderBottomContent(v28) else nil
            }), 
            FooterRow = if v21.renderFooterRow then v21.renderFooterRow(v28) else nil, 
            Overlay = v6.createElement(v11, {
                reservedBottomHeight = v21.reservedBottomHeight, 
                isVisible = v21.isOverlayVisible, 
                isActive = v21.isActive, 
                onActivated = v21.onActivated, 
                zIndex = 3
            })
        }), 
        BorderFrame = if v21.hasOutline then v6.createElement("Frame", {
            Size = UDim2.new(1, -2 * v21.border.Width, 1, -2 * v21.border.Width), 
            AnchorPoint = if l_hasBackground_0 then Vector2.new(0.5, 0.5) else nil, 
            Position = if l_hasBackground_0 then UDim2.fromScale(0.5, 0.5) else UDim2.fromOffset(v21.border.Width, v21.border.Width), 
            BackgroundTransparency = 1, 
            SizeConstraint = if not l_hasBackground_0 then Enum.SizeConstraint.RelativeXX else nil, 
            ZIndex = 4
        }, {
            UIStroke = v6.createElement("UIStroke", {
                Color = v21.border.BorderColor.Color, 
                Transparency = v21.border.BorderColor.Transparency, 
                Thickness = v21.border.Width
            }), 
            UICorner = v6.createElement("UICorner", {
                CornerRadius = v21.border.CornerRadius
            })
        }) else nil, 
        HoverShadow = if v28 and l_hasBackground_0 then v6.createElement(v9.Label, {
            ZIndex = 0, 
            Position = v21.dropShadow.Position, 
            AnchorPoint = v21.dropShadow.AnchorPoint, 
            BackgroundTransparency = 1, 
            Size = v21.dropShadow.Size, 
            Image = v10[v21.dropShadow.ImageAssetName], 
            ImageColor3 = v21.dropShadow.ImageColor.Color, 
            ImageTransparency = v21.dropShadow.ImageColor.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v21.dropShadow.SliceCenter
        }) else nil
    });
end;