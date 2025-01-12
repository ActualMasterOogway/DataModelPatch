local v0 = require(script.Parent.FFlagEnableEventsRedesignExperiment);
local v1 = game:DefineFastString("EventsRedesignAllowList", "");
local v2 = nil;
if v0 then
    local v3 = {};
    for v4 in v1:gmatch("(%d+)") do
        v3[v4] = true;
    end;
    v2 = v3;
end;
return v2;