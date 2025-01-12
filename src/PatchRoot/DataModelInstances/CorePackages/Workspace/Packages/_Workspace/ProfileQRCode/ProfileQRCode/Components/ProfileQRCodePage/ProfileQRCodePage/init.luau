local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v6 = require(l_Parent_0.ProfileShareLinks);
local l_useProfileShareLink_0 = v6.Hooks.useProfileShareLink;
local l_ProfileSharePolicyEnum_0 = v6.Enums.ProfileSharePolicyEnum;
local l_Button_0 = v3.App.Button.Button;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_Images_0 = v3.App.ImageSet.Images;
local v15 = require(l_script_FirstAncestor_0.Components.ProfileQRCodeTopElements);
local v16 = require(l_script_FirstAncestor_0.Components.QRCodeView);
local v17 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useIsWideMode_0 = require(l_Parent_0.SocialCommon).Hooks.useIsWideMode;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v21 = game:DefineFastFlag("ProfileQRCodePageScrollable", false);
local v22 = Color3.new(1, 1, 1);
return function(v23) --[[ Line: 56 ]]
    -- upvalues: l_useLocalization_0 (copy), v17 (copy), v2 (copy), l_useIsWideMode_0 (copy), l_useStyle_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_Images_0 (copy), v15 (copy), v21 (copy), l_VerticalScrollView_0 (copy), v22 (copy), v16 (copy), l_StyledTextLabel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v24 = l_useLocalization_0({
        description = v17.Description, 
        shareProfileLink = v17.ShareProfileLink, 
        copyProfileLink = v17.CopyProfileLink
    });
    local v25, v26 = v2.useState(false);
    local v27 = l_useIsWideMode_0();
    local v28 = l_useStyle_0();
    local v29 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileQRCode
    });
    local v30 = false;
    if v29.policy ~= l_ProfileSharePolicyEnum_0.Disabled then
        v30 = v29.hasLoaded;
    end;
    local v31 = nil;
    local v32 = nil;
    if v29.policy == l_ProfileSharePolicyEnum_0.Share then
        v31 = v24.shareProfileLink;
        v32 = l_Images_0["icons/actions/share"];
    elseif v29.policy == l_ProfileSharePolicyEnum_0.Copy then
        v31 = v24.copyProfileLink;
        v32 = l_Images_0["icons/menu/link"];
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TopElements = v2.createElement(v15, {
            appStorageService = v23.appStorageService, 
            onClose = v23.onClose, 
            openQrCodeScanner = v23.openQrCodeScanner, 
            robloxEventReceiver = v23.robloxEventReceiver
        }), 
        VerticalScrollView = if v21 then v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            size = if v27 then nil else UDim2.new(1, 0, 1, -24), 
            canvasSizeY = UDim.new(), 
            position = UDim2.new(0, 0, 0, 56)
        }, {
            GradientBackground = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v22, 
                BackgroundTransparency = v27 and 0.7 or 1, 
                Position = UDim2.fromScale(0, 0), 
                Size = if v27 then UDim2.fromScale(0.6, 1) else UDim2.fromScale(1, 1), 
                BorderSizePixel = 0, 
                [v2.Change.AbsoluteSize] = v2.useCallback(function(v33) --[[ Line: 105 ]]
                    -- upvalues: v26 (copy)
                    if v33.AbsoluteSize.Y >= 450 then
                        v26(true);
                        return;
                    else
                        v26(false);
                        return;
                    end;
                end)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                Content = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Size = if v27 then UDim2.new(1, 0, 1, -56) else UDim2.new(1, 0, 0.5, 0), 
                    BorderSizePixel = 0
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    QRCodeView = v2.createElement(v16, {
                        layoutOrder = 1, 
                        isSmallScreen = v25
                    }), 
                    Spacer1 = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(0, v25 and 12 or 24), 
                        LayoutOrder = 2
                    }), 
                    Description = v2.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 3, 
                        text = v24.description, 
                        fontStyle = v28.Font.CaptionBody, 
                        lineHeight = 1, 
                        colorStyle = v28.Theme.TextDefault, 
                        size = UDim2.new(1, 0, 0, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        fluidSizing = false, 
                        richText = false
                    }), 
                    ProfileShareButtonContainer = if v30 then v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        UIPadding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 24), 
                            PaddingBottom = UDim.new(0, 24)
                        }), 
                        ProfileShareButton = v2.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            standardSize = l_StandardButtonSize_0.Regular, 
                            text = v31, 
                            icon = v32, 
                            maxWidth = 304, 
                            onActivated = v29.onActivated
                        })
                    }) else nil, 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, 420)
                    })
                }), 
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v28.Theme.BackgroundContrast.Color), 
                        ColorSequenceKeypoint.new(1, v28.Theme.BackgroundContrast.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.4), 
                        NumberSequenceKeypoint.new(1, 0)
                    })
                })
            })
        }) else nil, 
        GradientBackground = if v21 then nil else v2.createElement("Frame", {
            BackgroundColor3 = v22, 
            BackgroundTransparency = v27 and 0.7 or 1, 
            Position = UDim2.fromScale(0, 0), 
            Size = if v27 then UDim2.fromScale(0.6, 1) else UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            [v2.Change.AbsoluteSize] = v2.useCallback(function(v34) --[[ Line: 215 ]]
                -- upvalues: v26 (copy)
                if v34.AbsoluteSize.Y >= 450 then
                    v26(true);
                    return;
                else
                    v26(false);
                    return;
                end;
            end)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            Content = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = if v27 then UDim2.new(1, 0, 1, -56) else UDim2.new(1, 0, 0.5, 0), 
                BorderSizePixel = 0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24)
                }), 
                QRCodeView = v2.createElement(v16, {
                    layoutOrder = 1, 
                    isSmallScreen = v25
                }), 
                Spacer1 = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(0, v25 and 12 or 24), 
                    LayoutOrder = 2
                }), 
                Description = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v24.description, 
                    fontStyle = v28.Font.CaptionBody, 
                    lineHeight = 1, 
                    colorStyle = v28.Theme.TextDefault, 
                    size = UDim2.new(1, 0, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fluidSizing = false, 
                    richText = false
                }), 
                ProfileShareButtonContainer = if v30 then v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    ProfileShareButton = v2.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        standardSize = l_StandardButtonSize_0.Regular, 
                        text = v31, 
                        icon = v32, 
                        maxWidth = 304, 
                        onActivated = v29.onActivated
                    })
                }) else nil, 
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, 420)
                })
            }), 
            Gradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v28.Theme.BackgroundContrast.Color), 
                    ColorSequenceKeypoint.new(1, v28.Theme.BackgroundContrast.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.4), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;