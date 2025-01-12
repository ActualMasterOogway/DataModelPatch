local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactSceneUnderstanding);
local v5 = require(l_script_FirstAncestor_0.Requests.getAudioMetadataAsync);
local v6 = require(l_script_FirstAncestor_0.Hooks.useAudioMetadata);
local _ = require(l_script_FirstAncestor_0.types);
local v8 = require(l_script_FirstAncestor_0.logger);
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFixMovementCausingUIFlickering);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFasterUpdatesBetweenMusicChanges);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUnverifiedMusicState);
local l_useMemo_0 = v2.useMemo;
local l_useAsync_0 = v3.useAsync;
local l_useAudibleSounds_0 = v4.useAudibleSounds;
return function() --[[ Line: 25 ]] --[[ Name: useCurrentSong ]]
    -- upvalues: l_useAudibleSounds_0 (copy), v9 (copy), l_useMemo_0 (copy), v1 (copy), v10 (copy), v6 (copy), l_useAsync_0 (copy), v5 (copy), v8 (copy), v11 (copy)
    local v15 = l_useAudibleSounds_0();
    local v17 = if v9() then l_useMemo_0(function() --[[ Line: 33 ]]
        -- upvalues: v1 (ref), v15 (copy)
        return v1.List.filter(v15, function(v16) --[[ Line: 34 ]]
            return v16.SoundId:match("rbxassetid://");
        end);
    end, {
        v15
    }) else v15;
    local v19 = if v10() then l_useMemo_0(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v17 (copy)
        return v1.List.map(v17, function(v18) --[[ Line: 42 ]]
            return v18.SoundId;
        end);
    end, {
        v17
    }) else nil;
    local v22 = if v10() then v6(v19) else l_useAsync_0(function() --[[ Line: 50 ]]
        -- upvalues: v1 (ref), v17 (copy), v5 (ref)
        local v21 = v1.List.map(v17, function(v20) --[[ Line: 51 ]]
            return v20.SoundId;
        end);
        return v5(v21);
    end, {
        v17
    });
    local v31 = if v10() then l_useMemo_0(function() --[[ Line: 59 ]]
        -- upvalues: v17 (copy), v22 (copy), v8 (ref), v11 (ref)
        for _, v24 in v17 do
            local v25 = v24.SoundId:match("(%d+)$");
            local v26 = v22.getByAssetId(v25);
            local v27 = true;
            if not v26 then
                v8:warning((("no metadata found for audio (AssetId %*, Instance %*)"):format(v25, v24)));
            elseif v26.AudioType == Enum.AudioSubType.Music then
                v8:debug((("%* is most audible (AssetID %*). checking if it meets criteria..."):format(v26.Title, v26.AssetId)));
                if v11() then
                    if not v26.RecordingCode or v26.RecordingCode == "" then
                        v8:debug("{metadata.Title} does not meet criteria (no recording code found)");
                        v27 = false;
                    end;
                    if v27 then
                        v8:info((("%* meets criteria"):format(v26.Title)));
                    end;
                elseif not v26.RecordingCode or v26.RecordingCode == "" then
                    v8:debug("no recording code found, skipping...");
                    continue;
                else
                    v8:info((("song %* meets criteria"):format(v26.Title)));
                end;
                return {
                    sound = v24, 
                    metadata = v26, 
                    meetsCriteria = v27
                };
            else
                v8:debug((("%* is most audible but not music. skipping..."):format(v26.Title)));
            end;
        end;
        if v11() then
            return nil;
        else
            return {};
        end;
    end, {
        v22.getByAssetId, 
        v17
    }) else l_useMemo_0(function() --[[ Line: 110 ]]
        -- upvalues: v22 (copy), v8 (ref), v17 (copy)
        if v22.status == "ok" then
            for v28, v29 in v22.value do
                if v29.AudioType == Enum.AudioSubType.Music then
                    v8:debug((("song %* is most audible (AssetID %*). checking if it meets criteria..."):format(v29.Title, v29.AssetId)));
                    if not v29.RecordingCode or v29.RecordingCode == "" then
                        v8:debug("no recording code found, skipping...");
                    else
                        local v30 = v17[v28];
                        if not v30 then
                            v8:warning((("failed to match metadata with AssetId %* to an audible sound at index %*"):format(v29.AssetId, v28)));
                        elseif not v30.SoundId:match(v29.AssetId) then
                            v8:warning((("failed to match AssetId from metadata (%*) to SoundId (%*)"):format(v29.AssetId, v30.SoundId)));
                        else
                            v8:info((("song %* meets criteria"):format(v29.Title)));
                            return {
                                sound = v30, 
                                metadata = v29
                            };
                        end;
                    end;
                end;
            end;
        end;
        return {};
    end, {
        v22, 
        v17
    });
    if v11() then
        return v31;
    else
        return {
            sound = v31.sound, 
            metadata = v31.metadata
        };
    end;
end;