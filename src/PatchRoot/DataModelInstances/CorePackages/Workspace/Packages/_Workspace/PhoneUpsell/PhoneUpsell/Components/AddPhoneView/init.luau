local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v3.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local v10 = require(l_Parent_0.AuthCommon);
local l_TextBoxStateWrapper_0 = v10.Components.TextBoxStateWrapper;
local l_PhoneNumberTextBox_0 = v10.Components.PhoneNumberTextBox;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local v14 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v15 = {
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    buttonKey = "Feature.VerificationUpsell.Action.Continue", 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA"
};
local function v22(v16, v17, v18, v19, v20) --[[ Line: 72 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v21 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v17, 
                text = v16, 
                isDisabled = v18
            }
        }
    };
    if v19 and v19 ~= "" then
        table.insert(v21, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v20, 
                text = v19, 
                isDisabled = false
            }
        });
    end;
    return {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v21
    };
end;
return function(v23) --[[ Line: 108 ]] --[[ Name: AddPhoneView ]]
    -- upvalues: v14 (copy), v15 (copy), v2 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_PartialPageModal_0 (copy), v22 (copy), l_TextBoxStateWrapper_0 (copy), l_PhoneNumberTextBox_0 (copy), l_Checkbox_0 (copy), l_LinkButton_0 (copy)
    local v24 = v14(v15, v23);
    local function v25() --[[ Line: 111 ]] --[[ Name: noOp ]]

    end;
    local v26, v27 = v2.useState(false);
    local v28 = l_getPartialPageModalMiddleContentWidth_0(v24.screenSize.X);
    local v29 = {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v24.titleKey, 
        descriptionKey = v24.descriptionKey, 
        buttonKey = v24.buttonKey, 
        legalTextKey = v24.legalTextKey
    };
    if v24.extraButtonKey and v24.extraButtonKey ~= "" then
        v29.extraButtonKey = v24.extraButtonKey;
    end;
    return l_withStyle_0(function(v30) --[[ Line: 131 ]]
        -- upvalues: l_withLocalization_0 (ref), v29 (copy), v24 (copy), v26 (copy), v2 (ref), l_PartialPageModal_0 (ref), v22 (ref), v28 (copy), l_TextBoxStateWrapper_0 (ref), l_PhoneNumberTextBox_0 (ref), v25 (copy), l_Checkbox_0 (ref), v27 (copy), l_LinkButton_0 (ref)
        return l_withLocalization_0(v29)(function(v31) --[[ Line: 132 ]]
            -- upvalues: v30 (copy), v24 (ref), v26 (ref), v2 (ref), l_PartialPageModal_0 (ref), v22 (ref), v28 (ref), l_TextBoxStateWrapper_0 (ref), l_PhoneNumberTextBox_0 (ref), v25 (ref), l_Checkbox_0 (ref), v27 (ref), l_LinkButton_0 (ref)
            local l_BaseSize_0 = v30.Font.BaseSize;
            local l_RelativeSize_0 = v30.Font.Body.RelativeSize;
            local l_RelativeSize_1 = v30.Font.CaptionHeader.RelativeSize;
            local v35 = v24.isDisabled or v24.requireLegalTextCheckbox and not v26;
            local l_createElement_0 = v2.createElement;
            local l_l_PartialPageModal_0_0 = l_PartialPageModal_0;
            local v38 = {
                title = v31.titleKey, 
                screenSize = v24.screenSize, 
                buttonStackProps = v22(v31.buttonKey, v24.onSetPhoneNumber, v35, v31.extraButtonKey, v24.onExtraButtonClick), 
                onCloseClicked = v24.onClose, 
                position = v24.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v24.keyboardHeight) or nil, 
                anchorPoint = v24.isKeyboardShowing and Vector2.new(0.5, 1) or nil
            };
            local v39 = {};
            local l_createElement_1 = v2.createElement;
            local v41 = "Frame";
            local v42 = {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            };
            local v43 = {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                BodyText = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Text = v31.descriptionKey, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v30.Theme.TextDefault.Color, 
                    TextTransparency = v30.Theme.TextDefault.Transparency, 
                    Font = v30.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v28, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }), 
                PhoneInput = v2.createElement(l_TextBoxStateWrapper_0, {
                    ChildClass = l_PhoneNumberTextBox_0, 
                    ErrorState = v24.errorMessage ~= "", 
                    ErrorText = v24.errorMessage, 
                    Size = UDim2.new(1, 0, 0, 36), 
                    LayoutOrder = 1, 
                    ChildProps = {
                        CountryCode = v24.countryCode, 
                        SetCountryCode = v24.setCountryCode, 
                        Text = v24.phoneNumber, 
                        PlaceholderText = v31.phoneNumberKey, 
                        Font = v30.Font.Body.Font, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Color = v30.Theme.BackgroundUIContrast.Color, 
                        Transparency = v30.Theme.BackgroundUIContrast.Transparency, 
                        TextColor = v30.Theme.TextDefault.Color, 
                        PlaceholderColor = v30.Theme.UIDefault.Color, 
                        TextTransparency = v30.Theme.TextDefault.Transparency, 
                        ClearTextOnFocus = false, 
                        PaddingX = 12, 
                        TextInputTypeOverride = v24.usePhoneNumberTextType and Enum.TextInputType.Phone or Enum.TextInputType.Number, 
                        onChangeText = v24.onPhoneNumberTextChange, 
                        onFocused = v24.onPhoneInputFocus, 
                        onFocusLost = v25, 
                        phoneCountryCodeSelectorCallback = v24.onCountryCodeSelectorClick
                    }
                }), 
                PrivacyText = v2.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v31.phonePrivacyDisclaimerKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                    TextColor3 = v30.Theme.TextEmphasis.Color, 
                    TextTransparency = v30.Theme.TextEmphasis.Transparency, 
                    Font = v30.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v28, 0, 24)
                }), 
                LegalTextContainer = if v24.requireLegalTextCheckbox then v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v28, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 6)
                    }), 
                    LegalCheckbox = v2.createElement(l_Checkbox_0, {
                        onActivated = v27, 
                        isSelected = v26, 
                        text = ""
                    }), 
                    LegalText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v31.legalTextKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                        TextColor3 = v30.Theme.TextDefault.Color, 
                        TextTransparency = v30.Theme.TextDefault.Transparency, 
                        Font = v30.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, -32, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }) else (v24.alwaysShowLegalText or v24.countryCode.prefix == "1") and v2.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Text = v31.legalTextKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                    TextColor3 = v30.Theme.TextDefault.Color, 
                    TextTransparency = v30.Theme.TextDefault.Transparency, 
                    Font = v30.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v28, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                })
            };
            local v44 = false;
            if v24.countryCode.prefix == "1" then
                v44 = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TermsOfUseButton = v2.createElement(l_LinkButton_0, {
                        text = v31.termsOfUseKey, 
                        onActivated = v24.onTermsOfUseClick, 
                        layoutOrder = 5, 
                        fontStyle = "CaptionBody", 
                        size = UDim2.fromScale(0.2, 0.2)
                    }), 
                    TextButtonDivider = v2.createElement("TextLabel", {
                        LayoutOrder = 6, 
                        BackgroundTransparency = 1, 
                        Text = "-", 
                        TextSize = l_BaseSize_0 * l_RelativeSize_1, 
                        TextColor3 = v30.Theme.TextDefault.Color, 
                        TextTransparency = v30.Theme.TextDefault.Transparency, 
                        Font = v30.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    PrivacyPolicyButton = v2.createElement(l_LinkButton_0, {
                        text = v31.privacyPolicyKey, 
                        onActivated = v24.onPrivacyPolicyClick, 
                        layoutOrder = 7, 
                        fontStyle = "CaptionBody"
                    })
                });
            end;
            v43.LegalButtonsContainer = v44;
            v39.Middle = l_createElement_1(v41, v42, v43);
            return l_createElement_0(l_l_PartialPageModal_0_0, v38, v39);
        end);
    end);
end;