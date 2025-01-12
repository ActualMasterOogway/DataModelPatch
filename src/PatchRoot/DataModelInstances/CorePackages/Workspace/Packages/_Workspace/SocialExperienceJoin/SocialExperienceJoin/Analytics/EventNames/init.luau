local l_Parent_0 = script:FindFirstAncestor("SocialExperienceJoin").Parent;
local l_FFlagProfilePlatformFixTelemetryEvents_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformFixTelemetryEvents;
return {
    JoinExperience = l_FFlagProfilePlatformFixTelemetryEvents_0 and "SocialJoinExperience" or "JoinExperience", 
    PurchaseExperience = l_FFlagProfilePlatformFixTelemetryEvents_0 and "SocialPurchaseExperience" or "PurchaseExperience", 
    CancelPurchaseExperience = l_FFlagProfilePlatformFixTelemetryEvents_0 and "SocialCancelPurchaseExperience" or "CancelPurchaseExperience", 
    PurchaseExperienceAttempt = l_FFlagProfilePlatformFixTelemetryEvents_0 and "SocialPurchaseExperienceAttempt" or "PurchaseExperienceAttempt", 
    UnableToJoinViewDetails = l_FFlagProfilePlatformFixTelemetryEvents_0 and "SocialUnableToJoinViewDetails" or "UnableToJoinViewDetails", 
    UnableToJoinCancel = l_FFlagProfilePlatformFixTelemetryEvents_0 and "SocialUnableToJoinCancel" or "UnableToJoinCancel"
};