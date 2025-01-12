local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.Utils.Base64);
local v5 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_default_0 = require(l_Parent_0.CredentialsProtocol).CredentialsProtocol.default;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v9 = require(l_script_FirstAncestor_0.Common.PasskeyConstants);
local function _() --[[ Line: 16 ]] --[[ Name: getFinishRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/FinishRegistration", l_Url_0.AUTH_URL);
end;
local function v16(v11, v12) --[[ Line: 20 ]] --[[ Name: finishPasskeyRegistration ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), l_HttpService_0 (copy), v9 (copy)
    return v11(string.format("%sv1/passkey/FinishRegistration", l_Url_0.AUTH_URL), "POST", {
        postBody = v12
    }):andThen(function(v13) --[[ Line: 21 ]]
        -- upvalues: v5 (ref)
        return v5.resolve(v13);
    end, function(v14) --[[ Line: 23 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref)
        local v15 = if type(v14) == "table" then l_HttpService_0:JSONEncode(v14) else nil;
        return v5.reject({
            body = v15, 
            name = v9.BACKEND_CREATION_ERROR_NAME
        });
    end);
end;
local function _() --[[ Line: 30 ]] --[[ Name: getStartRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/StartRegistration", l_Url_0.AUTH_URL);
end;
local function v22(v18) --[[ Line: 34 ]] --[[ Name: startPasskeyRegistration ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), l_HttpService_0 (copy), v9 (copy)
    return v18(string.format("%sv1/passkey/StartRegistration", l_Url_0.AUTH_URL), "POST"):andThen(function(v19) --[[ Line: 35 ]]
        -- upvalues: v5 (ref)
        return v5.resolve(v19[1]);
    end, function(v20) --[[ Line: 37 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref)
        local v21 = if type(v20) == "table" then l_HttpService_0:JSONEncode(v20) else nil;
        return v5.reject({
            body = v21, 
            name = v9.BACKEND_CREATION_ERROR_NAME
        });
    end);
end;
return function(v23) --[[ Line: 44 ]] --[[ Name: attemptPasskeyRegistration ]]
    -- upvalues: v22 (copy), l_HttpService_0 (copy), l_UserInputService_0 (copy), v4 (copy), l_default_0 (copy), v5 (copy), v9 (copy), l_Logger_0 (copy), v16 (copy)
    return v22(v23):andThen(function(v24) --[[ Line: 45 ]]
        -- upvalues: l_HttpService_0 (ref), l_UserInputService_0 (ref), v4 (ref), l_default_0 (ref), v5 (ref), v9 (ref), l_Logger_0 (ref), v16 (ref), v23 (copy)
        local v25 = l_HttpService_0:JSONDecode(v24.creationOptions);
        local l_sessionId_0 = v24.sessionId;
        local v27 = tonumber(v25.publicKey.timeout);
        v25.keyType = "platform";
        v25.deviceBoundOnly = true;
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            v25.publicKey.challenge = v4.FromUrlSafeBase64(v25.publicKey.challenge);
            v25.publicKey.user.id = v4.FromUrlSafeBase64(v25.publicKey.user.id);
        end;
        local v28 = l_HttpService_0:JSONEncode(v25);
        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, v28, v27 / 1000):andThen(function(v29) --[[ Line: 63 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref), l_Logger_0 (ref), v4 (ref), l_sessionId_0 (copy), v16 (ref), v23 (ref)
            local v30 = l_HttpService_0:JSONDecode(v29);
            if v30 == nil or next(v30) == nil then
                return v5.reject({
                    name = v9.USER_OS_DIALOG_ERROR_NAME
                });
            elseif v30.errorCode ~= nil then
                l_Logger_0:warning("Passkey credential signing failed. Error {} ({}) returned.", v30.errorCode, v30.errorMsg);
                return v5.reject({
                    body = v30.errorMsg, 
                    name = v9.USER_OS_DIALOG_ERROR_NAME
                });
            else
                v30.id = v4.ToUrlSafeBase64(v30.id);
                v30.rawId = v4.ToUrlSafeBase64(v30.rawId);
                v30.response.attestationObject = v4.ToUrlSafeBase64(v30.response.attestationObject);
                v30.response.clientDataJSON = v4.ToUrlSafeBase64(v30.response.clientDataJSON);
                local v31 = l_HttpService_0:JSONEncode(v30);
                local v32 = {
                    sessionId = l_sessionId_0, 
                    credentialNickname = "Passkey", 
                    attestationResponse = v31
                };
                local v33 = l_HttpService_0:JSONEncode(v32);
                return v16(v23, v33);
            end;
        end, function(v34) --[[ Line: 90 ]]
            -- upvalues: v5 (ref), v9 (ref)
            return v5.reject({
                body = v34, 
                name = v9.USER_OS_DIALOG_ERROR_NAME
            });
        end);
    end, function(v35) --[[ Line: 93 ]]
        -- upvalues: v5 (ref), v9 (ref)
        if type(v35) == "table" and v35.name then
            return v5.reject(v35);
        else
            return v5.reject({
                body = v35, 
                name = v9.BACKEND_CREATION_ERROR_NAME
            });
        end;
    end);
end;