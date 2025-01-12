local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.LocalizationKeys.useLocalizedStrings);
local v7 = require(l_script_FirstAncestor_0.Common.CommentTextField);
local v8 = require(l_script_FirstAncestor_0.Common.Frame);
local v9 = require(l_script_FirstAncestor_0.Common.UIListLayout);
local v10 = require(l_script_FirstAncestor_0.Common.ReasonDropdown);
local v11 = require(l_script_FirstAncestor_0.Common.MODAL_POSITION_OFFSET);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_CloseButtonIcon_0 = v3.App.Dialog.Enum.CloseButtonIcon;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLayerCollector_0 = v3.Core.Layout.LayerCollector.useLayerCollector;
local l_View_0 = v4.View;
local l_ScrollView_0 = v4.ScrollView;
local l_ScrollBarVisibility_0 = v4.Enums.ScrollBarVisibility;
local l_Text_0 = v4.Text;
local v22 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsDispatch);
local v23 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormCommentUpdated);
local v24 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormReasonSelected);
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v26 = game:DefineFastFlag("GenericAbuseUpdateReadonlyDropdown", false);
local v27 = game:DefineFastFlag("GenericAbuseSimpleSubmitSubtext", false);
local v28 = require(l_script_FirstAncestor_0.Common.Flags).GetFFlagEnableCenterAndResizeAdReportModal();
local function _(v29, v30) --[[ Line: 64 ]] --[[ Name: getContentRightPadding ]]
    if v29.Y > v30.Y then
        return 16;
    else
        return 1;
    end;
end;
return function(v32) --[[ Line: 68 ]] --[[ Name: SubmitDialog ]]
    -- upvalues: v22 (copy), l_useStyle_0 (copy), v2 (copy), l_useLayerCollector_0 (copy), v24 (copy), v23 (copy), l_useLocalization_0 (copy), v6 (copy), l_createNextOrder_0 (copy), v10 (copy), v9 (copy), v26 (copy), l_View_0 (copy), l_Text_0 (copy), v7 (copy), l_PartialPageModal_0 (copy), v28 (copy), v11 (copy), l_ButtonType_0 (copy), l_CloseButtonIcon_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v8 (copy), l_StyledTextLabel_0 (copy), v27 (copy)
    local v33 = v22();
    local v34 = l_useStyle_0();
    local v35, v36 = v2.useState(false);
    local v37, v38 = v2.useState("");
    local v39, v40 = v2.useState("");
    local v41, v42 = v2.useState("");
    local v43 = v2.useRef(nil);
    local v44, v45 = v2.useState(Vector2.zero);
    local v46, v47 = v2.useState(Vector2.zero);
    local v48, v49 = v2.useState(0);
    local v50, v51 = v2.useState(0);
    local v52 = v2.useRef(nil);
    local v53, v54 = v2.useState(0);
    local v55 = v2.useRef(nil);
    local v56, v57 = v2.useState(0);
    local v58, v59 = v2.useState(96);
    local v60 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v60.absoluteSize;
    v2.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v59 (copy), v44 (copy), v53 (copy), v50 (copy), v48 (copy)
        v59((math.max(96, v44.Y - (v53 - v50) - v48 - 20)));
    end, {
        v44.Y, 
        v53, 
        v50, 
        v48
    });
    v2.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v52 (copy), v49 (copy), v54 (copy)
        if v52.current then
            v49(v52.current.AbsoluteSize.Y);
            v54(v52.current.AbsolutePosition.Y);
        end;
    end, {
        v52.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v43 (copy), v47 (copy), v45 (copy), v51 (copy)
        if v43.current then
            local l_ScrollingFrame_0 = v43.current:FindFirstChildWhichIsA("ScrollingFrame");
            if l_ScrollingFrame_0 then
                l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 109 ]]
                    -- upvalues: v47 (ref), l_ScrollingFrame_0 (copy), v45 (ref)
                    v47(l_ScrollingFrame_0.AbsoluteWindowSize);
                    v45(l_ScrollingFrame_0.AbsoluteCanvasSize);
                end);
            end;
            v51(v43.current.AbsolutePosition.Y);
            return;
        else
            v45(Vector2.zero);
            return;
        end;
    end, {
        v43.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v55 (copy), v57 (copy)
        if v55.current then
            v57(v55.current.AbsoluteContentSize.Y);
        end;
    end, {
        v55.current
    });
    local v63 = v2.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v37 (copy), v32 (copy), v41 (copy), v36 (copy)
        if v37 ~= "" then
            v32.onSubmit(v37, v41);
            return;
        elseif v32.reportCategoryDefaultKey ~= nil then
            v32.onSubmit(v32.reportCategoryDefaultKey, v41);
            return;
        else
            v36(true);
            return;
        end;
    end, {
        v32.onSubmit, 
        v37, 
        v41, 
        v36
    });
    local v65 = v2.useCallback(function(v64) --[[ Line: 138 ]]
        -- upvalues: v38 (copy), v33 (copy), v24 (ref)
        v38(v64);
        v33(v24({
            reason_selection = v64
        }));
    end, {
        v33
    });
    local v67 = v2.useCallback(function(v66) --[[ Line: 145 ]]
        -- upvalues: v42 (copy), v33 (copy), v23 (ref)
        v42(v66);
        v33(v23({
            comment_added = #v66 > 0
        }));
    end, {
        v33
    });
    local v68 = if v32.localizationKeys then l_useLocalization_0(v32.localizationKeys) else v6();
    local v69 = l_useLocalization_0({
        submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong", 
        selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne", 
        submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened", 
        submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment", 
        defaultKey = v32.reportCategories[1].localizationKey
    });
    local v70 = l_createNextOrder_0();
    local v71 = v2.createElement(v10, {
        options = v32.reportCategories, 
        screenSize = l_absoluteSize_0, 
        maxHeight = v58, 
        menuItemHeight = 48, 
        isDropdownError = v35, 
        setDropdownError = v36, 
        onSelectedAbuseType = v65, 
        reportCategoryDefaultKey = v32.reportCategoryDefaultKey, 
        setDescription = v40, 
        isDisabled = v32.isDisabled
    });
    local v72 = v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v70()
    }, {
        Layout = v2.createElement(v9, {
            Padding = UDim.new(0, 7), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15)
        }), 
        TextFrame = v26 and v2.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 48), 
            tag = "radius-medium stroke-standard stroke-system-neutral padding-left-small"
        }, {
            Text = v2.createElement(l_Text_0, {
                Text = v69.defaultKey, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                tag = "size-full content-muted"
            })
        }) or v2.createElement(v7, {
            text = v69.defaultKey, 
            placeholderText = v69.defaultKey, 
            textYAlignment = Enum.TextYAlignment.Center, 
            interactable = false, 
            onUpdate = function() --[[ Line: 208 ]] --[[ Name: onUpdate ]]

            end, 
            layoutOrder = v70()
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        })
    });
    return v2.createElement(l_PartialPageModal_0, {
        screenSize = v28 and Vector2.new(l_absoluteSize_0.X * (v32.scaleDialog and v32.scaleDialog.X or 1), (l_absoluteSize_0.Y - v60.insets.top) * (v32.scaleDialog and v32.scaleDialog.Y or 1)) or Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y - v60.insets.top), 
        position = UDim2.new(0.5, 0, 0, v60.insets.top + v11), 
        anchorPoint = Vector2.new(0.5, 0), 
        title = v68.formTitle, 
        onCloseClicked = v32.onAbandon, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v63, 
                        text = v68.formSubmit
                    }
                }
            }
        }, 
        footerContent = v32.footerContent, 
        closeButtonIcon = if v32.useBackButton then l_CloseButtonIcon_0.Back else nil
    }, {
        SubmitContainer = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0)
        }, {
            SubmitReportFrame = v2.createElement(l_ScrollView_0, {
                Size = UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v60.insets.top - 100, v56 + 50 + 50))), 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromOffset(0, 0), 
                    scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }, 
                ref = v43
            }, {
                Layout = v2.createElement(v9, {
                    Padding = UDim.new(0, 16), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Ref = v55
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16), 
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingLeft = UDim.new(0, 1), 
                    PaddingRight = UDim.new(0, v44.Y > v46.Y and 16 or 1)
                }), 
                TopCustomComponent = v32.topCustomComponent, 
                ReportReasonFrame = v2.createElement(v8, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    LayoutOrder = v70()
                }, {
                    Layout = v2.createElement(v9, {
                        Padding = UDim.new(0, 14), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    ReportReasonSubheading = v2.createElement(l_StyledTextLabel_0, {
                        text = "1. " .. v69.submitDialogReasonSubheading, 
                        fontStyle = v34.Font.Header2, 
                        colorStyle = v34.Theme.TextEmphasis, 
                        layoutOrder = v70(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    DropdownPosition = v2.createElement(v8, {
                        AutomaticSize = Enum.AutomaticSize.None, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        ZIndex = 2, 
                        LayoutOrder = v70(), 
                        ref = v52
                    }, {
                        ReportReasonPrompt = if v32.isReportCategoryReadonly then v72 else v71
                    }), 
                    ReportReasonSubtext = if v35 then v2.createElement(l_StyledTextLabel_0, {
                        text = v69.selectOnePrompt, 
                        fontStyle = v34.Font.BodySmall, 
                        colorStyle = v34.Theme.Alert, 
                        layoutOrder = v70(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }) else if v27 and v39 ~= "" then v2.createElement(l_StyledTextLabel_0, {
                        text = v39, 
                        fontStyle = v34.Font.BodySmall, 
                        colorStyle = v34.Theme.TextDefault, 
                        layoutOrder = v70(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }) else nil, 
                    Padding = if not (not v27 or v39 == "") or v35 then v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 10)
                    }) else nil
                }), 
                ReportCommentFrame = v2.createElement(v8, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v70()
                }, {
                    Layout = v2.createElement(v9, {
                        Padding = UDim.new(0, 14), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 15)
                    }), 
                    ReportCommentSubheading = v2.createElement(l_StyledTextLabel_0, {
                        text = "2. " .. v69.submitDialogCommentSubheading, 
                        fontStyle = v34.Font.Header2, 
                        colorStyle = v34.Theme.TextEmphasis, 
                        layoutOrder = v70(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    CommentTextField = v2.createElement(v7, {
                        layoutOrder = v70(), 
                        text = v41, 
                        placeholderText = v69.submitDialogTextBoxPlaceholder, 
                        onUpdate = v67
                    })
                })
            })
        })
    });
end;