local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_SoundService_0 = game:GetService("SoundService");
local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local v5 = require(l_Modules_0.Flags.GetFFlagEnableSoundSessionTelemetry);
local v6 = require(l_Modules_0.Flags.GetFIntSoundSessionTelemetryThrottle);
local v7 = require(l_Modules_0.Flags.GetFFlagFixSoundSessionTelemetryNotRemovingSounds);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v9 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_default_0 = v9.default;
local v11 = require(l_Modules_0.AggregatedData);
local v12 = require(l_Modules_0.PlayingSounds);
local v13 = {
    eventName = "SoundSessionPlayback", 
    backends = {
        v9.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v6(), 
    lastUpdated = {
        23, 
        13, 
        6
    }, 
    description = " Aggregated session-end event of all music playback data ", 
    links = "https://roblox.atlassian.net/wiki/spaces/MUS/pages/2065826132/Scaled+Analytics+Tech+Spec"
};
local v14 = {};
local v15 = v11.new();
local v16 = v12.new(v15);
local function v23() --[[ Line: 40 ]] --[[ Name: logSessionEvent ]]
    -- upvalues: v15 (copy), l_RbxAnalyticsService_0 (copy), l_game_EngineFeature_0 (copy), l_default_0 (copy), v13 (copy)
    local v17 = {};
    local v18 = {};
    local v19 = {};
    for v20, v21 in pairs(v15) do
        table.insert(v17, v20);
        table.insert(v18, v21.loopcount);
        table.insert(v19, v21.playtime);
    end;
    local v22 = {
        asset_ids = table.concat(v17, ","), 
        loop_counts = table.concat(v18, ","), 
        playback_seconds = table.concat(v19, ","), 
        placeid = tostring(game.PlaceId), 
        sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
        universeid = tostring(game.GameId)
    };
    if l_game_EngineFeature_0 then
        v22.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_default_0:logRobloxTelemetryEvent(v13, nil, v22);
end;
local function v28() --[[ Line: 68 ]] --[[ Name: aggregateEndSessionData ]]
    -- upvalues: v16 (copy), v23 (copy)
    for v24, v25 in pairs(v16.sounds) do
        for v26, _ in pairs(v25.instances) do
            v16:removeSound(v24, v26);
        end;
    end;
    v23();
end;
local function _(v29) --[[ Line: 80 ]] --[[ Name: isAudible ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    local l_MasterVolume_0 = l_UserGameSettings_0.MasterVolume;
    local v31 = if v29.SoundGroup then v29.SoundGroup.Volume else 1;
    local l_Volume_0 = v29.Volume;
    local l_RollOffGain_0 = v29.RollOffGain;
    return l_MasterVolume_0 * v31 * l_Volume_0 * l_RollOffGain_0 > 0.01;
end;
local function _(v35) --[[ Line: 92 ]] --[[ Name: onPlayed ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), v16 (copy)
    if v5() then
        local l_MasterVolume_1 = l_UserGameSettings_0.MasterVolume;
        local v37 = if v35.SoundGroup then v35.SoundGroup.Volume else 1;
        local l_Volume_1 = v35.Volume;
        local l_RollOffGain_1 = v35.RollOffGain;
        if l_MasterVolume_1 * v37 * l_Volume_1 * l_RollOffGain_1 > 0.01 then
            v16:addSound(v35.SoundId, v35:GetDebugId(10));
        end;
    end;
end;
local function _(v41) --[[ Line: 98 ]] --[[ Name: onPaused ]]
    -- upvalues: v5 (copy), v16 (copy)
    if v5() then
        v16:removeSound(v41.SoundId, v41:GetDebugId(10));
    end;
end;
local function _(v43) --[[ Line: 104 ]] --[[ Name: onStopped ]]
    -- upvalues: v5 (copy), v16 (copy)
    if v5() then
        v16:removeSound(v43.SoundId, v43:GetDebugId(10));
    end;
end;
local function _(v45) --[[ Line: 110 ]] --[[ Name: onEnded ]]
    -- upvalues: v5 (copy), v16 (copy)
    if v5() then
        v16:removeSound(v45.SoundId, v45:GetDebugId(10));
    end;
end;
local function _(v47) --[[ Line: 116 ]] --[[ Name: onResumed ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), v16 (copy)
    if v5() then
        local l_MasterVolume_2 = l_UserGameSettings_0.MasterVolume;
        local v49 = if v47.SoundGroup then v47.SoundGroup.Volume else 1;
        local l_Volume_2 = v47.Volume;
        local l_RollOffGain_2 = v47.RollOffGain;
        if l_MasterVolume_2 * v49 * l_Volume_2 * l_RollOffGain_2 > 0.01 then
            v16:addSound(v47.SoundId, v47:GetDebugId(10));
        end;
    end;
end;
local _ = function(v53, _) --[[ Line: 122 ]] --[[ Name: onLooped ]]
    -- upvalues: v5 (copy), v16 (copy)
    if v5() then
        v16:loopSound(v53.SoundId, v53:GetDebugId(10));
    end;
end;
local function v60(v56) --[[ Line: 128 ]] --[[ Name: unhookSoundEvents ]]
    -- upvalues: v14 (copy), v5 (copy), v7 (copy), v16 (copy)
    local v57 = v14[v56];
    if v57 ~= nil then
        for _, v59 in v57 do
            v59:Disconnect();
        end;
    end;
    if v5() and v7() then
        v16:removeSound(v56.SoundId, v56:GetDebugId(10));
    end;
    v14[v56] = nil;
end;
local function v90(v61) --[[ Line: 141 ]] --[[ Name: hookupSoundEvents ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), v16 (copy), v60 (copy), v14 (copy)
    if v61.Playing and v5() then
        local l_MasterVolume_3 = l_UserGameSettings_0.MasterVolume;
        local v63 = if v61.SoundGroup then v61.SoundGroup.Volume else 1;
        local l_Volume_3 = v61.Volume;
        local l_RollOffGain_3 = v61.RollOffGain;
        if l_MasterVolume_3 * v63 * l_Volume_3 * l_RollOffGain_3 > 0.01 then
            v16:addSound(v61.SoundId, v61:GetDebugId(10));
        end;
    end;
    v14[v61] = {
        v61.Played:Connect(function() --[[ Line: 147 ]]
            -- upvalues: v61 (copy), v5 (ref), l_UserGameSettings_0 (ref), v16 (ref)
            if v61.TimeLength == 0 or not v61.IsLoaded then
                local v66 = nil;
                v66 = v61.Loaded:Connect(function() --[[ Line: 151 ]]
                    -- upvalues: v61 (ref), v5 (ref), l_UserGameSettings_0 (ref), v16 (ref), v66 (ref)
                    local l_v61_0 = v61;
                    if v5() then
                        local l_MasterVolume_4 = l_UserGameSettings_0.MasterVolume;
                        local v69 = if l_v61_0.SoundGroup then l_v61_0.SoundGroup.Volume else 1;
                        local l_Volume_4 = l_v61_0.Volume;
                        local l_RollOffGain_4 = l_v61_0.RollOffGain;
                        if l_MasterVolume_4 * v69 * l_Volume_4 * l_RollOffGain_4 > 0.01 then
                            v16:addSound(l_v61_0.SoundId, l_v61_0:GetDebugId(10));
                        end;
                    end;
                    v66:Disconnect();
                end);
                return;
            else
                local l_v61_1 = v61;
                if v5() then
                    local l_MasterVolume_5 = l_UserGameSettings_0.MasterVolume;
                    local v74 = if l_v61_1.SoundGroup then l_v61_1.SoundGroup.Volume else 1;
                    local l_Volume_5 = l_v61_1.Volume;
                    local l_RollOffGain_5 = l_v61_1.RollOffGain;
                    if l_MasterVolume_5 * v74 * l_Volume_5 * l_RollOffGain_5 > 0.01 then
                        v16:addSound(l_v61_1.SoundId, l_v61_1:GetDebugId(10));
                    end;
                end;
                return;
            end;
        end), 
        v61.Paused:Connect(function() --[[ Line: 160 ]]
            -- upvalues: v61 (copy), v5 (ref), v16 (ref)
            local l_v61_2 = v61;
            if v5() then
                v16:removeSound(l_v61_2.SoundId, l_v61_2:GetDebugId(10));
            end;
        end), 
        v61.Stopped:Connect(function() --[[ Line: 164 ]]
            -- upvalues: v61 (copy), v5 (ref), v16 (ref)
            local l_v61_3 = v61;
            if v5() then
                v16:removeSound(l_v61_3.SoundId, l_v61_3:GetDebugId(10));
            end;
        end), 
        v61.Ended:Connect(function() --[[ Line: 168 ]]
            -- upvalues: v61 (copy), v5 (ref), v16 (ref)
            local l_v61_4 = v61;
            if v5() then
                v16:removeSound(l_v61_4.SoundId, l_v61_4:GetDebugId(10));
            end;
        end), 
        v61.Resumed:Connect(function() --[[ Line: 172 ]]
            -- upvalues: v61 (copy), v5 (ref), l_UserGameSettings_0 (ref), v16 (ref)
            local l_v61_5 = v61;
            if v5() then
                local l_MasterVolume_6 = l_UserGameSettings_0.MasterVolume;
                local v82 = if l_v61_5.SoundGroup then l_v61_5.SoundGroup.Volume else 1;
                local l_Volume_6 = l_v61_5.Volume;
                local l_RollOffGain_6 = l_v61_5.RollOffGain;
                if l_MasterVolume_6 * v82 * l_Volume_6 * l_RollOffGain_6 > 0.01 then
                    v16:addSound(l_v61_5.SoundId, l_v61_5:GetDebugId(10));
                end;
            end;
        end), 
        v61.DidLoop:Connect(function(_, _) --[[ Line: 176 ]]
            -- upvalues: v61 (copy), v5 (ref), v16 (ref)
            local l_v61_6 = v61;
            if v5() then
                v16:loopSound(l_v61_6.SoundId, l_v61_6:GetDebugId(10));
            end;
        end), 
        (v61.AncestryChanged:Connect(function(v88, _) --[[ Line: 180 ]]
            -- upvalues: v60 (ref), v61 (copy)
            if v88:FindFirstAncestorOfClass("DataModel") == nil then
                v60(v61);
            end;
        end))
    };
end;
if v5() then
    if game:GetEngineFeature("AudioInstanceAddedApiEnabled") then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v91) --[[ Line: 193 ]]
            -- upvalues: v14 (copy), v90 (copy)
            if v91:IsA("Sound") and not v14[v91] then
                v90(v91);
            end;
        end);
    end;
    game.Close:Connect(function() --[[ Line: 202 ]]
        -- upvalues: v28 (copy)
        v28();
    end);
end;