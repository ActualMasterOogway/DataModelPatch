local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_SoundService_0 = game:GetService("SoundService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v7 = game:DefineFastFlag("DebugLogVoiceDefault", false);
local v8 = game:DefineFastFlag("SetNewDeviceToFalse", false);
local v9 = game:DefineFastFlag("FixNewPlayerCheck", false);
local v10 = game:DefineFastFlag("OnlyMakeInputsForVoiceUsers", false);
local v11 = game:DefineFastFlag("SendLikelySpeakingUsers", false);
local v12 = game:DefineFastFlag("ReceiveLikelySpeakingUsersEventV3", false);
local v13 = game:DefineFastFlag("VoiceDefaultUseAudioInstanceAdded", false) and game:GetEngineFeature("AudioInstanceAddedApiEnabled");
local v14 = game:DefineFastFlag("VoiceDefaultUseGetAudioInstances", false);
local v15 = game:DefineFastFlag("VoiceDefaultUseAudioDeviceRemoving", false);
local v16 = game:DefineFastFlag("StopVoiceDefaultIfNotVoiceEnabled", false);
local function v17(...) --[[ Line: 23 ]] --[[ Name: log ]]
    -- upvalues: v7 (copy)
    if v7 then
        print("[VoiceDefault]", ...);
    end;
end;
if l_GetFFlagAvatarChatServiceEnabled_0() and v16 then
    local l_status_0, l_result_0 = pcall(l_AvatarChatService_0.GetServerFeaturesAsync, l_AvatarChatService_0);
    if not l_status_0 then
        v17("Failed to get GetServerFeaturesAsync, returning early");
        return;
    else
        local v20 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.UniverseAudio);
        local v21 = l_AvatarChatService_0:IsEnabled(l_result_0, Enum.AvatarChatServiceFeature.PlaceAudio);
        if not v20 or not v21 then
            v17("Universe or place not voice enabled, returning early");
            return;
        end;
    end;
end;
local v22 = {};
local v23 = {};
local v24 = {};
local function _(v25, v26) --[[ Line: 55 ]] --[[ Name: upsertDeviceList ]]
    if v25 == nil then
        return {
            [v26] = true
        };
    else
        v25[v26] = true;
        return v25;
    end;
end;
local function _(v28) --[[ Line: 66 ]] --[[ Name: addEmitterToHead ]]
    -- upvalues: v17 (copy)
    local l_AudioEmitter_0 = Instance.new("AudioEmitter");
    l_AudioEmitter_0.Parent = v28;
    l_AudioEmitter_0:AddTag("RbxDefaultVoiceEmitter");
    v17("Adding emitter", l_AudioEmitter_0, " to ", v28);
    return l_AudioEmitter_0;
end;
local function _(v31, v32) --[[ Line: 76 ]] --[[ Name: hookupDeviceInputToEmitter ]]
    -- upvalues: v17 (copy)
    local l_AudioEmitter_1 = Instance.new("AudioEmitter");
    l_AudioEmitter_1.Parent = v31;
    l_AudioEmitter_1:AddTag("RbxDefaultVoiceEmitter");
    v17("Adding emitter", l_AudioEmitter_1, " to ", v31);
    local l_l_AudioEmitter_1_0 = l_AudioEmitter_1;
    v17("Hooking input device to emitter", v31, v32, l_l_AudioEmitter_1_0);
    l_AudioEmitter_1 = Instance.new("Wire");
    l_AudioEmitter_1.Parent = l_l_AudioEmitter_1_0;
    l_AudioEmitter_1.SourceInstance = v32;
    l_AudioEmitter_1.TargetInstance = l_l_AudioEmitter_1_0;
end;
local function _(v36) --[[ Line: 89 ]] --[[ Name: untrackDevice ]]
    -- upvalues: v22 (copy), v23 (copy), v17 (copy)
    if v36.Player then
        v22[v36.Player][v36] = nil;
    end;
    local v37 = v23[v36];
    if not v37 then
        v17("Attempting to remove connections from untracked AudioDeviceInput");
        return;
    else
        v37.onPlayerChanged:Disconnect();
        v23[v36] = nil;
        return;
    end;
end;
local function _(v39, v40) --[[ Line: 104 ]] --[[ Name: untrackDeviceForPlayer ]]
    -- upvalues: v22 (copy), v23 (copy), v17 (copy)
    if v40 then
        local v41 = v22[v40];
        if v41 then
            v41[v39] = nil;
        end;
    end;
    local v42 = v23[v39];
    if not v42 then
        v17("Attempting to remove connections from untracked AudioDeviceInput");
        return;
    else
        v42.onPlayerChanged:Disconnect();
        v23[v39] = nil;
        return;
    end;
end;
local function v44(v45) --[[ Line: 121 ]] --[[ Name: trackDevice ]]
    -- upvalues: v22 (copy), v9 (copy), v23 (copy), v17 (copy), v44 (copy), v15 (copy)
    local l_Player_0 = v45.Player;
    if l_Player_0 then
        local l_v22_0 = v22;
        local v48 = v22[l_Player_0];
        local v49;
        if v48 == nil then
            v49 = {
                [v45] = true
            };
        else
            v48[v45] = true;
            v49 = v48;
        end;
        l_v22_0[l_Player_0] = v49;
    end;
    local v50 = {};
    local l_l_Player_0_0 = l_Player_0;
    v50.onPlayerChanged = v45:GetPropertyChangedSignal("Player"):Connect(function() --[[ Line: 129 ]]
        -- upvalues: v9 (ref), v45 (copy), l_l_Player_0_0 (ref), v22 (ref), v23 (ref), v17 (ref), v44 (ref)
        if v9 then
            local l_v45_0 = v45;
            local l_l_l_Player_0_0_0 = l_l_Player_0_0;
            if l_l_l_Player_0_0_0 then
                local v54 = v22[l_l_l_Player_0_0_0];
                if v54 then
                    v54[l_v45_0] = nil;
                end;
            end;
            local v55 = v23[l_v45_0];
            if not v55 then
                v17("Attempting to remove connections from untracked AudioDeviceInput");
            else
                v55.onPlayerChanged:Disconnect();
                v23[l_v45_0] = nil;
            end;
        else
            local l_v45_1 = v45;
            if l_v45_1.Player then
                v22[l_v45_1.Player][l_v45_1] = nil;
            end;
            local v57 = v23[l_v45_1];
            if not v57 then
                v17("Attempting to remove connections from untracked AudioDeviceInput");
            else
                v57.onPlayerChanged:Disconnect();
                v23[l_v45_1] = nil;
            end;
        end;
        l_l_Player_0_0 = v45.Player;
        v44(v45);
    end);
    v23[v45] = v50;
    if v15 then
        if v9 then
            v45.Destroying:Connect(function() --[[ Line: 142 ]]
                -- upvalues: v45 (copy), v22 (ref), v23 (ref), v17 (ref)
                local l_v45_2 = v45;
                local l_Player_1 = v45.Player;
                if l_Player_1 then
                    local v60 = v22[l_Player_1];
                    if v60 then
                        v60[l_v45_2] = nil;
                    end;
                end;
                local v61 = v23[l_v45_2];
                if not v61 then
                    v17("Attempting to remove connections from untracked AudioDeviceInput");
                    return;
                else
                    v61.onPlayerChanged:Disconnect();
                    v23[l_v45_2] = nil;
                    return;
                end;
            end);
        else
            v45.Destroying:Connect(function() --[[ Line: 146 ]]
                -- upvalues: v45 (copy), v22 (ref), v23 (ref), v17 (ref)
                local l_v45_3 = v45;
                if l_v45_3.Player then
                    v22[l_v45_3.Player][l_v45_3] = nil;
                end;
                local v63 = v23[l_v45_3];
                if not v63 then
                    v17("Attempting to remove connections from untracked AudioDeviceInput");
                    return;
                else
                    v63.onPlayerChanged:Disconnect();
                    v23[l_v45_3] = nil;
                    return;
                end;
            end);
        end;
    end;
end;
local function v75(v64) --[[ Line: 153 ]] --[[ Name: createAudioDevice ]]
    -- upvalues: v10 (copy), l_VoiceChatService_0 (copy), v17 (copy), v44 (copy), v24 (copy)
    if v10 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 155 ]]
            -- upvalues: l_VoiceChatService_0 (ref), v64 (copy)
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v64.UserId);
        end);
        if not l_status_1 then
            v17("Error getting voice enabled status: \"", l_result_1, "\"");
        end;
        if not l_status_1 or not l_result_1 then
            return;
        end;
    end;
    local l_AudioDeviceInput_0 = Instance.new("AudioDeviceInput");
    l_AudioDeviceInput_0.Player = v64;
    l_AudioDeviceInput_0.Parent = v64;
    l_AudioDeviceInput_0.Active = false;
    v44(l_AudioDeviceInput_0);
    if v64.Character then
        local l_Character_0 = v64.Character;
        local l_AudioEmitter_2 = Instance.new("AudioEmitter");
        l_AudioEmitter_2.Parent = l_Character_0;
        l_AudioEmitter_2:AddTag("RbxDefaultVoiceEmitter");
        v17("Adding emitter", l_AudioEmitter_2, " to ", l_Character_0);
        local l_l_AudioEmitter_2_0 = l_AudioEmitter_2;
        v17("Hooking input device to emitter", l_Character_0, l_AudioDeviceInput_0, l_l_AudioEmitter_2_0);
        l_AudioEmitter_2 = Instance.new("Wire");
        l_AudioEmitter_2.Parent = l_l_AudioEmitter_2_0;
        l_AudioEmitter_2.SourceInstance = l_AudioDeviceInput_0;
        l_AudioEmitter_2.TargetInstance = l_l_AudioEmitter_2_0;
    end;
    v24[v64] = v64.CharacterAdded:Connect(function(v71) --[[ Line: 175 ]]
        -- upvalues: l_AudioDeviceInput_0 (copy), v17 (ref)
        local l_l_AudioDeviceInput_0_0 = l_AudioDeviceInput_0;
        local l_AudioEmitter_3 = Instance.new("AudioEmitter");
        l_AudioEmitter_3.Parent = v71;
        l_AudioEmitter_3:AddTag("RbxDefaultVoiceEmitter");
        v17("Adding emitter", l_AudioEmitter_3, " to ", v71);
        local l_l_AudioEmitter_3_0 = l_AudioEmitter_3;
        v17("Hooking input device to emitter", v71, l_l_AudioDeviceInput_0_0, l_l_AudioEmitter_3_0);
        l_AudioEmitter_3 = Instance.new("Wire");
        l_AudioEmitter_3.Parent = l_l_AudioEmitter_3_0;
        l_AudioEmitter_3.SourceInstance = l_l_AudioDeviceInput_0_0;
        l_AudioEmitter_3.TargetInstance = l_l_AudioEmitter_3_0;
    end);
    v17("Creating device for ", v64.Name);
end;
if l_VoiceChatService_0.UseNewAudioApi then
    v17("Using new Audio API, EnableDefaultVoice: ", l_VoiceChatService_0.EnableDefaultVoice);
    if l_VoiceChatService_0.EnableDefaultVoice then
        local l_Players_1 = game:GetService("Players");
        l_Players_1.PlayerAdded:Connect(v75);
        l_Players_1.PlayerRemoving:Connect(function(v77) --[[ Line: 186 ]]
            -- upvalues: v22 (copy), v24 (copy), v17 (copy)
            local v78 = v22[v77];
            local v79 = v24[v77];
            v17(v77.Name, "removed. Deleting instance", v78);
            if v78 then
                v22[v77] = nil;
            end;
            if v79 then
                v79:Disconnect();
            end;
        end);
        for _, v81 in l_Players_1:GetPlayers() do
            v75(v81);
        end;
    end;
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "SetUserActive";
    l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    if v13 then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v83) --[[ Line: 208 ]]
            -- upvalues: v8 (copy), v44 (copy)
            if v83:IsA("AudioDeviceInput") then
                if v8 then
                    v83.Active = false;
                end;
                v44(v83);
            end;
        end);
    else
        game.DescendantAdded:Connect(function(v84) --[[ Line: 218 ]]
            -- upvalues: v8 (copy), v44 (copy)
            if v84:IsA("AudioDeviceInput") then
                if v8 then
                    v84.Active = false;
                end;
                v44(v84);
            end;
        end);
    end;
    if v14 then
        for _, v86 in l_SoundService_0:GetAudioInstances() do
            if v86:IsA("AudioDeviceInput") then
                if v8 then
                    v86.Active = false;
                end;
                v44(v86);
            end;
        end;
    else
        for _, v88 in game:GetDescendants() do
            if v88:IsA("AudioDeviceInput") then
                if v8 then
                    v88.Active = false;
                end;
                v44(v88);
            end;
        end;
    end;
    if not v15 then
        game.DescendantRemoving:Connect(function(v89) --[[ Line: 252 ]]
            -- upvalues: v9 (copy), v22 (copy), v23 (copy), v17 (copy)
            if v89:IsA("AudioDeviceInput") then
                if v9 then
                    local l_Player_2 = v89.Player;
                    if l_Player_2 then
                        local v91 = v22[l_Player_2];
                        if v91 then
                            v91[v89] = nil;
                        end;
                    end;
                    local v92 = v23[v89];
                    if not v92 then
                        v17("Attempting to remove connections from untracked AudioDeviceInput");
                        return;
                    else
                        v92.onPlayerChanged:Disconnect();
                        v23[v89] = nil;
                        return;
                    end;
                else
                    if v89.Player then
                        v22[v89.Player][v89] = nil;
                    end;
                    local v93 = v23[v89];
                    if not v93 then
                        v17("Attempting to remove connections from untracked AudioDeviceInput");
                        return;
                    else
                        v93.onPlayerChanged:Disconnect();
                        v23[v89] = nil;
                    end;
                end;
            end;
        end);
    end;
    l_RemoteEvent_0.OnServerEvent:Connect(function(v94, v95) --[[ Line: 264 ]]
        -- upvalues: v22 (copy), v17 (copy)
        local v96 = v22[v94];
        if v96 then
            v17("Setting", v94, "to", v95);
            for v97, _ in v96 do
                v97.Active = v95;
            end;
            return;
        else
            v17("Attempting to set Active property for user", v94, "without saved AudioDeviceInput");
            return;
        end;
    end);
end;
if v11 then
    local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
    l_UnreliableRemoteEvent_0.Name = "SendLikelySpeakingUsers";
    l_UnreliableRemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v100 = {};
    local v101 = {};
    v17("Setting up likely speaking users");
    l_Players_0.PlayerAdded:Connect(function(v102) --[[ Line: 285 ]]
        -- upvalues: l_VoiceChatService_0 (copy), v101 (copy), v17 (copy), v100 (copy), l_UnreliableRemoteEvent_0 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 286 ]]
            -- upvalues: l_VoiceChatService_0 (ref), v102 (copy)
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v102.UserId);
        end);
        v101[v102.UserId] = true;
        if l_status_2 and l_result_2 then
            v17("Sending likely speaking user for ", v102.Name);
            v100[v102.UserId] = true;
            l_UnreliableRemoteEvent_0:FireAllClients(v100);
            return;
        else
            if not l_status_2 then
                v17("Error getting voice enabled status: ", l_result_2, " for ", v102.Name);
            end;
            return;
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function(v105) --[[ Line: 299 ]]
        -- upvalues: v100 (copy), v101 (copy)
        v100[v105.UserId] = nil;
        v101[v105.UserId] = nil;
    end);
    if v12 then
        v17("Setting Up ReceiveLikelySpeakingUsers");
        local l_RemoteEvent_1 = Instance.new("RemoteEvent");
        l_RemoteEvent_1.Name = "ReceiveLikelySpeakingUsers";
        l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
        l_RemoteEvent_1.OnServerEvent:Connect(function(v107) --[[ Line: 311 ]]
            -- upvalues: v17 (copy), v101 (copy), l_UnreliableRemoteEvent_0 (copy), v100 (copy)
            v17("Got Ping Request from ", v107.Name);
            if v101[v107.UserId] then
                v101[v107.UserId] = nil;
                l_UnreliableRemoteEvent_0:FireClient(v107, v100);
                v17("Sending likely speaking users to ", v107.Name);
            end;
        end);
    end;
end;