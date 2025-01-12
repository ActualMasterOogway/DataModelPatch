local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.AppBlox);
local v5 = require(l_Parent_0.AuthAnalytics);
local v6 = require(l_Parent_0.AuthCommon);
local v7 = require(l_Parent_0.FitFrame);
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_script_FirstAncestor_0.Enums.AuthenticationMethodType);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local v14 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v14.Core.Style.useStyle;
local l_IconButton_0 = v14.App.Button.IconButton;
local l_Images_0 = v14.App.ImageSet.Images;
local l_Toast_0 = v14.App.Dialog.Toast;
local l_StyledTextLabel_0 = v14.App.Text.StyledTextLabel;
local v21 = require(l_script_FirstAncestor_0.Components.AuthenticationMethod);
local v22 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local v23 = require(l_script_FirstAncestor_0.Components.UserIdentifierHeading);
local v24 = require(l_script_FirstAncestor_0.Enums.UserIdentifierType);
local v25 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v26 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v27 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local l_authFormInteraction_0 = v5.Events.authFormInteraction;
local l_authPageload_0 = v5.Events.authPageload;
local l_authButtonClick_0 = v5.Events.authButtonClick;
local l_EventStreamConstants_0 = v5.EventStreamConstants;
local l_GetUserByUsername_0 = v6.Thunks.GetUserByUsername;
AuthenticationScreen = function(v33) --[[ Line: 51 ]] --[[ Name: AuthenticationScreen ]]
    -- upvalues: v3 (copy), v26 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v27 (copy), v25 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_HttpService_0 (copy), v24 (copy), l_GetUserByUsername_0 (copy), v8 (copy), v9 (copy), l_authFormInteraction_0 (copy), l_authButtonClick_0 (copy), l_useLocalization_0 (copy), v21 (copy), l_StyledTextLabel_0 (copy), l_Images_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_Toast_0 (copy), v7 (copy), l_IconButton_0 (copy), v23 (copy), v22 (copy)
    local v34 = v3.useContext(v26);
    local l_state_0 = v34.state;
    local l_utils_0 = v34.utils;
    local v37 = l_useDesignTokens_0();
    local v38 = l_useStyle_0();
    local v39 = l_useRoactService_0(l_RoactNetworking_0);
    local v40, v41 = v3.useState(nil);
    local v42, v43 = v3.useState(nil);
    local function v45(v44) --[[ Line: 62 ]]
        -- upvalues: v34 (copy), v27 (ref), v25 (ref)
        v34.dispatch({
            type = v27.SetComponentState, 
            data = {
                component = v25.AuthenticationScreen, 
                payload = v44
            }
        });
    end;
    local v46 = l_state_0 and l_state_0.componentState[v25.AuthenticationScreen].errorType or nil;
    local v47 = l_state_0 and l_state_0.componentState[v25.AuthenticationScreen].errorKey or "";
    local function v49(v48) --[[ Line: 75 ]]
        -- upvalues: v45 (copy)
        v45({
            errorKey = v48
        });
    end;
    local function _(v50) --[[ Line: 83 ]]
        -- upvalues: v45 (copy)
        v45({
            errorType = v50
        });
    end;
    local function _(v52) --[[ Line: 89 ]]
        -- upvalues: v45 (copy)
        v45({
            password = v52
        });
    end;
    local function v55(v54) --[[ Line: 95 ]]
        -- upvalues: v34 (copy), v27 (ref), v25 (ref)
        v34.dispatch({
            type = v27.SetComponentState, 
            data = {
                component = v25.EmailOtpScreen, 
                payload = {
                    sessionToken = v54
                }
            }
        });
    end;
    local function _(v56) --[[ Line: 106 ]]
        -- upvalues: v55 (copy), v33 (copy), v25 (ref)
        v55(v56);
        v33.navigation.navigate(v25.EmailOtpScreen);
    end;
    local v58 = l_state_0 and l_state_0.userIdentifier or "";
    local v59, v60 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: l_utils_0 (copy), l_state_0 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_HttpService_0 (ref)
        local v61 = {
            isAuthenticated = l_utils_0.isUserAuthenticated(), 
            userIdentifierType = l_state_0.userIdentifierType, 
            authenticationMethods = table.concat(l_state_0.availableLoginMethods, ",")
        };
        l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_HttpService_0:JSONEncode(v61));
    end, {});
    v3.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: l_state_0 (copy), v24 (ref), l_GetUserByUsername_0 (ref), v39 (copy), v58 (copy), v41 (copy), v43 (copy)
        if l_state_0.userIdentifierType == v24.Username then
            l_GetUserByUsername_0(v39, v58)():andThen(function(v62) --[[ Line: 128 ]]
                -- upvalues: v41 (ref), v43 (ref)
                v41(v62.id);
                v43(v62.displayName);
            end):catch(function(_) --[[ Line: 131 ]]

            end);
        end;
    end, {});
    local v64 = {
        setInProgress = v60, 
        setErrorKey = v49, 
        navigation = v33.navigation, 
        isLoginByOtp = false, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2Auth
    };
    local v65 = l_state_0 and l_state_0.credentialsProtocolStatus.shouldShowAuthScreenCredentialsPopup;
    v3.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v65 (copy), l_state_0 (copy), l_utils_0 (copy), v64 (copy), v34 (copy), v27 (ref), v8 (ref), v9 (ref)
        if v65 then
            local v66 = l_state_0 and l_state_0.credentialsProtocolStatus.fido2Supported;
            local v67 = l_state_0 and l_state_0.credentialsProtocolStatus.passwordsSupported;
            if l_state_0 and l_state_0.credentialsProtocolStatus.v2InterfaceSupported then
                l_utils_0.showGenericCredentialLoginPopup(v66, v67, v64);
            elseif v66 then
                l_utils_0.showPasskeyLoginPopup(v64, false, true);
            end;
            v34.dispatch({
                type = v27.UpdateCredentialsProtocolStatus, 
                data = {
                    shouldShowAuthScreenCredentialsPopup = false
                }
            });
            return;
        else
            if v8.List.find(l_state_0.availableLoginMethods, v9.Passkey) ~= nil and l_state_0.credentialsProtocolStatus.fido2Supported then
                l_utils_0.showPasskeyLoginPopup(v64, true, true);
            end;
            return;
        end;
    end, {});
    local v75 = {
        [v9.Password] = function(v68) --[[ Line: 174 ]]
            -- upvalues: v60 (copy), v9 (ref), v45 (copy), l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref), l_authButtonClick_0 (ref), l_utils_0 (copy), v64 (copy)
            if v68 ~= "" then
                v60(true);
                local l_Password_0 = v9.Password;
                v45({
                    errorType = l_Password_0
                });
                v45({
                    errorKey = ""
                });
                l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Field.Password, nil, nil, nil);
                l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.Password, nil, nil);
                l_utils_0.handleLoginWithFormData(nil, v68, nil, nil, nil, false, v64);
            end;
        end, 
        [v9.Passkey] = function(_) --[[ Line: 196 ]]
            -- upvalues: v9 (ref), v45 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_utils_0 (copy), v64 (copy)
            local l_Passkey_0 = v9.Passkey;
            v45({
                errorType = l_Passkey_0
            });
            v45({
                errorKey = ""
            });
            l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.Passkey, nil, nil);
            l_utils_0.showPasskeyLoginPopup(v64, true, false);
        end, 
        [v9.EmailOtp] = function(_) --[[ Line: 207 ]]
            -- upvalues: v60 (copy), v9 (ref), v45 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v55 (copy), v33 (copy), v25 (ref), l_utils_0 (copy), v64 (copy)
            v60(true);
            local l_EmailOtp_0 = v9.EmailOtp;
            v45({
                errorType = l_EmailOtp_0
            });
            v45({
                errorKey = ""
            });
            l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Button.EmailOtp, nil, nil);
            l_EmailOtp_0 = function(v74) --[[ Line: 218 ]]
                -- upvalues: v60 (ref), v55 (ref), v33 (ref), v25 (ref)
                v60(false);
                v55(v74);
                v33.navigation.navigate(v25.EmailOtpScreen);
            end;
            l_utils_0.handleSendEmailOtp(l_EmailOtp_0, v64);
        end
    };
    local v76 = l_useLocalization_0({
        toastErrorText = v47 ~= "" and v46 ~= v9.Password and v47 or nil, 
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        passkeyDescriptionText = "Authentication.Login.Description.PasskeyDescription", 
        passkeyLoginIncompatibleText = "Authentication.Login.Description.PasskeyLoginIncompatibleDevice", 
        orText = "Authentication.SignUp.Description.Or"
    });
    local v82 = (function(v77) --[[ Line: 234 ]]
        -- upvalues: l_state_0 (copy), v8 (ref), v9 (ref), v3 (ref), v21 (ref), v75 (copy), v59 (copy), v60 (copy), v37 (copy), l_StyledTextLabel_0 (ref), v76 (copy), v38 (copy)
        if not l_state_0.credentialsProtocolStatus.fido2Supported and #v77 > 1 and v8.List.find(v77, v9.Passkey) ~= nil then
            v77 = v8.List.filter(v77, function(v78) --[[ Line: 241 ]]
                -- upvalues: v9 (ref)
                return v78 ~= v9.Passkey;
            end);
        end;
        local v81 = v8.List.map(v77, function(v79, v80) --[[ Line: 246 ]]
            -- upvalues: v3 (ref), v21 (ref), v75 (ref), v59 (ref), v60 (ref)
            return v3.createElement(v21, {
                layoutOrder = v80, 
                isFirstItemInList = v80 == 1, 
                authMethod = v79, 
                onSubmit = v75[v79], 
                isLoginInProgress = v59, 
                setIsLoginInProgress = v60
            });
        end);
        if #v77 > 1 and v77[1] == v9.Password then
            table.insert(v81, v3.createElement("Frame", {
                LayoutOrder = 1.5, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v37.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v37.Global.Space_200)
                }), 
                ListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                DividerText = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v76.orText, 
                    fontStyle = v38.Font.Header2, 
                    colorStyle = v38.Theme.TextDefault, 
                    textXAlignment = Enum.TextXAlignment.Center
                })
            }));
            return v81;
        else
            if #v77 == 1 and v77[1] == v9.Passkey then
                table.insert(v81, v3.createElement("Frame", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v37.Global.Space_200)
                    }), 
                    TextLabel = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 0, 
                        text = if l_state_0.credentialsProtocolStatus.fido2Supported then v76.passkeyDescriptionText else v76.passkeyLoginIncompatibleText, 
                        fontStyle = v38.Font.Body, 
                        colorStyle = v38.Theme.TextDefault, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        fluidSizing = true, 
                        lineHeight = 1
                    })
                }));
            end;
            return v81;
        end;
    end)(l_state_0.availableLoginMethods);
    local v83 = v3.useMemo(function() --[[ Line: 320 ]]
        -- upvalues: v76 (copy), l_Images_0 (ref), v37 (copy)
        return {
            toastTitle = v76.toastErrorText, 
            iconImage = l_Images_0["icons/status/error_large"], 
            iconSize = Vector2.new(v37.Global.Size_300, v37.Global.Size_300), 
            iconColorStyle = {
                Color = v37.Global.Color.Red.Color3, 
                Transparency = 0
            }
        };
    end, {
        v76.toastErrorText
    });
    local v84 = false;
    if #l_state_0.availableLoginMethods == 1 then
        v84 = l_state_0.availableLoginMethods[1] == v9.Password;
    end;
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v38.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v37.Global.Space_100), 
            PaddingBottom = UDim.new(0, v37.Global.Space_100), 
            PaddingLeft = UDim.new(0, v37.Global.Space_100), 
            PaddingRight = UDim.new(0, v37.Global.Space_100)
        }), 
        ErrorToastFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0.5, 0), 
            ZIndex = 100
        }, {
            ErrorToast = v76.toastErrorText and v3.createElement(l_Toast_0, {
                toastContent = v83, 
                duration = 3
            })
        }), 
        Wrapper = v3.createElement(v7.FitFrameVertical, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
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
                    layoutOrder = 1, 
                    icon = l_Images_0["icons/actions/cycleLeft"], 
                    onActivated = function() --[[ Line: 373 ]] --[[ Name: onActivated ]]
                        -- upvalues: v45 (copy), v33 (copy), v25 (ref)
                        v45({
                            errorKey = ""
                        });
                        v45({
                            errorType = nil
                        });
                        v45({
                            password = ""
                        });
                        v33.navigation.navigate(v25.LoginScreenV2);
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v59
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v76.signInHeadingText, 
                        fontStyle = v38.Font.Header1, 
                        colorStyle = v38.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                })
            }), 
            ButtonSpacing = v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v37.Global.Space_100), 
                BackgroundTransparency = 1
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v37.Global.Space_100), 
                    PaddingRight = UDim.new(0, v37.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v37.Global.Space_200), 
                    PaddingTop = UDim.new(0, v37.Global.Space_200)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v37.Global.Space_20)
                }), 
                Heading = v3.createElement(v23, {
                    layoutOrder = 1, 
                    userIdentifier = v58, 
                    userId = v40, 
                    displayName = v42
                }), 
                AuthenticationComponents = v3.createElement(v7.FitFrameVertical, {
                    LayoutOrder = 2, 
                    width = UDim.new(1, 0), 
                    BackgroundTransparency = 1
                }, v82), 
                HelpButtonFrame = v3.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    HelpButton = v3.createElement(v22, {
                        layoutOrder = 1, 
                        isDisabled = v59, 
                        originPage = l_EventStreamConstants_0.Context.LoginFormV2Auth, 
                        textKey = v84 and "Authentication.Login.Label.ForgotYourPassword" or "Authentication.Login.Label.TroubleSigningIn"
                    })
                })
            })
        })
    });
end;
return AuthenticationScreen;