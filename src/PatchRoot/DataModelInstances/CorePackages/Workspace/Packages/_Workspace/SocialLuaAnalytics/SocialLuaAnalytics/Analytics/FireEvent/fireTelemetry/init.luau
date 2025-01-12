local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Analytics.Enums.SupportedTelemetryBackends);
local v5 = game:DefineFastFlag("SocialAnalyticsTelemetryModule", false);
local _ = require(script.Parent.Parent.Types);
local function _(v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v8, v9, v10) --[[ Line: 15 ]]
        -- upvalues: v7 (copy), v2 (ref), v3 (ref)
        if v7 then
            local v11 = nil;
            v11 = if not (type(v9) ~= "string") or type(v9) == "number" then {
                value = v9
            } else v9;
            local v12 = v2.Dictionary.join(v8, v11, v10 or {});
            v7:info(v3.pretty(v12));
        end;
    end;
end;
return function(v14) --[[ Line: 30 ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy)
    return function(v15, v16, v17) --[[ Line: 44 ]]
        -- upvalues: v14 (copy), v2 (ref), v3 (ref), v5 (ref), v4 (ref)
        local l_defaults_0 = v14.eventList.defaults;
        local v19 = v14.eventList[v15];
        local l_loggerImpl_0 = v14.loggerImpl;
        local function v26(v21, v22, v23) --[[ Line: 15 ]]
            -- upvalues: l_loggerImpl_0 (copy), v2 (ref), v3 (ref)
            if l_loggerImpl_0 then
                local v24 = nil;
                v24 = if not (type(v22) ~= "string") or type(v22) == "number" then {
                    value = v22
                } else v22;
                local v25 = v2.Dictionary.join(v21, v24, v23 or {});
                l_loggerImpl_0:info(v3.pretty(v25));
            end;
        end;
        for _, v28 in v19.backendsList do
            local v29 = v28.incrementValue or 1;
            local v30 = if v28.overrideName then v28.overrideName(v16) else v15;
            local v31 = nil;
            v31 = if v5 then v28.throttlingThousandths or v19.throttlingThousandths or l_defaults_0.throttlingThousandths else v19.throttlingThousandths or l_defaults_0.throttlingThousandths;
            local v32 = {
                eventName = v30, 
                backends = {
                    v28.type
                }, 
                throttlingPercentage = if v5 then math.clamp(v31, 0, 10000) else v31, 
                lastUpdated = v19.lastUpdated, 
                description = v19.description, 
                links = v19.links or l_defaults_0.links
            };
            local v33 = {};
            if v5 and v28.format then
                assert(v28.dynamicCustomFields == nil, "Cannot use dynamicCustomFields with format");
                assert(v28.staticCustomFields == nil, "Cannot use staticCustomFields with format");
                v33 = v28.format(v16, v17 or {});
            else
                if v28.dynamicCustomFields and v16 then
                    for v34, v35 in v28.dynamicCustomFields do
                        if v16[v34] then
                            v33[v34] = v35(v16[v34]);
                        end;
                    end;
                end;
                if v28.staticCustomFields then
                    v33 = v2.Dictionary.join(v33, v28.staticCustomFields);
                end;
            end;
            if v28.type == v4.Points then
                v14.telemetryImpl:logRobloxTelemetryEvent(v32, v28.standardizedFields, v33);
                v26(v32, v28.standardizedFields, v33);
            elseif v28.type == v4.RobloxTelemetryStat then
                if not v16 or not v16.statValue then
                    v32.backends = {
                        v4.RobloxTelemetryCounter
                    };
                    v32.eventName = v15 .. "MissingStatValue";
                    v14.telemetryImpl:logRobloxTelemetryCounter(v32, v29, v33);
                    v26(v32, v29, v33);
                    return;
                else
                    v14.telemetryImpl:logRobloxTelemetryStat(v32, v16.statValue, v33);
                    v26(v32, v16.statValue, v33);
                end;
            elseif v28.type == v4.RobloxTelemetryCounter then
                v14.telemetryImpl:logRobloxTelemetryCounter(v32, v29, v33);
                v26(v32, v29, v33);
            elseif v5 and v28.type == v4.EventIngest then
                v14.telemetryImpl:logRobloxTelemetryEvent(v32, v28.standardizedFields, v33);
                v26(v32, v16, v33);
            end;
        end;
    end;
end;