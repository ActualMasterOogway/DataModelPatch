local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.UIBlox);
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local l_withStyle_0 = v3.Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v7 = require(l_Parent_0.AuthCommon);
local l_FitChildren_0 = v7.Components.FitChildren;
local l_FitTextLabel_0 = v7.Components.FitTextLabel;
local l_AuthStatefulRoundCornerBorder_0 = v7.Components.AuthStatefulRoundCornerBorder;
local l_PasswordBox_0 = v7.Components.PasswordBox;
local l_GenericTextBox_0 = v7.Components.GenericTextBox;
local l_IssueTracker_0 = v7.Components.IssueTracker;
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_InputValidity_0 = v7.Enums.InputValidity;
local v16 = v1.PureComponent:extend("CollapsingTextInputValidator");
local v17 = require(l_Parent_0.SharedFlags);
local l_GetFFlagLuaAppEnable10ftSignUpView_0 = v17.GetFFlagLuaAppEnable10ftSignUpView;
local l_GetFFlagEnableAuthStatefulTextInputUpdates_0 = v17.GetFFlagEnableAuthStatefulTextInputUpdates;
local l_FFlagSignUpTrackFailedRequest_0 = v17.FFlagSignUpTrackFailedRequest;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = v17.GetFFlagLuaAppEnableOpenTypeSupport;
local l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 = v17.GetFFlagLuaAppEnableOpenTypeSignUpPageFix;
v16.defaultProps = {
    prerequisiteMet = true, 
    captureFocusOnTapStart = true
};
v16.init = function(v23) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_InputValidity_0 (copy), v1 (copy), l_FFlagSignUpTrackFailedRequest_0 (copy), l_withStyle_0 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (copy), l_PasswordBox_0 (copy), l_GenericTextBox_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 (copy), l_OpenTypeSupport_0 (copy)
    v23.state = {
        inputTextToValidate = "", 
        validatedInputText = "", 
        isInputTextValid = l_InputValidity_0.Unvalidated, 
        interactionBegan = false, 
        textBoxFocused = false, 
        textBoxHover = false, 
        issueSummaryHeight = 0, 
        issueFullListHeight = 0
    };
    v23.isMounted = false;
    v23.frameRef = v1.createRef();
    v23.getFrameRef = function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy)
        return v23.props.frameRef or v23.frameRef;
    end;
    local v24, v25 = v1.createBinding(1);
    v23.issueSummaryTextTransparency = v24;
    v23.updateIssueSummaryTextTransparency = v25;
    v24, v25 = v1.createBinding(1);
    v23.issueFullListTextTransparency = v24;
    v23.updateIssueFullListTextTransparency = v25;
    v24, v25 = v1.createBinding(1);
    v23.issueCheckmarkTransparency = v24;
    v23.updateIssueCheckmarkTransparency = v25;
    v24, v25 = v1.createBinding(UDim2.new(1, 0, 0, 0));
    v23.issueTrackerHeight = v24;
    v23.updateIssueTrackerHeight = v25;
    v23.springOptions = {
        frequency = 3
    };
    v23.onSizeChange = function(v26, v27) --[[ Line: 73 ]]
        -- upvalues: v23 (copy)
        local l_AbsoluteSize_0 = v27.AbsoluteSize;
        if l_AbsoluteSize_0.X > 0 and l_AbsoluteSize_0.Y > 0 then
            spawn(function() --[[ Line: 79 ]]
                -- upvalues: v23 (ref), v26 (copy), l_AbsoluteSize_0 (copy)
                if v23.isMounted then
                    v23:setState({
                        [v26] = l_AbsoluteSize_0.Y
                    });
                end;
            end);
        end;
    end;
    v23.onIssueSummarySizeChange = function(v29) --[[ Line: 89 ]]
        -- upvalues: v23 (copy)
        v23.onSizeChange("issueSummaryHeight", v29);
    end;
    v23.onIssueFullListSizeChange = function(v30) --[[ Line: 93 ]]
        -- upvalues: v23 (copy)
        v23.onSizeChange("issueFullListHeight", v30);
    end;
    v23.textInputChangedCallback = function(v31) --[[ Line: 97 ]]
        -- upvalues: v23 (copy), l_InputValidity_0 (ref)
        spawn(function() --[[ Line: 98 ]]
            -- upvalues: v23 (ref), v31 (copy), l_InputValidity_0 (ref)
            if v23.isMounted then
                local l_Text_0 = v31.Text;
                local l_onInputTextChanged_0 = v23.props.onInputTextChanged;
                if l_onInputTextChanged_0 then
                    l_onInputTextChanged_0(l_Text_0, l_InputValidity_0.Unvalidated);
                end;
                v23:setState({
                    inputTextToValidate = l_Text_0, 
                    isInputTextValid = l_InputValidity_0.Unvalidated, 
                    interactionBegan = true
                });
            end;
        end);
    end;
    v23.onTextValidated = function(v34, v35, v36) --[[ Line: 116 ]]
        -- upvalues: v23 (copy), l_FFlagSignUpTrackFailedRequest_0 (ref)
        spawn(function() --[[ Line: 117 ]]
            -- upvalues: v23 (ref), v34 (copy), l_FFlagSignUpTrackFailedRequest_0 (ref), v35 (copy), v36 (copy)
            if v23.isMounted and v23.state.inputTextToValidate == v34 then
                local l_onInputTextValidated_0 = v23.props.onInputTextValidated;
                if l_onInputTextValidated_0 then
                    if l_FFlagSignUpTrackFailedRequest_0 then
                        l_onInputTextValidated_0(v34, v35, v36);
                    else
                        l_onInputTextValidated_0(v34, v35);
                    end;
                end;
                v23:setState({
                    validatedInputText = v34, 
                    isInputTextValid = v35
                });
            end;
        end);
    end;
    v23.onTextInputBoxFocused = function() --[[ Line: 137 ]]
        -- upvalues: v23 (copy)
        spawn(function() --[[ Line: 138 ]]
            -- upvalues: v23 (ref)
            if v23.isMounted then
                local v38 = v23.getFrameRef();
                if v23.props.textBoxFocusedCallback and v38.current then
                    v23.props.textBoxFocusedCallback(v38.current.AbsolutePosition);
                end;
                v23:setState({
                    textBoxFocused = true
                });
            end;
        end);
    end;
    v23.onMouseEnter = function() --[[ Line: 152 ]]
        -- upvalues: v23 (copy)
        if v23.isMounted then
            v23:setState({
                textBoxHover = true
            });
        end;
    end;
    v23.onMouseLeave = function() --[[ Line: 160 ]]
        -- upvalues: v23 (copy)
        if v23.isMounted then
            v23:setState({
                textBoxHover = false
            });
        end;
    end;
    v23.onTextInputBoxFocusLost = function() --[[ Line: 168 ]]
        -- upvalues: v23 (copy)
        spawn(function() --[[ Line: 169 ]]
            -- upvalues: v23 (ref)
            if v23.isMounted then
                if v23.props.textBoxFocusLostCallback then
                    v23.props.textBoxFocusLostCallback();
                end;
                v23:setState({
                    textBoxFocused = false
                });
            end;
        end);
    end;
    v23.onPositionChanged = function() --[[ Line: 182 ]]
        -- upvalues: v23 (copy)
        spawn(function() --[[ Line: 183 ]]
            -- upvalues: v23 (ref)
            if v23.isMounted and v23.state.textBoxFocused then
                local v39 = v23.getFrameRef();
                if v23.props.focusedTextBoxPositionChangedCallback and v39.current then
                    v23.props.focusedTextBoxPositionChangedCallback(v39.current.AbsolutePosition);
                end;
            end;
        end);
    end;
    v23.isInErrorState = function() --[[ Line: 193 ]]
        -- upvalues: l_FFlagSignUpTrackFailedRequest_0 (ref), v23 (copy), l_InputValidity_0 (ref)
        if l_FFlagSignUpTrackFailedRequest_0 and v23.props.hasFieldFailed then
            return true;
        elseif not v23.props.prerequisiteMet then
            return v23.state.textBoxFocused or v23.state.interactionBegan and v23.state.inputTextToValidate ~= "";
        elseif v23.state.inputTextToValidate == "" then
            return false;
        elseif v23.state.isInputTextValid == l_InputValidity_0.Invalid then
            return v23.state.interactionBegan;
        else
            return false;
        end;
    end;
    v23.textInputBoxWithBorder = function() --[[ Line: 212 ]]
        -- upvalues: l_withStyle_0 (ref), v23 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), v1 (ref), l_PasswordBox_0 (ref), l_GenericTextBox_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 (ref), l_OpenTypeSupport_0 (ref)
        return l_withStyle_0(function(v40) --[[ Line: 213 ]]
            -- upvalues: v23 (ref), l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), v1 (ref), l_PasswordBox_0 (ref), l_GenericTextBox_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 (ref), l_OpenTypeSupport_0 (ref)
            local l_tokens_0 = v23.props.tokens;
            local l_Font_0 = v40.Font.Body.Font;
            local v43 = v40.Font.BaseSize * v40.Font.Body.RelativeSize;
            if l_GetFFlagLuaAppEnable10ftSignUpView_0() and l_tokens_0 then
                v43 = l_tokens_0.textBodySize;
            end;
            local l_Color_0 = v40.Theme.TextDefault.Color;
            local l_Transparency_0 = v40.Theme.TextDefault.Transparency;
            local l_Color_1 = v40.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v40.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v40.Theme.UIDefault.Color;
            local l_placeholderText_0 = v23.props.placeholderText;
            local l_textInputType_0 = v23.props.textInputType;
            local l_returnKeyType_0 = v23.props.returnKeyType;
            local v52 = v23.props.prefilledText or "";
            if l_textInputType_0 == Enum.TextInputType.Password then
                return v1.createElement(l_PasswordBox_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextSize = v43, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = "", 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor3 = nil, 
                    PlaceholderColor = l_Color_2, 
                    ReturnKeyType = l_returnKeyType_0, 
                    ManualFocusRelease = false, 
                    CaptureFocusOnTapStart = v23.props.captureFocusOnTapStart, 
                    Disabled = v23.props.disabled, 
                    onChangeText = v23.textInputChangedCallback, 
                    onFocused = v23.onTextInputBoxFocused, 
                    onFocusLost = v23.onTextInputBoxFocusLost, 
                    onMouseEnter = v23.onMouseEnter, 
                    onMouseLeave = v23.onMouseLeave, 
                    onReturnPressedFromOnScreenKeyboard = v23.props.onReturnPressedFromOnScreenKeyboard, 
                    IsKeyboardOverlayUsed = v23.props.IsKeyboardOverlayUsed, 
                    TextBoxRef = v23.props.textBoxRef, 
                    CentralOverlayBlocksInput = v23.props.centralOverlayBlocksInput, 
                    hidePassword = v23.props.hidePassword, 
                    onToggleCallback = v23.props.onToggleCallback
                });
            else
                return v1.createElement(l_GenericTextBox_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v52, 
                    Font = l_Font_0, 
                    TextSize = v43, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ClearTextOnFocus = false, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextInputType = l_textInputType_0, 
                    openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() and l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                    ReturnKeyType = l_returnKeyType_0, 
                    PaddingX = 12, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor = l_Color_2, 
                    onChangeText = v23.textInputChangedCallback, 
                    onFocused = v23.onTextInputBoxFocused, 
                    onFocusLost = v23.onTextInputBoxFocusLost, 
                    onMouseEnter = v23.onMouseEnter, 
                    onMouseLeave = v23.onMouseLeave, 
                    onReturnPressedFromOnScreenKeyboard = v23.props.onReturnPressedFromOnScreenKeyboard, 
                    TextBoxRef = v23.props.textBoxRef
                });
            end;
        end);
    end;
end;
v16.didMount = function(v53) --[[ Line: 296 ]] --[[ Name: didMount ]]
    -- upvalues: v2 (copy), l_InputValidity_0 (copy)
    v53.isMounted = true;
    v53.motor = v2.createGroupMotor({
        issueSummaryTextTransparency = 1, 
        issueFullListTextTransparency = 1, 
        issueCheckmarkTransparency = 1, 
        issueTrackerHeight = 0
    });
    v53.motor:onStep(function(v54) --[[ Line: 305 ]]
        -- upvalues: v53 (copy)
        v53.updateIssueSummaryTextTransparency(v54.issueSummaryTextTransparency);
        v53.updateIssueFullListTextTransparency(v54.issueFullListTextTransparency);
        v53.updateIssueCheckmarkTransparency(v54.issueCheckmarkTransparency);
        v53.updateIssueTrackerHeight(UDim2.new(1, 0, 0, v54.issueTrackerHeight));
    end);
    v53.motor:onComplete(function() --[[ Line: 312 ]]
        -- upvalues: v53 (copy)
        if v53.props.onAnimationStateChangeCallback then
            v53.props.onAnimationStateChangeCallback(v53.props.textInputType, false);
        end;
    end);
    v53.motor:start();
    local l_prefilledText_0 = v53.props.prefilledText;
    if l_prefilledText_0 and l_prefilledText_0 ~= "" then
        v53:setState({
            inputTextToValidate = l_prefilledText_0, 
            isInputTextValid = l_InputValidity_0.Unvalidated, 
            interactionBegan = false
        });
    end;
end;
v16.didUpdate = function(v56, _, v58) --[[ Line: 330 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    local l_textBoxFocused_0 = v56.state.textBoxFocused;
    local l_issueSummaryHeight_0 = v56.state.issueSummaryHeight;
    local l_issueFullListHeight_0 = v56.state.issueFullListHeight;
    local l_showDetailedError_0 = v56.props.showDetailedError;
    local v63 = v58.validatedInputText ~= "";
    local v64 = not l_textBoxFocused_0 or not v56.props.prerequisiteMet;
    local v65 = v56.state.validatedInputText ~= "";
    local v66 = v56.isInErrorState();
    local v67 = nil;
    if l_showDetailedError_0 and v66 then
        v64 = false;
        v65 = true;
    end;
    v67 = if not not l_textBoxFocused_0 or l_showDetailedError_0 and v66 then if v56.props.prerequisiteMet then l_issueFullListHeight_0 else l_issueSummaryHeight_0 else if v66 then l_issueSummaryHeight_0 else 0;
    local v68 = false;
    if v56.props.pillClicked then
        l_issueSummaryHeight_0 = 0;
        v67 = 0;
        v56.props.resetPillClicked();
        v68 = true;
    end;
    if l_textBoxFocused_0 ~= v58.textBoxFocused or v63 ~= v65 or l_showDetailedError_0 and v66 then
        v56.motor:setGoal({
            issueSummaryTextTransparency = v2.spring(v64 and 0 or 1, v56.springOptions), 
            issueFullListTextTransparency = v2.spring(v64 and 1 or 0, v56.springOptions), 
            issueCheckmarkTransparency = v2.spring(v65 and 0 or 1, v56.springOptions), 
            issueTrackerHeight = v2.spring(v67, v56.springOptions)
        });
        if v56.props.onAnimationStateChangeCallback then
            v56.props.onAnimationStateChangeCallback(v56.props.textInputType, true);
            return;
        end;
    elseif l_issueSummaryHeight_0 ~= v58.issueSummaryHeight or l_issueFullListHeight_0 ~= v58.issueFullListHeight then
        if v68 then
            v56.motor:setGoal({
                issueTrackerHeight = v2.spring(v67, v56.springOptions)
            });
        else
            v56.motor:setGoal({
                issueTrackerHeight = v2.instant(v67)
            });
        end;
        if v56.props.onAnimationStateChangeCallback then
            v56.props.onAnimationStateChangeCallback(v56.props.textInputType, true);
        end;
    end;
end;
v16.willUnmount = function(v69) --[[ Line: 413 ]] --[[ Name: willUnmount ]]
    v69.isMounted = false;
    v69.motor:destroy();
end;
v16.render = function(v70) --[[ Line: 418 ]] --[[ Name: render ]]
    -- upvalues: l_AuthStatefulRoundCornerBorder_0 (copy), l_withStyle_0 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (copy), l_withLocalization_0 (copy), v1 (copy), l_FitChildren_0 (copy), l_FitTextLabel_0 (copy), l_LoadingSpinner_0 (copy), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (copy), l_IssueTracker_0 (copy), l_FFlagSignUpTrackFailedRequest_0 (copy)
    local l_layoutOrder_0 = v70.props.layoutOrder;
    local l_titleTextKey_0 = v70.props.titleTextKey;
    local l_summaryErrorTextKey_0 = v70.props.summaryErrorTextKey;
    local l_validator_0 = v70.props.validator;
    local l_validatorAdditionalProps_0 = v70.props.validatorAdditionalProps;
    local l_inputTextToValidate_0 = v70.state.inputTextToValidate;
    local l_tokens_1 = v70.props.tokens;
    if not v70.props.prerequisiteMet then
        l_inputTextToValidate_0 = "";
    end;
    local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
    if v70.isInErrorState() then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
    elseif v70.state.textBoxFocused then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
    elseif v70.state.textBoxHover then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Hover;
    end;
    return l_withStyle_0(function(v79) --[[ Line: 441 ]]
        -- upvalues: l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), l_tokens_1 (copy), l_withLocalization_0 (ref), l_titleTextKey_0 (copy), l_summaryErrorTextKey_0 (copy), v1 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (copy), v70 (copy), l_FitTextLabel_0 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_Default_0 (ref), l_LoadingSpinner_0 (ref), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (ref), l_IssueTracker_0 (ref), l_validator_0 (copy), l_validatorAdditionalProps_0 (copy), l_inputTextToValidate_0 (ref), l_FFlagSignUpTrackFailedRequest_0 (ref)
        local v80 = v79.Font.BaseSize * v79.Font.CaptionHeader.RelativeSize;
        local v81 = 5;
        if l_GetFFlagLuaAppEnable10ftSignUpView_0() and l_tokens_1 then
            v81 = l_tokens_1.boxPadding;
            v80 = l_tokens_1.textCaptionHeaderSize;
        end;
        return l_withLocalization_0({
            titleText = l_titleTextKey_0, 
            summaryErrorText = l_summaryErrorTextKey_0
        })(function(v82) --[[ Line: 453 ]]
            -- upvalues: v1 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (ref), v70 (ref), v81 (ref), l_FitTextLabel_0 (ref), v79 (copy), v80 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), l_tokens_1 (ref), l_Default_0 (ref), l_LoadingSpinner_0 (ref), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (ref), l_IssueTracker_0 (ref), l_validator_0 (ref), l_validatorAdditionalProps_0 (ref), l_inputTextToValidate_0 (ref), l_FFlagSignUpTrackFailedRequest_0 (ref)
            return v1.createElement(l_FitChildren_0.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = l_FitChildren_0.FitAxis.Height, 
                BackgroundTransparency = 1, 
                [v1.Ref] = v70.getFrameRef(), 
                [v1.Change.AbsolutePosition] = v70.onPositionChanged
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v81)
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, if v70.props.paddingBottomOverride then v70.props.paddingBottomOverride else 5)
                }), 
                Title = v1.createElement(l_FitTextLabel_0, {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = l_FitChildren_0.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v82.titleText or "", 
                    TextWrapped = true, 
                    Font = v79.Font.CaptionHeader.Font, 
                    TextSize = v80, 
                    TextColor3 = v79.Theme.TextEmphasis.Color, 
                    TextTransparency = v79.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TextInputBox = v1.createElement(l_AuthStatefulRoundCornerBorder_0, {
                    size = UDim2.new(1, 0, 0, if l_GetFFlagLuaAppEnable10ftSignUpView_0() and l_tokens_1 then l_tokens_1.textboxHeight else 36), 
                    layoutOrder = 1, 
                    borderState = l_Default_0
                }, {
                    textbox = v1.createElement(v70.textInputBoxWithBorder), 
                    loadingSpinner = if v70.props.shouldShowLoadingIcon then v1.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(16, 16), 
                        position = UDim2.new(1, -22, 0.5, 0), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    }) else nil
                }), 
                AnimatedWrapper = v1.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    Size = v70.issueTrackerHeight
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, 12), 
                        PaddingLeft = if l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then UDim.new(0, 0) else UDim.new(0, 12)
                    }), 
                    IssueSummaryWrapper = v1.createElement(l_FitChildren_0.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = l_FitChildren_0.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v1.Change.AbsoluteSize] = v70.onIssueSummarySizeChange
                    }, {
                        IssueSummaryText = v70.isInErrorState() and v1.createElement(l_FitTextLabel_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = l_FitChildren_0.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            Text = v82.summaryErrorText or "", 
                            TextWrapped = true, 
                            Font = v79.Font.CaptionBody.Font, 
                            TextSize = v79.Font.BaseSize * v79.Font.CaptionBody.RelativeSize, 
                            TextColor3 = v79.Theme.Alert.Color, 
                            TextTransparency = v70.issueSummaryTextTransparency, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    }), 
                    IssueTrackerWrapper = v1.createElement(l_FitChildren_0.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = l_FitChildren_0.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v1.Change.AbsoluteSize] = v70.onIssueFullListSizeChange
                    }, {
                        IssueTracker = v1.createElement(l_IssueTracker_0, {
                            validator = l_validator_0, 
                            validatorAdditionalProps = l_validatorAdditionalProps_0, 
                            textToValidate = l_inputTextToValidate_0, 
                            onTextValidated = v70.onTextValidated, 
                            contentTransparency = v70.issueFullListTextTransparency, 
                            checkmarkTransparency = v70.issueCheckmarkTransparency, 
                            updateIssueCondition = v70.props.updateIssueCondition, 
                            debounceTime = if l_FFlagSignUpTrackFailedRequest_0 then v70.props.debounceTime else nil
                        })
                    })
                })
            });
        end);
    end);
end;
return v16;