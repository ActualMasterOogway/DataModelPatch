local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Flags.GetFFlagGetClientReplicatorCheck);
local v2 = nil;
return function() --[[ Line: 6 ]] --[[ Name: getClientReplicator ]]
    -- upvalues: v2 (ref), v1 (copy)
    if v2 == nil then
        local l_game_Service_0 = game:FindService("NetworkClient");
        if l_game_Service_0 then
            v2 = l_game_Service_0:FindFirstChildOfClass("ClientReplicator");
        end;
    end;
    if v1() then
        if v2 and v2:IsDescendantOf(game) then
            return v2;
        else
            return nil;
        end;
    else
        return v2;
    end;
end;