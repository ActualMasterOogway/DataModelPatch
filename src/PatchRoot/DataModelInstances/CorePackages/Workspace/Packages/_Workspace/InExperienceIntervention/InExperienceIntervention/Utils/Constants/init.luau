return {
    InitialUIState = {
        treatmentType = "none", 
        isShown = false, 
        detail = {}
    }, 
    UIStateActions = {
        ToggleNotificationDialog = "ToggleNotificationDialog"
    }, 
    EXP_INTERV_SIGNAL_NAMESPACE = "ExperienceIntervention", 
    ChatNudgeDialogSelectionGroup = "ChatNudgeCustomDialog", 
    TreatmentType = {
        ChatNudgeToast = "nudgeToast", 
        ChatNudgeDialog = "nudgeDialog", 
        ChatTimeout = "timeout", 
        BackendDriven = "BackendDriven", 
        None = "none"
    }, 
    NotificationDialogType = {
        ChatNudge = "nudge", 
        ChatTimeout = "timeout"
    }, 
    NotificationModalType = {
        Dialog = "dialog", 
        Toast = "toast"
    }, 
    TIMEOUT_INLINE_HEIGHT = 36, 
    TIMEOUT_MISTATE_FRAME_WIDTH = 220, 
    TIMEOUT_LINK_FRAME_WIDTH = 200, 
    MAX_CHARACTERS_IN_SHORT_LINE = 30, 
    MAX_CHARACTERS_IN_LONG_LINE = 45, 
    TOP_BUTTON_PADDING = 20, 
    STANDARD_PADDING = 16, 
    CORNER_RADIUS = 8, 
    VIOLATION_HEIGHT = 56, 
    SMALL_SCREEN_THRESHOLD = 400, 
    SCROLL_BAR_WIDTH = 12, 
    UNIBAR_HEIGHT = 48, 
    DIALOG_HEADER_HEIGHT = 48, 
    localizationKeys = {
        LetUsKnowLinkText = "Feature.InExperienceIntervention.Action.LetUsKnow", 
        IUnderstandText = "Feature.InExperienceIntervention.Action.Understand", 
        BeRespectfulText = "Feature.InExperienceIntervention.Description.BeRespectful", 
        ChatDisabledText = "Feature.InExperienceIntervention.Description.ChatDisabled", 
        TextChatMayBeSuspendedText = "Feature.InExperienceIntervention.Description.TextChatMayBeSuspended", 
        LoseAccessText = "Feature.InExperienceIntervention.Description.LoseAccess", 
        MistakeText = "Feature.InExperienceIntervention.Description.Mistake", 
        CannotChatText = "Feature.InExperienceIntervention.Heading.CannotChat", 
        ChatBreaksRulesText = "Feature.InExperienceIntervention.Heading.ChatBreaksRules", 
        ChatSuspendedText = "Feature.InExperienceIntervention.Heading.ChatSuspended", 
        FeedbackHelpsText = "Feature.InExperienceIntervention.Description.FeedbackHelps", 
        TakeALookText = "Feature.InExperienceIntervention.Heading.TakeALook", 
        DisclaimerText = "Feature.InExperienceIntervention.Description.Disclaimer", 
        ChatIncludesText = "Feature.InExperienceIntervention.Description.ChatIncludes", 
        CannotSendText = "Feature.InExperienceIntervention.Description.CannotSend", 
        CannotSend1MinText = "Feature.InExperienceIntervention.Description.CannotSend1Min", 
        TextChatSuspensionText = "Feature.InExperienceIntervention.Heading.TextChatSuspension", 
        MayLoseAccessText = "Feature.InExperienceIntervention.Description.MayLoseAccess"
    }
};