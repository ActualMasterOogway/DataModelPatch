local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SetGender_0 = require(l_Parent_0.AuthSignup).Thunks.SetGender;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.UserActivationFramework);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Parent_0.AuthCommon);
local l_FullPageActivationFrameworkContext_0 = v7.Context.FullPageActivationFrameworkContext;
local l_ActivationFrameworkWrapper_0 = v7.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v7.Enums.PayloadKey;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v14 = require(l_script_FirstAncestor_0.Hooks.useShowDisclaimerLinks);
local l_DisclaimerLinks_0 = v9.Components.DisclaimerLinks;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_Button_0 = v8.App.Button.Button;
local v18 = require(l_script_FirstAncestor_0.Analytics.MultiPageSignupConstants);
local v19 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v19.EventStreamConstants;
local l_authClientError_0 = v19.Events.authClientError;
local l_authButtonClick_0 = v19.Events.authButtonClick;
local v23 = require(l_Parent_0.RoactAppExperiment);
local v24 = require(l_Parent_0.SharedFlags);
local l_FStringLuaMultiPageSignupIxpLayer_0 = v24.FStringLuaMultiPageSignupIxpLayer;
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v24.GetFFlagEnableMultiPageSignupV2Updates;
local v27 = {
    Male = "Male", 
    Female = "Female", 
    Unknown = "Unknown"
};
return function(v28) --[[ Line: 50 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDesignTokens_0 (copy), v6 (copy), l_FullPageActivationFrameworkContext_0 (copy), v27 (copy), v14 (copy), v23 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_PayloadKey_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), l_SetGender_0 (copy), l_authClientError_0 (copy), l_EventStreamConstants_0 (copy), l_DisclaimerLinks_0 (copy), l_Button_0 (copy), l_authButtonClick_0 (copy), v18 (copy)
    local v29 = l_useRoactService_0(l_RoactNetworking_0);
    local v30 = l_useDesignTokens_0();
    local l_activationFrameworkState_0 = v6.useContext(l_FullPageActivationFrameworkContext_0).activationFrameworkState;
    local v32, v33 = v6.useState(v27.Unknown);
    local v34 = v14();
    local v37 = v23.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v35) --[[ Line: 60 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        local v36 = v35[l_FStringLuaMultiPageSignupIxpLayer_0] or {};
        return {
            genderTitle = v36.genderTitle, 
            genderDescription = v36.genderDescription, 
            shouldShowCreateAccountHeaderOnMultiPageSignup = v36.shouldShowCreateAccountHeaderOnMultiPageSignup or false
        };
    end);
    local v38 = (tonumber(l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupAge]) or 100) < 13;
    local v39 = l_useLocalization_0({
        genderMale = "Authentication.SignUp.Label.GenderMale", 
        genderFemale = "Authentication.SignUp.Label.GenderFemale", 
        genderBoy = "Authentication.SignUp.Labely.Boy", 
        genderGirl = "Authentication.SignUp.Label.Girl", 
        genderPreferNotToSay = "Authentication.SignUp.Button.GenderPreferNotToSay"
    });
    local l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 = v37.shouldShowCreateAccountHeaderOnMultiPageSignup;
    local v50 = (function() --[[ Line: 86 ]] --[[ Name: useButtonStates ]]
        -- upvalues: v6 (ref), l_ButtonType_0 (ref), v33 (copy), v27 (ref)
        local v41, v42 = v6.useState(l_ButtonType_0.Secondary);
        local v43, v44 = v6.useState(l_ButtonType_0.Secondary);
        local v45, v46 = v6.useState(l_ButtonType_0.Secondary);
        local function v49(v47, v48) --[[ Line: 91 ]] --[[ Name: changeButtonState ]]
            -- upvalues: v42 (copy), l_ButtonType_0 (ref), v44 (copy), v46 (copy), v33 (ref), v27 (ref)
            v42(l_ButtonType_0.Secondary);
            v44(l_ButtonType_0.Secondary);
            v46(l_ButtonType_0.Secondary);
            if v47 == l_ButtonType_0.Secondary then
                v48(l_ButtonType_0.PrimarySystem);
                return;
            else
                v48(l_ButtonType_0.Secondary);
                v33(v27.Unknown);
                return;
            end;
        end;
        return {
            maleButtonState = v41, 
            femaleButtonState = v43, 
            preferNotToSayButtonState = v45, 
            changeMaleButtonState = function() --[[ Line: 110 ]] --[[ Name: changeMaleButtonState ]]
                -- upvalues: v33 (ref), v27 (ref), v49 (copy), v41 (copy), v42 (copy)
                v33(v27.Male);
                v49(v41, v42);
            end, 
            changeFemaleButtonState = function() --[[ Line: 114 ]] --[[ Name: changeFemaleButtonState ]]
                -- upvalues: v33 (ref), v27 (ref), v49 (copy), v43 (copy), v44 (copy)
                v33(v27.Female);
                v49(v43, v44);
            end, 
            changePreferNotToSayButtonState = function() --[[ Line: 118 ]] --[[ Name: changePreferNotToSayButtonState ]]
                -- upvalues: v33 (ref), v27 (ref), v49 (copy), v45 (copy), v46 (copy)
                v33(v27.Unknown);
                v49(v45, v46);
            end
        };
    end)();
    return v6.createElement(l_ActivationFrameworkWrapper_0, {
        namespace = v28.namespace, 
        titleTextKey = "Authentication.SignUp.Title.HowDoYouIdentify", 
        bodyTextKey = "Authentication.SignUp.Description.SharingGenderOptional", 
        headingTextKey = l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 and "Authentication.SignUp.Action.CreateAccount" or nil, 
        ixpTitleTextKey = v37.genderTitle, 
        ixpBodyTextKey = v37.genderDescription, 
        primaryButton = {
            buttonTextKey = l_GetFFlagEnableMultiPageSignupV2Updates_0() and "CommonUI.Controls.Action.Done" or "Authentication.SignUp.Action.CreateAccount", 
            shouldShowButton = true, 
            isButtonEnabled = true, 
            onButtonClicked = function() --[[ Line: 142 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: l_PayloadKey_0 (ref), v27 (ref), l_SetGender_0 (ref), v29 (copy), v32 (copy), l_authClientError_0 (ref), v28 (copy), l_EventStreamConstants_0 (ref)
                local v51 = {
                    [l_PayloadKey_0.SignupGender] = v27.Unknown
                };
                return l_SetGender_0.setGender(v29, v32):andThen(function() --[[ Line: 145 ]]
                    -- upvalues: v51 (copy), l_PayloadKey_0 (ref), v32 (ref)
                    v51[l_PayloadKey_0.SignupGender] = v32;
                    return v51;
                end):catch(function() --[[ Line: 149 ]]
                    -- upvalues: l_authClientError_0 (ref), v28 (ref), l_EventStreamConstants_0 (ref), v51 (copy)
                    l_authClientError_0(v28.namespace, l_EventStreamConstants_0.State.SetGenderError);
                    return v51;
                end);
            end
        }, 
        navigation = v28.navigation, 
        shouldExpandMiddleContent = true, 
        subFooterContent = v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DisclaimerLinks = if v34 then v6.createElement(l_DisclaimerLinks_0, {
                ctx = v28.namespace, 
                state = l_activationFrameworkState_0.currentState
            }) else nil
        })
    }, {
        Content = v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v30.Global.Space_200)
            }), 
            MaleButton = v6.createElement(l_Button_0, {
                buttonType = v50.maleButtonState, 
                layoutOrder = 2, 
                size = UDim2.new(1, 0, 0, v30.Global.Size_600), 
                text = if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v38 then v39.genderBoy else v39.genderMale, 
                onActivated = function() --[[ Line: 193 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v18 (ref), v50 (copy)
                    l_authButtonClick_0(v18.ctx.multiPageSignup, v18.btn.male, v18.state.selectGenderComponent);
                    v50.changeMaleButtonState();
                end
            }), 
            FemaleButton = v6.createElement(l_Button_0, {
                buttonType = v50.femaleButtonState, 
                layoutOrder = 3, 
                size = UDim2.new(1, 0, 0, v30.Global.Size_600), 
                text = if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v38 then v39.genderGirl else v39.genderFemale, 
                onActivated = function() --[[ Line: 210 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v18 (ref), v50 (copy)
                    l_authButtonClick_0(v18.ctx.multiPageSignup, v18.btn.female, v18.state.selectGenderComponent);
                    v50.changeFemaleButtonState();
                end
            }), 
            PreferNotToSay = v6.createElement(l_Button_0, {
                buttonType = v50.preferNotToSayButtonState, 
                layoutOrder = 4, 
                size = UDim2.new(1, 0, 0, v30.Global.Size_600), 
                text = v39.genderPreferNotToSay, 
                onActivated = function() --[[ Line: 225 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v18 (ref), v50 (copy)
                    l_authButtonClick_0(v18.ctx.multiPageSignup, v18.btn.preferNotToSay, v18.state.selectGenderComponent);
                    v50.changePreferNotToSayButtonState();
                end
            })
        })
    });
end;