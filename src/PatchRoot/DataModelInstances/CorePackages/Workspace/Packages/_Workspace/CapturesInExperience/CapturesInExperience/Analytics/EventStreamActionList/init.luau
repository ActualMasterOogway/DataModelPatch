local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventConstants);
local v6 = require(script.Parent.EventNames);
local v7 = require(script.Parent.formatPostConfirmationToastAction);
return {
    [v6.CapturesActivatedInGameMenu] = {
        additionalInfo = {
            btn = v6.CapturesActivatedInGameMenu
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesActivatedChrome] = {
        additionalInfo = {
            btn = v6.CapturesActivatedChrome
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesCarouselClosed] = {
        additionalInfo = {
            btn = v6.CapturesCarouselClosed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesCarouselClosedByKeyboard] = {
        additionalInfo = {
            btn = v6.CapturesCarouselClosedByKeyboard
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesCarouselNavigated] = {
        additionalInfo = {
            btn = v6.CapturesCarouselNavigated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            direction = v1.identity
        }
    }, 
    [v6.CapturesCarouselNavigatedByKeyboard] = {
        additionalInfo = {
            btn = v6.CapturesCarouselNavigatedByKeyboard
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            direction = v1.identity
        }
    }, 
    [v6.CapturesCarouselOpened] = {
        additionalInfo = {
            btn = v6.CapturesCarouselOpened
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesCarouselPostActivated] = {
        additionalInfo = {
            namespace = v5.namespace.CapturesCarousel, 
            action = v5.action.PostCTAActivated
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity, 
            universeId = v1.identity
        }
    }, 
    [v6.CapturesCarouselSaveToExternalStorageActivated] = {
        additionalInfo = {
            btn = v6.CapturesCarouselSaveToExternalStorageActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesCarouselScrolled] = {
        additionalInfo = {
            btn = v6.CapturesCarouselScrolled
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            direction = v1.identity
        }
    }, 
    [v6.CapturesCarouselShareActivated] = {
        additionalInfo = {
            btn = v6.CapturesCarouselShareActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeactivatedInGameMenu] = {
        additionalInfo = {
            btn = v6.CapturesDeactivatedInGameMenu
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeactivatedChrome] = {
        additionalInfo = {
            btn = v6.CapturesDeactivatedChrome
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeleteActivatedInCaptureManager] = {
        additionalInfo = {
            btn = v6.CapturesDeleteActivatedInCaptureManager
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeleteActivatedInCarousel] = {
        additionalInfo = {
            btn = v6.CapturesDeleteActivatedInCarousel
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeleteWarningModalCancelPressed] = {
        additionalInfo = {
            btn = v6.CapturesDeleteWarningModalCancelPressed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeleteWarningModalDeletePressed] = {
        additionalInfo = {
            btn = v6.CapturesDeleteWarningModalDeletePressed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDeleteWarningModalOptedOut] = {
        additionalInfo = {
            btn = v6.CapturesDeleteWarningModalOptedOut
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesDesktopHotkeyCaptureTriggered] = {
        additionalInfo = {
            btn = v6.CapturesDesktopHotkeyCaptureTriggered
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesEntrypointActivated] = {
        additionalInfo = {
            btn = v6.CapturesEntrypointActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesEntrypointDragged] = {
        additionalInfo = {
            btn = v6.CapturesEntrypointDragged
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesEntrypointHotkeyTooltipActivated] = {
        additionalInfo = {
            btn = v6.CapturesEntrypointHotkeyTooltipActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v6.CapturesEntrypointViewed] = {
        additionalInfo = {
            btn = v6.CapturesEntrypointViewed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v6.CapturesManagerBulkSaveToExternalStorageActivated] = {
        additionalInfo = {
            btn = v6.CapturesManagerBulkSaveToExternalStorageActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesManagerItemActivated] = {
        additionalInfo = {
            btn = v6.CapturesManagerItemActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesManagerOpened] = {
        additionalInfo = {
            btn = v6.CapturesManagerOpened
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesManagerSaveToExternalStorageActivated] = {
        additionalInfo = {
            btn = v6.CapturesManagerSaveToExternalStorageActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesManagerSelectAllActivated] = {
        additionalInfo = {
            btn = v6.CapturesManagerSelectAllActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesManagerShareActivated] = {
        additionalInfo = {
            btn = v6.CapturesManagerShareActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesMigratedLegacyVideoRecordActivated] = {
        additionalInfo = {
            btn = v6.CapturesMigratedLegacyVideoRecordActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesMigratedLegacyVideoRecordDeactivated] = {
        additionalInfo = {
            btn = v6.CapturesMigratedLegacyVideoRecordDeactivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesPageOpenedInGameMenu] = {
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.PageLoad
    }, 
    [v6.CapturesPostToastButtonActivated] = {
        additionalInfo = {
            namespace = v5.namespace.PostToast, 
            action = v5.action.PostCTAActivated
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity, 
            universeId = v1.identity
        }
    }, 
    [v6.CapturesShareFromNonStandardServer] = {
        additionalInfo = {
            btn = v6.CapturesShareFromNonStandardServer
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesSavePermissionModalAllowPressed] = {
        additionalInfo = {
            btn = v6.CapturesSavePermissionModalAllowPressed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesSavePermissionModalCancelPressed] = {
        additionalInfo = {
            btn = v6.CapturesSavePermissionModalCancelPressed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesSavedToDeviceToastOpenButtonActivated] = {
        additionalInfo = {
            btn = v6.CapturesSavedToDeviceToastOpenButtonActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesShareToastButtonActivated] = {
        additionalInfo = {
            btn = v6.CapturesShareToastButtonActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesShareToastViewed] = {
        additionalInfo = {
            btn = v6.CapturesShareToastViewed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v6.CapturesShowMoreInGameMenu] = {
        additionalInfo = {
            btn = v6.CapturesShowMoreInGameMenu
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.CapturesViewToastButtonActivated] = {
        additionalInfo = {
            btn = v6.CapturesViewToastButtonActivated
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.ComposerBackButtonActivated] = {
        additionalInfo = {
            namespace = v5.namespace.Composer, 
            action = v5.action.BackButtonPressed
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity
        }
    }, 
    [v6.ComposerPostButtonActivated] = {
        additionalInfo = {
            namespace = v5.namespace.Composer, 
            action = v5.action.PostButtonPressed
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity, 
            universeId = v1.identity
        }
    }, 
    [v6.PostConfirmationToastViewed] = {
        additionalInfo = {
            namespace = v5.namespace.PostConfirmation
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity, 
            action = v7
        }
    }, 
    [v6.PostPendingToastViewed] = {
        additionalInfo = {
            action = v5.action.PostPendingToastViewed, 
            namespace = v5.namespace.PostPending
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity
        }
    }, 
    [v6.PostPendingUnsuccessfulToastViewed] = {
        additionalInfo = {
            action = v5.action.PostPendingUnsuccessfulToastViewed, 
            namespace = v5.namespace.PostPending
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            sessionId = v1.identity
        }
    }, 
    [v6.SaveCapturesPromptAccepted] = {
        additionalInfo = {
            btn = v6.SaveCapturesPromptAccepted
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            savedCaptures = v1.identity, 
            totalCaptures = v1.identity
        }
    }, 
    [v6.SaveCapturesPromptRejected] = {
        additionalInfo = {
            btn = v6.SaveCapturesPromptRejected
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.SaveCapturesPromptViewed] = {
        additionalInfo = {
            btn = v6.SaveCapturesPromptViewed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v6.ShareCaptureGenerateLinkFailed] = {
        additionalInfo = {
            btn = v6.ShareCaptureGenerateLinkFailed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.GenerateLinkFailed, 
        formatRulesForAdditionalInfo = {
            httpError = v1.identity
        }
    }, 
    [v6.ShareCapturePromptAccepted] = {
        additionalInfo = {
            btn = v6.ShareCapturePromptAccepted
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.ShareCapturePromptRejected] = {
        additionalInfo = {
            btn = v6.ShareCapturePromptRejected
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.ButtonClick
    }, 
    [v6.ShareCapturePromptViewed] = {
        additionalInfo = {
            btn = v6.ShareCapturePromptViewed
        }, 
        context = l_Contexts_0.Captures, 
        eventType = l_EventTypes_0.UserSeen
    }, 
    [v6.ScreenshotsForceDisableOccurred] = {
        additionalInfo = {
            namespace = v5.namespace.ScreenshotsEvent, 
            action = v5.action.ForceDisableOccurred
        }, 
        context = l_Contexts_0.SocialContentPosting, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            universeId = v1.identity, 
            sessionId = v1.identity
        }
    }
};