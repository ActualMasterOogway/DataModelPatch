local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local v5 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v6 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v7 = require(l_script_FirstAncestor_0.Utils.GetMultipleUsersPerCredentialErrorData);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagEnableLoginAccountSelector_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableLoginAccountSelector;
return function(v10, v11, v12, v13, v14, v15) --[[ Line: 16 ]] --[[ Name: loginByOtp ]]
    -- upvalues: v4 (copy), v5 (copy), l_HttpService_0 (copy), v6 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), v7 (copy), v3 (copy)
    return function() --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v10 (copy), v11 (copy), v12 (copy), v14 (copy), v15 (copy), v5 (ref), l_HttpService_0 (ref), v6 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v7 (ref), v3 (ref), v13 (copy)
        return v4.logByOtp(v10, v11, v12, v14, v15):andThen(function(v16) --[[ Line: 26 ]]
            -- upvalues: v5 (ref)
            assert(v16, "no login attempt result");
            assert(#v16 == 1, "no result or more than one result");
            assert(v5.fromJsonData(v16[1]), "result invalid");
            return v5.fromJsonData(v16[1]);
        end, function(v17) --[[ Line: 31 ]]
            -- upvalues: l_HttpService_0 (ref), v6 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v7 (ref), v3 (ref), v13 (ref)
            local v18 = l_HttpService_0:JSONDecode(v17.Body);
            local v19 = nil;
            local l_code_0 = v18.errors[1].code;
            local v21 = nil;
            if l_code_0 == v6.IncorrectCValueOrPassword then
                v19 = "Authentication.Login.Response.IncorrectOtpCode";
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and l_code_0 == v6.SecurityQuestions then
                v19 = "Authentication.Login.Response.SomethingWentWrong";
                if v18.errors[1].fieldData then
                    local v22 = l_HttpService_0:JSONDecode(v18.errors[1].fieldData);
                    if v22.sessionId and v22.userId then
                        v21 = v22;
                        v19 = nil;
                    end;
                end;
            elseif l_GetFFlagEnableLoginAccountSelector_0() and l_code_0 == v6.MultipleUsersPerCredential then
                local v23 = v7(v18);
                return v3.reject({
                    errorKey = v19, 
                    errorCode = l_code_0, 
                    usersData = v23
                });
            elseif l_code_0 == v6.ServiceUnavailable then
                v19 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 ~= v6.AccountLocked then
                v19 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod";
            end;
            return v3.reject({
                errorKey = v19, 
                errorCode = l_code_0, 
                securityQuestionsData = v21, 
                securityQuestionsCallback = v13
            });
        end);
    end;
end;