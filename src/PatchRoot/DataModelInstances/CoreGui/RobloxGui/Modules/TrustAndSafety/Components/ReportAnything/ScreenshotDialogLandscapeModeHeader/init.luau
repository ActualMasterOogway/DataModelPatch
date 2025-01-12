local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local function _(v14) --[[ Line: 33 ]] --[[ Name: renderWrappingCenter ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy)
    return function() --[[ Line: 34 ]]
        -- upvalues: l_withStyle_0 (ref), v3 (ref), v14 (copy)
        return l_withStyle_0(function(v15) --[[ Line: 35 ]]
            -- upvalues: v3 (ref), v14 (ref)
            local l_Theme_0 = v15.Theme;
            local l_Font_0 = v15.Font;
            return v3.createElement("TextLabel", {
                Text = v14, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local function _(v19, v20, v21, v22, v23) --[[ Line: 55 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v3 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    local v24 = v22 or v23;
    return function() --[[ Line: 57 ]]
        -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v19 (copy), v24 (copy), v23 (copy), v20 (copy), v22 (copy), v21 (copy)
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v19
            }), 
            UndoButton = v24 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v23, 
                layoutOrder = 2, 
                onActivated = v20
            }), 
            RedoButton = v24 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v22, 
                layoutOrder = 3, 
                onActivated = v21
            })
        });
    end;
end;
local function _(v26, v27) --[[ Line: 92 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v3 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v6 (copy), v4 (copy)
    return function() --[[ Line: 93 ]]
        -- upvalues: v3 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), v26 (copy), v27 (copy), v6 (ref), v4 (ref)
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v3.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 108 ]] --[[ Name: onActivated ]]
                                -- upvalues: v26 (ref), v27 (ref)
                                v26(v27);
                            end, 
                            text = if v6() then v4:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
                        }
                    }
                }
            })
        });
    end;
end;
return function(v29) --[[ Line: 121 ]] --[[ Name: LandscapeModeHeader ]]
    -- upvalues: v3 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v6 (copy), v4 (copy), l_withStyle_0 (copy)
    local l_createElement_0 = v3.createElement;
    local v31 = "Frame";
    local v32 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 47), 
        ZIndex = 2
    };
    local v33 = {};
    local l_createElement_1 = v3.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v36 = {
        backgroundTransparency = 1, 
        barHeight = 48
    };
    local l_backAction_0 = v29.backAction;
    local l_undoAnnotationPoints_0 = v29.undoAnnotationPoints;
    local l_redoAnnotationPoints_0 = v29.redoAnnotationPoints;
    local l_isRedoEnabled_0 = v29.isRedoEnabled;
    local l_isUndoEnabled_0 = v29.isUndoEnabled;
    local v42 = l_isRedoEnabled_0 or l_isUndoEnabled_0;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    local l_l_undoAnnotationPoints_0_0 = l_undoAnnotationPoints_0 --[[ copy: 10 -> 16 ]];
    v36.renderLeft = function() --[[ Line: 57 ]]
        -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy), v42 (copy), l_isUndoEnabled_0 (copy), l_l_undoAnnotationPoints_0_0 (copy), l_isRedoEnabled_0 (copy), l_redoAnnotationPoints_0 (copy)
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            }), 
            UndoButton = v42 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not l_isUndoEnabled_0, 
                layoutOrder = 2, 
                onActivated = l_l_undoAnnotationPoints_0_0
            }), 
            RedoButton = v42 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not l_isRedoEnabled_0, 
                layoutOrder = 3, 
                onActivated = l_redoAnnotationPoints_0
            })
        });
    end;
    l_backAction_0 = v29.reportAction;
    l_undoAnnotationPoints_0 = v29.annotationPoints;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 17 ]];
    v36.renderRight = function() --[[ Line: 93 ]]
        -- upvalues: v3 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), l_l_backAction_0_1 (copy), l_undoAnnotationPoints_0 (copy), v6 (ref), v4 (ref)
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v3.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 108 ]] --[[ Name: onActivated ]]
                                -- upvalues: l_l_backAction_0_1 (ref), l_undoAnnotationPoints_0 (ref)
                                l_l_backAction_0_1(l_undoAnnotationPoints_0);
                            end, 
                            text = if v6() then v4:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
                        }
                    }
                }
            })
        });
    end;
    v36.title = if v6() then nil else v29.titleText;
    local v46;
    if v6() then
        l_backAction_0 = v29.titleText;
        v46 = function() --[[ Line: 34 ]]
            -- upvalues: l_withStyle_0 (ref), v3 (ref), l_backAction_0 (copy)
            return l_withStyle_0(function(v47) --[[ Line: 35 ]]
                -- upvalues: v3 (ref), l_backAction_0 (ref)
                local l_Theme_1 = v47.Theme;
                local l_Font_1 = v47.Font;
                return v3.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = l_Font_1.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
    else
        v46 = nil;
    end;
    v36.renderCenter = v46;
    v33.Bar = l_createElement_1(l_l_HeaderBar_0_0, v36);
    return l_createElement_0(v31, v32, v33);
end;