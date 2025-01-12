local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Requests.SignUpRequests);
local v6 = require(l_script_FirstAncestor_0.Enums.SignUpV2ErrorCodes);
local v7 = require(l_script_FirstAncestor_0.Enums.AppSignupCounterNames);
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v9 = require(l_Parent_0.AuthCommon);
local l_AuthMemStorageKeys_0 = v9.Enums.AuthMemStorageKeys;
local l_reportEphemeralCounter_0 = v9.Analytics.reportEphemeralCounter;
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v14 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSignupUnavailableInRegionError_0 = v14.FFlagEnableSignupUnavailableInRegionError;
local l_FFlagEnableCredentialsProtocolLoggingFix_0 = v14.FFlagEnableCredentialsProtocolLoggingFix;
local v17 = require(l_Parent_0.CredentialsProtocol);
local l_Constants_0 = v17.Constants;
local l_default_0 = v17.CredentialsProtocol.default;
local function _(v20, v21) --[[ Line: 31 ]] --[[ Name: signUpRequest ]]
    -- upvalues: v5 (copy)
    return v5.signUpV2(v20, v21, {});
end;
return function(v23, _, v25, _, _, v28, v29) --[[ Line: 36 ]]
    -- upvalues: v5 (copy), l_NotificationType_0 (copy), l_reportEphemeralCounter_0 (copy), v7 (copy), l_MemStorageService_0 (copy), l_AuthMemStorageKeys_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_FFlagEnableCredentialsProtocolLoggingFix_0 (copy), v4 (copy), v6 (copy), l_FFlagEnableSignupUnavailableInRegionError_0 (copy), l_StatusCodes_0 (copy)
    return v5.signUpV2(v23, v28, {}):andThen(function(v30) --[[ Line: 45 ]]
        -- upvalues: v25 (copy), l_NotificationType_0 (ref), l_reportEphemeralCounter_0 (ref), v7 (ref), v28 (copy), l_MemStorageService_0 (ref), l_AuthMemStorageKeys_0 (ref), l_HttpService_0 (ref), v29 (copy), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), v4 (ref)
        v25:BroadcastNotification("", l_NotificationType_0.DID_SIGN_UP);
        l_reportEphemeralCounter_0(v7.Success, 1);
        if v28.username and v28.password and string.len(v28.password) > 0 then
            l_MemStorageService_0:Fire(l_AuthMemStorageKeys_0.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                cvalue = v28.username, 
                password = v28.password, 
                authType = "signup"
            }));
        end;
        if v29 and v28.password and #v28.password > 0 then
            local v31 = {
                username = v28.username, 
                password = v28.password
            };
            local v32 = l_HttpService_0:JSONEncode(v31);
            l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v32, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v33) --[[ Line: 77 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref)
                local v34 = if v33 then l_HttpService_0:JSONDecode(v33) else {};
                if v34 and v34.errorCode == nil then
                    l_Logger_0:info("Successfully registered password.");
                    return;
                elseif l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                    l_Logger_0:warning("Error registering password: " .. tostring(v34.errorMsg));
                    return;
                else
                    l_Logger_0:warning("Error registering password: ", v34.errorMsg);
                    return;
                end;
            end, function(v35) --[[ Line: 89 ]]
                -- upvalues: l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_Logger_0 (ref)
                if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                    l_Logger_0:warning("Error registering password: " .. tostring(v35));
                    return;
                else
                    l_Logger_0:warning("Error registering password: ", v35);
                    return;
                end;
            end):await();
        end;
        return v4.resolve(v30);
    end, function(v36) --[[ Line: 100 ]]
        -- upvalues: l_HttpService_0 (ref), l_reportEphemeralCounter_0 (ref), v7 (ref), v6 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_StatusCodes_0 (ref), v4 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 101 ]]
            -- upvalues: l_HttpService_0 (ref), v36 (copy)
            return l_HttpService_0:JSONDecode(v36.Body);
        end);
        if l_status_0 then
            local v39 = l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code;
            l_reportEphemeralCounter_0(v7.Failure, 1);
            if v39 == v6.Captcha then
                l_reportEphemeralCounter_0(v7.FailureCaptcha, 1);
            elseif v39 == v6.TooManyAttempts then
                l_reportEphemeralCounter_0(v7.FailureThrottled, 1);
            elseif v39 == v6.InvalidBirthdate then
                l_reportEphemeralCounter_0(v7.FailureBirthdayInvalid, 1);
            elseif v39 == v6.InvalidUsername then
                l_reportEphemeralCounter_0(v7.FailureUsernameInvalid, 1);
            elseif v39 == v6.UsernameAlreadyTaken then
                l_reportEphemeralCounter_0(v7.FailureUsernameTaken, 1);
            elseif v39 == v6.InvalidPassword then
                l_reportEphemeralCounter_0(v7.FailurePasswordInvalid, 1);
            elseif v39 == v6.UsernameAndPasswordTheSame then
                l_reportEphemeralCounter_0(v7.FailurePasswordMatchesUsername, 1);
            elseif l_FFlagEnableSignupUnavailableInRegionError_0 and v39 == v6.UnavailableInRegion then
                l_reportEphemeralCounter_0(v7.FailureUnavailableInRegion, 1);
            elseif v39 == v6.PasswordTooSimple then
                l_reportEphemeralCounter_0(v7.FailurePasswordTooSimple, 1);
            elseif v36.HttpError == Enum.HttpError.OK and v36.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                l_reportEphemeralCounter_0(v7.FailureThrottled, 1);
            elseif v36.HttpError == Enum.HttpError.OK and v36.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                l_reportEphemeralCounter_0(v7.FailureInternalServerError, 1);
            elseif v36.HttpError == Enum.HttpError.OK and v36.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                l_reportEphemeralCounter_0(v7.FailureBadRequest, 1);
            elseif v36.HttpError == Enum.HttpError.OK and v36.StatusCode == l_StatusCodes_0.NOT_FOUND then
                l_reportEphemeralCounter_0(v7.FailureNotFound, 1);
            else
                l_reportEphemeralCounter_0(v7.FailureUnknownError, 1);
            end;
            return v4.reject(v39);
        else
            return v4.reject();
        end;
    end);
end;