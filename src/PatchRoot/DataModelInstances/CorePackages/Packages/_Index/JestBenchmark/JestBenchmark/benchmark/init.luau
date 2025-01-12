local l_Parent_0 = script:FindFirstAncestor("JestBenchmark").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.Parent.testModule);
local l_initializeProfiler_0 = require(script.Parent.Profiler).initializeProfiler;
local _ = require(script.Parent.reporters.Reporter);
local l_initializeSectionTimeReporter_0 = require(script.Parent.reporters.SectionTimeReporter).initializeSectionTimeReporter;
local l_initializeFpsReporter_0 = require(script.Parent.reporters.FpsReporter).initializeFpsReporter;
local v7 = require(script.Parent.MetricLogger);
local v8 = require(script.Parent.CustomReporters);
local v9 = {};
local _ = require(l_Parent_0.JestTypes);
local _ = function(v11, v12) --[[ Line: 50 ]] --[[ Name: wrapBenchFnInProfiler ]]
    -- upvalues: l_initializeSectionTimeReporter_0 (copy), l_initializeFpsReporter_0 (copy), l_Object_0 (copy), v8 (copy), l_initializeProfiler_0 (copy), v7 (copy)
    local v13 = l_initializeSectionTimeReporter_0();
    local v14 = l_initializeFpsReporter_0();
    return function() --[[ Line: 54 ]]
        -- upvalues: l_Object_0 (ref), v13 (copy), v14 (copy), v8 (ref), l_initializeProfiler_0 (ref), v7 (ref), v11 (copy), v12 (copy)
        local v15 = l_Object_0.assign({
            SectionTime = v13, 
            FPS = v14
        }, v8.customReporters);
        local v16 = {};
        for _, v18 in v15 do
            table.insert(v16, v18);
        end;
        local v19 = l_initializeProfiler_0(v16, v7.log, v11);
        v19.start("total");
        v12(v19, v15);
        v19.stop();
        v19.finish();
    end;
end;
local v32 = setmetatable({}, {
    __call = function(_, v22, v23, v24) --[[ Line: 76 ]] --[[ Name: __call ]]
        -- upvalues: l_initializeSectionTimeReporter_0 (copy), l_initializeFpsReporter_0 (copy), l_Object_0 (copy), v8 (copy), l_initializeProfiler_0 (copy), v7 (copy), v2 (copy)
        local v25 = l_initializeSectionTimeReporter_0();
        local v26 = l_initializeFpsReporter_0();
        return v2(v22, function() --[[ Line: 54 ]]
            -- upvalues: l_Object_0 (ref), v25 (copy), v26 (copy), v8 (ref), l_initializeProfiler_0 (ref), v7 (ref), v22 (copy), v23 (copy)
            local v27 = l_Object_0.assign({
                SectionTime = v25, 
                FPS = v26
            }, v8.customReporters);
            local v28 = {};
            for _, v30 in v27 do
                table.insert(v28, v30);
            end;
            local v31 = l_initializeProfiler_0(v28, v7.log, v22);
            v31.start("total");
            v23(v31, v27);
            v31.stop();
            v31.finish();
        end, v24);
    end
});
v32.only = function(v33, v34, v35) --[[ Line: 82 ]]
    -- upvalues: l_initializeSectionTimeReporter_0 (copy), l_initializeFpsReporter_0 (copy), l_Object_0 (copy), v8 (copy), l_initializeProfiler_0 (copy), v7 (copy), v2 (copy)
    local v36 = l_initializeSectionTimeReporter_0();
    local v37 = l_initializeFpsReporter_0();
    local function v43() --[[ Line: 54 ]]
        -- upvalues: l_Object_0 (ref), v36 (copy), v37 (copy), v8 (ref), l_initializeProfiler_0 (ref), v7 (ref), v33 (copy), v34 (copy)
        local v38 = l_Object_0.assign({
            SectionTime = v36, 
            FPS = v37
        }, v8.customReporters);
        local v39 = {};
        for _, v41 in v38 do
            table.insert(v39, v41);
        end;
        local v42 = l_initializeProfiler_0(v39, v7.log, v33);
        v42.start("total");
        v34(v42, v38);
        v42.stop();
        v42.finish();
    end;
    return v2.only(v33, v43, v35);
end;
v32.skip = function(v44, v45, v46) --[[ Line: 87 ]]
    -- upvalues: l_initializeSectionTimeReporter_0 (copy), l_initializeFpsReporter_0 (copy), l_Object_0 (copy), v8 (copy), l_initializeProfiler_0 (copy), v7 (copy), v2 (copy)
    local v47 = l_initializeSectionTimeReporter_0();
    local v48 = l_initializeFpsReporter_0();
    local function v54() --[[ Line: 54 ]]
        -- upvalues: l_Object_0 (ref), v47 (copy), v48 (copy), v8 (ref), l_initializeProfiler_0 (ref), v7 (ref), v44 (copy), v45 (copy)
        local v49 = l_Object_0.assign({
            SectionTime = v47, 
            FPS = v48
        }, v8.customReporters);
        local v50 = {};
        for _, v52 in v49 do
            table.insert(v50, v52);
        end;
        local v53 = l_initializeProfiler_0(v50, v7.log, v44);
        v53.start("total");
        v45(v53, v49);
        v53.stop();
        v53.finish();
    end;
    return v2.skip(v44, v54, v46);
end;
v9.benchmark = v32;
return v9;