local v0 = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999);
local v1 = require(v0.Modules.Common.Constants);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v3 = game:DefineFastFlag("GetJoinDataRemoteFunctionEnabled", false);
local l_RemoteFunction_0 = Instance.new("RemoteFunction");
l_RemoteFunction_0.Name = "GetServerType";
l_RemoteFunction_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteFunction_0.OnServerInvoke = function() --[[ Line: 13 ]] --[[ Name: getServerType ]]
    -- upvalues: v1 (copy)
    if game.PrivateServerId ~= "" then
        if game.PrivateServerOwnerId ~= 0 then
            return v1.VIP_SERVER;
        else
            return v1.RESERVED_SERVER;
        end;
    else
        return v1.STANDARD_SERVER;
    end;
end;
if v3 then
    local l_RemoteFunction_1 = Instance.new("RemoteFunction");
    l_RemoteFunction_1.Name = "GetJoinData";
    l_RemoteFunction_1.Parent = l_RobloxReplicatedStorage_0;
    l_RemoteFunction_1.OnServerInvoke = function(v6) --[[ Line: 33 ]] --[[ Name: getJoinData ]]
        return v6:GetJoinData();
    end;
end;