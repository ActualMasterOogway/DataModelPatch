local v0 = require(script.Parent.useTrackerMode);
return function() --[[ Line: 5 ]] --[[ Name: useCameraOn ]]
    -- upvalues: v0 (copy)
    local v1 = v0();
    local v2 = true;
    if v1 ~= Enum.TrackerMode.Video then
        v2 = v1 == Enum.TrackerMode.AudioVideo;
    end;
    return v2;
end;