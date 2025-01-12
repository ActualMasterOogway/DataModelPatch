local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local v5 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v6 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
return function(v8, v9, v10) --[[ Line: 13 ]] --[[ Name: loginByPasskey ]]
    -- upvalues: v4 (copy), v5 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), v6 (copy), v3 (copy)
    return function(_) --[[ Line: 14 ]]
        -- upvalues: v4 (ref), v8 (copy), v9 (copy), v10 (copy), v5 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), v6 (ref), v3 (ref)
        return v4.logByPasskey(v8, v9, v10):andThen(function(v12) --[[ Line: 15 ]]
            -- upvalues: v5 (ref)
            assert(v12, "no login attempt result");
            assert(#v12 == 1, "no result or more than one result");
            local v13 = v5.fromJsonData(v12[1]);
            assert(v13, "result invalid");
            return v13;
        end, function(v14) --[[ Line: 21 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v6 (ref), v3 (ref)
            l_Logger_0:error("Error logging in by passkey. Error: {}", v14.Body);
            local l_code_0 = l_HttpService_0:JSONDecode(v14.Body).errors[1].code;
            local v16 = "Authentication.Login.Response.SomethingWentWrong";
            if l_code_0 == v6.IncorrectCValueOrPassword then
                v16 = "Authentication.Login.Response.InvalidPasskeyCredential";
            end;
            return v3.reject({
                errorCode = l_code_0, 
                errorKey = v16
            });
        end);
    end;
end;