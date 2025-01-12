local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_0.Indicator.Badge);
local v8 = require(l_Parent_0.Indicator.Enum.BadgeStates);
local v9 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v10 = require(l_Parent_0.ImageSet.getIconSize);
local v11 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v12 = require(l_Parent_0.SelectionImage.CursorKind);
local v13 = require(l_Parent_0.Indicator.Enum.BadgeVariant);
local v14 = require(l_Core_0.Control.Enum.ControlState);
local v15 = require(l_Core_0.Control.Interactable);
local v16 = require(l_Core_0.ImageSet.ImageSetComponent);
local v17 = require(l_Core_0.ImageSet.Validator.validateImage);
local v18 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v19 = require(l_Parent_1.Core.Style.Validator.validateFontInfo);
local v20 = require(l_Parent_1.Core.Style.Validator.validateTypographyInfo);
local v21 = require(l_Parent_1.Core.Style.withStyle);
local v22 = require(l_Parent_1.Utility.divideTransparency);
local v23 = require(l_Parent_0.SelectionCursor.withCursor);
local v24 = require(l_Parent_0.SelectionCursor.CursorType);
local v25 = require(l_Parent_1.UIBloxConfig);
local v26 = require(l_Parent_1.Core.Text.GetTextSize);
local v27 = UDim.new(0, 12);
local v28 = UDim.new(0, 8);
local v29 = {
    frequency = 6, 
    dampingRatio = 1
};
local v30 = {
    BACKGROUND = 1, 
    HOVER_MASK = 2, 
    ICON_AND_TITLE_CONTAINER = 3, 
    BADGE_CONTAINER = 4, 
    ROUNDED_CORNERS_MASK = 5
};
local v31 = {
    ICON = 1, 
    TITLE = 2
};
local v32 = v5.Component:extend("MenuTile");
v32.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    styleProps = {}
};
v32.validateProps = v6.strictInterface({
    size = v6.optional(v6.UDim2), 
    position = v6.optional(v6.UDim2), 
    layoutOrder = v6.optional(v6.number), 
    badgeValue = v6.optional(v6.union(v6.string, v6.number, v8.isEnumValue)), 
    badgeVariant = v6.optional(v13.isEnumValue), 
    icon = v6.optional(v17), 
    title = v6.string, 
    onActivated = v6.callback, 
    styleProps = v6.optional(v6.strictInterface({
        iconStyle = v6.optional(v18), 
        iconSize = v6.optional(v9.isEnumValue), 
        titleStyle = v6.optional(v18), 
        titleFont = v6.optional(v6.union(v19, v20))
    }))
});
local function v38(v33) --[[ Line: 98 ]] --[[ Name: withProviders ]]
    -- upvalues: v21 (copy), v11 (copy), v25 (copy), v23 (copy), v24 (copy)
    return v21(function(v34) --[[ Line: 99 ]]
        -- upvalues: v11 (ref), v25 (ref), v23 (ref), v24 (ref), v33 (copy)
        return v11(function(v35) --[[ Line: 100 ]]
            -- upvalues: v25 (ref), v23 (ref), v24 (ref), v33 (ref), v34 (copy)
            if v25.migrateToNewSelectionCursor then
                return v23(function(v36) --[[ Line: 102 ]]
                    -- upvalues: v24 (ref), v33 (ref), v34 (ref), v35 (copy)
                    local v37 = v36.getCursorByType(v24.RoundedRect);
                    return v33(v34, v35, v37);
                end);
            else
                return v33(v34, v35);
            end;
        end);
    end);
end;
local function v44(v39, v40) --[[ Line: 113 ]] --[[ Name: getStyleProps ]]
    -- upvalues: v10 (copy), v9 (copy)
    local l_Theme_0 = v40.Theme;
    local l_Font_0 = v40.Font;
    local v43 = if v39.iconSize then v10(v39.iconSize, v40) else v10(v9.Large);
    return {
        iconStyle = v39.iconStyle or l_Theme_0.IconDefault, 
        iconSize = v43, 
        titleStyle = v39.titleStyle or l_Theme_0.TextDefault, 
        titleFont = v39.titleFont or l_Font_0.SubHeader1
    };
end;
v32.init = function(v45) --[[ Line: 129 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v46, v47 = v5.createBinding(1);
    v45.hoverTransparency = v46;
    v45.updateHoverTransparency = v47;
    v45.hoverTransparencyMotor = v4.createSingleMotor(1);
    v45.hoverTransparencyMotor:onStep(v45.updateHoverTransparency);
    v45.hoverTransparencyMotor:onComplete(function(v48) --[[ Line: 133 ]]
        -- upvalues: v45 (copy)
        if v48 == 1 then
            v45:setState({
                showHoverMask = false
            });
        end;
    end);
    v45:setState({
        backgroundTransparency = 0, 
        iconTransparency = 0, 
        titleTransparency = 0, 
        showHoverMask = false
    });
end;
v32.render = function(v49) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v38 (copy), v44 (copy), v26 (copy), v25 (copy), v12 (copy), v14 (copy), v4 (copy), v29 (copy), v22 (copy), v5 (copy), v15 (copy), v30 (copy), v27 (copy), v28 (copy), v16 (copy), v31 (copy), v7 (copy)
    local l_backgroundTransparency_0 = v49.state.backgroundTransparency;
    local l_iconTransparency_0 = v49.state.iconTransparency;
    local l_titleTransparency_0 = v49.state.titleTransparency;
    local l_badgeValue_0 = v49.props.badgeValue;
    local l_icon_0 = v49.props.icon;
    local l_layoutOrder_0 = v49.props.layoutOrder;
    local l_onActivated_0 = v49.props.onActivated;
    local l_position_0 = v49.props.position;
    local l_size_0 = v49.props.size;
    local l_title_0 = v49.props.title;
    return v38(function(v60, v61, v62) --[[ Line: 162 ]]
        -- upvalues: v44 (ref), v49 (copy), v26 (ref), l_title_0 (copy), v25 (ref), v12 (ref), v14 (ref), v4 (ref), v29 (ref), v22 (ref), v5 (ref), v15 (ref), l_size_0 (copy), l_position_0 (copy), l_layoutOrder_0 (copy), l_onActivated_0 (copy), l_backgroundTransparency_0 (copy), v30 (ref), v27 (ref), v28 (ref), l_icon_0 (copy), v16 (ref), l_iconTransparency_0 (copy), v31 (ref), l_titleTransparency_0 (copy), l_badgeValue_0 (copy), v7 (ref)
        local l_Theme_1 = v60.Theme;
        local v64 = v44(v49.props.styleProps, v60);
        local l_BackgroundUIDefault_0 = l_Theme_1.BackgroundUIDefault;
        local l_BackgroundOnHover_0 = l_Theme_1.BackgroundOnHover;
        local l_iconStyle_0 = v64.iconStyle;
        local l_iconSize_0 = v64.iconSize;
        local l_titleStyle_0 = v64.titleStyle;
        local l_titleFont_0 = v64.titleFont;
        local v71 = if l_titleFont_0.RelativeSize then l_titleFont_0.RelativeSize * v60.Font.BaseSize else l_titleFont_0.FontSize;
        local l_Y_0 = v26(l_title_0, v71, l_titleFont_0.Font, Vector2.new(100, v71)).Y;
        local v73 = if v25.migrateToNewSelectionCursor then v62 else v61(v12.RoundedRect);
        local function v76(_, v75) --[[ Line: 185 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v14 (ref), v49 (ref), l_BackgroundUIDefault_0 (copy), l_iconStyle_0 (copy), l_titleStyle_0 (copy), v4 (ref), l_BackgroundOnHover_0 (copy), v29 (ref), v22 (ref)
            if v75 == v14.Hover then
                v49:setState({
                    backgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                    iconTransparency = l_iconStyle_0.Transparency, 
                    titleTransparency = l_titleStyle_0.Transparency, 
                    showHoverMask = true
                });
                v49.hoverTransparencyMotor:setGoal(v4.spring(l_BackgroundOnHover_0.Transparency, v29));
                return;
            elseif v75 == v14.Default then
                v49:setState({
                    backgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                    iconTransparency = l_iconStyle_0.Transparency, 
                    titleTransparency = l_titleStyle_0.Transparency
                });
                v49.hoverTransparencyMotor:setGoal(v4.spring(1, v29));
                return;
            else
                if v75 == v14.Pressed then
                    v49:setState({
                        backgroundTransparency = v22(l_BackgroundUIDefault_0.Transparency, 2), 
                        iconTransparency = v22(l_iconStyle_0.Transparency, 2), 
                        titleTransparency = v22(l_titleStyle_0.Transparency, 2), 
                        showHoverMask = false
                    });
                    v49.hoverTransparencyMotor:setGoal(v4.instant(1));
                end;
                return;
            end;
        end;
        return v5.createElement(v15, {
            Size = l_size_0, 
            Position = l_position_0, 
            BackgroundTransparency = 1, 
            SelectionImageObject = v73, 
            LayoutOrder = l_layoutOrder_0, 
            onStateChanged = v76, 
            [v5.Event.Activated] = l_onActivated_0
        }, {
            MenuTileFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = l_size_0
            }, {
                Background = v5.createElement("Frame", {
                    BackgroundColor3 = l_BackgroundUIDefault_0.Color, 
                    BackgroundTransparency = l_backgroundTransparency_0, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.BACKGROUND
                }, {
                    RoundedCornerUI = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                HoverMask = v49.state.showHoverMask and v5.createElement("Frame", {
                    BackgroundColor3 = l_BackgroundOnHover_0.Color, 
                    BackgroundTransparency = v49.hoverTransparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.HOVER_MASK
                }, {
                    RoundedCornerUI = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                IconAndTitleContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.ICON_AND_TITLE_CONTAINER
                }, {
                    IconAndTitleUIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = v27, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    IconAndTitleUIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = v28, 
                        PaddingLeft = v28, 
                        PaddingRight = v28, 
                        PaddingTop = v28 + UDim.new(0, l_Y_0)
                    }), 
                    Icon = l_icon_0 and v5.createElement(v16.Label, {
                        BackgroundTransparency = 1, 
                        Image = l_icon_0, 
                        ImageColor3 = l_iconStyle_0.Color, 
                        ImageTransparency = l_iconTransparency_0, 
                        LayoutOrder = v31.ICON, 
                        Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0)
                    }), 
                    Title = l_title_0 and v5.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Font = l_titleFont_0.Font, 
                        LayoutOrder = v31.TITLE, 
                        Size = UDim2.new(1, 0, 0, l_Y_0 * 2), 
                        Text = l_title_0, 
                        TextColor3 = l_titleStyle_0.Color, 
                        TextSize = v71, 
                        TextTransparency = l_titleTransparency_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = true, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    })
                }), 
                BadgeContainer = l_badgeValue_0 and v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.BADGE_CONTAINER
                }, {
                    BadgeUIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = v27, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    BadgeUIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = v28, 
                        PaddingLeft = v28, 
                        PaddingRight = v28, 
                        PaddingTop = v28
                    }), 
                    Badge = v5.createElement(v7, {
                        value = l_badgeValue_0, 
                        badgeVariant = v49.props.badgeVariant
                    })
                })
            })
        });
    end);
end;
v32.willUnmount = function(v77) --[[ Line: 316 ]] --[[ Name: willUnmount ]]
    if v77.hoverTransparencyMotor then
        v77.hoverTransparencyMotor:destroy();
    end;
end;
return v32;