local v0 = {};
local l_initializeHeartbeatReporter_0 = require(script.Parent.HeartbeatReporter).initializeHeartbeatReporter;
local function v6(v2) --[[ Line: 22 ]] --[[ Name: averageFps ]]
    if #v2 == 0 then
        return 1e999;
    else
        local v3 = 0;
        for _, v5 in v2 do
            v3 = v3 + v5;
        end;
        return 1 / (v3 / #v2);
    end;
end;
v0.initializeFpsReporter = function() --[[ Line: 35 ]] --[[ Name: initializeFpsReporter ]]
    -- upvalues: l_initializeHeartbeatReporter_0 (copy), v6 (copy)
    return l_initializeHeartbeatReporter_0("FPS", v6);
end;
return v0;