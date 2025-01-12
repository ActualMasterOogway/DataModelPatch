local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Lumberyak).Logger.new(nil, "SoundManager");
local v6 = require(script.Parent.Sounds);
local v7 = require(script.Parent.SoundEffects);
local v8 = require(script.Parent.SoundGroups);
local v9 = {};
v9.__index = v9;
local v10 = {
    Looped = false, 
    PlaybackSpeed = 1, 
    Volume = 1, 
    FadeInTime = nil, 
    FadeOutTime = nil, 
    SoundEffects = nil
};
local function _(v11, v12, v13, v14) --[[ Line: 34 ]] --[[ Name: fadeVolume ]]
    -- upvalues: l_RunService_0 (copy)
    if v12 < 0 then
        error(v14 .. " cannot have a negative fadeIn/fadeOut time.");
    end;
    local v15 = (v13 - v11.Volume) / v12;
    local v16 = nil;
    local function v20(v17) --[[ Line: 44 ]] --[[ Name: onHeartBeat ]]
        -- upvalues: v15 (copy), v11 (copy), v16 (ref), v13 (copy)
        local v18 = v15 * v17;
        local v19 = v11.Volume + v18;
        if v19 <= 0 then
            v11.Volume = 0;
            v11:Stop();
            v16:Disconnect();
            return;
        elseif v13 <= v19 then
            v11.Volume = v13;
            v16:Disconnect();
            return;
        else
            v11.Volume = v19;
            return;
        end;
    end;
    v16 = l_RunService_0.Heartbeat:Connect(v20);
end;
v9._createSoundEffect = function(_, v23, v24, v25, v26) --[[ Line: 71 ]] --[[ Name: _createSoundEffect ]]
    -- upvalues: v7 (copy)
    if not v7[v23] then
        error(v23 .. " does not exist in list of SoundEffects");
    end;
    local v27 = Instance.new(v23);
    for v28, v29 in pairs(v25) do
        v27[v28] = v29;
    end;
    v27.Parent = v26;
    v27.Name = v24;
end;
v9.PlaySound = function(v30, v31, v32, v33) --[[ Line: 102 ]]
    -- upvalues: l_RobloxGui_0 (copy), v6 (copy), v4 (copy), v10 (copy), l_RunService_0 (copy)
    local l_SoundManager_Sounds_0 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
    if not l_SoundManager_Sounds_0 then
        error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
    end;
    local v35 = v6[v31];
    if not v35 then
        error(v31 .. " does not exist in library of Sounds");
        return;
    else
        local v36 = v4.Dictionary.join(v10, v35.DefaultPlaybackProperties or {}, v32 or {});
        local l_l_SoundManager_Sounds_0_FirstChild_0 = l_SoundManager_Sounds_0:FindFirstChild(v35.Name);
        if not l_l_SoundManager_Sounds_0_FirstChild_0 then
            l_l_SoundManager_Sounds_0_FirstChild_0 = Instance.new("Sound");
            l_l_SoundManager_Sounds_0_FirstChild_0.Parent = l_SoundManager_Sounds_0;
            l_l_SoundManager_Sounds_0_FirstChild_0.SoundId = v35.SoundId;
            l_l_SoundManager_Sounds_0_FirstChild_0.Name = v35.Name;
        end;
        for _, v39 in pairs(l_l_SoundManager_Sounds_0_FirstChild_0:GetChildren()) do
            v39:Destroy();
        end;
        if v33 then
            l_l_SoundManager_Sounds_0_FirstChild_0.SoundGroup = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(v33.Name);
        end;
        for v40, v41 in pairs(v36) do
            if v40 ~= "FadeInTime" and v40 ~= "FadeOutTime" and v40 ~= "Effects" then
                l_l_SoundManager_Sounds_0_FirstChild_0[v40] = v41;
            end;
        end;
        local l_ipairs_0 = ipairs;
        local v43 = v36.SoundEffects or {};
        for _, v45 in l_ipairs_0(v43) do
            v30:_createSoundEffect(v45.Type, v45.Name, v45.Properties, l_l_SoundManager_Sounds_0_FirstChild_0);
        end;
        if v36.FadeInTime then
            l_l_SoundManager_Sounds_0_FirstChild_0.Volume = 0;
            l_ipairs_0 = l_l_SoundManager_Sounds_0_FirstChild_0;
            v43 = v36.FadeInTime;
            local l_Volume_0 = v36.Volume;
            if v43 < 0 then
                error(v31 .. " cannot have a negative fadeIn/fadeOut time.");
            end;
            local v47 = (l_Volume_0 - l_ipairs_0.Volume) / v43;
            local v48 = nil;
            do
                local l_v48_0 = v48;
                local function v53(v50) --[[ Line: 44 ]] --[[ Name: onHeartBeat ]]
                    -- upvalues: v47 (copy), l_ipairs_0 (copy), l_v48_0 (ref), l_Volume_0 (copy)
                    local v51 = v47 * v50;
                    local v52 = l_ipairs_0.Volume + v51;
                    if v52 <= 0 then
                        l_ipairs_0.Volume = 0;
                        l_ipairs_0:Stop();
                        l_v48_0:Disconnect();
                        return;
                    elseif l_Volume_0 <= v52 then
                        l_ipairs_0.Volume = l_Volume_0;
                        l_v48_0:Disconnect();
                        return;
                    else
                        l_ipairs_0.Volume = v52;
                        return;
                    end;
                end;
                l_v48_0 = l_RunService_0.Heartbeat:Connect(v53);
            end;
        end;
        l_l_SoundManager_Sounds_0_FirstChild_0:Play();
        return;
    end;
end;
v9.StopSound = function(_, v55) --[[ Line: 163 ]] --[[ Name: StopSound ]]
    -- upvalues: l_RobloxGui_0 (copy), v6 (copy), l_RunService_0 (copy)
    local l_SoundManager_Sounds_1 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
    if not l_SoundManager_Sounds_1 then
        error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
    end;
    local v57 = v6[v55];
    if not v57 then
        error(v55 .. " does not exist in list of Sounds");
        return;
    else
        local l_l_SoundManager_Sounds_1_FirstChild_0 = l_SoundManager_Sounds_1:FindFirstChild(v57.Name);
        if not l_l_SoundManager_Sounds_1_FirstChild_0 then
            error(v55 .. " does not exist");
            return;
        else
            local l_DefaultPlaybackProperties_0 = v57.DefaultPlaybackProperties;
            local v60 = if l_DefaultPlaybackProperties_0 then l_DefaultPlaybackProperties_0.FadeOutTime else nil;
            if v60 then
                if v60 < 0 then
                    error(v55 .. " cannot have a negative fadeIn/fadeOut time.");
                end;
                local v61 = (0 - l_l_SoundManager_Sounds_1_FirstChild_0.Volume) / v60;
                local v62 = nil;
                local v63 = 0;
                local function v67(v64) --[[ Line: 44 ]] --[[ Name: onHeartBeat ]]
                    -- upvalues: v61 (copy), l_l_SoundManager_Sounds_1_FirstChild_0 (copy), v62 (ref), v63 (copy)
                    local v65 = v61 * v64;
                    local v66 = l_l_SoundManager_Sounds_1_FirstChild_0.Volume + v65;
                    if v66 <= 0 then
                        l_l_SoundManager_Sounds_1_FirstChild_0.Volume = 0;
                        l_l_SoundManager_Sounds_1_FirstChild_0:Stop();
                        v62:Disconnect();
                        return;
                    elseif v63 <= v66 then
                        l_l_SoundManager_Sounds_1_FirstChild_0.Volume = v63;
                        v62:Disconnect();
                        return;
                    else
                        l_l_SoundManager_Sounds_1_FirstChild_0.Volume = v66;
                        return;
                    end;
                end;
                v62 = l_RunService_0.Heartbeat:Connect(v67);
                return;
            else
                l_l_SoundManager_Sounds_1_FirstChild_0:Stop();
                return;
            end;
        end;
    end;
end;
v9.CreateSoundGroup = function(v68, v69) --[[ Line: 197 ]] --[[ Name: CreateSoundGroup ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy)
    local v70 = v8[v69];
    if not v70 then
        error("SoundGroup does not exist in list of SoundGroups");
        return;
    else
        local l_SoundManager_SoundGroups_0 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if not l_SoundManager_SoundGroups_0 then
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return;
        elseif l_SoundManager_SoundGroups_0:FindFirstChild(v69) then
            warn("SoundGroup already exists");
            return;
        else
            local l_SoundGroup_0 = Instance.new("SoundGroup");
            l_SoundGroup_0.Name = v70.Name;
            l_SoundGroup_0.Parent = l_SoundManager_SoundGroups_0;
            l_SoundGroup_0.Volume = v70.Volume;
            for _, v74 in ipairs(v70.SoundEffects) do
                v68:_createSoundEffect(v74.Type, v74.Name, v74.Properties, l_SoundGroup_0);
            end;
            return;
        end;
    end;
end;
v9.SoundGroupAddSoundEffect = function(v75, v76, v77) --[[ Line: 231 ]] --[[ Name: SoundGroupAddSoundEffect ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy)
    if not v8[v76] then
        error("SoundGroup does not exist in list of SoundGroups");
        return;
    else
        local l_SoundManager_SoundGroups_1 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if not l_SoundManager_SoundGroups_1 then
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return;
        else
            local l_l_SoundManager_SoundGroups_1_FirstChild_0 = l_SoundManager_SoundGroups_1:FindFirstChild(v76);
            if not l_l_SoundManager_SoundGroups_1_FirstChild_0 then
                error("SoundGroup Instance not created");
                return;
            elseif l_l_SoundManager_SoundGroups_1_FirstChild_0:FindFirstChild(v77.Name) then
                error("SoundEffect with name " .. v77.Name .. " already exists for sound group " .. v76);
                return;
            else
                v75:_createSoundEffect(v77.Type, v77.Name, v77.Properties, l_l_SoundManager_SoundGroups_1_FirstChild_0);
                return;
            end;
        end;
    end;
end;
v9.SoundGroupRemoveSoundEffect = function(_, v81, v82) --[[ Line: 264 ]] --[[ Name: SoundGroupRemoveSoundEffect ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy)
    local v83 = v8[v81];
    if not v83 then
        error("SoundGroup does not exist in list of SoundGroups");
        return;
    else
        local l_SoundManager_SoundGroups_2 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if not l_SoundManager_SoundGroups_2 then
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return;
        else
            local l_l_SoundManager_SoundGroups_2_FirstChild_0 = l_SoundManager_SoundGroups_2:FindFirstChild(v81);
            if not l_l_SoundManager_SoundGroups_2_FirstChild_0 then
                error("SoundGroup Instance not created");
                return;
            else
                local l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0 = l_l_SoundManager_SoundGroups_2_FirstChild_0:FindFirstChild(v82);
                if not l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0 then
                    error(v82 .. " not found in " .. v83.Name);
                end;
                l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0:Destroy();
                return;
            end;
        end;
    end;
end;
v9.init = function() --[[ Line: 295 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_RobloxGui_0 (copy), v5 (copy)
    local v87 = setmetatable({}, v9);
    if not l_RobloxGui_0:FindFirstChild("SoundManager_Sounds") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "SoundManager_Sounds";
        l_Folder_0.Parent = l_RobloxGui_0;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "SoundManager_SoundGroups";
        l_Folder_1.Parent = l_RobloxGui_0;
        return v87;
    else
        v5:warning("SoundManager already initialized");
        return v87;
    end;
end;
return v9;