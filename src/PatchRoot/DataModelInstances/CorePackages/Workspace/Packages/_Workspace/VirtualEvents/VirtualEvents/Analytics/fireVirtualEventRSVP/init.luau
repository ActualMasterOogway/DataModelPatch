local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.enums);
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(script.Parent.sendEventDeferred);
return function(v4) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v1 (copy)
    v3(v1.AnalyticsEvent.VirtualEventRSVP, v4);
end;