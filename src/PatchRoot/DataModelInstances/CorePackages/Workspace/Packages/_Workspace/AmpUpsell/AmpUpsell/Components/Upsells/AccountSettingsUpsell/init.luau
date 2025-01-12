local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactRodux);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v7 = require(l_script_FirstAncestor_0.Analytics.sendButtonClickEvent);
local v8 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableConsolidateCancelAccountSettingsUpsell);
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useStyle_0 = v2.Core.Style.useStyle;
AccountSettingsUpsell = function(v14) --[[ Line: 29 ]] --[[ Name: AccountSettingsUpsell ]]
    -- upvalues: v9 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), v6 (copy), v3 (copy), l_PartialPageModal_0 (copy), v7 (copy), v8 (copy), l_ButtonType_0 (copy), l_StyledTextLabel_0 (copy)
    local l_onCloseModal_0 = v14.onCloseModal;
    local v16 = nil;
    v16 = if v9() then v14.onCloseModal else v14.onCancelled;
    local l_localizationStrings_0 = v14.localizationStrings;
    local l_featureName_0 = v14.featureName;
    local v19 = l_useLocalization_0(l_localizationStrings_0);
    local v20 = l_useStyle_0();
    local v21 = if v14.analyticsService then v14.analyticsService else v6.EventStream;
    local v22 = v3.createElement(l_PartialPageModal_0, {
        title = v19.title, 
        screenSize = v14.screenSize, 
        onCloseClicked = function() --[[ Line: 46 ]] --[[ Name: onCloseClicked ]]
            -- upvalues: v7 (ref), v21 (copy), v8 (ref), l_featureName_0 (copy), l_onCloseModal_0 (copy)
            v7(v21, v8.AccountSettingsUpsell, l_featureName_0, "CloseModal");
            l_onCloseModal_0();
        end, 
        buttonStackProps = {
            forcedFillDirection = Enum.FillDirection.Horizontal, 
            buttonHeight = 48, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = function() --[[ Line: 58 ]] --[[ Name: onActivated ]]
                            -- upvalues: v7 (ref), v21 (copy), v8 (ref), l_featureName_0 (copy), v16 (ref)
                            v7(v21, v8.AccountSettingsUpsell, l_featureName_0, "Cancelled");
                            v16();
                        end, 
                        text = v19.buttonCancel
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = function() --[[ Line: 74 ]] --[[ Name: onActivated ]]
                            -- upvalues: v7 (ref), v21 (copy), v8 (ref), l_featureName_0 (copy), v14 (copy), v19 (copy)
                            v7(v21, v8.AccountSettingsUpsell, l_featureName_0, "OpenAccountSettings");
                            v14.openAccountSettings(v19.buttonSettings);
                        end, 
                        text = v19.buttonSettings
                    }
                }
            }
        }
    }, {
        ViewFrame = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            Text = v3.createElement(l_StyledTextLabel_0, {
                fontStyle = v20.Font.Body, 
                colorStyle = v20.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.Y, 
                text = v19.message
            })
        })
    });
    return v3.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        ImageTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Overlay = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Content = v22
        })
    });
end;
AccountSettingsUpsell = v4.connect(function(v23, _) --[[ Line: 128 ]]
    return {
        screenSize = v23.ScreenSize
    };
end)(AccountSettingsUpsell);
return AccountSettingsUpsell;