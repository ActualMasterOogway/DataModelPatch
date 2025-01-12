local v0 = require(script.ParticipantAdded);
local v1 = require(script.ParticipantRemoved);
local v2 = require(script.ParticipantWasMuted);
local v3 = require(script.ParticipantWasUnmuted);
local v4 = require(script.ParticipantIsActive);
local v5 = require(script.ParticipantIsInactive);
local v6 = require(script.ExperienceLeft);
local v7 = require(script.ExperienceJoined);
local v8 = require(script.VoiceStatusChanged);
local v9 = require(script.RestoreState);
local v10 = require(script.ParticipantAudioFocusChanged);
return {
    ParticipantAdded = v0, 
    ParticipantRemoved = v1, 
    ParticipantWasMuted = v2, 
    ParticipantWasUnmuted = v3, 
    ParticipantIsActive = v4, 
    ParticipantIsInactive = v5, 
    ExperienceLeft = v6, 
    ExperienceJoined = v7, 
    VoiceStatusChanged = v8, 
    RestoreState = v9, 
    ParticipantAudioFocusChanged = v10
};