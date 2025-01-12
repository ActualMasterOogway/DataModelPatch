local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local v1 = require(l_script_FirstAncestor_0);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local v5 = require(l_Parent_0.Dev.JestGlobals);
local l_it_0 = v5.it;
local l_expect_0 = v5.expect;
local l_jest_0 = v5.jest;
local l_Telemetry_0 = v1.Telemetry;
l_it_0("SHOULD work for demo in the README", function() --[[ Line: 13 ]]
    -- upvalues: l_jest_0 (copy), l_Telemetry_0 (copy), l_expect_0 (copy)
    local v10 = {
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logRobloxTelemetryStat = l_jest_0.fn(), 
        logRobloxTelemetryCounter = l_jest_0.fn(), 
        TelemetryBackends = {}
    };
    local v11 = l_Telemetry_0.createEmitter({
        telemetryImpl = v10, 
        defaultTelemetryConfig = {
            throttlingThousandths = 5000, 
            links = "example.com"
        }, 
        sharedInfo = {
            userId = "12345"
        }
    });
    local _ = v11.sharedInfo.get();
    v11.sharedInfo.merge({
        userId = "56789"
    });
    local v15 = l_Telemetry_0.new({
        name = "Impression", 
        description = "Fires when the user sees the TestComponent", 
        lastUpdated = {
            2021, 
            1, 
            1
        }, 
        backendsList = {
            {
                type = "EventIngest", 
                format = function(v13, v14) --[[ Line: 43 ]] --[[ Name: format ]]
                    return {
                        context = v13.context, 
                        userId = v14.userId
                    };
                end
            }
        }
    });
    v11.emit(v15, {
        context = "projectABC"
    });
    l_expect_0(v10.logRobloxTelemetryEvent).toHaveBeenCalledWith(v10, l_expect_0.objectContaining({
        eventName = "Impression"
    }), nil, {
        context = "projectABC", 
        userId = "56789"
    });
end);
l_it_0("SHOULD be able to fire an event", function() --[[ Line: 63 ]]
    -- upvalues: v1 (copy), l_jest_0 (copy), l_expect_0 (copy)
    local v19 = v1.Telemetry.new({
        name = "AppLoaded", 
        description = "Fires when the app is loaded", 
        lastUpdated = {
            2021, 
            1, 
            1
        }, 
        backendsList = {
            {
                type = "RobloxTelemetryStat", 
                format = function(v16) --[[ Line: 75 ]] --[[ Name: format ]]
                    return {
                        fooStat = v16.foo
                    };
                end
            }, 
            {
                type = "RobloxTelemetryCounter", 
                incrementValue = 1337, 
                format = function(v17) --[[ Line: 84 ]] --[[ Name: format ]]
                    return {
                        fooCounter = v17.foo
                    };
                end
            }, 
            {
                type = "EventIngest", 
                format = function(v18) --[[ Line: 92 ]] --[[ Name: format ]]
                    return {
                        fooEvent = v18.foo
                    };
                end
            }
        }
    });
    local v20 = {
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logRobloxTelemetryStat = l_jest_0.fn(), 
        logRobloxTelemetryCounter = l_jest_0.fn(), 
        TelemetryBackends = {}
    };
    v1.Telemetry.createEmitter({
        telemetryImpl = v20, 
        defaultTelemetryConfig = {
            throttlingThousandths = 800, 
            links = ""
        }, 
        sharedInfo = {}
    }).emit(v19, {
        statValue = 999, 
        foo = 100, 
        bar = 200
    });
    l_expect_0(v20.logRobloxTelemetryStat).toHaveBeenCalledWith(v20, l_expect_0.objectContaining({
        eventName = "AppLoaded"
    }), 999, {
        fooStat = 100
    });
    l_expect_0(v20.logRobloxTelemetryCounter).toHaveBeenCalledWith(v20, l_expect_0.objectContaining({
        eventName = "AppLoaded"
    }), 1337, {
        fooCounter = 100
    });
    l_expect_0(v20.logRobloxTelemetryEvent).toHaveBeenCalledWith(v20, l_expect_0.objectContaining({
        eventName = "AppLoaded"
    }), nil, {
        fooEvent = 100
    });
end);
l_it_0("SHOULD work in react component & sharedInfo", function() --[[ Line: 142 ]]
    -- upvalues: v1 (copy), l_jest_0 (copy), v3 (copy), v4 (copy), l_expect_0 (copy)
    local v25 = v1.Telemetry.new({
        name = "Impression", 
        description = "Fires when the user sees the TestComponent", 
        lastUpdated = {
            2021, 
            1, 
            1
        }, 
        backendsList = {
            {
                type = "RobloxTelemetryCounter", 
                incrementValue = 1337, 
                format = function(v21, v22) --[[ Line: 151 ]] --[[ Name: format ]]
                    return {
                        userIdCounter = v22.userId, 
                        foo = v21.foo
                    };
                end
            }, 
            {
                type = "EventIngest", 
                format = function(_, v24) --[[ Line: 160 ]] --[[ Name: format ]]
                    return {
                        userIdEvent = v24.userId
                    };
                end
            }
        }
    });
    local v26 = {
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logRobloxTelemetryStat = l_jest_0.fn(), 
        logRobloxTelemetryCounter = l_jest_0.fn(), 
        TelemetryBackends = {}
    };
    local function v28() --[[ Line: 176 ]] --[[ Name: TestComponent ]]
        -- upvalues: v3 (ref), v1 (ref), v26 (copy), v25 (copy)
        local v27 = v3.useMemo(function() --[[ Line: 177 ]]
            -- upvalues: v1 (ref), v26 (ref)
            return v1.Telemetry.createEmitter({
                telemetryImpl = v26, 
                defaultTelemetryConfig = {
                    throttlingThousandths = 800, 
                    links = ""
                }, 
                sharedInfo = {
                    userId = "12345"
                }
            });
        end, {});
        v3.useEffect(function() --[[ Line: 190 ]]
            -- upvalues: v27 (copy), v25 (ref)
            v27.emit(v25, {
                foo = 1
            });
        end, {
            v27
        });
        return nil;
    end;
    local v29 = v3.createElement(v28);
    local v30 = v4.createRoot(Instance.new("Folder"));
    v4.act(function() --[[ Line: 202 ]]
        -- upvalues: v30 (copy), v29 (copy)
        v30:render(v29);
    end);
    l_expect_0(v26.logRobloxTelemetryCounter).toHaveBeenCalledWith(v26, l_expect_0.objectContaining({
        eventName = v25.name
    }), 1337, {
        userIdCounter = "12345", 
        foo = 1
    });
    l_expect_0(v26.logRobloxTelemetryEvent).toHaveBeenCalledWith(v26, l_expect_0.objectContaining({
        eventName = v25.name
    }), nil, {
        userIdEvent = "12345"
    });
end);
l_it_0("SHOULD update and read info for all", function() --[[ Line: 221 ]]
    -- upvalues: l_jest_0 (copy), v1 (copy), l_expect_0 (copy)
    local v31 = {
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logRobloxTelemetryStat = l_jest_0.fn(), 
        logRobloxTelemetryCounter = l_jest_0.fn(), 
        TelemetryBackends = {}
    };
    local v32 = v1.Telemetry.createEmitter({
        telemetryImpl = v31, 
        defaultTelemetryConfig = {
            throttlingThousandths = 800, 
            links = ""
        }, 
        sharedInfo = {
            foo = "bar"
        }
    });
    l_expect_0(v32.sharedInfo.get()).toHaveProperty("foo", "bar");
    v32.sharedInfo.merge({
        bar = "baz"
    });
    l_expect_0(v32.sharedInfo.get()).toHaveProperty("foo", "bar");
    l_expect_0(v32.sharedInfo.get()).toHaveProperty("bar", "baz");
    v32.sharedInfo.merge({
        foo = "baz"
    });
    l_expect_0(v32.sharedInfo.get()).toHaveProperty("foo", "baz");
    l_expect_0(v32.sharedInfo.get()).toHaveProperty("bar", "baz");
end);
l_it_0("SHOULD override name", function() --[[ Line: 253 ]]
    -- upvalues: l_jest_0 (copy), v1 (copy), l_expect_0 (copy)
    local v33 = {
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logRobloxTelemetryStat = l_jest_0.fn(), 
        logRobloxTelemetryCounter = l_jest_0.fn(), 
        TelemetryBackends = {}
    };
    local v34 = v1.Telemetry.createEmitter({
        telemetryImpl = v33, 
        defaultTelemetryConfig = {
            throttlingThousandths = 800, 
            links = ""
        }, 
        sharedInfo = {}
    });
    local v36 = v1.Telemetry.new({
        name = "Impression", 
        description = "Fires when the user sees the TestComponent", 
        lastUpdated = {
            2021, 
            1, 
            1
        }, 
        backendsList = {
            {
                type = "RobloxTelemetryCounter", 
                incrementValue = 1337, 
                overrideName = function(v35) --[[ Line: 279 ]] --[[ Name: overrideName ]]
                    return "Impression_" .. v35.userId;
                end, 
                format = function() --[[ Line: 282 ]] --[[ Name: format ]]
                    return {};
                end
            }
        }
    });
    v34.emit(v36, {
        userId = "12345"
    });
    l_expect_0(v33.logRobloxTelemetryCounter).toHaveBeenCalledWith(v33, l_expect_0.objectContaining({
        eventName = "Impression_12345"
    }), 1337, {});
end);
l_it_0("backend specific throttling", function() --[[ Line: 299 ]]
    -- upvalues: l_jest_0 (copy), v1 (copy), l_expect_0 (copy)
    local v37 = {
        logRobloxTelemetryEvent = l_jest_0.fn(), 
        logRobloxTelemetryStat = l_jest_0.fn(), 
        logRobloxTelemetryCounter = l_jest_0.fn(), 
        TelemetryBackends = {}
    };
    local v38 = v1.Telemetry.createEmitter({
        telemetryImpl = v37, 
        defaultTelemetryConfig = {
            throttlingThousandths = 800, 
            links = ""
        }, 
        sharedInfo = {}
    });
    local v39 = v1.Telemetry.new({
        name = "Impression", 
        description = "Fires when the user sees the TestComponent", 
        lastUpdated = {
            2021, 
            1, 
            1
        }, 
        backendsList = {
            {
                type = "RobloxTelemetryCounter", 
                throttlingThousandths = 1, 
                incrementValue = 1337, 
                format = function() --[[ Line: 326 ]] --[[ Name: format ]]
                    return {};
                end
            }, 
            {
                type = "RobloxTelemetryStat", 
                throttlingThousandths = 10001, 
                format = function() --[[ Line: 333 ]] --[[ Name: format ]]
                    return {};
                end
            }
        }
    });
    v38.emit(v39, {
        statValue = 1
    });
    l_expect_0(v37.logRobloxTelemetryCounter).toHaveBeenCalledWith(v37, l_expect_0.objectContaining({
        throttlingPercentage = 1
    }), 1337, {});
    l_expect_0(v37.logRobloxTelemetryStat).toHaveBeenCalledWith(v37, l_expect_0.objectContaining({
        throttlingPercentage = 10000
    }), 1, {});
end);