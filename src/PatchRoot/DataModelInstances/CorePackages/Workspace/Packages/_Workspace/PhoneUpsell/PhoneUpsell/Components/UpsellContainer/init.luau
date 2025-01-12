local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.usePhoneVerificationUpsellProps);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local _ = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v7 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellState);
local v8 = require(l_script_FirstAncestor_0.Components.EntryView);
local v9 = require(l_script_FirstAncestor_0.Components.AddPhoneView);
local v10 = require(l_script_FirstAncestor_0.Components.VerifyPhoneView);
local v11 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v13 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagPhoneUseParentSizeForScreenSize);
local v15 = require(l_script_FirstAncestor_0.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess);
local v16 = require(l_script_FirstAncestor_0.Flags.GetFFlagFixIosOtpAutofill);
local function v17() --[[ Line: 102 ]]

end;
local v19 = {
    onSuccess = v17, 
    onFailure = v17, 
    onCancelled = v17, 
    origin = "", 
    eventContext = "", 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
    extraButtonTextKey = "", 
    onExtraButtonClick = v17, 
    shouldAutofillAndroidPhoneNumberAtLaunch = false, 
    isOTPInputTypeEnabled = false, 
    isPhoneNumberTextTypeEnabled = false, 
    alwaysShowAddPhoneLegalText = false, 
    requireAddPhoneLegalTextCheckbox = false, 
    closeUpsell = v17, 
    showWebpage = function(_) --[[ Line: 120 ]] --[[ Name: showWebpage ]]

    end
};
return function(v20) --[[ Line: 123 ]] --[[ Name: UpsellContainer ]]
    -- upvalues: v6 (copy), v19 (copy), v2 (copy), v3 (copy), l_LoadingSpinner_0 (copy), v14 (copy), v4 (copy), v7 (copy), v8 (copy), v9 (copy), v13 (copy), v10 (copy), v15 (copy), v16 (copy), v11 (copy)
    local v21 = v6(v19, v20);
    local v22 = v2(v21);
    local v23 = v3.createElement(l_LoadingSpinner_0, {
        size = UDim2.fromOffset(48, 48), 
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
    local l_createElement_0 = v3.createElement;
    local v25 = v14() and "Frame" or v3.Fragment;
    local v27 = if v14() then {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v4.Change.AbsoluteSize] = function(v26) --[[ Line: 140 ]]
            -- upvalues: v22 (copy)
            v22.setParentSize(v26.AbsoluteSize);
        end
    } else nil;
    local v28 = {};
    local v29 = false;
    if v22.phoneUpsellState == v7.Entry then
        v29 = v21.entryConfig and v3.createElement(v8, {
            screenSize = v22.screenSize, 
            onClose = v22.handleCloseClick, 
            titleKey = v21.entryConfig.titleKey, 
            descriptionKey = v21.entryConfig.descriptionKey, 
            buttonKey = v21.entryConfig.buttonKey, 
            onButtonClick = v22.proceedToAddPhone, 
            extraButtonKey = v21.entryConfig.extraButtonConfig.extraButtonKey, 
            onExtraButtonClick = v21.entryConfig.extraButtonConfig.onExtraButtonClick
        });
    end;
    v28.Entry = v29;
    v29 = false;
    if v22.phoneUpsellState == v7.AddPhone then
        v29 = v3.createElement(v9, {
            screenSize = v22.screenSize, 
            countryCode = v22.countryCode, 
            setCountryCode = v22.setCountryCode, 
            phoneNumber = v22.phoneNumber, 
            errorMessage = v22.addPhoneErrorMessage, 
            isDisabled = v22.isDisabled, 
            onPhoneNumberTextChange = v22.onPhoneNumberTextChange, 
            onSetPhoneNumber = v22.handleSetPhone, 
            onClose = v22.handleCloseClick, 
            onTermsOfUseClick = v22.navigateToSMSTerms, 
            onPrivacyPolicyClick = v22.navigateToPrivacy, 
            onPhoneInputFocus = v22.onPhoneInputFocus, 
            onCountryCodeSelectorClick = v22.onCountryCodeSelectorClick, 
            isKeyboardShowing = v22.isKeyboardShowing, 
            keyboardHeight = v22.onScreenKeyboardHeight, 
            usePhoneNumberTextType = v13() and v22.isPhoneNumberTextTypeEnabled, 
            titleKey = v21.addPhoneTitleKey, 
            descriptionKey = v21.addPhoneDescriptionKey, 
            buttonKey = v21.addPhoneButtonKey, 
            legalTextKey = v21.addPhoneLegalTextKey, 
            extraButtonKey = v21.extraButtonTextKey, 
            onExtraButtonClick = v21.onExtraButtonClick, 
            alwaysShowLegalText = v21.alwaysShowAddPhoneLegalText, 
            requireLegalTextCheckbox = v21.requireAddPhoneLegalTextCheckbox
        });
    end;
    v28.AddPhone = v29;
    v29 = false;
    if v22.phoneUpsellState == v7.VerifyPhone then
        v29 = v3.createElement(v10, {
            screenSize = v22.screenSize, 
            phoneNumber = v22.phoneNumber, 
            prefix = v22.countryCode.prefix, 
            code = v22.code, 
            errorMessage = v22.verifyPhoneErrorMessage, 
            isDisabled = if v15() then v22.isDisabled else nil, 
            onCodeTextChange = v22.onCodeTextChange, 
            onResendPhoneCode = v22.handleResendCode, 
            onClose = v22.handleCloseClick, 
            returnToAddPhone = v22.returnToAddPhone, 
            onCodeInputFocus = v22.onCodeInputFocus, 
            isKeyboardShowing = v22.isKeyboardShowing, 
            keyboardHeight = v22.onScreenKeyboardHeight, 
            useOTPInputType = if v16() then v22.isOTPInputTypeEnabled else v21.isOTPInputTypeEnabled, 
            extraButtonKey = v21.verifyPhoneExtraButtonKey, 
            onExtraButtonClick = v21.onVerifyPhoneExtraButtonClick
        });
    end;
    v28.VerifyPhone = v29;
    v28.LoadingOverlay = v22.isLoading and v3.createElement(v11, {
        image = v23, 
        text = v22.verifyingKey
    });
    return l_createElement_0(v25, v27, v28);
end;