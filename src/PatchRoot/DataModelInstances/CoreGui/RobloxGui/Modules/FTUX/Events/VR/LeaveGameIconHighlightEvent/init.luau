local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = require(script.Parent.Parent.EventType);
local v2 = require(l_RobloxGui_0.Modules.VR.VRHub);
return {
    Name = "LeaveGameIconHighlightEvent", 
    StartEvent = function() --[[ Line: 17 ]] --[[ Name: StartEvent ]]
        -- upvalues: v2 (copy)
        v2:SetShowHighlightedLeaveGameIconToggled(true);
    end, 
    StopEvent = function() --[[ Line: 21 ]] --[[ Name: StopEvent ]]
        -- upvalues: v2 (copy)
        v2:SetShowHighlightedLeaveGameIconToggled(false);
    end
};