local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.Http);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v6 = require(l_Parent_0.AuthCommon);
local l_getSingleSignOnUrls_0 = v6.Utils.getSingleSignOnUrls;
local l_AppStorageUtilities_0 = v6.Utils.AppStorageUtilities;
local l_ConsoleAuthRequestWrapper_0 = require(l_Parent_0.Http).Utils.ConsoleAuthRequestWrapper;
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableLuaAccountSwitch_0 = v10.FFlagEnableLuaAccountSwitch;
local l_FFlagSignupAddDisplayNameFieldToRequest_0 = v10.FFlagSignupAddDisplayNameFieldToRequest;
local l_FFlagEnableKoreaKISACompliance_0 = v10.FFlagEnableKoreaKISACompliance;
local v14 = require(l_script_FirstAncestor_0.Enums.SignUpV2ErrorCodes);
local v15 = require(l_Parent_0.t);
local v22 = {
    signUp = function(v16, v17, v18, v19, v20, v21) --[[ Line: 39 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_AppStorageUtilities_0 (copy)
        assert(type(v17) == "string", "invalid username has been passed into SignUpRequests.signUp");
        assert(type(v18) == "string", "invalid password has been passed into SignUpRequests.signUp");
        assert(type(v19) == "string", "invalid birthdate has been passed into SignUpRequests.signUp");
        assert(tonumber(v20) and type(v20) == "string", "invalid bundleId has been passed into SignUpRequests.signUp");
        return v16(string.format("%sv3/signup", l_Url_0.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v17, 
                password = v18, 
                birthdate = v19, 
                bundleId = v20, 
                captchaId = v21 and v21.captchaId or nil, 
                captchaToken = v21 and v21.captchaToken or nil, 
                captchaProvider = v21 and v21.captchaProvider or nil, 
                accountBlob = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or nil
            }), 
            maxRetryCount = 0
        });
    end
};
local v23 = v15.interface({
    username = v15.string, 
    password = v15.string, 
    gender = v15.string, 
    birthday = v15.string, 
    displayName = if l_FFlagSignupAddDisplayNameFieldToRequest_0 then v15.optional(v15.string) else nil, 
    locale = v15.optional(v15.string), 
    email = v15.optional(v15.string)
});
v22.signUpV2 = function(v24, v25, v26) --[[ Line: 113 ]]
    -- upvalues: v23 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableKoreaKISACompliance_0 (copy), l_FFlagSignupAddDisplayNameFieldToRequest_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_AppStorageUtilities_0 (copy)
    assert(v23(v25));
    local v27 = v26 and v26.captchaId or nil;
    local v28 = v26 and v26.captchaToken or nil;
    local v29 = v26 and v26.captchaProvider or nil;
    return v24(string.format("%sv2/signup", l_Url_0.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v25.username, 
            password = v25.password, 
            gender = v25.gender, 
            birthday = v25.birthday, 
            locale = v25.locale, 
            email = v25.email, 
            otpSession = if l_FFlagEnableKoreaKISACompliance_0 then v25.otpSession else nil, 
            agreementIds = v25.agreementIds, 
            displayName = if l_FFlagSignupAddDisplayNameFieldToRequest_0 then v25.displayName else nil, 
            isTosAgreementBoxChecked = true, 
            captchaId = v27, 
            captchaToken = v28, 
            captchaProvider = v29, 
            accountBlob = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
local v30 = v15.interface({
    username = v15.string, 
    password = v15.string, 
    gender = v15.string, 
    birthday = v15.string, 
    verifiedSignupVoucher = v15.string
});
v22.verifiedSignup = function(v31, v32, v33) --[[ Line: 150 ]]
    -- upvalues: v30 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_AppStorageUtilities_0 (copy)
    assert(v30(v32));
    local v34 = v33 and v33.captchaId or nil;
    local v35 = v33 and v33.captchaToken or nil;
    local v36 = v33 and v33.captchaProvider or nil;
    return v31(string.format("%sv1/verified-signup", l_Url_0.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            username = v32.username, 
            password = v32.password, 
            gender = v32.gender, 
            birthday = v32.birthday, 
            voucher = v32.verifiedSignupVoucher, 
            agreementIds = v32.agreementIds, 
            isTosAgreementBoxChecked = true, 
            captchaId = v34, 
            captchaToken = v35, 
            captchaProvider = v36, 
            accountBlob = l_FFlagEnableLuaAccountSwitch_0 and l_AppStorageUtilities_0.getAccountBlob() or nil
        }), 
        maxRetryCount = 0
    });
end;
v22.singleSignOnSignup = function(v37, v38) --[[ Line: 175 ]]
    -- upvalues: l_getSingleSignOnUrls_0 (copy), l_HttpService_0 (copy), l_ConsoleAuthRequestWrapper_0 (copy), v3 (copy), v14 (copy)
    local l_signup_0 = l_getSingleSignOnUrls_0().signup;
    local v40 = l_HttpService_0:JSONEncode({
        username = v38.username, 
        password = v38.password, 
        gender = v38.gender, 
        birthday = v38.birthday, 
        locale = v38.locale, 
        email = v38.email, 
        agreementIds = v38.agreementIds, 
        isTosAgreementBoxChecked = true
    });
    if l_signup_0 then
        local v41 = l_signup_0();
        return l_ConsoleAuthRequestWrapper_0(v37, v41, "POST", {
            postBody = v40, 
            maxRetryCount = 0
        });
    else
        return v3.reject(v14.TokenValidationFailed);
    end;
end;
return v22;