local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.AuthAnalytics);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_TextField_0 = v3.App.Input.TextField;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local v15 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v16 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v17 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v18 = require(l_script_FirstAncestor_0.Enums.AuthenticationMethodType);
local v19 = require(l_script_FirstAncestor_0.Components.Constants);
local l_authFormInteraction_0 = v4.Events.authFormInteraction;
local l_EventStreamConstants_0 = v4.EventStreamConstants;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_UIConstants_0 = require(l_Parent_0.AuthCommon).Common.UIConstants;
AuthenticationMethod = function(v24) --[[ Line: 45 ]] --[[ Name: AuthenticationMethod ]]
    -- upvalues: v2 (copy), v16 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v15 (copy), v17 (copy), l_useLocalization_0 (copy), v18 (copy), l_StyledTextLabel_0 (copy), l_TextField_0 (copy), l_authFormInteraction_0 (copy), l_EventStreamConstants_0 (copy), l_Images_0 (copy), l_UIConstants_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_Button_0 (copy), v19 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy)
    local v25 = v2.useContext(v16);
    local v26 = l_useStyle_0();
    local v27 = l_useDesignTokens_0();
    local l_state_0 = v25.state;
    local function v30(v29) --[[ Line: 52 ]]
        -- upvalues: v25 (copy), v15 (ref), v17 (ref)
        v25.dispatch({
            type = v15.SetComponentState, 
            data = {
                component = v17.AuthenticationScreen, 
                payload = v29
            }
        });
    end;
    local v31 = l_state_0 and l_state_0.componentState[v17.AuthenticationScreen].password or "";
    local function _(v32) --[[ Line: 65 ]]
        -- upvalues: v30 (copy)
        v30({
            password = v32
        });
    end;
    local v34, v35 = v2.useState(false);
    local v36 = l_state_0 and l_state_0.componentState[v17.AuthenticationScreen].errorKey or "";
    local function _(v37) --[[ Line: 73 ]]
        -- upvalues: v30 (copy)
        v30({
            errorKey = v37
        });
    end;
    local v39 = l_state_0 and l_state_0.componentState[v17.AuthenticationScreen].errorType or "";
    local v40 = l_useLocalization_0({
        passwordLabelText = "Authentication.Login.Label.Password", 
        nextActionText = "Authentication.Login.Action.Next", 
        usePasskeyActionText = "Authentication.Login.Action.UsePasskey", 
        emailOneTimeCodeActionText = "Authentication.Login.Action.EmailACode", 
        passwordErrorText = v36 ~= "" and v39 == v18.Password and v36 or nil
    });
    local l_Space_100_0 = v27.Global.Space_100;
    if v24.authMethod == v18.Password then
        return v2.createElement("Frame", {
            LayoutOrder = v24.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Space_100_0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v27.Global.Space_20)
            }), 
            PasswordLabel = v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v40.passwordLabelText, 
                fontStyle = v26.Font.Body, 
                colorStyle = v26.Theme.TextEmphasis, 
                richText = true
            }), 
            PasswordField = v2.createElement(l_TextField_0, {
                LayoutOrder = 2, 
                text = "", 
                textInputType = if v34 then Enum.TextInputType.PasswordShown else Enum.TextInputType.Password, 
                width = UDim.new(1, 0), 
                onChange = function(v42) --[[ Line: 119 ]] --[[ Name: onChange ]]
                    -- upvalues: v36 (copy), v39 (copy), v18 (ref), v30 (copy)
                    if v36 ~= "" and v39 == v18.Password then
                        v30({
                            errorKey = ""
                        });
                    end;
                    v30({
                        password = v42
                    });
                end, 
                onFocusGained = function() --[[ Line: 125 ]] --[[ Name: onFocusGained ]]
                    -- upvalues: l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref)
                    l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Field.Password, nil, nil, nil);
                end, 
                iconButton = if v34 then l_Images_0[l_UIConstants_0.SHOW_PASSWORD_ICON] else l_Images_0[l_UIConstants_0.HIDE_PASSWORD_ICON], 
                onButtonPress = function() --[[ Line: 137 ]] --[[ Name: onButtonPress ]]
                    -- upvalues: v35 (copy), v34 (copy)
                    v35(not v34);
                end, 
                disabled = v24.isLoginInProgress, 
                openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getPasswordStylisticAlternative() else nil
            }), 
            ErrorTextSpacing = v40.passwordErrorText and v2.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, v27.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            ErrorTextLabel = v40.passwordErrorText and v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 4, 
                text = v40.passwordErrorText, 
                fontStyle = v26.Font.BodySmall, 
                colorStyle = v26.Theme.Alert, 
                automaticSize = Enum.AutomaticSize.XY, 
                textWrapped = true
            }), 
            SubmitButtonSpacing = v2.createElement("Frame", {
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, v27.Global.Space_200), 
                BackgroundTransparency = 1
            }), 
            SubmitButton = v2.createElement(l_Button_0, {
                layoutOrder = 6, 
                text = v40.nextActionText, 
                buttonTextOverride = v19.getButtonTextOverrideConfig(), 
                onActivated = function() --[[ Line: 167 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy), v31 (copy)
                    v24.onSubmit(v31);
                end, 
                standardSize = l_StandardButtonSize_0.Regular, 
                buttonType = l_ButtonType_0.PrimaryContextual, 
                isLoading = v24.isLoginInProgress, 
                isDisabled = v31 == ""
            })
        });
    elseif v24.authMethod == v18.Passkey then
        return v2.createElement("Frame", {
            LayoutOrder = v24.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Space_100_0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v27.Global.Space_20)
            }), 
            PasskeyButton = v2.createElement(l_Button_0, {
                layoutOrder = 1, 
                text = v40.usePasskeyActionText, 
                buttonTextOverride = v19.getButtonTextOverrideConfig(), 
                onActivated = function() --[[ Line: 195 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy)
                    v24.onSubmit(nil);
                end, 
                standardSize = l_StandardButtonSize_0.Regular, 
                buttonType = if v24.isFirstItemInList then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary, 
                isLoading = v24.isLoginInProgress, 
                icon = l_Images_0["icons/menu/passkey"]
            })
        });
    elseif v24.authMethod == v18.EmailOtp then
        return v2.createElement("Frame", {
            LayoutOrder = v24.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Space_100_0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v27.Global.Space_20)
            }), 
            EmailOtpButton = v2.createElement(l_Button_0, {
                layoutOrder = 1, 
                text = v40.emailOneTimeCodeActionText, 
                buttonTextOverride = v19.getButtonTextOverrideConfig(), 
                onActivated = function() --[[ Line: 223 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy)
                    v24.onSubmit(nil);
                end, 
                standardSize = l_StandardButtonSize_0.Regular, 
                buttonType = if v24.isFirstItemInList then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary, 
                isLoading = v24.isLoginInProgress, 
                icon = l_Images_0["icons/menu/email"]
            })
        });
    else
        error("Invalid auth method");
        return v2.createElement("Frame", {
            LayoutOrder = v24.layoutOrder, 
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        });
    end;
end;
return AuthenticationMethod;