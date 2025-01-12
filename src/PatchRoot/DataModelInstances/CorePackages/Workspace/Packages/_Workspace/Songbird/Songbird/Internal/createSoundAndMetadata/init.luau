local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local _ = require(l_script_FirstAncestor_0.types);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: createSoundAndMetadata ]]
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.SoundId = ("rbxassetid://%*"):format(v2);
    local v5 = {
        AssetId = ("%*"):format(v2), 
        Title = "Sample Title", 
        Artist = "Sample Artist", 
        Duration = 120, 
        RecordingCode = ("recording-code-%*"):format(v2), 
        AudioType = v3
    };
    return {
        sound = l_Sound_0, 
        metadata = v5
    };
end;