local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
return {
    Access = {
        Actionable = "Actionable", 
        Denied = "Denied", 
        Granted = "Granted", 
        Pending = "Pending"
    }, 
    EventStatus = {
        Active = "active", 
        Cancelled = "cancelled", 
        Moderated = "moderated", 
        Unpublished = "unpublished"
    }, 
    HostType = {
        Group = "group", 
        User = "user"
    }, 
    MediaAssetType = {
        Image = "Image", 
        YouTubeVideo = "YouTubeVideo"
    }, 
    PresenceType = {
        InGame = "InGame", 
        InStudio = "InStudio", 
        Offline = "Offline", 
        Online = "Online"
    }, 
    RecourseActions = {
        AddedEmail = "AddedEmail", 
        Email = "Email", 
        GovernmentId = "GovernmentId", 
        Phone = "Phone", 
        ParentConsent = "ParentConsent", 
        ParentLink = "ParentLink"
    }, 
    RsvpStatus = {
        Going = "going", 
        MaybeGoing = "maybeGoing", 
        None = "none", 
        NotGoing = "notGoing"
    }, 
    ShareLinkType = {
        ExperienceDetails = "ExperienceDetails", 
        ExperienceInvite = "ExperienceInvite", 
        FriendInvite = "FriendInvite", 
        Home = "Home", 
        NotificationExperienceInvite = "NotificationExperienceInvite", 
        PrivateServer = "PrivateServer", 
        Profile = "Profile", 
        ScreenshotInvite = "ScreenshotInvite", 
        Server = "Server"
    }, 
    VPCRequestTypes = {
        ChargebackReenableAccount = "ChargebackReenableAccount", 
        SavePaymentMethods = "SavePaymentMethods", 
        UpdateUserSetting = "UpdateUserSetting", 
        UpdateBirthdate = "UpdateBirthdate", 
        LinkToChild = "LinkToChild", 
        Unknown = "Unknown"
    }
};