local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Promise);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Utils.debounce);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v12 = require(l_script_FirstAncestor_0.Hooks.useShowDisclaimerLinks);
local l_FetchSignupUserAgreements_0 = require(l_Parent_0.UserAgreements).FetchSignupUserAgreements;
local v14 = require(l_Parent_0.Cryo);
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_ToastType_0 = require(l_Parent_0.ToastRodux).Enums.ToastType;
local l_OpenAccountSwitchingErrorOverlay_0 = require(l_Parent_0.AccountSwitcher).OpenAccountSwitchingErrorOverlay;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v19 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v19.RoactNetworking;
local l_RoactAnalytics_0 = v19.RoactAnalytics;
local l_AppOmniRecommendationsRequest_0 = v19.AppOmniRecommendationsRequest;
local l_AppGuiService_0 = v19.AppGuiService;
local v24 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v24.Core.Style.useStyle;
local l_StyledTextLabel_0 = v24.App.Text.StyledTextLabel;
local l_PillGroup_0 = v24.App.Control.PillGroup;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local v29 = require(l_Parent_0.Foundation);
local l_Text_0 = v29.Text;
local l_TextInput_0 = v29.TextInput;
local v32 = require(l_Parent_0.UserActivationFramework);
local l_ActivationFrameworkWrapper_0 = v32.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v32.Enums.PayloadKey;
local l_FullPageActivationFrameworkContext_0 = v32.Context.FullPageActivationFrameworkContext;
local v36 = require(l_Parent_0.AuthSignup);
local l_UsernameValidator_0 = v36.Thunks.UsernameValidator;
local l_UsernameSuggestor_0 = v36.Thunks.UsernameSuggestor;
local l_SignUp_0 = v36.Thunks.SignUp;
local l_SignUpV2ErrorCodes_0 = v36.Enums.SignUpV2ErrorCodes;
local l_UsernameSuggestionScrollView_0 = v36.Components.UsernameSuggestionScrollView;
local v42 = require(l_Parent_0.AuthCommon);
local l_SignupActionRequired_0 = v42.Enums.SignupActionRequired;
local l_UsernameValidationContext_0 = v42.Enums.UsernameValidationContext;
local l_FetchAndStoreUserAppLaunchInfo_0 = v42.Thunks.FetchAndStoreUserAppLaunchInfo;
local l_UsernameIssue_0 = v42.Enums.UsernameIssue;
local l_IssueCondition_0 = v42.Enums.IssueCondition;
local l_LogoutAllLoggedInUsers_0 = v42.Thunks.LogoutAllLoggedInUsers;
local l_AppStorageUtilities_0 = v42.Utils.AppStorageUtilities;
local l_User_0 = v42.Thunks.User;
local l_AccountSwitcherConstants_0 = v42.Common.AccountSwitcherConstants;
local l_AuthLocalStorageKeys_0 = v42.Enums.AuthLocalStorageKeys;
local l_DisclaimerLinks_0 = v42.Components.DisclaimerLinks;
local v54 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v54.EventStreamConstants;
local l_authMsgShown_0 = v54.Events.authMsgShown;
local l_authClientError_0 = v54.Events.authClientError;
local l_authButtonClick_0 = v54.Events.authButtonClick;
local l_authFormInteraction_0 = v54.Events.authFormInteraction;
local v60 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSignupUnavailableInRegionError_0 = v60.FFlagEnableSignupUnavailableInRegionError;
local l_IsPrefetchOneCopyEnabled_0 = v60.IsPrefetchOneCopyEnabled;
local v63 = game:DefineFastFlag("UseFoundationUsernameSuggestion", false);
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v60.GetFFlagEnableMultiPageSignupV2Updates;
local v65 = require(l_Parent_0.RoactAppExperiment);
local l_FStringLuaMultiPageSignupIxpLayer_0 = v60.FStringLuaMultiPageSignupIxpLayer;
local v67 = {
    l_UsernameIssue_0.LengthTooShortOrTooLong, 
    l_UsernameIssue_0.ContainsInvalidCharacter, 
    l_UsernameIssue_0.MultipleUnderscores, 
    l_UsernameIssue_0.BoundingUnderscore, 
    l_UsernameIssue_0.Inappropriate, 
    l_UsernameIssue_0.AlreadyInUse, 
    l_UsernameIssue_0.ContainsPII
};
local v68 = {
    [l_UsernameIssue_0.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.Error.UsernameLengthTooShortOrTooLong", 
    [l_UsernameIssue_0.ContainsInvalidCharacter] = "Authentication.SignUp.Label.Error.UsernameContainsInvalidCharacter", 
    [l_UsernameIssue_0.MultipleUnderscores] = "Authentication.SignUp.Label.Error.UsernameContainsMultipleUnderscores", 
    [l_UsernameIssue_0.BoundingUnderscore] = "Authentication.SignUp.Label.Error.UsernameContainsBoundingUnderscore", 
    [l_UsernameIssue_0.Inappropriate] = "Authentication.SignUp.Label.Error.UsernameInappropriate", 
    [l_UsernameIssue_0.AlreadyInUse] = "Authentication.SignUp.Label.Error.UsernameAlreadyInUse", 
    [l_UsernameIssue_0.ContainsPII] = "Authentication.SignUp.Label.Error.UsernameContainsPII"
};
game:DefineFastInt("DefaultUsernameDebounceMs", 700);
return function(v69) --[[ Line: 112 ]]
    -- upvalues: v4 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_AppGuiService_0 (copy), l_IsPrefetchOneCopyEnabled_0 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useAppPolicy_0 (copy), v65 (copy), l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_UsernameValidator_0 (copy), v12 (copy), v5 (copy), l_LogoutAllLoggedInUsers_0 (copy), l_CloseCentralOverlay_0 (copy), l_AppStorageUtilities_0 (copy), l_User_0 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_GuiService_0 (copy), l_authMsgShown_0 (copy), l_EventStreamConstants_0 (copy), l_OpenAccountSwitchingErrorOverlay_0 (copy), l_SignUp_0 (copy), l_PayloadKey_0 (copy), l_FetchSignupUserAgreements_0 (copy), v14 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), v10 (copy), v67 (copy), l_IssueCondition_0 (copy), l_UsernameValidationContext_0 (copy), l_UsernameSuggestor_0 (copy), l_useLocalization_0 (copy), v68 (copy), l_Text_0 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_StyledTextLabel_0 (copy), v63 (copy), l_UsernameSuggestionScrollView_0 (copy), l_authButtonClick_0 (copy), l_PillGroup_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_SignupActionRequired_0 (copy), l_FetchAndStoreUserAppLaunchInfo_0 (copy), l_authClientError_0 (copy), l_authFormInteraction_0 (copy), l_SignUpV2ErrorCodes_0 (copy), l_AccountSwitcherConstants_0 (copy), l_FFlagEnableSignupUnavailableInRegionError_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), l_DisclaimerLinks_0 (copy), l_TextInput_0 (copy)
    local v70 = v4.useContext(l_FullPageActivationFrameworkContext_0);
    local l_activationFrameworkState_0 = v70.activationFrameworkState;
    local l_monoDeps_0 = v70.monoDeps;
    local l_ResetAppState_0 = l_monoDeps_0.ResetAppState;
    local l_Logout_0 = l_monoDeps_0.Logout;
    local v75 = l_useStyle_0();
    local v76 = l_useDesignTokens_0();
    local v77 = l_useDispatch_0();
    local v78 = l_useRoactService_0(l_RoactNetworking_0);
    local v79 = l_useRoactService_0(l_RoactAnalytics_0);
    local v80 = l_useRoactService_0(l_AppGuiService_0);
    local v81 = if l_IsPrefetchOneCopyEnabled_0() then l_useRoactService_0(l_AppOmniRecommendationsRequest_0) else nil;
    local v83 = l_useAppPolicy_0(function(v82) --[[ Line: 132 ]]
        return v82;
    end);
    local v86 = v65.useBrowserTrackerExperiment({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v84) --[[ Line: 138 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (ref)
        local v85 = v84[l_FStringLuaMultiPageSignupIxpLayer_0] or {};
        return {
            shouldShowGuidanceOnUserIdentifierPage = v85.shouldShowGuidanceOnUserIdentifierPage or false, 
            shouldShowCreateAccountHeaderOnMultiPageSignup = v85.shouldShowCreateAccountHeaderOnMultiPageSignup or false, 
            userIdentifierTitle = v85.userIdentifierTitle, 
            userIdentifierDescription = v85.userIdentifierDescription
        };
    end);
    local v87, v88 = v4.useState("");
    local v89, v90 = v4.useState(game:GetFastInt("DefaultUsernameDebounceMs") / 1000);
    local v91, v92 = v4.useState(l_UsernameValidator_0.getDefaultIssues());
    local v93, v94 = v4.useState({});
    local v95, v96 = v4.useState(false);
    local v97, v98 = v4.useState({});
    local v99, v100 = v4.useState(false);
    local v101 = v12();
    local v102, v103 = v4.useState(false);
    local v104 = v4.useRef(nil);
    local function _() --[[ Line: 162 ]]
        -- upvalues: v77 (copy), l_ResetAppState_0 (copy), v5 (ref)
        v77(l_ResetAppState_0());
        return v5.resolve();
    end;
    local function _(v106, v107) --[[ Line: 167 ]]
        -- upvalues: l_LogoutAllLoggedInUsers_0 (ref)
        return l_LogoutAllLoggedInUsers_0(v106, v107);
    end;
    local function _(v109, v110) --[[ Line: 171 ]]
        -- upvalues: v77 (copy), l_Logout_0 (copy)
        return v77(l_Logout_0(v109, v110));
    end;
    local function v112() --[[ Line: 175 ]]
        -- upvalues: v77 (copy), l_CloseCentralOverlay_0 (ref)
        return v77(l_CloseCentralOverlay_0());
    end;
    local function v118() --[[ Line: 179 ]]
        -- upvalues: l_AppStorageUtilities_0 (ref), l_User_0 (ref), v78 (copy), l_LogoutAllLoggedInUsers_0 (ref), v77 (copy), l_ResetAppState_0 (copy), v5 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_GuiService_0 (ref), l_Logout_0 (copy), l_CloseCentralOverlay_0 (ref)
        local v113 = l_AppStorageUtilities_0.getAccountBlob();
        local v114 = l_User_0.fromLocalStorage().userId ~= -1;
        l_LogoutAllLoggedInUsers_0(v78, v113):await();
        if v114 == true then
            v77(l_ResetAppState_0());
            local _ = v5.resolve();
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, "");
            l_AppStorageService_0:Flush();
            local _ = v77(l_Logout_0(v78, l_GuiService_0));
        end;
        local _ = v77(l_CloseCentralOverlay_0());
    end;
    local function _(v119, v120, v121, v122, v123, v124, v125) --[[ Line: 194 ]]
        -- upvalues: l_authMsgShown_0 (ref), v69 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref), v77 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref)
        l_authMsgShown_0(v69.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.AccountSwitchingErrorModalShown, v125);
        return v77(l_OpenAccountSwitchingErrorOverlay_0(v119, v120, v121, v122, v123, v124, v125));
    end;
    local function _(v127) --[[ Line: 223 ]]
        -- upvalues: l_SignUp_0 (ref), v78 (copy), v81 (copy), v80 (copy), v79 (copy), v83 (copy)
        return l_SignUp_0(v78, v81, v80, v79, v83, v127, true);
    end;
    local v129 = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupBirthdayTimestampUtc];
    v4.useEffect(function() --[[ Line: 229 ]]
        -- upvalues: l_FetchSignupUserAgreements_0 (ref), v78 (copy), v79 (copy), v98 (copy), v14 (ref)
        l_FetchSignupUserAgreements_0(v78, v79):andThen(function(v130) --[[ Line: 230 ]]
            -- upvalues: v98 (ref), v14 (ref)
            v98(v14.List.map(v130, function(v131) --[[ Line: 231 ]]
                return v131.id;
            end));
        end);
    end, {});
    v4.useEffect(function() --[[ Line: 237 ]]
        -- upvalues: v104 (copy)
        if v104.current and v104.current.focus then
            v104.current.focus();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 243 ]]
        -- upvalues: l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v102 (copy), v104 (copy), v103 (copy)
        if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v102 then
            if v104.current and v104.current.focus then
                v104.current.focus();
            end;
            v103(false);
        end;
    end, {
        v102
    });
    local v133 = v4.useCallback(v10(function(v132) --[[ Line: 256 ]]
        -- upvalues: v88 (copy)
        v88(v132);
    end, v89), {
        v88, 
        v89
    });
    local v137 = v4.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: v67 (ref), v91 (copy), l_IssueCondition_0 (ref)
        local v134 = nil;
        for _, v136 in ipairs(v67) do
            if v91[v136] == l_IssueCondition_0.Problematic then
                return v136;
            end;
        end;
        return v134;
    end, {
        v91
    });
    local function _() --[[ Line: 273 ]]
        -- upvalues: v77 (copy), l_UsernameValidator_0 (ref), v78 (copy), v87 (copy), v91 (copy), v129 (copy), l_UsernameValidationContext_0 (ref)
        return v77(l_UsernameValidator_0.validateFunction(v78, v87, v91, {
            birthday = v129, 
            context = l_UsernameValidationContext_0.Signup
        }));
    end;
    local function v140() --[[ Line: 280 ]]
        -- upvalues: l_UsernameSuggestor_0 (ref), v78 (copy), v87 (copy), v129 (copy), l_UsernameValidationContext_0 (ref), v94 (copy)
        l_UsernameSuggestor_0.suggestUsernames(v78, v87, v129, l_UsernameValidationContext_0.Signup):andThen(function(v139) --[[ Line: 282 ]]
            -- upvalues: v94 (ref)
            if v139.shouldUpdateState then
                v94(v139.suggestions);
            end;
        end);
    end;
    v4.useEffect(v140, {
        v87
    });
    v4.useEffect(function() --[[ Line: 290 ]]
        -- upvalues: v137 (copy), v95 (copy), v87 (copy), l_authMsgShown_0 (ref), v69 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref)
        local v141 = tostring(v137());
        if v141 and v95 and #v87 > 0 then
            l_authMsgShown_0(v69.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.Username, v141);
        end;
    end, {
        v91
    });
    local function v143() --[[ Line: 304 ]]
        -- upvalues: v77 (copy), l_UsernameValidator_0 (ref), v78 (copy), v87 (copy), v91 (copy), v129 (copy), l_UsernameValidationContext_0 (ref), v92 (copy), v96 (copy), v90 (copy)
        v77(l_UsernameValidator_0.validateFunction(v78, v87, v91, {
            birthday = v129, 
            context = l_UsernameValidationContext_0.Signup
        })):andThen(function(v142) --[[ Line: 305 ]]
            -- upvalues: v92 (ref), v96 (ref), v87 (ref), v90 (ref)
            v92(v142.IssueCondition);
            v96(#v87 > 0);
            if v142.InputValid then
                v90(0.2);
            end;
        end);
    end;
    v4.useEffect(v143, {
        v87
    });
    local v144 = v137();
    local v145 = v144 and v95 and #v87 > 0;
    local v146 = v145 and #v93 > 0;
    local l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 = v86.shouldShowCreateAccountHeaderOnMultiPageSignup;
    local v148 = l_useLocalization_0({
        username = "Authentication.Login.Label.Username", 
        usernameSuggestionHeaderText = "Authentication.SignUp.Label.MaybeTryOneOfThese", 
        errorText = v144 and v68[v144], 
        noRealNamePlaceholderText = "Authentication.SignUp.Message.Username.NoRealNameUse", 
        usernameRule1 = "Authentication.SignUp.Description.UsernameRule1", 
        usernameRule2 = "Authentication.SignUp.Description.UsernameRule2"
    });
    local function v156(v149) --[[ Line: 332 ]]
        -- upvalues: v4 (ref), l_Text_0 (ref), v76 (copy), v86 (copy), v145 (copy), v148 (copy), l_GetFFlagEnableSignupFoundationText_0 (ref), v75 (copy), l_StyledTextLabel_0 (ref)
        local v150 = v4.createElement(l_Text_0, {
            LayoutOrder = 0, 
            Text = "\226\128\162", 
            tag = "text-body-small text-align-x-center text-align-y-center auto-xy"
        });
        local function v153(v151, v152) --[[ Line: 338 ]]
            -- upvalues: v4 (ref), v76 (ref), v150 (copy), l_Text_0 (ref)
            return v4.createElement("Frame", {
                LayoutOrder = v152, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v76.Global.Space_100)
                }), 
                UIPadding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v76.Global.Space_50)
                }), 
                BulletPoint = v150, 
                Text = v4.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = v151, 
                    tag = "text-body-small text-align-x-left text-wrap auto-xy"
                })
            });
        end;
        local v154 = nil;
        v154 = if not v86.shouldShowGuidanceOnUserIdentifierPage or v145 then if l_GetFFlagEnableSignupFoundationText_0() then v4.createElement(l_Text_0, {
            Text = if v145 then v148.errorText else "", 
            TextWrapped = true, 
            textStyle = {
                Color3 = v75.Theme.Alert.Color, 
                Transparency = v75.Theme.Alert.Transparency
            }, 
            tag = "text-body-small auto-xy"
        }) else v4.createElement(l_StyledTextLabel_0, {
            text = if v145 then v148.errorText else "", 
            fontStyle = v75.Font.BodySmall, 
            colorStyle = v75.Theme.Alert, 
            automaticSize = Enum.AutomaticSize.XY, 
            textWrapped = true
        }) else v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v76.Global.Space_20)
            }), 
            FirstRule = v153(v148.usernameRule1, 1), 
            SecondRule = v153(v148.usernameRule2, 2)
        });
        local v155 = if v86.shouldShowGuidanceOnUserIdentifierPage then v76.Global.Size_500 else v76.Global.Size_200;
        return v4.createElement("Frame", {
            LayoutOrder = v149, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v155)
        }, {
            v154
        });
    end;
    local function v161(v157) --[[ Line: 410 ]]
        -- upvalues: v63 (ref), v4 (ref), l_UsernameSuggestionScrollView_0 (ref), v87 (copy), v93 (copy), v70 (copy), v88 (copy), v94 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_PillGroup_0 (ref)
        if v63 then
            return v4.createElement(l_UsernameSuggestionScrollView_0, {
                inputUsername = v87, 
                suggestionUsernames = v93, 
                eventContext = tostring(v70.activationFrameworkState.namespace), 
                onUsernameSelected = function(v158) --[[ Line: 416 ]] --[[ Name: onUsernameSelected ]]
                    -- upvalues: v88 (ref), v94 (ref), l_authButtonClick_0 (ref), v70 (ref), l_EventStreamConstants_0 (ref)
                    v88(v158);
                    v94({});
                    l_authButtonClick_0(v70.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.UsernameSuggestion, v158);
                end, 
                layoutOrder = v157
            });
        else
            return v4.createElement(l_PillGroup_0, {
                layoutOrder = 8, 
                pills = v93, 
                leftPadding = 0, 
                onSelectionChanged = function(v159) --[[ Line: 432 ]] --[[ Name: onSelectionChanged ]]
                    -- upvalues: v88 (ref), v94 (ref), l_authButtonClick_0 (ref), v70 (ref), l_EventStreamConstants_0 (ref)
                    if #v159 == 1 then
                        if #v159[1] == 0 then
                            return;
                        else
                            local v160 = v159[1];
                            v88(v160);
                            v94({});
                            l_authButtonClick_0(v70.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.UsernameSuggestion, v160);
                        end;
                    end;
                end
            });
        end;
    end;
    local l_createElement_0 = v4.createElement;
    local l_l_ActivationFrameworkWrapper_0_0 = l_ActivationFrameworkWrapper_0;
    local v164 = {
        namespace = v69.namespace, 
        titleTextKey = "Authentication.SignUp.Header.CreateAUsername", 
        bodyTextKey = "Authentication.SignUp.Description.UsernameHelpV2", 
        headingTextKey = l_shouldShowCreateAccountHeaderOnMultiPageSignup_0 and "Authentication.SignUp.Action.CreateAccount" or nil, 
        ixpTitleTextKey = v86.userIdentifierTitle, 
        ixpBodyTextKey = v86.userIdentifierDescription
    };
    local v165 = {
        buttonTextKey = "Authentication.SignUp.Action.NextWord", 
        shouldShowButton = true
    };
    local v166 = false;
    if #v87 > 0 then
        v166 = v95 and not v145 and not v99;
    end;
    v165.isButtonEnabled = v166;
    v165.onButtonClicked = function() --[[ Line: 462 ]] --[[ Name: onButtonClicked ]]
        -- upvalues: v100 (copy), v87 (copy), v129 (copy), v97 (copy), l_SignUp_0 (ref), v78 (copy), v81 (copy), v80 (copy), v79 (copy), v83 (copy), l_AppStorageUtilities_0 (ref), l_SignupActionRequired_0 (ref), l_User_0 (ref), l_FetchAndStoreUserAppLaunchInfo_0 (ref), l_authClientError_0 (ref), v69 (copy), l_EventStreamConstants_0 (ref), l_authFormInteraction_0 (ref), v70 (copy), l_PayloadKey_0 (ref), l_SignUpV2ErrorCodes_0 (ref), v118 (copy), v112 (copy), l_AccountSwitcherConstants_0 (ref), l_authMsgShown_0 (ref), l_activationFrameworkState_0 (copy), v77 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v76 (copy), l_UsernameValidator_0 (ref), v91 (copy), l_UsernameValidationContext_0 (ref), v92 (copy), v96 (copy), v90 (copy), l_UsernameSuggestor_0 (ref), v94 (copy)
        v100(true);
        local v167 = {
            username = v87, 
            birthday = v129, 
            password = "", 
            gender = "Unknown", 
            agreementIds = v97
        };
        local v168;
        v168, v167 = l_SignUp_0(v78, v81, v80, v79, v83, v167, true):andThen(function(v169) --[[ Line: 471 ]]
            -- upvalues: l_AppStorageUtilities_0 (ref), l_SignupActionRequired_0 (ref), l_User_0 (ref), l_FetchAndStoreUserAppLaunchInfo_0 (ref), v78 (ref), l_authClientError_0 (ref), v69 (ref), l_EventStreamConstants_0 (ref), l_authFormInteraction_0 (ref), v70 (ref), l_PayloadKey_0 (ref), v87 (ref)
            l_AppStorageUtilities_0.setAccountBlob(v169.responseBody.accountBlob);
            l_AppStorageUtilities_0.setSignupActionRequired(l_SignupActionRequired_0.MultipageCredential);
            l_AppStorageUtilities_0.flush();
            l_User_0.clearLocalStorage();
            if not l_FetchAndStoreUserAppLaunchInfo_0(v78) then
                l_authClientError_0(v69.namespace, l_EventStreamConstants_0.State.FetchUserInfoError);
                return nil;
            else
                l_authFormInteraction_0(v70.activationFrameworkState.namespace, l_EventStreamConstants_0.Field.SignupSuccess, v70.activationFrameworkState.currentState);
                return {
                    [l_PayloadKey_0.SignupUsername] = v87
                };
            end;
        end, function(v170) --[[ Line: 492 ]]
            -- upvalues: l_SignUpV2ErrorCodes_0 (ref), v118 (ref), v112 (ref), l_AccountSwitcherConstants_0 (ref), l_authMsgShown_0 (ref), v69 (ref), l_activationFrameworkState_0 (ref), l_EventStreamConstants_0 (ref), v77 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), l_authClientError_0 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v76 (ref), l_UsernameValidator_0 (ref), v78 (ref), v87 (ref), v91 (ref), v129 (ref), l_UsernameValidationContext_0 (ref), v92 (ref), v96 (ref), v90 (ref), l_UsernameSuggestor_0 (ref), v94 (ref)
            if v170 == l_SignUpV2ErrorCodes_0.EmptyAccountSwitchBlobRequired or v170 == l_SignUpV2ErrorCodes_0.ParentEmptyAccountSwitchBlobRequired then
                local v171 = v170 == l_SignUpV2ErrorCodes_0.EmptyAccountSwitchBlobRequired and "Authentication.AccountSwitch.Description.LogoutConfirmation" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation";
                local l_v118_0 = v118;
                local l_v112_0 = v112;
                local v174 = if v170 == l_SignUpV2ErrorCodes_0.EmptyAccountSwitchBlobRequired then l_AccountSwitcherConstants_0.AccountSwitcherLoginEmptyBlobRequiredError else l_AccountSwitcherConstants_0.AccountSwitcherParentLoginEmptyBlobRequiredError;
                l_authMsgShown_0(v69.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.AccountSwitchingErrorModalShown, v174);
                local _ = v77(l_OpenAccountSwitchingErrorOverlay_0("Authentication.AccountSwitch.Header.LogoutAllAccounts", v171, "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", l_v118_0, l_v112_0, v174));
                return nil;
            else
                l_authClientError_0(v69.namespace, l_EventStreamConstants_0.State.GenericSignupError .. "," .. tostring(v170));
                local v176 = "Authentication.Login.Response.SomethingWentWrong";
                if l_FFlagEnableSignupUnavailableInRegionError_0 and v170 == l_SignUpV2ErrorCodes_0.UnavailableInRegion then
                    v176 = "Authentication.SignUp.Description.RobloxNotAvailableInRegion";
                end;
                v77(l_SetCurrentToastMessage_0({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = v176, 
                    toastIconColorStyle = {
                        Color = v76.Global.Color.Red.Color3, 
                        Transparency = 0
                    }, 
                    slideIn = true
                }));
                v77(l_UsernameValidator_0.validateFunction(v78, v87, v91, {
                    birthday = v129, 
                    context = l_UsernameValidationContext_0.Signup
                })):andThen(function(v177) --[[ Line: 305 ]]
                    -- upvalues: v92 (ref), v96 (ref), v87 (ref), v90 (ref)
                    v92(v177.IssueCondition);
                    v96(#v87 > 0);
                    if v177.InputValid then
                        v90(0.2);
                    end;
                end);
                l_UsernameSuggestor_0.suggestUsernames(v78, v87, v129, l_UsernameValidationContext_0.Signup):andThen(function(v178) --[[ Line: 282 ]]
                    -- upvalues: v94 (ref)
                    if v178.shouldUpdateState then
                        v94(v178.suggestions);
                    end;
                end);
                return nil;
            end;
        end):await();
        v100(false);
        return v167;
    end;
    v164.primaryButton = v165;
    v164.navigation = v69.navigation;
    v164.subFooterContent = v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        DisclaimerLinks = if v101 then v4.createElement(l_DisclaimerLinks_0, {
            ctx = v69.namespace, 
            state = l_activationFrameworkState_0.currentState
        }) else nil
    });
    return l_createElement_0(l_l_ActivationFrameworkWrapper_0_0, v164, {
        Content = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v76.Global.Space_20)
            }), 
            UsernameInputLabel = if l_GetFFlagEnableSignupFoundationText_0() then v4.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v148.username, 
                tag = "text-body-small auto-xy"
            }) else v4.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v148.username, 
                fontStyle = v75.Font.Body, 
                colorStyle = v75.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            IdentifierLabelSpacing = v4.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v76.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            UsernameTextInput = v4.createElement(l_TextInput_0, {
                LayoutOrder = 3, 
                textInputType = Enum.TextInputType.Username, 
                width = UDim.new(1, 0), 
                text = v87, 
                placeholder = v148.noRealNamePlaceholderText, 
                onChanged = function(v179) --[[ Line: 596 ]] --[[ Name: onChanged ]]
                    -- upvalues: v133 (copy)
                    v133(v179);
                end, 
                label = "", 
                hasError = v145, 
                iconTrailing = if v145 then {
                    name = "icons/navigation/close", 
                    onActivated = function() --[[ Line: 604 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), v70 (copy), l_EventStreamConstants_0 (ref), v88 (copy), v94 (copy), v90 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v103 (copy)
                        l_authButtonClick_0(v70.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.ClearUsernameField, v70.activationFrameworkState.currentState);
                        v88("");
                        v94({});
                        v90(game:GetFastInt("DefaultUsernameDebounceMs") / 1000);
                        if l_GetFFlagEnableMultiPageSignupV2Updates_0() then
                            v103(true);
                        end;
                    end
                } else nil, 
                textBoxRef = v104
            }), 
            TextSpacing = v4.createElement("Frame", {
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, v76.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            AdditionalText = v156(5), 
            SuggestionsLabelSpacing = v146 and v4.createElement("Frame", {
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, v76.Global.Space_200), 
                BackgroundTransparency = 1
            }), 
            SuggestionsLabel = v146 and if l_GetFFlagEnableSignupFoundationText_0() then v4.createElement(l_Text_0, {
                LayoutOrder = 7, 
                Text = v148.usernameSuggestionHeaderText, 
                tag = "text-body-small auto-xy"
            }) else v4.createElement(l_StyledTextLabel_0, {
                layoutOrder = 7, 
                text = v148.usernameSuggestionHeaderText, 
                fontStyle = v75.Font.Body, 
                colorStyle = v75.Theme.TextDefault, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            UsernameSuggestion = v146 and v161(8)
        })
    });
end;