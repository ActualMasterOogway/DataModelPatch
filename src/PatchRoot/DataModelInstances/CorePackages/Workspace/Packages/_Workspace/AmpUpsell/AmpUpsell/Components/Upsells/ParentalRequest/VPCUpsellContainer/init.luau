local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.VPCApiProvider);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_vpcConfirmationScreenStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcConfirmationScreenStrings;
local l_vpcUpsellGatherEmailStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).vpcUpsellGatherEmailStrings;
local v7 = require(script.Parent.VPCErrorScreen);
local v8 = require(script.Parent.VPCConfirmationScreen);
local v9 = require(script.Parent.VPCNewParentUpsell);
local l_isStringEmail_0 = require(l_Parent_0.AuthCommon).Utils.isStringEmail;
local v11 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v12 = require(l_script_FirstAncestor_0.Flags.GetFStringPrivacyPolicyLink);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v14 = require(l_script_FirstAncestor_0.Common.Enums);
local l_ActionTypeEnum_0 = v14.ActionTypeEnum;
local l_VPCStepEnum_0 = v14.VPCStepEnum;
local v17 = require(l_Parent_0.AuthAnalytics);
local l_authMsgShown_0 = v17.Events.authMsgShown;
local l_authButtonClick_0 = v17.Events.authButtonClick;
local l_authFormInteraction_0 = v17.Events.authFormInteraction;
local l_vpcEventConstants_0 = require(l_script_FirstAncestor_0.Common.EventConstants).vpcEventConstants;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v24 = require(l_Parent_0.ArgCheck);
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local v26 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableExternalBrowserForVPCPrivacyPolicy);
return function(v27) --[[ Line: 43 ]] --[[ Name: VPCUpsellContainer ]]
    -- upvalues: v3 (copy), v26 (copy), l_useAppPolicy_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), v2 (copy), l_ActionTypeEnum_0 (copy), l_VPCStepEnum_0 (copy), l_useLocalization_0 (copy), l_vpcUpsellGatherEmailStrings_0 (copy), l_useNavigation_0 (copy), v24 (copy), v12 (copy), v11 (copy), l_isStringEmail_0 (copy), l_authMsgShown_0 (copy), l_vpcEventConstants_0 (copy), v8 (copy), l_vpcConfirmationScreenStrings_0 (copy), l_authButtonClick_0 (copy), v9 (copy), l_authFormInteraction_0 (copy), v7 (copy)
    local l_onCancel_0 = v27.onCancel;
    local l_onSuccess_0 = v27.onSuccess;
    local v30 = if v27.vpcApiProvider then v27.vpcApiProvider else v3;
    local l_recourseAction_0 = v27.recourseAction;
    local l_recourseData_0 = v27.recourseData;
    local v33 = if v27.entryPointEventCtx then v27.entryPointEventCtx else "";
    local l_parentConsentTypes_0 = v27.parentConsentTypes;
    local v35 = false;
    local v36 = nil;
    if v26() then
        v35 = l_useAppPolicy_0(function(v37) --[[ Line: 55 ]]
            return v37.shouldUseExternalBrowserForDisclaimerLinks();
        end);
        v36 = l_useRoactService_0(l_AppLinking_0);
    end;
    local v38, v39 = v2.useState(if l_recourseAction_0 == l_ActionTypeEnum_0.ParentLink then l_VPCStepEnum_0.NewParentCollectEmail else l_VPCStepEnum_0.AlreadyLinkedSendRequest);
    local v40, v41 = v2.useState("Unknown");
    local v42, v43 = v2.useState({});
    local v44 = l_useLocalization_0(l_vpcUpsellGatherEmailStrings_0);
    local v45, v46 = v2.useState(false);
    local v47, v48 = v2.useState("");
    local v49, v50 = v2.useState("");
    local v51 = l_useNavigation_0();
    local function _(v52, v53) --[[ Line: 76 ]] --[[ Name: openExternalBrowser ]]
        -- upvalues: v24 (ref)
        v24.isNotNil(v52, "linking");
        v24.isType(v53, "string", "url");
        v52:openURL(v53);
    end;
    local function v57() --[[ Line: 83 ]]
        -- upvalues: v26 (ref), v35 (ref), v36 (ref), v12 (ref), v24 (ref), v51 (copy), v11 (ref), v44 (copy)
        if v26() and v35 then
            local l_v36_0 = v36;
            local v56 = v12();
            v24.isNotNil(l_v36_0, "linking");
            v24.isType(v56, "string", "url");
            l_v36_0:openURL(v56);
            return;
        else
            v51.navigate(v11.GenericWebPage, {
                detail = v12(), 
                extraProps = {
                    title = v44.privacyLinkText, 
                    transitionAnimation = "SlideInFromBottom"
                }
            });
            return;
        end;
    end;
    local function v59(v58) --[[ Line: 97 ]] --[[ Name: handleEmailInput ]]
        -- upvalues: v48 (copy), l_isStringEmail_0 (ref), v46 (copy), v50 (copy), v44 (copy)
        v48(v58);
        if l_isStringEmail_0(v58) then
            v46(true);
            v50("");
            return;
        else
            v46(false);
            if v58 == "" then
                v50("");
                return;
            else
                v50(v44.errorText);
                return;
            end;
        end;
    end;
    local v60, v61 = v2.useState(0);
    local l_onRetryAmp_0 = v27.onRetryAmp;
    local function v63() --[[ Line: 115 ]] --[[ Name: onRetryVPC ]]
        -- upvalues: v61 (copy), v60 (copy), v43 (copy), v41 (copy), v59 (copy), v39 (copy), l_recourseAction_0 (copy), l_ActionTypeEnum_0 (ref), l_VPCStepEnum_0 (ref)
        v61(v60 + 1);
        v43({});
        v41("Unknown");
        v59("");
        v39(if l_recourseAction_0 == l_ActionTypeEnum_0.ParentLink then l_VPCStepEnum_0.NewParentCollectEmail else l_VPCStepEnum_0.AlreadyLinkedSendRequest);
    end;
    local function v68() --[[ Line: 127 ]] --[[ Name: getLinkedParentEmailsAndSendRequestToAllParents ]]
        -- upvalues: v30 (copy), v43 (copy), l_parentConsentTypes_0 (copy), l_recourseData_0 (copy), v39 (copy), l_VPCStepEnum_0 (ref), v41 (copy)
        v30.getLinkedParentEmails():andThen(function(v64) --[[ Line: 130 ]]
            -- upvalues: v43 (ref)
            v43(v64.parentEmails);
        end):catch(function(_) --[[ Line: 133 ]]

        end);
        v30.sendRequestToAllParents(l_parentConsentTypes_0, l_recourseData_0):andThen(function(_) --[[ Line: 137 ]]
            -- upvalues: v39 (ref), l_VPCStepEnum_0 (ref)
            v39(l_VPCStepEnum_0.RequestSent);
        end):catch(function(v67) --[[ Line: 140 ]]
            -- upvalues: v41 (ref), v39 (ref), l_VPCStepEnum_0 (ref)
            v41(v67.code);
            v39(l_VPCStepEnum_0.Error);
        end);
    end;
    local function v72(v69) --[[ Line: 146 ]] --[[ Name: sendRequestToNewParent ]]
        -- upvalues: v30 (copy), l_parentConsentTypes_0 (copy), l_recourseData_0 (copy), v39 (copy), l_VPCStepEnum_0 (ref), v41 (copy)
        v30.sendRequestToNewParent(v69, l_parentConsentTypes_0, l_recourseData_0):andThen(function(_) --[[ Line: 149 ]]
            -- upvalues: v39 (ref), l_VPCStepEnum_0 (ref)
            v39(l_VPCStepEnum_0.RequestSent);
        end):catch(function(v71) --[[ Line: 152 ]]
            -- upvalues: v41 (ref), v39 (ref), l_VPCStepEnum_0 (ref)
            v41(v71.code);
            v39(l_VPCStepEnum_0.Error);
        end);
    end;
    v2.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: l_recourseAction_0 (copy), l_ActionTypeEnum_0 (ref), v68 (copy)
        if l_recourseAction_0 == l_ActionTypeEnum_0.ParentConsent then
            v68();
        end;
    end, {
        v60
    });
    if v38 == l_VPCStepEnum_0.RequestSent then
        l_authMsgShown_0(v33, "", l_vpcEventConstants_0.confirmationPageLoadField, "");
        return v2.createElement(v8, {
            messageStrings = l_vpcConfirmationScreenStrings_0, 
            parentEmails = v42, 
            onAck = function() --[[ Line: 169 ]] --[[ Name: onAck ]]
                -- upvalues: l_authButtonClick_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), l_onSuccess_0 (copy)
                l_authButtonClick_0(v33, l_vpcEventConstants_0.confirmationPageButton);
                l_onSuccess_0();
            end
        });
    elseif v38 == l_VPCStepEnum_0.NewParentCollectEmail then
        l_authMsgShown_0(v33, "", l_vpcEventConstants_0.collectEmailPageLoadField, "");
        return v2.createElement(v9, {
            onCancel = l_onCancel_0, 
            onCollectEmailAndSendRequest = function(v73) --[[ Line: 178 ]] --[[ Name: onCollectEmailAndSendRequest ]]
                -- upvalues: l_authButtonClick_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), v43 (copy), v39 (copy), l_VPCStepEnum_0 (ref), v72 (copy)
                l_authButtonClick_0(v33, l_vpcEventConstants_0.collectEmailPageSubmitButton);
                v43({
                    v73
                });
                v39(l_VPCStepEnum_0.NewParentSendRequest);
                v72(v73);
            end, 
            onTextChange = function(v74) --[[ Line: 184 ]] --[[ Name: onTextChange ]]
                -- upvalues: l_authFormInteraction_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), v59 (copy)
                l_authFormInteraction_0(v33, l_vpcEventConstants_0.collectEmailPageInteractFormField);
                v59(v74);
            end, 
            canSendRequest = v45, 
            textInput = v47, 
            openPrivacyPolicyLink = v57, 
            errorText = v49, 
            messageStrings = l_vpcUpsellGatherEmailStrings_0
        });
    elseif v38 == l_VPCStepEnum_0.AlreadyLinkedSendRequest then
        return nil;
    elseif v38 == l_VPCStepEnum_0.NewParentSendRequest then
        return nil;
    else
        l_authMsgShown_0(v33, "", l_vpcEventConstants_0.errorPageLoadField, v40);
        return v2.createElement(v7, {
            errorCode = v40, 
            onRetryAmp = function() --[[ Line: 202 ]] --[[ Name: onRetryAmp ]]
                -- upvalues: l_authButtonClick_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), l_onRetryAmp_0 (copy)
                l_authButtonClick_0(v33, l_vpcEventConstants_0.errorPageRetryButton);
                l_onRetryAmp_0();
            end, 
            onRetryVPC = function() --[[ Line: 206 ]] --[[ Name: onRetryVPC ]]
                -- upvalues: l_authButtonClick_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), v63 (copy)
                l_authButtonClick_0(v33, l_vpcEventConstants_0.errorPageRetryButton);
                v63();
            end, 
            onCancel = function() --[[ Line: 210 ]] --[[ Name: onCancel ]]
                -- upvalues: l_authButtonClick_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), l_onCancel_0 (copy)
                l_authButtonClick_0(v33, l_vpcEventConstants_0.errorPageCancelButton);
                l_onCancel_0();
            end, 
            onSuccess = function() --[[ Line: 214 ]] --[[ Name: onSuccess ]]
                -- upvalues: l_authButtonClick_0 (ref), v33 (copy), l_vpcEventConstants_0 (ref), l_onSuccess_0 (copy)
                l_authButtonClick_0(v33, l_vpcEventConstants_0.confirmationPageButton);
                l_onSuccess_0();
            end, 
            retryNum = v60
        });
    end;
end;