local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v7 = require(l_script_FirstAncestor_0.Enums);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_UserIdentifierType_0 = v7.UserIdentifierType;
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.Promise);
local v12 = require(l_Parent_0.AuthCommon);
local v13 = require(l_Parent_0.OtpLogin);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_OpenAccountSwitchingErrorOverlay_0 = require(l_Parent_0.AccountSwitcher).OpenAccountSwitchingErrorOverlay;
local l_RenderChallenge_0 = require(l_Parent_0.GenericChallenges).Middleware.RenderChallenge;
local l_ChallengeType_0 = require(l_Parent_0.GenericChallenges).Types.ChallengeType;
local l_TwoStepVerificationActionType_0 = require(l_Parent_0.GenericChallenges).Types.TwoStepVerificationActionType;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v28 = require(l_Parent_0.AuthAnalytics);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_EventStreamConstants_0 = require(l_Parent_0.AuthAnalytics).EventStreamConstants;
local v31 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v31.RoactNetworking;
local l_RoactAnalytics_0 = v31.RoactAnalytics;
local l_AppLinking_0 = v31.AppLinking;
local l_AppOmniRecommendationsRequest_0 = v31.AppOmniRecommendationsRequest;
local v36 = require(l_Parent_0.CredentialsProtocol);
local l_Constants_0 = v36.Constants;
local l_default_0 = v36.CredentialsProtocol.default;
local v39 = require(l_Parent_0.SharedFlags);
local l_IsPrefetchOneCopyEnabled_0 = v39.IsPrefetchOneCopyEnabled;
local l_GetFFlagEnableLoginAccountSelector_0 = v39.GetFFlagEnableLoginAccountSelector;
local l_FFlagEnableLuaAccountSwitch_0 = v39.FFlagEnableLuaAccountSwitch;
local l_FFlagLuaEnableDidSwitchAccount_0 = v39.FFlagLuaEnableDidSwitchAccount;
local l_GetFStringVNGDownloadNowUrl_0 = v39.GetFStringVNGDownloadNowUrl;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v39.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local v46 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v47 = require(l_script_FirstAncestor_0.Reducers.LoginStateReducer);
local v48 = require(l_script_FirstAncestor_0.Thunks.StartAuthenticationByUser);
local v49 = require(l_script_FirstAncestor_0.Thunks.StartPasskeyAuthentication);
local v50 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v51 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local l_Base64_0 = v12.Utils.Base64;
local l_AccountSwitcherConstants_0 = v12.Common.AccountSwitcherConstants;
local l_LoginResult_0 = v12.Models.LoginResult;
local l_SetLoginResult_0 = v12.Actions.SetLoginResult;
local l_SetBackNavigationDisabled_0 = v12.Actions.SetBackNavigationDisabled;
local l_authClientError_0 = v28.Events.authClientError;
local l_authButtonClick_0 = v28.Events.authButtonClick;
local l_reportEphemeralCounter_0 = v12.Analytics.reportEphemeralCounter;
local l_AppStorageUtilities_0 = v12.Utils.AppStorageUtilities;
local l_LoginByPasskey_0 = v12.Thunks.LoginByPasskey;
local l_LoginByCode_0 = v12.Thunks.LoginByCode;
local l_LoginByOtp_0 = v12.Thunks.LoginByOtp;
local l_Login_0 = v12.Thunks.Login;
local l_User_0 = v12.Thunks.User;
local l_AppLoginCounterNames_0 = v12.Enums.AppLoginCounterNames;
local l_LoginErrorCodes_0 = v12.Enums.LoginErrorCodes;
local l_OpenCentralOverlayForLoginPasswordResetPrompt_0 = v12.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt;
local l_LogoutAllLoggedInUsers_0 = v12.Thunks.LogoutAllLoggedInUsers;
local l_AuthLocalStorageKeys_0 = v12.Enums.AuthLocalStorageKeys;
local l_OpenAccountSelector_0 = v12.Thunks.OpenAccountSelector;
local l_AuthMemStorageKeys_0 = v12.Enums.AuthMemStorageKeys;
local l_TwoStepRequests_0 = v12.Http.Requests.TwoStepRequests;
local l_SendCode_0 = v13.Thunks.SendCode;
local l_ResendCode_0 = v13.Thunks.ResendCode;
local l_Constants_1 = v13.Constants;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
return function(v79) --[[ Line: 115 ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_UserIdentifierType_0 (copy), v10 (copy), v47 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_AppLinking_0 (copy), l_IsPrefetchOneCopyEnabled_0 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useAppPolicy_0 (copy), v49 (copy), v48 (copy), l_SetLoginResult_0 (copy), l_SetBackNavigationDisabled_0 (copy), l_LaunchContext_0 (copy), v11 (copy), v51 (copy), v50 (copy), l_LoginByPasskey_0 (copy), l_LoginByCode_0 (copy), l_LoginByOtp_0 (copy), l_CloseCentralOverlay_0 (copy), l_Login_0 (copy), l_OpenAccountSelector_0 (copy), l_User_0 (copy), l_RenderChallenge_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), l_AppStorageUtilities_0 (copy), l_FFlagLuaEnableDidSwitchAccount_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_HttpService_0 (copy), l_MemStorageService_0 (copy), l_AuthMemStorageKeys_0 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_ChallengeType_0 (copy), l_TwoStepVerificationActionType_0 (copy), l_TwoStepRequests_0 (copy), l_reportEphemeralCounter_0 (copy), l_AppLoginCounterNames_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_LoginResult_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_Constants_1 (copy), l_SendCode_0 (copy), l_ResendCode_0 (copy), l_UserInputService_0 (copy), l_Base64_0 (copy), l_OpenAccountSwitchingErrorOverlay_0 (copy), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (copy), l_LogoutAllLoggedInUsers_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_GetFStringVNGDownloadNowUrl_0 (copy), l_LoginErrorCodes_0 (copy), l_StatusCodes_0 (copy), l_authClientError_0 (copy), v46 (copy)
    local v82 = l_useNavigationProps_0(function(_, v81) --[[ Line: 116 ]]
        return {
            credProtocolIsAvailableResponse = v81.credProtocolIsAvailableResponse
        };
    end);
    local v83 = {
        userIdentifier = "", 
        userIdentifierType = l_UserIdentifierType_0.Unknown, 
        numLoginAttempts = 0, 
        forceLoginByUsername = false, 
        availableLoginMethods = {}, 
        credentialsProtocolStatus = {
            fido2Supported = false, 
            passwordsSupported = false, 
            v2InterfaceSupported = false, 
            shouldShowAuthScreenCredentialsPopup = false, 
            initialStateUpdated = false
        }, 
        shouldAutoShowCredentialPopup = true, 
        componentState = {
            LoginScreenV2 = {
                errorKey = "", 
                userIdentifier = ""
            }, 
            AuthenticationScreen = {
                errorKey = "", 
                errorType = nil, 
                password = ""
            }, 
            EmailOtpScreen = {
                errorKey = "", 
                emailOtp = "", 
                sessionToken = ""
            }
        }, 
        monoDeps = v79.monoDeps, 
        extraProps = v82
    };
    local v84, v85 = v10.useReducer(v47, v83);
    local v86 = l_useDispatch_0();
    local v87 = l_useRoactService_0(l_RoactNetworking_0);
    local v88 = l_useRoactService_0(l_RoactAnalytics_0);
    local v89 = l_useRoactService_0(l_AppLinking_0);
    local v90 = if l_IsPrefetchOneCopyEnabled_0() then l_useRoactService_0(l_AppOmniRecommendationsRequest_0) else nil;
    local v92 = l_useAppPolicy_0(function(v91) --[[ Line: 165 ]]
        return v91;
    end);
    local l_LaunchApp_0 = v84.monoDeps.LaunchApp;
    local l_ResetAppState_0 = v84.monoDeps.ResetAppState;
    local l_Logout_0 = v84.monoDeps.Logout;
    local function v96() --[[ Line: 174 ]]
        -- upvalues: v86 (copy), v49 (ref), v87 (copy)
        return v86(v49(v87));
    end;
    local function v98(v97) --[[ Line: 178 ]]
        -- upvalues: v86 (copy), v48 (ref), v87 (copy)
        return v86(v48(v87, v97));
    end;
    local function _(v99) --[[ Line: 182 ]]
        -- upvalues: v86 (copy), l_SetLoginResult_0 (ref)
        return v86(l_SetLoginResult_0(v99));
    end;
    local function _(v101) --[[ Line: 186 ]]
        -- upvalues: v86 (copy), l_SetBackNavigationDisabled_0 (ref)
        return v86(l_SetBackNavigationDisabled_0(v101));
    end;
    local function _() --[[ Line: 190 ]]
        -- upvalues: v86 (copy), l_LaunchApp_0 (copy), v87 (copy), v90 (copy), v88 (copy), v92 (copy), l_LaunchContext_0 (ref)
        return v86(l_LaunchApp_0(v87, v90, v88, v92, l_LaunchContext_0.Login));
    end;
    local function v104() --[[ Line: 194 ]]
        -- upvalues: v86 (copy), l_ResetAppState_0 (copy), v11 (ref)
        v86(l_ResetAppState_0());
        return v11.resolve();
    end;
    local function v105() --[[ Line: 199 ]]
        -- upvalues: v85 (copy), v51 (ref), v50 (ref), l_UserIdentifierType_0 (ref)
        v85({
            type = v51.SetComponentState, 
            data = {
                component = v50.AuthenticationScreen, 
                payload = {
                    errorKey = "", 
                    errorType = nil, 
                    password = ""
                }
            }
        });
        v85({
            type = v51.SetComponentState, 
            data = {
                component = v50.LoginScreenV2, 
                payload = {
                    errorKey = "", 
                    userIdentifier = ""
                }
            }
        });
        v85({
            type = v51.SetUserIdentifierAndType, 
            data = {
                userIdentifier = "", 
                userIdentifierType = l_UserIdentifierType_0.Unknown
            }
        });
    end;
    local function _(v106, v107) --[[ Line: 230 ]]
        -- upvalues: v86 (copy), l_LoginByPasskey_0 (ref), v87 (copy)
        return v86(l_LoginByPasskey_0(v87, v106, v107));
    end;
    local function _(v109, v110, v111, v112, v113, v114) --[[ Line: 234 ]]
        -- upvalues: v86 (copy), l_LoginByCode_0 (ref), v87 (copy)
        return v86(l_LoginByCode_0(v87, v109, v110, v111, v112, v113, v114));
    end;
    local function _(v116, v117, v118, v119, v120) --[[ Line: 255 ]]
        -- upvalues: v86 (copy), l_LoginByOtp_0 (ref), v87 (copy)
        return v86(l_LoginByOtp_0(v87, v116, v117, v118, v119, v120));
    end;
    local function v122() --[[ Line: 274 ]]
        -- upvalues: v86 (copy), l_CloseCentralOverlay_0 (ref)
        return v86(l_CloseCentralOverlay_0());
    end;
    local function v123(...) --[[ Line: 278 ]]
        -- upvalues: v86 (copy), l_Login_0 (ref)
        return v86(l_Login_0(...));
    end;
    local function _(v124) --[[ Line: 282 ]]
        -- upvalues: v86 (copy), l_OpenAccountSelector_0 (ref)
        return v86(l_OpenAccountSelector_0(v124, true));
    end;
    local function v126() --[[ Line: 286 ]]
        -- upvalues: l_User_0 (ref)
        return l_User_0.fromLocalStorage().userId ~= -1;
    end;
    local function _(v127) --[[ Line: 290 ]]
        -- upvalues: l_RenderChallenge_0 (ref)
        return l_RenderChallenge_0(v127);
    end;
    local function v130(v129) --[[ Line: 294 ]]
        -- upvalues: v86 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v86(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v129, 
            extraProps = {
                title = "", 
                transitionAnimation = "SlideInFromBottom"
            }
        }));
    end;
    local function v137(v131) --[[ Line: 305 ]]
        -- upvalues: l_User_0 (ref), v86 (copy), l_ResetAppState_0 (copy), v11 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), l_AppStorageUtilities_0 (ref), l_FFlagLuaEnableDidSwitchAccount_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref), l_LaunchApp_0 (copy), v87 (copy), v90 (copy), v88 (copy), v92 (copy), l_LaunchContext_0 (ref)
        if l_User_0.fromLocalStorage().userId ~= -1 then
            v86(l_ResetAppState_0());
            v11.resolve():andThen(function(_) --[[ Line: 307 ]]
                -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), l_AppStorageUtilities_0 (ref), v131 (copy), l_FFlagLuaEnableDidSwitchAccount_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
                local v133 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else l_AccountSwitcherConstants_0.AccountSwitcherSwitchedStatus;
                l_AppStorageUtilities_0.setAccountSwitchStatus(v133);
                l_AppStorageUtilities_0.setAccountBlob(v131);
                l_AppStorageUtilities_0.flush();
                if l_FFlagLuaEnableDidSwitchAccount_0 then
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_SWITCH_ACCOUNT);
                    return;
                else
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_LOG_OUT);
                    return;
                end;
            end, function(_) --[[ Line: 319 ]]
                -- upvalues: l_AppStorageUtilities_0 (ref), v131 (copy), v86 (ref), l_LaunchApp_0 (ref), v87 (ref), v90 (ref), v88 (ref), v92 (ref), l_LaunchContext_0 (ref)
                l_AppStorageUtilities_0.setAccountSwitchStatus("switched");
                l_AppStorageUtilities_0.setAccountBlob(v131);
                l_AppStorageUtilities_0.flush();
                local _ = v86(l_LaunchApp_0(v87, v90, v88, v92, l_LaunchContext_0.Login));
            end);
            return;
        else
            l_AppStorageUtilities_0.setAccountBlob(v131);
            l_AppStorageUtilities_0.flush();
            local _ = v86(l_LaunchApp_0(v87, v90, v88, v92, l_LaunchContext_0.Login));
            return;
        end;
    end;
    local function v145(v138) --[[ Line: 332 ]]
        -- upvalues: l_HttpService_0 (ref), v84 (copy), l_MemStorageService_0 (ref), l_AuthMemStorageKeys_0 (ref), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
        if v138 == nil then
            return;
        else
            local v139 = l_HttpService_0:JSONDecode(v138);
            if v139.cvalue == nil or v139.password == nil then
                return;
            elseif not v84.credentialsProtocolStatus.passwordsSupported then
                l_MemStorageService_0:Fire(l_AuthMemStorageKeys_0.AuthenticatedCredentials, v138);
                return;
            else
                local v140 = {
                    username = v139.cvalue, 
                    password = v139.password
                };
                local v141 = l_HttpService_0:JSONEncode(v140);
                return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v141, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v142) --[[ Line: 359 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
                    if v142 then
                        local v143 = l_HttpService_0:JSONDecode(v142);
                        if v143.errorCode == nil then
                            l_Logger_0:info("Successfully registered password.");
                            l_authButtonClick_0(l_EventStreamConstants_0.Context.CMPasswordLogin, l_EventStreamConstants_0.Button.SavePassword);
                            return;
                        else
                            l_Logger_0:warning("Error registering password: {}", v143.errorMsg);
                        end;
                    end;
                end, function(v144) --[[ Line: 373 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Error registering password: {}", v144);
                end);
            end;
        end;
    end;
    local function v157(v146, v147, v148) --[[ Line: 378 ]]
        -- upvalues: l_ChallengeType_0 (ref), l_TwoStepVerificationActionType_0 (ref), l_TwoStepRequests_0 (ref), v87 (copy), v86 (copy), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v137 (copy), l_LaunchApp_0 (copy), v90 (copy), v88 (copy), v92 (copy), l_LaunchContext_0 (ref), v145 (copy), l_RenderChallenge_0 (ref)
        local l_ticket_0 = v146.twoStepVerificationData.ticket;
        local l_id_0 = v146.user.id;
        local v155 = {
            title = "Authentication.Login.Label.TwoStepVerification", 
            challengeType = l_ChallengeType_0.TwoStepVerification, 
            challengeParameters = {
                actionType = l_TwoStepVerificationActionType_0.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true
            }, 
            callbacks = {
                OnChallengeCompleted = function(v151) --[[ Line: 392 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: l_TwoStepRequests_0 (ref), v87 (ref), l_id_0 (copy), l_ticket_0 (copy), v86 (ref), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v137 (ref), l_LaunchApp_0 (ref), v90 (ref), v88 (ref), v92 (ref), l_LaunchContext_0 (ref), v148 (copy), v145 (ref), v147 (copy)
                    l_TwoStepRequests_0.login(v87, l_id_0, l_ticket_0, v151.data.verificationToken, v151.data.rememberDevice):andThen(function(v152) --[[ Line: 400 ]]
                        -- upvalues: v86 (ref), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v137 (ref), l_LaunchApp_0 (ref), v87 (ref), v90 (ref), v88 (ref), v92 (ref), l_LaunchContext_0 (ref)
                        local v153 = v86(l_SetBackNavigationDisabled_0(false));
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                        if l_FFlagEnableLuaAccountSwitch_0 then
                            v137(v152.responseBody and v152.responseBody.accountBlob);
                            return;
                        else
                            v153 = v86(l_LaunchApp_0(v87, v90, v88, v92, l_LaunchContext_0.Login));
                            return;
                        end;
                    end, function(_) --[[ Line: 411 ]]
                        -- upvalues: l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v148 (ref)
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Failure, 1);
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
                        v148.setInProgress(false);
                        v148.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                    end):finally(function() --[[ Line: 417 ]]
                        -- upvalues: v145 (ref), v147 (ref)
                        v145(v147);
                    end);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 421 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v148 (copy)
                    v148.setInProgress(false);
                end, 
                OnChallengeInvalidated = function() --[[ Line: 424 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v148 (copy)
                    v148.setInProgress(false);
                    v148.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end, 
                OnChallengeLoadFailed = function() --[[ Line: 428 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v148 (copy)
                    v148.setInProgress(false);
                    v148.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end
            }
        };
        local _ = l_RenderChallenge_0(v155);
    end;
    local function v167(_, _, v160, v161, v162) --[[ Line: 436 ]]
        -- upvalues: l_ChallengeType_0 (ref), l_RenderChallenge_0 (ref)
        local v165 = {
            challengeType = l_ChallengeType_0.SecurityQuestions, 
            challengeParameters = {
                sessionId = v160.sessionId, 
                userId = v160.userId
            }, 
            callbacks = {
                OnChallengeCompleted = function(v163) --[[ Line: 450 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: v160 (copy), v161 (copy)
                    local v164 = {
                        sessionId = v160.sessionId, 
                        redemptionToken = v163.data.redemptionToken
                    };
                    v161(v164);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 457 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v162 (copy)
                    v162.setInProgress(false);
                end, 
                OnChallengeInvalidated = function() --[[ Line: 460 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v162 (copy)
                    v162.setInProgress(false);
                    v162.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end, 
                OnChallengeLoadFailed = function() --[[ Line: 464 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v162 (copy)
                    v162.setInProgress(false);
                    v162.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end
            }
        };
        local _ = l_RenderChallenge_0(v165);
    end;
    local function v172(v168, v169, v170) --[[ Line: 471 ]]
        -- upvalues: v86 (copy), l_SetBackNavigationDisabled_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v157 (copy), v145 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v137 (copy), l_LaunchApp_0 (copy), v87 (copy), v90 (copy), v88 (copy), v92 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v171 = v86(l_SetBackNavigationDisabled_0(false));
        if l_LoginResult_0.hasTwoStepData(v168) then
            v171 = v86(l_SetLoginResult_0(v168));
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
            spawn(function() --[[ Line: 480 ]]
                -- upvalues: v157 (ref), v168 (copy), v169 (copy), v170 (copy)
                v157(v168, v169, v170);
            end);
        else
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
            if v169 then
                v145(v169);
            end;
            if l_FFlagEnableLuaAccountSwitch_0 then
                v137(v168.accountBlob);
            else
                v171 = v86(l_LaunchApp_0(v87, v90, v88, v92, l_LaunchContext_0.Login));
            end;
        end;
        if l_GetFFlagEnableLoginAccountSelector_0() then
            v171 = v86(l_CloseCentralOverlay_0());
        end;
    end;
    local v173 = nil;
    local function v174(v175, v176, v177, v178, v179, v180, v181) --[[ Line: 506 ]] --[[ Name: handleLoginWithFormData ]]
        -- upvalues: v173 (ref), v84 (copy), v86 (copy), l_SetBackNavigationDisabled_0 (ref), v174 (copy), v123 (copy), v87 (copy), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_HttpService_0 (ref), v172 (copy)
        local v182 = v173(v181);
        local v183 = v175 or v84.userIdentifier;
        local _ = v86(l_SetBackNavigationDisabled_0(true));
        return v123(v87, v183, v176, function(v185, v186) --[[ Line: 521 ]]
            -- upvalues: v174 (ref), v175 (copy), v176 (copy), v178 (copy), v179 (copy), v180 (copy), v181 (copy)
            if v185 then
                v174(v175, v176, v186, v178, v179, v180, v181);
            end;
        end, v177, function(v187) --[[ Line: 535 ]]
            -- upvalues: v174 (ref), v175 (copy), v176 (copy), v177 (copy), v179 (copy), v180 (copy), v181 (copy)
            v174(v175, v176, v177, v187, v179, v180, v181);
        end, v178, v179, v84.forceLoginByUsername):andThen(function(v188) --[[ Line: 557 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v183 (copy), v180 (copy), l_HttpService_0 (ref), v176 (copy), v172 (ref), v181 (copy)
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, v183);
            l_AppStorageService_0:Flush();
            local v189 = if not v180 then l_HttpService_0:JSONEncode({
                cvalue = v183, 
                password = v176, 
                authType = "login"
            }) else nil;
            v172(v188, v189, v181);
        end, function(v190) --[[ Line: 570 ]]
            -- upvalues: v182 (copy), v183 (copy), v176 (copy)
            v182(v190, v183, v176);
        end);
    end;
    local function v198(v191, v192, v193) --[[ Line: 575 ]]
        -- upvalues: v173 (ref), v86 (copy), l_SetBackNavigationDisabled_0 (ref), l_LoginByPasskey_0 (ref), v87 (copy), v172 (copy)
        local v194 = v173(v193);
        local _ = v86(l_SetBackNavigationDisabled_0(true));
        return v86(l_LoginByPasskey_0(v87, v191, v192)):andThen(function(v196) --[[ Line: 580 ]]
            -- upvalues: v172 (ref), v193 (copy)
            v172(v196, nil, v193);
        end, function(v197) --[[ Line: 582 ]]
            -- upvalues: v194 (copy), v191 (copy)
            v194(v197, v191, nil);
        end);
    end;
    local function v199(v200, v201, v202, v203, v204) --[[ Line: 587 ]] --[[ Name: handleLoginWithCode ]]
        -- upvalues: v173 (ref), v86 (copy), l_SetBackNavigationDisabled_0 (ref), v199 (copy), l_LoginByCode_0 (ref), v87 (copy), v172 (copy), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref)
        local v205 = v173(v204);
        local _ = v86(l_SetBackNavigationDisabled_0(true));
        return v86(l_LoginByCode_0(v87, v200, v201, function(v207, v208) --[[ Line: 598 ]]
            -- upvalues: v199 (ref), v200 (copy), v201 (copy), v204 (copy)
            if v207 then
                v199(v200, v201, v208, nil, v204);
            end;
        end, v202, function(v209) --[[ Line: 604 ]]
            -- upvalues: v199 (ref), v200 (copy), v201 (copy), v204 (copy)
            v199(v200, v201, nil, v209, v204);
        end, v203)):andThen(function(v210) --[[ Line: 615 ]]
            -- upvalues: v172 (ref), v204 (copy)
            v172(v210, nil, v204);
        end, function(v211) --[[ Line: 617 ]]
            -- upvalues: l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (copy), v200 (copy), v201 (copy)
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureAuthCode, 1);
            v205(v211, v200, v201);
        end);
    end;
    local function v212(v213, v214, v215, v216, v217) --[[ Line: 623 ]] --[[ Name: handleLoginWithOtp ]]
        -- upvalues: v173 (ref), v86 (copy), l_SetBackNavigationDisabled_0 (ref), v212 (copy), l_LoginByOtp_0 (ref), v87 (copy), v172 (copy)
        local v218 = v173(v217);
        local _ = v86(l_SetBackNavigationDisabled_0(true));
        return v86(l_LoginByOtp_0(v87, v213, v214, function(v220) --[[ Line: 634 ]]
            -- upvalues: v212 (ref), v213 (copy), v214 (copy), v216 (copy), v217 (copy)
            v212(v213, v214, v220, v216, v217);
        end, v215, v216)):andThen(function(v221) --[[ Line: 639 ]]
            -- upvalues: v172 (ref), v217 (copy)
            v172(v221, nil, v217);
        end, function(v222) --[[ Line: 642 ]]
            -- upvalues: v218 (copy), v213 (copy), v214 (copy)
            v218(v222, v213, v214);
        end);
    end;
    local function v228(v223, v224) --[[ Line: 648 ]]
        -- upvalues: v86 (copy), l_SetBackNavigationDisabled_0 (ref), l_Constants_1 (ref), v84 (copy), l_SendCode_0 (ref), v87 (copy)
        local v225 = v86(l_SetBackNavigationDisabled_0(true));
        v225 = {
            origin = l_Constants_1.otpServiceOrigin, 
            contactType = l_Constants_1.otpServiceContactType, 
            contactValue = v84.userIdentifier
        };
        return v86(l_SendCode_0(v87, v225)):andThen(function(v226) --[[ Line: 659 ]]
            -- upvalues: v223 (copy)
            v223(v226.otpSessionToken);
        end, function(_) --[[ Line: 662 ]]
            -- upvalues: v224 (copy)
            v224.setInProgress(false);
            v224.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
        end);
    end;
    local function v235(v229, v230, v231) --[[ Line: 668 ]]
        -- upvalues: v86 (copy), l_SetBackNavigationDisabled_0 (ref), l_Constants_1 (ref), l_ResendCode_0 (ref), v87 (copy)
        local v232 = v86(l_SetBackNavigationDisabled_0(true));
        v232 = {
            origin = l_Constants_1.otpServiceOrigin, 
            contactType = l_Constants_1.otpServiceContactType, 
            otpSessionToken = v229
        };
        return v86(l_ResendCode_0(v87, v232)):andThen(function(v233) --[[ Line: 680 ]]
            -- upvalues: v230 (copy)
            v230(v233.otpSessionToken);
        end, function(_) --[[ Line: 683 ]]
            -- upvalues: v231 (copy)
            v231.setInProgress(false);
            v231.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
        end);
    end;
    local function v251(v236, v237, v238) --[[ Line: 689 ]]
        -- upvalues: v98 (copy), v84 (copy), v96 (copy), l_HttpService_0 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref), l_default_0 (ref), l_Logger_0 (ref), v198 (copy)
        return (v237 and function() --[[ Line: 696 ]]
            -- upvalues: v98 (ref), v84 (ref)
            return v98({
                cvalue = v84.userIdentifier, 
                ctype = v84.userIdentifierType
            });
        end or function() --[[ Line: 702 ]]
            -- upvalues: v96 (ref)
            return v96();
        end)():andThen(function(v239) --[[ Line: 707 ]]
            -- upvalues: l_HttpService_0 (ref), l_Constants_0 (ref), v238 (copy), l_UserInputService_0 (ref), l_Base64_0 (ref), l_default_0 (ref), l_Logger_0 (ref), v236 (copy), v198 (ref)
            local v240 = l_HttpService_0:JSONDecode(v239.authenticationOptions);
            local l_sessionId_0 = v239.sessionId;
            local v242 = tonumber(v240.publicKey.timeout);
            local v243 = if v242 then v242 / 1000 else l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
            v240.keyType = "platform";
            v240.deviceBoundOnly = v238;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v240.publicKey.challenge = l_Base64_0.FromUrlSafeBase64(v240.publicKey.challenge);
                if v240.publicKey.allowCredentials then
                    for _, v245 in ipairs(v240.publicKey.allowCredentials) do
                        v245.id = l_Base64_0.FromUrlSafeBase64(v245.id);
                    end;
                end;
            end;
            local v246 = l_HttpService_0:JSONEncode(v240);
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v246, v243):andThen(function(v247) --[[ Line: 733 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_Base64_0 (ref), v236 (ref), v198 (ref), l_sessionId_0 (copy)
                if v247 ~= nil then
                    local v248 = l_HttpService_0:JSONDecode(v247);
                    if v248 == nil or next(v248) == nil then
                        l_Logger_0:info("Passkey credential signing failed. No result returned.");
                        return;
                    elseif v248.errorCode ~= nil then
                        l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v248.errorCode, v248.errorMsg);
                        return;
                    else
                        l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                        v248.id = l_Base64_0.ToUrlSafeBase64(v248.id);
                        v248.rawId = l_Base64_0.ToUrlSafeBase64(v248.rawId);
                        v248.response.signature = l_Base64_0.ToUrlSafeBase64(v248.response.signature);
                        v248.response.userHandle = l_Base64_0.ToUrlSafeBase64(v248.response.userHandle);
                        v248.response.authenticatorData = l_Base64_0.ToUrlSafeBase64(v248.response.authenticatorData);
                        v248.response.clientDataJSON = l_Base64_0.ToUrlSafeBase64(v248.response.clientDataJSON);
                        v236.setInProgress(true);
                        v198(v248, l_sessionId_0, v236);
                    end;
                end;
            end, function(v249) --[[ Line: 761 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v249);
            end);
        end, function(v250) --[[ Line: 764 ]]
            -- upvalues: l_Logger_0 (ref), v237 (copy), v238 (copy), v236 (copy)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v250.errorCode);
            if v237 and not v238 then
                v236.setErrorKey("Authentication.Login.Response.UnableToSignIn");
            end;
        end);
    end;
    local function v268(v252, v253, v254) --[[ Line: 773 ]]
        -- upvalues: v86 (copy), v49 (ref), v87 (copy), l_HttpService_0 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref), l_Logger_0 (ref), l_default_0 (ref), v174 (copy), v198 (copy)
        if not v252 and not v253 then
            return;
        else
            local v255 = nil;
            local v256 = nil;
            local v257 = nil;
            local v258 = {};
            if v252 then
                v86(v49(v87)):andThen(function(v259) --[[ Line: 787 ]]
                    -- upvalues: v255 (ref), l_HttpService_0 (ref), v256 (ref), v257 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref)
                    v255 = l_HttpService_0:JSONDecode(v259.authenticationOptions);
                    v256 = v259.sessionId;
                    v257 = tonumber(v255.publicKey.timeout) or l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
                    v255.keyType = "platform";
                    v255.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v255.publicKey.challenge = l_Base64_0.FromUrlSafeBase64(v255.publicKey.challenge);
                        if v255.publicKey.allowCredentials then
                            for _, v261 in ipairs(v255.publicKey.allowCredentials) do
                                v261.id = l_Base64_0.FromUrlSafeBase64(v261.id);
                            end;
                        end;
                    end;
                end, function(v262) --[[ Line: 808 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v262.errorCode);
                end):await();
                if v255 ~= nil then
                    v258.FIDO2 = v255;
                end;
            end;
            if v253 then
                v258.password = {};
            end;
            local v263 = if v257 then v257 / 1000 else l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
            local v264 = l_HttpService_0:JSONEncode(v258);
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, v264, v263):andThen(function(v265) --[[ Line: 829 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_default_0 (ref), v254 (copy), v174 (ref), l_Base64_0 (ref), v198 (ref), v256 (ref)
                if v265 ~= nil then
                    local v266 = l_HttpService_0:JSONDecode(v265);
                    if v266 == nil or v266.response == nil or v266.credentialType == nil then
                        l_Logger_0:info("Generic credential fetch failed. No result returned.");
                        return;
                    elseif v266.response.errorCode ~= nil then
                        l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v266.response.errorCode, v266.response.errorMsg);
                        return;
                    elseif v266.credentialType == l_default_0.CredentialsTypes.password then
                        v254.setInProgress(true);
                        v174(v266.response.username, v266.response.password, nil, nil, nil, true, v254);
                        return;
                    elseif v266.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        v266.response.id = l_Base64_0.ToUrlSafeBase64(v266.response.id);
                        v266.response.rawId = l_Base64_0.ToUrlSafeBase64(v266.response.rawId);
                        v266.response.response.signature = l_Base64_0.ToUrlSafeBase64(v266.response.response.signature);
                        v266.response.response.userHandle = l_Base64_0.ToUrlSafeBase64(v266.response.response.userHandle);
                        v266.response.response.authenticatorData = l_Base64_0.ToUrlSafeBase64(v266.response.response.authenticatorData);
                        v266.response.response.clientDataJSON = l_Base64_0.ToUrlSafeBase64(v266.response.response.clientDataJSON);
                        v254.setInProgress(true);
                        v198(v266.response, v256, v254);
                    end;
                end;
            end, function(v267) --[[ Line: 868 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v267);
            end);
        end;
    end;
    local function v276(v269, v270, v271, v272, v273, v274, v275) --[[ Line: 873 ]]
        -- upvalues: v86 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref)
        return v86(l_OpenAccountSwitchingErrorOverlay_0(v269, v270, v271, v272, v273, v274, v275));
    end;
    local function v277() --[[ Line: 895 ]]
        -- upvalues: v86 (copy), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref)
        return v86(l_OpenCentralOverlayForLoginPasswordResetPrompt_0());
    end;
    local function v280(v278, v279) --[[ Line: 899 ]]
        -- upvalues: l_LogoutAllLoggedInUsers_0 (ref)
        return l_LogoutAllLoggedInUsers_0(v278, v279);
    end;
    local function v283(v281, v282) --[[ Line: 903 ]]
        -- upvalues: v86 (copy), l_Logout_0 (copy)
        return v86(l_Logout_0(v281, v282));
    end;
    local function v284() --[[ Line: 907 ]]
        -- upvalues: v86 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v89 (copy), l_GetFStringVNGDownloadNowUrl_0 (ref)
        return v86(l_SetCentralOverlay_0(l_CentralOverlayType_0.NewAppAvailableModal, {
            onButtonActivated = function() --[[ Line: 909 ]] --[[ Name: onButtonActivated ]]
                -- upvalues: v89 (ref), l_GetFStringVNGDownloadNowUrl_0 (ref)
                v89:openURL(l_GetFStringVNGDownloadNowUrl_0());
            end
        }));
    end;
    local function v294(v285, v286, v287, v288) --[[ Line: 916 ]]
        -- upvalues: l_EventStreamConstants_0 (ref), v84 (copy), l_UserIdentifierType_0 (ref), v212 (copy), v174 (copy), v86 (copy), l_CloseCentralOverlay_0 (ref), l_OpenAccountSelector_0 (ref)
        local v289 = "";
        if v288.isLoginByOtp then
            v289 = l_EventStreamConstants_0.Context.DisambiguationOTP;
        elseif v84.userIdentifierType == l_UserIdentifierType_0.Email then
            v289 = l_EventStreamConstants_0.Context.DisambiguationEmail;
        elseif v84.userIdentifierType == l_UserIdentifierType_0.Phone then
            v289 = l_EventStreamConstants_0.Context.DisambiguationPhone;
        end;
        local v292 = {
            origin = l_EventStreamConstants_0.Context.Login, 
            context = v289, 
            users = v285, 
            onAccountSelection = function(v290) --[[ Line: 935 ]] --[[ Name: onAccountSelection ]]
                -- upvalues: v288 (copy), v212 (ref), v286 (copy), v287 (copy), v174 (ref)
                if v288.isLoginByOtp then
                    v212(v286, v287, nil, v290, v288);
                    return;
                else
                    v174(nil, v287, nil, nil, v290, false, v288):await();
                    return;
                end;
            end, 
            onAccountSelectionAbandoned = function() --[[ Line: 942 ]] --[[ Name: onAccountSelectionAbandoned ]]
                -- upvalues: v288 (copy), v86 (ref), l_CloseCentralOverlay_0 (ref)
                v288.setInProgress(false);
                local _ = v86(l_CloseCentralOverlay_0());
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle"
        };
        local _ = v86(l_OpenAccountSelector_0(v292, true));
    end;
    local function v296(v295) --[[ Line: 952 ]]
        -- upvalues: v105 (copy), v85 (copy), v51 (ref), v50 (ref)
        v105();
        v85({
            type = v51.SetComponentState, 
            data = {
                component = v50.LoginScreenV2, 
                payload = {
                    errorKey = v295.errorKey
                }
            }
        });
        v85({
            type = v51.ForceLoginByUsername
        });
    end;
    local function v298(v297) --[[ Line: 968 ]]
        -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), l_StatusCodes_0 (ref)
        if v297.errorCode == l_LoginErrorCodes_0.IncorrectCValueOrPassword then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureCredentials, 1);
            return;
        elseif v297.errorCode == l_LoginErrorCodes_0.AccountLocked then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailurePasswordReset, 1);
            return;
        elseif v297.errorCode == l_LoginErrorCodes_0.CTypeNotSupported then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v297.errorCode == l_LoginErrorCodes_0.CValueAndPasswordRequired then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v297.errorCode == l_LoginErrorCodes_0.SecurityQuestions then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureSecurityQuestions, 1);
            return;
        elseif v297.errorCode == l_LoginErrorCodes_0.MultipleUsersPerCredential then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureMultipleUsersPerCredential, 1);
            return;
        elseif v297.HttpError == Enum.HttpError.OK and v297.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureThrottled, 1);
            return;
        elseif v297.HttpError == Enum.HttpError.OK and v297.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTimeout, 1);
            return;
        elseif v297.HttpError == Enum.HttpError.OK and v297.StatusCode == l_StatusCodes_0.BAD_REQUEST then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v297.HttpError == Enum.HttpError.OK and v297.StatusCode == l_StatusCodes_0.NOT_FOUND then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureNotFound, 1);
            return;
        elseif v297.HttpError == Enum.HttpError.OK and v297.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureInternalServerError, 1);
            return;
        else
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
            return;
        end;
    end;
    v173 = function(v299) --[[ Line: 996 ]]
        -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v298 (copy), l_authClientError_0 (ref), v86 (copy), l_CloseCentralOverlay_0 (ref), l_AppStorageUtilities_0 (ref), l_User_0 (ref), v87 (copy), l_LogoutAllLoggedInUsers_0 (ref), l_ResetAppState_0 (copy), v11 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_GuiService_0 (ref), l_Logout_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), l_AccountSwitcherConstants_0 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), v296 (copy), v50 (ref), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref), v284 (copy), v167 (copy), v294 (copy)
        return function(v300, v301, v302) --[[ Line: 997 ]] --[[ Name: handleLoginError ]]
            -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v298 (ref), l_authClientError_0 (ref), v299 (copy), v86 (ref), l_CloseCentralOverlay_0 (ref), l_AppStorageUtilities_0 (ref), l_User_0 (ref), v87 (ref), l_LogoutAllLoggedInUsers_0 (ref), l_ResetAppState_0 (ref), v11 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_GuiService_0 (ref), l_Logout_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), l_AccountSwitcherConstants_0 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), v296 (ref), v50 (ref), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref), v284 (ref), v167 (ref), v294 (ref)
            local v303 = false;
            local v304 = v300.errorCode == l_LoginErrorCodes_0.MultipleUsersPerCredential;
            local v305 = v300.errorCode == l_LoginErrorCodes_0.SecurityQuestions;
            if v304 or v305 then
                v303 = true;
            end;
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Failure, 1);
            v298(v300);
            l_authClientError_0(v299.eventContext, v300.errorCode);
            local function v307() --[[ Line: 1015 ]]
                -- upvalues: v299 (ref), v303 (ref), v86 (ref), l_CloseCentralOverlay_0 (ref)
                v299.setInProgress(v303);
                local _ = v86(l_CloseCentralOverlay_0());
            end;
            local function v313() --[[ Line: 1020 ]]
                -- upvalues: l_AppStorageUtilities_0 (ref), l_User_0 (ref), v299 (ref), v87 (ref), l_LogoutAllLoggedInUsers_0 (ref), v86 (ref), l_ResetAppState_0 (ref), v11 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_GuiService_0 (ref), l_Logout_0 (ref), l_CloseCentralOverlay_0 (ref)
                local v308 = l_AppStorageUtilities_0.getAccountBlob();
                local v309 = l_User_0.fromLocalStorage().userId ~= -1;
                v299.setInProgress(true);
                l_LogoutAllLoggedInUsers_0(v87, v308):await();
                if v309 == true then
                    v86(l_ResetAppState_0());
                    local _ = v11.resolve();
                    l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, "");
                    l_AppStorageService_0:Flush();
                    local _ = v86(l_Logout_0(v87, l_GuiService_0));
                end;
                v299.setInProgress(false);
                local _ = v86(l_CloseCentralOverlay_0());
            end;
            if l_FFlagEnableLuaAccountSwitch_0 and v300.errorCode == l_LoginErrorCodes_0.EmptyAccountSwitchBlobRequired then
                v299.setErrorKey("");
                local l_AccountSwitcherLoginEmptyBlobRequiredError_0 = l_AccountSwitcherConstants_0.AccountSwitcherLoginEmptyBlobRequiredError;
                local _ = v86(l_OpenAccountSwitchingErrorOverlay_0("Authentication.AccountSwitch.Header.LogoutAllAccounts", "Authentication.AccountSwitch.Description.LogoutConfirmation", "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v313, v307, l_AccountSwitcherLoginEmptyBlobRequiredError_0));
                return;
            elseif l_FFlagEnableLuaAccountSwitch_0 and v300.errorCode == l_LoginErrorCodes_0.ParentEmptyAccountSwitchBlobRequired then
                v299.setErrorKey("");
                local l_AccountSwitcherParentLoginEmptyBlobRequiredError_0 = l_AccountSwitcherConstants_0.AccountSwitcherParentLoginEmptyBlobRequiredError;
                local _ = v86(l_OpenAccountSwitchingErrorOverlay_0("Authentication.AccountSwitch.Header.LogoutAllAccounts", "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v313, v307, l_AccountSwitcherParentLoginEmptyBlobRequiredError_0));
                return;
            elseif v300.errorCode == l_LoginErrorCodes_0.MoreThanOneUsername then
                v296(v300);
                v299.navigation.navigate(v50.LoginScreenV2);
                return;
            else
                if v300.errorCode == l_LoginErrorCodes_0.AccountLocked then
                    local _ = v86(l_OpenCentralOverlayForLoginPasswordResetPrompt_0());
                end;
                if v300.errorCode == l_LoginErrorCodes_0.GlobalAppAccessDeniedVNG then
                    v284();
                end;
                if v305 and v300.securityQuestionsData and v300.securityQuestionsCallback then
                    spawn(function() --[[ Line: 1086 ]]
                        -- upvalues: v167 (ref), v301 (copy), v302 (copy), v300 (copy), v299 (ref)
                        v167(v301, v302, v300.securityQuestionsData, v300.securityQuestionsCallback, v299);
                    end);
                    return;
                elseif v304 and v300.usersData and v301 and v302 then
                    v294(v300.usersData, v301, v302, v299);
                    return;
                else
                    v299.setErrorKey(v300.errorKey or "Authentication.Login.Response.SomethingWentWrong");
                    v299.setInProgress(v303);
                    return;
                end;
            end;
        end;
    end;
    return v10.createElement(v46.Provider, {
        value = {
            state = v84, 
            dispatch = v85, 
            parentNavigation = v79.parentNavigation, 
            utils = {
                handleLoginCompletionWithAccountSwitching = v137, 
                handleLoginResult = v172, 
                showPasskeyLoginPopup = v251, 
                showGenericCredentialLoginPopup = v268, 
                handleLoginWithCode = v199, 
                handleLoginWithFormData = v174, 
                handleLoginWithOtp = v212, 
                handleSendEmailOtp = v228, 
                handleResendEmailOtp = v235, 
                openAccountSwitchingErrorOverlay = v276, 
                openPasswordResetPrompt = v277, 
                openWebView = v130, 
                logoutAllLoggedInUsers = v280, 
                logoutWithoutShowConfirmation = v283, 
                openNewAppAvailableModal = v284, 
                closeCentralOverlay = v122, 
                clearApp = v104, 
                openAccountSelector = v294, 
                handleCredentialsCollision = v296, 
                registerPassword = v145, 
                isUserAuthenticated = v126
            }
        }
    }, v79.children);
end;