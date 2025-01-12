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
local function _() --[[ Line: 18 ]] --[[ Name: getStartPreauthRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/StartPreauthRegistration", l_Url_0.AUTH_URL);
end;
local function v17(v11, v12) --[[ Line: 22 ]] --[[ Name: startPreauthPasskeyRegistration ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy), v5 (copy), v9 (copy)
    local v13 = l_HttpService_0:JSONEncode({
        username = v12
    });
    return v11(string.format("%sv1/passkey/StartPreauthRegistration", l_Url_0.AUTH_URL), "POST", {
        postBody = v13
    }):andThen(function(v14) --[[ Line: 27 ]]
        -- upvalues: v5 (ref)
        return v5.resolve(v14[1]);
    end, function(v15) --[[ Line: 29 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref)
        local v16 = if type(v15) == "table" then l_HttpService_0:JSONEncode(v15) else nil;
        return v5.reject({
            body = v16, 
            name = v9.BACKEND_CREATION_ERROR_NAME
        });
    end);
end;
return function(v18, v19) --[[ Line: 36 ]] --[[ Name: attemptPreauthPasskeyRegistration ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy), v9 (copy), l_UserInputService_0 (copy), v4 (copy), l_default_0 (copy), v5 (copy), l_Logger_0 (copy)
    return v17(v18, v19):andThen(function(v20) --[[ Line: 37 ]]
        -- upvalues: l_HttpService_0 (ref), v9 (ref), l_UserInputService_0 (ref), v4 (ref), l_default_0 (ref), v5 (ref), l_Logger_0 (ref)
        local v21 = l_HttpService_0:JSONDecode(v20.creationOptions);
        local v22 = tonumber(v21.publicKey.timeout);
        v21.keyType = v9.PLATFORM;
        v21.deviceBoundOnly = true;
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            v21.publicKey.challenge = v4.FromUrlSafeBase64(v21.publicKey.challenge);
            v21.publicKey.user.id = v4.FromUrlSafeBase64(v21.publicKey.user.id);
        end;
        local v23 = l_HttpService_0:JSONEncode(v21);
        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, v23, v22 / v9.PASSKEY_TIMEOUT_DURATION):andThen(function(v24) --[[ Line: 56 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref), l_Logger_0 (ref), v20 (copy)
            local v25 = l_HttpService_0:JSONDecode(v24);
            if v25 == nil or next(v25) == nil then
                return v5.reject({
                    name = v9.USER_OS_DIALOG_ERROR_NAME
                });
            elseif v25.errorCode ~= nil then
                l_Logger_0:warning("Passkey credential signing failed. Error {} ({}) returned.", v25.errorCode, v25.errorMsg);
                return v5.reject({
                    body = v25.errorMsg, 
                    name = v9.USER_OS_DIALOG_ERROR_NAME
                });
            else
                return v5.resolve({
                    result = v24, 
                    sessionId = v20.sessionId
                });
            end;
        end, function(v26) --[[ Line: 70 ]]
            -- upvalues: v5 (ref), v9 (ref)
            return v5.reject({
                body = v26, 
                name = v9.USER_OS_DIALOG_ERROR_NAME
            });
        end);
    end, function(v27) --[[ Line: 73 ]]
        -- upvalues: v5 (ref), v9 (ref)
        if type(v27) == "table" and v27.name then
            return v5.reject(v27);
        else
            return v5.reject({
                body = v27, 
                name = v9.BACKEND_CREATION_ERROR_NAME
            });
        end;
    end);
end;