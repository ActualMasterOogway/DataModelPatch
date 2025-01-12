local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RobloxAppHooks);
local v6 = require(l_Parent_0.RobloxAppEnums);
local v7 = require(l_Parent_0.Style);
local v8 = require(l_Parent_0.Foundation);
local l_Badge_0 = v4.App.Indicator.Badge;
local l_Badge_1 = v8.Badge;
local l_BadgeSize_0 = v8.Enums.BadgeSize;
local l_BadgeVariant_0 = v8.Enums.BadgeVariant;
local l_Icon_0 = v8.Icon;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v4.App.Constant.IconSize;
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = v7.useDesignTokens;
local l_useUiModeInfo_0 = v5.useUiModeInfo;
local l_UiMode_0 = v6.UiMode;
local l_FFlagLuaAppFixCursorHooks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixCursorHooks;
local l_FFlagEnableNewFriendRequestsBadge_0 = require(l_Parent_0.SharedFlags).FFlagEnableNewFriendRequestsBadge;
local l_FFlagRefactorButtonTileCircular_0 = require(l_Parent_0.SharedFlags).FFlagRefactorButtonTileCircular;
local v25 = l_FFlagEnableNewFriendRequestsBadge_0 and 2 or 5;
local v26 = UDim.new(0.5, 0);
local v27 = {
    layoutOrder = 0, 
    onActivated = function() --[[ Line: 58 ]] --[[ Name: onActivated ]]

    end, 
    tileSize = 96, 
    title = ""
};
return function(v28) --[[ Line: 63 ]] --[[ Name: ButtonTileCircular ]]
    -- upvalues: v2 (copy), v3 (copy), v27 (copy), l_useStyle_0 (copy), l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_UiMode_0 (copy), l_FFlagEnableNewFriendRequestsBadge_0 (copy), l_FFlagLuaAppFixCursorHooks_0 (copy), l_useCursor_0 (copy), v26 (copy), l_Badge_1 (copy), v25 (copy), l_BadgeSize_0 (copy), l_BadgeVariant_0 (copy), l_Badge_0 (copy), l_FFlagRefactorButtonTileCircular_0 (copy), v1 (copy), l_Icon_0 (copy), l_ImageSetLabel_0 (copy), l_IconSize_0 (copy), l_StyledTextLabel_0 (copy)
    local v29 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v3 (ref), v27 (ref), v28 (copy)
        return v3.Dictionary.join(v27, v28 or {});
    end, {
        v27, 
        v28
    });
    local v30 = l_useStyle_0();
    local v31 = l_useUiModeInfo_0();
    local v33 = l_useDesignTokens_0(function(v32) --[[ Line: 70 ]]
        -- upvalues: v31 (copy), l_UiMode_0 (ref), l_FFlagEnableNewFriendRequestsBadge_0 (ref), v30 (copy)
        if v31.uiMode == l_UiMode_0.TenFoot then
            return {
                tilePadding = v32.Global.Space_100, 
                textFont = v32.Semantic.Typography.CaptionHeader, 
                presenceIconPadding = if l_FFlagEnableNewFriendRequestsBadge_0 then v32.Global.Space_50 else nil
            };
        else
            return {
                tilePadding = 8, 
                textFont = v30.Font.CaptionHeader, 
                presenceIconPadding = l_FFlagEnableNewFriendRequestsBadge_0 and 6 or nil
            };
        end;
    end);
    local v34 = if l_FFlagLuaAppFixCursorHooks_0 then l_useCursor_0(v26) else nil;
    local l_badgeValue_0 = v29.badgeValue;
    local l_subLabelText_0 = v29.subLabelText;
    local v37 = if l_FFlagEnableNewFriendRequestsBadge_0 then if l_badgeValue_0 then v2.createElement(l_Badge_1, {
        Position = UDim2.fromOffset(v29.tileSize - v25, v25), 
        AnchorPoint = Vector2.new(1, 0), 
        ZIndex = 2, 
        size = l_BadgeSize_0.Medium, 
        text = l_badgeValue_0, 
        variant = l_BadgeVariant_0.Alert
    }) else nil else if v29.badgeValue then v2.createElement(l_Badge_0, {
        anchorPoint = Vector2.new(1, 0), 
        position = UDim2.fromOffset(v29.tileSize - v25, v25), 
        value = v29.badgeValue
    }) else nil;
    local v38 = nil;
    if l_FFlagRefactorButtonTileCircular_0 then
        v38 = v2.useMemo(function() --[[ Line: 108 ]]
            -- upvalues: v29 (copy), v30 (copy)
            return {
                Color3 = if v29.iconColor then v29.iconColor else v30.Theme.IconEmphasis.Color
            };
        end, {
            v30.Theme.IconEmphasis.Color, 
            v29.iconColor
        });
    end;
    return v1.createFragment({
        ButtonTileCircular = v2.createElement("Frame", {
            Size = UDim2.new(0, v29.tileSize, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v29.layoutOrder
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v33.tilePadding)
            }), 
            Button = v2.createElement("TextButton", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, v29.tileSize, 0, v29.tileSize), 
                BackgroundColor3 = if v29.backgroundColor then v29.backgroundColor else v30.Theme.UIEmphasis.Color, 
                Text = "", 
                BackgroundTransparency = if l_FFlagRefactorButtonTileCircular_0 and v29.backgroundTransparency then v29.backgroundTransparency else v29.backgroundColor and 0 or v30.Theme.UIEmphasis.Transparency, 
                SelectionImageObject = if l_FFlagLuaAppFixCursorHooks_0 then v34 else l_useCursor_0(v26), 
                [v2.Event.Activated] = v29.onActivated
            }, {
                StrokeWrapper = if v29.noBorder then nil else v1.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.new(1, -4, 1, -4), 
                    BackgroundTransparency = 1, 
                    ZIndex = 0
                }, {
                    UICorner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UIStroke = v1.createElement("UIStroke", {
                        Thickness = 2, 
                        Color = v30.Theme.IconEmphasis.Color, 
                        Transparency = v30.Theme.SecondaryDefault.Transparency
                    })
                }), 
                Icon = if l_FFlagRefactorButtonTileCircular_0 then v2.createElement(l_Icon_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    name = v29.icon, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    size = v29.iconSize, 
                    style = v38
                }) else v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v29.icon, 
                    ImageColor3 = v29.iconColor or v30.Theme.IconEmphasis.Color, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
                }), 
                Badge = v37, 
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = v26
                })
            }), 
            ButtonLabel = v2.createElement("TextButton", {
                LayoutOrder = 2, 
                Size = UDim2.new(0, v29.tileSize, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = "", 
                [v2.Event.Activated] = v29.onActivated, 
                Selectable = false
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = if l_FFlagEnableNewFriendRequestsBadge_0 and l_subLabelText_0 then UDim.new(0, v33.presenceIconPadding) else nil
                }), 
                Label = v2.createElement(l_StyledTextLabel_0, {
                    text = v29.title, 
                    fontStyle = v33.textFont, 
                    colorStyle = v30.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1, 
                    layoutOrder = l_FFlagEnableNewFriendRequestsBadge_0 and l_subLabelText_0 and 1 or nil
                }), 
                SubLabel = if l_FFlagEnableNewFriendRequestsBadge_0 and l_subLabelText_0 then v2.createElement(l_StyledTextLabel_0, {
                    text = l_subLabelText_0, 
                    fontStyle = v33.textFont, 
                    colorStyle = v30.Theme.TextMuted, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1, 
                    layoutOrder = 2
                }) else nil
            })
        })
    });
end;