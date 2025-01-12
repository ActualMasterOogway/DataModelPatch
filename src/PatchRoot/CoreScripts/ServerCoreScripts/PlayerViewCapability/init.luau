local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999);
assert(v2 ~= nil, "RobloxGui should exist");
local v3 = require(v2.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled);
local v4 = require(v2.Modules.Common.Flags.GetFFlagPlayerViewValidateRequesteeEnabled);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "RequestDeviceCameraOrientationCapability";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteEvent_0.OnServerEvent:Connect(function(v6, v7) --[[ Line: 15 ]]
    -- upvalues: l_RemoteEvent_0 (copy)
    local l_OsPlatform_0 = v7.OsPlatform;
    local l_l_RemoteEvent_0_0 = l_RemoteEvent_0;
    local l_v6_0 = v6;
    local l_v7_0 = v7;
    local v12 = true;
    if l_OsPlatform_0 ~= "iOS" then
        v12 = l_OsPlatform_0 == "Android";
    end;
    l_l_RemoteEvent_0_0:FireClient(l_v6_0, l_v7_0, v12);
end);
if v3() then
    local l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "RequestDeviceCameraCFrame";
    l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
    local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
    l_UnreliableRemoteEvent_0.Name = "ReplicateDeviceCameraCFrame";
    l_UnreliableRemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v15 = {};
    if v4() then
        l_Players_0.PlayerRemoving:Connect(function(v16) --[[ Line: 36 ]]
            -- upvalues: v15 (copy)
            v15[tostring(v16.UserId)] = nil;
        end);
    end;
    l_RemoteEvent_1.OnServerEvent:Connect(function(v17, v18) --[[ Line: 42 ]]
        -- upvalues: v4 (copy), l_Players_0 (copy), v15 (copy), l_RemoteEvent_1 (copy)
        if v4() then
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v18);
            if not l_l_Players_0_PlayerByUserId_0 then
                return;
            else
                local v20 = tostring(v18);
                if not v15[v20] then
                    v15[v20] = {};
                end;
                v15[v20][tostring(v17.UserId)] = os.clock();
                l_RemoteEvent_1:FireClient(l_l_Players_0_PlayerByUserId_0);
                return;
            end;
        else
            local v21 = tostring(v18);
            if not v15[v21] then
                v15[v21] = {};
            end;
            v15[v21][tostring(v17.UserId)] = os.clock();
            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v18);
            if l_l_Players_0_PlayerByUserId_1 then
                l_RemoteEvent_1:FireClient(l_l_Players_0_PlayerByUserId_1);
            end;
            return;
        end;
    end);
    l_UnreliableRemoteEvent_0.OnServerEvent:Connect(function(v23, v24, v25) --[[ Line: 72 ]]
        -- upvalues: v15 (copy), l_Players_0 (copy), l_UnreliableRemoteEvent_0 (copy)
        local v26 = tostring(v23.UserId);
        if v15[v26] then
            local v27 = {};
            for v28, v29 in v15[v26] do
                if os.clock() - v29 > 5 then
                    table.insert(v27, v28);
                else
                    local v30 = tonumber(v28);
                    if v30 then
                        local l_l_Players_0_PlayerByUserId_2 = l_Players_0:GetPlayerByUserId(v30);
                        if l_l_Players_0_PlayerByUserId_2 then
                            l_UnreliableRemoteEvent_0:FireClient(l_l_Players_0_PlayerByUserId_2, v23, v24, v25);
                        end;
                    end;
                end;
            end;
            for _, v33 in v27 do
                v15[v26][v33] = nil;
            end;
        end;
    end);
end;