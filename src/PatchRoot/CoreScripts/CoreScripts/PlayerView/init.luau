local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_PlayerViewService_0 = game:GetService("PlayerViewService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Flags.GetFFlagPlayerViewRemoteEventTimeoutEnabled);
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFIntPlayerViewRemoteEventTimeout);
if v4() then
    local v6 = v5();
    local v7 = l_RobloxReplicatedStorage_0:WaitForChild("RequestDeviceCameraCFrame", v6);
    local v8 = l_RobloxReplicatedStorage_0:WaitForChild("ReplicateDeviceCameraCFrame", v6);
    local l_game_EngineFeature_0 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
    if v7 and v8 then
        v8.OnClientEvent:Connect(function(v10, v11, v12) --[[ Line: 21 ]]
            -- upvalues: l_game_EngineFeature_0 (copy), l_PlayerViewService_0 (copy)
            if l_game_EngineFeature_0 then
                l_PlayerViewService_0:UpdateDeviceCFrame(v10, v11, v12);
            end;
        end);
        v7.OnClientEvent:Connect(function() --[[ Line: 26 ]]
            -- upvalues: l_game_EngineFeature_0 (copy), l_PlayerViewService_0 (copy)
            if l_game_EngineFeature_0 then
                l_PlayerViewService_0:OnCameraCFrameReplicationRequest();
            end;
        end);
        return;
    else
        warn("PlayerViewService failed to initialize.");
        return;
    end;
else
    local l_RequestDeviceCameraCFrame_0 = l_RobloxReplicatedStorage_0:WaitForChild("RequestDeviceCameraCFrame");
    local l_ReplicateDeviceCameraCFrame_0 = l_RobloxReplicatedStorage_0:WaitForChild("ReplicateDeviceCameraCFrame");
    local l_game_EngineFeature_1 = game:GetEngineFeature("PlayerViewRemoteEventSupport");
    l_ReplicateDeviceCameraCFrame_0.OnClientEvent:Connect(function(v16, v17, v18) --[[ Line: 42 ]]
        -- upvalues: l_game_EngineFeature_1 (copy), l_PlayerViewService_0 (copy)
        if l_game_EngineFeature_1 then
            l_PlayerViewService_0:UpdateDeviceCFrame(v16, v17, v18);
        end;
    end);
    l_RequestDeviceCameraCFrame_0.OnClientEvent:Connect(function() --[[ Line: 47 ]]
        -- upvalues: l_game_EngineFeature_1 (copy), l_PlayerViewService_0 (copy)
        if l_game_EngineFeature_1 then
            l_PlayerViewService_0:OnCameraCFrameReplicationRequest();
        end;
    end);
    return;
end;