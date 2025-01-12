local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RobloxLocaleId_0 = game:GetService("LocalizationService").RobloxLocaleId;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserActivationFramework);
local v5 = require(l_Parent_0.AuthCommon);
local v6 = require(l_Parent_0.AuthSignup);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_script_FirstAncestor_0.Utils.debounce);
local l_Birthday_0 = v5.Models.Birthday;
local l_BirthdayPicker_0 = v6.Components.BirthdayPicker;
local l_FullPageActivationFrameworkContext_0 = v4.Context.FullPageActivationFrameworkContext;
local l_ActivationFrameworkWrapper_0 = v4.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v4.Enums.PayloadKey;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_TitleAndParagraph_0 = v5.Components.TitleAndParagraph;
local l_DisclaimerLinks_0 = v5.Components.DisclaimerLinks;
local l_AuthActionTextUtil_0 = v5.Utils.AuthActionTextUtil;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local v22 = require(l_Parent_0.Foundation);
local l_Text_0 = v22.Text;
local v24 = require(l_Parent_0.SharedFlags);
local l_FStringLuaMultiPageSignupIxpLayer_0 = v24.FStringLuaMultiPageSignupIxpLayer;
local l_FIntSignupMinimumAge_0 = v24.FIntSignupMinimumAge;
local v27 = require(l_script_FirstAncestor_0.Analytics.MultiPageSignupConstants);
local v28 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v28.EventStreamConstants;
local l_authMsgShown_0 = v28.Events.authMsgShown;
local l_authFormInteraction_0 = v28.Events.authFormInteraction;
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v24.GetFFlagEnableMultiPageSignupV2Updates;
local v33 = require(l_Parent_0.RoactAppExperiment);
local l_DateHelper_0 = require(l_Parent_0.Time).DateHelper;
return function(v35) --[[ Line: 53 ]]
    -- upvalues: v3 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_DateHelper_0 (copy), v33 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_Birthday_0 (copy), l_authFormInteraction_0 (copy), v27 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), l_RobloxLocaleId_0 (copy), v8 (copy), l_authMsgShown_0 (copy), l_EventStreamConstants_0 (copy), l_FIntSignupMinimumAge_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_PayloadKey_0 (copy), l_TitleAndParagraph_0 (copy), l_AuthActionTextUtil_0 (copy), l_DisclaimerLinks_0 (copy), l_BirthdayPicker_0 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), v22 (copy)
    local v36, v37 = v3.useState(nil);
    local v38, v39 = v3.useState(nil);
    local v40, v41 = v3.useState(false);
    local v42, v43 = v3.useState("");
    local l_activationFrameworkState_0 = v3.useContext(l_FullPageActivationFrameworkContext_0).activationFrameworkState;
    local v45 = nil;
    if v36 then
        v45 = l_DateHelper_0.MonthsLocalizationKeys[v36.Month] or nil;
    end;
    local v48 = v33.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v46) --[[ Line: 71 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        local v47 = v46[l_FStringLuaMultiPageSignupIxpLayer_0] or {};
        return {
            birthdayTitle = v47.birthdayTitle, 
            birthdayDescription = v47.birthdayDescription, 
            shouldShowCreateAccountHeaderOnMultiPageSignup = v47.shouldShowCreateAccountHeaderOnMultiPageSignup or false
        };
    end);
    local v49 = l_useLocalization_0({
        monthText = v45, 
        dayAffix = l_DateHelper_0.DayAffixLocalizationKey, 
        yearAffix = l_DateHelper_0.YearAffixLocalizationKey, 
        birthdayHint = "Authentication.SignUp.Label.SelectYourBirthday", 
        birthdayLabel = "Authentication.SignUp.Label.Birthday", 
        invalidBirthdayText = "Authentication.SignUp.Label.Error.MinimumAge5", 
        nextButtonText = "Authentication.SignUp.Action.NextWord", 
        ageText = {
            "Authentication.SignUp.Label.YearsOld"; 
            yearsOld = if v38 then tostring(v38) else ""
        }
    });
    local v50 = l_useLocalization_0({
        fullDateString = {
            "Authentication.SignUp.Label.FullDateString"; 
            Month = v49.monthText, 
            Day = if v36 then tostring(v36.Day) else "", 
            Year = if v36 then tostring(v36.Year) else ""
        }
    });
    local v51 = l_useStyle_0();
    local v52 = l_useDesignTokens_0();
    local v57 = v3.useCallback(function(v53, v54, v55) --[[ Line: 106 ]]
        -- upvalues: v36 (copy), l_DateHelper_0 (ref), l_Birthday_0 (ref), l_authFormInteraction_0 (ref), v27 (ref), v37 (copy), v39 (copy)
        if (v36 == nil or v36.Month ~= v53 or v36.Day ~= v54 or v36.Year ~= v55) and l_DateHelper_0:isValidDate(v53, v54, v55) then
            local v56 = l_Birthday_0.new({
                Month = v53, 
                Day = v54, 
                Year = v55
            });
            l_authFormInteraction_0(v27.ctx.multiPageSignup, v27.field.updateBirthday, v27.state.enterBirthdayComponent);
            v37(v56);
            v39(v56:GetAgeInYears());
        end;
    end, {
        v36
    });
    v3.useEffect(function() --[[ Line: 126 ]]
        -- upvalues: v36 (copy), v43 (copy), v49 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v50 (copy), l_DateHelper_0 (ref), l_RobloxLocaleId_0 (ref)
        if v36 == nil then
            v43(v49.birthdayHint);
            return;
        elseif l_GetFFlagEnableMultiPageSignupV2Updates_0() then
            v43(v50.fullDateString .. " " .. v49.ageText);
            return;
        else
            local v58 = if v36 then l_DateHelper_0:GetFormattedFullString(v49.monthText, v36.Day, v49.dayAffix, v36.Year, v49.yearAffix, " ", l_RobloxLocaleId_0) else "";
            v43(v58 .. " " .. v49.ageText);
            return;
        end;
    end, {
        v49.monthText, 
        v49.dayAffix, 
        v49.yearAffix, 
        v36
    });
    local v60 = v3.useCallback(v8(function(v59) --[[ Line: 151 ]]
        -- upvalues: l_authMsgShown_0 (ref), v35 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref)
        if v59 then
            l_authMsgShown_0(v35.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.InvalidBirthday);
        end;
    end, 1), {});
    v3.useEffect(function() --[[ Line: 163 ]]
        -- upvalues: v38 (copy), l_FIntSignupMinimumAge_0 (ref), v41 (copy), v60 (copy)
        if v38 == nil then
            return;
        else
            local v61 = v38 < l_FIntSignupMinimumAge_0;
            v41(v61);
            v60(v61);
            return;
        end;
    end, {
        v38
    });
    local v62 = v36 and not v40 or false;
    local l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 = v48.shouldShowCreateAccountHeaderOnMultiPageSignup;
    return v3.createElement(l_ActivationFrameworkWrapper_0, {
        namespace = v35.namespace, 
        titleTextKey = "Authentication.SignUp.MultiscreenAB.Label.BirthdayQuestion", 
        bodyTextKey = "Authentication.SignUp.Description.BirthdayHelp3", 
        headingTextKey = l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 and "Authentication.SignUp.Action.CreateAccount" or nil, 
        ixpTitleTextKey = v48.birthdayTitle, 
        ixpBodyTextKey = v48.birthdayDescription, 
        primaryButton = {
            buttonTextKey = "Authentication.SignUp.Action.NextWord", 
            shouldShowButton = true, 
            isButtonEnabled = v62, 
            onButtonClicked = function() --[[ Line: 187 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: l_PayloadKey_0 (ref), l_Birthday_0 (ref), v36 (copy), v38 (copy)
                return {
                    [l_PayloadKey_0.SignupBirthdayTimestampUtc] = l_Birthday_0.FormatForEndpoint(v36), 
                    [l_PayloadKey_0.SignupAge] = tostring(v38)
                };
            end
        }, 
        shouldExpandMiddleContent = true, 
        subFooterContent = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, v52.Global.Space_50)
            }), 
            DisclaimerText = v3.createElement(l_TitleAndParagraph_0, {
                LayoutOrder = 1, 
                textXAlignment = Enum.TextXAlignment.Left, 
                paragraphTextKeys = {
                    l_AuthActionTextUtil_0.getSignUpVerificationParagraphTextWithNextButton()
                }, 
                paragraphTextArgs = {
                    {}
                }
            }), 
            DisclaimerLinks = v3.createElement(l_DisclaimerLinks_0, {
                ctx = v35.namespace, 
                state = l_activationFrameworkState_0.currentState, 
                LayoutOrder = 2
            })
        }), 
        navigation = v35.navigation
    }, {
        Content = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v52.Global.Space_50)
            }), 
            v3.createElement(l_BirthdayPicker_0, {
                LayoutOrder = 1, 
                skipUpdateOnMount = false, 
                minAgeAllowed = l_FIntSignupMinimumAge_0, 
                updateBirthday = v57
            }), 
            ErrorSpacing = v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v52.Global.Space_100)
            }), 
            ErrorTextLabel = if l_GetFFlagEnableSignupFoundationText_0() then v3.createElement(l_Text_0, {
                LayoutOrder = 3, 
                Text = if v40 then v49.invalidBirthdayText else "", 
                textStyle = {
                    Color3 = v51.Theme.Alert.Color, 
                    Transparency = v51.Theme.Alert.Transparency
                }, 
                tag = "text-body-small text-align-x-center size-full-0 auto-y", 
                TextWrapped = true
            }) else v3.createElement(l_StyledTextLabel_0, {
                layoutOrder = 3, 
                text = if v40 then v49.invalidBirthdayText else "", 
                fontStyle = v51.Font.BodySmall, 
                colorStyle = v51.Theme.Alert, 
                automaticSize = Enum.AutomaticSize.XY, 
                textWrapped = true
            })
        }), 
        SelectedBirthdayText = v3.createElement(v22.Text, {
            Text = v42, 
            tag = "text-label-medium text-align-x-center size-full-0 auto-y position-bottom-center anchor-bottom-center"
        })
    });
end;