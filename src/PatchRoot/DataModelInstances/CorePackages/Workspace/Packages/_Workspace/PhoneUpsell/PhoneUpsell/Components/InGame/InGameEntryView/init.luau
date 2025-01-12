local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local v8 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local function v11() --[[ Line: 47 ]] --[[ Name: noOp ]]

end;
local v12 = {
    onClose = v11, 
    isButtonDisabled = false, 
    onExtraButtonClick = v11, 
    isExtraButtonDisabled = false, 
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA", 
    prefix = "1"
};
local function v21(v13, v14, v15, v16, v17, v18, v19) --[[ Line: 60 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v20 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v15, 
                text = v13, 
                isDisabled = v16
            }
        }
    };
    if v17 and v17 ~= "" then
        table.insert(v20, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v18, 
                text = v17, 
                isDisabled = v19
            }
        });
    end;
    return {
        buttonHeight = v14, 
        buttons = v20
    };
end;
return function(v22) --[[ Line: 96 ]] --[[ Name: InGameEntryView ]]
    -- upvalues: v8 (copy), v12 (copy), v2 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_InteractiveAlert_0 (copy), v21 (copy), l_Checkbox_0 (copy), l_LinkButton_0 (copy)
    local v23 = v8(v12, v22);
    local v24, v25 = v2.useState(false);
    local v26 = {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v23.titleKey, 
        descriptionKey = v23.descriptionKey, 
        buttonKey = v23.buttonKey, 
        legalTextKey = v23.legalTextKey
    };
    if v23.extraButtonKey and v23.extraButtonKey ~= "" then
        v26.extraButtonKey = v23.extraButtonKey;
    end;
    local v27 = l_useStyle_0();
    local l_BaseSize_0 = v27.Font.BaseSize;
    local l_RelativeSize_0 = v27.Font.CaptionHeader.RelativeSize;
    local l_Space_75_0 = v27.Tokens.Global.Space_75;
    local v31 = l_useLocalization_0(v26);
    v31.legalTextKey = v31.legalTextKey:gsub("{buttonText}", v31.buttonKey);
    return v2.createElement(l_InteractiveAlert_0, {
        title = v31.titleKey, 
        screenSize = v23.screenSize, 
        buttonStackInfo = v21(v31.buttonKey, v27.Tokens.Global.Size_600, v23.onButtonClick, v23.isButtonDisabled, v31.extraButtonKey, v23.onExtraButtonClick, v23.isExtraButtonDisabled), 
        onCloseClicked = v23.onClose, 
        middleContent = function() --[[ Line: 135 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v31 (copy), l_BaseSize_0 (copy), v27 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BodyText = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Text = v31.descriptionKey, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v27.Theme.TextDefault.Color, 
                    TextTransparency = v27.Theme.TextDefault.Transparency, 
                    Font = v27.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    RichText = true
                })
            });
        end, 
        footerContent = function() --[[ Line: 157 ]] --[[ Name: footerContent ]]
            -- upvalues: v2 (ref), v27 (copy), v23 (copy), l_Space_75_0 (copy), l_Checkbox_0 (ref), v25 (copy), v24 (copy), v31 (copy), l_BaseSize_0 (copy), l_RelativeSize_0 (copy), l_LinkButton_0 (ref)
            local l_createElement_0 = v2.createElement;
            local v33 = "Frame";
            local v34 = {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            };
            local v35 = {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v27.Tokens.Global.Space_150)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v27.Tokens.Global.Space_75)
                }), 
                LegalTextContainer = if v23.requireLegalTextCheckbox then v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, l_Space_75_0)
                    }), 
                    LegalCheckbox = v2.createElement(l_Checkbox_0, {
                        onActivated = v25, 
                        isSelected = v24, 
                        text = ""
                    }), 
                    LegalText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v31.legalTextKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v27.Theme.TextDefault.Color, 
                        TextTransparency = v27.Theme.TextDefault.Transparency, 
                        Font = v27.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, -(26 + l_Space_75_0), 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }) else (v23.alwaysShowLegalText or v23.countryCode.prefix == "1") and v2.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Text = v31.legalTextKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                    TextColor3 = v27.Theme.TextDefault.Color, 
                    TextTransparency = v27.Theme.TextDefault.Transparency, 
                    Font = v27.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                })
            };
            local v36 = false;
            if v23.countryCode.prefix == "1" then
                v36 = v2.createElement("Frame", {
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
                        onActivated = v23.onTermsOfUseClick, 
                        layoutOrder = 5, 
                        fontStyle = "CaptionBody", 
                        size = UDim2.fromScale(0.2, 0.2)
                    }), 
                    TextButtonDivider = v2.createElement("TextLabel", {
                        LayoutOrder = 6, 
                        BackgroundTransparency = 1, 
                        Text = "-", 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v27.Theme.TextDefault.Color, 
                        TextTransparency = v27.Theme.TextDefault.Transparency, 
                        Font = v27.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    PrivacyPolicyButton = v2.createElement(l_LinkButton_0, {
                        text = v31.privacyPolicyKey, 
                        onActivated = v23.onPrivacyPolicyClick, 
                        layoutOrder = 7, 
                        fontStyle = "CaptionBody"
                    })
                });
            end;
            v35.LegalButtonsContainer = v36;
            return l_createElement_0(v33, v34, v35);
        end
    });
end;