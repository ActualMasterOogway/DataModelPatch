local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v9 = require(l_Parent_0.LoggingProtocol);
local v10 = require(l_script_FirstAncestor_0.Utils.LoginByUsernameSSOErrorsTelemetry);
local v11 = require(l_script_FirstAncestor_0.Utils.GetLoginByUsernameErrorMessage);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v13 = require(l_script_FirstAncestor_0.Utils.GetDxBlob);
local v14 = require(l_script_FirstAncestor_0.Utils.GetCaptchaDataJson);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local function _(v16, v17, v18, v19, v20) --[[ Line: 24 ]] --[[ Name: loginRequest ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy)
    if l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v4.singleSignOnConnectWithCode(v16, v17, v18);
    else
        return v4.loginWithCode(v16, v17, v18, v19, v20);
    end;
end;
return function(v22, v23, v24, v25, v26, v27, v28) --[[ Line: 33 ]] --[[ Name: loginByCode ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy), v7 (copy), l_HttpService_0 (copy), v8 (copy), v13 (copy), v14 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), v11 (copy), v9 (copy), v10 (copy), v3 (copy)
    return function(v29) --[[ Line: 42 ]]
        -- upvalues: l_getAppFeaturePolicies_0 (ref), v22 (copy), v23 (copy), v24 (copy), v26 (copy), v28 (copy), v4 (ref), v7 (ref), l_HttpService_0 (ref), v8 (ref), v13 (ref), v14 (ref), l_AppPage_0 (ref), v25 (copy), l_NavigateDown_0 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v11 (ref), v9 (ref), v10 (ref), v3 (ref), v27 (copy)
        local v30 = l_getAppFeaturePolicies_0().getUseSingleSignOn();
        local l_v22_0 = v22;
        local l_v23_0 = v23;
        local l_v24_0 = v24;
        local l_v26_0 = v26;
        local l_v28_0 = v28;
        return (if l_getAppFeaturePolicies_0().getUseSingleSignOn() then v4.singleSignOnConnectWithCode(l_v22_0, l_v23_0, l_v24_0) else v4.loginWithCode(l_v22_0, l_v23_0, l_v24_0, l_v26_0, l_v28_0)):andThen(function(v36) --[[ Line: 45 ]]
            -- upvalues: v7 (ref)
            assert(v36, "no login attempt result");
            assert(#v36 == 1, "no result or more than one result");
            assert(v7.fromJsonData(v36[1]), "result invalid");
            return v7.fromJsonData(v36[1]);
        end, function(v37) --[[ Line: 51 ]]
            -- upvalues: l_HttpService_0 (ref), v8 (ref), v13 (ref), v14 (ref), l_AppPage_0 (ref), v25 (ref), v23 (ref), v29 (copy), l_NavigateDown_0 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v30 (copy), v11 (ref), v9 (ref), v10 (ref), v3 (ref), v27 (ref)
            local v38 = l_HttpService_0:JSONDecode(v37.Body);
            local v39 = v38 and v38.errors and v38.errors[1] and v38.errors[1].code;
            local v40 = nil;
            local v41 = nil;
            if v39 == v8.Captcha then
                local _ = v13(v38);
                local _ = nil;
                local v44, v45 = v14(v38);
                v44 = {
                    name = l_AppPage_0.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v25, 
                        captchaType = "login", 
                        cvalueType = "authToken", 
                        captchaId = v44, 
                        cvalue = v23, 
                        dxBlob = v45, 
                        backNavigationDisabledWhileLoading = true
                    }
                };
                v29:dispatch(l_NavigateDown_0(v44));
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v39 == v8.SecurityQuestions then
                v41 = "Authentication.Login.Response.SomethingWentWrong";
                if v38.errors[1].fieldData then
                    local v46 = l_HttpService_0:JSONDecode(v38.errors[1].fieldData);
                    if v46.sessionId and v46.userId then
                        v40 = v46;
                        v41 = nil;
                    end;
                end;
            end;
            if v30 then
                warn("Login ErrorCode:", v39);
                v41 = v11(v39);
                local v47 = if v41[1] then v41[1] else v41;
                v9.default:logRobloxTelemetryEvent(v10, nil, {
                    ssoErrorCode = v39, 
                    msgShown = v47
                });
            end;
            return v3.reject({
                errorKey = v41, 
                errorCode = v39, 
                securityQuestionsData = v40, 
                securityQuestionsCallback = v27
            });
        end);
    end;
end;