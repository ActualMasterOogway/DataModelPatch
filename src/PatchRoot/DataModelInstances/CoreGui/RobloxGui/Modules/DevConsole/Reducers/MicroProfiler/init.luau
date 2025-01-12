local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.SetRCCProfilerState);
return function(v2, v3) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v4 = v2 or {
        waitingForRecording = false, 
        lastFileOutputLocation = ""
    };
    if v3.type == v1.name then
        local v5 = {
            waitingForRecording = v3.waitingForRecording, 
            lastFileOutputLocation = v3.lastFileOutputLocation
        };
        return (v0.JoinDictionaries(v4, v5));
    else
        return v4;
    end;
end;