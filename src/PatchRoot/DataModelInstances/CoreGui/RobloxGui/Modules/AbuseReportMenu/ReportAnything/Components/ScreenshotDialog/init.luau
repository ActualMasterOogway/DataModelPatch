local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_ImageSetButton_0 = v1.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Components.Divider);
local v11 = require(l_Parent_0.Components.ScreenshotHighlighter);
local v12 = require(l_Parent_0.Utility.VirtualKeyboardMonitor);
local v13 = require(l_Parent_0.Components.ScreenshotDialogPortraitModeHeader);
local v14 = require(l_Parent_0.Components.ScreenshotDialogLandscapeModeHeader);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v16 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function v18(v17) --[[ Line: 43 ]] --[[ Name: PortraitModeFooter ]]
    -- upvalues: v2 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v16 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        LayoutOrder = 4
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Container = v2.createElement("Frame", {
            Size = UDim2.new(0, 400, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 32), 
                PaddingRight = UDim.new(0, 32)
            }), 
            ActionButtons = v2.createElement(l_ButtonStack_0, {
                marginBetween = 8, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 74 ]] --[[ Name: onActivated ]]
                                -- upvalues: v17 (copy)
                                v17.finishAnnotationAction(v17.annotationPoints);
                            end, 
                            text = v16:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        })
    });
end;
return function(v19) --[[ Line: 86 ]] --[[ Name: ScreenshotDialog ]]
    -- upvalues: l_useStyle_0 (copy), v12 (copy), v2 (copy), v3 (copy), l_ImageSetButton_0 (copy), v9 (copy), v13 (copy), v14 (copy), v10 (copy), v11 (copy), v18 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v21 = v12.getInstance();
    local function v22() --[[ Line: 92 ]]
        -- upvalues: v21 (copy), v19 (copy)
        warn("OverlayActivated");
        if v21:isKeyboardJustOff() then
            return;
        else
            if v19.dismissAction then
                warn("Menu dismissed");
                v19.dismissAction();
            end;
            return;
        end;
    end;
    local v23, v24 = v2.useState(v3.Dictionary.join({}, v19.initialAnnotationPoints or {}));
    local v25, v26 = v2.useState({});
    local v27 = v2.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v24 (copy), v23 (copy)
        v24(table.clone(v23));
    end, {
        v24, 
        v23
    });
    local v28 = v2.useCallback(function() --[[ Line: 113 ]]
        -- upvalues: v19 (copy)
        v19.reportAnythingAnalytics.incrementAnnotationBack();
        v19.backAction();
    end, {
        v19.backAction, 
        v19.reportAnythingAnalytics
    });
    local v30 = v2.useCallback(function(_) --[[ Line: 118 ]]
        -- upvalues: v19 (copy), v27 (copy), v26 (copy)
        v19.reportAnythingAnalytics.incrementAnnotationPlace();
        v27();
        v26({});
    end, {
        v26, 
        v27, 
        v19.reportAnythingAnalytics
    });
    local v31 = v2.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v23 (copy), v19 (copy), v25 (copy), v27 (copy)
        if #v23 > 0 then
            v19.reportAnythingAnalytics.incrementAnnotationUndo();
            table.insert(v25, 1, v23[#v23]);
            table.remove(v23, #v23);
            v27();
        end;
    end, {
        v27, 
        v23, 
        v25, 
        v19.reportAnythingAnalytics
    });
    local v32 = v2.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v25 (copy), v19 (copy), v23 (copy), v27 (copy)
        if #v25 > 0 then
            v19.reportAnythingAnalytics.incrementAnnotationRedo();
            table.insert(v23, v25[1]);
            table.remove(v25, 1);
            v27();
        end;
    end, {
        v27, 
        v23, 
        v25, 
        v19.reportAnythingAnalytics
    });
    local v34 = v2.useCallback(function(v33) --[[ Line: 145 ]]
        -- upvalues: v19 (copy)
        v19.reportAnythingAnalytics.setAnnotationNext();
        v19.finishAnnotationAction(v33);
    end, {
        v19.finishAnnotationAction, 
        v19.reportAnythingAnalytics
    });
    local v35 = #v23 > 0;
    local v36 = #v25 > 0;
    return v2.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 10, 
        Text = "", 
        [v2.Event.Activated] = v22
    }, {
        ScreenshotDialog = v2.createElement(l_ImageSetButton_0, {
            Active = true, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = v9.Images.RoundedRect.Image, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            ScaleType = v9.Images.RoundedRect.ScaleType, 
            SliceCenter = v9.Images.RoundedRect.SliceCenter
        }, {
            HeaderAndContent = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, v19.isSmallPortraitMode and -60 or 0), 
                BackgroundTransparency = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = if v19.isSmallPortraitMode then v2.createElement(v13, {
                    titleText = v19.titleText, 
                    backAction = v28, 
                    undoAnnotationPoints = v31, 
                    redoAnnotationPoints = v32, 
                    isRedoEnabled = v36, 
                    isUndoEnabled = v35, 
                    annotationPoints = v23
                }) else v2.createElement(v14, {
                    titleText = v19.titleText, 
                    backAction = v28, 
                    finishAnnotationAction = v34, 
                    undoAnnotationPoints = v31, 
                    redoAnnotationPoints = v32, 
                    isRedoEnabled = v36, 
                    isUndoEnabled = v35, 
                    annotationPoints = v23
                }), 
                Divider = v2.createElement(v10, {
                    LayoutOrder = 2
                }), 
                ScreenshotAnnotation = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 1, -49), 
                    ZIndex = 1
                }, {
                    Container = v2.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = v19.imageAspectRatio
                        }), 
                        Padding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16), 
                            PaddingBottom = UDim.new(0, 16), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        AnnotationLayer = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BorderSizePixel = 2, 
                            BorderMode = Enum.BorderMode.Inset, 
                            BorderColor3 = Color3.fromRGB(255, 255, 255)
                        }, {
                            ScreenshotImage = v2.createElement("ImageLabel", {
                                Size = UDim2.fromScale(1, 1), 
                                Image = v19.screenshot, 
                                ZIndex = 1
                            }, {}), 
                            Highlighter = v2.createElement(v11, {
                                annotationPoints = v23, 
                                handleAnnotationPoints = v30, 
                                setAnnotationCircleRadius = v19.setAnnotationCircleRadius, 
                                setAnnotationAreaDimensions = v19.setAnnotationAreaDimensions, 
                                ZIndex = 3
                            }, {})
                        })
                    })
                })
            }), 
            Footer = if v19.isSmallPortraitMode then v2.createElement(v18, {
                finishAnnotationAction = v34, 
                annotationPoints = v23
            }) else nil
        })
    });
end;