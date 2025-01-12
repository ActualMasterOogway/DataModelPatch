local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.AppBlox);
local v5 = require(l_Parent_0.AuthAnalytics);
local v6 = require(l_Parent_0.OtpLogin);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_authPageload_0 = v5.Events.authPageload;
local l_authButtonClick_0 = v5.Events.authButtonClick;
local l_EventStreamConstants_0 = v5.EventStreamConstants;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local v12 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v12.Core.Style.useStyle;
local l_IconButton_0 = v12.App.Button.IconButton;
local l_Images_0 = v12.App.ImageSet.Images;
local l_StyledTextLabel_0 = v12.App.Text.StyledTextLabel;
local l_TextField_0 = v12.App.Input.TextField;
local l_OpenTypeSupport_0 = v12.Utility.OpenTypeSupport;
local v20 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v21 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v22 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v23 = require(l_script_FirstAncestor_0.Components.UserIdentifierHeading);
local v24 = require(l_script_FirstAncestor_0.Components.ResendEmailOtpButton);
local v25 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_Constants_0 = v6.Constants;
EmailOtpScreen = function(v28) --[[ Line: 44 ]] --[[ Name: EmailOtpScreen ]]
    -- upvalues: v3 (copy), v21 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), v22 (copy), v20 (copy), l_EventStreamConstants_0 (copy), l_useLocalization_0 (copy), l_authButtonClick_0 (copy), l_UserInputService_0 (copy), l_authPageload_0 (copy), l_Constants_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy), v23 (copy), l_TextField_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v24 (copy), v25 (copy)
    local v29 = v3.useContext(v21);
    local v30 = l_useDesignTokens_0();
    local v31 = l_useStyle_0();
    local l_state_0 = v29.state;
    local l_utils_0 = v29.utils;
    local v34, v35 = v3.useState(false);
    local v36 = l_state_0 and l_state_0.userIdentifier or "";
    local function v38(v37) --[[ Line: 55 ]]
        -- upvalues: v29 (copy), v22 (ref), v20 (ref)
        v29.dispatch({
            type = v22.SetComponentState, 
            data = {
                component = v20.EmailOtpScreen, 
                payload = v37
            }
        });
    end;
    local v39 = l_state_0 and l_state_0.componentState[v20.EmailOtpScreen].sessionToken or "";
    local function _(v40) --[[ Line: 66 ]]
        -- upvalues: v38 (copy)
        v38({
            sessionToken = v40
        });
    end;
    local v42 = l_state_0 and l_state_0.componentState[v20.EmailOtpScreen].emailOtp or "";
    local function _(v43) --[[ Line: 73 ]]
        -- upvalues: v38 (copy)
        v38({
            emailOtp = v43
        });
    end;
    local v45, v46 = v3.useState(v42);
    local v47 = l_state_0 and l_state_0.componentState[v20.EmailOtpScreen].errorKey or "";
    local function v49(v48) --[[ Line: 82 ]]
        -- upvalues: v38 (copy)
        v38({
            errorKey = v48
        });
    end;
    local function _(v50) --[[ Line: 88 ]]
        -- upvalues: v46 (copy)
        v46(v50);
    end;
    local v52 = {
        setInProgress = v35, 
        setErrorKey = v49, 
        navigation = v28.navigation, 
        isLoginByOtp = true, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2EmailOtp
    };
    local v53 = l_useLocalization_0({
        emailOtpLabelText = "Authentication.Login.Label.EnterOneTimeCodeLoginHelp", 
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        errorText = if v47 ~= "" then v47 else nil
    });
    local function v55() --[[ Line: 107 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_utils_0 (copy), v39 (copy), v38 (copy), v52 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp, l_EventStreamConstants_0.Button.ResendCode, nil, nil);
        l_utils_0.handleResendEmailOtp(v39, function(v54) --[[ Line: 114 ]]
            -- upvalues: v38 (ref)
            v38({
                sessionToken = v54
            });
        end, v52);
    end;
    local function _() --[[ Line: 119 ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    v3.useEffect(function() --[[ Line: 126 ]]
        -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp);
    end, {});
    v3.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v45 (copy), l_Constants_0 (ref), v35 (copy), l_UserInputService_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v38 (copy), l_utils_0 (copy), v39 (copy), v52 (copy)
        if #v45 == l_Constants_0.DEFAULT_CODE_LENGTH then
            v35(true);
            local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
            if l_l_UserInputService_0_FocusedTextBox_1 then
                l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
            end;
            l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2EmailOtp, l_EventStreamConstants_0.Button.OtpSubmit, nil, nil);
            v38({
                emailOtp = v45
            });
            l_utils_0.handleLoginWithOtp(v39, v45, nil, nil, v52):finally(function() --[[ Line: 142 ]]
                -- upvalues: v38 (ref)
                v38({
                    emailOtp = ""
                });
            end);
        end;
    end, {
        v45
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v31.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v30.Global.Space_100), 
            PaddingLeft = UDim.new(0, v30.Global.Space_100), 
            PaddingRight = UDim.new(0, v30.Global.Space_100), 
            PaddingBottom = UDim.new(0, v30.Global.Space_100)
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
                    layoutOrder = 1, 
                    icon = l_Images_0["icons/actions/cycleLeft"], 
                    onActivated = function() --[[ Line: 176 ]] --[[ Name: onActivated ]]
                        -- upvalues: v38 (copy), v28 (copy), v20 (ref)
                        v38({
                            errorKey = ""
                        });
                        v38({
                            emailOtp = ""
                        });
                        v38({
                            sessionToken = ""
                        });
                        v28.navigation.navigate(v20.AuthenticationScreen);
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v34
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v53.signInHeadingText, 
                        fontStyle = v31.Font.Header1, 
                        colorStyle = v31.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                })
            }), 
            ButtonSpacing = v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v30.Global.Space_100), 
                BackgroundTransparency = 1
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v30.Global.Space_100), 
                    PaddingRight = UDim.new(0, v30.Global.Space_100), 
                    PaddingTop = UDim.new(0, v30.Global.Space_200)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v30.Global.Space_20)
                }), 
                Heading = v3.createElement(v23, {
                    layoutOrder = 1, 
                    userIdentifier = v36
                }), 
                OneTimeCodeLabel = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v53.emailOtpLabelText, 
                    fontStyle = v31.Font.Body, 
                    colorStyle = v31.Theme.TextEmphasis
                }), 
                EmailOtpTextField = v3.createElement(l_TextField_0, {
                    LayoutOrder = 3, 
                    text = v42, 
                    width = UDim.new(1, 0), 
                    onChange = function(v59) --[[ Line: 236 ]] --[[ Name: onChange ]]
                        -- upvalues: v46 (copy)
                        v46(v59);
                    end, 
                    disabled = v34, 
                    textInputType = Enum.TextInputType.OneTimePassword, 
                    openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getPasswordStylisticAlternative() else nil
                }), 
                ErrorTextSpacing = v53.errorText and v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v30.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                ErrorTextLabel = v53.errorText and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 5, 
                    text = v53.errorText, 
                    fontStyle = v31.Font.BodySmall, 
                    colorStyle = v31.Theme.Alert, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textWrapped = true
                }), 
                ButtonSpacing = v3.createElement("Frame", {
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, v30.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                ResendOtpButton = v3.createElement(v24, {
                    layoutOrder = 7, 
                    onPress = v55, 
                    isLoading = v34
                }), 
                HelpButtonFrame = v3.createElement("Frame", {
                    LayoutOrder = 8, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    HelpButton = v3.createElement(v25, {
                        layoutOrder = 1, 
                        isDisabled = v34, 
                        originPage = l_EventStreamConstants_0.Context.LoginFormV2Auth, 
                        textKey = "Authentication.Login.Action.NeedHelp"
                    })
                })
            })
        })
    });
end;
return EmailOtpScreen;