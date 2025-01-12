local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local _ = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v10 = require(l_RobloxGui_0.Modules.Common.Url);
game:DefineFastFlag("EnableSetUserBlocklistInitialized", false);
local v11 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled);
local v12 = require(l_RobloxGui_0.Modules.Common.Flags.FStringRccInExperienceNameEnabledAllowList);
local v13 = game:DefineFastFlag("UseNewDirectChatAPI", false);
local v14 = {};
local v15 = {
    Admin = {
        GroupId = 1200769
    }, 
    Intern = {
        GroupId = 2868472, 
        GroupRank = 100
    }, 
    Star = {
        GroupId = 4199740
    }, 
    SpanishLocalizationExpert = {
        GroupId = 4265462, 
        GroupRank = 252
    }, 
    BrazilianLocalizationExpert = {
        GroupId = 4265456, 
        GroupRank = 252
    }, 
    FrenchLocalizationExpert = {
        GroupId = 4265443, 
        GroupRank = 252
    }, 
    GermanLocalizationExpert = {
        GroupId = 4265449, 
        GroupRank = 252
    }
};
if game.CreatorType == Enum.CreatorType.Group then
    v15.PlaceCreator = {
        GroupId = game.CreatorId, 
        GroupRank = 255
    };
end;
local v16 = {};
local v17 = {};
local v18 = {};
game:DefineFastInt("MaxBlockListSize", 500);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "CanChatWith";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_1 = Instance.new("RemoteEvent");
l_RemoteEvent_1.Name = "SetPlayerBlockList";
l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_2 = Instance.new("RemoteEvent");
l_RemoteEvent_2.Name = "UpdatePlayerBlockList";
l_RemoteEvent_2.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_3 = Instance.new("RemoteEvent");
l_RemoteEvent_3.Name = "NewPlayerGroupDetails";
l_RemoteEvent_3.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_4 = Instance.new("RemoteEvent");
l_RemoteEvent_4.Name = "NewPlayerCanManageDetails";
l_RemoteEvent_4.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_5 = Instance.new("RemoteEvent");
l_RemoteEvent_5.Name = "SendPlayerBlockList";
l_RemoteEvent_5.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_6 = Instance.new("RemoteEvent");
l_RemoteEvent_6.Name = "UpdateLocalPlayerBlockList";
l_RemoteEvent_6.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_7 = Instance.new("RemoteEvent");
l_RemoteEvent_7.Name = "SendPlayerProfileSettings";
l_RemoteEvent_7.Parent = l_RobloxReplicatedStorage_0;
local v27 = {};
local function _(v28) --[[ Line: 98 ]] --[[ Name: verifyUserId ]]
    return type(v28) == "number";
end;
local function v33(v30) --[[ Line: 102 ]] --[[ Name: verifyBlockList ]]
    if #v30 == 0 or #v30 > game:GetFastInt("MaxBlockListSize") then
        return false;
    else
        for _, v32 in pairs(v30) do
            if not (type(v32) == "number") then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v34) --[[ Line: 115 ]] --[[ Name: sendPlayerAllGroupDetails ]]
    -- upvalues: l_RemoteEvent_3 (copy), v16 (copy)
    l_RemoteEvent_3:FireClient(v34, v16);
end;
local function v45(v36) --[[ Line: 119 ]] --[[ Name: getPlayerGroupDetails ]]
    -- upvalues: v15 (copy), v16 (copy), l_RemoteEvent_3 (copy)
    local v37 = {};
    for v38, v39 in pairs(v15) do
        if v39.GroupRank ~= nil then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 123 ]]
                -- upvalues: v36 (copy), v39 (copy)
                return v36:GetRankInGroup(v39.GroupId) >= v39.GroupRank;
            end);
            v37[v38] = l_status_0 and l_result_0;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 126 ]]
                -- upvalues: v36 (copy), v39 (copy)
                return v36:IsInGroup(v39.GroupId);
            end);
            v37[v38] = l_status_1 and l_result_1;
        end;
    end;
    if v36.Parent then
        local v44 = tostring(v36.UserId);
        v16[v44] = v37;
        l_RemoteEvent_3:FireAllClients({
            [v44] = v37
        });
    end;
end;
local function v54(v46) --[[ Line: 140 ]] --[[ Name: sendCanChatWith ]]
    -- upvalues: l_Players_0 (copy), v13 (copy), l_TextChatService_0 (copy), l_RemoteEvent_0 (copy), l_Chat_0 (copy)
    local v47 = {};
    for _, v49 in ipairs(l_Players_0:GetPlayers()) do
        if v13 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 146 ]]
                -- upvalues: l_TextChatService_0 (ref), v46 (copy), v49 (copy)
                return l_TextChatService_0:CanUsersDirectChatAsync(v46.UserId, {
                    v49.UserId
                });
            end);
            v47[v49.UserId] = l_status_2 and #l_result_2 > 0;
            l_RemoteEvent_0:FireClient(v49, {
                [v46.UserId] = l_status_2 and #l_result_2 > 0
            });
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 155 ]]
                -- upvalues: l_Chat_0 (ref), v46 (copy), v49 (copy)
                return l_Chat_0:CanUsersChatAsync(v46.UserId, v49.UserId);
            end);
            v47[v49.userId] = l_status_3 and l_result_3;
            l_RemoteEvent_0:FireClient(v49, {
                [v46.userId] = l_status_3 and l_result_3
            });
        end;
    end;
    l_RemoteEvent_0:FireClient(v46, v47);
end;
local function v58(v55) --[[ Line: 169 ]] --[[ Name: sendPlayerAllCanManage ]]
    -- upvalues: v17 (copy), l_RemoteEvent_4 (copy)
    for v56, v57 in pairs(v17) do
        l_RemoteEvent_4:FireClient(v55, v56, v57);
    end;
end;
local function v67(v59) --[[ Line: 175 ]] --[[ Name: getPlayerCanManage ]]
    -- upvalues: v10 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v17 (copy), l_RemoteEvent_4 (copy)
    local v60 = false;
    if v59.UserId > 0 then
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 178 ]]
            -- upvalues: v10 (ref), l_HttpService_0 (ref), v59 (copy), l_HttpRbxApiService_0 (ref)
            local v61 = string.format(v10.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions");
            local v62 = l_HttpService_0:JSONEncode({
                requests = {
                    {
                        subject = {
                            subjectType = "User", 
                            subjectId = v59.UserId
                        }, 
                        action = "Edit", 
                        assetId = game.PlaceId
                    }
                }
            });
            local v63 = l_HttpRbxApiService_0:PostAsyncFullUrl(v61, v62);
            return l_HttpService_0:JSONDecode(v63);
        end);
        if l_status_4 then
            l_result_4 = l_result_4.results[1];
            if l_result_4.value and l_result_4.value.status == "HasPermission" then
                v60 = true;
            end;
        end;
    end;
    if v59.Parent then
        local v66 = tostring(v59.UserId);
        v17[v66] = v60;
        l_RemoteEvent_4:FireAllClients(v66, v60);
    end;
end;
local function _(v68, v69) --[[ Line: 215 ]]
    -- upvalues: v10 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    return pcall(function() --[[ Line: 216 ]]
        -- upvalues: v10 (ref), l_HttpService_0 (ref), v69 (copy), v68 (copy), l_HttpRbxApiService_0 (ref)
        local v70 = string.format(v10.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block");
        local v71 = l_HttpService_0:JSONEncode({
            userIds = v69, 
            requesterUserId = v68.UserId
        });
        local v72 = l_HttpRbxApiService_0:PostAsyncFullUrl(v70, v71);
        return l_HttpService_0:JSONDecode(v72);
    end);
end;
local function v89(v74) --[[ Line: 232 ]] --[[ Name: sendPlayerBlockList ]]
    -- upvalues: l_Players_0 (copy), v10 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), l_RemoteEvent_6 (copy), l_RemoteEvent_5 (copy)
    if v74.UserId <= 0 then
        return;
    else
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        local v76 = {};
        for _, v78 in l_l_Players_0_Players_0 do
            if v74 ~= v78 then
                table.insert(v76, v78.UserId);
            end;
        end;
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 216 ]]
            -- upvalues: v10 (ref), l_HttpService_0 (ref), v76 (copy), v74 (copy), l_HttpRbxApiService_0 (ref)
            local v79 = string.format(v10.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block");
            local v80 = l_HttpService_0:JSONEncode({
                userIds = v76, 
                requesterUserId = v74.UserId
            });
            local v81 = l_HttpRbxApiService_0:PostAsyncFullUrl(v79, v80);
            return l_HttpService_0:JSONDecode(v81);
        end);
        local l_l_status_5_0 = l_status_5;
        local l_l_result_5_0 = l_result_5;
        l_status_5 = {};
        l_result_5 = {};
        if l_l_status_5_0 and l_l_result_5_0 then
            for _, v87 in l_l_result_5_0.users do
                if v87.isBlocked then
                    l_result_5[v87.userId] = true;
                    table.insert(l_status_5, v87.userId);
                end;
                if v87.isBlockingViewer then
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v87.userId);
                    l_l_Players_0_PlayerByUserId_0:UpdatePlayerBlocked(v74.UserId, true);
                    l_RemoteEvent_6:FireClient(l_l_Players_0_PlayerByUserId_0, v74.UserId, true);
                end;
            end;
        end;
        v74:AddToBlockList(l_status_5);
        if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
            v74:SetBlockListInitialized();
        end;
        l_RemoteEvent_5:FireClient(v74, l_result_5);
        return;
    end;
end;
local function v93(v90) --[[ Line: 273 ]] --[[ Name: sendPlayerAllInExperienceNameEnabled ]]
    -- upvalues: v18 (copy), l_RemoteEvent_7 (copy)
    for v91, v92 in pairs(v18) do
        l_RemoteEvent_7:FireClient(v90, v91, {
            isInExperienceNameEnabled = v92
        });
    end;
end;
local function _(v94) --[[ Line: 279 ]]
    -- upvalues: v10 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    return pcall(function() --[[ Line: 280 ]]
        -- upvalues: v94 (copy), v10 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
        local v95 = ("user-profile-api/v1/user/profiles/rcc/settings?userId=%*"):format(v94.UserId);
        local v96 = v10.APIS_URL .. v95;
        local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v96, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
    end);
end;
local function v109(v99) --[[ Line: 289 ]]
    -- upvalues: v12 (copy), v10 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v18 (copy), l_RemoteEvent_7 (copy)
    if v99.UserId <= 0 then
        return;
    else
        local v100 = false;
        if v12.isAllowListedUserId(v99.UserId) then
            local l_status_6, l_result_6 = pcall(function() --[[ Line: 280 ]]
                -- upvalues: v99 (copy), v10 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                local v101 = ("user-profile-api/v1/user/profiles/rcc/settings?userId=%*"):format(v99.UserId);
                local v102 = v10.APIS_URL .. v101;
                local l_l_HttpRbxApiService_0_AsyncFullUrl_1 = l_HttpRbxApiService_0:GetAsyncFullUrl(v102, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
                return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_1);
            end);
            local l_l_status_6_0 = l_status_6;
            local l_l_result_6_0 = l_result_6;
            if l_l_status_6_0 and l_l_result_6_0 then
                v100 = l_l_result_6_0.isSettingsEnabled and l_l_result_6_0.userProfileSettings and l_l_result_6_0.userProfileSettings.isInExperienceNameEnabled;
            end;
        end;
        local v108 = tostring(v99.UserId);
        v18[v108] = v100;
        l_RemoteEvent_7:FireAllClients(v108, {
            isInExperienceNameEnabled = v100
        });
        return;
    end;
end;
local function v111(v110) --[[ Line: 307 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: v89 (copy), l_RemoteEvent_3 (copy), v16 (copy), v45 (copy), v11 (copy), v93 (copy), v109 (copy), v58 (copy), v67 (copy), v54 (copy)
    coroutine.wrap(v89)(v110);
    l_RemoteEvent_3:FireClient(v110, v16);
    if v110.UserId > 0 then
        coroutine.wrap(v45)(v110);
    end;
    if v11 then
        v93(v110);
        coroutine.wrap(v109)(v110);
    end;
    v58(v110);
    coroutine.wrap(v67)(v110);
    v54(v110);
end;
l_RemoteEvent_1.OnServerEvent:Connect(function(v112, v113) --[[ Line: 324 ]]
    -- upvalues: v33 (copy)
    if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
        v112:SetBlockListInitialized();
    end;
    if type(v113) == "table" and v33(v113) then
        v112:AddToBlockList(v113);
    end;
end);
l_RemoteEvent_2.OnServerEvent:Connect(function(v114, v115, v116) --[[ Line: 335 ]]
    if type(v116) == "boolean" and type(v115) == "number" then
        v114:UpdatePlayerBlocked(v115, v116);
    end;
end);
l_Players_0.PlayerAdded:connect(v111);
for _, v118 in pairs(l_Players_0:GetPlayers()) do
    v111(v118);
end;
l_Players_0.PlayerRemoving:connect(function(v119) --[[ Line: 348 ]]
    -- upvalues: v14 (copy), v27 (copy), v16 (copy), v17 (copy), v18 (copy)
    local v120 = tostring(v119.UserId);
    if v14[v120] then
        v14[v120] = nil;
        v27[v120] = nil;
    end;
    if v16[v120] then
        v16[v120] = nil;
    end;
    if v17[v120] ~= nil then
        v17[v120] = nil;
    end;
    if v18[v120] ~= nil then
        v18[v120] = nil;
    end;
end);
local function v121() --[[ Line: 365 ]]

end;
for _, v123 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
    if v123:IsA("RemoteEvent") then
        v123.OnServerEvent:Connect(v121);
    end;
end;