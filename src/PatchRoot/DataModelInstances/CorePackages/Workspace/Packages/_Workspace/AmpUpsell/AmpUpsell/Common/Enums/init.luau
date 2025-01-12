local v0 = {
    Phone = "Phone", 
    GovernmentId = "GovernmentId", 
    Email = "Email", 
    AddedEmail = "AddedEmail", 
    ParentConsent = "ParentConsent", 
    ParentLink = "ParentLink"
};
local v1 = {
    Granted = "Granted", 
    Denied = "Denied", 
    Actionable = "Actionable", 
    Pending = "Pending", 
    Error = "Error"
};
local v2 = {
    Success = "Success", 
    Failure = "Failure", 
    Cancelled = "Cancelled", 
    Unknown = "Unknown", 
    RetryRequested = "RetryRequested"
};
local v3 = {
    ChargebackReenableAccount = "ChargebackReenableAccount", 
    SavePaymentMethods = "SavePaymentMethods", 
    UpdateUserSetting = "UpdateUserSetting", 
    UpdateBirthdate = "UpdateBirthdate", 
    LinkToChild = "LinkToChild", 
    Unknown = "Unknown"
};
local v4 = {
    Unknown = 0, 
    Success = 1, 
    Failure = 2, 
    RequiresManualReview = 3, 
    RequiresRetry = 4, 
    Started = 5, 
    Submitted = 6, 
    Stored = 7, 
    Expired = 8
};
local v5 = {
    None = 0, 
    UnknownError = 1, 
    InvalidDocument = 2, 
    InvalidSelfie = 3, 
    BelowMinimumAge = 4, 
    LowQualityMedia = 5
};
local v6 = {
    ConnectedMobile = 1, 
    Verified = 2, 
    GotResults = 3, 
    UpdatedRobloxProfile = 4
};
local v7 = {
    Error = 1, 
    RequestSent = 2, 
    AlreadyLinkedSendRequest = 3, 
    NewParentCollectEmail = 4, 
    NewParentSendRequest = 5
};
local v8 = {
    InternalVPCError = "InternalVPCError", 
    InvalidEmail = "InvalidEmail", 
    Flooded = "Flooded", 
    ReceiverFlooded = "ReceiverFlooded", 
    SenderFlooded = "SenderFlooded", 
    BadUserInput = "BadUserInput", 
    UserStateRecoursePathMismatch = "UserStateRecoursePathMismatch", 
    SenderFloodedRequestCreated = "SenderFloodedRequestCreated", 
    GenericError = "GenericError", 
    ConflictingPendingConsent = "ConflictingPendingConsent"
};
local v9 = {
    RetryVPC = "RetryVPC", 
    RetryAMP = "RetryAMP", 
    NoRetry = "NoRetry", 
    Success = "Success"
};
local v10 = {
    InvalidEmailAddress = "InvalidEmailAddress", 
    EmailNotUnique = "EmailNotUnique", 
    LinkingIneligible = "LinkingIneligible", 
    ParentAtLinkLimit = "ParentAtLinkLimit", 
    SenderFlooded = "SenderFlooded", 
    ReceiverFlooded = "ReceiverFlooded", 
    InvalidParameter = "InvalidParameter", 
    UpdateUserSettingRequestInvalid = "UpdateUserSettingRequestInvalid", 
    AlreadyLinked = "AlreadyLinked", 
    ChildAtLinkLimit = "ChildAtLinkLimit", 
    NoLinkedParents = "NoLinkedParents", 
    SenderFloodedRequestCreated = "SenderFloodedRequestCreated", 
    Unknown = "Unknown", 
    ServiceUnavailable = "ServiceUnavailable", 
    IllegalState = "IllegalState", 
    InvalidUserID = "InvalidUserID", 
    ConsentAlreadyApplied = "ConsentAlreadyApplied", 
    ConsentAlreadyRequestedConflictingData = "ConsentAlreadyRequestedConflictingData", 
    ReceiverNotWhitelisted = "ReceiverNotWhitelisted", 
    InvalidComplianceFeature = "InvalidComplianceFeature", 
    ChildTooOld = "ChildTooOld", 
    UserForgotten = "UserForgotten", 
    UnsupportedNotificationType = "UnsupportedNotificationType", 
    UnsupportedRequestType = "UnsupportedRequestType", 
    ChildIneligibleForConsent = "ChildIneligibleForConsent"
};
return {
    ActionTypeEnum = v0, 
    AccessResponseEnum = v1, 
    ActionStatusEnum = v2, 
    VPCRequestTypeEnum = v3, 
    IDVSessionStatusEnum = v4, 
    IDVSessionErrorEnum = v5, 
    IDVStep = v6, 
    VPCStepEnum = v7, 
    VPCErrorCategoriesEnum = v8, 
    VPCRetryBehaviorEnum = v9, 
    VPCErrorCodesEnum = v10
};