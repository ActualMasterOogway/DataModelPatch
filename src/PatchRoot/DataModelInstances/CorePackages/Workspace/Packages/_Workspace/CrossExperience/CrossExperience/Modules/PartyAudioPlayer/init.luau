local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = game:DefineFastInt("PartyVoiceAudioFaderVolumePerc", 100);
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v7 = {
        audioPlayers = {}, 
        isInitialized = false, 
        sfxAudioFader = nil, 
        onPartyVoiceVolumeChangedSignal = nil
    };
    setmetatable(v7, v6);
    return v7;
end;
v6.addSound = function(v8, v9, v10) --[[ Line: 26 ]] --[[ Name: addSound ]]
    local l_AudioPlayer_0 = Instance.new("AudioPlayer");
    l_AudioPlayer_0.Parent = workspace;
    l_AudioPlayer_0.AssetId = v10;
    local l_Wire_0 = Instance.new("Wire");
    l_Wire_0.Parent = workspace;
    l_Wire_0.SourceInstance = l_AudioPlayer_0;
    l_Wire_0.TargetInstance = v8.sfxAudioFader;
    v8.audioPlayers[v9] = l_AudioPlayer_0;
end;
v6.initialize = function(v13) --[[ Line: 40 ]] --[[ Name: initialize ]]
    -- upvalues: v5 (copy), l_ReplicatedStorage_0 (copy), l_game_EngineFeature_0 (copy), l_UserGameSettings_0 (copy)
    if v5 ~= 100 then
        l_ReplicatedStorage_0:WaitForChild("AudioFader").Volume = v5 / 100;
    end;
    local l_AudioDeviceOutput_0 = Instance.new("AudioDeviceOutput");
    l_AudioDeviceOutput_0.Parent = workspace;
    local l_AudioFader_0 = Instance.new("AudioFader");
    l_AudioFader_0.Parent = workspace;
    if v5 ~= 100 then
        l_AudioFader_0.Volume = v5 / 100;
    end;
    local l_Wire_1 = Instance.new("Wire");
    l_Wire_1.Parent = workspace;
    l_Wire_1.SourceInstance = l_AudioFader_0;
    l_Wire_1.TargetInstance = l_AudioDeviceOutput_0;
    v13.sfxAudioFader = l_AudioFader_0;
    v13:addSound("join", "rbxassetid://87296803139875");
    v13:addSound("leave", "rbxassetid://108128059974752");
    v13.isInitialized = true;
    if l_game_EngineFeature_0 then
        v13.onPartyVoiceVolumeChangedSignal = l_UserGameSettings_0:GetPropertyChangedSignal("PartyVoiceVolume"):Connect(function() --[[ Line: 69 ]]
            -- upvalues: v13 (copy)
            v13:playSound("join");
        end);
    end;
end;
v6.playSound = function(v17, v18) --[[ Line: 75 ]] --[[ Name: playSound ]]
    if not v17.isInitialized then
        v17:initialize();
    end;
    if not v17.isInitialized or not v17.audioPlayers[v18] then
        return;
    else
        v17.audioPlayers[v18].TimePosition = 0;
        v17.audioPlayers[v18]:Play();
        return;
    end;
end;
v6.disconnect = function(v19) --[[ Line: 88 ]] --[[ Name: disconnect ]]
    if v19.onPartyVoiceVolumeChangedSignal then
        v19.onPartyVoiceVolumeChangedSignal:Disconnect();
    end;
end;
v6.default = v6.new();
return v6;