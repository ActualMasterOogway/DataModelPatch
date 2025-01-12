local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.UIBloxConfig);
if not v4.useNewHeaderBar then
    return require(l_Parent_0.HeaderBar_DEPRECATED);
else
    local v5 = require(l_Parent_3.React);
    local v6 = require(l_Parent_3.Cryo);
    local _ = require(l_Parent_1.Style.StyleTypes);
    local _ = require(l_Parent_1.Style.Fonts);
    local v9 = require(l_Parent_2.Core.Style.useStyle);
    local v10 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
    local v11 = require(l_Parent_2.Core.Text.GetTextSize);
    local v12 = require(l_Parent_2.Core.Bar.ThreeSectionBar);
    local v13 = {
        barHeight = 48, 
        title = "", 
        isTitleCentered = true, 
        isSecondary = false, 
        isOnMedia = false, 
        hasDivider = false
    };
    local function v30(v14, v15) --[[ Line: 97 ]] --[[ Name: useHeaderBarStyle ]]
        -- upvalues: v5 (copy)
        local l_Tokens_0 = v15.Tokens;
        local l_Theme_0 = v15.Theme;
        local l_backgroundStyle_0 = v14.backgroundStyle;
        local l_backgroundTransparency_0 = v14.backgroundTransparency;
        local l_isOnMedia_0 = v14.isOnMedia;
        local v22 = v5.useMemo(function() --[[ Line: 104 ]]
            -- upvalues: l_isOnMedia_0 (copy), l_backgroundStyle_0 (copy), l_Theme_0 (copy), l_backgroundTransparency_0 (copy)
            if l_isOnMedia_0 then
                return {};
            else
                local v21 = l_backgroundStyle_0 or {
                    Color3 = l_Theme_0.BackgroundDefault.Color, 
                    Transparency = l_Theme_0.BackgroundDefault.Transparency
                };
                if l_backgroundTransparency_0 then
                    v21.Transparency = l_backgroundTransparency_0;
                end;
                return v21;
            end;
        end, {
            l_isOnMedia_0, 
            l_backgroundStyle_0, 
            l_backgroundTransparency_0, 
            l_Theme_0
        });
        local l_paddingTop_0 = v14.paddingTop;
        local l_paddingRight_0 = v14.paddingRight;
        local l_paddingBottom_0 = v14.paddingBottom;
        local l_paddingLeft_0 = v14.paddingLeft;
        local l_margin_0 = v14.margin;
        local v29 = v5.useMemo(function() --[[ Line: 128 ]]
            -- upvalues: l_paddingTop_0 (copy), l_Tokens_0 (copy), l_paddingRight_0 (copy), l_paddingBottom_0 (copy), l_paddingLeft_0 (copy), l_margin_0 (copy)
            local v28 = {
                Top = l_paddingTop_0 or UDim.new(0, l_Tokens_0.Global.Space_100), 
                Right = l_paddingRight_0 or UDim.new(0, l_Tokens_0.Global.Space_250), 
                Bottom = l_paddingBottom_0 or UDim.new(0, l_Tokens_0.Global.Space_100), 
                Left = l_paddingLeft_0 or UDim.new(0, l_Tokens_0.Global.Space_250)
            };
            if l_margin_0 then
                v28.Left = UDim.new(0, l_margin_0);
                v28.Right = UDim.new(0, l_margin_0);
            end;
            return v28;
        end, {
            l_paddingTop_0, 
            l_paddingRight_0, 
            l_paddingBottom_0, 
            l_paddingLeft_0, 
            l_margin_0, 
            l_Tokens_0
        });
        return {
            BackgroundStyle = v22, 
            Padding = v29
        };
    end;
    local function v49(v31, v32) --[[ Line: 149 ]] --[[ Name: useRenderLeft ]]
        -- upvalues: v5 (copy), v6 (copy), v4 (copy), v10 (copy)
        return v5.useMemo(function() --[[ Line: 150 ]]
            -- upvalues: v31 (copy), v5 (ref), v32 (copy), v6 (ref), v4 (ref), v10 (ref)
            local l_title_0 = v31.title;
            local l_renderLeft_0 = v31.renderLeft;
            local l_isTitleCentered_0 = v31.isTitleCentered;
            local l_isSecondary_0 = v31.isSecondary;
            local l_shouldHideSecondaryLeftItem_0 = v31.shouldHideSecondaryLeftItem;
            local v38 = true;
            if l_renderLeft_0 ~= nil then
                v38 = l_renderLeft_0 == v5.None;
            end;
            local l_Tokens_1 = v32.Tokens;
            local l_renderLeft_1 = v31.renderLeft;
            if v38 and string.len(l_title_0) > 0 then
                return function(v41) --[[ Line: 161 ]]
                    -- upvalues: v6 (ref), v5 (ref), l_Tokens_1 (copy), v4 (ref), v10 (ref), l_title_0 (copy)
                    local v42 = v6.Dictionary.join(v41.children, {
                        TextPadding = v5.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_Tokens_1.Global.Space_25), 
                            PaddingBottom = UDim.new(0, l_Tokens_1.Global.Space_25)
                        })
                    });
                    return v5.createElement(v5.Fragment, nil, {
                        Text = if v4.fixHeaderBarTitleFlickering then v5.createElement(v10, {
                            fluidSizing = true, 
                            Text = l_title_0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = l_Tokens_1.Semantic.Typography.Title, 
                            colorStyle = l_Tokens_1.Semantic.Color.Text.Emphasis
                        }, v42) else v5.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Text = l_title_0, 
                            Font = l_Tokens_1.Semantic.Typography.Title.Font, 
                            TextSize = l_Tokens_1.Semantic.Typography.Title.FontSize, 
                            LineHeight = l_Tokens_1.Semantic.Typography.Title.LineHeight, 
                            TextColor3 = l_Tokens_1.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = l_Tokens_1.Semantic.Color.Text.Emphasis.Transparency
                        }, v42)
                    });
                end;
            elseif l_isSecondary_0 and not l_shouldHideSecondaryLeftItem_0 and string.len(l_title_0) > 0 then
                local l_Theme_1 = v32.Theme;
                local l_Font_0 = v32.Font;
                local l_Header2_0 = l_Font_0.Header2;
                local v46 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
                return function() --[[ Line: 197 ]]
                    -- upvalues: v5 (ref), v46 (copy), l_renderLeft_0 (copy), l_Theme_1 (copy), v10 (ref), l_title_0 (copy), l_Header2_0 (copy)
                    return v5.createElement(v5.Fragment, nil, {
                        Text = v5.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v46), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1
                        }, {
                            Layout = v5.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = UDim.new(0, 12)
                            }), 
                            Left = v5.createElement("Frame", {
                                LayoutOrder = 1, 
                                Selectable = false, 
                                Size = UDim2.fromOffset(0, 0), 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY
                            }, {
                                LeftContent = if l_renderLeft_0 then l_renderLeft_0() else nil
                            }), 
                            Divider = v5.createElement("Frame", {
                                LayoutOrder = 2, 
                                Selectable = false, 
                                BackgroundColor3 = l_Theme_1.Divider.Color, 
                                BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                                BorderSizePixel = 0, 
                                Size = UDim2.new(0, 1, 1, 0)
                            }), 
                            TextLabel = v5.createElement(v10, {
                                LayoutOrder = 3, 
                                Selectable = false, 
                                ClipsDescendants = true, 
                                Text = l_title_0, 
                                TextTruncate = Enum.TextTruncate.AtEnd, 
                                TextWrapped = false, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                fontStyle = l_Header2_0, 
                                colorStyle = l_Theme_1.TextEmphasis
                            })
                        })
                    });
                end;
            else
                if not l_isSecondary_0 and not l_isTitleCentered_0 then
                    local l_Header_0 = l_Tokens_1.Semantic.Typography.Header;
                    local l_FontSize_0 = l_Header_0.FontSize;
                    l_renderLeft_1 = function() --[[ Line: 246 ]]
                        -- upvalues: v5 (ref), l_FontSize_0 (copy), l_Tokens_1 (copy), l_renderLeft_0 (copy), v10 (ref), l_title_0 (copy), l_Header_0 (copy)
                        return v5.createElement(v5.Fragment, nil, {
                            LeftFrame = v5.createElement("Frame", {
                                Selectable = false, 
                                Size = UDim2.new(1, 0, 0, l_FontSize_0), 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1
                            }, {
                                Layout = v5.createElement("UIListLayout", {
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = UDim.new(0, l_Tokens_1.Global.Space_150)
                                }), 
                                Left = v5.createElement("Frame", {
                                    LayoutOrder = 1, 
                                    Selectable = false, 
                                    Size = UDim2.fromOffset(0, 0), 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    AutomaticSize = Enum.AutomaticSize.XY
                                }, {
                                    LeftContent = if l_renderLeft_0 then l_renderLeft_0() else nil
                                }), 
                                TextLabel = v5.createElement(v10, {
                                    LayoutOrder = 2, 
                                    Selectable = false, 
                                    ClipsDescendants = true, 
                                    Text = l_title_0, 
                                    TextTruncate = Enum.TextTruncate.AtEnd, 
                                    TextWrapped = false, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    fontStyle = l_Header_0, 
                                    colorStyle = l_Tokens_1.Semantic.Color.Text.Emphasis
                                }, {
                                    TextPadding = v5.createElement("UIPadding", {
                                        PaddingTop = UDim.new(0, l_Tokens_1.Global.Space_25), 
                                        PaddingBottom = UDim.new(0, l_Tokens_1.Global.Space_25)
                                    })
                                })
                            })
                        });
                    end;
                end;
                return l_renderLeft_1;
            end;
        end, {
            v31.title, 
            v31.isTitleCentered, 
            v31.renderLeft, 
            v31.isSecondary, 
            v31.shouldHideSecondaryLeftItem, 
            v32
        });
    end;
    return function(v50) --[[ Line: 302 ]] --[[ Name: HeaderBar ]]
        -- upvalues: v6 (copy), v13 (copy), v9 (copy), v5 (copy), v49 (copy), v10 (copy), v4 (copy), v11 (copy), v30 (copy), v12 (copy)
        local v51 = v6.Dictionary.join(v13, v50);
        local v52 = v9();
        local l_Tokens_2 = v52.Tokens;
        local l_title_1 = v51.title;
        local l_renderCenter_0 = v51.renderCenter;
        local l_renderRight_0 = v51.renderRight;
        local l_isTitleCentered_1 = v51.isTitleCentered;
        local l_isSecondary_1 = v51.isSecondary;
        local l_onHeaderActivated_0 = v51.onHeaderActivated;
        local l_contentPaddingRight_0 = v51.contentPaddingRight;
        local l_automaticHeight_0 = v51.automaticHeight;
        local l_isOnMedia_1 = v51.isOnMedia;
        local l_zIndex_0 = v51.zIndex;
        local l_hasDivider_0 = v51.hasDivider;
        local v65 = true;
        if v51.renderLeft ~= nil then
            v65 = v51.renderLeft == v5.None;
        end;
        local v66 = v49(v51, v52);
        local v70 = v5.useMemo(function() --[[ Line: 323 ]]
            -- upvalues: l_renderCenter_0 (copy), v65 (copy), l_isSecondary_1 (copy), l_isTitleCentered_1 (copy), l_Tokens_2 (copy), v5 (ref), v10 (ref), l_title_1 (copy)
            local l_l_renderCenter_0_0 = l_renderCenter_0;
            if not l_l_renderCenter_0_0 and not v65 and not l_isSecondary_1 and l_isTitleCentered_1 then
                local l_Header_1 = l_Tokens_2.Semantic.Typography.Header;
                local l_FontSize_1 = l_Header_1.FontSize;
                l_l_renderCenter_0_0 = function() --[[ Line: 330 ]]
                    -- upvalues: v5 (ref), v10 (ref), l_FontSize_1 (copy), l_title_1 (ref), l_Header_1 (copy), l_Tokens_2 (ref)
                    return v5.createElement(v10, {
                        Selectable = false, 
                        ClipsDescendants = true, 
                        Size = UDim2.new(1, 0, 0, l_FontSize_1), 
                        Text = l_title_1, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = false, 
                        fontStyle = l_Header_1, 
                        colorStyle = l_Tokens_2.Semantic.Color.Text.Emphasis
                    }, {
                        TextPadding = v5.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_Tokens_2.Global.Space_25), 
                            PaddingBottom = UDim.new(0, l_Tokens_2.Global.Space_25)
                        })
                    });
                end;
            end;
            return l_l_renderCenter_0_0;
        end, if v4.fixHeaderBarDependenciesArray then {
            l_renderCenter_0, 
            v65, 
            l_isSecondary_1, 
            l_isTitleCentered_1, 
            l_Tokens_2, 
            l_title_1
        } else {
            l_renderCenter_0, 
            v65, 
            l_isSecondary_1, 
            l_isTitleCentered_1, 
            l_Tokens_2
        });
        local v73 = v5.useMemo(function() --[[ Line: 355 ]]
            -- upvalues: v66 (copy), l_renderCenter_0 (copy), l_renderRight_0 (copy), v65 (copy), l_isSecondary_1 (copy), l_isTitleCentered_1 (copy), l_Tokens_2 (copy), v11 (ref), l_title_1 (copy)
            if v66 and l_renderCenter_0 and l_renderRight_0 then
                return 0;
            elseif not l_renderCenter_0 and not v65 and not l_isSecondary_1 and l_isTitleCentered_1 then
                local l_Header_2 = l_Tokens_2.Semantic.Typography.Header;
                local l_FontSize_2 = l_Header_2.FontSize;
                return v11(l_title_1, l_FontSize_2, l_Header_2.Font, Vector2.new(1e999, 1e999)).X;
            else
                return 1e999;
            end;
        end, {
            l_title_1, 
            l_isTitleCentered_1, 
            v65, 
            v66, 
            l_renderCenter_0, 
            l_renderRight_0, 
            l_isSecondary_1, 
            l_Tokens_2
        });
        local v74 = v5.useMemo(function() --[[ Line: 372 ]]
            -- upvalues: l_contentPaddingRight_0 (copy), v65 (copy), l_Tokens_2 (copy)
            if l_contentPaddingRight_0 then
                return l_contentPaddingRight_0;
            elseif v65 then
                return UDim.new(0, 0);
            else
                return UDim.new(0, l_Tokens_2.Global.Space_300);
            end;
        end, {
            l_contentPaddingRight_0, 
            v65, 
            l_Tokens_2
        });
        local v75 = v30(v51, v52);
        local l_BackgroundStyle_0 = v75.BackgroundStyle;
        local l_Padding_0 = v75.Padding;
        local v78 = if l_isOnMedia_1 then v51.barHeight + l_Tokens_2.Global.Size_500 else v51.barHeight;
        local v79 = l_automaticHeight_0 and 0 or math.max(0, v51.barHeight - l_Padding_0.Top.Offset - l_Padding_0.Bottom.Offset);
        return v5.createElement("Frame", {
            Selectable = false, 
            Size = UDim2.new(1, 0, 0, v78), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundStyle_0.Color3, 
            BackgroundTransparency = l_BackgroundStyle_0.Transparency, 
            AutomaticSize = if l_automaticHeight_0 then Enum.AutomaticSize.Y else nil, 
            ZIndex = l_zIndex_0
        }, {
            Gradient = if l_isOnMedia_1 then v5.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.7), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            }) else nil, 
            OnMediaExtendedHeight = if l_isOnMedia_1 then v5.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Tokens_2.Global.Size_500)
            }) else nil, 
            Bar = v5.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.fromScale(1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingTop = l_Padding_0.Top, 
                    PaddingRight = l_Padding_0.Right, 
                    PaddingBottom = l_Padding_0.Bottom, 
                    PaddingLeft = l_Padding_0.Left
                }), 
                ThreeSectionBar = v5.createElement(v12, {
                    BackgroundTransparency = 1, 
                    barHeight = v79, 
                    automaticHeight = l_automaticHeight_0, 
                    renderLeft = v66, 
                    renderCenter = v70, 
                    renderRight = l_renderRight_0, 
                    estimatedCenterWidth = v73, 
                    sectionSpacing = l_Tokens_2.Global.Space_150, 
                    contentPaddingRight = v74
                })
            }), 
            HeaderClickArea = if l_onHeaderActivated_0 then v5.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = "", 
                Size = UDim2.fromScale(1, 1), 
                Selectable = false, 
                [v5.Event.Activated] = l_onHeaderActivated_0, 
                ZIndex = 0
            }) else nil, 
            BottomDivider = if l_hasDivider_0 then v5.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.new(1, 0, 0, l_Tokens_2.Global.Stroke_100), 
                Position = UDim2.new(0, 0, 1, -l_Tokens_2.Global.Stroke_100), 
                BackgroundColor3 = l_Tokens_2.Semantic.Color.Common.Divider.Color3, 
                BackgroundTransparency = l_Tokens_2.Semantic.Color.Common.Divider.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 1
            }) else nil
        });
    end;
end;