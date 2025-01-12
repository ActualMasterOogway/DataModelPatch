local v0 = {
    PushUpsellHome = "homePushUpsell"
};
return {
    ModalKey = v0, 
    LocalStorageKeys = {
        PromptShownCount = "PushUpsellPromptShownCount", 
        SysPromptShownTimestamp = "PushUpsellSysPromptShownTimestamp", 
        EduPromptResponseTimestamp = "PushUpsellEduPromptResponseTimestamp", 
        EduPromptResponse = "PushUpsellEduPromptResponse"
    }, 
    TranslationKeys = {
        [v0.PushUpsellHome] = {
            CancelAction = "Feature.Notifications.Action.PushUpsellNotNow", 
            ConfirmAction = "Feature.Notifications.Action.PushUpsellAllow", 
            Heading = "Feature.Notifications.Heading.PushUpsellGeneric", 
            Body = "Feature.Notifications.Label.PushUpsellGeneric", 
            SomethingWentWrong = "Feature.Call.Error.Description.Generic"
        }
    }
};