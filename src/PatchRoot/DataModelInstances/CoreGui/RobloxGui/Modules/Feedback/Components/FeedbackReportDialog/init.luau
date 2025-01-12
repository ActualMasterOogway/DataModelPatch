local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_VerticalScrollView_0 = v5.App.Container.VerticalScrollView;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Constants);
local v9 = require(l_Parent_0.Thunks.SendFeedbackThunk);
local v10 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v11 = require(l_Parent_0.Actions.SetFeedbackReason);
local v12 = require(l_Parent_0.Components.TextEntryField);
local v13 = require(l_Parent_0.Components.ModalDialog);
local v14 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RadioButtonList_0 = v5.App.InputButton.RadioButtonList;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v22 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments);
local v23 = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false);
local v24 = v2.PureComponent:extend("FeedbackReportDialog");
v24.validateProps = v4.strictInterface({
    isReportDialogOpen = v4.boolean, 
    screenSize = v4.Vector2, 
    closeDialog = v4.optional(v4.callback), 
    reportCategory = v4.optional(v4.string)
});
v24.init = function(v25) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), l_ExperienceStateCaptureService_0 (copy), v8 (copy)
    if v23 then
        v25.state = {
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = "", 
            correctTranslationText = "", 
            additionalCommentsText = "", 
            numFeedbackSubmissionAttempts = 0, 
            isGenericSelection = false
        };
    else
        v25.state = {
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = "", 
            correctTranslationText = "", 
            additionalCommentsText = "", 
            numFeedbackSubmissionAttempts = 0
        };
    end;
    v25.calculateFieldHeight = function(v26, v27, v28) --[[ Line: 85 ]]
        if v26 < 180 and v28 then
            return v27 * 5;
        else
            return v27 * (v26 / 45 + 2);
        end;
    end;
    v25.resetLocalState = function() --[[ Line: 94 ]]
        -- upvalues: v23 (ref), v25 (copy), l_ExperienceStateCaptureService_0 (ref)
        if v23 then
            v25:setState({
                isGenericSelection = false
            });
        end;
        v25:setState({
            correctTranslationText = "", 
            additionalCommentsText = "", 
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = ""
        });
        v25.props.setFeedbackReason(0);
        l_ExperienceStateCaptureService_0:ResetHighlight();
    end;
    v25.setInstanceRelatedReportDialogState = function(v29) --[[ Line: 113 ]]
        -- upvalues: v25 (copy), v23 (ref)
        if v29:IsA("TextBox") then
            v25:setState({
                feedbackText = v29.PlaceholderText, 
                feedbackOriginalText = v29.LocalizationMatchedSourceText, 
                feedbackIdentifier = v29.LocalizationMatchIdentifier
            });
            if v23 then
                v25:setState({
                    isGenericSelection = false
                });
                return;
            end;
        elseif v29:IsA("TextLabel") or v29:IsA("TextButton") then
            v25:setState({
                feedbackText = v29.Text, 
                feedbackOriginalText = v29.LocalizationMatchedSourceText, 
                feedbackIdentifier = v29.LocalizationMatchIdentifier
            });
            if v23 then
                v25:setState({
                    isGenericSelection = false
                });
                return;
            end;
        elseif v23 then
            v25:setState({
                feedbackText = v29.ClassName, 
                feedbackOriginalText = v29.ClassName, 
                feedbackIdentifier = "", 
                isGenericSelection = true
            });
        end;
    end;
    l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Connect(function(v30) --[[ Line: 151 ]]
        -- upvalues: v25 (copy), v8 (ref)
        v25.resetLocalState();
        v25.setInstanceRelatedReportDialogState(v30);
        v25.props.setFeedbackFlowState(v8.State.CurrentlyLeavingFeedback);
    end);
    v25.onCorrectTranslationTextChanged = function(v31) --[[ Line: 158 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            correctTranslationText = v31
        });
    end;
    v25.onAdditionalCommentsTextChanged = function(v32) --[[ Line: 164 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            additionalCommentsText = v32
        });
    end;
    v25.onSubmitFeedback = function() --[[ Line: 170 ]]
        -- upvalues: v25 (copy), v8 (ref)
        v25:setState({
            numFeedbackSubmissionAttempts = v25.state.numFeedbackSubmissionAttempts + 1
        });
        v25.props.sendFeedback(v25.state.feedbackOriginalText, v25.state.feedbackText, v25.state.feedbackIdentifier, v25.state.correctTranslationText, v25.state.additionalCommentsText, v25.props.feedbackReason, v25.state.numFeedbackSubmissionAttempts);
        v25.resetLocalState();
        v25.props.setFeedbackFlowState(v8.State.Default);
    end;
    v25.onCancel = function() --[[ Line: 190 ]]
        -- upvalues: v25 (copy), v8 (ref)
        v25.resetLocalState();
        v25.props.setFeedbackFlowState(v8.State.Default);
    end;
end;
v24.renderContents = function(v33, v34) --[[ Line: 196 ]] --[[ Name: renderContents ]]
    -- upvalues: l_withStyle_0 (copy), v22 (copy), v2 (copy), l_StyledTextLabel_0 (copy), v14 (copy), v23 (copy), l_RadioButtonList_0 (copy), v12 (copy)
    return l_withStyle_0(function(v35) --[[ Line: 197 ]]
        -- upvalues: v34 (copy), v22 (ref), v2 (ref), l_StyledTextLabel_0 (ref), v14 (ref), v33 (copy), v23 (ref), l_RadioButtonList_0 (ref), v12 (ref)
        local l_Theme_0 = v35.Theme;
        local l_Font_0 = v35.Font;
        local v38 = {
            v34.untranslated, 
            v34.accuracyIssue, 
            v34.spellingOrGrammarIssue, 
            v34.inappropriateOrDerogatory
        };
        if v22() then
            return v2.createFragment({
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                SelectedTextHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.textSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 1, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                SelectedTextLabel = v2.createElement(v14, {
                    LayoutOrder = 2, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, 0, 0, v33.calculateFieldHeight(string.len(v33.state.feedbackText), 14, false)), 
                    Text = if v23 then (if v33.state.isGenericSelection then v34.genericSelectionWrapper else v33.state.feedbackText) or "" else v33.state.feedbackText or "", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TranslationProblemsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.problemDropdownSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 3, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                TranslationProblemsListFrame = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 160), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    RadioButtonList = v2.createElement(l_RadioButtonList_0, {
                        radioButtons = v38, 
                        onActivated = function(v39) --[[ Line: 266 ]] --[[ Name: onActivated ]]
                            -- upvalues: v33 (ref)
                            v33.props.setFeedbackReason(v39);
                        end, 
                        currentValue = v33.props.feedbackReason, 
                        elementSize = UDim2.new(1, 0, 0, 40)
                    })
                }), 
                CorrectTranslationHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.correctTranslationHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 5, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                CorrectTranslationTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 6, 
                    enabled = true, 
                    text = v33.state.correctTranslationText, 
                    textChanged = v33.onCorrectTranslationTextChanged, 
                    maxTextLength = math.max(string.len(v33.state.correctTranslationText), 180), 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v34.correctTranslationPlaceholder, 
                    Size = UDim2.new(1, 0, 0, v33.calculateFieldHeight(string.len(v33.state.correctTranslationText), 14, true))
                }), 
                AdditionalCommentsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.additionalCommentsHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 7, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                AdditionalCommentsTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 8, 
                    enabled = true, 
                    text = v33.state.additionalCommentsText, 
                    textChanged = v33.onAdditionalCommentsTextChanged, 
                    maxTextLength = 180, 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v34.additionalCommentsPlaceholder, 
                    Size = UDim2.new(1, 0, 0, 90)
                })
            });
        else
            return v2.createFragment({
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                SelectedTextHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.textSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 1, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                SelectedTextLabel = v2.createElement(v14, {
                    LayoutOrder = 2, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, v33.calculateFieldHeight(string.len(v33.state.feedbackText), 18, false)), 
                    Text = if v23 then (if v33.state.isGenericSelection then v34.genericSelectionWrapper else v33.state.feedbackText) or "" else v33.state.feedbackText or "", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                CorrectTranslationHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.correctTranslationHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 3, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                CorrectTranslationTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 4, 
                    enabled = true, 
                    text = v33.state.correctTranslationText, 
                    textChanged = v33.onCorrectTranslationTextChanged, 
                    maxTextLength = math.max(string.len(v33.state.correctTranslationText), 180), 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v34.correctTranslationPlaceholder, 
                    Size = UDim2.new(1, 0, 0, v33.calculateFieldHeight(string.len(v33.state.correctTranslationText), 18, true))
                }), 
                AdditionalCommentsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.additionalCommentsHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 5, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                AdditionalCommentsTextEntryField = v2.createElement(v12, {
                    LayoutOrder = 6, 
                    enabled = true, 
                    text = v33.state.additionalCommentsText, 
                    textChanged = v33.onAdditionalCommentsTextChanged, 
                    maxTextLength = 180, 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v34.additionalCommentsPlaceholder, 
                    Size = UDim2.new(1, 0, 0, 90)
                }), 
                TranslationProblemsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v34.problemDropdownSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 7, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                RadioButtonList = v2.createElement(l_RadioButtonList_0, {
                    radioButtons = v38, 
                    onActivated = function(v40) --[[ Line: 435 ]] --[[ Name: onActivated ]]
                        -- upvalues: v33 (ref)
                        v33.props.setFeedbackReason(v40);
                    end, 
                    currentValue = v33.props.feedbackReason, 
                    elementSize = UDim2.new(1, 0, 0, 40), 
                    layoutOrder = 8
                })
            });
        end;
    end);
end;
v24.render = function(v41) --[[ Line: 447 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v2 (copy), v13 (copy), v8 (copy), v22 (copy), l_VerticalScrollView_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    return l_withLocalization_0({
        mainHeader = "CoreScripts.Feedback.FeedbackReportDialog.MainHeader", 
        cancel = "CoreScripts.Feedback.FeedbackReportDialog.Cancel", 
        submitFeedback = "CoreScripts.Feedback.FeedbackReportDialog.SubmitFeedback", 
        untranslated = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.Untranslated", 
        accuracyIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.AccuracyIssue", 
        spellingOrGrammarIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.SpellingOrGrammarIssue", 
        inappropriateOrDerogatory = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.InappropriateOrDerogatory", 
        textSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.TextSelectionHeader", 
        correctTranslationHeader = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationHeader", 
        correctTranslationPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationPlaceholder", 
        additionalCommentsHeader = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsHeader", 
        additionalCommentsPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsPlaceholder", 
        problemDropdownSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.ProblemDropdownSelectionHeader", 
        genericSelectionWrapper = {
            "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationObjectPlaceholder"; 
            ObjectType = v41.state.feedbackText
        }
    })(function(v42) --[[ Line: 466 ]]
        -- upvalues: v2 (ref), v13 (ref), v41 (copy), v8 (ref), v22 (ref), l_VerticalScrollView_0 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref)
        return v2.createElement(v13, {
            visible = v41.props.feedbackFlowState == v8.State.CurrentlyLeavingFeedback, 
            screenSize = v41.props.screenSize, 
            titleText = v42.mainHeader, 
            showCloseButton = v22() and true or false, 
            contents = v2.createElement(l_VerticalScrollView_0, {
                useAutomaticCanvasSize = false, 
                canvasSizeY = if v22() then UDim.new(0, 600 + v41.calculateFieldHeight(string.len(v41.state.feedbackText), 14, false) * 2) else UDim.new(1, 550)
            }, v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Contents = v41:renderContents(v42)
            })), 
            actionButtons = v2.createElement(l_ButtonStack_0, {
                buttonHeight = 36, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v41.onCancel, 
                            text = v42.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = v41.onSubmitFeedback, 
                            text = v42.submitFeedback
                        }
                    }
                }
            }), 
            onDismiss = v41.onCancel, 
            onBackButtonActivated = if v41.props.canNavigateBack then v41.navigateBack else nil
        });
    end);
end;
return v3.connect(function(v43) --[[ Line: 524 ]]
    return {
        screenSize = v43.displayOptions.screenSize, 
        feedbackFlowState = v43.feedbackFlowState.feedbackFlowState, 
        feedbackReason = v43.feedbackFlowState.feedbackReason
    };
end, function(v44) --[[ Line: 530 ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy)
    return {
        sendFeedback = function(v45, v46, v47, v48, v49, v50, v51) --[[ Line: 532 ]] --[[ Name: sendFeedback ]]
            -- upvalues: v44 (copy), v9 (ref)
            v44(v9(v45, v46, v47, v48, v49, v50, v51));
        end, 
        setFeedbackFlowState = function(v52) --[[ Line: 553 ]] --[[ Name: setFeedbackFlowState ]]
            -- upvalues: v44 (copy), v10 (ref)
            v44(function(v53) --[[ Line: 554 ]]
                -- upvalues: v10 (ref), v52 (copy)
                v53:dispatch(v10(v52));
            end);
        end, 
        setFeedbackReason = function(v54) --[[ Line: 558 ]] --[[ Name: setFeedbackReason ]]
            -- upvalues: v44 (copy), v11 (ref)
            v44(function(v55) --[[ Line: 559 ]]
                -- upvalues: v11 (ref), v54 (copy)
                v55:dispatch(v11(v54));
            end);
        end
    };
end)(v24);