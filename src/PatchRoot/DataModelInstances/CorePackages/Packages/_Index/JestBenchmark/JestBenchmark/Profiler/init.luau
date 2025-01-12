local v0 = {};
local _ = require(script.Parent.reporters.Reporter);
local _ = require(script.Parent.MetricLogger);
v0.initializeProfiler = function(v3, v4, v5) --[[ Line: 32 ]] --[[ Name: initializeProfiler ]]
    if #v3 == 0 then
        error("Profiler must be initialized with at least one Reporter");
    end;
    local v6 = 0;
    local function v10(v7) --[[ Line: 39 ]] --[[ Name: start ]]
        -- upvalues: v3 (copy), v6 (ref)
        for _, v9 in v3 do
            v9.start(v7);
        end;
        v6 = v6 + 1;
    end;
    local function v13() --[[ Line: 47 ]] --[[ Name: stop ]]
        -- upvalues: v6 (ref), v3 (copy)
        if v6 == 0 then
            error("Profiler.stop() called without a corresponding Profiler.start()");
        end;
        for _, v12 in v3 do
            v12.stop();
        end;
        v6 = v6 - 1;
    end;
    local function v21() --[[ Line: 59 ]] --[[ Name: finish ]]
        -- upvalues: v6 (ref), v3 (copy), v5 (copy), v4 (copy)
        if v6 > 0 then
            error("Profiling finished without closing all Profiler.start() sections with a Profiler.stop() call");
        end;
        for _, v15 in v3 do
            local v16, v17 = v15.finish();
            for v18, v19 in v17 do
                local v20 = if v5 then ("%*_%*"):format(v5, v16[v18]) else v16[v18];
                v4(v20, v19);
            end;
        end;
    end;
    return {
        start = v10, 
        stop = v13, 
        finish = v21
    };
end;
return v0;