local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.AppBlox);
local v6 = require(l_Parent_0.AuthAnalytics);
local v7 = require(l_Parent_0.AuthCommon);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v11 = require(l_script_FirstAncestor_0.Enums.AuthenticationMethodType);
local v12 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v13 = require(l_script_FirstAncestor_0.Enums.UserIdentifierType);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_authPageload_0 = v6.Events.authPageload;
local l_authFormInteraction_0 = v6.Events.authFormInteraction;
local l_authButtonClick_0 = v6.Events.authButtonClick;
local l_authClientError_0 = v6.Events.authClientError;
local l_EventStreamConstants_0 = v6.EventStreamConstants;
local l_FullscreenPageWithSafeArea_0 = v5.FullscreenPageWithSafeArea;
local v21 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v21.Core.Style.useStyle;
local l_Button_0 = v21.App.Button.Button;
local l_ButtonType_0 = v21.App.Button.Enum.ButtonType;
local l_ButtonStack_0 = v21.App.Button.ButtonStack;
local l_IconButton_0 = v21.App.Button.IconButton;
local l_Images_0 = v21.App.ImageSet.Images;
local l_OpenTypeSupport_0 = v21.Utility.OpenTypeSupport;
local l_StandardButtonSize_0 = v21.App.Button.Enum.StandardButtonSize;
local l_StyledTextLabel_0 = v21.App.Text.StyledTextLabel;
local l_TextField_0 = v21.App.Input.TextField;
local v33 = require(l_Parent_0.CredentialsProtocol);
local l_default_0 = v33.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v33.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local l_FFlagEnableLandingPageIsAvailablePrefetch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLandingPageIsAvailablePrefetch;
local v37 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local v38 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v39 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v40 = require(l_script_FirstAncestor_0.Thunks.InitializeLogin);
local v41 = require(l_script_FirstAncestor_0.Components.Constants);
local l_isStringEmail_0 = v7.Utils.isStringEmail;
local l_isStringPhone_0 = v7.Utils.isStringPhone;
local l_CrossDeviceLogin_0 = v7.Thunks.CrossDeviceLogin;
local l_ApiFetchAuthMetaData_0 = v7.Thunks.ApiFetchAuthMetaData;
local l_AppStorageUtilities_0 = v7.Utils.AppStorageUtilities;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
getUserIdentifierType = function(v49) --[[ Line: 74 ]] --[[ Name: getUserIdentifierType ]]
    -- upvalues: l_isStringEmail_0 (copy), v13 (copy), l_isStringPhone_0 (copy)
    if l_isStringEmail_0(v49) then
        return v13.Email;
    elseif l_isStringPhone_0(v49) then
        return v13.Phone;
    else
        return v13.Username;
    end;
end;
LoginScreenV2 = function(v50) --[[ Line: 84 ]] --[[ Name: LoginScreenV2 ]]
    -- upvalues: v3 (copy), v39 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v12 (copy), v38 (copy), v40 (copy), v4 (copy), v11 (copy), v13 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), l_authClientError_0 (copy), l_EventStreamConstants_0 (copy), l_AppStorageUtilities_0 (copy), l_authButtonClick_0 (copy), l_ApiFetchAuthMetaData_0 (copy), l_authPageload_0 (copy), l_FFlagEnableLandingPageIsAvailablePrefetch_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_CrossDeviceLogin_0 (copy), l_Images_0 (copy), l_StandardButtonSize_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_IconButton_0 (copy), l_StyledTextLabel_0 (copy), l_TextField_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_authFormInteraction_0 (copy), l_Button_0 (copy), v41 (copy), v37 (copy), l_ButtonStack_0 (copy)
    local v51 = v3.useContext(v39);
    local l_utils_0 = v51.utils;
    local l_state_0 = v51.state;
    local v54 = l_useStyle_0();
    local v55 = l_useDesignTokens_0();
    local v56 = l_useDispatch_0();
    local v57 = l_useRoactService_0(l_RoactNetworking_0);
    local function v59(v58) --[[ Line: 94 ]]
        -- upvalues: v51 (copy), v12 (ref), v38 (ref)
        v51.dispatch({
            type = v12.SetComponentState, 
            data = {
                component = v38.LoginScreenV2, 
                payload = v58
            }
        });
    end;
    local v60, v61 = v3.useState(false);
    local v62 = l_state_0 and l_state_0.componentState[v38.LoginScreenV2].userIdentifier or "";
    local function _(v63) --[[ Line: 110 ]]
        -- upvalues: v59 (copy)
        v59({
            userIdentifier = v63
        });
    end;
    local v65, v66 = v3.useState(v62);
    local v67 = l_state_0 and l_state_0.componentState[v38.LoginScreenV2].errorKey or "";
    local function v69(v68) --[[ Line: 119 ]]
        -- upvalues: v59 (copy)
        v59({
            errorKey = v68
        });
    end;
    local function _(v70) --[[ Line: 125 ]]
        -- upvalues: v56 (copy), v40 (ref), v57 (copy)
        return v56(v40(v57, {
            cvalue = v70, 
            ctype = getUserIdentifierType(v70)
        }));
    end;
    local function v79(v72) --[[ Line: 132 ]]
        -- upvalues: v65 (copy), v61 (copy), v59 (copy), v56 (copy), v40 (ref), v57 (copy), v4 (ref), v11 (ref), v51 (copy), v12 (ref), l_state_0 (copy), v13 (ref), v50 (copy), v38 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref)
        local v73 = v72 or v65;
        v61(true);
        v59({
            userIdentifier = v73
        });
        v56(v40(v57, {
            cvalue = v73, 
            ctype = getUserIdentifierType(v73)
        })):andThen(function(v74) --[[ Line: 136 ]]
            -- upvalues: v4 (ref), v11 (ref), v51 (ref), v12 (ref), v73 (copy), l_state_0 (ref), v13 (ref), v72 (copy), v59 (ref), v61 (ref), v50 (ref), v38 (ref)
            local v76 = v4.List.map(v74.loginMethods, function(v75) --[[ Line: 137 ]]
                -- upvalues: v11 (ref)
                return v11[v75.method];
            end);
            v51.dispatch({
                type = v12.SetUserIdentifierAndType, 
                data = {
                    userIdentifier = v73, 
                    userIdentifierType = if l_state_0.forceLoginByUsername then v13.Username else getUserIdentifierType(v73)
                }
            });
            v51.dispatch({
                type = v12.SetAvailableLoginMethods, 
                data = v76
            });
            if v72 ~= nil then
                v51.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        shouldShowAuthScreenCredentialsPopup = true
                    }
                });
            end;
            v59({
                errorKey = ""
            });
            v61(false);
            v50.navigation.navigate(v38.AuthenticationScreen);
        end, function(v77) --[[ Line: 167 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v59 (ref), v61 (ref)
            l_Logger_0:warning("Error initializing login: {}", l_HttpService_0:JSONEncode(v77));
            l_authClientError_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v77.errorCode);
            local v78 = v77.errorKey or "Authentication.Login.Response.SomethingWentWrong";
            v59({
                errorKey = v78
            });
            v61(false);
        end);
    end;
    local v80 = {
        setInProgress = v61, 
        setErrorKey = v69, 
        navigation = v50.navigation, 
        isLoginByOtp = false, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2Username
    };
    v3.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: l_AppStorageUtilities_0 (ref), v65 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v79 (copy)
        local v81 = l_AppStorageUtilities_0.getAccountBlob();
        if v65 == "" and v81 == "" then
            local v82 = l_AppStorageUtilities_0.getDefaultUsername();
            if v82 and v82 ~= "" then
                l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.PrefilledNext, nil, nil);
                v79(v82);
            end;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 201 ]]
        -- upvalues: l_utils_0 (copy), l_HttpService_0 (ref), l_ApiFetchAuthMetaData_0 (ref), v57 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        local v83 = {
            isAuthenticated = l_utils_0.isUserAuthenticated()
        };
        local v84 = l_HttpService_0:JSONEncode(v83);
        l_ApiFetchAuthMetaData_0(v57):andThen(function(v85) --[[ Line: 207 ]]
            -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v84 (copy)
            local v86 = v85 and v85.IsAltBrowserTracker;
            l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v84, v86);
        end, function(_) --[[ Line: 210 ]]
            -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v84 (copy)
            warn("Error auth metadata: ", error);
            l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v84, nil);
        end);
    end, {});
    local l_initialStateUpdated_0 = l_state_0.credentialsProtocolStatus.initialStateUpdated;
    local l_fido2Supported_0 = l_state_0.credentialsProtocolStatus.fido2Supported;
    v3.useEffect(function() --[[ Line: 219 ]]
        -- upvalues: l_initialStateUpdated_0 (copy), l_state_0 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v51 (copy), v12 (ref), l_AppStorageUtilities_0 (ref), l_utils_0 (copy), v80 (copy), l_FFlagEnableLandingPageIsAvailablePrefetch_0 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref)
        if l_initialStateUpdated_0 or not l_state_0.shouldAutoShowCredentialPopup then
            return;
        else
            local function v96(v90) --[[ Line: 225 ]]
                -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v51 (ref), v12 (ref), l_AppStorageUtilities_0 (ref), l_utils_0 (ref), v80 (ref)
                local v91 = false;
                local v92 = false;
                local v93 = false;
                if v90.FIDO2 ~= nil then
                    v91 = v90.FIDO2.isAvailable and v90.FIDO2.supportsDeviceBoundOnly;
                    v93 = true;
                else
                    v91 = v90.isAvailable and v90.supportsDeviceBoundOnly or false;
                end;
                if v90.password ~= nil then
                    v92 = v90.password.isAvailable;
                end;
                l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyLoginV2, if v91 ~= nil then tostring(v91) else "timeout");
                v51.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        fido2Supported = v91, 
                        passwordsSupported = v92, 
                        v2InterfaceSupported = v93
                    }
                });
                v51.dispatch({
                    type = v12.SetCredentialAutoPopupShown
                });
                local v94 = l_AppStorageUtilities_0.getDefaultUsername();
                local v95 = l_AppStorageUtilities_0.getAccountBlob();
                if not (v94 and v94 ~= "" and not (v95 and v95 ~= "")) then
                    if v93 then
                        l_utils_0.showGenericCredentialLoginPopup(v91, v92, v80);
                        return;
                    elseif v91 then
                        l_utils_0.showPasskeyLoginPopup(v80, false, true);
                    end;
                end;
            end;
            local l_extraProps_0 = l_state_0.extraProps;
            if l_FFlagEnableLandingPageIsAvailablePrefetch_0 and l_extraProps_0.credProtocolIsAvailableResponse and l_extraProps_0.credProtocolIsAvailableResponse.isAvailable ~= nil then
                l_Logger_0:info("Using prefetched credentials protocol response: {}", l_HttpService_0:JSONEncode(l_extraProps_0.credProtocolIsAvailableResponse));
                v96(l_extraProps_0.credProtocolIsAvailableResponse);
                return;
            else
                l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(v96):catch(function(v98) --[[ Line: 298 ]]
                    -- upvalues: v51 (ref), v12 (ref), l_Logger_0 (ref)
                    v51.dispatch({
                        type = v12.UpdateCredentialsProtocolStatus, 
                        data = {
                            fido2Supported = false, 
                            passwordsSupported = false, 
                            v2InterfaceSupported = false
                        }
                    });
                    l_Logger_0:warning("Error checking for available credential types. Error: {}", v98);
                end);
                return;
            end;
        end;
    end, {});
    local v99 = l_useLocalization_0({
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        identifierLabelText = "Authentication.Login.Label.UsernameEmailOrPhoneNumber", 
        orText = "Authentication.SignUp.Description.Or", 
        nextActionText = "Authentication.Login.Action.Next", 
        quickSignInActionText = "Authentication.Login.Action.QuickSignIn", 
        usePasskeyActionText = "Authentication.Login.Action.UsePasskey", 
        passkeyIncompatibleText = "Authentication.Login.Label.PasskeyIncompatible", 
        errorText = if v67 ~= "" then v67 else nil
    });
    local v104 = {
        {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 328 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v56 (copy), l_CrossDeviceLogin_0 (ref), l_utils_0 (copy), v80 (copy)
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.QuickLogin, nil, nil);
                    v56(l_CrossDeviceLogin_0.OpenLoginCodePrompt({
                        loginCallback = function(v100, v101, v102, v103) --[[ Line: 336 ]] --[[ Name: loginCallback ]]
                            -- upvalues: l_utils_0 (ref), v80 (ref)
                            l_utils_0.handleLoginWithCode(v100, v101, v102, v103, v80);
                        end, 
                        isOverlay = true
                    }));
                end, 
                text = v99.quickSignInActionText, 
                icon = l_Images_0["icons/menu/scanqr"], 
                standardSize = l_StandardButtonSize_0.Regular, 
                isLoading = v60
            }
        }
    };
    if l_fido2Supported_0 or not l_initialStateUpdated_0 then
        table.insert(v104, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 361 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_utils_0 (copy), v80 (copy)
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.UsePasskey, nil, nil);
                    l_utils_0.showPasskeyLoginPopup(v80, false, false);
                end, 
                text = v99.usePasskeyActionText, 
                icon = l_Images_0["icons/menu/passkey"], 
                standardSize = l_StandardButtonSize_0.Regular, 
                isLoading = not l_initialStateUpdated_0 or v60
            }
        });
    end;
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v54.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v55.Global.Space_100), 
            PaddingLeft = UDim.new(0, v55.Global.Space_100), 
            PaddingRight = UDim.new(0, v55.Global.Space_100), 
            PaddingBottom = UDim.new(0, v55.Global.Space_100)
        }), 
        Wrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Header = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BackButton = v3.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/navigation/close"], 
                    onActivated = function() --[[ Line: 405 ]] --[[ Name: onActivated ]]
                        -- upvalues: v51 (copy)
                        v51.parentNavigation.goBack();
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v60
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v99.signInHeadingText, 
                        fontStyle = v54.Font.Header1, 
                        colorStyle = v54.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                })
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v55.Global.Space_100), 
                    PaddingRight = UDim.new(0, v55.Global.Space_100)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v55.Global.Space_20)
                }), 
                SignInHeadingSpacing = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v55.Global.Space_400), 
                    BackgroundTransparency = 1
                }), 
                IdentifierLabel = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v99.identifierLabelText, 
                    fontStyle = v54.Font.Body, 
                    colorStyle = v54.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY
                }), 
                IdentifierLabelSpacing = v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v55.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                UserIdentifierTextField = v3.createElement(l_TextField_0, {
                    LayoutOrder = 5, 
                    text = v62, 
                    width = UDim.new(1, 0), 
                    textInputType = Enum.TextInputType.Username, 
                    openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                    onChange = function(v105) --[[ Line: 467 ]] --[[ Name: onChange ]]
                        -- upvalues: v67 (copy), v59 (copy), v66 (copy)
                        if v67 ~= "" then
                            v59({
                                errorKey = ""
                            });
                        end;
                        v66(v105);
                    end, 
                    onFocusGained = function() --[[ Line: 474 ]] --[[ Name: onFocusGained ]]
                        -- upvalues: l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref), v65 (copy)
                        l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Field.Username, nil, nil, #v65 > 0);
                    end, 
                    disabled = v60
                }), 
                ErrorTextSpacing = v99.errorText and v3.createElement("Frame", {
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, v55.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                ErrorTextLabel = v99.errorText and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 7, 
                    text = v99.errorText, 
                    fontStyle = v54.Font.BodySmall, 
                    colorStyle = v54.Theme.Alert, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textWrapped = true
                }), 
                NextButtonSpacing = v3.createElement("Frame", {
                    LayoutOrder = 8, 
                    Size = UDim2.new(1, 0, 0, v55.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                NextButton = v3.createElement(l_Button_0, {
                    layoutOrder = 9, 
                    standardSize = l_StandardButtonSize_0.Regular, 
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    text = v99.nextActionText, 
                    buttonTextOverride = v41.getButtonTextOverrideConfig(), 
                    onActivated = function() --[[ Line: 509 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v79 (copy)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.Next, nil, nil);
                        v79();
                    end, 
                    isDisabled = v65 == "", 
                    isLoading = v60
                }), 
                HelpButton = v3.createElement(v37, {
                    layoutOrder = 10, 
                    isDisabled = v60, 
                    originPage = l_EventStreamConstants_0.Context.LoginFormV2Username, 
                    textKey = "Authentication.Login.Action.ForgotUsername"
                }), 
                AlternativeLoginDivider = v3.createElement("Frame", {
                    LayoutOrder = 11, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    DividerText = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        text = v99.orText, 
                        fontStyle = v54.Font.Header2, 
                        colorStyle = v54.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Spacing = v3.createElement("Frame", {
                    LayoutOrder = 12, 
                    Size = UDim2.new(1, 0, 0, v55.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                AlternativeLoginButtonFrame = v3.createElement("Frame", {
                    LayoutOrder = 13, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    AlternativeLoginButtons = v3.createElement(l_ButtonStack_0, {
                        forcedFillDirection = Enum.FillDirection.Vertical, 
                        buttons = v104
                    })
                })
            })
        })
    });
end;
return LoginScreenV2;