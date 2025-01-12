local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.ReportAnything.Resources.Constants);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Button_0 = v3.App.Button.Button;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_Parent_0 = script.Parent.Parent;
local v16 = require(l_Parent_0.Resources.Assets);
local v17 = require(l_Parent_0.Components.Divider);
local v18 = require(l_Parent_0.Components.RestartScreenshotDialog);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v22 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationCoreScriptsWrapper_0 = v22.FocusNavigationCoreScriptsWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v22.FocusNavigableSurfaceIdentifierEnum;
local v25 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function v32(v26) --[[ Line: 60 ]] --[[ Name: ScreenshotReviewDialogSmallPortraitModeHeaderRight ]]
    -- upvalues: v4 (copy), v25 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v27, v28 = v4.useState(0);
    local v30 = v4.useCallback(function(v29) --[[ Line: 62 ]]
        -- upvalues: v28 (copy)
        v28(v29.AbsoluteSize.X);
    end, {
        v28
    });
    local v31 = v4.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v26 (copy)
        v26.setShowRestartDialog(true);
    end, {
        v26.setShowRestartDialog
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Text = v4.createElement("TextLabel", {
            LayoutOrder = -1, 
            Text = v25:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
            Font = v26.font.Header2.Font, 
            TextColor3 = v26.theme.TextEmphasis.Color, 
            TextTransparency = v26.theme.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(0, v26.viewportWidth - v27 - 50, 1, 0), 
            BackgroundTransparency = 1
        }), 
        RetakeButton = v4.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            text = v25:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v31, 
            [v4.Change.AbsoluteSize] = v30
        })
    });
end;
return function(v33) --[[ Line: 106 ]] --[[ Name: ScreenshotReviewDialog ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v25 (copy), v4 (copy), l_useStyle_0 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), v2 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v18 (copy), l_ImageSetButton_0 (copy), v16 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v32 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), v17 (copy), l_ButtonStack_0 (copy)
    local v34 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    if not v25 then
        return nil;
    else
        local v35 = 60;
        if v33.isSmallPortraitMode then
            v35 = 104;
        end;
        local v36 = v4.useCallback(function() --[[ Line: 118 ]]
            -- upvalues: v33 (copy)
            v33.reportAnythingAnalytics.incrementPreviewBack();
            v33.onBack();
        end, {
            v33.onBack, 
            v33.reportAnythingAnalytics
        });
        local v37 = v4.useCallback(function() --[[ Line: 123 ]]
            -- upvalues: v33 (copy)
            v33.reportAnythingAnalytics.incrementPreviewAttach();
            v33.onSkip();
        end, {
            v33.onSkip, 
            v33.reportAnythingAnalytics
        });
        local v38, v39 = v4.useState(false);
        local v40 = v4.useCallback(function() --[[ Line: 130 ]]
            -- upvalues: v33 (copy), v39 (copy)
            v33.reportAnythingAnalytics.incrementRetake();
            v39(true);
        end, {
            v39, 
            v33.reportAnythingAnalytics
        });
        local v41 = v4.useCallback(function() --[[ Line: 135 ]]
            -- upvalues: v33 (copy)
            v33.reportAnythingAnalytics.setRetakeAbandon();
            v33.onRestart();
        end, {
            v33.onRestart, 
            v33.reportAnythingAnalytics
        });
        local v42 = v4.useCallback(function() --[[ Line: 140 ]]
            -- upvalues: v33 (copy)
            v33.reportAnythingAnalytics.incrementHighlightScene();
            v33.onNextPage();
        end, {
            v33.onNextPage, 
            v33.reportAnythingAnalytics
        });
        local v43 = l_useStyle_0();
        local l_Theme_0 = v43.Theme;
        local l_Font_0 = v43.Font;
        local v46 = if v33.viewportHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0);
        return v4.createElement("TextButton", {
            Selectable = false, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 10, 
            Text = "", 
            [v4.Event.Activated] = v36
        }, {
            Container = v4.createElement("Frame", {
                Size = if v33.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else v46, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = 0, 
                ZIndex = 10
            }, {
                RestartDialog = v38 and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
                        selectionGroupName = v2.RestartScreenshotDialogRootName, 
                        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
                    }, {
                        DialogBody = v4.createElement(v18, {
                            ZIndex = 3, 
                            isSmallPortraitMode = v33.isSmallPortraitMode, 
                            onCancel = function() --[[ Line: 182 ]] --[[ Name: onCancel ]]
                                -- upvalues: v39 (copy)
                                v39(false);
                            end, 
                            onRestart = v41
                        })
                    })
                }), 
                RestartDialogMask = v38 and v4.createElement(l_ImageSetButton_0, {
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
                ScreenshotDialog = v4.createElement(l_ImageSetButton_0, {
                    Active = true, 
                    Selectable = false, 
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
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    HeaderAndContent = v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -v35), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Header = v4.createElement("Frame", {
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = Color3.fromHex("#4F545F"), 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 48)
                        }, {
                            Bar = v4.createElement(l_HeaderBar_0, {
                                backgroundTransparency = 1, 
                                barHeight = 48, 
                                margin = 12, 
                                renderLeft = function() --[[ Line: 242 ]] --[[ Name: renderLeft ]]
                                    -- upvalues: v4 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v36 (copy)
                                    return v4.createElement(l_IconButton_0, {
                                        iconSize = l_IconSize_0.Medium, 
                                        icon = l_Images_0["icons/navigation/pushBack"], 
                                        onActivated = v36
                                    });
                                end, 
                                renderRight = function() --[[ Line: 250 ]] --[[ Name: renderRight ]]
                                    -- upvalues: v33 (copy), v4 (ref), v32 (ref), v40 (copy), l_Font_0 (copy), l_Theme_0 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v25 (ref), l_StandardButtonSize_0 (ref)
                                    if v33.isSmallPortraitMode then
                                        return v4.createElement(v32, {
                                            onActivated = v40, 
                                            font = l_Font_0, 
                                            theme = l_Theme_0, 
                                            viewportWidth = v33.viewportWidth
                                        });
                                    else
                                        return v4.createElement(l_Button_0, {
                                            buttonType = l_ButtonType_0.Secondary, 
                                            text = v25:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
                                            fitContent = true, 
                                            standardSize = l_StandardButtonSize_0.XSmall, 
                                            onActivated = v40
                                        });
                                    end;
                                end, 
                                title = if v33.isSmallPortraitMode then nil else v25:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
                                isSecondary = v33.isSmallPortraitMode
                            })
                        }), 
                        Divider = v4.createElement(v17, {
                            LayoutOrder = 2
                        }), 
                        ScreenshotBody = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            Size = UDim2.new(1, 0, 1, -60), 
                            ZIndex = 10
                        }, {
                            Padding = v4.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 16)
                            }), 
                            Layout = v4.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            ScreenshotContainer = v4.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, -32), 
                                BackgroundTransparency = 2, 
                                LayoutOrder = 1
                            }, {
                                Padding = v4.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, 12), 
                                    PaddingBottom = UDim.new(0, 12), 
                                    PaddingLeft = UDim.new(0, 16), 
                                    PaddingRight = UDim.new(0, 16)
                                }), 
                                Screenshot = v4.createElement("Frame", {
                                    Size = UDim2.new(1, 0, 1, 0), 
                                    Position = UDim2.fromScale(0.5, 0.5), 
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    BorderSizePixel = 2, 
                                    BorderMode = Enum.BorderMode.Inset, 
                                    BorderColor3 = Color3.fromRGB(255, 255, 255), 
                                    LayoutOrder = 1
                                }, {
                                    UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                                        AspectRatio = v33.imageAspectRatio
                                    }), 
                                    ScreenshotImage = v4.createElement(l_ImageSetButton_0, {
                                        Active = true, 
                                        Selectable = not v34 or false, 
                                        Size = UDim2.fromScale(1, 1), 
                                        Image = v33.screenshot, 
                                        ZIndex = 1, 
                                        AnchorPoint = Vector2.new(0.5, 0.5), 
                                        Position = UDim2.fromScale(0.5, 0.5), 
                                        BackgroundTransparency = 1, 
                                        ScaleType = Enum.ScaleType.Fit, 
                                        SliceCenter = v16.Images.RoundedRect.SliceCenter, 
                                        [v4.Event.Activated] = v42
                                    })
                                })
                            }), 
                            Description = v4.createElement("TextLabel", {
                                Text = v25:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene"), 
                                Font = l_Font_0.Header1.Font, 
                                LayoutOrder = 2, 
                                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                                TextSize = v33.isSmallPortraitMode and 12 or 20, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextWrapped = true, 
                                Size = UDim2.new(1, -24, 0, v33.isSmallPortraitMode and 24 or 40), 
                                BackgroundTransparency = 1
                            })
                        })
                    }), 
                    Footer = v4.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.new(1, 0, 0, v35), 
                        BackgroundColor3 = Color3.fromHex("#4F545F"), 
                        AnchorPoint = Vector2.new(0, 1), 
                        Position = UDim2.fromScale(0, 1), 
                        LayoutOrder = 4
                    }, {
                        Layout = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        Container = v4.createElement("Frame", {
                            Size = if v33.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v33.isSmallPortraitMode and 400 or 612, 1, 0), 
                            BackgroundTransparency = 1
                        }, {
                            Padding = v4.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 12), 
                                PaddingBottom = UDim.new(0, 12), 
                                PaddingLeft = UDim.new(0, 16), 
                                PaddingRight = UDim.new(0, 16)
                            }), 
                            ActionButtons = v4.createElement(l_ButtonStack_0, {
                                forcedFillDirection = if v33.isSmallPortraitMode then Enum.FillDirection.Vertical else nil, 
                                marginBetween = 8, 
                                buttons = {
                                    {
                                        buttonType = l_ButtonType_0.Secondary, 
                                        props = {
                                            onActivated = v37, 
                                            text = v25:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
                                        }
                                    }, 
                                    if v34 then nil else {
                                        buttonType = l_ButtonType_0.PrimarySystem, 
                                        props = {
                                            onActivated = v42, 
                                            text = v25:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
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
end;