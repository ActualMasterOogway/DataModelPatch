local l_Parent_0 = script:FindFirstAncestor("BlockingUtility").Parent;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Url_0 = require(l_Parent_0.Http).Url;
local v7 = require(l_Parent_0.AppCommonLib).rolloutByApplicationId(function() --[[ Line: 15 ]]
    return game:DefineFastInt("NewBlockingUtilityRollout_v3", 0);
end);
local v8 = {};
v8.__index = v8;
local v9 = nil;
spawn(function() --[[ Line: 26 ]]
    -- upvalues: v9 (ref), l_RobloxReplicatedStorage_0 (copy)
    v9 = l_RobloxReplicatedStorage_0:WaitForChild("UpdatePlayerBlockList", 1e999);
end);
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local v13 = false;
local l_BindableEvent_3 = Instance.new("BindableEvent");
local v15 = {};
local v16 = {};
local _ = function() --[[ Line: 39 ]] --[[ Name: getBlockedUserIdsFromBlockedList ]]
    -- upvalues: v15 (ref)
    local v17 = {};
    for v18, _ in v15 do
        table.insert(v17, v18);
    end;
    return v17;
end;
local function v25() --[[ Line: 47 ]] --[[ Name: getBlockedUserIds ]]
    -- upvalues: l_Players_0 (copy), v13 (ref), v15 (ref)
    if l_Players_0.LocalPlayer.UserId > 0 then
        local v21 = 0;
        while true do
            if v13 then
                local v22 = {};
                for v23, _ in v15 do
                    table.insert(v22, v23);
                end;
                return v22;
            else
                v21 = v21 + wait();
                if v21 > 5 then
                    return {};
                end;
            end;
        end;
    else
        return {};
    end;
end;
local function _(v26) --[[ Line: 64 ]] --[[ Name: isBlocked ]]
    -- upvalues: v15 (ref)
    if v15[v26] then
        return true;
    else
        return false;
    end;
end;
local function _(v28) --[[ Line: 71 ]] --[[ Name: isMuted ]]
    -- upvalues: v16 (copy)
    if v16[v28] ~= nil and v16[v28] == true then
        return true;
    else
        return false;
    end;
end;
local function v39(v30) --[[ Line: 78 ]] --[[ Name: BlockPlayerAsync ]]
    -- upvalues: l_Players_0 (copy), v15 (ref), l_BindableEvent_0 (copy), v9 (ref), v7 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_BindableEvent_1 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if v30 and l_LocalPlayer_0 ~= v30 then
        local l_UserId_0 = v30.UserId;
        if l_UserId_0 > 0 then
            if not (v15[l_UserId_0] and true or false) then
                v15[l_UserId_0] = true;
                l_BindableEvent_0:Fire(l_UserId_0, true);
                if v9 then
                    v9:FireServer(l_UserId_0, true);
                end;
                local v33 = nil;
                local v34 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 92 ]]
                    -- upvalues: v7 (ref), l_Url_0 (ref), v30 (copy), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                    local v35 = if v7() then l_Url_0.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(v30.UserId) .. "/block-user" else l_Url_0.ACCOUNT_SETTINGS_URL .. "v1/users/" .. tostring(v30.UserId) .. "/block";
                    local v36 = l_HttpRbxApiService_0:PostAsyncFullUrl(v35, "");
                    if v36 then
                        v36 = l_HttpService_0:JSONDecode(v36);
                        if v7() then
                            return v36;
                        else
                            return v36 and not v36.errors;
                        end;
                    else
                        return;
                    end;
                end);
                v33 = l_status_0;
                v34 = l_result_0;
                if v33 and v34 then
                    l_BindableEvent_1:Fire(l_UserId_0, true);
                end;
                return v33 and v34;
            else
                return true;
            end;
        end;
    end;
    return false;
end;
local function v48(v40) --[[ Line: 121 ]] --[[ Name: UnblockPlayerAsync ]]
    -- upvalues: v15 (ref), l_BindableEvent_0 (copy), v9 (ref), v7 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), l_BindableEvent_1 (copy)
    if v40 then
        local l_UserId_1 = v40.UserId;
        if v15[l_UserId_1] and true or false then
            v15[l_UserId_1] = nil;
            l_BindableEvent_0:Fire(l_UserId_1, false);
            if v9 then
                v9:FireServer(l_UserId_1, false);
            end;
            local v42 = nil;
            local v43 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 134 ]]
                -- upvalues: v7 (ref), l_Url_0 (ref), v40 (copy), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                local v44 = if v7() then l_Url_0.APIS_URL .. "user-blocking-api/v1/users/" .. tostring(v40.UserId) .. "/unblock-user" else l_Url_0.ACCOUNT_SETTINGS_URL .. "v1/users/" .. tostring(v40.UserId) .. "/unblock";
                local v45 = l_HttpRbxApiService_0:PostAsyncFullUrl(v44, "");
                if v45 then
                    v45 = l_HttpService_0:JSONDecode(v45);
                    return v45 and not v45.errors;
                else
                    return;
                end;
            end);
            v42 = l_status_1;
            v43 = l_result_1;
            if v42 and v43 then
                l_BindableEvent_1:Fire(l_UserId_1, false);
            end;
            return v42 and v43;
        else
            return true;
        end;
    else
        return false;
    end;
end;
local function v52(v49) --[[ Line: 163 ]] --[[ Name: AddPlayerToBlockList ]]
    -- upvalues: l_Players_0 (copy), v15 (ref), l_BindableEvent_0 (copy), v9 (ref), l_BindableEvent_1 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if v49 and l_LocalPlayer_1 ~= v49 then
        local l_UserId_2 = v49.UserId;
        if l_UserId_2 > 0 then
            if not (v15[l_UserId_2] and true or false) then
                v15[l_UserId_2] = true;
                l_BindableEvent_0:Fire(l_UserId_2, true);
                if v9 then
                    v9:FireServer(l_UserId_2, true);
                end;
                if l_BindableEvent_1 then
                    l_BindableEvent_1:Fire(l_UserId_2, true);
                end;
            end;
            return true;
        end;
    end;
    return false;
end;
local function v55(v53) --[[ Line: 191 ]] --[[ Name: RemovePlayerFromBlockList ]]
    -- upvalues: v15 (ref), l_BindableEvent_0 (copy), v9 (ref), l_BindableEvent_1 (copy)
    if v53 then
        local l_UserId_3 = v53.UserId;
        if v15[l_UserId_3] and true or false then
            v15[l_UserId_3] = nil;
            l_BindableEvent_0:Fire(l_UserId_3, false);
            if v9 then
                v9:FireServer(l_UserId_3, false);
            end;
            if l_BindableEvent_1 then
                l_BindableEvent_1:Fire(l_UserId_3, false);
            end;
        end;
        return true;
    else
        return false;
    end;
end;
local function v59(v56) --[[ Line: 213 ]] --[[ Name: MutePlayer ]]
    -- upvalues: l_Players_0 (copy), v16 (copy), l_BindableEvent_2 (copy)
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    if v56 and l_LocalPlayer_2 ~= v56 then
        local l_UserId_4 = v56.UserId;
        if l_UserId_4 > 0 and not (v16[l_UserId_4] ~= nil and v16[l_UserId_4] == true) then
            v16[l_UserId_4] = true;
            l_BindableEvent_2:Fire(l_UserId_4, true);
        end;
    end;
end;
local function v62(v60) --[[ Line: 226 ]] --[[ Name: UnmutePlayer ]]
    -- upvalues: v16 (copy), l_BindableEvent_2 (copy)
    if v60 then
        local l_UserId_5 = v60.UserId;
        v16[l_UserId_5] = nil;
        l_BindableEvent_2:Fire(l_UserId_5, false);
    end;
end;
local l_BindableEvent_4 = Instance.new("BindableEvent");
local l_BindableEvent_5 = Instance.new("BindableEvent");
local l_BindableEvent_6 = Instance.new("BindableEvent");
local l_BindableEvent_7 = Instance.new("BindableEvent");
l_BindableEvent_0.Event:Connect(function(v67, v68) --[[ Line: 241 ]] --[[ Name: blockedStatusChanged ]]
    -- upvalues: l_Players_0 (copy), l_BindableEvent_4 (copy), l_BindableEvent_5 (copy)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v67);
    if l_l_Players_0_PlayerByUserId_0 then
        if v68 then
            l_BindableEvent_4:Fire(l_l_Players_0_PlayerByUserId_0);
            return;
        else
            l_BindableEvent_5:Fire(l_l_Players_0_PlayerByUserId_0);
        end;
    end;
end);
l_BindableEvent_2.Event:Connect(function(v70, v71) --[[ Line: 254 ]] --[[ Name: muteStatusChanged ]]
    -- upvalues: l_Players_0 (copy), l_BindableEvent_6 (copy), l_BindableEvent_7 (copy)
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v70);
    if l_l_Players_0_PlayerByUserId_1 then
        if v71 then
            l_BindableEvent_6:Fire(l_l_Players_0_PlayerByUserId_1);
            return;
        else
            l_BindableEvent_7:Fire(l_l_Players_0_PlayerByUserId_1);
        end;
    end;
end);
l_StarterGui_0:RegisterGetCore("PlayerBlockedEvent", function() --[[ Line: 267 ]]
    -- upvalues: l_BindableEvent_4 (copy)
    return l_BindableEvent_4;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnblockedEvent", function() --[[ Line: 270 ]]
    -- upvalues: l_BindableEvent_5 (copy)
    return l_BindableEvent_5;
end);
l_StarterGui_0:RegisterGetCore("PlayerMutedEvent", function() --[[ Line: 273 ]]
    -- upvalues: l_BindableEvent_6 (copy)
    return l_BindableEvent_6;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnmutedEvent", function() --[[ Line: 276 ]]
    -- upvalues: l_BindableEvent_7 (copy)
    return l_BindableEvent_7;
end);
task.spawn(function() --[[ Line: 280 ]]
    -- upvalues: v15 (ref), v13 (ref), l_BindableEvent_3 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("SendPlayerBlockList", 1e999).OnClientEvent:Connect(function(v73) --[[ Line: 283 ]]
        -- upvalues: v15 (ref), v13 (ref), l_BindableEvent_3 (ref)
        local v74 = {};
        for v75, _ in v73 do
            v74[tonumber(v75)] = true;
        end;
        v15 = v74;
        v13 = true;
        l_BindableEvent_3:Fire();
    end);
end);
task.spawn(function() --[[ Line: 297 ]]
    -- upvalues: v15 (ref), l_BindableEvent_0 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdateLocalPlayerBlockList", 1e999).OnClientEvent:Connect(function(v77, v78) --[[ Line: 301 ]]
        -- upvalues: v15 (ref), l_BindableEvent_0 (ref)
        v15[v77] = v78;
        l_BindableEvent_0:Fire(v77, v78);
    end);
end);
v8.BlockPlayerAsync = function(_, v80) --[[ Line: 307 ]] --[[ Name: BlockPlayerAsync ]]
    -- upvalues: v39 (copy)
    return (v39(v80));
end;
v8.UnblockPlayerAsync = function(_, v82) --[[ Line: 311 ]] --[[ Name: UnblockPlayerAsync ]]
    -- upvalues: v48 (copy)
    return (v48(v82));
end;
v8.MutePlayer = function(_, v84) --[[ Line: 315 ]] --[[ Name: MutePlayer ]]
    -- upvalues: v59 (copy)
    return v59(v84);
end;
v8.UnmutePlayer = function(_, v86) --[[ Line: 319 ]] --[[ Name: UnmutePlayer ]]
    -- upvalues: v62 (copy)
    return v62(v86);
end;
v8.IsPlayerBlockedByUserId = function(_, v88) --[[ Line: 323 ]] --[[ Name: IsPlayerBlockedByUserId ]]
    -- upvalues: v15 (ref)
    if v15[v88] then
        return true;
    else
        return false;
    end;
end;
v8.GetBlockedStatusChangedEvent = function(_) --[[ Line: 327 ]] --[[ Name: GetBlockedStatusChangedEvent ]]
    -- upvalues: l_BindableEvent_0 (copy)
    return l_BindableEvent_0.Event;
end;
v8.GetAfterBlockedStatusChangedEvent = function(_) --[[ Line: 333 ]] --[[ Name: GetAfterBlockedStatusChangedEvent ]]
    -- upvalues: l_BindableEvent_1 (copy)
    return l_BindableEvent_1.Event;
end;
v8.GetMutedStatusChangedEvent = function(_) --[[ Line: 337 ]] --[[ Name: GetMutedStatusChangedEvent ]]
    -- upvalues: l_BindableEvent_2 (copy)
    return l_BindableEvent_2.Event;
end;
v8.IsPlayerMutedByUserId = function(_, v93) --[[ Line: 341 ]] --[[ Name: IsPlayerMutedByUserId ]]
    -- upvalues: v16 (copy)
    if v16[v93] ~= nil and v16[v93] == true then
        return true;
    else
        return false;
    end;
end;
v8.GetBlockedUserIdsAsync = function(_) --[[ Line: 345 ]] --[[ Name: GetBlockedUserIdsAsync ]]
    -- upvalues: v25 (copy)
    return (v25());
end;
v8.AddPlayerToBlockList = function(_, v96) --[[ Line: 349 ]] --[[ Name: AddPlayerToBlockList ]]
    -- upvalues: v52 (copy)
    return (v52(v96));
end;
v8.RemovePlayerFromBlockList = function(_, v98) --[[ Line: 353 ]] --[[ Name: RemovePlayerFromBlockList ]]
    -- upvalues: v55 (copy)
    return (v55(v98));
end;
return v8;