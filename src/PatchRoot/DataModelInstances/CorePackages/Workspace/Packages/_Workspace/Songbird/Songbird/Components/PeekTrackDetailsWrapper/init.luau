local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.TrackDetails);
local v3 = require(l_script_FirstAncestor_0.Hooks.useFirstSongForComponentLifetime);
return function() --[[ Line: 7 ]] --[[ Name: PeekTrackDetailsWrapper ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v4 = v3();
    if v4 and v4.metadata then
        return v1.createElement(v2, {
            artistName = v4.metadata.Artist, 
            trackName = v4.metadata.Title, 
            size = UDim2.fromScale(1, 1)
        });
    else
        return nil;
    end;
end;