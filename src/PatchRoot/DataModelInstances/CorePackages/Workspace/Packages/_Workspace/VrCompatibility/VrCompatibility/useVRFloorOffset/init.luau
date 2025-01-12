local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.React);
local l_useExternalEvent_0 = require(l_Parent_0.UIBlox).Core.Hooks.useExternalEvent;
local v4 = require(script.Parent.getVRFloorOffset);
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v4 (copy), l_useExternalEvent_0 (copy), l_VRService_0 (copy)
    local v5, v6 = v2.useState(v4());
    l_useExternalEvent_0(l_VRService_0.UserCFrameChanged, function(v7) --[[ Line: 15 ]]
        -- upvalues: v6 (copy), v4 (ref)
        if v7 == Enum.UserCFrame.Floor then
            v6(v4());
        end;
    end);
    return v5;
end;