local v0 = require(script.Parent.getFFlagSongbirdUpdateMusicLoadingState);
game:DefineFastFlag("SongbirdUnverifiedMusicState", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("SongbirdUnverifiedMusicState") and v0();
end;