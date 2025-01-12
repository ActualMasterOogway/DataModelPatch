local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_1.Roact);
local _ = require(l_Parent_1.React);
local v5 = require(l_Parent_1.UIBlox);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_DarkTheme_0 = v5.App.Style.Themes.DarkTheme;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local l_useCursor_0 = v5.App.SelectionCursor.useCursor;
local l_Constants_0 = v5.App.Style.Constants;
local v16 = require(l_Parent_1.RoactGamepad);
local v17 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameHorizontal_0 = v17.FitFrameHorizontal;
local l_FitTextLabel_0 = v17.FitTextLabel;
local v20 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v21 = require(l_Parent_0.Utility.formatNumber);
local v22 = require(l_Parent_0.Flags.getEnableRobuxPageNewSelectionCursor);
local v23 = require(l_Parent_0.Flags.getFFlagEnableRobuxPageUseStyleMetadata);
local v24 = l_Images_0["icons/common/robux"];
local function v35(v25, v26, v27, v28, v29, v30) --[[ Line: 64 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v3 (copy), l_ShimmerPanel_0 (copy), v23 (copy), l_Constants_0 (copy), l_DarkTheme_0 (copy), v16 (copy), l_ImageSetButton_0 (copy), v22 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), l_FitFrameHorizontal_0 (copy), v24 (copy), l_FitTextLabel_0 (copy), v21 (copy), l_LocalizationService_0 (copy)
    if v25.robuxAmount == nil then
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 404 * v25.scale, 0, 448 * v25.scale)
        }, {
            ShimmerPanel = v3.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    else
        local l_Theme_0 = v27.Theme;
        local l_Font_0 = v27.Font;
        local v33 = 64 * v25.scale;
        local v34 = nil;
        if v23() then
            v34 = if v30 == l_Constants_0.ThemeName.Dark then Color3.fromRGB(25, 27, 29) else Color3.fromRGB(242, 244, 245);
            if v25.selected then
                v34 = if v30 == l_Constants_0.ThemeName.Dark then Color3.fromRGB(57, 59, 61) else Color3.fromRGB(255, 255, 255);
            end;
        else
            v34 = if l_Theme_0 == l_DarkTheme_0 then Color3.fromRGB(25, 27, 29) else Color3.fromRGB(242, 244, 245);
            if v25.selected then
                v34 = if l_Theme_0 == l_DarkTheme_0 then Color3.fromRGB(57, 59, 61) else Color3.fromRGB(255, 255, 255);
            end;
        end;
        return v3.createElement(v16.Focusable[l_ImageSetButton_0], {
            LayoutOrder = v25.layoutOrder, 
            BackgroundColor3 = l_Theme_0.UIEmphasis.Color, 
            BackgroundTransparency = l_Theme_0.UIEmphasis.Transparency, 
            Size = UDim2.new(0, 404 * v25.scale, 0, 448 * v25.scale), 
            Image = nil, 
            SelectionImageObject = if v22() then v29 else v28(l_CursorKind_0.RoundedRect), 
            [v3.Ref] = v25.forwardRef, 
            NextSelectionUp = nil, 
            NextSelectionDown = nil, 
            NextSelectionLeft = v25.nextSelectionLeft, 
            NextSelectionRight = v25.nextSelectionRight, 
            inputBindings = {
                Activated = if v25.onActivated ~= nil then v16.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 119 ]]
                    -- upvalues: v25 (copy)
                    v25.onActivated(v25.packageId);
                end) else nil
            }, 
            [v3.Event.Activated] = function() --[[ Line: 124 ]]
                -- upvalues: v25 (copy)
                v25.onActivated(v25.packageId);
            end, 
            [v3.Event.MouseMoved] = function() --[[ Line: 127 ]]
                -- upvalues: v25 (copy)
                v25.onHover(v25.forwardRef, true);
            end, 
            [v3.Event.MouseEnter] = function() --[[ Line: 130 ]]
                -- upvalues: v25 (copy)
                v25.onHover(v25.forwardRef, true);
            end, 
            [v3.Event.MouseLeave] = function() --[[ Line: 133 ]]
                -- upvalues: v25 (copy)
                v25.onHover(v25.forwardRef, false);
            end, 
            [v3.Event.SelectionGained] = function() --[[ Line: 136 ]]
                -- upvalues: v25 (copy)
                v25.onSelect(v25.forwardRef);
            end
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Outline = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = v34, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -3, 1, -3)
            }, {
                Corner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), 
                MiddleContent = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24 * v25.scale)
                    }), 
                    v3.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 17.5 * v25.scale)
                    }), 
                    RobuxImageFrame = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(192 * v25.scale, 192 * v25.scale), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        RobuxImage = v3.createElement(l_ImageSetLabel_0, {
                            Size = if v25.selected then UDim2.fromOffset(192 * v25.scale * 1.6, 192 * v25.scale * 1.6) else UDim2.fromOffset(192 * v25.scale, 192 * v25.scale), 
                            Position = if v25.selected then UDim2.new(0.5, 0, 0.3, 0) else UDim2.new(0.5, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v25.robuxImage, 
                            ImageTransparency = 0
                        })
                    }), 
                    RobuxAmount = v3.createElement(l_FitFrameHorizontal_0, {
                        LayoutOrder = 2, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        height = UDim.new(0, v33), 
                        contentPadding = UDim.new(0, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1
                    }, {
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, v33, 0, v33), 
                            Image = v24, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = l_Theme_0.TextEmphasis.Transparency
                        }), 
                        RobuxAmountText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Text = v21(l_LocalizationService_0.RobloxLocaleId, v25.robuxAmount), 
                            Font = l_Font_0.Title.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v33, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    CurrencyAmmountText = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 3, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Text = v25.currencyAmountStr, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = 32 * v25.scale, 
                        BackgroundTransparency = 1
                    }), 
                    MoreText = v25.robuxMoreAmount and v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 4, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Text = v26.moreRobux, 
                        Font = l_Font_0.Header2.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = 32 * v25.scale, 
                        BackgroundTransparency = 1
                    }, {
                        Gradient = v3.createElement("UIGradient", {
                            Rotation = 0, 
                            Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 251, 103)), 
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(243, 185, 34))
                            })
                        })
                    }) or nil
                })
            })
        });
    end;
end;
return function(v36) --[[ Line: 262 ]]
    -- upvalues: v22 (copy), l_useCursor_0 (copy), v23 (copy), v5 (copy), v3 (copy), v20 (copy), v21 (copy), l_LocalizationService_0 (copy), l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), v35 (copy)
    local v37 = if v22() then l_useCursor_0(UDim.new(0, 8)) else nil;
    local v38 = if v23() then v5.Core.Style.useStyleMetadata else nil;
    local v39 = if v23() then v38() else nil;
    local v40 = if v23() then v39.ThemeName else nil;
    return v3.createElement(v20, {
        keys = {
            moreRobux = {
                key = ("IAPExperience.BuyRobux.%s"):format("Text.MoreRobux2"), 
                params = {
                    robux = v21(l_LocalizationService_0.RobloxLocaleId, v36.robuxMoreAmount or 0)
                }
            }
        }, 
        render = function(v41) --[[ Line: 280 ]] --[[ Name: render ]]
            -- upvalues: l_withStyle_0 (ref), l_withSelectionCursorProvider_0 (ref), v36 (copy), v35 (ref), v37 (copy), v40 (copy)
            return l_withStyle_0(function(v42) --[[ Line: 281 ]]
                -- upvalues: l_withSelectionCursorProvider_0 (ref), v36 (ref), v35 (ref), v41 (copy), v37 (ref), v40 (ref)
                return l_withSelectionCursorProvider_0(function(v43) --[[ Line: 282 ]]
                    -- upvalues: v36 (ref), v35 (ref), v41 (ref), v42 (copy), v37 (ref), v40 (ref)
                    if v36.scale == nil then
                        v36.scale = 0.65;
                    end;
                    return v35(v36, v41, v42, v43, v37, v40);
                end);
            end);
        end
    });
end;