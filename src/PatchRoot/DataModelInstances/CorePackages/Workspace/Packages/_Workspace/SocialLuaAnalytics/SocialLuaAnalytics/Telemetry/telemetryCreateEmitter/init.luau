local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.telemetryNewConfig);
local v4 = require(l_script_FirstAncestor_0.Analytics.FireEvent.fireTelemetry);
return function(v5) --[[ Line: 27 ]] --[[ Name: telemetrySetup ]]
    -- upvalues: v4 (copy), v2 (copy)
    local function v8(v6, v7) --[[ Line: 28 ]] --[[ Name: emitTelemetry ]]
        -- upvalues: v4 (ref), v5 (copy)
        return v4({
            telemetryImpl = v5.telemetryImpl, 
            eventList = {
                defaults = v5.defaultTelemetryConfig, 
                [v6.name] = v6
            }, 
            loggerImpl = v5.loggerImpl
        })(v6.name, v7, v5.sharedInfo);
    end;
    return {
        emit = v8, 
        fireAnalyticsEvent = v8, 
        sharedInfo = {
            merge = function(v9) --[[ Line: 45 ]] --[[ Name: merge ]]
                -- upvalues: v5 (copy), v2 (ref)
                v5.sharedInfo = v2.Dictionary.union(v5.sharedInfo, v9);
            end, 
            get = function() --[[ Line: 48 ]] --[[ Name: get ]]
                -- upvalues: v5 (copy)
                return v5.sharedInfo;
            end
        }
    };
end;