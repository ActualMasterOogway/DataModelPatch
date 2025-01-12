local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v3 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v4 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodeSSO);
local v5 = l_getAppFeaturePolicies_0().getPlatformAccountName();
local v6 = {
    [v4.AuthError] = "Authentication.Login.Response.SomethingWentWrong", 
    [v4.ExternalIdentityAlreadyConnected] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v5
    }, 
    [v4.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword", 
    [v4.FloodedPS] = "Authentication.TwoStepVerification.Response.TooManyAttempts", 
    [v4.Require2FA] = "Authentication.Login.Response.Require2FAGeneric", 
    [v4.RelinkingCooldown] = {
        "Authentication.Login.Response.RelinkingFreeze"; 
        platform = v5
    }, 
    [v3.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword", 
    [v4.FloodedXbox] = "Authentication.TwoStepVerification.Response.TooManyAttempts", 
    [v4.RobloxAccountAlreadyConnectedXbox] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v5
    }, 
    [v4.ExternalIdentityAlreadyConnectedXbox] = {
        "Authentication.Login.Response.AlreadyLinked"; 
        platform = v5
    }
};
return function(v7) --[[ Line: 38 ]] --[[ Name: GetLoginByUsernameErrorMessage ]]
    -- upvalues: v6 (copy)
    if v6[v7] then
        return v6[v7];
    else
        return "Authentication.Login.Response.SomethingWentWrong";
    end;
end;