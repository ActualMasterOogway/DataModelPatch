local v0 = game:DefineFastInt("UnavailableInRegionErrorCode", 26);
return {
    TokenValidationFailed = 0, 
    Captcha = 2, 
    TooManyAttempts = 3, 
    InvalidBirthdate = 4, 
    InvalidUsername = 5, 
    UsernameAlreadyTaken = 6, 
    InvalidPassword = 7, 
    UsernameAndPasswordTheSame = 8, 
    PasswordTooSimple = 9, 
    InvalidEmail = 10, 
    InvalidAsset = 11, 
    EmptyAccountSwitchBlobRequired = 21, 
    ParentEmptyAccountSwitchBlobRequired = 23, 
    VNGAgeUnder12 = 24, 
    UnavailableInRegion = v0
};