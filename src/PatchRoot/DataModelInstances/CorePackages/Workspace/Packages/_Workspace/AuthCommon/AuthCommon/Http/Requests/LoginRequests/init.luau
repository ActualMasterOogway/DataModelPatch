local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_script_FirstAncestor_0.Utils.getSingleSignOnUrls);
local l_ConsoleAuthRequestWrapper_0 = require(l_Parent_0.Http).Utils.ConsoleAuthRequestWrapper;
local l_HttpService_0 = game:GetService("HttpService");
local v7 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagEnableLoginAccountSelector_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableLoginAccountSelector;
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
local v12 = {};
getLoginUrl = function() --[[ Line: 28 ]] --[[ Name: getLoginUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv2/login", l_Url_0.AUTH_URL);
end;
v12.logByPasskey = function(v13, v14, v15) --[[ Line: 32 ]]
    -- upvalues: l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v7 (copy)
    local v16 = l_HttpService_0:JSONEncode({
        ctype = "Passkey", 
        cvalue = l_HttpService_0:JSONEncode(v14), 
        password = v15, 
        accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v7.getAccountBlob() or nil
    });
    return v13(getLoginUrl(), "POST", {
        postBody = v16, 
        maxRetryCount = 0
    });
end;
v12.logByUsername = function(v17, v18, v19, v20, v21) --[[ Line: 42 ]]
    -- upvalues: l_HttpService_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v7 (copy)
    local v22 = l_HttpService_0:JSONEncode({
        ctype = "Username", 
        cvalue = v18, 
        password = v19, 
        captchaToken = v20 and v20.captchaToken or nil, 
        captchaProvider = v20 and v20.captchaProvider or nil, 
        captchaId = v20 and v20.captchaId or nil, 
        securityQuestionSessionId = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v21 and v21.sessionId or nil, 
        securityQuestionRedemptionToken = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v21 and v21.redemptionToken or nil, 
        accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v7.getAccountBlob() or nil
    });
    return v17(getLoginUrl(), "POST", {
        postBody = v22, 
        maxRetryCount = 0
    });
end;
v12.logByEmail = function(v23, v24, v25, v26, v27, v28) --[[ Line: 63 ]]
    -- upvalues: l_HttpService_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v7 (copy)
    local v29 = l_HttpService_0:JSONEncode({
        ctype = "Email", 
        cvalue = v24, 
        password = v25, 
        captchaToken = v26 and v26.captchaToken or nil, 
        captchaProvider = v26 and v26.captchaProvider or nil, 
        captchaId = v26 and v26.captchaId or nil, 
        securityQuestionSessionId = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v27 and v27.sessionId or nil, 
        securityQuestionRedemptionToken = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v27 and v27.redemptionToken or nil, 
        userId = l_GetFFlagEnableLoginAccountSelector_0() and v28 or nil, 
        accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v7.getAccountBlob() or nil
    });
    return v23(getLoginUrl(), "POST", {
        postBody = v29, 
        maxRetryCount = 0
    });
end;
v12.logByPhone = function(v30, v31, v32, v33, v34, v35) --[[ Line: 85 ]]
    -- upvalues: l_HttpService_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v7 (copy)
    local v36 = l_HttpService_0:JSONEncode({
        ctype = "PhoneNumber", 
        cvalue = v31, 
        password = v32, 
        captchaToken = v33 and v33.captchaToken or nil, 
        captchaProvider = v33 and v33.captchaProvider or nil, 
        captchaId = v33 and v33.captchaId or nil, 
        securityQuestionSessionId = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v34 and v34.sessionId or nil, 
        securityQuestionRedemptionToken = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v34 and v34.redemptionToken or nil, 
        userId = l_GetFFlagEnableLoginAccountSelector_0() and v35 or nil, 
        accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v7.getAccountBlob() or nil
    });
    return v30(getLoginUrl(), "POST", {
        postBody = v36, 
        maxRetryCount = 0
    });
end;
v12.loginWithCode = function(v37, v38, v39, v40, v41) --[[ Line: 107 ]]
    -- upvalues: l_HttpService_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v7 (copy)
    local v42 = l_HttpService_0:JSONEncode({
        ctype = "AuthToken", 
        cvalue = v38, 
        password = v39, 
        captchaToken = v40 and v40.captchaToken or nil, 
        captchaProvider = v40 and v40.captchaProvider or nil, 
        captchaId = v40 and v40.captchaId or nil, 
        securityQuestionSessionId = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v41 and v41.sessionId or nil, 
        securityQuestionRedemptionToken = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v41 and v41.redemptionToken or nil, 
        accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v7.getAccountBlob() or nil
    });
    return v37(getLoginUrl(), "POST", {
        postBody = v42, 
        maxRetryCount = 0
    });
end;
v12.logByOtp = function(v43, v44, v45, v46, v47) --[[ Line: 128 ]]
    -- upvalues: l_HttpService_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v7 (copy)
    local v48 = l_HttpService_0:JSONEncode({
        ctype = "EmailOtpSessionToken", 
        cvalue = v44, 
        password = v45, 
        securityQuestionSessionId = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v46 and v46.sessionId or nil, 
        securityQuestionRedemptionToken = l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v46 and v46.redemptionToken or nil, 
        userId = l_GetFFlagEnableLoginAccountSelector_0() and v47 or nil, 
        accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v7.getAccountBlob() or nil
    });
    return v43(getLoginUrl(), "POST", {
        postBody = v48, 
        maxRetryCount = 0
    });
end;
v12.singleSignOnLogin = function(v49) --[[ Line: 147 ]]
    -- upvalues: v4 (copy), l_ConsoleAuthRequestWrapper_0 (copy), v2 (copy), v8 (copy)
    local l_login_0 = v4().login;
    if l_login_0 then
        local v51 = l_login_0();
        return l_ConsoleAuthRequestWrapper_0(v49, v51, "POST", {
            postBody = "{}", 
            maxRetryCount = 0
        });
    else
        return v2.reject({
            errorCode = v8.ServiceUnavailable
        });
    end;
end;
v12.singleSignOnConnectWithCode = function(v52, v53, v54) --[[ Line: 160 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_ConsoleAuthRequestWrapper_0 (copy), v2 (copy), v8 (copy)
    local l_connect_0 = v4().connect;
    local v56 = l_HttpService_0:JSONEncode({
        ctype = "AuthToken", 
        cvalue = v53, 
        password = v54
    });
    if l_connect_0 then
        local v57 = l_connect_0();
        return l_ConsoleAuthRequestWrapper_0(v52, v57, "POST", {
            postBody = v56, 
            maxRetryCount = 0
        });
    else
        return v2.reject({
            errorCode = v8.ServiceUnavailable
        });
    end;
end;
v12.singleSignOnConnectWithCredential = function(v58, v59, v60, v61) --[[ Line: 183 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_ConsoleAuthRequestWrapper_0 (copy), v2 (copy), v8 (copy)
    local l_connect_1 = v4().connect;
    local v63 = l_HttpService_0:JSONEncode({
        ctype = v61, 
        cvalue = v59, 
        password = v60
    });
    if l_connect_1 then
        local v64 = l_connect_1();
        return l_ConsoleAuthRequestWrapper_0(v58, v64, "POST", {
            postBody = v63, 
            maxRetryCount = 0
        });
    else
        return v2.reject({
            errorCode = v8.ServiceUnavailable
        });
    end;
end;
return v12;