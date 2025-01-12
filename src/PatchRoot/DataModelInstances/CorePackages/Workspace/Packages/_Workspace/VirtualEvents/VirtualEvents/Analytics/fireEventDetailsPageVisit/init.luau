local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.enums);
local v2 = require(script.Parent.sendEventDeferred);
return function(v3) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v1 (copy)
    v2(v1.AnalyticsEvent.EventDetailsPageVisit, v3);
end;