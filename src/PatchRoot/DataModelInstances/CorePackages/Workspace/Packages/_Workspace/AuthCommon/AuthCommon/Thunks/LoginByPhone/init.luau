local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v9 = require(l_script_FirstAncestor_0.Utils.GetMultipleUsersPerCredentialErrorData);
local v10 = require(l_script_FirstAncestor_0.Utils.GetDxBlob);
local v11 = require(l_script_FirstAncestor_0.Utils.GetCaptchaDataJson);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagEnableLoginAccountSelector_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableLoginAccountSelector;
return function(v14, v15, v16, v17, v18, v19, v20, v21) --[[ Line: 21 ]] --[[ Name: loginByPhone ]]
    -- upvalues: v4 (copy), v7 (copy), l_HttpService_0 (copy), v8 (copy), v10 (copy), v11 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), v9 (copy), v3 (copy)
    return function(v22) --[[ Line: 31 ]]
        -- upvalues: v4 (ref), v14 (copy), v15 (copy), v16 (copy), v18 (copy), v20 (copy), v21 (copy), v7 (ref), l_HttpService_0 (ref), v8 (ref), v10 (ref), v11 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v17 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v9 (ref), v3 (ref), v19 (copy)
        return v4.logByPhone(v14, v15, v16, v18, v20, v21):andThen(function(v23) --[[ Line: 40 ]]
            -- upvalues: v7 (ref)
            assert(v23, "no login attempt result");
            assert(#v23 == 1, "no result or more than one result");
            assert(v7.fromJsonData(v23[1]), "result invalid");
            return v7.fromJsonData(v23[1]);
        end, function(v24) --[[ Line: 45 ]]
            -- upvalues: l_HttpService_0 (ref), v8 (ref), v10 (ref), v11 (ref), v22 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v17 (ref), v15 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v9 (ref), v3 (ref), v19 (ref)
            local v25 = l_HttpService_0:JSONDecode(v24.Body);
            local v26 = nil;
            local l_code_0 = v25.errors[1].code;
            local v28 = nil;
            if l_code_0 == v8.IncorrectCValueOrPassword then
                v26 = "Authentication.Login.Response.IncorrectPhoneOrPassword";
            elseif l_code_0 == v8.Captcha then
                local _ = v10(v25);
                local _ = nil;
                local v31, v32 = v11(v25);
                v22:dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v17, 
                        captchaType = "login", 
                        captchaId = v31, 
                        cvalueType = "phonenumber", 
                        cvalue = v15, 
                        dxBlob = v32, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and l_code_0 == v8.SecurityQuestions then
                v26 = "Authentication.Login.Response.SomethingWentWrong";
                if v25.errors[1].fieldData then
                    local v33 = l_HttpService_0:JSONDecode(v25.errors[1].fieldData);
                    if v33.sessionId and v33.userId then
                        v28 = v33;
                        v26 = nil;
                    end;
                end;
            elseif l_GetFFlagEnableLoginAccountSelector_0() and l_code_0 == v8.MultipleUsersPerCredential then
                local v34 = v9(v25);
                return v3.reject({
                    errorKey = v26, 
                    errorCode = l_code_0, 
                    usersData = v34
                });
            elseif l_code_0 == v8.ServiceUnavailable then
                v26 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 ~= v8.AccountLocked then
                v26 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod";
            end;
            return v3.reject({
                errorKey = v26, 
                errorCode = l_code_0, 
                securityQuestionsData = v28, 
                securityQuestionsCallback = v19
            });
        end);
    end;
end;