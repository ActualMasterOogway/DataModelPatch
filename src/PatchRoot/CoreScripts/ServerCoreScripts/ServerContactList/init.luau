local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_SocialService_0 = game:GetService("SocialService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.Common.Url);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "ContactListInvokeIrisInvite";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteEvent_0.OnServerEvent:Connect(function(v10, v11, v12, v13, v14, v15) --[[ Line: 16 ]]
    -- upvalues: l_SocialService_0 (copy)
    l_SocialService_0:InvokeIrisInvite(v10, v11, {
        {
            userId = v10.UserId, 
            combinedName = v10.DisplayName, 
            muted = v14, 
            camEnabled = v15
        }, 
        {
            userId = v12, 
            combinedName = v13
        }
    });
end);
local l_RemoteEvent_1 = Instance.new("RemoteEvent");
l_RemoteEvent_1.Name = "ContactListIrisInviteTeleport";
l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
local v17 = {};
l_Players_0.PlayerRemoving:Connect(function(v18) --[[ Line: 31 ]]
    -- upvalues: v17 (copy)
    v17[v18.UserId] = nil;
end);
l_RemoteEvent_1.OnServerEvent:Connect(function(v19, v20, v21, v22) --[[ Line: 35 ]]
    -- upvalues: v17 (copy), l_TeleportService_0 (copy)
    local v23 = v17[v19.UserId];
    if v23 ~= nil and v23 > 5 then
        return;
    else
        if v23 == nil then
            v17[v19.UserId] = 1;
        else
            v17[v19.UserId] = v23 + 1;
        end;
        if typeof(v21) ~= "string" or #v21 > 1000 or typeof(v22) ~= "string" or #v22 > 1000 then
            return;
        else
            local l_TeleportOptions_0 = Instance.new("TeleportOptions");
            if v22 ~= nil then
                l_TeleportOptions_0.ReservedServerAccessCode = v22;
            else
                l_TeleportOptions_0.ServerInstanceId = v21;
            end;
            l_TeleportService_0:TeleportAsync(v20, {
                v19
            }, l_TeleportOptions_0);
            return;
        end;
    end;
end);
local l_RemoteEvent_2 = Instance.new("RemoteEvent");
l_RemoteEvent_2.Name = "UpdateCurrentCall";
l_RemoteEvent_2.Parent = l_RobloxReplicatedStorage_0;
local v26 = nil;
local v27 = {};
local function v35() --[[ Line: 80 ]] --[[ Name: enforceCallParticipants ]]
    -- upvalues: v26 (ref), l_Players_0 (copy)
    if v26 ~= nil then
        local v28 = false;
        for _, v30 in pairs(l_Players_0:GetPlayers()) do
            local v31 = tostring(v30.UserId);
            if not (table.find(v26.participants, v31) ~= nil) then
                v28 = true;
                break;
            end;
        end;
        if v28 then
            for _, v33 in pairs(l_Players_0:GetPlayers()) do
                local v34 = tostring(v33.UserId);
                if table.find(v26.participants, v34) ~= nil then
                    v33:Kick();
                end;
            end;
            v26 = nil;
        end;
    end;
end;
local _ = function(v36) --[[ Line: 109 ]] --[[ Name: terminateCall ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    local l_status_0, _ = pcall(function() --[[ Line: 110 ]]
        -- upvalues: v8 (ref), l_HttpService_0 (ref), v36 (copy), l_HttpRbxApiService_0 (ref)
        local v37 = v8.APIS_URL .. "call/v1/force-terminate-call-rcc";
        local v38 = l_HttpService_0:JSONEncode({
            callId = v36
        });
        local v39 = l_HttpRbxApiService_0:PostAsyncFullUrl(v37, v38);
        return l_HttpService_0:JSONDecode(v39);
    end);
    return l_status_0;
end;
local function v46(v43) --[[ Line: 122 ]] --[[ Name: sanityCheckParticipants ]]
    if typeof(v43) ~= "table" or v43 == nil or #v43 ~= 2 then
        return false;
    else
        for _, v45 in ipairs(v43) do
            if typeof(v45) ~= "string" or #v45 > 50 or tonumber(v45) == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v59(v47, v48, v49) --[[ Line: 135 ]] --[[ Name: validateCall ]]
    -- upvalues: v46 (copy), v8 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    if typeof(v48) ~= "string" or #v48 > 50 or not v46(v49) then
        return 400;
    else
        local l_status_1, _ = pcall(function() --[[ Line: 144 ]]
            -- upvalues: v8 (ref), v49 (copy), v48 (copy), v47 (copy), l_HttpService_0 (ref), l_HttpRbxApiService_0 (ref)
            local v50 = v8.APIS_URL .. "call/v1/verify-valid-call";
            local v51 = {};
            for v52, v53 in ipairs(v49) do
                v51[v52] = tonumber(v53);
            end;
            local v54 = {
                callId = v48, 
                userId = v47.UserId, 
                instanceId = game.JobId, 
                callParticipants = v51
            };
            local v55 = l_HttpService_0:JSONEncode(v54);
            local v56 = l_HttpRbxApiService_0:PostAsyncFullUrl(v50, v55);
            return l_HttpService_0:JSONDecode(v56);
        end);
        if l_status_1 then
            return 200;
        else
            return 400;
        end;
    end;
end;
l_RemoteEvent_2.OnServerEvent:Connect(function(v60, v61) --[[ Line: 169 ]]
    -- upvalues: v27 (copy), v59 (copy), v26 (ref), v8 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v35 (copy)
    if v27[v60.UserId] ~= nil and v27[v60.UserId] > 10 then
        return;
    else
        if v27[v60.UserId] ~= nil then
            v27[v60.UserId] = v27[v60.UserId] + 1;
        else
            v27[v60.UserId] = 1;
        end;
        local v62 = true;
        if v61 ~= nil then
            v62 = v59(v60, v61.callId, v61.participants) == 200;
        end;
        if not v62 then
            v60:Kick();
            return;
        else
            if v26 ~= nil and v61 ~= nil and v26.callId ~= v61.callId then
                local l_callId_0 = v26.callId;
                local _, _ = pcall(function() --[[ Line: 110 ]]
                    -- upvalues: v8 (ref), l_HttpService_0 (ref), l_callId_0 (copy), l_HttpRbxApiService_0 (ref)
                    local v64 = v8.APIS_URL .. "call/v1/force-terminate-call-rcc";
                    local v65 = l_HttpService_0:JSONEncode({
                        callId = l_callId_0
                    });
                    local v66 = l_HttpRbxApiService_0:PostAsyncFullUrl(v64, v65);
                    return l_HttpService_0:JSONDecode(v66);
                end);
                v35();
            end;
            v26 = v61;
            v35();
            return;
        end;
    end;
end);
l_Players_0.PlayerAdded:Connect(function(_) --[[ Line: 206 ]]
    -- upvalues: v35 (copy)
    v35();
end);
l_Players_0.PlayerRemoving:Connect(function(v70) --[[ Line: 210 ]]
    -- upvalues: v27 (copy), v26 (ref), v8 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    v27[v70.UserId] = nil;
    if v26 ~= nil then
        local v71 = tostring(v70.UserId);
        if table.find(v26.participants, v71) ~= nil then
            local l_callId_1 = v26.callId;
            local l_status_3, _ = pcall(function() --[[ Line: 110 ]]
                -- upvalues: v8 (ref), l_HttpService_0 (ref), l_callId_1 (copy), l_HttpRbxApiService_0 (ref)
                local v73 = v8.APIS_URL .. "call/v1/force-terminate-call-rcc";
                local v74 = l_HttpService_0:JSONEncode({
                    callId = l_callId_1
                });
                local v75 = l_HttpRbxApiService_0:PostAsyncFullUrl(v73, v74);
                return l_HttpService_0:JSONDecode(v75);
            end);
            if l_status_3 then
                v26 = nil;
            end;
        end;
    end;
end);