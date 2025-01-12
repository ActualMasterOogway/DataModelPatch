local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v3 = require(l_script_FirstAncestor_0.Components.UnibarSongbird);
local v4 = require(l_script_FirstAncestor_0.Hooks.useCurrentSong);
local l_ShimmerPanel_0 = v2.App.Loading.ShimmerPanel;
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUnverifiedMusicState);
return function() --[[ Line: 12 ]] --[[ Name: UnibarSongbirdWrapper ]]
    -- upvalues: v4 (copy), v6 (copy), v1 (copy), v3 (copy), l_ShimmerPanel_0 (copy)
    local v7 = v4();
    if v6() then
        if v7 then
            return v1.createElement(v3, {
                albumArt = v7.metadata.AlbumArt, 
                artist = v7.metadata.Artist, 
                isFavorited = false, 
                title = v7.metadata.Title
            });
        else
            return v1.createElement(l_ShimmerPanel_0, {
                Size = UDim2.fromScale(1, 1)
            });
        end;
    elseif v7.metadata then
        return v1.createElement(v3, {
            albumArt = v7.metadata.AlbumArt, 
            artist = v7.metadata.Artist, 
            isFavorited = false, 
            title = v7.metadata.Title
        });
    else
        return v1.createElement(l_ShimmerPanel_0, {
            Size = UDim2.fromScale(1, 1)
        });
    end;
end;