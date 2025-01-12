local v0 = require(script.CoreVoiceManager);
local v1 = require(script.Analytics);
local v2 = require(script.Constants);
local l_Requests_0 = script.Requests;
local l_Flags_0 = script.Flags;
return {
    CoreVoiceManager = v0, 
    Constants = v2, 
    Analytics = v1, 
    Flags = {
        GetFFlagAlwaysSetupVoiceListeners = l_Flags_0.GetFFlagAlwaysSetupVoiceListeners, 
        GetFFlagFixNewAudioAPIEcho = l_Flags_0.GetFFlagFixNewAudioAPIEcho, 
        GetFFlagHideUIWhenVoiceDefaultDisabled = l_Flags_0.GetFFlagHideUIWhenVoiceDefaultDisabled, 
        GetFFlagHideVoiceUIUntilInputExists = l_Flags_0.GetFFlagHideVoiceUIUntilInputExists, 
        GetFFlagOverwriteIsMutedLocally = l_Flags_0.GetFFlagOverwriteIsMutedLocally, 
        GetFFlagReceiveLikelySpeakingUsers = l_Flags_0.GetFFlagReceiveLikelySpeakingUsers, 
        GetFFlagSetActiveWhenConnecting = l_Flags_0.GetFFlagSetActiveWhenConnecting, 
        GetFFlagUpdateDeviceInputPlayerChanged = l_Flags_0.GetFFlagUpdateDeviceInputPlayerChanged, 
        GetFFlagUseAudioInstanceAdded = l_Flags_0.GetFFlagUseAudioInstanceAdded, 
        GetFFlagEnableVoiceSignal = l_Flags_0.GetFFlagEnableVoiceSignal, 
        GetFFlagVoiceChatTeamTestMuteIconOutOfSyncFixLua = l_Flags_0.GetFFlagVoiceChatTeamTestMuteIconOutOfSyncFixLua, 
        GetFFlagEnableNudgeAnalytics = l_Flags_0.GetFFlagEnableNudgeAnalytics, 
        GetFFlagEnableLuaVoiceChatAnalytics = l_Flags_0.GetFFlagEnableLuaVoiceChatAnalytics, 
        GetFFlagUseLuaSignalrConsumer = l_Flags_0.GetFFlagUseLuaSignalrConsumer, 
        GetFFlagVoiceUseAudioRoutingAPI = l_Flags_0.GetFFlagVoiceUseAudioRoutingAPI, 
        GetFFlagVoiceChatServiceManagerUseAvatarChat = l_Flags_0.GetFFlagVoiceChatServiceManagerUseAvatarChat, 
        GetFFlagBatchVoiceParticipantsUpdates = l_Flags_0.GetFFlagBatchVoiceParticipantsUpdates, 
        GetFIntThrottleParticipantsUpdateMs = l_Flags_0.GetFIntThrottleParticipantsUpdateMs, 
        GetFFlagEnableVoiceNudge = l_Flags_0.GetFFlagEnableVoiceNudge, 
        GetFFlagReverseLocalMuteOverwrite = l_Flags_0.GetFFlagReverseLocalMuteOverwrite, 
        GetFFlagEnableFtuxExitOnMuteToggle = l_Flags_0.GetFFlagEnableFtuxExitOnMuteToggle
    }, 
    Requests = {
        GetShowAgeVerificationOverlay = l_Requests_0.GetShowAgeVerificationOverlay
    }
};