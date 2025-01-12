return {
    AreaTest = require(script.AreaTest), 
    AuthActionTextUtil = require(script.AuthActionTextUtil), 
    isStringPhone = require(script.isStringPhone), 
    isStringEmail = require(script.isStringEmail), 
    getSingleSignOnUrls = require(script.getSingleSignOnUrls), 
    AppStorageUtilities = require(script.AppStorageUtilities), 
    Base64 = require(script.Base64), 
    GetDxBlob = require(script.GetDxBlob), 
    GetCaptchaDataJson = require(script.GetCaptchaDataJson), 
    GetMultipleUsersPerCredentialErrorData = require(script.GetMultipleUsersPerCredentialErrorData), 
    GetLoginByUsernameErrorMessage = require(script.GetLoginByUsernameErrorMessage), 
    LoginByUsernameSSOErrorsTelemetry = require(script.LoginByUsernameSSOErrorsTelemetry)
};