local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local v10 = require(l_Parent_0.Style);
local l_GetTextSize_0 = v10.GetTextSize;
local l_useDesignTokens_0 = v10.useDesignTokens;
local l_IconWithTooltip_0 = require(l_Parent_0.AppBlox).IconWithTooltip;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v16.usePreferredInput;
local v18 = require(l_script_FirstAncestor_0.checkAndFormatPossibleLink);
local v19 = require(l_script_FirstAncestor_0.SeeAllButtonType_Legacy);
local v20 = require(l_script_FirstAncestor_0.CarouselUpdatesExperimentation);
local v21 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppUpdateCollectionHeader_0 = v21.FFlagLuaAppUpdateCollectionHeader;
local l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 = v21.FFlagLuaAppScrollableDesktopCarouselsIXP;
local l_FFlagEnableChartsSubtitleLink_0 = v21.FFlagEnableChartsSubtitleLink;
local v25 = game:DefineFastFlag("LuaAppUpdatedChartsSubtitleLink", false) and l_FFlagEnableChartsSubtitleLink_0;
local v26 = Vector2.new(1e999, 1e999);
local v27 = l_Images_0["icons/actions/truncationCollapse_small"];
local v28 = l_Images_0["icons/actions/cycleRight"];
local v29 = {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Size = UDim2.new(1, 0, 0, 0), 
    tooltipSupportsVR = true, 
    tooltipSupportsTenFootUi = true
};
local function _(v30, v31, v32) --[[ Line: 101 ]] --[[ Name: determineSeeAllButtonType ]]
    -- upvalues: v19 (copy), v16 (copy)
    if v30 then
        return v19.None;
    elseif v31 == v16.Input.Directional then
        return v19.None;
    elseif v32 then
        return v19.TextButton;
    else
        return v19.Arrow;
    end;
end;
local function v35(v34) --[[ Line: 120 ]] --[[ Name: SeeAllTextButton_Legacy ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.Secondary, 
        position = v34.position, 
        size = v34.size, 
        anchorPoint = v34.anchorPoint, 
        text = v34.buttonText, 
        fontStyle = v34.buttonFont, 
        onActivated = v34.onActivate
    });
end;
local function v41(v36) --[[ Line: 139 ]] --[[ Name: HeaderButton ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagLuaAppUpdateCollectionHeader_0 (copy), l_GetImageData_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy)
    local v37 = l_useDesignTokens_0();
    local l_Size_200_0 = v37.Global.Size_200;
    local l_Emphasis_0 = v37.Semantic.Color.Text.Emphasis;
    local v40 = if l_FFlagLuaAppUpdateCollectionHeader_0 then v36.image else v36.image or l_GetImageData_0("LuaApp/icons/navigation/pushRight_small") or "LuaApp/icons/navigation/pushRight_small";
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v36.Size or UDim2.new(0, l_Size_200_0, 0, l_Size_200_0), 
        BackgroundTransparency = 1, 
        Image = v40, 
        ImageColor3 = l_Emphasis_0.Color3, 
        ImageTransparency = l_Emphasis_0.Transparency, 
        LayoutOrder = v36.LayoutOrder, 
        Rotation = v36.Rotation, 
        AnchorPoint = v36.AnchorPoint, 
        Position = v36.Position
    });
end;
local function v83(v42) --[[ Line: 169 ]] --[[ Name: CollectionHeader_Legacy ]]
    -- upvalues: v3 (copy), v29 (copy), v2 (copy), l_usePreferredInput_0 (copy), v19 (copy), v16 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_GetTextSize_0 (copy), v26 (copy), v18 (copy), l_FFlagEnableChartsSubtitleLink_0 (copy), v41 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy), v27 (copy), v35 (copy)
    local v43 = v3.Dictionary.join(v29, v42);
    local v44, v45 = v2.useBinding(0);
    local v47 = v2.useCallback(function(v46) --[[ Line: 172 ]]
        -- upvalues: v45 (copy)
        v45(v46.AbsoluteSize.X);
    end, {});
    local v48 = l_usePreferredInput_0();
    local l_hideButton_0 = v43.hideButton;
    local l_shouldUseGridPageLayout_legacy_0 = v43.shouldUseGridPageLayout_legacy;
    local v51 = if l_hideButton_0 then v19.None else if v48 == v16.Input.Directional then v19.None else if l_shouldUseGridPageLayout_legacy_0 then v19.TextButton else v19.Arrow;
    l_hideButton_0 = l_useDesignTokens_0();
    l_shouldUseGridPageLayout_legacy_0 = l_hideButton_0.Semantic.Typography.Header;
    local v52 = v43.titleColor or l_hideButton_0.Semantic.Color.Text.Emphasis;
    local l_CaptionBody_0 = l_hideButton_0.Semantic.Typography.CaptionBody;
    local v54 = 17.64 * l_hideButton_0.Global.Stroke_100;
    local v55 = v43.subtitleColor or l_hideButton_0.Semantic.Color.Text.Default;
    local l_Space_25_0 = l_hideButton_0.Global.Space_25;
    local l_Space_100_0 = l_hideButton_0.Global.Space_100;
    local l_Space_150_0 = l_hideButton_0.Global.Space_150;
    local l_Space_300_0 = l_hideButton_0.Global.Space_300;
    local l_CaptionHeader_0 = l_hideButton_0.Semantic.Typography.CaptionHeader;
    local l_Size_200_1 = l_hideButton_0.Global.Size_200;
    local v62 = v51 == v19.Arrow and (v43.tooltipInfoText or false);
    local v63 = false;
    if v51 == v19.TextButton then
        v63 = v43.onActivate;
    end;
    local v64 = v51 ~= v19.Arrow and (v43.tooltipInfoText or false);
    local v65 = false;
    if v51 == v19.Arrow then
        v65 = v43.onActivate;
    end;
    local v66 = l_useLocalization_0({
        seeAll = "Feature.Home.ActionSeeAll"
    });
    local v67 = v43.buttonText or v66.seeAll;
    local v69 = v2.useMemo(function() --[[ Line: 211 ]]
        -- upvalues: v63 (copy), l_GetTextSize_0 (ref), v67 (copy), l_CaptionHeader_0 (copy), v26 (ref), l_hideButton_0 (copy)
        if not v63 then
            return UDim2.new();
        else
            local v68 = l_GetTextSize_0(v67, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, v26);
            return UDim2.fromOffset(v68.X + l_hideButton_0.Global.Space_100 * 2, l_hideButton_0.Global.Size_350);
        end;
    end, {
        v63
    });
    local v70 = if v63 then v69.Width.Offset + l_Space_150_0 else if v65 then l_Size_200_1 else 0;
    local v71 = if v64 then l_Space_300_0 else if v62 then l_Space_300_0 + l_Space_150_0 else 0;
    local v72 = false;
    if v43.subtitle ~= nil then
        v72 = v43.subtitle ~= "";
    end;
    local v73, v74 = v18(v43.subtitle);
    local l_Size_125_0 = l_hideButton_0.Global.Size_125;
    local v76 = if v73 then l_Size_125_0 else 0;
    local v77 = if v63 then v70 else if v62 then v71 else 0;
    local v78 = if l_FFlagEnableChartsSubtitleLink_0 and v43.onActivateSubtitle then v43.onActivateSubtitle else v43.onActivate;
    if l_FFlagEnableChartsSubtitleLink_0 and v43.onActivateSubtitle then
        v73 = true;
    end;
    return v2.createElement("Frame", {
        AutomaticSize = v43.AutomaticSize, 
        Size = v43.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v43.LayoutOrder, 
        ZIndex = v43.ZIndex, 
        [v2.Change.AbsoluteSize] = v47
    }, {
        LeftContentFrame = v2.createElement("TextButton", {
            Text = "", 
            Size = UDim2.new(1, -v77, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = v43.onActivate, 
            Active = v65 and v43.onActivate and true or false, 
            Selectable = v65 and v43.onActivate and true or false
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_Space_25_0), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TitleContainer = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, l_Space_100_0), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Title = if typeof(v43.title) == "string" then v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = v43.title, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Font = l_shouldUseGridPageLayout_legacy_0.Font, 
                    TextSize = l_shouldUseGridPageLayout_legacy_0.FontSize, 
                    TextTransparency = v52.Transparency, 
                    TextColor3 = v52.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v44:map(function(v79) --[[ Line: 304 ]]
                            -- upvalues: v70 (copy), v71 (copy)
                            local v80 = v79 - v70 - v71;
                            if v80 > 0 then
                                return Vector2.new(v80, 1e999);
                            else
                                return nil;
                            end;
                        end)
                    })
                }) else if typeof(v43.title) == "function" then v43.title() else nil, 
                SeeAllButton = v65 and v2.createElement(v41, {
                    LayoutOrder = 2, 
                    buttonSize = l_Size_200_1
                }) or nil, 
                IconWithTooltip = v64 and v2.createElement(l_IconWithTooltip_0, {
                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                    hoverText = v43.tooltipInfoText, 
                    triggerPointName = "IconWithTooltip", 
                    onActivateTooltip = v43.onActivateInfoIcon, 
                    supportVR = v43.tooltipSupportsVR, 
                    supportTenFootUi = v43.tooltipSupportsTenFootUi, 
                    size = UDim2.new(0, l_Space_300_0, 0, l_Space_300_0), 
                    layoutOrder = 4
                }) or nil
            }), 
            SubtitleFrame = v72 and v2.createElement("TextButton", {
                LayoutOrder = 2, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                [v2.Event.Activated] = v78, 
                Active = v73 and v78 and true or false, 
                Selectable = v73 and v78 and true or false
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, l_hideButton_0.Global.Size_25), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Subtitle = v2.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Text = v74, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Font = l_CaptionBody_0.Font, 
                    TextSize = v54, 
                    TextTransparency = v52.Transparency, 
                    TextColor3 = v55.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    RichText = v73
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v44:map(function(v81) --[[ Line: 366 ]]
                            -- upvalues: v76 (copy)
                            local v82 = v81 - v76;
                            if v82 > 0 then
                                return Vector2.new(v82, 1e999);
                            else
                                return nil;
                            end;
                        end)
                    })
                }), 
                SubtitleLinkArrow = not (not v73 or l_FFlagEnableChartsSubtitleLink_0 and v65) and v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(v76, v76), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true
                }, {
                    Icon = v2.createElement(v41, {
                        image = v27, 
                        Size = UDim2.new(1, l_hideButton_0.Global.Size_25, 1, l_hideButton_0.Global.Size_25), 
                        Rotation = 90, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) or nil
            }) or nil
        }), 
        IconWithTooltip = v62 and v2.createElement(l_IconWithTooltip_0, {
            tooltipOrientation = l_TooltipOrientation_0.Bottom, 
            hoverText = v43.tooltipInfoText, 
            triggerPointName = "IconWithTooltip", 
            onActivateTooltip = v43.onActivateInfoIcon, 
            supportVR = v43.tooltipSupportsVR, 
            supportTenFootUi = v43.tooltipSupportsTenFootUi, 
            size = UDim2.new(0, l_Space_300_0, 0, l_Space_300_0), 
            position = if v72 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0), 
            anchorPoint = if v72 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
        }) or nil, 
        SeeAllButton = v63 and v2.createElement(v35, {
            size = v69, 
            position = if v72 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0), 
            anchorPoint = if v72 then Vector2.new(1, 0) else Vector2.new(1, 0.5), 
            onActivate = v43.onActivate, 
            buttonText = v67, 
            buttonFont = l_CaptionHeader_0
        }) or nil
    });
end;
local function v116(v84) --[[ Line: 421 ]] --[[ Name: CollectionHeader ]]
    -- upvalues: v3 (copy), v29 (copy), v2 (copy), l_usePreferredInput_0 (copy), l_useDesignTokens_0 (copy), v16 (copy), v18 (copy), v25 (copy), v41 (copy), v28 (copy), v27 (copy), l_IconWithTooltip_0 (copy), l_TooltipOrientation_0 (copy)
    local v85 = v3.Dictionary.join(v29, v84);
    local v86, v87 = v2.useBinding(0);
    local v89 = v2.useCallback(function(v88) --[[ Line: 425 ]]
        -- upvalues: v87 (copy)
        v87(v88.AbsoluteSize.X);
    end, {});
    local v90 = l_usePreferredInput_0();
    local v91 = l_useDesignTokens_0();
    local l_Header_0 = v91.Semantic.Typography.Header;
    local v93 = v85.titleColor or v91.Semantic.Color.Text.Emphasis;
    local l_CaptionBody_1 = v91.Semantic.Typography.CaptionBody;
    local v95 = 17.64 * v91.Global.Stroke_100;
    local v96 = v85.subtitleColor or v91.Semantic.Color.Text.Default;
    local l_Space_25_1 = v91.Global.Space_25;
    local l_Space_150_1 = v91.Global.Space_150;
    local v99 = not v85.hideButton and v90 ~= v16.Input.Directional and v85.onActivate and true or false;
    local l_Size_350_0 = v91.Global.Size_350;
    local l_Size_300_0 = v91.Global.Size_300;
    local v102 = v85.tooltipInfoText ~= nil;
    local v103 = if v99 then l_Size_300_0 else 0;
    local v104 = if v102 then l_Size_350_0 + l_Space_150_1 else 0;
    local v105 = if v102 then v104 else 0;
    local v106 = false;
    if v85.subtitle ~= nil then
        v106 = v85.subtitle ~= "";
    end;
    local v107, v108 = v18(v85.subtitle);
    local v109 = if v25 and v85.onActivateSubtitle then v85.onActivateSubtitle else v85.onActivate;
    if v25 and v85.onActivateSubtitle then
        v107 = true;
    end;
    local l_Size_125_1 = v91.Global.Size_125;
    local v111 = if v107 then l_Size_125_1 else 0;
    return v2.createElement("Frame", {
        AutomaticSize = v85.AutomaticSize, 
        Size = v85.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v85.LayoutOrder, 
        ZIndex = v85.ZIndex, 
        [v2.Change.AbsoluteSize] = v89
    }, {
        LeftContentFrame = v2.createElement("TextButton", {
            Text = "", 
            Size = UDim2.new(1, -v105, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = v85.onActivate, 
            Active = v99, 
            Selectable = v99
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_Space_25_1), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TitleContainer = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 0), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Title = if typeof(v85.title) == "string" then v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = v85.title, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Font = l_Header_0.Font, 
                    TextSize = l_Header_0.FontSize, 
                    TextTransparency = v93.Transparency, 
                    TextColor3 = v93.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v86:map(function(v112) --[[ Line: 538 ]]
                            -- upvalues: v103 (copy), v104 (copy)
                            local v113 = v112 - v103 - v104;
                            if v113 > 0 then
                                return Vector2.new(v113, 1e999);
                            else
                                return nil;
                            end;
                        end)
                    })
                }) else if typeof(v85.title) == "function" then v85.title() else nil, 
                SeeAllButton = v99 and v2.createElement(v41, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(l_Size_300_0, l_Size_300_0), 
                    image = v28
                }) or nil
            }), 
            SubtitleFrame = v106 and v2.createElement("TextButton", {
                LayoutOrder = 2, 
                Text = "", 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                [v2.Event.Activated] = if v25 then v109 else v85.onActivate, 
                Active = v107 and (if v25 then v109 else v85.onActivate) and true or false, 
                Selectable = v107 and (if v25 then v109 else v85.onActivate) and true or false
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v91.Global.Size_25), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Subtitle = v2.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Text = v108, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    Font = l_CaptionBody_1.Font, 
                    TextSize = v95, 
                    TextTransparency = v93.Transparency, 
                    TextColor3 = v96.Color3, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    RichText = v107
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v86:map(function(v114) --[[ Line: 599 ]]
                            -- upvalues: v111 (copy)
                            local v115 = v114 - v111;
                            if v115 > 0 then
                                return Vector2.new(v115, 1e999);
                            else
                                return nil;
                            end;
                        end)
                    })
                }), 
                SubtitleLinkArrow = not (not v107 or v25 and v99) and v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(v111, v111), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true
                }, {
                    Icon = v2.createElement(v41, {
                        image = v27, 
                        Size = UDim2.new(1, v91.Global.Size_25, 1, v91.Global.Size_25), 
                        Rotation = 90, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) or nil
            }) or nil
        }), 
        IconWithTooltip = v102 and v2.createElement(l_IconWithTooltip_0, {
            tooltipOrientation = l_TooltipOrientation_0.Bottom, 
            hoverText = v85.tooltipInfoText, 
            triggerPointName = "IconWithTooltip", 
            onActivateTooltip = v85.onActivateInfoIcon, 
            supportVR = v85.tooltipSupportsVR, 
            supportTenFootUi = v85.tooltipSupportsTenFootUi, 
            size = UDim2.new(0, l_Size_350_0, 0, l_Size_350_0), 
            position = if v106 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0), 
            anchorPoint = if v106 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
        }) or nil
    });
end;
return v2.memo(function(v117) --[[ Line: 644 ]] --[[ Name: CollectionHeaderSelector ]]
    -- upvalues: l_FFlagLuaAppUpdateCollectionHeader_0 (copy), l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 (copy), v20 (copy), v2 (copy), v116 (copy), v83 (copy)
    if l_FFlagLuaAppUpdateCollectionHeader_0 or l_FFlagLuaAppScrollableDesktopCarouselsIXP_0 and v20.getIsUpdatedHeaderEnabled() then
        return v2.createElement(v116, v117);
    else
        return v2.createElement(v83, v117);
    end;
end);