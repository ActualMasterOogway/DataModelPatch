local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local _ = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Images_0 = v2.App.ImageSet.Images;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_1 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_Parent_0 = script.Parent.Parent.Parent;
local v16 = require(l_Parent_0.Resources.Assets);
local v17 = require(l_Parent_0.Dependencies);
local v18 = require(l_Parent_0.Components.ReportAnything.RestartScreenshotDialog);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v20 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v21 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v22 = require(v17.Divider);
local function v29(v23) --[[ Line: 47 ]] --[[ Name: ScreenshotReviewDialogSmallPortraitModeHeaderRight ]]
    -- upvalues: v3 (copy), v20 (copy), l_Button_0 (copy), l_ButtonType_1 (copy), l_StandardButtonSize_0 (copy)
    local v24, v25 = v3.useState(0);
    local v27 = v3.useCallback(function(v26) --[[ Line: 49 ]]
        -- upvalues: v25 (copy)
        v25(v26.AbsoluteSize.X);
    end, {
        v25
    });
    local v28 = v3.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v23 (copy)
        v23.setShowRestartDialog(true);
    end, {
        v23.setShowRestartDialog
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Text = v3.createElement("TextLabel", {
            LayoutOrder = -1, 
            Text = v20:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
            Font = v23.font.Header2.Font, 
            TextColor3 = v23.theme.TextEmphasis.Color, 
            TextTransparency = v23.theme.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(0, v23.viewportWidth - v24 - 50, 1, 0), 
            BackgroundTransparency = 1
        }), 
        RetakeButton = v3.createElement(l_Button_0, {
            buttonType = l_ButtonType_1.Secondary, 
            text = v20:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v28, 
            [v3.Change.AbsoluteSize] = v27
        })
    });
end;
return function(v30) --[[ Line: 93 ]] --[[ Name: ScreenshotReviewDialog ]]
    -- upvalues: v3 (copy), v21 (copy), l_useStyle_0 (copy), v18 (copy), l_ImageSetButton_0 (copy), v16 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v29 (copy), l_Button_0 (copy), l_ButtonType_1 (copy), v20 (copy), l_StandardButtonSize_0 (copy), v22 (copy), l_ButtonStack_0 (copy)
    v3.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v30 (copy)
        if v30.reportAnythingAnalytics then
            v30.reportAnythingAnalytics.incrementAnnotationOptionSeen();
        end;
    end, {});
    local v31 = 60;
    if v21() and v30.isSmallPortraitMode then
        v31 = 104;
    end;
    local v32, v33 = v3.useState(false);
    local v34 = l_useStyle_0();
    local l_Theme_0 = v34.Theme;
    local l_Font_0 = v34.Font;
    local v37 = if v30.viewportHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0);
    return v3.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 10, 
        Text = "", 
        [v3.Event.Activated] = v30.onBack
    }, {
        Container = v3.createElement("Frame", {
            Size = if v30.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else v37, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = 0, 
            ZIndex = 10
        }, {
            RestartDialog = v32 and v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                DialogBody = v3.createElement(v18, {
                    ZIndex = 3, 
                    isSmallPortraitMode = v30.isSmallPortraitMode, 
                    onCancel = function() --[[ Line: 137 ]] --[[ Name: onCancel ]]
                        -- upvalues: v33 (copy)
                        v33(false);
                    end, 
                    onRestart = v30.onRestart
                })
            }), 
            RestartDialogMask = v32 and v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 0.2, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                Active = true, 
                AutoButtonColor = false, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v16.Images.RoundedRect.Image, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = 1, 
                ScaleType = v16.Images.RoundedRect.ScaleType, 
                SliceCenter = v16.Images.RoundedRect.SliceCenter
            }, {}), 
            ScreenshotDialog = v3.createElement(l_ImageSetButton_0, {
                Active = true, 
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v16.Images.RoundedRect.Image, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = v16.Images.RoundedRect.ScaleType, 
                SliceCenter = v16.Images.RoundedRect.SliceCenter
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HeaderAndContent = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -v31), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Header = v3.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = Color3.fromHex("#4F545F"), 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 48)
                    }, {
                        Bar = v3.createElement(l_HeaderBar_0, {
                            backgroundTransparency = 1, 
                            barHeight = 48, 
                            margin = 12, 
                            renderLeft = function() --[[ Line: 195 ]] --[[ Name: renderLeft ]]
                                -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v30 (copy)
                                return v3.createElement(l_IconButton_0, {
                                    iconSize = l_IconSize_0.Medium, 
                                    icon = l_Images_0["icons/navigation/pushBack"], 
                                    onActivated = function() --[[ Line: 199 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v30 (ref)
                                        v30.onBack();
                                    end
                                });
                            end, 
                            renderRight = function() --[[ Line: 205 ]] --[[ Name: renderRight ]]
                                -- upvalues: v21 (ref), v30 (copy), v3 (ref), v29 (ref), v33 (copy), l_Font_0 (copy), l_Theme_0 (copy), l_Button_0 (ref), l_ButtonType_1 (ref), v20 (ref), l_StandardButtonSize_0 (ref)
                                if v21() and v30.isSmallPortraitMode then
                                    return v3.createElement(v29, {
                                        setShowRestartDialog = v33, 
                                        font = l_Font_0, 
                                        theme = l_Theme_0, 
                                        viewportWidth = v30.viewportWidth
                                    });
                                else
                                    local v38 = v30.isSmallPortraitMode and 72 or 120;
                                    local v39 = v30.isSmallPortraitMode and 28 or 36;
                                    return v3.createElement(l_Button_0, {
                                        buttonType = l_ButtonType_1.Secondary, 
                                        size = if v21() then nil else UDim2.new(0, v38, 0, v39), 
                                        text = if v21() then v20:FormatByKey("Feature.ReportAbuse.Action.Retake") else "Retake", 
                                        fitContent = v21(), 
                                        standardSize = if v21() then l_StandardButtonSize_0.XSmall else nil, 
                                        onActivated = function() --[[ Line: 229 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v33 (ref)
                                            v33(true);
                                        end
                                    });
                                end;
                            end, 
                            title = if v21() then if v30.isSmallPortraitMode then nil else v20:FormatByKey("Feature.SettingsHub.Label.SceneCaptured") else "Scene Captured", 
                            isSecondary = v30.isSmallPortraitMode
                        })
                    }), 
                    Divider = v3.createElement(v22, {
                        LayoutOrder = 2
                    }), 
                    ScreenshotBody = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 1, -60), 
                        ZIndex = 10
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16)
                        }), 
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        ScreenshotContainer = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -32), 
                            BackgroundTransparency = 2, 
                            LayoutOrder = 1
                        }, {
                            Padding = v3.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 12), 
                                PaddingBottom = UDim.new(0, 12), 
                                PaddingLeft = UDim.new(0, 16), 
                                PaddingRight = UDim.new(0, 16)
                            }), 
                            Screenshot = v3.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, 0), 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                BorderSizePixel = 2, 
                                BorderMode = Enum.BorderMode.Inset, 
                                BorderColor3 = Color3.fromRGB(255, 255, 255), 
                                LayoutOrder = 1
                            }, {
                                UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = v30.imageAspectRatio
                                }), 
                                ScreenshotImage = v3.createElement(l_ImageSetButton_0, {
                                    Active = true, 
                                    Size = UDim2.fromScale(1, 1), 
                                    Image = v30.screenshot, 
                                    ZIndex = 1, 
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    Position = UDim2.fromScale(0.5, 0.5), 
                                    BackgroundTransparency = 1, 
                                    ScaleType = Enum.ScaleType.Fit, 
                                    SliceCenter = v16.Images.RoundedRect.SliceCenter, 
                                    [v3.Event.Activated] = function() --[[ Line: 292 ]]
                                        -- upvalues: v30 (copy)
                                        v30.onNextPage();
                                    end
                                })
                            })
                        }), 
                        Description = v3.createElement("TextLabel", {
                            Text = if v21() then v20:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene") else "If the problem is not in this scene, you can \226\128\156Retake\226\128\157\nthe screenshot.", 
                            Font = l_Font_0.Header1.Font, 
                            LayoutOrder = 2, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v30.isSmallPortraitMode and 12 or 20, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextWrapped = v21(), 
                            Size = if v21() then UDim2.new(1, -24, 0, v30.isSmallPortraitMode and 24 or 40) else UDim2.new(1, 0, 0, 20), 
                            BackgroundTransparency = 1
                        })
                    })
                }), 
                Footer = v3.createElement("Frame", {
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(1, 0, 0, v31), 
                    BackgroundColor3 = Color3.fromHex("#4F545F"), 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, 1), 
                    LayoutOrder = 4
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    Container = v3.createElement("Frame", {
                        Size = if v21() and v30.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v30.isSmallPortraitMode and 400 or 612, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 12), 
                            PaddingBottom = UDim.new(0, 12), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        ActionButtons = v3.createElement(l_ButtonStack_0, {
                            forcedFillDirection = if v21() and v30.isSmallPortraitMode then Enum.FillDirection.Vertical else nil, 
                            marginBetween = 8, 
                            buttons = {
                                {
                                    buttonType = l_ButtonType_1.Secondary, 
                                    props = {
                                        onActivated = v30.onSkip, 
                                        text = if v21() then v20:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot") else "Attach Screenshot"
                                    }
                                }, 
                                {
                                    buttonType = l_ButtonType_1.PrimarySystem, 
                                    props = {
                                        onActivated = function() --[[ Line: 362 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v30 (copy)
                                            v30.onNextPage();
                                        end, 
                                        text = if v21() then v20:FormatByKey("Feature.ReportAbuse.Action.HighlightScene") else "Highlight Scene"
                                    }
                                }
                            }
                        })
                    })
                })
            })
        })
    });
end;