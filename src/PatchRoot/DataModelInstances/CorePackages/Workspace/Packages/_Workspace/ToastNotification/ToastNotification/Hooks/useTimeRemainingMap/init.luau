local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_utils_0 = l_Parent_0.utils;
local _ = require(l_Parent_0.type);
local v4 = require(l_utils_0.toastNotificationHelper);
local l_getNearestWholeNumber_0 = v4.getNearestWholeNumber;
local l_calculateTimeRemaining_0 = v4.calculateTimeRemaining;
local v7 = game:DefineFastFlag("UpdateToastTimerCalculation", false);
local l_GetFFlagLuaAppEnableSquadPage_0 = v1.SharedFlags.GetFFlagLuaAppEnableSquadPage;
local l_LuauPolyfill_0 = v1.LuauPolyfill;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_clearInterval_0 = l_LuauPolyfill_0.clearInterval;
local l_setInterval_0 = l_LuauPolyfill_0.setInterval;
return function(v14, v15) --[[ Line: 28 ]] --[[ Name: useTimeRemainingMap ]]
    -- upvalues: l_React_0 (copy), l_getNearestWholeNumber_0 (copy), l_calculateTimeRemaining_0 (copy), v7 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagLuaAppEnableSquadPage_0 (copy)
    local v16, v17 = l_React_0.useState(0);
    local v18 = {};
    local v19 = true;
    for v20, v21 in pairs(v14) do
        local v22 = l_getNearestWholeNumber_0(l_calculateTimeRemaining_0(v21, v15.notificationReceivedTimestampMs, v15.displayTimestampMs) / 1000);
        if v22 > 0 then
            v19 = false;
        end;
        v18[v20] = math.max(0, v22);
    end;
    if v7 then
        l_React_0.useEffect(function() --[[ Line: 46 ]]
            -- upvalues: v19 (ref), l_setInterval_0 (ref), v17 (copy), l_clearInterval_0 (ref)
            local v23 = nil;
            if not v19 then
                v23 = l_setInterval_0(function() --[[ Line: 49 ]]
                    -- upvalues: v17 (ref)
                    v17(os.clock());
                end, 100);
            end;
            return function() --[[ Line: 54 ]]
                -- upvalues: v23 (ref), l_clearInterval_0 (ref)
                if v23 then
                    l_clearInterval_0(v23);
                end;
            end;
        end, l_dependencyArray_0(v19, v17));
    else
        local v24 = l_GetFFlagLuaAppEnableSquadPage_0() and 0.1 or 1;
        l_React_0.useEffect(function() --[[ Line: 63 ]]
            -- upvalues: v19 (ref), v24 (copy), v17 (copy), v16 (copy)
            local v25 = nil;
            if not v19 then
                v25 = task.delay(v24, function() --[[ Line: 66 ]]
                    -- upvalues: v17 (ref), v16 (ref), v24 (ref)
                    v17(v16 + v24);
                end);
            end;
            return function() --[[ Line: 71 ]]
                -- upvalues: v25 (ref)
                if v25 then
                    task.cancel(v25);
                end;
            end;
        end, l_dependencyArray_0(v19, v16));
    end;
    return v18;
end;