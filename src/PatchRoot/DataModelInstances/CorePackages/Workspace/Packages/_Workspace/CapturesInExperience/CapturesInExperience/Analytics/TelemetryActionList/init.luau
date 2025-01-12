local l_Parent_0 = script.Parent.Parent.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("CapturesTelemetryThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.CapturesActivatedInGameMenu] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesActivatedChrome] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesCarouselOpened] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesCarouselPostActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesDeactivatedInGameMenu] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesDeactivatedChrome] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesEntrypointActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesEntrypointLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v2.CapturesLegacyVideoRecordingDuration] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v2.CapturesPageOpenedInGameMenu] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesPostToastButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesShareFromNonStandardServer] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesShareLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    externalShareSource = function(v3) --[[ Line: 103 ]] --[[ Name: externalShareSource ]]
                        return v3;
                    end
                }
            }
        }
    }, 
    [v2.CapturesShareToastButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ComposerBackButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ComposerPostButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.PostConfirmationToastViewed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v4) --[[ Line: 136 ]] --[[ Name: status ]]
                        return v4;
                    end
                }
            }
        }
    }, 
    [v2.PostPendingToastViewed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.PostPendingUnsuccessfulToastViewed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.PostShareToastButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ShareCaptureGenerateLinkFailed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ShareCapturePromptAccepted] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ShareCapturePromptRejected] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ScreenshotsForceDisableOccurred] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};