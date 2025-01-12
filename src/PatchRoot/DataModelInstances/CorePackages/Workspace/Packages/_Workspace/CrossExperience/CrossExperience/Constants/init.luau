local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local _ = require(l_script_FirstAncestor_0.Types);
return {
    STORAGE_CEV_STORE_KEY = "CrossExperienceVoiceStore", 
    EXPERIENCE_TYPE_VOICE = "Voice", 
    EXPERIENCE_TYPE_LUAAPP = "LuaApp", 
    EXPERIENCE_TYPE_UGC = "Ugc", 
    VOICE_STATUS = {
        DISCONNECTED = "DISCONNECTED", 
        RCC_CONNECTING = "RCC_CONNECTING", 
        RCC_CONNECTED = "RCC_CONNECTED", 
        RCC_RECONNECTING = "RCC_RECONNECTING", 
        VOICE_RECONNECTING = "VOICE_RECONNECTING", 
        VOICE_CONNECTING = "VOICE_CONNECTING", 
        VOICE_CONNECTED = "VOICE_CONNECTED", 
        ERROR_RCC_CONNECTING = "ERROR_RCC_CONNECTING", 
        ERROR_JOIN_FEASIBILITY_CHECK_FAILED = "ERROR_JOIN_FEASIBILITY_CHECK_FAILED", 
        ERROR_START_BACKGROUND_DM = "ERROR_START_BACKGROUND_DM", 
        ERROR_VOICE_INIT = "ERROR_VOICE_INIT", 
        ERROR_VOICE_SETUP = "ERROR_VOICE_SETUP", 
        ERROR_VOICE_JOIN = "ERROR_VOICE_JOIN", 
        ERROR_VOICE_MIC_REJECTED = "ERROR_VOICE_MIC_REJECTED", 
        ERROR_VOICE_MODERATED = "ERROR_VOICE_MODERATED", 
        ERROR_VOICE_FAILED = "ERROR_VOICE_FAILED", 
        ERROR_VOICE_DISCONNECTED = "ERROR_VOICE_DISCONNECTED"
    }, 
    BACKGROUND_DM_STATUS = {
        ACTIVE = "Active", 
        BACKGROUND = "Background", 
        PASSIVE = "Passive", 
        NONE = "None"
    }, 
    COMMUNICATIONS = {
        EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE = "ExecutePartyVoiceInputDeviceChange", 
        EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE = "ExecutePartyVoiceOutputDeviceChange", 
        EXECUTE_GET_BACKGROUND_DM_STATE = "ExecutePartyVoiceGetBackgroundDMState", 
        EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY = "ExecutePartyVoiceIgnoreLowMemory"
    }, 
    EVENTS = {
        DEBUG_COMMAND = {
            ADD_OBSERVER = "AddObserverPartyVoiceDebugCommand", 
            NOTIFY = "NotifyPartyVoiceDebugCommand", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceDebugCommand"
        }, 
        PARTY_VOICE_RECONNECT_REQUESTED = {
            ADD_OBSERVER = "AddObserverPartyVoiceReconnectRequested", 
            NOTIFY = "NotifyPartyVoiceReconnectRequested", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceReconnectRequested"
        }, 
        PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantAudioFocusChanged", 
            NOTIFY = "NotifyPartyVoiceParticipantAudioFocusChanged", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantAudioFocusChanged"
        }, 
        PARTY_VOICE_GAME_JOIN_STARTED = {
            ADD_OBSERVER = "AddObserverPartyVoiceGameJoinStarted", 
            NOTIFY = "NotifyPartyVoiceGameJoinStarted", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceGameJoinStarted"
        }, 
        PARTY_VOICE_GAME_JOIN_SUCCEEDED = {
            ADD_OBSERVER = "AddObserverPartyVoiceGameJoinSucceeded", 
            NOTIFY = "NotifyPartyVoiceGameJoinSucceeded", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceGameJoinSucceeded"
        }, 
        PARTY_VOICE_GAME_JOIN_FAILED = {
            ADD_OBSERVER = "AddObserverPartyVoiceGameJoinFailed", 
            NOTIFY = "NotifyPartyVoiceGameJoinFailed", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceGameJoinFailed"
        }, 
        PARTY_VOICE_STATUS_CHANGED = {
            ADD_OBSERVER = "AddObserverPartyVoiceStatusChanged", 
            NOTIFY = "NotifyPartyVoiceStatusChanged", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceStatusChanged"
        }, 
        PARTY_VOICE_EXPERIENCE_JOINED = {
            ADD_OBSERVER = "AddObserverPartyVoiceExperienceStarted", 
            NOTIFY = "NotifyPartyVoiceExperienceStarted", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceExperienceStarted"
        }, 
        PARTY_VOICE_PARTICIPANT_ADDED = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasAdded", 
            NOTIFY = "NotifyPartyVoiceParticipantWasAdded", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasAdded"
        }, 
        PARTY_VOICE_PARTICIPANT_REMOVED = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasRemoved", 
            NOTIFY = "NotifyPartyVoiceParticipantWasRemoved", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasRemoved"
        }, 
        PARTY_VOICE_PARTICIPANT_WAS_MUTED = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasMuted", 
            NOTIFY = "NotifyPartyVoiceParticipantWasMuted", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasMuted"
        }, 
        PARTY_VOICE_PARTICIPANT_WAS_UNMUTED = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasUnmuted", 
            NOTIFY = "NotifyPartyVoiceParticipantWasUnmuted", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasUnmuted"
        }, 
        PARTY_VOICE_PARTICIPANT_IS_ACTIVE = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantIsActive", 
            NOTIFY = "NotifyPartyVoiceParticipantIsActive", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantIsActive"
        }, 
        PARTY_VOICE_PARTICIPANT_IS_INACTIVE = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantIsInactive", 
            NOTIFY = "NotifyPartyVoiceParticipantIsInactive", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantIsInactive"
        }, 
        MUTE_PARTY_VOICE_PARTICIPANT = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantMute", 
            NOTIFY = "NotifyPartyVoiceParticipantMute", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantMute"
        }, 
        UNMUTE_PARTY_VOICE_PARTICIPANT = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantUnmute", 
            NOTIFY = "NotifyPartyVoiceParticipantUnmute", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantUnmute"
        }, 
        PARTY_VOICE_BLOCK_PARTICIPANT = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantBlock", 
            NOTIFY = "NotifyPartyVoiceParticipantBlock", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantBlock"
        }, 
        PARTY_VOICE_UNBLOCK_PARTICIPANT = {
            ADD_OBSERVER = "AddObserverPartyVoiceParticipantUnblock", 
            NOTIFY = "NotifyPartyVoiceParticipantUnblock", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantUnblock"
        }, 
        PARTY_VOICE_MEMORY_LOW = {
            ADD_OBSERVER = "AddObserverPartyVoiceMemoryLow", 
            NOTIFY = "NotifyPartyVoiceMemoryLow", 
            REMOVE_OBSERVER = "RemoveObserverPartyVoiceMemoryLow"
        }
    }, 
    AUDIO_FOCUS_MANAGEMENT = {
        CEV = {
            CONTEXT_ID = 2, 
            FOCUS_PRIORITY = 2
        }, 
        UGC = {
            CONTEXT_ID = 1, 
            FOCUS_PRIORITY = 1
        }
    }
};