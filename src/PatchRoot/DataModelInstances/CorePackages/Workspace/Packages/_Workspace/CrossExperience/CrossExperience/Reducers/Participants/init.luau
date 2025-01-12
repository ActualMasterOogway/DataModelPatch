local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
local l_ParticipantAdded_0 = require(l_script_FirstAncestor_0.Actions).ParticipantAdded;
local l_ParticipantRemoved_0 = require(l_script_FirstAncestor_0.Actions).ParticipantRemoved;
local l_ParticipantIsActive_0 = require(l_script_FirstAncestor_0.Actions).ParticipantIsActive;
local l_ParticipantIsInactive_0 = require(l_script_FirstAncestor_0.Actions).ParticipantIsInactive;
local l_ParticipantWasMuted_0 = require(l_script_FirstAncestor_0.Actions).ParticipantWasMuted;
local l_ParticipantWasUnmuted_0 = require(l_script_FirstAncestor_0.Actions).ParticipantWasUnmuted;
local l_ParticipantAudioFocusChanged_0 = require(l_script_FirstAncestor_0.Actions).ParticipantAudioFocusChanged;
local l_ExperienceJoined_0 = require(l_script_FirstAncestor_0.Actions).ExperienceJoined;
local l_ExperienceLeft_0 = require(l_script_FirstAncestor_0.Actions).ExperienceLeft;
local l_RestoreState_0 = require(l_script_FirstAncestor_0.Actions).RestoreState;
local _ = require(l_script_FirstAncestor_0.Types);
local v15 = require(l_script_FirstAncestor_0.Utils);
local v16 = {
    participants = {}, 
    activeUserIds = {}, 
    publicVoiceFocusedUserIds = {}
};
local function _(v17) --[[ Line: 42 ]]
    -- upvalues: v16 (copy), v15 (copy)
    local l_v16_0 = v16;
    if v17 then
        l_v16_0.participants = v15.stringMapToNumberMap(v17.participants);
        l_v16_0.activeUserIds = v17.activeUserIds;
        l_v16_0.publicVoiceFocusedUserIds = v15.stringMapToNumberMap(v17.publicVoiceFocusedUserIds);
    end;
    return l_v16_0;
end;
return function(v20) --[[ Line: 53 ]]
    -- upvalues: l_Rodux_0 (copy), v16 (copy), v15 (copy), l_ParticipantAdded_0 (copy), l_Cryo_0 (copy), l_ParticipantRemoved_0 (copy), l_ParticipantWasMuted_0 (copy), l_ParticipantWasUnmuted_0 (copy), l_ParticipantIsActive_0 (copy), l_ParticipantIsInactive_0 (copy), l_ExperienceJoined_0 (copy), l_RestoreState_0 (copy), l_ParticipantAudioFocusChanged_0 (copy), l_ExperienceLeft_0 (copy)
    local l_createReducer_0 = l_Rodux_0.createReducer;
    local l_v16_1 = v16;
    if v20 then
        l_v16_1.participants = v15.stringMapToNumberMap(v20.participants);
        l_v16_1.activeUserIds = v20.activeUserIds;
        l_v16_1.publicVoiceFocusedUserIds = v15.stringMapToNumberMap(v20.publicVoiceFocusedUserIds);
    end;
    return l_createReducer_0(l_v16_1, {
        [l_ParticipantAdded_0.name] = function(v23, v24) --[[ Line: 56 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_participant_0 = v24.payload.participant;
            if not v23.participants[l_participant_0.userId] then
                local v26 = table.clone(v23.participants);
                v26[l_participant_0.userId] = l_participant_0;
                return l_Cryo_0.Dictionary.join(v23, {
                    participants = v26
                });
            else
                return v23;
            end;
        end, 
        [l_ParticipantRemoved_0.name] = function(v27, v28) --[[ Line: 70 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_0 = v28.payload.userId;
            if v27.participants[l_userId_0] then
                local v30 = table.clone(v27.participants);
                local v31 = table.clone(v27.activeUserIds);
                local l_publicVoiceFocusedUserIds_0 = v27.publicVoiceFocusedUserIds;
                local v33 = table.find(v31, l_userId_0);
                v30[l_userId_0] = nil;
                if l_publicVoiceFocusedUserIds_0[l_userId_0] then
                    l_publicVoiceFocusedUserIds_0 = table.clone(v27.publicVoiceFocusedUserIds);
                    l_publicVoiceFocusedUserIds_0[l_userId_0] = nil;
                end;
                if v33 then
                    table.remove(v31, v33);
                end;
                return l_Cryo_0.Dictionary.join(v27, {
                    participants = v30, 
                    activeUserIds = v31, 
                    publicVoiceFocusedUserIds = l_publicVoiceFocusedUserIds_0
                });
            else
                return v27;
            end;
        end, 
        [l_ParticipantWasMuted_0.name] = function(v34, v35) --[[ Line: 99 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_1 = v35.payload.userId;
            if v34.participants[l_userId_1] then
                local l_participants_0 = v34.participants;
                local l_activeUserIds_0 = v34.activeUserIds;
                local v39 = table.find(l_activeUserIds_0, l_userId_1);
                if not l_participants_0[l_userId_1].isMuted then
                    l_participants_0 = table.clone(v34.participants);
                    l_participants_0[l_userId_1].isMuted = true;
                end;
                if v39 then
                    l_activeUserIds_0 = table.clone(v34.activeUserIds);
                    table.remove(l_activeUserIds_0, v39);
                end;
                return l_Cryo_0.Dictionary.join(v34, {
                    participants = l_participants_0, 
                    activeUserIds = l_activeUserIds_0
                });
            else
                return v34;
            end;
        end, 
        [l_ParticipantWasUnmuted_0.name] = function(v40, v41) --[[ Line: 126 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_2 = v41.payload.userId;
            if v40.participants[l_userId_2] and v40.participants[l_userId_2].isMuted then
                local v43 = table.clone(v40.participants);
                v43[l_userId_2].isMuted = false;
                return l_Cryo_0.Dictionary.join(v40, {
                    participants = v43
                });
            else
                return v40;
            end;
        end, 
        [l_ParticipantIsActive_0.name] = function(v44, v45) --[[ Line: 142 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_3 = v45.payload.userId;
            local v47 = table.clone(v44.activeUserIds);
            local v48 = table.find(v47, l_userId_3);
            if v48 then
                if v48 ~= #v47 then
                    table.remove(v47, v48);
                    table.insert(v47, l_userId_3);
                end;
            else
                table.insert(v47, l_userId_3);
            end;
            return l_Cryo_0.Dictionary.join(v44, {
                activeUserIds = v47
            });
        end, 
        [l_ParticipantIsInactive_0.name] = function(v49, v50) --[[ Line: 161 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_userId_4 = v50.payload.userId;
            local v52 = table.find(v49.activeUserIds, l_userId_4);
            if v52 then
                local v53 = table.clone(v49.activeUserIds);
                table.remove(v53, v52);
                return l_Cryo_0.Dictionary.join(v49, {
                    activeUserIds = v53
                });
            else
                return v49;
            end;
        end, 
        [l_ExperienceJoined_0.name] = function(v54, v55) --[[ Line: 177 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_payload_0 = v55.payload;
            if l_payload_0.participants and l_payload_0.activeUserIds then
                return l_Cryo_0.Dictionary.join(v54, {
                    participants = l_payload_0.participants, 
                    activeUserIds = l_payload_0.activeUserIds, 
                    publicVoiceFocusedUserIds = l_payload_0.publicVoiceFocusedUserIds
                });
            else
                return v54;
            end;
        end, 
        [l_RestoreState_0.name] = function(v57, v58) --[[ Line: 189 ]]
            -- upvalues: l_Cryo_0 (ref)
            if v58.payload.Participants then
                return l_Cryo_0.Dictionary.join({}, v58.payload.Participants);
            else
                return v57;
            end;
        end, 
        [l_ParticipantAudioFocusChanged_0.name] = function(v59, v60) --[[ Line: 196 ]]
            -- upvalues: l_Cryo_0 (ref)
            local l_contextIds_0 = v60.payload.contextIds;
            local v62 = table.clone(v59.publicVoiceFocusedUserIds);
            if l_contextIds_0 then
                for v63, v64 in pairs(l_contextIds_0) do
                    local v65 = tonumber(v63);
                    if v65 then
                        if v64 == 1 then
                            v62[v65] = true;
                        else
                            v62[v65] = nil;
                        end;
                    end;
                end;
            end;
            return l_Cryo_0.Dictionary.join(v59, {
                publicVoiceFocusedUserIds = v62
            });
        end, 
        [l_ExperienceLeft_0.name] = function() --[[ Line: 224 ]]
            return {
                participants = {}, 
                activeUserIds = {}, 
                publicVoiceFocusedUserIds = {}
            };
        end
    });
end;