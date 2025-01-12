return {
    GetAuthMetaData = require(script.GetAuthMetaData), 
    GetCountryCodes = require(script.GetCountryCodes), 
    GetUserAppLaunchInfo = require(script.GetUserAppLaunchInfo), 
    LoginRequests = require(script.LoginRequests), 
    PostGetUserByUsername = require(script.PostGetUserByUsername), 
    PostPasswordValid = require(script.PostPasswordValid), 
    LogoutAllLoggedInUsersRequest = require(script.LogoutAllLoggedInUsersRequest), 
    LogoutFromAllSessionsAndReauthenticateRequest = require(script.LogoutFromAllSessionsAndReauthenticateRequest), 
    PostUsernameValid = require(script.PostUsernameValid), 
    TwoStepRequests = require(script.TwoStepRequests)
};