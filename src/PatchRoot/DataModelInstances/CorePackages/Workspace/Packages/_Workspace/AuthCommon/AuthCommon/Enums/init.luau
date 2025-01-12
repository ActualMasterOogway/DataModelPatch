local v0 = require(script.InputValidity);
return {
    AuthLocalStorageKeys = require(script.AuthLocalStorageKeys), 
    AppLoginCounterNames = require(script.AppLoginCounterNames), 
    AuthMemStorageKeys = require(script.AuthMemStorageKeys), 
    LoginErrorCodes = require(script.LoginErrorCodes), 
    LoginErrorCodeSSO = require(script.LoginErrorCodeSSO), 
    InputValidity = v0, 
    IssueCondition = require(script.IssueCondition), 
    PasswordIssue = require(script.PasswordIssue), 
    SignupActionRequired = require(script.SignupActionRequired), 
    ScrollingPickerDirection = require(script.ScrollingPickerDirection), 
    UsernameIssue = require(script.UsernameIssue), 
    UserGender = require(script.UserGender), 
    UsernameValidationContext = require(script.UsernameValidationContext), 
    TransitionAnimation = require(script.TransitionAnimation)
};