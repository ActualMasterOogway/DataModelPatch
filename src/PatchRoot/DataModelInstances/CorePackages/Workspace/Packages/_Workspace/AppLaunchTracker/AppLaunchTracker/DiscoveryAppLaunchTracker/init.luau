local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppLaunchTracker");
local v1 = require(l_script_FirstAncestor_0.RoduxPerfTracker);
local v2 = require(l_script_FirstAncestor_0.DiscoveryAppLaunchEvents);
local _ = require(l_script_FirstAncestor_0.AppLaunchTrackerTypes);
local l_FFlagLuaAppLaunchTracker_0 = require(l_script_FirstAncestor_0.Flags).FFlagLuaAppLaunchTracker;
local l_FIntAppLaunchTrackerEnableHundredthsPercent_0 = require(l_script_FirstAncestor_0.Flags).FIntAppLaunchTrackerEnableHundredthsPercent;
local v6 = l_FFlagLuaAppLaunchTracker_0 and l_FIntAppLaunchTrackerEnableHundredthsPercent_0 >= math.random(10000);
local v7 = game:DefineFastFlag("LuaAppShouldTrackTopActions", false);
local v8 = game:DefineFastFlag("LuaAppShouldTrackTopThunks", false);
local v9 = game:DefineFastInt("LuaAppLaunchTrackerTimeoutSec", 60);
local v10 = game:DefineFastString("LuaAppLaunchTrackerMilestones", "lua_app_starter_script_requires_begin,lua_app_starter_script_requires_end,startup_page_did_mount,fetch_homepage_data_begin,home_page_container_init,fetch_homepage_data_end,home_page_interactive_legacy,home_page_interactive");
local v11 = {};
v11.__index = v11;
v11.isEnabled = function() --[[ Line: 45 ]] --[[ Name: isEnabled ]]
    -- upvalues: v6 (ref)
    return v6;
end;
v11.disable = function() --[[ Line: 49 ]] --[[ Name: disable ]]
    -- upvalues: v6 (ref)
    v6 = false;
end;
v11.new = function(v12) --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v2 (copy), v1 (copy), v7 (copy), v8 (copy), v11 (copy), v9 (copy), v6 (ref)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 54 ]]
        -- upvalues: v10 (ref)
        local v13 = {};
        for v14 in (v10:gmatch("([A-Za-z0-9_]+)")) do
            v13[v14] = true;
        end;
        return v13;
    end);
    if not l_status_0 then
        v2.reportError(v12, "Failed to parse FStringLuaAppLaunchTrackerMilestones");
    end;
    local v17 = setmetatable({
        roduxTracker = v1.new(v7, v8, true), 
        numTileRenders = 0, 
        numTilesInit = 0, 
        numFeedRenders = 0, 
        numFeedItems = 0, 
        previousMilestone = "", 
        previousMilestoneTime = 0, 
        loggingProtocol = v12, 
        supportedMilestones = if l_status_0 then l_result_0 else {}
    }, v11);
    if v9 > 0 then
        task.delay(v9, function() --[[ Line: 81 ]]
            -- upvalues: v6 (ref), v2 (ref), v12 (copy), v17 (copy), v11 (ref)
            if v6 then
                v2.reportError(v12, (("Timeout after previousMilestone: %*"):format(v17.previousMilestone)));
                v17.roduxTracker:stopTracking();
                v11.disable();
            end;
        end);
    end;
    return v17;
end;
v11.trackTileRender = function(v18) --[[ Line: 96 ]] --[[ Name: trackTileRender ]]
    v18.numTileRenders = v18.numTileRenders + 1;
end;
v11.trackTileInit = function(v19) --[[ Line: 99 ]] --[[ Name: trackTileInit ]]
    v19.numTilesInit = v19.numTilesInit + 1;
end;
v11.trackFeedRender = function(v20) --[[ Line: 102 ]] --[[ Name: trackFeedRender ]]
    v20.numFeedRenders = v20.numFeedRenders + 1;
end;
v11.trackNumFeedItems = function(v21, v22) --[[ Line: 105 ]] --[[ Name: trackNumFeedItems ]]
    v21.numFeedItems = v22;
end;
v11.onMilestoneChanged = function(v23, v24) --[[ Line: 109 ]] --[[ Name: onMilestoneChanged ]]
    -- upvalues: v6 (ref), v2 (copy)
    if not v6 then
        return;
    elseif not v23.supportedMilestones[v24] then
        return;
    else
        local v25 = os.clock();
        if v23.previousMilestoneTime > 0 then
            local v26 = (v25 - v23.previousMilestoneTime) * 1000;
            local v27 = v23.roduxTracker:getStats();
            v2.reportStatsforMilestone(v23.loggingProtocol, v24, v23.previousMilestone, v26, v27, v23.numTilesInit, v23.numTileRenders, v23.numFeedItems, v23.numFeedRenders);
        end;
        v23.roduxTracker:clear();
        v23.numFeedRenders = 0;
        v23.numTilesInit = 0;
        v23.numTileRenders = 0;
        v23.previousMilestone = v24;
        v23.previousMilestoneTime = v25;
        return;
    end;
end;
v11.stopTracking = function(v28) --[[ Line: 144 ]] --[[ Name: stopTracking ]]
    -- upvalues: v11 (copy)
    v28.roduxTracker:stopTracking();
    v11.disable();
end;
v11.createDefault = function(...) --[[ Line: 149 ]] --[[ Name: createDefault ]]
    -- upvalues: v11 (copy)
    v11.default = v11.new(...);
end;
return v11;