local l_SoundService_0 = game:GetService("SoundService");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v4 = game:DefineFastFlag("SoundServiceDefaultListenerLocation2", false);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function _() --[[ Line: 8 ]] --[[ Name: ShouldUseDefaultVoice ]]
    -- upvalues: l_SoundService_0 (copy), l_VoiceChatService_0 (copy)
    local v6 = false;
    if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default then
        v6 = false;
        if l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled then
            v6 = l_VoiceChatService_0.EnableDefaultVoice;
        end;
    end;
    return v6;
end;
local function _() --[[ Line: 14 ]] --[[ Name: ShouldUseCamera ]]
    -- upvalues: l_SoundService_0 (copy)
    return l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera;
end;
local function _() --[[ Line: 18 ]] --[[ Name: ShouldUseCharacter ]]
    -- upvalues: l_SoundService_0 (copy)
    return l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character;
end;
local function _() --[[ Line: 22 ]] --[[ Name: ShouldSpawnListener ]]
    -- upvalues: v4 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy)
    if not v4 then
        return false;
    elseif l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.None then
        return false;
    else
        return l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default and l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled and l_VoiceChatService_0.EnableDefaultVoice;
    end;
end;
local function _(v11, v12) --[[ Line: 32 ]] --[[ Name: WireUp ]]
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.SourceInstance = v11;
    l_Wire_0.TargetInstance = v12;
    l_Wire_0.Parent = v11;
    return l_Wire_0;
end;
local function _() --[[ Line: 40 ]] --[[ Name: GetMainOut ]]
    -- upvalues: l_SoundService_0 (copy)
    local l_l_SoundService_0_FirstChildWhichIsA_0 = l_SoundService_0:FindFirstChildWhichIsA("AudioDeviceOutput", true);
    if not l_l_SoundService_0_FirstChildWhichIsA_0 then
        local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
        l_AudioDeviceOutput_0.Parent = l_SoundService_0;
        l_l_SoundService_0_FirstChildWhichIsA_0 = l_AudioDeviceOutput_0;
    end;
    return l_l_SoundService_0_FirstChildWhichIsA_0;
end;
local function v18(v19) --[[ Line: 50 ]] --[[ Name: SpawnCharacterListener ]]
    -- upvalues: v18 (copy), l_SoundService_0 (copy), l_RunService_0 (copy)
    local l_PrimaryPart_0 = v19.PrimaryPart;
    if not l_PrimaryPart_0 then
        v19:GetPropertyChangedSignal("PrimaryPart"):Once(function() --[[ Line: 53 ]]
            -- upvalues: v18 (ref), v19 (copy)
            v18(v19);
        end);
        return;
    else
        local l_Attachment_0 = Instance.new("Attachment");
        local function v24() --[[ Line: 60 ]] --[[ Name: UpdateCFrame ]]
            -- upvalues: l_Attachment_0 (copy)
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if not l_CurrentCamera_0 then
                return;
            else
                local l_Rotation_0 = l_CurrentCamera_0.CFrame.Rotation;
                l_Attachment_0.WorldAxis = l_Rotation_0.XVector;
                l_Attachment_0.WorldSecondaryAxis = l_Rotation_0.YVector;
                return;
            end;
        end;
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if l_CurrentCamera_1 then
            local l_Rotation_1 = l_CurrentCamera_1.CFrame.Rotation;
            l_Attachment_0.WorldAxis = l_Rotation_1.XVector;
            l_Attachment_0.WorldSecondaryAxis = l_Rotation_1.YVector;
        end;
        l_CurrentCamera_1 = Instance.new("AudioListener");
        l_CurrentCamera_1.Parent = l_Attachment_0;
        l_Attachment_0.Parent = l_PrimaryPart_0;
        local l_l_SoundService_0_FirstChildWhichIsA_1 = l_SoundService_0:FindFirstChildWhichIsA("AudioDeviceOutput", true);
        if not l_l_SoundService_0_FirstChildWhichIsA_1 then
            local l_AudioDeviceOutput_1 = Instance.new("AudioDeviceOutput");
            l_AudioDeviceOutput_1.Parent = l_SoundService_0;
            l_l_SoundService_0_FirstChildWhichIsA_1 = l_AudioDeviceOutput_1;
        end;
        local l_l_l_SoundService_0_FirstChildWhichIsA_1_0 = l_l_SoundService_0_FirstChildWhichIsA_1;
        l_l_SoundService_0_FirstChildWhichIsA_1 = Instance.new("Wire");
        l_l_SoundService_0_FirstChildWhichIsA_1.SourceInstance = l_CurrentCamera_1;
        l_l_SoundService_0_FirstChildWhichIsA_1.TargetInstance = l_l_l_SoundService_0_FirstChildWhichIsA_1_0;
        l_l_SoundService_0_FirstChildWhichIsA_1.Parent = l_CurrentCamera_1;
        l_l_SoundService_0_FirstChildWhichIsA_1 = l_RunService_0.Heartbeat:Connect(v24);
        local v30 = nil;
        v30 = l_Attachment_0.AncestryChanged:Connect(function() --[[ Line: 80 ]]
            -- upvalues: l_Attachment_0 (copy), l_l_SoundService_0_FirstChildWhichIsA_1 (copy), v30 (ref)
            if not l_Attachment_0:IsDescendantOf(game) then
                l_l_SoundService_0_FirstChildWhichIsA_1:Disconnect();
                v30:Disconnect();
            end;
        end);
        return;
    end;
end;
local v31 = false;
local function v40() --[[ Line: 90 ]] --[[ Name: Initialize ]]
    -- upvalues: v4 (copy), l_SoundService_0 (copy), l_VoiceChatService_0 (copy), v31 (ref), l_LocalPlayer_0 (copy), v18 (copy)
    if not (not not v4 and not (l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.None) and (l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character or l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default and l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled and l_VoiceChatService_0.EnableDefaultVoice)) then
        return;
    elseif v31 then
        return;
    else
        if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Character then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                v18(l_Character_0);
            end;
            l_LocalPlayer_0.CharacterAdded:Connect(v18);
        elseif l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Camera then
            local l_l_SoundService_0_FirstChildWhichIsA_2 = l_SoundService_0:FindFirstChildWhichIsA("AudioDeviceOutput", true);
            if not l_l_SoundService_0_FirstChildWhichIsA_2 then
                local l_AudioDeviceOutput_2 = Instance.new("AudioDeviceOutput");
                l_AudioDeviceOutput_2.Parent = l_SoundService_0;
                l_l_SoundService_0_FirstChildWhichIsA_2 = l_AudioDeviceOutput_2;
            end;
            local l_l_l_SoundService_0_FirstChildWhichIsA_2_0 = l_l_SoundService_0_FirstChildWhichIsA_2;
            l_l_SoundService_0_FirstChildWhichIsA_2 = Instance.new("AudioListener");
            l_l_SoundService_0_FirstChildWhichIsA_2.Parent = workspace.CurrentCamera;
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = l_l_SoundService_0_FirstChildWhichIsA_2;
            l_Wire_1.TargetInstance = l_l_l_SoundService_0_FirstChildWhichIsA_2_0;
            l_Wire_1.Parent = l_l_SoundService_0_FirstChildWhichIsA_2;
        else
            local v37 = false;
            if l_SoundService_0.DefaultListenerLocation == Enum.ListenerLocation.Default then
                v37 = false;
                if l_VoiceChatService_0.UseAudioApi == Enum.AudioApiRollout.Enabled then
                    v37 = l_VoiceChatService_0.EnableDefaultVoice;
                end;
            end;
            if v37 then
                v37 = Instance.new("AudioListener");
                v37.Parent = workspace.CurrentCamera;
                local l_Wire_2 = Instance.new("Wire");
                l_Wire_2.Parent = v37;
                local l_AudioDeviceOutput_3 = Instance.new("AudioDeviceOutput");
                l_AudioDeviceOutput_3.Parent = l_Wire_2;
                l_Wire_2.SourceInstance = v37;
                l_Wire_2.TargetInstance = l_AudioDeviceOutput_3;
            end;
        end;
        v31 = true;
        return;
    end;
end;
v40();
l_SoundService_0:GetPropertyChangedSignal("DefaultListenerLocation"):Connect(v40);
l_VoiceChatService_0:GetPropertyChangedSignal("UseAudioApi"):Connect(v40);
l_VoiceChatService_0:GetPropertyChangedSignal("EnableDefaultVoice"):Connect(v40);