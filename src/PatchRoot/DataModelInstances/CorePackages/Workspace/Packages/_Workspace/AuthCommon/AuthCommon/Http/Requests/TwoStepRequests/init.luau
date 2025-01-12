local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
return {
    configuration = function(v6, v7) --[[ Line: 20 ]]
        -- upvalues: l_Url_0 (copy)
        return v6(string.format("%sv1/users/%d/configuration", l_Url_0.TWOSTEPVERIFICATION_URL, v7), "GET");
    end, 
    resend = function(v8, v9, v10) --[[ Line: 26 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
        assert(type(v9) == "string", "invalid username has been passed into TwoStepRequests.resend");
        assert(type(v10) == "string", "invalid ticket has been passed into TwoStepRequests.resend");
        return v8(string.format("%sv1/twostepverification/resend", l_Url_0.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v9, 
                ticket = v10, 
                actionType = "Login"
            }), 
            maxRetryCount = 0
        });
    end, 
    verify = function(v11, v12, v13, v14, v15) --[[ Line: 40 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
        assert(type(v12) == "string", "invalid username has been passed into TwoStepRequests.verify");
        assert(type(v13) == "string", "invalid ticket has been passed into TwoStepRequests.verify");
        assert(type(v14) == "string", "invalid code has been passed into TwoStepRequests.verify");
        assert(type(v15) == "boolean", "invalid rememberDevice has been passed into TwoStepRequests.verify");
        return v11(string.format("%sv1/twostepverification/verify", l_Url_0.AUTH_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                username = v12, 
                ticket = v13, 
                code = v14, 
                rememberDevice = v15, 
                actionType = "Login"
            }), 
            maxRetryCount = 0
        });
    end, 
    login = function(v16, v17, v18, v19, v20) --[[ Line: 58 ]]
        -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v4 (copy)
        assert(type(v17) == "string", "invalid user ID has been passed into TwoStepRequests.login");
        assert(type(v18) == "string", "invalid challengeId has been passed into TwoStepRequests.login");
        assert(type(v19) == "string", "invalid verificationToken has been passed into TwoStepRequests.login");
        assert(type(v20) == "boolean", "invalid rememberDevice has been passed into TwoStepRequests.login");
        return v16(string.format("%sv3/users/%s/two-step-verification/login", l_Url_0.AUTH_URL, v17), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                challengeId = v18, 
                verificationToken = v19, 
                rememberDevice = v20, 
                accountBlob = l_FFlagEnableLuaAccountSwitch_0 and v4.getAccountBlob() or nil
            }), 
            maxRetryCount = 0
        });
    end
};