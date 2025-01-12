local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_StyledTextLabel_0 = v8.App.Text.StyledTextLabel;
local v11 = require(l_Parent_0.AuthCommon);
local l_AppStorageUtilities_0 = v11.Utils.AppStorageUtilities;
local l_AuthMemStorageKeys_0 = v11.Enums.AuthMemStorageKeys;
local l_SetPassword_0 = v11.Thunks.SetPassword;
local l_RegisterPasskey_0 = v11.Thunks.RegisterPasskey;
local l_InputValidity_0 = v11.Enums.InputValidity;
local l_DisclaimerLinks_0 = v11.Components.DisclaimerLinks;
local l_GetUserAppLaunchInfo_0 = v11.Http.Requests.GetUserAppLaunchInfo;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local v21 = require(l_Parent_0.AuthAnalytics);
local l_authModalShown_0 = v21.Events.authModalShown;
local l_authClientError_0 = v21.Events.authClientError;
local l_authMsgShown_0 = v21.Events.authMsgShown;
local l_authFormInteraction_0 = v21.Events.authFormInteraction;
local l_EventStreamConstants_0 = v21.EventStreamConstants;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v29 = require(l_Parent_0.RoactAppExperiment);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v31 = require(l_script_FirstAncestor_0.Hooks.useShowDisclaimerLinks);
local v32 = require(l_Parent_0.CredentialsProtocol);
local l_Constants_0 = v32.Constants;
local l_default_0 = v32.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v32.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v37 = require(l_Parent_0.AuthSignup);
local l_AuthTextInputValidator_0 = v37.Components.AuthTextInputValidator;
local l_PasswordValidator_0 = v37.Thunks.PasswordValidator;
local l_PasswordIssue_0 = v11.Enums.PasswordIssue;
local v41 = require(l_Parent_0.UserActivationFramework);
local l_FullPageActivationFrameworkContext_0 = v41.Context.FullPageActivationFrameworkContext;
local l_ActivationFrameworkWrapper_0 = v41.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v41.Enums.PayloadKey;
local v45 = require(l_Parent_0.SharedFlags);
local l_FStringLuaMultiPageSignupIxpLayer_0 = v45.FStringLuaMultiPageSignupIxpLayer;
local l_FFlagLuaMultiPageSignupForcePasskeyEnabledDev_0 = v45.FFlagLuaMultiPageSignupForcePasskeyEnabledDev;
local l_FFlagLuaMultiPageSignupForceDeviceBoundPasskey_0 = v45.FFlagLuaMultiPageSignupForceDeviceBoundPasskey;
local l_FFlagEnableCredentialsProtocolLoggingFix_0 = v45.FFlagEnableCredentialsProtocolLoggingFix;
local v50 = {
    l_PasswordIssue_0.Length, 
    l_PasswordIssue_0.UsernameMatch, 
    l_PasswordIssue_0.Simple
};
local v51 = {
    [l_PasswordIssue_0.Length] = "Authentication.SignUp.Label.NewPasswordError1", 
    [l_PasswordIssue_0.UsernameMatch] = "Authentication.SignUp.Label.NewPasswordError2", 
    [l_PasswordIssue_0.Simple] = "Authentication.SignUp.Label.NewPasswordError3"
};
return function(v52) --[[ Line: 87 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v5 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_InputValidity_0 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v31 (copy), l_AppStorageUtilities_0 (copy), v29 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_PayloadKey_0 (copy), l_GetUserAppLaunchInfo_0 (copy), l_Logger_0 (copy), l_GuiService_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_FFlagLuaMultiPageSignupForceDeviceBoundPasskey_0 (copy), l_authClientError_0 (copy), l_EventStreamConstants_0 (copy), l_MemStorageService_0 (copy), l_AuthMemStorageKeys_0 (copy), l_HttpService_0 (copy), l_Constants_0 (copy), l_FFlagEnableCredentialsProtocolLoggingFix_0 (copy), l_SetPassword_0 (copy), l_RegisterPasskey_0 (copy), l_authModalShown_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaMultiPageSignupForcePasskeyEnabledDev_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_DisclaimerLinks_0 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), l_AuthTextInputValidator_0 (copy), l_PasswordValidator_0 (copy), v50 (copy), v51 (copy), l_authFormInteraction_0 (copy), l_authMsgShown_0 (copy)
    local v53 = l_useRoactService_0(l_RoactNetworking_0);
    local v54 = v5.useContext(l_FullPageActivationFrameworkContext_0);
    local l_activationFrameworkState_0 = v54.activationFrameworkState;
    local l_Logout_0 = v54.monoDeps.Logout;
    local v57, v58 = v5.useState(false);
    local v59, v60 = v5.useState(true);
    local v61, v62 = v5.useState("");
    local v63, v64 = v5.useState(l_InputValidity_0.Unvalidated);
    local v65, v66 = v5.useState(false);
    local v67, v68 = v5.useState(false);
    local v69 = v5.useRef(nil);
    local v70 = l_useDesignTokens_0();
    local v71 = l_useStyle_0();
    local v72 = l_useDispatch_0();
    local v73 = v31();
    local v74, v75 = v5.useState("");
    local function _() --[[ Line: 113 ]]
        -- upvalues: l_AppStorageUtilities_0 (ref)
        l_AppStorageUtilities_0.setSignupActionRequired("");
        l_AppStorageUtilities_0.flush();
    end;
    local v79 = v29.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v77) --[[ Line: 121 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        local v78 = v77[l_FStringLuaMultiPageSignupIxpLayer_0] or {};
        return {
            shouldShowPasskeyOnMultiPageSignup = v78.shouldShowPasskeyOnMultiPageSignup or false, 
            shouldAwaitPasswordRegistrationOnMultiPageSignup = v78.shouldAwaitPasswordRegistrationOnMultiPageSignup or false, 
            shouldShowCreateAccountHeaderOnMultiPageSignup = v78.shouldShowCreateAccountHeaderOnMultiPageSignup or false
        };
    end);
    v5.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), l_PayloadKey_0 (ref), v75 (copy), l_AppStorageUtilities_0 (ref)
        if l_activationFrameworkState_0.payloadTable and l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupUsername] then
            v75(l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupUsername]);
            return;
        else
            v75(l_AppStorageUtilities_0.getIncompleteSignupUsername());
            return;
        end;
    end, {});
    v5.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v69 (copy)
        if v69.current and v69.current.focus then
            v69.current.focus();
        end;
    end, {});
    v5.useEffect(function() --[[ Line: 152 ]]
        -- upvalues: l_GetUserAppLaunchInfo_0 (ref), v53 (copy), l_Logger_0 (ref), l_AppStorageUtilities_0 (ref), v72 (copy), l_Logout_0 (copy), l_GuiService_0 (ref)
        l_GetUserAppLaunchInfo_0(v53):andThen(function(v80) --[[ Line: 153 ]]
            -- upvalues: l_Logger_0 (ref), l_AppStorageUtilities_0 (ref), v72 (ref), l_Logout_0 (ref), v53 (ref), l_GuiService_0 (ref)
            local v81 = nil;
            if v80 and v80.responseBody then
                v81 = v80.responseBody.name;
            end;
            if not v81 or v81 == "" then
                l_Logger_0:error("Signup username not found in payload or local storage.");
                l_AppStorageUtilities_0.setSignupActionRequired("");
                l_AppStorageUtilities_0.flush();
                v72(l_Logout_0(v53, l_GuiService_0));
            end;
        end):catch(function(v82) --[[ Line: 165 ]]
            -- upvalues: l_Logger_0 (ref), l_AppStorageUtilities_0 (ref), v72 (ref), l_Logout_0 (ref), v53 (ref), l_GuiService_0 (ref)
            l_Logger_0:error("Error fetching user app launch info: ", v82);
            l_AppStorageUtilities_0.setSignupActionRequired("");
            l_AppStorageUtilities_0.flush();
            v72(l_Logout_0(v53, l_GuiService_0));
        end);
    end, {});
    v5.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: v58 (copy), v63 (copy), l_InputValidity_0 (ref)
        v58(v63 == l_InputValidity_0.Valid);
    end, {
        v63
    });
    v5.useEffect(function() --[[ Line: 178 ]]
        -- upvalues: l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_FFlagLuaMultiPageSignupForceDeviceBoundPasskey_0 (ref), v68 (copy), v66 (copy), l_authClientError_0 (ref), v52 (copy), l_EventStreamConstants_0 (ref), l_Logger_0 (ref)
        l_default_0:isAvailable(l_default_0.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v83) --[[ Line: 181 ]]
            -- upvalues: l_FFlagLuaMultiPageSignupForceDeviceBoundPasskey_0 (ref), v68 (ref), v66 (ref)
            if v83.isAvailable or v83.FIDO2 and v83.FIDO2.isAvailable then
                local function _() --[[ Line: 186 ]]
                    -- upvalues: v83 (copy)
                    return v83.supportsDeviceBoundOnly or v83.FIDO2 and v83.FIDO2.supportsDeviceBoundOnly;
                end;
                if l_FFlagLuaMultiPageSignupForceDeviceBoundPasskey_0 then
                    v68(v83.supportsDeviceBoundOnly or v83.FIDO2 and v83.FIDO2.supportsDeviceBoundOnly);
                else
                    v68(true);
                end;
            end;
            if v83.password and v83.password.isAvailable then
                v66(true);
            end;
        end):catch(function(v85) --[[ Line: 200 ]]
            -- upvalues: l_authClientError_0 (ref), v52 (ref), l_EventStreamConstants_0 (ref), l_Logger_0 (ref)
            l_authClientError_0(v52.namespace, l_EventStreamConstants_0.State.CredentialsProtocolNotAvailable);
            l_Logger_0:warning("Error checking for credential availability. Error: ", v85);
        end);
    end, {});
    local function v88(v86, v87) --[[ Line: 206 ]]
        -- upvalues: v62 (copy), v64 (copy)
        v62(v86);
        v64(v87);
    end;
    local function v95() --[[ Line: 211 ]] --[[ Name: maybeRegisterPasswordToCredentialsProtocol ]]
        -- upvalues: v74 (copy), v61 (copy), l_MemStorageService_0 (ref), l_AuthMemStorageKeys_0 (ref), l_HttpService_0 (ref), v65 (copy), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_authClientError_0 (ref), v52 (copy), l_EventStreamConstants_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), v79 (copy)
        if v74 and v61 then
            l_MemStorageService_0:Fire(l_AuthMemStorageKeys_0.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                cvalue = v74, 
                password = v61, 
                authType = "signup"
            }));
            if v65 then
                local v89 = {
                    username = v74, 
                    password = v61
                };
                local v90 = l_HttpService_0:JSONEncode(v89);
                local v94 = l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v90, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v91) --[[ Line: 234 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_authClientError_0 (ref), v52 (ref), l_EventStreamConstants_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref)
                    local v92 = if v91 then l_HttpService_0:JSONDecode(v91) else {};
                    if v92 and v92.errorCode == nil then
                        l_Logger_0:info("Successfully registered password.");
                        return;
                    else
                        l_authClientError_0(v52.namespace, l_EventStreamConstants_0.State.RegisterCredentialsError);
                        if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                            l_Logger_0:warning("Error registering password: " .. tostring(v92.errorMsg));
                            return;
                        else
                            l_Logger_0:warning("Error registering password: ", v92.errorMsg);
                            return;
                        end;
                    end;
                end, function(v93) --[[ Line: 248 ]]
                    -- upvalues: l_authClientError_0 (ref), v52 (ref), l_EventStreamConstants_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_Logger_0 (ref)
                    l_authClientError_0(v52.namespace, l_EventStreamConstants_0.State.RegisterCredentialsError);
                    if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                        l_Logger_0:warning("Error registering password: " .. tostring(v93));
                        return;
                    else
                        l_Logger_0:warning("Error registering password: ", v93);
                        return;
                    end;
                end);
                if v79.shouldAwaitPasswordRegistrationOnMultiPageSignup then
                    v94:await();
                end;
            end;
        end;
    end;
    local function v98() --[[ Line: 263 ]] --[[ Name: onContinueWithPassword ]]
        -- upvalues: v57 (copy), v58 (copy), v60 (copy), l_SetPassword_0 (ref), v53 (copy), v61 (copy), l_Logger_0 (ref), l_authClientError_0 (ref), v52 (copy), l_EventStreamConstants_0 (ref), l_AppStorageUtilities_0 (ref), v95 (copy)
        if not v57 then
            return false, nil;
        else
            v58(false);
            v60(false);
            local v96, v97 = l_SetPassword_0(v53, v61):await();
            if not v96 then
                l_Logger_0:warning("Error setting password: ", v97);
                l_authClientError_0(v52.namespace, l_EventStreamConstants_0.State.SetPasswordError);
                return false, v97;
            else
                l_AppStorageUtilities_0.setSignupActionRequired("");
                l_AppStorageUtilities_0.flush();
                v95();
                return v96, nil;
            end;
        end;
    end;
    local function v101() --[[ Line: 284 ]] --[[ Name: onContinueWithPasskey ]]
        -- upvalues: v59 (copy), v60 (copy), v58 (copy), l_RegisterPasskey_0 (ref), v53 (copy), l_authClientError_0 (ref), v52 (copy), l_EventStreamConstants_0 (ref), l_authModalShown_0 (ref), l_AppStorageUtilities_0 (ref)
        if not v59 then
            return false, nil;
        else
            v60(false);
            v58(false);
            local v99, v100 = l_RegisterPasskey_0(v53):await();
            if not v99 then
                l_authClientError_0(v52.namespace, l_EventStreamConstants_0.State.RegisteringPasskeyError);
                return false, v100;
            else
                l_authModalShown_0(v52.namespace, l_EventStreamConstants_0.State.PasskeyRegistrationComplete);
                l_AppStorageUtilities_0.setSignupActionRequired("");
                l_AppStorageUtilities_0.flush();
                return v99, nil;
            end;
        end;
    end;
    local v102 = l_useLocalization_0({
        passwordLabel = "Authentication.Login.Label.Password", 
        passwordPlaceholder = "Authentication.SignUp.Label.Use8CharPassword"
    });
    local v103 = v79.shouldShowPasskeyOnMultiPageSignup and v67 or l_FFlagLuaMultiPageSignupForcePasskeyEnabledDev_0;
    local l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 = v79.shouldShowCreateAccountHeaderOnMultiPageSignup;
    local v105 = v103 and "Authentication.SignUp.Header.CreatePasswordOrPasskey" or "Authentication.SignUp.Header.CreatePassword";
    return v5.createElement(l_ActivationFrameworkWrapper_0, {
        namespace = v52.namespace, 
        titleTextKey = {
            v105; 
            username = "@" .. v74
        }, 
        bodyTextKey = "Authentication.SignUp.Description.ThisKeepYourAccountSecure", 
        headingTextKey = l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 and "Authentication.SignUp.Action.CreateAccount" or nil, 
        primaryButton = {
            buttonTextKey = "Authentication.SignUp.Action.NextWord", 
            shouldShowButton = true, 
            isButtonEnabled = v57, 
            onButtonClicked = function() --[[ Line: 330 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: v98 (copy), l_PayloadKey_0 (ref), v61 (copy), v58 (copy), v63 (copy), l_InputValidity_0 (ref), v60 (copy)
                local v106, _ = v98();
                if v106 then
                    return {
                        [l_PayloadKey_0.SignupPassword] = v61
                    };
                else
                    v58(v63 == l_InputValidity_0.Valid);
                    v60(true);
                    return nil;
                end;
            end
        }, 
        secondaryButton = {
            buttonTextKey = "Authentication.SignUp.Action.CreateAPasskey", 
            shouldShowButton = v103, 
            isButtonEnabled = v59, 
            onButtonClicked = function() --[[ Line: 345 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: v101 (copy), v58 (copy), v63 (copy), l_InputValidity_0 (ref), v60 (copy)
                local v108, _ = v101();
                if v108 then
                    return {};
                else
                    v58(v63 == l_InputValidity_0.Valid);
                    v60(true);
                    return nil;
                end;
            end
        }, 
        navigation = v52.navigation, 
        subFooterContent = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DisclaimerLinks = if v73 then v5.createElement(l_DisclaimerLinks_0, {
                ctx = v52.namespace, 
                state = l_activationFrameworkState_0.currentState
            }) else nil
        })
    }, {
        Content = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v70.Global.Space_20)
            }), 
            ContentPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v70.Global.Space_20)
            }), 
            PasswordInputLabel = if l_GetFFlagEnableSignupFoundationText_0() then v5.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v102.passwordLabel, 
                tag = "text-body-small auto-xy"
            }) else v5.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v102.passwordLabel, 
                fontStyle = v71.Font.Body, 
                colorStyle = v71.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            PasswordLabelSpacing = v5.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v70.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            PasswordField = v5.createElement(l_AuthTextInputValidator_0, {
                layoutOrder = 3, 
                textInputType = Enum.TextInputType.Password, 
                placeholder = v102.passwordPlaceholder, 
                validator = l_PasswordValidator_0, 
                validatorAdditionalProps = {
                    username = v74
                }, 
                validatorIssuePriorityList = v50, 
                validatorIssueMessageList = v51, 
                onTextChanged = v88, 
                onTextFocusedGained = function() --[[ Line: 419 ]] --[[ Name: onTextFocusedGained ]]
                    -- upvalues: l_authFormInteraction_0 (ref), v54 (copy), l_EventStreamConstants_0 (ref)
                    l_authFormInteraction_0(v54.activationFrameworkState.namespace, l_EventStreamConstants_0.Field.Password, v54.activationFrameworkState.currentState, nil, true);
                end, 
                onErrorShown = function(v110) --[[ Line: 428 ]] --[[ Name: onErrorShown ]]
                    -- upvalues: l_authMsgShown_0 (ref), v52 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref)
                    l_authMsgShown_0(v52.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.Password, v110);
                end, 
                textBoxRef = v69
            })
        })
    });
end;