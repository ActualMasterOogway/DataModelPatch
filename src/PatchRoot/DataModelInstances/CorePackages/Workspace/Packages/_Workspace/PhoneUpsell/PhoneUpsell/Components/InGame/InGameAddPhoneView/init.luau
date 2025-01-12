local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.AuthCommon);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local v11 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_TextField_0 = v5.App.Input.TextField;
local v13 = require(l_script_FirstAncestor_0.Components.InGame.CountryCodeButton);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_CountryCodeDropdownContainer_0 = v6.Components.InGame.CountryCodeDropdownContainer;
local l_useExternalEvent_0 = require(l_Parent_0.RoactUtils).Hooks.useExternalEvent;
local l_GetFFlagAddMorePhoneUpsellEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagAddMorePhoneUpsellEvents;
local v18 = {
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    buttonKey = "Feature.VerificationUpsell.Action.Next", 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA", 
    prefix = "1"
};
local function v25(v19, v20, v21, v22, v23) --[[ Line: 65 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v24 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v20, 
                text = v19, 
                isDisabled = v21
            }
        }
    };
    if v22 and v22 ~= "" then
        table.insert(v24, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v23, 
                text = v22, 
                isDisabled = false
            }
        });
    end;
    return {
        buttonHeight = 48, 
        buttons = v24
    };
end;
return function(v26) --[[ Line: 100 ]] --[[ Name: InGameAddPhoneView ]]
    -- upvalues: v11 (copy), v18 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_Text_0 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy), v4 (copy), v13 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (copy), l_TextField_0 (copy), l_InteractiveAlert_0 (copy), v25 (copy), l_CountryCodeDropdownContainer_0 (copy)
    local v27 = v11(v18, v26);
    local v28 = {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v27.titleKey, 
        descriptionKey = v27.descriptionKey, 
        buttonKey = v27.buttonKey, 
        legalTextKey = v27.legalTextKey
    };
    if v27.extraButtonKey and v27.extraButtonKey ~= "" then
        v28.extraButtonKey = v27.extraButtonKey;
    end;
    local v29 = l_useStyle_0();
    local l_Tokens_0 = v29.Tokens;
    local l_TextField_1 = l_Tokens_0.Component.TextField;
    local l_Font_0 = l_TextField_1.Base.Field.Typography.Font;
    local l_FontSize_0 = l_TextField_1.Base.Field.Typography.FontSize;
    local v34 = l_useLocalization_0(v28);
    local l_BaseSize_0 = v29.Font.BaseSize;
    local l_RelativeSize_0 = v29.Font.CaptionHeader.RelativeSize;
    local l_isDisabled_0 = v27.isDisabled;
    local l_Gap_0 = l_Tokens_0.Component.StatWidget.Container.Gap;
    local l_Size_600_0 = l_Tokens_0.Global.Size_600;
    local l_prefix_0 = v27.countryCode.prefix;
    local v41, v42 = v3.useState(false);
    local v43 = math.max(l_Text_0.GetTextWidth(l_prefix_0, l_Font_0, l_FontSize_0) + 24, l_Size_600_0);
    local v44, v45 = v3.useState(300);
    local function v47(v46) --[[ Line: 138 ]]
        -- upvalues: v45 (copy)
        v45(v46.AbsoluteSize.X);
    end;
    local v48 = v3.useRef(nil);
    local v49 = v3.useRef(nil);
    local v50 = v3.useRef(nil);
    local v51 = Vector2.new(0, 0);
    local v52 = Vector2.new(0, 0);
    local v53 = Vector2.new(0, 0);
    if v48.current then
        v51 = v48.current.AbsolutePosition;
    end;
    if v49.current then
        v52 = v49.current.AbsolutePosition;
    end;
    if v50.current then
        v53 = v50.current.AbsolutePosition;
    end;
    local v54 = math.min(v27.screenSize.Y - (v51.Y + l_Size_600_0 + l_Gap_0 - v52.Y) - l_Gap_0, 400);
    local v59 = v3.useCallback(function(v55) --[[ Line: 168 ]]
        -- upvalues: l_Size_600_0 (copy), l_Gap_0 (copy), v53 (ref), v44 (copy), v54 (ref), v43 (copy), v41 (copy), v42 (copy)
        local v56 = l_Size_600_0 + l_Gap_0;
        local v57 = false;
        if v55.Position.X > v53.X then
            v57 = false;
            if v55.Position.X < v53.X + v44 then
                v57 = false;
                if v55.Position.Y > v53.Y + v56 then
                    v57 = v55.Position.Y < v53.Y + v56 + v54;
                end;
            end;
        end;
        local v58 = false;
        if v55.Position.X > v53.X then
            v58 = false;
            if v55.Position.X < v53.X + v43 then
                v58 = false;
                if v55.Position.Y > v53.Y then
                    v58 = v55.Position.Y < v53.Y + l_Size_600_0;
                end;
            end;
        end;
        if v41 and not v57 and not v58 then
            v42(false);
        end;
    end, {
        v41, 
        v53, 
        v44, 
        v43, 
        l_Size_600_0
    });
    l_useExternalEvent_0(l_UserInputService_0.InputBegan, v59);
    local v60 = v27.errorMessage and v27.errorMessage ~= "";
    local v62 = v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v4.Ref] = v48
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
        }), 
        PhoneInputContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 0
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_Gap_0)
            }), 
            CountryCodeButton = v3.createElement(v13, {
                countryPrefix = "+" .. l_prefix_0, 
                onButtonClick = function() --[[ Line: 221 ]] --[[ Name: onButtonClick ]]
                    -- upvalues: v42 (copy), v41 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), v27 (copy)
                    v42(not v41);
                    if l_GetFFlagAddMorePhoneUpsellEvents_0 then
                        v27.onCountryCodeSelectorClick();
                    end;
                end, 
                size = UDim2.new(0, v43, 0, l_Tokens_0.Global.Size_600), 
                layoutOrder = 1, 
                font = l_Font_0, 
                textSize = l_FontSize_0, 
                forwardRef = v50, 
                error = v60
            }), 
            PhoneInputBox = v3.createElement(l_TextField_0, {
                text = v27.phoneNumber, 
                placeholder = "", 
                required = true, 
                onChange = function(v61) --[[ Line: 238 ]] --[[ Name: onChange ]]
                    -- upvalues: v27 (copy)
                    v27.onPhoneNumberTextChange({
                        Text = v61
                    });
                end, 
                LayoutOrder = 2, 
                width = UDim.new(1, -(v43 + l_Gap_0)), 
                error = v60, 
                textInputType = if v27.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number, 
                onFocusGained = if l_GetFFlagAddMorePhoneUpsellEvents_0() then v27.onPhoneInputFocus else nil
            })
        }), 
        ErrorText = v60 and v3.createElement("TextLabel", {
            Text = v27.errorMessage, 
            TextTransparency = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Tokens_0.Global.Color.Red.Color3, 
            Font = v29.Font.Body.Font, 
            TextSize = l_BaseSize_0 * v29.Font.CaptionSmall.RelativeSize, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        })
    });
    local v63 = v3.createElement(l_InteractiveAlert_0, {
        screenSize = v27.screenSize, 
        buttonStackInfo = v25(v34.buttonKey, v27.onSetPhoneNumber, l_isDisabled_0, v34.extraButtonKey, v27.onExtraButtonClick), 
        position = v27.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v27.keyboardHeight) or UDim2.fromScale(0.5, 0.5), 
        anchorPoint = v27.isKeyboardShowing and Vector2.new(0.5, 1) or nil, 
        title = v34.titleKey, 
        onAbsoluteSizeChanged = v47, 
        onCloseClicked = v27.onClose, 
        middleContent = function() --[[ Line: 281 ]] --[[ Name: middleContent ]]
            -- upvalues: v3 (ref), l_Tokens_0 (copy), v62 (copy), v34 (copy), l_BaseSize_0 (copy), l_RelativeSize_0 (copy), v29 (copy)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                AddPhoneViewFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
                    }), 
                    PhoneInput = v62, 
                    PrivacyText = v3.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Text = v34.disclaimerKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v29.Theme.TextEmphasis.Color, 
                        TextTransparency = v29.Theme.TextEmphasis.Transparency, 
                        Font = v29.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
        end
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        [v4.Ref] = v49
    }, {
        AddPhoneView = v63, 
        CountryCodeSelectorFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(0, v44 - 24, 0, 0), 
            ZIndex = 2, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, v51.X - v52.X, 0, v51.Y + l_Size_600_0 + l_Gap_0 - v52.Y)
        }, {
            CountryCodeDropdown = v3.createElement(l_CountryCodeDropdownContainer_0, {
                dropdownVisible = v41, 
                position = UDim2.new(0, 0, 0, 0), 
                maxHeight = v54, 
                onCountryCodeSelected = function(v64) --[[ Line: 340 ]] --[[ Name: onCountryCodeSelected ]]
                    -- upvalues: v27 (copy), v42 (copy)
                    v27.setCountryCode(v64);
                    v42(false);
                end
            })
        })
    });
end;