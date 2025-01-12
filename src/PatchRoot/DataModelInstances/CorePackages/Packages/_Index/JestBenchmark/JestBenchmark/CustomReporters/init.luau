local l_Parent_0 = script:FindFirstAncestor("JestBenchmark").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local _ = require(script.Parent.reporters.Reporter);
local v3 = {
    customReporters = {}
};
v3.useCustomReporters = function(v4) --[[ Line: 30 ]] --[[ Name: useCustomReporters ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    l_Object_0.assign(v3.customReporters, v4);
end;
v3.useDefaultReporters = function() --[[ Line: 35 ]] --[[ Name: useDefaultReporters ]]
    -- upvalues: v3 (copy)
    table.clear(v3.customReporters);
end;
return v3;