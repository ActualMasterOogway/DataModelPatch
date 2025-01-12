local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local v4 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local v5 = {};
local v6 = {
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidDisplayNameChanged = "HumanoidDisplayNameChanged", 
    CharacterHumanoidAdded = "CharacterHumanoidAdded"
};
local function v12(v7, v8, v9) --[[ Line: 23 ]] --[[ Name: setName ]]
    -- upvalues: v5 (copy), v6 (copy)
    local l_inExperienceCombinedName_0 = v9.names.inExperienceCombinedName;
    local l_displayName_0 = v9.names.displayName;
    if v9.names.displayName == v7.DisplayName then
        v7.InternalDisplayName = l_inExperienceCombinedName_0;
        v5[v8][v6.HumanoidDisplayNameChanged] = v7:GetPropertyChangedSignal("DisplayName"):Connect(function() --[[ Line: 30 ]]
            -- upvalues: l_displayName_0 (copy), v7 (copy)
            if l_displayName_0 ~= v7.DisplayName then
                v7.InternalDisplayName = "";
            end;
        end);
    end;
end;
local function v18(v13, v14, v15) --[[ Line: 38 ]] --[[ Name: checkHumanoid ]]
    -- upvalues: v12 (copy), v5 (copy), v6 (copy)
    local l_Humanoid_0 = v14:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v12(l_Humanoid_0, v13, v15);
    end;
    v5[v13][v6.CharacterHumanoidAdded] = v14.ChildAdded:Connect(function(v17) --[[ Line: 43 ]]
        -- upvalues: v12 (ref), v13 (copy), v15 (copy)
        if v17:IsA("Humanoid") then
            v12(v17, v13, v15);
        end;
    end);
end;
local function v24(v19, v20) --[[ Line: 50 ]] --[[ Name: setNameOnCharacterAdded ]]
    -- upvalues: v5 (copy), v18 (copy), v6 (copy)
    v5[v19] = {};
    if v19.Character then
        v18(v19, v19.Character, v20);
    end;
    v5[v19][v6.CharacterAdded] = v19.CharacterAdded:Connect(function(v21) --[[ Line: 56 ]]
        -- upvalues: v18 (ref), v19 (copy), v20 (copy)
        v18(v19, v21, v20);
    end);
    v5[v19][v6.CharacterRemoving] = v19.CharacterRemoving:Connect(function() --[[ Line: 59 ]]
        -- upvalues: v5 (ref), v19 (copy), v6 (ref)
        local v22 = v5[v19][v6.CharacterHumanoidAdded];
        local v23 = v5[v19][v6.HumanoidDisplayNameChanged];
        if v22 then
            v5[v19][v6.CharacterHumanoidAdded]:Disconnect();
        end;
        if v23 then
            v5[v19][v6.HumanoidDisplayNameChanged]:Disconnect();
        end;
    end);
end;
local function v34() --[[ Line: 71 ]] --[[ Name: setCurrentPlayersNames ]]
    -- upvalues: l_Players_0 (copy), v3 (copy), v4 (copy), v24 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    local v26 = {};
    local v27 = {};
    for _, v29 in pairs(l_l_Players_0_Players_0) do
        table.insert(v26, (tostring(v29.UserId)));
        v27[tostring(v29.UserId)] = v29;
    end;
    v3:query({
        query = v4.Queries.userProfilesInExperienceNamesByUserIds, 
        variables = {
            userIds = v26
        }
    }):andThen(function(v30) --[[ Line: 84 ]]
        -- upvalues: v27 (copy), v24 (ref)
        for _, v32 in pairs(v30.data.userProfiles) do
            local v33 = v27[v32.id];
            v24(v33, v32);
        end;
    end, function() --[[ Line: 89 ]]

    end);
end;
local function v38(v35) --[[ Line: 92 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: v3 (copy), v4 (copy), v24 (copy)
    v3:query({
        query = v4.Queries.userProfilesInExperienceNamesByUserIds, 
        variables = {
            userIds = {
                (tostring(v35.UserId))
            }
        }
    }):andThen(function(v36) --[[ Line: 98 ]]
        -- upvalues: v24 (ref), v35 (copy)
        local v37 = v36.data.userProfiles[1];
        v24(v35, v37);
    end, function() --[[ Line: 101 ]]

    end);
end;
local function v43(v39) --[[ Line: 104 ]] --[[ Name: onPlayerRemoving ]]
    -- upvalues: v5 (copy)
    local v40 = v5[v39];
    if v5[v39] then
        for _, v42 in pairs(v40) do
            v42:Disconnect();
        end;
        v5[v39] = nil;
    end;
end;
v34();
l_Players_0.PlayerAdded:Connect(v38);
l_Players_0.PlayerRemoving:Connect(v43);