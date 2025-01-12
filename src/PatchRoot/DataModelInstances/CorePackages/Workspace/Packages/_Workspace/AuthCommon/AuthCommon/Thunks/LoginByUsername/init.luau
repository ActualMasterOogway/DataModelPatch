local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v9 = require(l_script_FirstAncestor_0.Utils.LoginByUsernameSSOErrorsTelemetry);
local v10 = require(l_script_FirstAncestor_0.Utils.GetLoginByUsernameErrorMessage);
local v11 = require(l_Parent_0.LoggingProtocol);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v13 = require(l_script_FirstAncestor_0.Utils.GetDxBlob);
local v14 = require(l_script_FirstAncestor_0.Utils.GetCaptchaDataJson);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagBlockTwoSVForNoWebView_0 = require(l_Parent_0.SharedFlags).GetFFlagBlockTwoSVForNoWebView;
local l_GetFFlagEnableGenericTwoFAMessage_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableGenericTwoFAMessage;
local function _(v18, v19, v20, v21, v22) --[[ Line: 27 ]] --[[ Name: loginRequest ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy)
    if l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v4.singleSignOnConnectWithCredential(v18, v19, v20, "Username");
    else
        return v4.logByUsername(v18, v19, v20, v21, v22);
    end;
end;
return function(v24, v25, v26, v27, v28, v29, v30) --[[ Line: 37 ]] --[[ Name: loginByUsername ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy), v7 (copy), l_GetFFlagBlockTwoSVForNoWebView_0 (copy), v3 (copy), v8 (copy), l_GetFFlagEnableGenericTwoFAMessage_0 (copy), l_HttpService_0 (copy), v13 (copy), v14 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), v10 (copy), v11 (copy), v9 (copy)
    return function(v31) --[[ Line: 46 ]]
        -- upvalues: l_getAppFeaturePolicies_0 (ref), v24 (copy), v25 (copy), v26 (copy), v28 (copy), v30 (copy), v4 (ref), v7 (ref), l_GetFFlagBlockTwoSVForNoWebView_0 (ref), v3 (ref), v8 (ref), l_GetFFlagEnableGenericTwoFAMessage_0 (ref), l_HttpService_0 (ref), v13 (ref), v14 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v27 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v10 (ref), v11 (ref), v9 (ref), v29 (copy)
        local v32 = l_getAppFeaturePolicies_0().getUseSingleSignOn();
        local l_v24_0 = v24;
        local l_v25_0 = v25;
        local l_v26_0 = v26;
        local l_v28_0 = v28;
        local l_v30_0 = v30;
        return (if l_getAppFeaturePolicies_0().getUseSingleSignOn() then v4.singleSignOnConnectWithCredential(l_v24_0, l_v25_0, l_v26_0, "Username") else v4.logByUsername(l_v24_0, l_v25_0, l_v26_0, l_v28_0, l_v30_0)):andThen(function(v38) --[[ Line: 48 ]]
            -- upvalues: v7 (ref), l_GetFFlagBlockTwoSVForNoWebView_0 (ref), v32 (copy), l_getAppFeaturePolicies_0 (ref), v3 (ref), v8 (ref), l_GetFFlagEnableGenericTwoFAMessage_0 (ref)
            assert(v38, "no login attempt result");
            assert(#v38 == 1, "no result or more than one result");
            local v39 = v7.fromJsonData(v38[1]);
            assert(v39, "result invalid");
            if (if l_GetFFlagBlockTwoSVForNoWebView_0() then v32 or not l_getAppFeaturePolicies_0().getWebViewSupport() else v32) and v39 and v7.hasTwoStepData(v39) then
                return v3.reject({
                    errorCode = v8.ServiceUnavailable, 
                    errorKey = l_GetFFlagEnableGenericTwoFAMessage_0() and "Authentication.Login.Response.Require2FAGeneric" or "Authentication.Login.Response.Require2FA"
                });
            else
                return v39;
            end;
        end, function(v40) --[[ Line: 69 ]]
            -- upvalues: l_HttpService_0 (ref), v8 (ref), v13 (ref), v14 (ref), v31 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v27 (ref), v25 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v32 (copy), v10 (ref), v11 (ref), v9 (ref), v3 (ref), v29 (ref)
            local v41 = l_HttpService_0:JSONDecode(v40.Body);
            local v42 = nil;
            local l_code_0 = v41.errors[1].code;
            local v44 = nil;
            if l_code_0 == v8.IncorrectCValueOrPassword then
                v42 = "Authentication.Login.Response.IncorrectUsernamePassword";
            elseif l_code_0 == v8.Captcha then
                local _ = v13(v41);
                local _ = nil;
                local v47, v48 = v14(v41);
                v31:dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v27, 
                        captchaType = "login", 
                        captchaId = v47, 
                        cvalueType = "username", 
                        cvalue = v25, 
                        dxBlob = v48, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and l_code_0 == v8.SecurityQuestions then
                v42 = "Authentication.Login.Response.SomethingWentWrong";
                if v41.errors[1].fieldData then
                    local v49 = l_HttpService_0:JSONDecode(v41.errors[1].fieldData);
                    if v49.sessionId and v49.userId then
                        v44 = v49;
                        v42 = nil;
                    end;
                end;
            elseif l_code_0 == v8.ServiceUnavailable then
                v42 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 ~= v8.AccountLocked then
                v42 = "Authentication.Login.Response.SomethingWentWrong";
            end;
            if v32 then
                warn("Login ErrorCode:", l_code_0);
                v42 = v10(l_code_0);
                local v50 = if v42[1] then v42[1] else v42;
                v11.default:logRobloxTelemetryEvent(v9, nil, {
                    ssoErrorCode = l_code_0, 
                    msgShown = v50
                });
            end;
            return v3.reject({
                errorKey = v42, 
                errorCode = l_code_0, 
                securityQuestionsData = v44, 
                securityQuestionsCallback = v29
            });
        end);
    end;
end;